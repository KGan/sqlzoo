# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT DISTINCT
      n1.yr
    FROM
      nobels n1
    LEFT OUTER JOIN (
      SELECT
        yr
      FROM
        nobels
      WHERE
        subject = 'Chemistry'
    ) AS chem ON chem.yr = n1.yr
    WHERE
      n1.subject = 'Physics' AND chem.yr IS NULL
  SQL
end

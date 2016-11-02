# frozen_string_literal: true
json.revisions do
  json.array! @revisions do |revision|
    article = revision.article
    json.call(revision, :api_url, :mw_rev_id, :mw_page_id)
    json.key revision.id
    json.title full_title(article)
    json.article_url article_url(article)
    json.report_url revision.plagiarism_report_link
    json.diff_url revision.url
    json.username revision.user.username
    json.datetime revision.date
    json.courses revision.infer_courses_from_user.each do |course|
      json.title course.title
      json.slug course.slug
    end
  end
end

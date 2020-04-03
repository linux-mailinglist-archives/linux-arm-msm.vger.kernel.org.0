Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E05D19DD1C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 19:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404148AbgDCRuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 13:50:16 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46507 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404230AbgDCRuQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 13:50:16 -0400
Received: by mail-qk1-f196.google.com with SMTP id u4so8857640qkj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 10:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9cI4scVoKJKw1b/HO6QaDyp3LKbjdrfchQuuiHLWjWc=;
        b=rLMMh5/uZTRR5enw62HL/VSaxyamFjN4+UGzBnS8klJ3U4s3RFmAAyCL4wGrLkwMpq
         52GPlvDoYnNkCsbId8slVjxMWH/y2XSa5iO/SWWdtbE1VTehRN2UhVzyxcHcweV6tfe7
         2trbZ0MYKH6SqYhemT4a9SRZPY9m9xaWs9UVfR90W/8FxBdn/kwXkx4vcMf+OVFV+R+Y
         MIWBr6DA7YvHjhy/GpAYvvRn0uvyleJk10fTq1YLU2+g57CrXsT8C8V7KL4NSMr6eVf0
         KAsUBdiCPDu823eqBD98pLdlOHOXeUqHH9DDsP3fbQrEz/lZdyEyaP9WOpvKfIHaww3B
         Yfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9cI4scVoKJKw1b/HO6QaDyp3LKbjdrfchQuuiHLWjWc=;
        b=sDeuRTfjGRU84XRVTieCE314mFq3fuMYHOliw0+XMRaFdx3xpdjhypRDw/gRSy3l77
         7tOWKJWA9D9Jr9jxGbF9afsjABxsctUoMVKpTE4vjKcD++0+puy6D/1AeSqWyeEVFHU8
         jyVJmaazguaTdmUzzzffIvpiTANAK7bJmr14Ed+yD077sBAF0dlPXdbZAWn6Bw01yyYG
         Qh4iAlgVECTcZT0SXLreLq12fKUk4MiDQvZ+ZKY89amLBliPKs4aRXyyHNhZrew6q8Wj
         cy+hvC2VsMqbuV5+DRjoikk61yDIx7umJhsmgkeJvIsMEBzYQNTE/yFjdPzpb6mPztwV
         kEdQ==
X-Gm-Message-State: AGi0PubhH66O53WnmIZeAdKl5DZ9YjbCaWvhki4rn8o6COOPQbkyQbZJ
        hgU0GDChlU7nzCCemkERcVCWeA==
X-Google-Smtp-Source: APiQypLbHKb7rWYJp6CQb5HJWjxuJFaOwE+O1MVmtbr6e7yua8Mc9Jgufd4yiFLoFk5gnocLafzasQ==
X-Received: by 2002:ae9:ee01:: with SMTP id i1mr10181110qkg.498.1585936215146;
        Fri, 03 Apr 2020 10:50:15 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 77sm6821225qkh.26.2020.04.03.10.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 10:50:14 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] remoteproc: qcom_q6v5_mss: fix q6v5_probe() error paths
Date:   Fri,  3 Apr 2020 12:50:05 -0500
Message-Id: <20200403175005.17130-4-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403175005.17130-1-elder@linaro.org>
References: <20200403175005.17130-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If an error occurs in q6v5_probe() after the proxy power domains
are attached, but before qcom_add_ipa_notify_subdev() is called,
qcom_remove_ipa_notify_subdev() is called in the error path, which
is a bug.  Fix this by having that call be reached through a
different label.

Additionally, if qcom_add_sysmon_subdev() returns an error, the
subdevs that had already been added will not be properly removed.
Fix this by having the added subdevs (including the IPA notify one)
be removed in this case.

Finally, arrange for the sysmon subdev to be removed before the rest
in the event rproc_add() returns an error.

Have cleanup activity done in q6v5_remove() be done in the reverse
order they are set up in q6v5_probe() (the same order they're done
in the q6v5_probe() error path).  Use a local variable for the
remoteproc pointer, which is used repeatedly.

Remove errant semicolons at the end of two function blocks.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 31 ++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 60cdf699ea80..5475d4f808a8 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -367,7 +367,7 @@ static int q6v5_pds_enable(struct q6v5 *qproc, struct device **pds,
 	}
 
 	return ret;
-};
+}
 
 static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
 			     size_t pd_count)
@@ -1527,7 +1527,7 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
 		dev_pm_domain_detach(devs[i], false);
 
 	return ret;
-};
+}
 
 static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
 			    size_t pd_count)
@@ -1766,17 +1766,23 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
 	if (IS_ERR(qproc->sysmon)) {
 		ret = PTR_ERR(qproc->sysmon);
-		goto detach_proxy_pds;
+		goto remove_subdevs;
 	}
 
 	ret = rproc_add(rproc);
 	if (ret)
-		goto detach_proxy_pds;
+		goto remove_sysmon_subdev;
 
 	return 0;
 
+remove_sysmon_subdev:
+	qcom_remove_sysmon_subdev(qproc->sysmon);
+remove_subdevs:
+	qcom_remove_ipa_notify_subdev(qproc->rproc, &qproc->ipa_notify_subdev);
+	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
+	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
+	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 detach_proxy_pds:
-	qcom_remove_ipa_notify_subdev(qproc->rproc, &qproc->ipa_notify_subdev);
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 detach_active_pds:
 	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
@@ -1789,19 +1795,20 @@ static int q6v5_probe(struct platform_device *pdev)
 static int q6v5_remove(struct platform_device *pdev)
 {
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
+	struct rproc *rproc = qproc->rproc;
 
-	rproc_del(qproc->rproc);
+	rproc_del(rproc);
 
 	qcom_remove_sysmon_subdev(qproc->sysmon);
-	qcom_remove_ipa_notify_subdev(qproc->rproc, &qproc->ipa_notify_subdev);
-	qcom_remove_glink_subdev(qproc->rproc, &qproc->glink_subdev);
-	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
-	qcom_remove_ssr_subdev(qproc->rproc, &qproc->ssr_subdev);
+	qcom_remove_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
+	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
+	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
+	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
 
-	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
+	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 
-	rproc_free(qproc->rproc);
+	rproc_free(rproc);
 
 	return 0;
 }
-- 
2.20.1


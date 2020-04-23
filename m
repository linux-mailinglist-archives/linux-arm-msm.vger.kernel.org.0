Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47E81B5160
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 02:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgDWAiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 20:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726201AbgDWAiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 20:38:10 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95F8C03C1AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:38:08 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id ay1so1649613plb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 17:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=egVlnrSaeGzdaljO8+QAkFyvPEniAn+tBLdvo8OBR/w=;
        b=eCqCxZcuH1wR3wM+ON28Hd3lhNgytE3bh8oSzxVC5K2BFJGpjYBB1mpHrG5g5Zjf/s
         IiFDTHEoZVfMV57cWYGZUw5HF98Plrii6p6O2bUW9SNxQeBhCDhZ59eyDK9cHUhri9yu
         MiEBM9PLM3/vQymu4bxNMKT32NJu3Z4h+d/df9PJNQQpU7cH6pFFPVDEHhB6H76HcjKl
         /MQubUB1edgyQ5lPBYh2H+PSI+H4rF/JlSxaZosk9GS3qT5hKCayNE2vdzbclZEy3cGM
         deg71w0BKEjtmsOUDSOtHYGQAe/VNHhpYX+jqyGLQJOkJD/5/3gCl5Gtb/ojqeIjA+24
         oJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=egVlnrSaeGzdaljO8+QAkFyvPEniAn+tBLdvo8OBR/w=;
        b=NwwG+eJeWDVl1bttYfdJB2z9lBY0KKb+cMVj7ahLY7iLH3OHQq9vZ29bGF0rZ9eU9l
         Pb6BoWVQc/ayTOWWbvs9OfjmiwG9qqAjcQBlRtiGLyI18X6pKgszjZr+o6stZd6qOm6a
         3OMdCX0SCRq7+cUbhJ2Ehv90x2Jx0zxgi8H3Gg4ayE+SiVYOwRhxQ7Ca/nJMqrAyco4d
         WzfHa3eNqn+TtgUklfX2c7Z3NSPGGoiB/uOYAGi1WJvz+Ujp3vxWpo7r9s2+ex1OiDz5
         bcLlXz5PAgBLF+Dc7cDm+5w3sfx1nxncsShC3LexKH9ySIafkqhb46X2jyxEq3JYnrRC
         Pnug==
X-Gm-Message-State: AGi0PuZ3bnir/83Tfd8cV8e7kiK+Io4gPj7icjr5H+8jn0Ja5qBDqWhC
        UxCGZG/mU3DYuSkoeIXSgDgtAw==
X-Google-Smtp-Source: APiQypKl5pJAjAOlJdgnCJv9cqj48tuVFgdA04bOanQpLuAbkxnIrtNOouv/tW38KKNBQfQRdeF3kg==
X-Received: by 2002:a17:90a:cc9:: with SMTP id 9mr1503391pjt.16.1587602288258;
        Wed, 22 Apr 2020 17:38:08 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 6sm432225pgz.0.2020.04.22.17.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 17:38:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 1/4] remoteproc: qcom: Pass ssr_name to glink subdevice
Date:   Wed, 22 Apr 2020 17:37:33 -0700
Message-Id: <20200423003736.2027371-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pass ssr_name to glink subdevice in preparation for tying glink_ssr to
the glink subdevice, rather than having its own "ssr subdevice".

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_common.c    | 9 ++++++++-
 drivers/remoteproc/qcom_common.h    | 5 ++++-
 drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
 drivers/remoteproc/qcom_q6v5_mss.c  | 2 +-
 drivers/remoteproc/qcom_q6v5_pas.c  | 2 +-
 5 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 60650bcc8c67..ff26f2b68752 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -46,8 +46,10 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
  * qcom_add_glink_subdev() - try to add a GLINK subdevice to rproc
  * @rproc:	rproc handle to parent the subdevice
  * @glink:	reference to a GLINK subdev context
+ * @ssr_name:	identifier of the associated remoteproc for ssr notifications
  */
-void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
+void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
+			   const char *ssr_name)
 {
 	struct device *dev = &rproc->dev;
 
@@ -55,6 +57,10 @@ void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink)
 	if (!glink->node)
 		return;
 
+	glink->ssr_name = kstrdup_const(ssr_name, GFP_KERNEL);
+	if (!glink->ssr_name)
+		return;
+
 	glink->dev = dev;
 	glink->subdev.start = glink_subdev_start;
 	glink->subdev.stop = glink_subdev_stop;
@@ -74,6 +80,7 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
 		return;
 
 	rproc_remove_subdev(rproc, &glink->subdev);
+	kfree_const(glink->ssr_name);
 	of_node_put(glink->node);
 }
 EXPORT_SYMBOL_GPL(qcom_remove_glink_subdev);
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index 58de71e4781c..34e5188187dc 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -11,6 +11,8 @@ struct qcom_sysmon;
 struct qcom_rproc_glink {
 	struct rproc_subdev subdev;
 
+	const char *ssr_name;
+
 	struct device *dev;
 	struct device_node *node;
 	struct qcom_glink *edge;
@@ -30,7 +32,8 @@ struct qcom_rproc_ssr {
 	const char *name;
 };
 
-void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
+void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
+			   const char *ssr_name);
 void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
 
 int qcom_register_dump_segments(struct rproc *rproc, const struct firmware *fw);
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index c60dabc6939e..d2a2574dcf35 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -461,7 +461,7 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_pm;
 
-	qcom_add_glink_subdev(rproc, &adsp->glink_subdev);
+	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
 	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
 	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
 					      desc->sysmon_name,
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 7af1d0c987e0..b5dd36775b77 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1762,7 +1762,7 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);
 	qproc->mba_perm = BIT(QCOM_SCM_VMID_HLOS);
-	qcom_add_glink_subdev(rproc, &qproc->glink_subdev);
+	qcom_add_glink_subdev(rproc, &qproc->glink_subdev, "mpss");
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
 	qcom_add_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8ecc157f1ed1..fc6658b523b6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -436,7 +436,7 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto detach_proxy_pds;
 
-	qcom_add_glink_subdev(rproc, &adsp->glink_subdev);
+	qcom_add_glink_subdev(rproc, &adsp->glink_subdev, desc->ssr_name);
 	qcom_add_smd_subdev(rproc, &adsp->smd_subdev);
 	qcom_add_ssr_subdev(rproc, &adsp->ssr_subdev, desc->ssr_name);
 	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
-- 
2.24.0


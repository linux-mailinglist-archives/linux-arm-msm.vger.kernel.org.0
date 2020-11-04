Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C79E2A5E84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 08:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgKDHEO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 02:04:14 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:26893 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727098AbgKDHEO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 02:04:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604473452; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FBG4FjjRRBcKTtOAJC7lN4saKQswEbaWiO8CLix7/8A=; b=etCM6m0ygFnTdG0Ww/Z9XRkqi1VoZwpGrljMtROGUO37whUDcYuOSfz46WQWWmi4RAdhEsO8
 fPgK86nIyKPmaEAUfr/bjPdtKFdgT9YXcnwf6Lo9b3jeKLfsD9bI/DU3rfFBkTw5m0lRFoaZ
 5b/+vefOU+JsiUGZMA5NzgwAQl8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fa252601037425ce1292caf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Nov 2020 07:04:00
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06BC2C433C9; Wed,  4 Nov 2020 07:04:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE10BC433CB;
        Wed,  4 Nov 2020 07:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BE10BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_mss: map/unmap MBA region before/after use
Date:   Wed,  4 Nov 2020 12:33:42 +0530
Message-Id: <1604473422-29639-2-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604473422-29639-1-git-send-email-sibis@codeaurora.org>
References: <1604473422-29639-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The application processor accessing the MBA region after assigning it to
the remote Q6 would lead to an XPU violation. Fix this by un-mapping the
MBA region post firmware copy and MBA text log dumps.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2c866b6da23c..1b4a34325788 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -189,7 +189,6 @@ struct q6v5 {
 	size_t total_dump_size;
 
 	phys_addr_t mba_phys;
-	void *mba_region;
 	size_t mba_size;
 	size_t dp_size;
 
@@ -408,7 +407,7 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
 				   current_perm, next, perms);
 }
 
-static void q6v5_debug_policy_load(struct q6v5 *qproc)
+static void q6v5_debug_policy_load(struct q6v5 *qproc, void *ptr)
 {
 	const struct firmware *dp_fw;
 
@@ -416,7 +415,7 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc)
 		return;
 
 	if (SZ_1M + dp_fw->size <= qproc->mba_size) {
-		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
+		memcpy(ptr + SZ_1M, dp_fw->data, dp_fw->size);
 		qproc->dp_size = dp_fw->size;
 	}
 
@@ -426,6 +425,7 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc)
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
+	void *ptr;
 
 	/* MBA is restricted to a maximum size of 1M */
 	if (fw->size > qproc->mba_size || fw->size > SZ_1M) {
@@ -433,8 +433,16 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 		return -EINVAL;
 	}
 
-	memcpy(qproc->mba_region, fw->data, fw->size);
-	q6v5_debug_policy_load(qproc);
+	ptr = memremap(qproc->mba_phys, qproc->mba_size, MEMREMAP_WC);
+	if (!ptr) {
+		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
+			&qproc->mba_phys, qproc->mba_size);
+		return -EBUSY;
+	}
+
+	memcpy(ptr, fw->data, fw->size);
+	q6v5_debug_policy_load(qproc, ptr);
+	memunmap(ptr);
 
 	return 0;
 }
@@ -541,6 +549,7 @@ static void q6v5_dump_mba_logs(struct q6v5 *qproc)
 {
 	struct rproc *rproc = qproc->rproc;
 	void *data;
+	void *ptr;
 
 	if (!qproc->has_mba_logs)
 		return;
@@ -549,12 +558,16 @@ static void q6v5_dump_mba_logs(struct q6v5 *qproc)
 				    qproc->mba_size))
 		return;
 
-	data = vmalloc(MBA_LOG_SIZE);
-	if (!data)
+	ptr = memremap(qproc->mba_phys, qproc->mba_size, MEMREMAP_WC);
+	if (!ptr)
 		return;
 
-	memcpy(data, qproc->mba_region, MBA_LOG_SIZE);
-	dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
+	data = vmalloc(MBA_LOG_SIZE);
+	if (data) {
+		memcpy(data, ptr, MBA_LOG_SIZE);
+		dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
+	}
+	memunmap(ptr);
 }
 
 static int q6v5proc_reset(struct q6v5 *qproc)
@@ -1605,12 +1618,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 
 	qproc->mba_phys = r.start;
 	qproc->mba_size = resource_size(&r);
-	qproc->mba_region = devm_ioremap_wc(qproc->dev, qproc->mba_phys, qproc->mba_size);
-	if (!qproc->mba_region) {
-		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
-			&r.start, qproc->mba_size);
-		return -EBUSY;
-	}
 
 	if (!child) {
 		node = of_parse_phandle(qproc->dev->of_node,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


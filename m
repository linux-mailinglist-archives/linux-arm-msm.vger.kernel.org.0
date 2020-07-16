Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EF9222272
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 14:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbgGPMgs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 08:36:48 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:34336 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728126AbgGPMgr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 08:36:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594903006; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=O264Dz0AaANcmdQ6ikThBaZdAjsQtDq+N6Xcl0cGgP0=; b=SSZM8LIiB6+MugS8i74b62CFthEF7cqe6ydsrAdblrh4mXittj5xGIL5PgiZyRwcoPmVgYpz
 soaQoXDNKGdy4XRUpy020YRyDNtcigcS2W1ldN0+pja3+xiUqnJjTNhH2FMtInBf6M9RGsxD
 9Ngo9MeZ/92molSY2FrsVDUngRk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f1049def9ca681bd0df30ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 12:36:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9DC91C433CA; Thu, 16 Jul 2020 12:36:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E8BFC43391;
        Thu, 16 Jul 2020 12:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E8BFC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/3] remoteproc: qcom_q6v5_mss: Add modem debug policy support
Date:   Thu, 16 Jul 2020 18:06:28 +0530
Message-Id: <20200716123630.21892-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716123630.21892-1-sibis@codeaurora.org>
References: <20200716123630.21892-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add modem debug policy support which will enable coredumps and live
debug support when the msadp firmware is present on secure devices.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 13c6d5a72a831..95e21ed607cb9 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -187,6 +187,7 @@ struct q6v5 {
 	phys_addr_t mba_phys;
 	void *mba_region;
 	size_t mba_size;
+	size_t dp_size;
 
 	phys_addr_t mpss_phys;
 	phys_addr_t mpss_reloc;
@@ -406,6 +407,13 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
+	const struct firmware *dp_fw;
+
+	if (!request_firmware(&dp_fw, "msadp", qproc->dev) && fw->size <= SZ_1M) {
+		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
+		qproc->dp_size = dp_fw->size;
+		release_firmware(dp_fw);
+	}
 
 	memcpy(qproc->mba_region, fw->data, fw->size);
 
@@ -896,6 +904,10 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	}
 
 	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
+	if (qproc->dp_size) {
+		writel(qproc->mba_phys + SZ_1M, qproc->rmb_base + RMB_PMI_CODE_START_REG);
+		writel(qproc->dp_size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+	}
 
 	ret = q6v5proc_reset(qproc);
 	if (ret)
@@ -1258,7 +1270,8 @@ static int q6v5_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	dev_info(qproc->dev, "MBA booted, loading mpss\n");
+	dev_info(qproc->dev, "MBA booted, debug policy %s, loading mpss\n",
+		 qproc->dp_size ? "enabled" : "disabled");
 
 	ret = q6v5_mpss_load(qproc);
 	if (ret)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


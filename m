Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718AD26E314
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 20:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgIQSAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 14:00:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35668 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbgIQR7P (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 13:59:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600365554; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=MHJ08k8F25u/dke1/sNKpfE9guwu2CMycQbHzCSGJEE=; b=b8LSpatO1WO5K9eby4gwa+vgXzchhX7f2YAbScuVgp7yiqTOpxIfqLhi1MYABv+B9+NLnSwB
 QCTrDK15eoQDDVFnVv/Rgv8+dFRzik6fS9knjMil5vOBLBwYj4/5PftbZIRNjVBtoHFwGYvc
 jWj3cx/viP1/6pDdSzfe6FA2a58=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f63a3df6ace44cacc7ffe14 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 17:58:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8C5E4C433F1; Thu, 17 Sep 2020 17:58:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AFE6C433C8;
        Thu, 17 Sep 2020 17:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5AFE6C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3] remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA boot
Date:   Thu, 17 Sep 2020 23:28:40 +0530
Message-Id: <20200917175840.18708-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On secure devices which support warm reset, the MBA firmware requires
access to the modem region to clear them out. Hence provide Q6 access
to this region before MBA boot. This will be a nop during a modem SSR.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V3:
 * Fixup comment style [Stephen] 

V2:
 * Fixup comments [Bjorn] 

 drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index c401bcc263fa..eb3457a6c3b7 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -931,6 +931,17 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 		goto assert_reset;
 	}
 
+	/*
+	 * Some versions of the MBA firmware will upon boot wipe the MPSS region as well, so provide
+	 * the Q6 access to this region.
+	 */
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, true,
+				      qproc->mpss_phys, qproc->mpss_size);
+	if (ret) {
+		dev_err(qproc->dev, "assigning Q6 access to mpss memory failed: %d\n", ret);
+		goto disable_active_clks;
+	}
+
 	/* Assign MBA image access in DDR to q6 */
 	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
 				      qproc->mba_phys, qproc->mba_size);
@@ -1135,10 +1146,9 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
 	}
 
-	/**
+	/*
 	 * In case of a modem subsystem restart on secure devices, the modem
-	 * memory can be reclaimed only after MBA is loaded. For modem cold
-	 * boot this will be a nop
+	 * memory can be reclaimed only after MBA is loaded.
 	 */
 	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
 				qproc->mpss_phys, qproc->mpss_size);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


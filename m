Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35137E9043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 20:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731976AbfJ2TmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 15:42:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58654 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732597AbfJ2TlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 15:41:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E03BC60FB4; Tue, 29 Oct 2019 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378075;
        bh=cLTTSZkKBie5f/YXYt3hhrbvgdG2klqOpAdCVB1WzPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TUkMbbyaVOliAENbFOcbI+CSd9C4j5L0FFGLQ8hkCypDTZOGuoNOFUHFll9WAyvLF
         kOe24UTQqafXhP11DrlwgwJAB5K4EBw3QTq3udp7qhfGh065c0yf8r8z6GKWZOO+qG
         VUUm+VeZSLpZlEmqZ9Wu5bKCh54C/XO2xAtj6eRs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D131960FB4;
        Tue, 29 Oct 2019 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378075;
        bh=cLTTSZkKBie5f/YXYt3hhrbvgdG2klqOpAdCVB1WzPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TUkMbbyaVOliAENbFOcbI+CSd9C4j5L0FFGLQ8hkCypDTZOGuoNOFUHFll9WAyvLF
         kOe24UTQqafXhP11DrlwgwJAB5K4EBw3QTq3udp7qhfGh065c0yf8r8z6GKWZOO+qG
         VUUm+VeZSLpZlEmqZ9Wu5bKCh54C/XO2xAtj6eRs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D131960FB4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saipraka@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [RFC 07/17] firmware: qcom_scm-64: Remove qcom_scm_call_do_smccc
Date:   Tue, 29 Oct 2019 12:40:55 -0700
Message-Id: <1572378065-4490-8-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
References: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove thin wrapper to qcom_scm_call_do_smccc because it doesn't do
enough of anything interesting to dedicate its own function.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 46 ++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index cd694a2..6660539 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -90,31 +90,6 @@ static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
 	} while (res->a0 == QCOM_SCM_INTERRUPTED);
 }
 
-static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
-			     struct arm_smccc_res *res, u64 x5, bool atomic)
-{
-	int retry_count = 0;
-
-	if (atomic) {
-		__qcom_scm_call_do_quirk(desc, res, x5, ARM_SMCCC_FAST_CALL);
-		return;
-	}
-
-	do {
-		mutex_lock(&qcom_scm_lock);
-
-		__qcom_scm_call_do_quirk(desc, res, x5, ARM_SMCCC_STD_CALL);
-
-		mutex_unlock(&qcom_scm_lock);
-
-		if (res->a0 == QCOM_SCM_V2_EBUSY) {
-			if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
-				break;
-			msleep(QCOM_SCM_EBUSY_WAIT_MS);
-		}
-	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
-}
-
 static int ___qcom_scm_call_smccc(struct device *dev,
 				  struct qcom_scm_desc *desc, bool atomic)
 {
@@ -160,7 +135,26 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 		x5 = args_phys;
 	}
 
-	qcom_scm_call_do_smccc(desc, &res, x5, atomic);
+	if (atomic) {
+		__qcom_scm_call_do_quirk(desc, &res, x5, ARM_SMCCC_FAST_CALL);
+	} else {
+		int retry_count = 0;
+
+		do {
+			mutex_lock(&qcom_scm_lock);
+
+			__qcom_scm_call_do_quirk(desc, &res, x5,
+						 ARM_SMCCC_STD_CALL);
+
+			mutex_unlock(&qcom_scm_lock);
+
+			if (res.a0 == QCOM_SCM_V2_EBUSY) {
+				if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
+					break;
+				msleep(QCOM_SCM_EBUSY_WAIT_MS);
+			}
+		} while (res.a0 == QCOM_SCM_V2_EBUSY);
+	}
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


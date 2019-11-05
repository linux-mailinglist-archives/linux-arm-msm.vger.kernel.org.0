Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F2EEF2BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfKEB2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:34 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37730 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730369AbfKEB16 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:27:58 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B768960A4E; Tue,  5 Nov 2019 01:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917276;
        bh=WabCYLvF3H8SdMvEOdXVi/iCyqQT/euw4aMKSuJO5/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LtjMOeZIolTgHHdW40NXrnobgp3dxduiFIjGA/1A9PhEeV707+RF1PM/fR36oaJn6
         6x6kP1jgeTUJmZZej5Hxk1hac27k9jD5usfahZ5Mwy9gsK7Qp9NCaaTsLP5nDARqT0
         CYpwarG6zCEXR8xV3f6yOmNIdIDhQR7npwj7mW8Y=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7FDC60F35;
        Tue,  5 Nov 2019 01:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917273;
        bh=WabCYLvF3H8SdMvEOdXVi/iCyqQT/euw4aMKSuJO5/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OhXPyJZC5CHRzvJjqLU7aZzg3/5HNaFVhuLlsBzgJ9T4PVSQyPHw54mqbRXxrpCLW
         2zI1S+osk15nS5aSIWGcutNKDymn6qsIJJrkarCQp2X1/WvcLpNUMhlcdO0dE1EQ3y
         HxSN20M4XCQXFBLEAqTQIfQisUSR019NS3qeC/lU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C7FDC60F35
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 07/17] firmware: qcom_scm-64: Remove qcom_scm_call_do_smccc
Date:   Mon,  4 Nov 2019 17:27:26 -0800
Message-Id: <1572917256-24205-8-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
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
index f6536fa..c013c24 100644
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
@@ -159,7 +134,26 @@ static int ___qcom_scm_call_smccc(struct device *dev,
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


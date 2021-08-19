Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B193A3F1EDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 19:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhHSRSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 13:18:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41308 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhHSRSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 13:18:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629393466; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cP/QyqjO+HMhfWokZ2rF1Oc8y76cUNXkZDCLBHD5790=; b=CFZOUVLxggJaxjeGKRIL4hnCUiLgEYhZEyNVCi/B3kO/K7oLtypeP4cp71yt1VjDV/cmQJPm
 HAJJPw35K4ktl1uQdkUtm/So4cWF/29blfXHxJT3Fsp6rSnpPe/sWcm8Hbf/FSOVBp99G/XX
 GGfDZr0V/gBICuIdsCYhjQe0IQk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 611e91d69507ca1a34ea1bc5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 17:16:06
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5FA9CC43617; Thu, 19 Aug 2021 17:16:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 032FDC43618;
        Thu, 19 Aug 2021 17:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 032FDC43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        quic_jhugo@quicinc.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 2/2] bus: mhi: core: Optimize and update MMIO register write method
Date:   Thu, 19 Aug 2021 10:15:54 -0700
Message-Id: <1629393354-20769-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629393354-20769-1-git-send-email-bbhatt@codeaurora.org>
References: <1629393354-20769-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As of now, MMIO writes done after ready state transition use the
mhi_write_reg_field() API even though the whole register is being
written in most cases. Optimize this process by using mhi_write_reg()
API instead for those writes and use the mhi_write_reg_field()
API for MHI config registers only.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 64 ++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 0917465..e4be171 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -433,75 +433,65 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	struct {
 		u32 offset;
-		u32 mask;
-		u32 shift;
 		u32 val;
 	} reg_info[] = {
 		{
-			CCABAP_HIGHER, U32_MAX, 0,
+			CCABAP_HIGHER,
 			upper_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
 		},
 		{
-			CCABAP_LOWER, U32_MAX, 0,
+			CCABAP_LOWER,
 			lower_32_bits(mhi_cntrl->mhi_ctxt->chan_ctxt_addr),
 		},
 		{
-			ECABAP_HIGHER, U32_MAX, 0,
+			ECABAP_HIGHER,
 			upper_32_bits(mhi_cntrl->mhi_ctxt->er_ctxt_addr),
 		},
 		{
-			ECABAP_LOWER, U32_MAX, 0,
+			ECABAP_LOWER,
 			lower_32_bits(mhi_cntrl->mhi_ctxt->er_ctxt_addr),
 		},
 		{
-			CRCBAP_HIGHER, U32_MAX, 0,
+			CRCBAP_HIGHER,
 			upper_32_bits(mhi_cntrl->mhi_ctxt->cmd_ctxt_addr),
 		},
 		{
-			CRCBAP_LOWER, U32_MAX, 0,
+			CRCBAP_LOWER,
 			lower_32_bits(mhi_cntrl->mhi_ctxt->cmd_ctxt_addr),
 		},
 		{
-			MHICFG, MHICFG_NER_MASK, MHICFG_NER_SHIFT,
-			mhi_cntrl->total_ev_rings,
-		},
-		{
-			MHICFG, MHICFG_NHWER_MASK, MHICFG_NHWER_SHIFT,
-			mhi_cntrl->hw_ev_rings,
-		},
-		{
-			MHICTRLBASE_HIGHER, U32_MAX, 0,
+			MHICTRLBASE_HIGHER,
 			upper_32_bits(mhi_cntrl->iova_start),
 		},
 		{
-			MHICTRLBASE_LOWER, U32_MAX, 0,
+			MHICTRLBASE_LOWER,
 			lower_32_bits(mhi_cntrl->iova_start),
 		},
 		{
-			MHIDATABASE_HIGHER, U32_MAX, 0,
+			MHIDATABASE_HIGHER,
 			upper_32_bits(mhi_cntrl->iova_start),
 		},
 		{
-			MHIDATABASE_LOWER, U32_MAX, 0,
+			MHIDATABASE_LOWER,
 			lower_32_bits(mhi_cntrl->iova_start),
 		},
 		{
-			MHICTRLLIMIT_HIGHER, U32_MAX, 0,
+			MHICTRLLIMIT_HIGHER,
 			upper_32_bits(mhi_cntrl->iova_stop),
 		},
 		{
-			MHICTRLLIMIT_LOWER, U32_MAX, 0,
+			MHICTRLLIMIT_LOWER,
 			lower_32_bits(mhi_cntrl->iova_stop),
 		},
 		{
-			MHIDATALIMIT_HIGHER, U32_MAX, 0,
+			MHIDATALIMIT_HIGHER,
 			upper_32_bits(mhi_cntrl->iova_stop),
 		},
 		{
-			MHIDATALIMIT_LOWER, U32_MAX, 0,
+			MHIDATALIMIT_LOWER,
 			lower_32_bits(mhi_cntrl->iova_stop),
 		},
-		{ 0, 0, 0 }
+		{0, 0}
 	};
 
 	dev_dbg(dev, "Initializing MHI registers\n");
@@ -544,14 +534,22 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING].ring.db_addr = base + CRDB_LOWER;
 
 	/* Write to MMIO registers */
-	for (i = 0; reg_info[i].offset; i++) {
-		ret = mhi_write_reg_field(mhi_cntrl, base, reg_info[i].offset,
-					  reg_info[i].mask, reg_info[i].shift,
-					  reg_info[i].val);
-		if (ret) {
-			dev_err(dev, "Unable to write to MMIO registers");
-			return ret;
-		}
+	for (i = 0; reg_info[i].offset; i++)
+		mhi_write_reg(mhi_cntrl, base, reg_info[i].offset,
+			      reg_info[i].val);
+
+	ret = mhi_write_reg_field(mhi_cntrl, base, MHICFG, MHICFG_NER_MASK,
+				  MHICFG_NER_SHIFT, mhi_cntrl->total_ev_rings);
+	if (ret) {
+		dev_err(dev, "Unable to read MHICFG register\n");
+		return ret;
+	}
+
+	ret = mhi_write_reg_field(mhi_cntrl, base, MHICFG, MHICFG_NHWER_MASK,
+				  MHICFG_NHWER_SHIFT, mhi_cntrl->hw_ev_rings);
+	if (ret) {
+		dev_err(dev, "Unable to read MHICFG register\n");
+		return ret;
 	}
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


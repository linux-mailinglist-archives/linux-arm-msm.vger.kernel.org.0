Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E0E3F904E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 23:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243674AbhHZVtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 17:49:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33325 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243621AbhHZVtU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 17:49:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630014512; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=is6mojHUDMmD4gSjfFyxVscxG1gzHXWu7QH/984DVgI=; b=QP5hFf01yHdaEJF1ysNrIfJ6T7ZPHWBHft24qQpsnLuv7vbPo/+BXYGTRSCm2BdyUZGDUfcE
 cyhomdfwNeXvbkNuzGrPU98hHOSb/hkiFTphgHmh5wgIUkF11v5sekd+/zvV64mKE2/vb+Z9
 BLJI4ZFP4aFHBufOaz5WjCkGFeI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61280c2ffc1f4cb692ca68c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 21:48:31
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 45C68C43616; Thu, 26 Aug 2021 21:48:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21DB3C4338F;
        Thu, 26 Aug 2021 21:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 21DB3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        quic_jhugo@quicinc.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: Update documentation for MHI error callbacks
Date:   Thu, 26 Aug 2021 14:48:24 -0700
Message-Id: <1630014504-32314-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Design changes prompted redefinition of the FATAL and SYSTEM
ERROR callbacks such that FATAL ERROR should be treated as a
callback arriving from an atomic or interrupt context and taken
as an indication that the device has reset to one of the PBL
execution environments. Whereas, a SYSTEM ERROR (SYS_ERROR)
callback is sleep-capable and allowed to block such that the
controller can pursue its clean-up before core driver handles
further processing. Updated documentation for the same.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 include/linux/mhi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b8ca694..a8b2c25 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -31,8 +31,8 @@ struct mhi_buf_info;
  * @MHI_CB_LPM_EXIT: MHI host about to exit low power mode
  * @MHI_CB_EE_RDDM: MHI device entered RDDM exec env
  * @MHI_CB_EE_MISSION_MODE: MHI device entered Mission Mode exec env
- * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
- * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
+ * @MHI_CB_SYS_ERROR: MHI device entered error state (uses non-atomic context)
+ * @MHI_CB_FATAL_ERROR: MHI device reset to a PBL exec env (uses atomic context)
  * @MHI_CB_BW_REQ: Received a bandwidth switch request from device
  */
 enum mhi_callback {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


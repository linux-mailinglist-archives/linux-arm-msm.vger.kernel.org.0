Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A1234DD80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 03:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhC3B24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 21:28:56 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55928 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbhC3B2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 21:28:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617067730; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=omCWUye/+rs9ai9F1A5jcqGVUIxvLNQyUiPqspe2NAI=; b=khD5uwRlqOEIlrZgDhCPRLu+BYHf0EepLTed5ulnR563Pw/4H8DDvmS2UpfDf0cp43Ktur+R
 xVF6ZvyCbPKn19AK3ZMMFO/yfBiTIMDOfLYVl3+3xA4cjYkRIQcD2WuqpRp0P/CAgzG2rsqz
 BZ0RYuNfR8B/V9m7FY0Yf0/Kw6Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60627ec3197975f05e2148f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 01:28:35
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E8A6C43465; Tue, 30 Mar 2021 01:28:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        UPPERCASE_50_75,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38274C433CA;
        Tue, 30 Mar 2021 01:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38274C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, abickett@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 7/7] bus: mhi: core: Improve state strings for debug messages
Date:   Mon, 29 Mar 2021 18:28:24 -0700
Message-Id: <1617067704-28850-8-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As of now abbreviations are being used for many state and
execution environment strings. Improve and expand those such that
debug messages are clear.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index ee67712..d1d9b0d 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -22,13 +22,13 @@
 static DEFINE_IDA(mhi_controller_ida);
 
 const char * const mhi_ee_str[MHI_EE_MAX] = {
-	[MHI_EE_PBL] = "PBL",
-	[MHI_EE_SBL] = "SBL",
-	[MHI_EE_AMSS] = "AMSS",
-	[MHI_EE_RDDM] = "RDDM",
-	[MHI_EE_WFW] = "WFW",
-	[MHI_EE_PTHRU] = "PASS THRU",
-	[MHI_EE_EDL] = "EDL",
+	[MHI_EE_PBL] = "PRIMARY BOOTLOADER",
+	[MHI_EE_SBL] = "SECONDARY BOOTLOADER",
+	[MHI_EE_AMSS] = "MISSION MODE",
+	[MHI_EE_RDDM] = "RAMDUMP DOWNLOAD MODE",
+	[MHI_EE_WFW] = "WLAN FIRMWARE",
+	[MHI_EE_PTHRU] = "PASS THROUGH",
+	[MHI_EE_EDL] = "EMERGENCY DOWNLOAD",
 	[MHI_EE_FP] = "FLASH PROGRAMMER",
 	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
 	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
@@ -38,9 +38,9 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
 	[DEV_ST_TRANSITION_PBL] = "PBL",
 	[DEV_ST_TRANSITION_READY] = "READY",
 	[DEV_ST_TRANSITION_SBL] = "SBL",
-	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
-	[DEV_ST_TRANSITION_FP] = "FLASH_PROGRAMMER",
-	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
+	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION MODE",
+	[DEV_ST_TRANSITION_FP] = "FLASH PROGRAMMER",
+	[DEV_ST_TRANSITION_SYS_ERR] = "SYS ERROR",
 	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
 };
 
@@ -51,24 +51,24 @@ const char * const mhi_state_str[MHI_STATE_MAX] = {
 	[MHI_STATE_M1] = "M1",
 	[MHI_STATE_M2] = "M2",
 	[MHI_STATE_M3] = "M3",
-	[MHI_STATE_M3_FAST] = "M3_FAST",
+	[MHI_STATE_M3_FAST] = "M3 FAST",
 	[MHI_STATE_BHI] = "BHI",
-	[MHI_STATE_SYS_ERR] = "SYS_ERR",
+	[MHI_STATE_SYS_ERR] = "SYS ERROR",
 };
 
 static const char * const mhi_pm_state_str[] = {
 	[MHI_PM_STATE_DISABLE] = "DISABLE",
-	[MHI_PM_STATE_POR] = "POR",
+	[MHI_PM_STATE_POR] = "POWER ON RESET",
 	[MHI_PM_STATE_M0] = "M0",
 	[MHI_PM_STATE_M2] = "M2",
 	[MHI_PM_STATE_M3_ENTER] = "M?->M3",
 	[MHI_PM_STATE_M3] = "M3",
 	[MHI_PM_STATE_M3_EXIT] = "M3->M0",
-	[MHI_PM_STATE_FW_DL_ERR] = "FW DL Error",
-	[MHI_PM_STATE_SYS_ERR_DETECT] = "SYS_ERR Detect",
-	[MHI_PM_STATE_SYS_ERR_PROCESS] = "SYS_ERR Process",
+	[MHI_PM_STATE_FW_DL_ERR] = "Firmware Download Error",
+	[MHI_PM_STATE_SYS_ERR_DETECT] = "SYS ERROR Detect",
+	[MHI_PM_STATE_SYS_ERR_PROCESS] = "SYS ERROR Process",
 	[MHI_PM_STATE_SHUTDOWN_PROCESS] = "SHUTDOWN Process",
-	[MHI_PM_STATE_LD_ERR_FATAL_DETECT] = "LD or Error Fatal Detect",
+	[MHI_PM_STATE_LD_ERR_FATAL_DETECT] = "Linkdown or Error Fatal Detect",
 };
 
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


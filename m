Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59AE62A9B18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 18:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgKFRpB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 12:45:01 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:11065 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727679AbgKFRpA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 12:45:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604684700; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cmdYTrPHVdknh1uYsFnqObWrTOBRzDB0z34Hl+734WQ=; b=ddhYFS3yxf9xa2Ad+4z0NWH5LjzuMeN6e3a+OUuZzDG7iIhEXp7WVgSW/zWGI2Qhh5fO/4ym
 lw2kBYeKDIOSpRtqVLvqSuyyTaBD58Ut8yE4vWVh5OWYgTGr0udPaAiF+bGo5768LbK59HVz
 SRSJTJr2VAsbeXUQwf9/wfvxHIk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fa58b9b7d4f16f92f4b7d8b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 17:44:59
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 896DFC43382; Fri,  6 Nov 2020 17:44:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AAE6FC433C8;
        Fri,  6 Nov 2020 17:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AAE6FC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 3/6] bus: mhi: core: Expose mhi_get_exec_env() API for controllers
Date:   Fri,  6 Nov 2020 09:44:47 -0800
Message-Id: <1604684690-31065-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604684690-31065-1-git-send-email-bbhatt@codeaurora.org>
References: <1604684690-31065-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mhi_get_exec_env() APIs can be used by the controller drivers
to query the execution environment of the MHI device. Expose it
so it can be used in some scenarios to determine behavior of
controllers.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h | 1 -
 drivers/bus/mhi/core/main.c     | 1 +
 include/linux/mhi.h             | 6 ++++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 7989269..124c1b9 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -609,7 +609,6 @@ enum mhi_pm_state __must_check mhi_tryset_pm_state(
 					struct mhi_controller *mhi_cntrl,
 					enum mhi_pm_state state);
 const char *to_mhi_pm_state_str(enum mhi_pm_state state);
-enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
 int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
 			       enum dev_st_transition state);
 void mhi_pm_st_worker(struct work_struct *work);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 778897e..7c45657 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -123,6 +123,7 @@ enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl)
 
 	return (ret) ? MHI_EE_MAX : exec;
 }
+EXPORT_SYMBOL_GPL(mhi_get_exec_env);
 
 enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
 {
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d4841e5..9225d55 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -659,6 +659,12 @@ int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic);
 int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl);
 
 /**
+ * mhi_get_exec_env - Get BHI execution environment of the device
+ * @mhi_cntrl: MHI controller
+ */
+enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_get_mhi_state - Get MHI state of the device
  * @mhi_cntrl: MHI controller
  */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


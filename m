Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBAE8F9C1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfKLVXI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:08 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38632 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfKLVXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:08 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C7B3D607EF; Tue, 12 Nov 2019 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593787;
        bh=90NMdFg1vjtq9lQibDoLmx94A8PirCAI6VLa++0Jjlw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OuEO4G52pjaf/0gw37cjWclfbd5/UBU5aCQLIQ5l5HJxABcgmMfnNOxpoMASNomxU
         CfI8mmMv9qE7I73p0bbBeSqNnlVcRsWdB/b0nJLIWcRtVW+bzV97XCUoSzzX8HoLnB
         TkrrDoGAo5IXniGsbOH1SAaUmDHnIkzQGIWsqHWI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99D0B6087D;
        Tue, 12 Nov 2019 21:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593784;
        bh=90NMdFg1vjtq9lQibDoLmx94A8PirCAI6VLa++0Jjlw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YdsgkKmhGZ5msn4zf3LrHcWUsqnBPs9gZhVx2WPcxFVTY4aIst9sq1Tw7hvddOF2B
         ft/gJ+TuYPuK/Ot0ZE61qOP5TmXHqWqA/VygEBZYDf1Q5M8dLS1+/vmiij7b766X23
         CLUvngyq2LhYrK0mFqs+NzhMCz7F9KDMiQloZkcw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 99D0B6087D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/18] firmware: qcom_scm: Add funcnum IDs
Date:   Tue, 12 Nov 2019 13:22:38 -0800
Message-Id: <1573593774-12539-3-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LEGACY_FUNCNUM to qcom_scm-32.c and move SMCCC_FUNCNUM closer to
other smccc-specific macros.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 8 +++++---
 drivers/firmware/qcom_scm-64.c | 3 +--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 5d52641..5077fcf 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -38,6 +38,8 @@ static struct qcom_scm_entry qcom_scm_wb[] = {
 
 static DEFINE_MUTEX(qcom_scm_lock);
 
+#define LEGACY_FUNCNUM(s, c)	(((s) << 10) | ((c) & 0x3ff))
+
 /**
  * struct qcom_scm_legacy_command - one SCM command buffer
  * @len: total available memory for command and response
@@ -180,7 +182,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	cmd->buf_offset = cpu_to_le32(sizeof(*cmd));
 	cmd->resp_hdr_offset = cpu_to_le32(sizeof(*cmd) + cmd_len);
 
-	cmd->id = cpu_to_le32((svc_id << 10) | cmd_id);
+	cmd->id = cpu_to_le32(LEGACY_FUNCNUM(svc_id, cmd_id));
 	if (cmd_buf)
 		memcpy(legacy_get_command_buffer(cmd), cmd_buf, cmd_len);
 
@@ -221,7 +223,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 #define LEGACY_CLASS_REGISTER		(0x2 << 8)
 #define LEGACY_MASK_IRQS		BIT(5)
 #define LEGACY_ATOMIC_ID(svc, cmd, n) \
-				(((((svc) << 10)|((cmd) & 0x3ff)) << 12) | \
+				((LEGACY_FUNCNUM(svc, cmd) << 12) | \
 				LEGACY_CLASS_REGISTER | \
 				LEGACY_MASK_IRQS | \
 				(n & 0xf))
@@ -424,7 +426,7 @@ void __qcom_scm_cpu_power_down(u32 flags)
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 {
 	int ret;
-	__le32 svc_cmd = cpu_to_le32((svc_id << 10) | cmd_id);
+	__le32 svc_cmd = cpu_to_le32(LEGACY_FUNCNUM(svc_id, cmd_id));
 	__le32 ret_val = 0;
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_CMD,
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 8226b94..de337b3 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -14,8 +14,6 @@
 
 #include "qcom_scm.h"
 
-#define SMCCC_FUNCNUM(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
-
 #define MAX_QCOM_SCM_ARGS 10
 #define MAX_QCOM_SCM_RETS 3
 
@@ -58,6 +56,7 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define QCOM_SCM_EBUSY_WAIT_MS 30
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
+#define SMCCC_FUNCNUM(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
 #define SMCCC_N_EXT_ARGS 7
 #define SMCCC_FIRST_EXT_IDX 3
 #define SMCCC_N_REG_ARGS (MAX_QCOM_SCM_ARGS - SMCCC_N_EXT_ARGS + 1)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


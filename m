Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A23133387
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 22:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgAGVTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 16:19:46 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:14839 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728931AbgAGVEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 16:04:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578431088; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Rm/Fh9vSTYtGmmUQw2MWQnAKaV6fq0GfPf5VgHAqgU8=; b=anVuvKC4JZVZuC1/i/YaPvtrlwR0NvrCanSV8MnF2E1KR4oaG0L5xKXJXLw/DkmSWe1EwPMK
 k8NVKslvmleZwcLmk7TveRYr3D4qnhwQ54ROMU35KcB1toF6oIeg+/vKxi7nphRfsIYc67Mi
 mHk8Y7SgJhH0htyFarfhfpIaHtY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14f26f.7f61cb352180-smtp-out-n01;
 Tue, 07 Jan 2020 21:04:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2C7B0C447A3; Tue,  7 Jan 2020 21:04:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36FD2C447A5;
        Tue,  7 Jan 2020 21:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36FD2C447A5
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        swboyd@chromium.org, Stephan Gerhold <stephan@gerhold.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/17] firmware: qcom_scm-32: Add funcnum IDs
Date:   Tue,  7 Jan 2020 13:04:19 -0800
Message-Id: <1578431066-19600-11-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SCM_LEGACY_FNID macro to qcom_scm-32.

Change-Id: I385f0b5ba31cb14e304617d5aa67b37dc3c33c9c
Tested-by: Brian Masney <masneyb@onstation.org> # arm32
Tested-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 362d042..fcbe9e0 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -39,6 +39,8 @@ static struct qcom_scm_entry qcom_scm_wb[] = {
 
 static DEFINE_MUTEX(qcom_scm_lock);
 
+#define SCM_LEGACY_FNID(s, c)	(((s) << 10) | ((c) & 0x3ff))
+
 /**
  * struct scm_legacy_command - one SCM command buffer
  * @len: total available memory for command and response
@@ -168,7 +170,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	cmd->buf_offset = cpu_to_le32(sizeof(*cmd));
 	cmd->resp_hdr_offset = cpu_to_le32(sizeof(*cmd) + cmd_len);
 
-	cmd->id = cpu_to_le32((svc_id << 10) | cmd_id);
+	cmd->id = cpu_to_le32(SCM_LEGACY_FNID(svc_id, cmd_id));
 	if (cmd_buf)
 		memcpy(scm_legacy_get_command_buffer(cmd), cmd_buf, cmd_len);
 
@@ -209,7 +211,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 #define SCM_LEGACY_CLASS_REGISTER		(0x2 << 8)
 #define SCM_LEGACY_MASK_IRQS		BIT(5)
 #define SCM_LEGACY_ATOMIC_ID(svc, cmd, n) \
-				(((((svc) << 10)|((cmd) & 0x3ff)) << 12) | \
+				((SCM_LEGACY_FNID(svc, cmd) << 12) | \
 				SCM_LEGACY_CLASS_REGISTER | \
 				SCM_LEGACY_MASK_IRQS | \
 				(n & 0xf))
@@ -350,7 +352,7 @@ void __qcom_scm_cpu_power_down(u32 flags)
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 {
 	int ret;
-	__le32 svc_cmd = cpu_to_le32((svc_id << 10) | cmd_id);
+	__le32 svc_cmd = cpu_to_le32(SCM_LEGACY_FNID(svc_id, cmd_id));
 	__le32 ret_val = 0;
 
 	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

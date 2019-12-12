Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6233711D65D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730566AbfLLSvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:51:14 -0500
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:35740
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730604AbfLLSvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576176673;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=Rn03FluCaDQLghrbQl4vahU7+G26SUGCOzkKXznyMik=;
        b=M/pK/kGCcjaTqixWdNXoYORCn92xThqw0cAGZsz7NneTCpYvppGXezYpSv+xrRZ7
        G46RNdyUROhoHxDllsw6uCBU/0yCBka0TTy8aCKGwiXpWu3YpyLuT5nIlL0L8MJCtV9
        Er1MeutFHUhxsqL5PDZGeMIvQUR9QtxSYov/OVXw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576176673;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=Rn03FluCaDQLghrbQl4vahU7+G26SUGCOzkKXznyMik=;
        b=Kk7SUA5nRa3hsTGMmwWENG5HSUCmK02IaLDGneY3UhWzxsKgsKojhyOV0KH48xec
        k2bSuVlfHpankA03Eph2PhpEKRcO/Ou54zDMZQdsZHQYJ88GHZUaSsAKfH9HEoOQYAs
        lKaG6/OOkUMN2/bfNeASzzv2VqTQhQnJvD1eUW50=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81D03C447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/17] firmware: qcom_scm-32: Add funcnum IDs
Date:   Thu, 12 Dec 2019 18:51:13 +0000
Message-ID: <0101016efb7363da-a7c086c4-3107-4443-b223-1b8e84f41736-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
References: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SCM_LEGACY_FNID macro to qcom_scm-32.

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


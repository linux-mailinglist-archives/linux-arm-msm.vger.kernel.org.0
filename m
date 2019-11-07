Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1862F38D3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfKGTj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:39:56 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38362 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbfKGTj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:39:56 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4604260DF5; Thu,  7 Nov 2019 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573155595;
        bh=UK0XZ92g/IIjpWep34YQXzvpLba/PkL2hhMeVbUbS/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PsinT6KbpoUKkCtLojsZnlG3fStePyR5/Y4ZtppU99Xo8B/N12hfLPO1EEB6b/UtY
         RYYMYAGQmluKBtUzuQuD7d7QxhRhJuyWZBaQVpLXqOVoQ4R4TDqIYtviUqm48yvHg3
         D8Prtf3k/AeXwqxKxXPPJm6WCkb8TOQCGNvJ0ftg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cohens-linux.qualcomm.com (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cohens@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36E8360D90;
        Thu,  7 Nov 2019 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573155594;
        bh=UK0XZ92g/IIjpWep34YQXzvpLba/PkL2hhMeVbUbS/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YP5aD1o5Hvr+N9hun7LDYclVS+bFnkZbbsOG1esLU/EDODRX2rpKJ7C62NislV/9o
         uofHyNonJehfZzMPilMscuAMpcgyc5PTh983me9NtlDyBsKu59hbu/6bfZARXCI2lG
         pxD+XI6bPNuWlfWwcge/xeL8TgwjgamuON8ilQVw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36E8360D90
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cohens@codeaurora.org
From:   Steve Cohen <cohens@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     pdhaval@codeaurora.org, seanpaul@chromium.org, adelva@google.com,
        Steve Cohen <cohens@codeaurora.org>
Subject: [PATCH 3/3] drm/msm/dpu: check blob limitations during create blob ioctl
Date:   Thu,  7 Nov 2019 14:39:14 -0500
Message-Id: <1573155554-16248-4-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Limit the blob size and number of blobs that can be allocated
by a client. This prevents fuzzers from abusing this ioctl and
exhausting the system memory.

Signed-off-by: Steve Cohen <cohens@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 6c92f0f..5fbb7c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -41,6 +41,8 @@
  */
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
+#define MAX_BLOB_PROP_SIZE	(PAGE_SIZE * 30)
+#define MAX_BLOB_PROP_COUNT	250
 
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
@@ -544,6 +546,17 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	return ret;
 }
 
+static int dpu_kms_createblob_check(unsigned int count, size_t length)
+{
+	if (count >= MAX_BLOB_PROP_COUNT)
+		return -EINVAL;
+
+	if (length > MAX_BLOB_PROP_SIZE)
+		return -EINVAL;
+
+	return 0;
+}
+
 static long dpu_kms_round_pixclk(struct msm_kms *kms, unsigned long rate,
 		struct drm_encoder *encoder)
 {
@@ -683,6 +696,7 @@ static const struct msm_kms_funcs kms_funcs = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
 #endif
+	.createblob_check = dpu_kms_createblob_check,
 };
 
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBE53C3C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2019 08:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404013AbfFKGGC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jun 2019 02:06:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45470 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403883AbfFKGGC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jun 2019 02:06:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AE97860716; Tue, 11 Jun 2019 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560233161;
        bh=s9op8rSOVHaZd3OBUe426rJmaSfw6DuRrLGlKD9kKGM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SQvkT58StWMp0NWGhw3lRZVa27miulbTLwxmuhyuhSevZGVUckWJm+zFxmo/lZxcu
         upY5dV6DJhywgZDsnWpmofKapla76Rj+yScAHeHA+4QGU4mHmEAvKtl/6aJqMZgaaK
         FbDtyQYAAKXpGiiJpe4EwOzTUej3H+p7NNyLz2CU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from amasule-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amasule@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3BEF5604BE;
        Tue, 11 Jun 2019 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560233161;
        bh=s9op8rSOVHaZd3OBUe426rJmaSfw6DuRrLGlKD9kKGM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SQvkT58StWMp0NWGhw3lRZVa27miulbTLwxmuhyuhSevZGVUckWJm+zFxmo/lZxcu
         upY5dV6DJhywgZDsnWpmofKapla76Rj+yScAHeHA+4QGU4mHmEAvKtl/6aJqMZgaaK
         FbDtyQYAAKXpGiiJpe4EwOzTUej3H+p7NNyLz2CU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3BEF5604BE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH 2/5] media: venus: Initialize codec data
Date:   Tue, 11 Jun 2019 11:35:27 +0530
Message-Id: <1560233130-27264-3-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Initialize the codec data with core resources.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 30 +++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c    |  4 ++++
 drivers/media/platform/qcom/venus/venc.c    |  4 ++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 5cad601..f7f724b 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -715,6 +715,36 @@ int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
 
+int venus_helper_init_codec_data(struct venus_inst *inst)
+{
+	const struct codec_data *codec_data;
+	unsigned int i, codec_data_size;
+	u32 pixfmt;
+	int ret = 0;
+
+	if (!IS_V4(inst->core))
+		return 0;
+
+	codec_data = inst->core->res->codec_data;
+	codec_data_size = inst->core->res->codec_data_size;
+	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
+			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
+
+	for (i = 0; i < codec_data_size; i++) {
+		if (codec_data[i].pixfmt == pixfmt &&
+		    codec_data[i].session_type == inst->session_type) {
+			inst->clk_data.codec_data = &codec_data[i];
+			break;
+		}
+	}
+
+	if (!inst->clk_data.codec_data)
+		ret = -EINVAL;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(venus_helper_init_codec_data);
+
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs)
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 2475f284..f9360a8 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -41,6 +41,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       unsigned int width, unsigned int height,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
+int venus_helper_init_codec_data(struct venus_inst *inst);
 int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 282de21..51795fd 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -660,6 +660,10 @@ static int vdec_init_session(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
+	ret = venus_helper_init_codec_data(inst);
+	if (ret)
+		goto deinit;
+
 	return 0;
 deinit:
 	hfi_session_deinit(inst);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 32cff29..792cdce 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -847,6 +847,10 @@ static int venc_init_session(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
+	ret = venus_helper_init_codec_data(inst);
+	if (ret)
+		goto deinit;
+
 	ret = venc_set_properties(inst);
 	if (ret)
 		goto deinit;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


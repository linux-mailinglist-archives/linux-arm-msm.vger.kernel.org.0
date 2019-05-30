Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1F512FCD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2019 15:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfE3N73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 09:59:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46894 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfE3N73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 09:59:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D8B4A60588; Thu, 30 May 2019 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559224768;
        bh=0nXJ2kRIt9+nus4XkTsFSv+sPOQK6UV39wlcPrXeboU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V/+r37DXYeUzfF7VzI7Mo6yRTa/MDYOXQfhKirKKFIblGlM7D/T7QNq0ifK9BNtM5
         UioNrxSh4XB/NwtKtB+dRv5RMQNR8GoykUJ8WstRIWK+EGlheWUlqBs2J+WU1W8lS6
         Q8dw3DKdq6sX5YGQY//4sVvv/zFZLDuNqSdkNroE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D800460F3A;
        Thu, 30 May 2019 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559224766;
        bh=0nXJ2kRIt9+nus4XkTsFSv+sPOQK6UV39wlcPrXeboU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FCk5nZKg9OS8kFCjMAqUsssovGoYipPgSJ/+W4BiJwz/kelbmGj6uJn1mGW0Ewi2K
         fAW6kW73Xa8TV3vT2Wiz9sJehqexWMXwoQxAppIgoKBcDGroonQMMU909zgnIqmT83
         SkDmGcEv0t9rv9qLpEV4/1TL0nAzNyBdvPAcjqJA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D800460F3A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH 5/5] media: venus: Update core selection
Date:   Thu, 30 May 2019 19:28:28 +0530
Message-Id: <1559224708-6039-6-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559224708-6039-1-git-send-email-amasule@codeaurora.org>
References: <1559224708-6039-1-git-send-email-amasule@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Present core assignment is static. Introduced load balancing
across the cores. Load on earch core is calculated and core
with minimum load is assigned to given instance.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 50 +++++++++++++++++++++++++----
 drivers/media/platform/qcom/venus/helpers.h |  2 +-
 drivers/media/platform/qcom/venus/vdec.c    |  5 +--
 drivers/media/platform/qcom/venus/venc.c    |  4 ++-
 4 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 692ba3b..6ce202f 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -500,6 +500,16 @@ static int load_scale_clocks(struct venus_inst *inst)
 		return scale_clocks_vpu4(inst);
 }
 
+int set_core_usage(struct venus_inst *inst, u32 usage)
+{
+	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
+	struct hfi_videocores_usage_type cu;
+
+	cu.video_core_enable_mask = usage;
+
+	return hfi_session_set_property(inst, ptype, &cu);
+}
+
 static void fill_buffer_desc(const struct venus_buffer *buf,
 			     struct hfi_buffer_desc *bd, bool response)
 {
@@ -803,19 +813,47 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
 
-int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
+int venus_helper_decide_core(struct venus_inst *inst, u32 cores_max)
 {
-	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
-	struct hfi_videocores_usage_type cu;
+	struct venus_core *core = inst->core;
+	u32 min_core_id = 0, core0_load = 0, core1_load = 0;
+	unsigned long min_load, max_freq, cur_inst_load;
+	int ret;
 
 	if (!IS_V4(inst->core))
 		return 0;
 
-	cu.video_core_enable_mask = usage;
+	core0_load = load_per_core(core, VIDC_CORE_ID_1);
+	core1_load = load_per_core(core, VIDC_CORE_ID_2);
 
-	return hfi_session_set_property(inst, ptype, &cu);
+	min_core_id = core0_load < core1_load ? VIDC_CORE_ID_1 : VIDC_CORE_ID_2;
+	min_load = min(core0_load, core1_load);
+
+	if (cores_max < VIDC_CORE_ID_1) {
+		min_core_id = VIDC_CORE_ID_1;
+		min_load = core0_load;
+	}
+
+	cur_inst_load = load_per_instance(inst) *
+		inst->clk_data.codec_data->vpp_cycles;
+	max_freq = core->res->freq_tbl[0].freq;
+
+	if ((cur_inst_load + min_load)	> max_freq) {
+		dev_warn(core->dev, "HW is overloaded, needed: %lu max: %lu\n",
+			 cur_inst_load, max_freq);
+		return -EINVAL;
+	}
+
+	ret = set_core_usage(inst, min_core_id);
+
+	if (ret)
+		return ret;
+
+	inst->clk_data.core_id = min_core_id;
+
+	return 0;
 }
-EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
+EXPORT_SYMBOL_GPL(venus_helper_decide_core);
 
 int venus_helper_init_codec_data(struct venus_inst *inst)
 {
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index f9360a8..c41ceb3 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -42,7 +42,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
 int venus_helper_init_codec_data(struct venus_inst *inst);
-int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
+int venus_helper_decide_core(struct venus_inst *inst, u32 cores_max);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 51795fd..9f988ba 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -544,14 +544,15 @@ static int vdec_output_conf(struct venus_inst *inst)
 	u32 height = inst->out_height;
 	u32 out_fmt, out2_fmt;
 	bool ubwc = false;
-	u32 ptype;
+	u32 ptype, cores_max;
 	int ret;
 
 	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
 	if (ret)
 		return ret;
 
-	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_1);
+	cores_max = core_num_max(inst);
+	ret = venus_helper_decide_core(inst, cores_max);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 792cdce..ed39efd 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -654,13 +654,15 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
 	u32 ptype, rate_control, bitrate, profile = 0, level = 0;
+	u32 cores_max;
 	int ret;
 
 	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
 	if (ret)
 		return ret;
 
-	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_2);
+	cores_max = core_num_max(inst);
+	ret = venus_helper_decide_core(inst, cores_max);
 	if (ret)
 		return ret;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


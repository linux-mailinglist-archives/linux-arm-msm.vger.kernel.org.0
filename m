Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C767131564
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgAFPu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:50:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46462 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgAFPuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:50:15 -0500
Received: by mail-lj1-f196.google.com with SMTP id m26so48937016ljc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 07:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uwOaY4uZyAiVBXTrHS/QGxhnoJkW9mn9qhM7V3ufkpk=;
        b=KHxFc1acztpEL6v0E3hEeUOhz7P7Mj6iVxoVFq1cmyNoOZLOSG9wYZbr0x2f8er4Ih
         NRa2y2dn1ko40JsD887RuxbyL0Q90rlJMWTXoXrZdbi4FaVRKE8M9kS4nLTwqBMoFFmk
         tITWga8EuOdkeKi6zctlafd15uAA1s3X9a1/Ggs/FzCX4KXalFKHZX14MYyx0/NKhKae
         TmZUKD+kTA05uqwADKx6mk9N6o9iflvXD1/mhp2WCcf6WnHSFxfsyjC5i9pqBbJUL5FU
         kJ4Oudv3HRmXN99kaTFNPCe1M6SD8vNXhwC2Fh5S40W4SY5DtICeJlhns3q5hlQ47tjL
         Jvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uwOaY4uZyAiVBXTrHS/QGxhnoJkW9mn9qhM7V3ufkpk=;
        b=Ibu/3KimXsZlVM0cSxy0uBesfHB5hvDYARnIDqbIq1mRF1K9MlTz4Ki6Ts7c+TOEaO
         9342flQCV4wjX53CUF5tD2wOrvCViR6QP98dcl0CTZDx6wCsMqi6fFulrQrPi0WQ0Ged
         f/fI+zElVRRN8nBcW7fazB59+cH4eyUUQqNl1eB47p0rxpEyn/F900vUbsY3pUPkqdb2
         AZF2ag8O6apq9DXNVg+ZWy/tZPwV9G2FLoScfWo+/tbLq0hMhYjS2kiH9/+IgTtfVSD8
         FQ3WtXdpMaN0MBojZOkNkPlBRpTjYR3gDqU5J2cGffzI2QIsOCM5kCbVaqEqrz/iQ1to
         dvSA==
X-Gm-Message-State: APjAAAWBS5DSG17JE+YY/D6mHX4RBIAZKPkBk+Kbvq9+8YFM+CXlhQxC
        yUpvyvFs9NXlBBiXU8wh9sO3ECetEro=
X-Google-Smtp-Source: APXvYqz7OYRw3Ub9jV6StA2wAvKU/WIJM7s1tLntdPC21QMwcA6Igw6WJgoM8nr7ZsNAO7H5eeijaA==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr11695964ljl.56.1578325813029;
        Mon, 06 Jan 2020 07:50:13 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:12 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 05/12] media: venus: vdec: handle 10bit bitstreams
Date:   Mon,  6 Jan 2020 17:49:22 +0200
Message-Id: <20200106154929.4331-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Aniket Masule <amasule@codeaurora.org>

Handle 10bit video streams in the decoder by using dithering, i.e
the decoder output buffers will be in 8bit format.

The runtime handling is implemented by sending v4l2 event to
userspace application, then the application should stop the
streaming on capture queue and initiate format negotiation, and
start streaming again.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
Co-developed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/helpers.c   | 97 +++++++++++++++++++
 .../media/platform/qcom/venus/hfi_helper.h    |  5 +
 drivers/media/platform/qcom/venus/vdec.c      |  8 +-
 4 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index bfbd4a1ba089..55bdeda780bc 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -382,6 +382,7 @@ struct venus_inst {
 	u32 session_type;
 	union hfi_get_property hprop;
 	unsigned int core_acquired: 1;
+	unsigned int bit_depth;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 043e0d8705a8..a29662405e3a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -626,6 +626,76 @@ static u32 get_framesize_raw_nv12_ubwc(u32 width, u32 height)
 		     max(extradata, y_stride * 48), SZ_4K);
 }
 
+static u32 get_framesize_raw_p010(u32 width, u32 height)
+{
+	u32 y_plane, uv_plane, y_stride, uv_stride, y_sclines, uv_sclines;
+
+	y_stride = ALIGN(width * 2, 256);
+	uv_stride = ALIGN(width * 2, 256);
+	y_sclines = ALIGN(height, 32);
+	uv_sclines = ALIGN((height + 1) >> 1, 16);
+	y_plane = y_stride * y_sclines;
+	uv_plane = uv_stride * uv_sclines;
+
+	return ALIGN((y_plane + uv_plane), SZ_4K);
+}
+
+static u32 get_framesize_raw_p010_ubwc(u32 width, u32 height)
+{
+	u32 y_stride, uv_stride, y_sclines, uv_sclines;
+	u32 y_ubwc_plane, uv_ubwc_plane;
+	u32 y_meta_stride, y_meta_scanlines;
+	u32 uv_meta_stride, uv_meta_scanlines;
+	u32 y_meta_plane, uv_meta_plane;
+	u32 size;
+
+	y_stride = ALIGN(width * 2, 256);
+	uv_stride = ALIGN(width * 2, 256);
+	y_sclines = ALIGN(height, 16);
+	uv_sclines = ALIGN((height + 1) >> 1, 16);
+
+	y_ubwc_plane = ALIGN(y_stride * y_sclines, SZ_4K);
+	uv_ubwc_plane = ALIGN(uv_stride * uv_sclines, SZ_4K);
+	y_meta_stride = ALIGN(DIV_ROUND_UP(width, 32), 64);
+	y_meta_scanlines = ALIGN(DIV_ROUND_UP(height, 4), 16);
+	y_meta_plane = ALIGN(y_meta_stride * y_meta_scanlines, SZ_4K);
+	uv_meta_stride = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
+	uv_meta_scanlines = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
+	uv_meta_plane = ALIGN(uv_meta_stride * uv_meta_scanlines, SZ_4K);
+
+	size = y_ubwc_plane + uv_ubwc_plane + y_meta_plane + uv_meta_plane;
+
+	return ALIGN(size, SZ_4K);
+}
+
+static u32 get_framesize_raw_yuv420_tp10_ubwc(u32 width, u32 height)
+{
+	u32 y_stride, uv_stride, y_sclines, uv_sclines;
+	u32 y_ubwc_plane, uv_ubwc_plane;
+	u32 y_meta_stride, y_meta_scanlines;
+	u32 uv_meta_stride, uv_meta_scanlines;
+	u32 y_meta_plane, uv_meta_plane;
+	u32 size;
+
+	y_stride = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
+	uv_stride = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
+	y_sclines = ALIGN(height, 16);
+	uv_sclines = ALIGN((height + 1) >> 1, 16);
+
+	y_ubwc_plane = ALIGN(y_stride * y_sclines, SZ_4K);
+	uv_ubwc_plane = ALIGN(uv_stride * uv_sclines, SZ_4K);
+	y_meta_stride = ALIGN(DIV_ROUND_UP(width, 48), 64);
+	y_meta_scanlines = ALIGN(DIV_ROUND_UP(height, 4), 16);
+	y_meta_plane = ALIGN(y_meta_stride * y_meta_scanlines, SZ_4K);
+	uv_meta_stride = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
+	uv_meta_scanlines = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
+	uv_meta_plane = ALIGN(uv_meta_stride * uv_meta_scanlines, SZ_4K);
+
+	size = y_ubwc_plane + uv_ubwc_plane + y_meta_plane + uv_meta_plane;
+
+	return ALIGN(size, SZ_4K);
+}
+
 u32 venus_helper_get_framesz_raw(u32 hfi_fmt, u32 width, u32 height)
 {
 	switch (hfi_fmt) {
@@ -634,6 +704,12 @@ u32 venus_helper_get_framesz_raw(u32 hfi_fmt, u32 width, u32 height)
 		return get_framesize_raw_nv12(width, height);
 	case HFI_COLOR_FORMAT_NV12_UBWC:
 		return get_framesize_raw_nv12_ubwc(width, height);
+	case HFI_COLOR_FORMAT_P010:
+		return get_framesize_raw_p010(width, height);
+	case HFI_COLOR_FORMAT_P010_UBWC:
+		return get_framesize_raw_p010_ubwc(width, height);
+	case HFI_COLOR_FORMAT_YUV420_TP10_UBWC:
+		return get_framesize_raw_yuv420_tp10_ubwc(width, height);
 	default:
 		return 0;
 	}
@@ -1235,6 +1311,27 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 v4l2_fmt,
 	if (!caps)
 		return -EINVAL;
 
+	if (inst->bit_depth == VIDC_BITDEPTH_10 &&
+	    inst->session_type == VIDC_SESSION_TYPE_DEC) {
+		found_ubwc =
+			find_fmt_from_caps(caps, HFI_BUFFER_OUTPUT,
+					   HFI_COLOR_FORMAT_YUV420_TP10_UBWC);
+		found = find_fmt_from_caps(caps, HFI_BUFFER_OUTPUT2,
+					   HFI_COLOR_FORMAT_NV12);
+		if (found_ubwc && found) {
+			/*
+			 * Hard-code DPB buffers to be 10bit UBWC and decoder
+			 * output buffers in 8bit NV12 until V4L2 is able to
+			 * expose compressed/tiled formats to applications.
+			 */
+			*out_fmt = HFI_COLOR_FORMAT_YUV420_TP10_UBWC;
+			*out2_fmt = HFI_COLOR_FORMAT_NV12;
+			return 0;
+		}
+
+		return -EINVAL;
+	}
+
 	if (ubwc) {
 		ubwc_fmt = fmt | HFI_COLOR_FORMAT_UBWC_BASE;
 		found_ubwc = find_fmt_from_caps(caps, HFI_BUFFER_OUTPUT,
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 2a47f6c0a07a..0b4597c73fb5 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -793,6 +793,9 @@ struct hfi_h264_vui_timing_info {
 	u32 time_scale;
 };
 
+#define VIDC_BITDEPTH_8		0
+#define VIDC_BITDEPTH_10	1
+
 struct hfi_bit_depth {
 	u32 buffer_type;
 	u32 bit_depth;
@@ -841,8 +844,10 @@ struct hfi_extradata_input_crop {
 #define HFI_COLOR_FORMAT_10_BIT_BASE		0x4000
 
 #define HFI_COLOR_FORMAT_YUV420_TP10		0x4002
+#define HFI_COLOR_FORMAT_P010			0x4003
 #define HFI_COLOR_FORMAT_NV12_UBWC		0x8002
 #define HFI_COLOR_FORMAT_YUV420_TP10_UBWC	0xc002
+#define HFI_COLOR_FORMAT_P010_UBWC		0xc003
 #define HFI_COLOR_FORMAT_RGBA8888_UBWC		0x8010
 
 struct hfi_uncompressed_format_select {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7b7a4f3377cf..eeff0d8e46b2 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1172,7 +1172,7 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 static void vdec_event_change(struct venus_inst *inst,
 			      struct hfi_event_data *ev_data, bool sufficient)
 {
-	static const struct v4l2_event ev = {
+	struct v4l2_event ev = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION };
 	struct device *dev = inst->core->dev_dec;
@@ -1193,6 +1193,11 @@ static void vdec_event_change(struct venus_inst *inst,
 	inst->out_width = ev_data->width;
 	inst->out_height = ev_data->height;
 
+	if (inst->bit_depth != ev_data->bit_depth) {
+		inst->bit_depth = ev_data->bit_depth;
+		ev.u.src_change.changes |= V4L2_EVENT_SRC_CH_COLOR_DEPTH;
+	}
+
 	dev_dbg(dev, "event %s sufficient resources (%ux%u)\n",
 		sufficient ? "" : "not", ev_data->width, ev_data->height);
 
@@ -1340,6 +1345,7 @@ static int vdec_open(struct file *file)
 	inst->buf_count = 0;
 	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
 	inst->core_acquired = false;
+	inst->bit_depth = VIDC_BITDEPTH_8;
 	init_waitqueue_head(&inst->reconf_wait);
 	venus_helper_init_instance(inst);
 
-- 
2.17.1


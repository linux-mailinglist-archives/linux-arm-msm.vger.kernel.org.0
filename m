Return-Path: <linux-arm-msm+bounces-71367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3AB3DB8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3C0D17C0F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411D42EE272;
	Mon,  1 Sep 2025 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcCZblE2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541512ED84C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756713314; cv=none; b=HvUdTmr4HUoNkv/hqTPR2rt+vUtVuASlUkytGo/ZVHva441pikO7Demrrp7T3m4BNCr+WeE3P5f6guoD+omUrc3AZcN21iFwPS5uai1GbAP5a2gYwsce2OCJikaarzbSCyb+nYhJnIeI3LEGHvaR2dJK/FkbGOvKZ5QjHjx6tQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756713314; c=relaxed/simple;
	bh=AJzTL4SzscNaKqtDj3jsv9dhU+aMdreTTjcC8nGkKtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zx1KIOAV7XOT/FMhVDxOu/YRjYcIlNXI4fOQi27hsdmqo89vho8rB2trbSbvuyYTNMz9+q0sU1kSwkYb9T1fqD74Y9c7QJdqEMGvl0uIs7PZcWHj078EC6Kby3JjuMewJJRxpka8PLgv6RohKLyWwqnPdUvgii24ZKg5k/Ky8E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcCZblE2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b7ebe667cso23118465e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 00:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756713309; x=1757318109; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLCKDkQyHuW6IW57J4gCkDs2lnUgKFG1yRGou6EmSw0=;
        b=RcCZblE25sqf03a/jGH1kutveHdHrPDveBcWPj7icRzj0Pjha2kMAMHpCVZ2s1lsZl
         PzjMuElNNRRREZQqXpv+UsM9GQ3MK7uaF2u1GstC9XYq/JiuAke8lBCCWGGSW5wWGrGb
         q1EZQvtubQe8EpcNyUlXbzh3ncK71CaCS1PZcyjYxWAsffG0oQnzMnpyey2jMAIMgqMM
         QHUGsmtd/wJqcGLUiTjDs6mXGk4WklLp2j+511qeWenyUHPnwLcZ9PoHtK0AjDYt86j3
         d4mYw0w8W/XxfGrCK0VTD/bnP5aduGBNWlKRDAlxJu7mlF760S3iaGgYUrLUzJaZmITH
         zvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756713309; x=1757318109;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLCKDkQyHuW6IW57J4gCkDs2lnUgKFG1yRGou6EmSw0=;
        b=HNecX0c/nXvbjoEwh/gQQ7GpCzgDjGlctB8ZJmjS7FkHEDRFTdn1j8+90/l1fAaSGo
         wo2UQpC3FMinlLAVFqdSipmIq/pfLRcdIMFEyLonU2qnShwSlo8+7hfy5msWtU5JcoMj
         SxFFO+JLjZpcVDkKEZt8NNkoPrVCmAQridDYW7NY7UmdDTa0umwamKyF6W9VSWQkjWXJ
         KB4xAb1r+afDbEw3Pc4nyQOKL9+DzM6CVaZ+HpmxuOH52vckUSNhSTf3WA0aN1kqm7rR
         GzpAazTZebg5YIcRF9vfVQfoTy5RgibPsvXuz6X5o8zMXm+1LSImX2vaA1yJ0fjF7TR8
         mDJw==
X-Forwarded-Encrypted: i=1; AJvYcCXAXTzg2mb4Wu8zEWIuOZ0ZBISaSfVGzzyeArgvW7+RsCCWHXj8tDBBTZPZYl89GPC8l9H70aPKBhzL156x@vger.kernel.org
X-Gm-Message-State: AOJu0Yxms/CGbCkQ4kL//H03zR3b+myvWI1mczh8RQ0qo0MCwoClQTSa
	kMBoCRbViBBuZgwWZbOenu2FM+j4M64TP9GI3RkhE1CoDh0fiH6s6ncSajgqy8w5QH8=
X-Gm-Gg: ASbGncs0LG8QJ7DdTXJXFCwcwONv7EqVrFFR44zm8DK13BgHLpLfxUcTTXJi6a8yUUW
	RCePO6Cv7uhbVV52HT0oWFflvBpCRQIKIppuNtjTtZlB4XeSIzi+0HZA9uSwYisPXF6WXqeXDDT
	KuQByaxqtt0NCxdyZv6JDOe+cHq8aG/WYD1ifKRNzmrcrIlq0vzUXj1MqGuy0pZE6c7xoDtKW/N
	5t0hggx4VAyKPYvZZKeVVgLleUA9AJbbvEPM/JMWnuwVR/HzuxPhPA0RQ4WAC5KUujLhFR4aObh
	+eRYuIW7dtmzgKnEhvDZyy33WWvM8ctZYilFK/E9qS6oHPJMyCHVLk/iB4KBSFHWa7PCTCZIeN4
	klrH9ofV7gfyrHUMtgZb6Z7pznLANYcoyXVd7eNjlEeU=
X-Google-Smtp-Source: AGHT+IE2ec9VMLsNdq7KeJy9kASdqCJnicqdiEO2+tbxChTPTjV4pAZYtoAEJaWJoj4zuANtPXk5aw==
X-Received: by 2002:a05:600c:1f08:b0:456:13d8:d141 with SMTP id 5b1f17b1804b1-45b8557c845mr48090665e9.27.1756713309511;
        Mon, 01 Sep 2025 00:55:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm92280065e9.9.2025.09.01.00.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:55:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 01 Sep 2025 09:55:05 +0200
Subject: [PATCH v2] media: iris: add VPU33 specific encoding buffer
 calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-topic-sm8x50-iris-encoder-v3-hevc-debug-v2-1-c65406bbdf68@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFhRtWgC/5XNTQ6CMBCG4auYrh3TH5DqynsYFthOYRJtyRQbD
 OHuIjdw+X6L71lERibM4npYBGOhTCluoY8H4YYu9gjktxZa6lparWFKIznILzvXEogpA0aXPDI
 UAwMWBx4f7x6UVI0JlTUWjdjeRsZA8y7d260HylPizw4X9Vv/N4oCBWdj/EVWITTe3J4UO06nx
 L1o13X9AhXyp5zfAAAA
X-Change-ID: 20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-10173f4838e3
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13892;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=AJzTL4SzscNaKqtDj3jsv9dhU+aMdreTTjcC8nGkKtg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotVFcwEyhdCVXv3MX9LHkC4RazDatjHwf6ZiscoeW
 2BetsLiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLVRXAAKCRB33NvayMhJ0U62D/
 4gE8St7BPZRc/nAVX5bpRgTJsXr96CaKrY8SUrDkKTrpzm9WF0q3rLLrvB2PXLX0o7ZgeceAWz1VW0
 Kwno3Ll6Nf7KRiEUVvfTEJK9QF/jhrOROfiPhlfH30CbjNq0YfpIW+3YuzjgRM6DNrsqjeHd6ctkuk
 ybPV6cqg8YFoc4rZGaGxxzPu9suRb7QlmOyIKIa5h0EmmzUNvhRQRP6S2HHL+wuHUGlNpcw+jiUO2N
 j2xgx8NM/CdM6B4x4m5UFl4ixxubIchoEPHsTVUP+U9Ts/j1F7U2zGOAZXnuV7ZwSOpJnAhy0BRaD4
 KhIvKohZ9oigk0W1j8LiT32UL4l+x5iuNNIlwY/tDS7AWy2A4gHvMR7u0Oe4q6vemL1YejBWCYejrb
 3gvP5Bog0xSJV+92A28lT/I+T9Hd2uCLs3gH/hoBqxeVcvBQjGwgCb2dlghAcEbdvv9jyMm7JtrF+7
 4HtvvEYjjNgg1MmY41Dhm4lOJ0/bAlc9NAXTPIdeUJtR3LEVu7QUqce6ZN8LgHlhXjLv/jEGbH0PaU
 tK8KFHk5x65ElHE3wldPaiGUUjuiKL2I79dwYsVWzuzRhCA1NbxPZMKBdYAB4fEgCngigAkQIC0Yky
 KxoWbIXPLNDALYGft0Ia/m4zYurgbjk2edWvu99mQbWE7k89Mn1a/qQreKhw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The VPU33 found in the SM8650 Platform requires some slighly different
buffer calculation for encoding to allow working with the latest
firwware uploaded on linux-firmware at [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ece445af91bbee49bf0d8b23c2b99b596ae6eac7

Suggested-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
[2] https://lore.kernel.org/all/20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com/
---
Changes in v2:
- Removed calculation fix for hevc encoding, as it was added in common code
- Link to v1: https://lore.kernel.org/r/20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-v1-1-633d904ff7d3@linaro.org
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   4 +
 .../platform/qcom/iris/iris_platform_sm8250.c      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 110 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   3 +-
 7 files changed, 118 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 8891a297d384b018b3cc8313ad6416db6317798b..c0900038e7defccf7de3cb60e17c71e36a0e8ead 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -284,7 +284,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 
-	buffers->size = iris_vpu_buf_size(inst, buffer_type);
+	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 29cf392ca2566da286ea3e928ce4a22c2e970cc8..e1788c266bb1080921f17248fd5ee60156b3143d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -911,7 +911,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
 
 	if (iris_split_mode_enabled(inst)) {
 		bufsz.type = HFI_BUFFER_OUTPUT;
-		bufsz.size = iris_vpu_buf_size(inst, BUF_DPB);
+		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
 
 		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
 		if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 96fa7b1bb592441e85664da408ea4ba42c9a15b5..7057c4cd1a9ebefa02c855014e5f19993da58e38 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -7,6 +7,7 @@
 #define __IRIS_PLATFORM_COMMON_H__
 
 #include <linux/bits.h>
+#include "iris_buffer.h"
 
 struct iris_core;
 struct iris_inst;
@@ -189,6 +190,7 @@ struct iris_platform_data {
 	void (*init_hfi_command_ops)(struct iris_core *core);
 	void (*init_hfi_response_ops)(struct iris_core *core);
 	struct iris_inst *(*get_instance)(void);
+	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index cf4b92f534b272a0a1ac2a0e7bb9316501374332..78a04e76de7c00703b84bd3c1c6e9a884ee7cebe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -8,6 +8,7 @@
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_defines.h"
 #include "iris_platform_common.h"
+#include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
 #include "iris_platform_qcs8300.h"
@@ -738,6 +739,7 @@ struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -827,6 +829,7 @@ struct iris_platform_data sm8650_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu33x_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
 	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -916,6 +919,7 @@ struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 978d0130d43b5f6febb65430a9bbe3932e8f24df..16486284f8acccf6a95a27f6003e885226e28f4d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -9,6 +9,7 @@
 #include "iris_resources.h"
 #include "iris_hfi_gen1.h"
 #include "iris_hfi_gen1_defines.h"
+#include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
 #define BITRATE_MIN		32000
@@ -317,6 +318,7 @@ struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
 	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 34a9094201ccd11d30a776f284ede8248d8017a9..9cb7701722c3644ef4c369fa58490ac83258ea7e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -867,6 +867,34 @@ u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
 		      (((((max_t(u32, (frame_width_coded),
 				 (frame_height_coded)) + 3) >> 2) << 5) + 256) * 16)), 256);
 }
+static inline
+u32 size_vpss_line_buf_vpu33x(u32 num_vpp_pipes_enc, u32 frame_height_coded,
+			      u32 frame_width_coded)
+{
+	u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0;
+	u32 vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0;
+	u32 size_left = 0, size_top = 0;
+
+	vpss_4tap_top = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
+	vpss_4tap_top >>= 2;
+	vpss_4tap_top <<= 4;
+	vpss_4tap_top += 256;
+	vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
+	vpss_div2_top = max_t(u32, frame_width_coded, frame_height_coded) + 3;
+	vpss_div2_top >>= 2;
+	vpss_div2_top <<= 4;
+	vpss_div2_top += 256;
+	vpss_div2_left = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
+	vpss_div2_left >>= 2;
+	vpss_div2_left <<= 5;
+	vpss_div2_left += 64;
+	vpss_top_lb = (frame_width_coded + 1) << 3;
+	vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
+	size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
+	size_top = (vpss_4tap_top + vpss_div2_top) * 2;
+
+	return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb, DMA_ALIGNMENT);
+}
 
 static inline
 u32 size_top_line_buf_first_stg_sao(u32 frame_width_coded)
@@ -977,8 +1005,8 @@ static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
 }
 
 static inline
-u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
-			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+u32 hfi_buffer_line_enc_base(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			     u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
 {
 	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
 	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
@@ -1018,10 +1046,38 @@ u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
 		line_buff_recon_pix_size +
 		size_left_linebuff_ctrl_fe(frame_height_coded, num_vpp_pipes_enc) +
 		size_line_buf_sde(frame_width_coded) +
-		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded) +
 		size_top_line_buf_first_stg_sao(frame_width_coded);
 }
 
+static inline
+u32 hfi_buffer_line_enc(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+{
+	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
+	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
+	u32 frame_height_coded = height_in_lcus * (lcu_size);
+	u32 frame_width_coded = width_in_lcus * (lcu_size);
+
+	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
+					num_vpp_pipes_enc, lcu_size, standard) +
+		size_vpss_line_buf(num_vpp_pipes_enc, frame_height_coded, frame_width_coded);
+}
+
+static inline
+u32 hfi_buffer_line_enc_vpu33x(u32 frame_width, u32 frame_height, bool is_ten_bit,
+			       u32 num_vpp_pipes_enc, u32 lcu_size, u32 standard)
+{
+	u32 width_in_lcus = ((frame_width) + (lcu_size) - 1) / (lcu_size);
+	u32 height_in_lcus = ((frame_height) + (lcu_size) - 1) / (lcu_size);
+	u32 frame_height_coded = height_in_lcus * (lcu_size);
+	u32 frame_width_coded = width_in_lcus * (lcu_size);
+
+	return hfi_buffer_line_enc_base(frame_width, frame_height, is_ten_bit,
+					num_vpp_pipes_enc, lcu_size, standard) +
+		size_vpss_line_buf_vpu33x(num_vpp_pipes_enc, frame_height_coded,
+					  frame_width_coded);
+}
+
 static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -1040,6 +1096,24 @@ static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 				   lcu_size, HFI_CODEC_ENCODE_AVC);
 }
 
+static u32 iris_vpu33x_enc_line_size(struct iris_inst *inst)
+{
+	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 lcu_size = 16;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		lcu_size = 32;
+		return hfi_buffer_line_enc_vpu33x(width, height, 0, num_vpp_pipes,
+						  lcu_size, HFI_CODEC_ENCODE_HEVC);
+	}
+
+	return hfi_buffer_line_enc_vpu33x(width, height, 0, num_vpp_pipes,
+					  lcu_size, HFI_CODEC_ENCODE_AVC);
+}
+
 static inline
 u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
 {
@@ -1387,7 +1461,7 @@ struct iris_vpu_buf_type_handle {
 	u32 (*handle)(struct iris_inst *inst);
 };
 
-int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 {
 	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
 	u32 size = 0, buf_type_handle_size = 0, i;
@@ -1431,6 +1505,34 @@ int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 	return size;
 }
 
+u32 iris_vpu33x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	u32 size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size         },
+		{BUF_COMV,        iris_vpu_enc_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
+		{BUF_LINE,        iris_vpu33x_enc_line_size     },
+		{BUF_ARP,         iris_vpu_enc_arp_size         },
+		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
+	};
+
+	if (inst->domain == DECODER)
+		return iris_vpu_buf_size(inst, buffer_type);
+
+	for (i = 0; i < ARRAY_SIZE(enc_internal_buf_type_handle); i++) {
+		if (enc_internal_buf_type_handle[i].type == buffer_type) {
+			size = enc_internal_buf_type_handle[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 static u32 internal_buffer_count(struct iris_inst *inst,
 				 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 94668c5b3d15fb6e10d0b5ed6ed704cadb5a6534..e4fd1fcf2dbf25e69d55599a8fd4ad775f9e6575 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -146,7 +146,8 @@ static inline u32 size_h264d_qp(u32 frame_width, u32 frame_height)
 	return DIV_ROUND_UP(frame_width, 64) * DIV_ROUND_UP(frame_height, 64) * 128;
 }
 
-int iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu33x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

---
base-commit: 58717ecfffd642c1e0950dee4a247dd6cdfeb31e
change-id: 20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-10173f4838e3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>



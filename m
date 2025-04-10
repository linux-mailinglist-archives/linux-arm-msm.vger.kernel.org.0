Return-Path: <linux-arm-msm+bounces-53868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76128A849AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 18:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73FE47B3FC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0761EFF97;
	Thu, 10 Apr 2025 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZaP7lrx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681701EF376
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302614; cv=none; b=J7T5sy6+I19hKF8ZTFcB3mgsvZl/5LoyjRjVEue9L630DVuOpI3tWvcYofte7oqFYYUUGY0S1ABs6zM4xMmEEHrL2kRlEIpNTVqvFoPxEt6kQgWdZZIaDiV8kT0GK3hY3I8ANBeKtHjixpkBWhyiUq9670SMWh80U6xq3TFbp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302614; c=relaxed/simple;
	bh=L4NXBpzPMKFNxMKi5oizC54iyk+GaNvSqVtucu7YlsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8X4h97Fb+6m/qeUXQnEhBSkAKN2wksETMR4TUP+RDfqLW3ia3UX+5JUK7juB72rAbtzLqw2eBqlxWvHMYKGijVNY0+jbjI7Qt2qV9xhJ9VXPUm88Ozxk20LbVcfCugu5I5s3rJh2PObq1sh5z9HgNwwpFg6g0WMphQP5MUiKjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZaP7lrx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso7416775e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302610; x=1744907410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stq3gy3C89gBLCbNpoC1WtQHytzE8kSphcRK2tdRkZU=;
        b=xZaP7lrxgGTX9JAONUp42ojzJ3k2ikSc+4gU40ZPRyg9aFwP6Kt/KYyiC2JM69QLNR
         1eElPBctdJeFU5VH/LVvl4Zs8UWtzImd3auMdgG1TI0vP6PgAcg3jJmKWZo6VA3EcWKu
         9vPyQTzg4FEqVjuwVD8h/9OM7f/jCLKEcDOa2cyDm1P67ja9AwG8VlrD4W6oAvIsD5sA
         eCN9ADOP4cqFKMHuiFitCzvwKK17KtY+7rLZmSFYkgTfCp1cPVzHoHDN+NMSWlDbTD7C
         C/YEWYeooHQhve/ZSRqtsgdTR3KV0t18ZwfJoK4pD+5/7owX3iZ50OtG1/GApskevnTM
         2Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302610; x=1744907410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stq3gy3C89gBLCbNpoC1WtQHytzE8kSphcRK2tdRkZU=;
        b=a9JXK3mbDFFenow79xZq9EMdQUX6PKC5be1YD7NGxIaHtfNZ+R3J8erw5FBSNHP3go
         oxOq4oj7WoiCRsKhUFjy4mSYcEg3495t8LH/x1JTMaBMiHG9hGUrOls0H3QTmRbfZPLu
         fTfRkYSGShE768Eyl9w1RRbg9GmbubW6+UCb5CND5s4MdEJljawitc65A+6VwT0d+DdC
         a7jJ15ItcWWKLefPBhcqHeYvlOAxl83kORaAMpSJC10VTMLHglTz+llv75DmTh8yRamv
         1BKV8w3mHaMOFE+vSBjvLMljBRrfbN1dosm0arlPhCG4pna6StSolHozDU2ZZhyWCXLQ
         /Byg==
X-Forwarded-Encrypted: i=1; AJvYcCV+nks+kWqtKrJMgRrmwcR4q0EzfRHHDfRcu4JkYRbMcKnYf/rkZfudH4reLQbwqOYzd93KSUdmz8Z8ejS1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/x7jRJOgnjtMePlZuRSyR+hZSKslWNYFRbHK4UYq9C6LmYcz
	YndB8zwwsQsNCLQE+FuB8p+r+RT3C5VRwOR4Zl/FdEjd/sl+Tad1Lf4Jt0OmXn4=
X-Gm-Gg: ASbGncvRmNxqGmHZhNXeHhFHgka4wznKujQ9uhZRxDSDtb3UlYh8BkQF4DjXAQJysYB
	sPJaAYDGH/8NtF+6GlR0+20Paio/FmairtVXwqsgvy/N36kf7NXFctMvzeIWdKugKZi5XiKuhSI
	Cf4weCakTZy6juxSIxzv4JVLVQiQ2JQqN8kqkltHP9Dmq3LM7NKRVmrnFNz7uw2Ei1WM/tbXX6z
	S2REBmbBSStLG1yyfMrvMRvcl5pADS6KnB8C/lleeXs9koWPQigbh6+sHPe2RCTw7b5DTovbum9
	uiv6XgBJSlGIdsCRARP4omu8WsB60gR/DC/ls8SqLx97pTZ2HBpQ9JjXdxWi4fqqJJZXB68U
X-Google-Smtp-Source: AGHT+IFmLMreu/PX6gbj+vVUdVfkhJz3KnC+d9rJ+ne/nkWs0nvjTnHvLHfgwvW0aBBJ3zngwn5A0A==
X-Received: by 2002:a05:600c:350b:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43f2f0283cemr31704965e9.4.1744302610494;
        Thu, 10 Apr 2025 09:30:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8936129dsm5350663f8f.18.2025.04.10.09.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 10 Apr 2025 18:30:01 +0200
Subject: [PATCH RFC v5 2/8] media: qcom: iris: move sm8550 to gen2 catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-sm8x50-upstream-iris-catalog-v5-2-44a431574c25@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9291;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=L4NXBpzPMKFNxMKi5oizC54iyk+GaNvSqVtucu7YlsU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9/INaOefYh4X6fHWldzKKbLL1CkFKQZgGtWfq7X0
 qM55IY6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/fyDQAKCRB33NvayMhJ0RL+D/
 9zEaAjnZBFGe8gFlUKzIXOvbEsGV/mi2eG5S+8I9yaKDynkSAua9YLXDEnwXO2Y+yw5GfPxv+m1wuC
 szV2IoKY+AdyXOm1GN2z9agiRD/uoO0bndPeAILKtFtJG22EhAwk8m4Zz4IFfLiyIMqHG2F6+aLiK2
 ryxIFZ//YKO2Fk3X5vn9hOD7VE+8sll+J/LaPTG/QW0OnLm0DKVXFKkkjk51LFYYJt4rEEd48C1Nse
 7YjwVt2TQtyX9tSnQbPBmzE8x8nL2/pflywS9aNEkRli66Zq10exLn1kqI74LenUcFFmdlDzE6NRB1
 wm7ePzbzWOoSSqilvXQzk71CyAm6gp3b625YYqnvN8MJiGEWgesRigSVH4tyms5kxEu1UdX0lbTtx8
 m54KUm8R/QeROlZ2dwqm8ZgtHbQ1rghMxLRZme19NixySS+k3DFWdUjHjtu4CBW5zu/8WqaBu3dFQI
 0YrlOsYhVMtlfkRNF5/XuvqkvSTR1I+nO1jiIzCBP1JZqqZI8Ap29MmBGRcQ0iQ06Xu93dGibmOr4F
 u5CeFiCTcSzIF6wPc7yhXweLGzWtunq8Ea2veG2uTSFBwAEtmgJyzwS8QzfKebIyoWAxHhLI/cz9yc
 u0Y/Rt4jWs2AJRFpBCL0EfcbfUj94uzmmJokUkldekKaFJ7XQNNDgzLK5jeQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Re-organize the platform support core into a gen2 catalog C file
declaring common platform structure and include platform headers
containing platform specific entries and iris_platform_data
structure.

The goal is to share most of the structure while having
clear and separate per-SoC catalog files.

The organization is based on the current drm/msm dpu1 catalog
entries.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile          |  2 +-
 ...{iris_platform_sm8550.c => iris_catalog_gen2.c} | 84 +-------------------
 .../media/platform/qcom/iris/iris_catalog_sm8550.h | 91 ++++++++++++++++++++++
 3 files changed, 95 insertions(+), 82 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 7e7bc5ca81e0f0119846ccaff7f79fd17b8298ca..379359c5c7e1e4ca39b1216335cd8cf2317b6308 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,7 +10,7 @@ qcom-iris-objs += \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
-             iris_platform_sm8550.o \
+             iris_catalog_gen2.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_catalog_gen2.c
similarity index 61%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8550.c
rename to drivers/media/platform/qcom/iris/iris_catalog_gen2.c
index 35d278996c430f2856d0fe59586930061a271c3e..c3f8ad004cb7f9317859b2594640c7138dbb6534 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_catalog_gen2.c
@@ -10,8 +10,7 @@
 #include "iris_platform_common.h"
 #include "iris_vpu_common.h"
 
-#define VIDEO_ARCH_LX 1
-
+/* Common SM8550 & variants */
 static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
 	{
 		.cap_id = PROFILE,
@@ -132,35 +131,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.num_comv = 0,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
-static const struct icc_info sm8550_icc_table[] = {
-	{ "cpu-cfg",    1000, 1000     },
-	{ "video-mem",  1000, 15000000 },
-};
-
-static const char * const sm8550_clk_reset_table[] = { "bus" };
-
-static const struct bw_info sm8550_bw_table_dec[] = {
-	{ ((4096 * 2160) / 256) * 60, 1608000 },
-	{ ((4096 * 2160) / 256) * 30,  826000 },
-	{ ((1920 * 1080) / 256) * 60,  567000 },
-	{ ((1920 * 1080) / 256) * 30,  294000 },
-};
-
-static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
-
-static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
-
-static const struct platform_clk_data sm8550_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
-};
-
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
 	.mal_length = 32,
@@ -214,53 +184,5 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
 	BUF_DPB,
 };
 
-struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
-	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
-	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
-	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
-	.icc_tbl = sm8550_icc_table,
-	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
-	.clk_rst_tbl = sm8550_clk_reset_table,
-	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
-	.bw_tbl_dec = sm8550_bw_table_dec,
-	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
-	.opp_pd_tbl = sm8550_opp_pd_table,
-	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
-	/* Upper bound of DMA address range */
-	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
-	.inst_caps = &platform_inst_cap_sm8550,
-	.inst_fw_caps = inst_fw_cap_sm8550,
-	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
-	.tz_cp_config_data = &tz_cp_config_sm8550,
-	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
-	.num_vpp_pipe = 4,
-	.max_session_count = 16,
-	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
-	.input_config_params =
-		sm8550_vdec_input_config_params,
-	.input_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params),
-	.output_config_params =
-		sm8550_vdec_output_config_params,
-	.output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
-	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
-
-	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
-};
+/* platforms catalogs */
+#include "iris_catalog_sm8550.h"
diff --git a/drivers/media/platform/qcom/iris/iris_catalog_sm8550.h b/drivers/media/platform/qcom/iris/iris_catalog_sm8550.h
new file mode 100644
index 0000000000000000000000000000000000000000..e101eed6568bfc7c62651491daad0e9e5b0224e5
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_catalog_sm8550.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _IRIS_CATALOG_SM8550_H
+#define _IRIS_CATALOG_SM8550_H
+
+#define VIDEO_ARCH_LX 1
+
+static void iris_set_sm8550_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xB0088);
+}
+
+static const struct icc_info sm8550_icc_table[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const char * const sm8550_clk_reset_table[] = { "bus" };
+
+static const struct bw_info sm8550_bw_table_dec[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
+
+static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
+
+static const struct platform_clk_data sm8550_clk_table[] = {
+	{IRIS_AXI_CLK,  "iface"        },
+	{IRIS_CTRL_CLK, "core"         },
+	{IRIS_HW_CLK,   "vcodec0_core" },
+};
+
+struct iris_platform_data sm8550_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu3_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps = inst_fw_cap_sm8550,
+	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
+	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
+	.input_config_params =
+		sm8550_vdec_input_config_params,
+	.input_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params),
+	.output_config_params =
+		sm8550_vdec_output_config_params,
+	.output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
+	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+};
+
+#endif

-- 
2.34.1



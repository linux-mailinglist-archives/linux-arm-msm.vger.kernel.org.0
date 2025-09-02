Return-Path: <linux-arm-msm+bounces-71606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97717B40115
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A8CB2C68C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411D42D4B40;
	Tue,  2 Sep 2025 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWfFcF9S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AF52D3A83
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817129; cv=none; b=gBIqhK6P9C2LOqLp7rsf9OCHA0wVTyKQj+P/lI1pqCup/2luFxtp7+8hpJ19poPsdu+HGooBXkFMKawRycQ2RAuEePirZI99bZq8qcdT/XafoDKD4Eqwzv3S8Sh3rOncFXLSKlbbIaYBH71Nlq9Kd/V8frX/0R/62IpN8gUW6gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817129; c=relaxed/simple;
	bh=VZQ4ELVPUmo2efaMeFbeCai9/IPENTLQO28nskakbVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9v3jshyThufsWGs/MhQwED9f9xGgonobhQ7uia38VWTsrAkZzCfMo2I16RksADT+7M8GkEha4MEyz1NEfxKkabNUF7+ckJSPaZpntI3ehShe881GppI/cbuwhA04UKrrwFu5zo0Au9DI80STVsXkM7unUYftUpQ3sr9sXiXvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SWfFcF9S; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0446e57a18so15352266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756817124; x=1757421924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GSgKk1JDDv4nRZbPfRESW57BpI7ykwuBRQNxHYtSrc=;
        b=SWfFcF9SUWi2wTdOeBaSSWWaMrxvENEe1mOGTMnVx4x2yYBWnzMk2JSezO8bYlC/wf
         p6NlH5ECeEKEPcWKrXnUBtpgiv6NPqPB9Mm9wZQYf8HHsUybr8lbqRhieFkf0TKgiQR+
         G4VFG50DTv8SZE++t9lsEX7ZmTQNC0ylJoWQm3k6WXA/ndqFSpTHlKB1RAkO8+czDjxL
         LfSZNkF7WjkbUnjH5IgvAKntmBrR8vKGQj72hHPlvInZohU50pIWlegQTYcQU9J49mBs
         oZwx5F8B1H5BzCGFM99sdtCZ9tEcZ0t7hN0KDumNFwZrkgm4eyISs9riqqP9g2V4dSPV
         irxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817124; x=1757421924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GSgKk1JDDv4nRZbPfRESW57BpI7ykwuBRQNxHYtSrc=;
        b=q5sKpkp4XCD20TjdkBnLasbqj2yE1FRsGgPXL/eeW7UWvVDKDdOsd67JMKT8ReTSkS
         Rovcnhx0H6gD2/4D6EHcJ/1zp7rFVPUCskLCf9TLO1WOcjuwHPU4JRu5fMZhKMamG98d
         SmBZHrOlpnoLfsD1SxowobvcbOL3t790nMCJ0AQq60DqxyAXXcxxgLGxLaGJrH3dfvLg
         qQR0r7QhVD5+kpoVvkSJHzoEjWTaPQ/+8yFWdEyrCU6j7vRWGvUFmYEj7WNdsEQuZCmi
         o7yGhnkAwM1X7z0cP7gvhR9hTFou3JubY5tZFP84OUNXgermYSZxxD9AHk1y/sHCZDe1
         Zvww==
X-Forwarded-Encrypted: i=1; AJvYcCUjHPs2wBT3RTSpXbrUioj+eyXhr5wrvUyve0s2+gmZ0oiUfQCguF/yDxn2vBE11UIUEn5Ls0vuE9+xhgha@vger.kernel.org
X-Gm-Message-State: AOJu0YwWUepu3T1AxUYhdSeWR1uKNk07NEVc5iokG5jiWdAZVJpw7zru
	eKR5wh0jCVLPGWguiMp89q814lVnH3T+Ib8i9dOLr1T1w1pk7enIothFZR6A9R7kMLo=
X-Gm-Gg: ASbGncuOskwNEkeMrV0bF1nCZzweuZ/dGemsmFPUPQf+jH+rhX9ioJ+VzJbjXmhjcsj
	xOcuCurpV7ZfjxCuUMlOu8wpKsQyd+US7bxrf9oURhywZdVru88HTSyX7u9Oer9/C3Vyot0PTed
	EwIqalR6w1Yh3SmPdoQbEBG3jf9yqkddMynFZer68YU3lIYXwwCCpOJxD3H3jn4amkIIPxhmFhJ
	iAxH2LAQuc5xqLABJZ+zRvOj9Fm+iQOoE2FIZ9vJ4JoXXSGG3i96UvLzXM078hkrbXa0tuTObiy
	kMCtXVHLhRmAfJdXFBKCZxPgyAnI7R6zDFUfjXY9fx1Cj8kGDBrPHzFPmWkKwdoa+fneCfwFjDE
	z+dzUPKtb5VAsNmN2Y+x3jaSls2s0usdS9W9vXDOfnPoGl5c6sw==
X-Google-Smtp-Source: AGHT+IEcpwxKmxrGGQMtY/C7wFXsbTNNCIgvEMIMkcqQ/ToE4qiOI81AQgVesXyOlXkhY8wARUgVIw==
X-Received: by 2002:a17:906:4785:b0:af9:5a1c:fee5 with SMTP id a640c23a62f3a-aff0e28e4e5mr775032366b.0.1756817123561;
        Tue, 02 Sep 2025 05:45:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0428f88a61sm515784866b.70.2025.09.02.05.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:45:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 02 Sep 2025 14:45:12 +0200
Subject: [PATCH v3 3/3] media: iris: Add support for SM8750 (VPU v3.5)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-sm8750-iris-v3-3-564488b412d2@linaro.org>
References: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
In-Reply-To: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15710;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VZQ4ELVPUmo2efaMeFbeCai9/IPENTLQO28nskakbVs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotubbKf4Zz+EojZGGyIuLQwprW8YbQQ8ND5IaN
 bFTqXZdG0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLbm2wAKCRDBN2bmhouD
 179AD/9dPVMgtKtYvZ4mSVGV5LRI4A1D8aNOALekzbNVYy22wnz5MeKQ78mHko9iKwMdQWoZX/B
 Gl7NP3DmhgEPgoVAmK7AQP7jiaElbxEPWSpfIWt7UX9WE2p7iHlzujmZ8oTTvEesHbVJM3Ysvft
 zN2vxHElzkjcIZ21QhSAPOi2g0PxIipJ5uMujz/Te3Q76G4skFhARHZUDq4MQ7Fu5Aarvj3R8gM
 228yaxGb4gwLkTjw3gUbiMBAIm9bZpG0ujjN5hfvUzJYJ2fpzwGKg9EWh4TXqw+PHMGoHdpQIDV
 F8zj5hWhtOKce4dP/kovD4lG9Udn1Ivr2lOszhfjCAIG8e+MH0dCIH5FY3P6CP3DSh1qRm1nRGD
 Z2VQDNecmV6e00JyEdHsjHUS+yxNjIYAepMWBjvEa4wldj6yoDiM+PGTQTXnRK0Nq90jsN3P1X6
 S3DwfkPMpJr+iiWgPdn3Ahu4QkAQVfKsolvqSSnC5jQsQzc6+5gJ2Xz2Njq4EAVCTK99cYf1LSI
 aNielkbfqaPZuJplia2BAPrD7Bf4Y+OOpMvg6BX8VJMzu1xTpU9AJ6mfkDnhf8+WoGYOCLc3MPJ
 vIh2mcXThLIZgte+lv0b+E7KU271CIjgyhIsFv1imdC3MqJqgYAAyOwxzlUrAVENKfTvUx7j9JO
 KZ/EqWcX3kF31JQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for SM8750 Iris codec with major differences against
previous generation SM8650:

1. New clocks and new resets, thus new power up and power down
   sequences,

2. New WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0 register programmed
   during boot-up

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 +++++++++
 .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 166 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 7 files changed, 271 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index adafdce8a856f9c661aabc5ca28f0faceaa93551..fd5a6e69e01cfd00253f4ffb282d40112b93073b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -38,11 +38,15 @@ extern struct iris_platform_data qcs8300_data;
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
 extern struct iris_platform_data sm8650_data;
+extern struct iris_platform_data sm8750_data;
 
 enum platform_clk_type {
-	IRIS_AXI_CLK,
+	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
 	IRIS_CTRL_CLK,
 	IRIS_HW_CLK,
+	IRIS_AXI1_CLK,
+	IRIS_CTRL_FREERUN_CLK,
+	IRIS_HW_FREERUN_CLK,
 };
 
 struct platform_clk_data {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index d3026b2bcb708c7ec31f134f628df7e57b54af4f..c7c384fce2332255ea96da69ef4dc0bc1a24771c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Linaro Ltd
  */
 
 #include "iris_core.h"
@@ -12,6 +13,7 @@
 
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
+#include "iris_platform_sm8750.h"
 
 #define VIDEO_ARCH_LX 1
 
@@ -463,6 +465,72 @@ struct iris_platform_data sm8650_data = {
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 };
 
+struct iris_platform_data sm8750_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu35_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8750_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8750_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu35_p4.mbn",
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
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.output_config_params =
+		sm8550_vdec_output_config_params,
+	.output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
new file mode 100644
index 0000000000000000000000000000000000000000..719056656a5baf48a7bced634d2582629333cf5c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Linaro Ltd
+ */
+
+#ifndef __MEDIA_IRIS_PLATFORM_SM8750_H__
+#define __MEDIA_IRIS_PLATFORM_SM8750_H__
+
+static const char * const sm8750_clk_reset_table[] = {
+	"bus0", "bus1", "core", "vcodec0_core"
+};
+
+static const struct platform_clk_data sm8750_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_AXI1_CLK,		"iface1"		},
+	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
+	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4e6e92357968d7419f114cc0ffa9b571bad19e46..5fb936a04155e72f4298cd6760eff6e9d1da6310 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -353,6 +353,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8650-iris",
 		.data = &sm8650_data,
 	},
+	{
+		.compatible = "qcom,sm8750-iris",
+		.data = &sm8750_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 27b8589afe6d1196d7486b1307787e4adca8c2aa..339776a0b4672e246848c3a6a260eb83c7da6a60 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Linaro Ltd
  */
 
 #include <linux/iopoll.h>
@@ -24,6 +25,8 @@
 #define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
+/* VPU v3.5 */
+#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 
 #define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
 #define CTL_AXI_CLK_HALT			BIT(0)
@@ -55,6 +58,8 @@
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
 
 static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 {
@@ -253,6 +258,158 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
 	return 0;
 }
 
+static int iris_vpu35_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_hw_free_clk;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	if (ret)
+		goto err_disable_hw_clk;
+
+	return 0;
+
+err_disable_hw_clk:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_hw_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+err_disable_axi_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu35_power_off_hw(struct iris_core *core)
+{
+	iris_vpu33_power_off_hardware(core);
+
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+}
+
+static int iris_vpu35_power_off_controller(struct iris_core *core)
+{
+	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+	unsigned int count = 0;
+	u32 val = 0;
+	bool handshake_done, handshake_busy;
+	int ret;
+
+	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
+
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	/* Retry up to 1000 times as recommended by hardware documentation */
+	do {
+		/* set MNoC to low power */
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+
+		udelay(15);
+
+		val = readl(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS);
+
+		handshake_done = val & NOC_LPI_STATUS_DONE;
+		handshake_busy = val & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+
+		udelay(15);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+
+	writel(0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+				 val, val == 0, 200, 2000);
+	if (ret)
+		goto disable_power;
+
+disable_power:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
+
+	return 0;
+}
+
+static int iris_vpu35_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi1_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_ctrl_free_clk;
+
+	return 0;
+
+err_disable_ctrl_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+err_disable_axi1_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu35_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
+}
+
 static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
@@ -305,3 +462,12 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_calculate_frequency,
 };
+
+const struct vpu_ops iris_vpu35_ops = {
+	.power_off_hw = iris_vpu35_power_off_hw,
+	.power_on_hw = iris_vpu35_power_on_hw,
+	.power_off_controller = iris_vpu35_power_off_controller,
+	.power_on_controller = iris_vpu35_power_on_controller,
+	.program_bootup_registers = iris_vpu35_program_bootup_registers,
+	.calc_freq = iris_vpu3x_calculate_frequency,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 6c51002f72ab3d9e16d5a2a50ac712fac91ae25c..bb98950e018fadf69ac4f41b3037f7fd6ac33c5b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -84,6 +84,7 @@ static void iris_vpu_interrupt_init(struct iris_core *core)
 static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 {
 	u32 queue_size, value;
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 
 	/* Iris hardware requires 4K queue alignment */
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
@@ -105,6 +106,9 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		value = (u32)core->sfr_daddr + core->iris_platform_data->core_arch;
 		writel(value, core->reg_base + SFR_ADDR);
 	}
+
+	if (vpu_ops->program_bootup_registers)
+		vpu_ops->program_bootup_registers(core);
 }
 
 int iris_vpu_boot_firmware(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index d95b305ca5a89ba8f08aefb6e6acd9ea4a721a8b..d636e287457adf0c44540af5c85cfa69decbca8b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -11,12 +11,14 @@ struct iris_core;
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
+extern const struct vpu_ops iris_vpu35_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
 	int (*power_on_hw)(struct iris_core *core);
 	int (*power_off_controller)(struct iris_core *core);
 	int (*power_on_controller)(struct iris_core *core);
+	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 

-- 
2.48.1



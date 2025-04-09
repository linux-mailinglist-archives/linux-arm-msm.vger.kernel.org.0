Return-Path: <linux-arm-msm+bounces-53653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D31A8283B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 16:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE8E1891C52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19425268695;
	Wed,  9 Apr 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FCy8/PqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4092C267720
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209512; cv=none; b=qgVpBW23cueZc2JYyu7JQUoJcvwuHTfufYbO5rInp66yVe75mCGgnNz1lvcbVvndec2e5IlvZl6rOQ0OaN90BTEhbxnmoSbeGZTRka0PN3h6qNWIaNF4KC+XoJHfTZd8hYVqMSdfL6c/Gq2oHLfcey7pwZSnA1I8Bqr3QlMIOX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209512; c=relaxed/simple;
	bh=TwpN7WB7TovIb/Aom4JEIlovlaaSBos+8c3GTGn1tRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXwMopn4e7gNqldYjWWM/Gsdg1u9+MShOonPMzRaFwJlG2qsO/FZStvJNLTlLFnsBfeJv7+8d3wlmil5k9xgte4kQNiL4g8WR8xNo1+8ZO9S4zapbovZR/Lf9HY1BZUWqm1mWnsciI/14Vilkms8A00+jIJTGCJwP42cfhLQ6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FCy8/PqM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso46374865e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209508; x=1744814308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/NF1ZydIUvd4N7KqoBnhLoGbjaoZN62+JonM5wUK+o=;
        b=FCy8/PqMbX5ucH/jMP94cZMRQ/WwO+Fo0CV6n6hZ5MHfKfHuR4IS+WjQTVwSWp3aYW
         gr5YU31k6JNUrv5v35ecwMs5xGDFpoPdzNGveoY24BlSMFjPR2XHQUWj4/Xv4tOkXqo6
         G4k7/l3m+3SizudCr4xM/if/u2uzVuYLnjLu/hG5soK1PatVLuBFrRNYg+yHahRj9F4D
         N8k/VTyiiQygP76RyRWtaXCdeyMSRaHIrURzgRJiAE8lrdOVKjk07bRUaS5teKt2/zje
         lVnaRzP/AyYQdrUJPykYyq9bdZJJq3DArHz3TVBPVmA9Z8gLDH1dOhhU+lQ7uC7JSgYT
         Hyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209508; x=1744814308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/NF1ZydIUvd4N7KqoBnhLoGbjaoZN62+JonM5wUK+o=;
        b=Ty219C7WmqCOHi9KbI8GtOjMB4NCbF9Zv7lfc0KyUBrA4vDu+RdWZ5Loq/vIc84a7M
         31WAyqhD5Po4WEGBzfLzq3N0lWxgqFoEIcEn1w+Z9RJRwK05F7IIxZN3wC8EKLlKARy7
         Ul/uQlvWb99Csl96Vh9r+v+MpxyHA5llj4mRopucCMXGrFDtkVXpumeiX2GVnTfgcTCY
         Vu+5DC7TmZstPYSO3wTvu1x1bhmytMpe9gUFjc8UckzqIb4y8AnWtFELSwL+qwfRamkX
         PI/FpgHIR4ssHf6P6hmc27vaXxTETSYT47qMencG9jBFbaoRpM52ox4yWpVn6yT9mh4c
         OW4A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ3J+MtWsa1dAb1ndiz4ZVuZ3Gxj6wThSgrgyxnFvM0wMkdyKmjYN8XC0hU0PMZaB9SjLdxd4otxNguAtY@vger.kernel.org
X-Gm-Message-State: AOJu0YzRLYHYbLnlQkSQK4AsYZD+1hCkW0YXKjQJt08RcfUUT3IeL8Cc
	ELOuJUp2eFyUVZEe0uZLZwGkWakiTmzvqAf0tQ5XG1nJeu6gx8Vb2xrg8tvuU0E=
X-Gm-Gg: ASbGncuGh/RO/Vce633MOwU9isDAk6JqU8pP6LrRc7m/aXF56sCNt6Hli+5hx3dx/K+
	kjWHiocuzWWBtyaecu9rBjPrkNf6azu0aR7KEEs9BozLRzXpl82Rtl/U4yqh5tkAkxtAm0GqAUl
	3HFbk99nunRnXrjFu6nhzlEto4fnehi6xkLDXpMO0g9IYMVtA/NL4Ya/pYGlJ+0bhIw3w/M63/T
	4kURawVKD8Lp/ZxA9mi5kWLRPoVf52v07D6ofe7gIXR4JlddJ562JQm3tBMYRUXOZwULMKAD4k7
	F0DkplrfbcN/Myy5RyYtBep1J5k/fX+NXbsGb+v9D6DtZ0PI/fkD14aQUSG1Lg==
X-Google-Smtp-Source: AGHT+IHt3tWE71LTEXVzyHw+QWXDZ9BI265fKqAiFU8xitCNid8MP3TrNBem8f3KAvrsA4uSKRbRSA==
X-Received: by 2002:a05:600c:5486:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43f1ed4b4a3mr25024705e9.25.1744209508072;
        Wed, 09 Apr 2025 07:38:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625ea4sm22222045e9.12.2025.04.09.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:38:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Apr 2025 16:38:24 +0200
Subject: [PATCH v4 6/6] media: platform: qcom/iris: add sm8650 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-sm8x50-iris-v10-v4-6-40e411594285@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5286;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TwpN7WB7TovIb/Aom4JEIlovlaaSBos+8c3GTGn1tRE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9oZe3DEOvpC5qTMwP/UIE7//HGWGN9GM6J2n2dOY
 VR0lkTeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/aGXgAKCRB33NvayMhJ0R6eD/
 9lB6rU9VZKyLFyyWymyblecXKQW0WaRzZfJOUXMmif3MPclwBLvOBY8Sb/UskWRE7QUDaBMoFeioxx
 ncGWanh3zYUdMR8wUIff0GmbgACaxujafsGN2tu6GSRayIMyuJit1pITrF69kw8W+5SzNvqtWGlR/s
 WeH5YDNdWu5th18zSZCbVOOAkmJAZoE9s6NAu7bQqeVBMZgrBJhWDQ0jVuOGgDIpywSyVudzyGT7Ow
 SksVeyZGIhDYN0zg0XVrRX4FUVehDdAAgwB8qR1AXY9QETkbhhMV/TkzOcY/o9xcLPb0EMPJqUhatR
 gDfczcmUfjbE0syD6WR+FgsnGAQK4djhoHP/eHXVDwTcIpf0Q92/X59wenrL3884We05N6+6Ab807h
 UwpyOYSHCipe9iPXK1UMQPAwtZTcSZ2uXtC2qgyoRiFNRhS9jgSWXhjcy41ZBUhuLhBHwOc6/uuZQC
 s2sr/FhepzlCEmhWrnU80m8cf7RUD6skVCvpN8uKLepAMeUqkb/PcyBi5yNFRdX3mGBX+/dljc+6P1
 7HGQI9i0bhMjmzD//8gBTDolkK1+G05JuvstsmdqiXMvmLE+9dEOwDxTuIZIonJ3qfTytDIbmrGhaZ
 CjVprkEmDWliwWDxFgrUZIOWJ/mXUpabHMNbOygJ2YPGG1F7aumHeOxWU8Uw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the SM8650 platform by re-using the SM8550
definitions and using the vpu33 ops.

The SM8650/vpu33 requires more reset lines, but the H.264
decoder capabilities are identical.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../platform/qcom/iris/iris_platform_sm8550.c      | 64 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 3 files changed, 69 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -35,6 +35,7 @@ enum pipe_type {
 
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
+extern struct iris_platform_data sm8650_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -144,6 +144,10 @@ static const struct icc_info sm8550_icc_table[] = {
 
 static const char * const sm8550_clk_reset_table[] = { "bus" };
 
+static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
+
+static const char * const sm8650_controller_reset_table[] = { "xo" };
+
 static const struct bw_info sm8550_bw_table_dec[] = {
 	{ ((4096 * 2160) / 256) * 60, 1608000 },
 	{ ((4096 * 2160) / 256) * 30,  826000 },
@@ -264,3 +268,63 @@ struct iris_platform_data sm8550_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - vpu_ops to iris_vpu33_ops
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - controller_rst_tbl to sm8650_controller_reset_table
+ * - fwname to "qcom/vpu/vpu33_p4.mbn"
+ */
+struct iris_platform_data sm8650_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.vpu_ops = &iris_vpu33_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
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
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
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
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
 			.data = &sm8250_data,
 		},
 #endif
+	{
+		.compatible = "qcom,sm8650-iris",
+		.data = &sm8650_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.34.1



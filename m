Return-Path: <linux-arm-msm+bounces-54430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D30BA89FFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 15:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 307BC441F7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BC819D890;
	Tue, 15 Apr 2025 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbPvOTEu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415E41EF380
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724888; cv=none; b=G4sGlf5jz3cgQJlAhK7DssGDvAdG3DXgHs/HE0TBV++LXnKjcetvIba9vEE9w0jeQ0G4izsgNSzqbFtUx3b5lGIuV9tFAkfgO6wuGRlaDsWJ39wlkE96Xv32GR27RGnMhvvc3Xn4Ud7eggb3yqDLI/13f8z8oEvaf80tXZ2sOi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724888; c=relaxed/simple;
	bh=x3wKOI+1ZrPfkShLd9Am24DbDrMkhm6DgUV9n49PlY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnxLtSqBuEVEC6QY5D+/1Y2mPApYPalEZVnMyLlr5EGn0S1PpUaku8wd0t9f0JkRR2Vk58YNfwdqobcPN1RG+k1iFUtj+zG1WTQqObs1zj3mSJ0QCaJHdtBh8ppYqaT9nAUOiR0HJ10fnWDgJOSBWQ9DpMm4/sTMmlOivXRZ6Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbPvOTEu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so30522315e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 06:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724884; x=1745329684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+FiVklT7IYe+jV4Sbf0wBSLR5dUd5EreBR2zi35Wo0=;
        b=YbPvOTEuQOMiFV2s50Oy6Yc6XUZjc8j+oTbTo1D3pfSS1iWgWYCtcnWKbqZWuq2NnS
         GVLl22EYJAYtFu0Iyq00YFkAFyR757theWGgzCgjTarB6JfOf/5dBw1zf7NwFz7HxFkS
         2DtG7dVrcfwNoRJO//5um7BncadIFKVuAm0VLustzYi/vJU/1+WkdmkHBhU5MugrZXvL
         45aHRyuKSFM//qJNVwGMaJ5KqdHmHCYrkrM7XNaDpqeOrJJ/obYJ4xJ1QRhJaRZNszND
         hptUtdVQJzxdEgwKlOnG6nmtbZjl/c3zbXWyCaWf6S930H5/1A/7S8x7U8gJCJyvHLvr
         EqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724884; x=1745329684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+FiVklT7IYe+jV4Sbf0wBSLR5dUd5EreBR2zi35Wo0=;
        b=aoP73411k7iyg9bqks7ac72OGuhCKzzMTJmFUCoV0tc3b6QuosXUP58mBg2cChRu4c
         0r22GxlzA4GVjAzE2Oxv34Cs8ZoO9HUwt0/A+C6zOq/GXhY6A+ZubzV8UxowEcNB89Jp
         ssK4yU1aqIiZMaWgeJKKn+fgYF+x47pcDV5EmliDO0KYILHg6kMQJhbvivjXg62iI9eg
         SurKhJIc6WfATkjbkYXfbzA6QEsy5rpr0yM5ddOecFLRthBbRUohZgU3LN6eIbfamlV3
         FZ9JDQTYrj2vt+dDMJGaOaz5L3OUaikudVIpRwCFK6YvMPGIJOx8fFKbPOkVvAWZB3m6
         r9TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyw0M5ft0ytGmagDtwK0kLMvsfh37i0d9D+/+B68ZEnlmaoBjDDBNr36wipmLDpwP2RkBVU9BUn+eKqCOI@vger.kernel.org
X-Gm-Message-State: AOJu0YwhEzhPleehDH0KpZInzvLxlteHhgCOGoR1RJgCoExH1uT6zmex
	UJhCbFjLB5o/dqi5TiHt1d6BCbNJZJDqynsnX7frYMvFbYZRZ57JZThSnOptRkg=
X-Gm-Gg: ASbGncuqCU17lHsCTSa8uP7RAYd0GA2WvjIh4jtGwqtV/ItBEk30IqbsZhQzpcw8Z1j
	YtE202JtS9wxphsSDRKOP6LUxwL/gez/6Y1zdXg//2zfWYeMgIkSlMDMBruZ+TpBaQmk2sGUGew
	3g5grFfXeuY64bllphO77kpLCfEC8ApKBy4lQDmJEBB41IqsFjBw5wj60DnTk5+4oR2KVXJcxDl
	xQozTVNyNppqJtWsTY6fsRxpOaMEoMoJQInhgILtDvmq68OYRMSaV3qj608L7EYNSdfmanwdfDp
	xw3c1d5Q4IQbGC6X80iMyrXfJEmGU4G01dOCfezK5BIjkNfSqdXMZqPAPA9/xRbGQSX8hcbR
X-Google-Smtp-Source: AGHT+IGzY3nAKBrnSHuoBuPGQLg5ScyURISnM193MvtsfOaRNqODf9TXp6e25SCsEQtFqkO4aoIP2w==
X-Received: by 2002:a05:600c:4f8e:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43f7de6223cmr22854845e9.28.1744724884508;
        Tue, 15 Apr 2025 06:48:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d0fcsm210434195e9.19.2025.04.15.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:48:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Apr 2025 15:47:59 +0200
Subject: [PATCH v6 7/7] media: platform: qcom/iris: add sm8650 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-topic-sm8x50-iris-v10-v6-7-8ad319094055@linaro.org>
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7059;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=x3wKOI+1ZrPfkShLd9Am24DbDrMkhm6DgUV9n49PlY0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mONUZzgH07deO4f2rzfXfKjieKGJILOclqxvDF2
 hkMhDxWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5jjQAKCRB33NvayMhJ0blWD/
 94d5sTQTzH9K91KJgIG8KViCpadY1mGdP4qPYzbriFUiYgICRLKMRK52IPJMTOQhyTbPAMDyZZe9Cp
 6JL8Zu6uiqy1XNatfEsBpSF9Hl+D5X4tTBaqp1oy/GkoolOKhW34MV0y3hSzcT6jUf0EwZXg7aHp+K
 c/TdbcKBjXibA6j95cP6oPAvTrX/JuKifB0EVojcNVVt5Flo1Pwh74aM2shfjXrg9XlvwbuZ37+zol
 uoWLdh7NS2u0Jgjld7hPGUTXOWGY3m3ueHA3QDW/Li/bHL+ewr0jqKwd/eRk7OaLW8GBtggQjIrh0E
 NBupDjERrogUknmcvwtH/YBX4msP5e3ChesKhXuqyDClRGAIcr1EpEW15x+MTZ0xp8GqXy0i4C6vSv
 VablDdwggTXOjCCHtBI2L0SgegquTDBQO5Tzl8b35sftNY7S6m3PG0jpAy7j8soxfKXD9XtQJEVvJP
 fO5+5OPFcP3y+fQpyO58oJ1/VDe1giIcVq1SinkNfvEbpXiYFjN+A/V3C+Z7NX8UAB1j5edQGyHGy/
 r0Fhn6/Ame+AWrAvU9YGo9QvdIXa9YLo91hr4gviiuCAnIsOnkdecgiYl5dkKz/H1TezXA+C2zCzad
 WyR+Cn+z4nDm+kSPPNJywtAunKUM73Nx0zeMtNEDnSKSYvj8WyDxQ47w+jIQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the SM8650 platform by re-using the SM8550
definitions and using the vpu33 ops.

Move the reset tables that diffes in a per-SoC platform
header, that will contain mode SoC specific data when
more codecs are introduced.

The SM8650/vpu33 requires more reset lines, but the H.264
decoder capabilities are identical.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 65 +++++++++++++++++++++-
 .../platform/qcom/iris/iris_platform_sm8550.h      | 11 ++++
 .../platform/qcom/iris/iris_platform_sm8650.h      | 13 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 5 files changed, 92 insertions(+), 2 deletions(-)

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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 35d278996c430f2856d0fe59586930061a271c3e..6d1771bd68689d96b5b9087b0ad32b934f7295ee 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -10,6 +10,9 @@
 #include "iris_platform_common.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_sm8550.h"
+#include "iris_platform_sm8650.h"
+
 #define VIDEO_ARCH_LX 1
 
 static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
@@ -142,8 +145,6 @@ static const struct icc_info sm8550_icc_table[] = {
 	{ "video-mem",  1000, 15000000 },
 };
 
-static const char * const sm8550_clk_reset_table[] = { "bus" };
-
 static const struct bw_info sm8550_bw_table_dec[] = {
 	{ ((4096 * 2160) / 256) * 60, 1608000 },
 	{ ((4096 * 2160) / 256) * 30,  826000 },
@@ -264,3 +265,63 @@ struct iris_platform_data sm8550_data = {
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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
new file mode 100644
index 0000000000000000000000000000000000000000..ac8847edb585e4a9ce6b669a3a5988e7809972af
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_SM8550_H__
+#define __IRIS_PLATFORM_SM8550_H__
+
+static const char * const sm8550_clk_reset_table[] = { "bus" };
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
new file mode 100644
index 0000000000000000000000000000000000000000..75e9d572e788de043a56cf85a4cb634bd02226b9
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_SM8650_H__
+#define __IRIS_PLATFORM_SM8650_H__
+
+static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
+
+static const char * const sm8650_controller_reset_table[] = { "xo" };
+
+#endif
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



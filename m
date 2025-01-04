Return-Path: <linux-arm-msm+bounces-43936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF8A0138D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 10:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73C693A3366
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAE813C9D9;
	Sat,  4 Jan 2025 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zIxa/siK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32186F9D9
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jan 2025 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735982498; cv=none; b=O/VU2foRl5oyOyIxl+/hv+1RC1uS7EV7s7reZuxcEaxp976Fn3DfL466kwaB4M1UoXohhSUlbLV5W2S7JOS4ukiRkeQNJAWuZg1ba02BjMVa4JY1WcP/yMmfM4tKib+DWOpc7EQZhO6XgmE4gVj1nEEDqonV2lW3sDPY5BG2mEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735982498; c=relaxed/simple;
	bh=W6/2tEktNJwFuK6+fyz96vjiL36+PKdHNzRt7Y5+BtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XuZ0T2uOUi6lB6gYTEKux6gWBjRPPBlE4LjVZZOYAvjLFAnfxiD9mlNHz/WIfdkUz5rxgm+Q9wghp7I8KidZ27BLjybQVulA1OSBuXN2jvui65Q9LXb3a1IS2XYYp8lmMopX6NNjJDrM5JctLWAc1kWHF+3hzsvJ+MgdSwcMJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zIxa/siK; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3cd8e59fdso2189115a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jan 2025 01:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735982492; x=1736587292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aOHXqLwS45OeaHtL/+WzTcRgOFdSAqSCyaxRmZl+LA8=;
        b=zIxa/siKcmabNSXXfPIuzUSrLB2vsPDUyyjddHUUYIEkkTJWjVaYI5o5/fvXEIb+ur
         iY6+4FPDdV/iEglw8zpk0AvotE4Z1rj/fuvaLOtZ5fj+ivAkRlKSu+h8gQ6raqeNHQD8
         sDjd5Gqeu7DWzrC4WtI/mKQLvEanazqDAEZJeZE+QvRwIMB3MyKH8WOudaAn0olDIN+T
         JpPW3Un9IGAOpt/HX3TqzUg2AxVNgH52QTCVT0gAZafFzc7NskmftmhU50EPqyrnhvPM
         VVqDsOdhJ68De9/qJUjv7Os8CftRYhE0Ok2EOU3LYE2yDOEofnmnrCIKAWAU38AI94pB
         13eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735982492; x=1736587292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOHXqLwS45OeaHtL/+WzTcRgOFdSAqSCyaxRmZl+LA8=;
        b=dO52oHbd42B0V/5X2O6oAKBMt3YdDm8XBRegPnAcf5i018M7tqKnV+HQ3cM8YhQrTU
         JxKYMx9TdMNsapr9mUl3UD+Akx+0hsAwLul/37k/5wpHdPMD/XjlEJXSvslaRB37xxMQ
         ceX+6YGIQgNzODGWsc9onKtXBNQEWDPyJfmDXP2vgrKtoa8SvyNVMvvk0enxbWciBxlY
         JFY5Jd6uKuvUa36P57QEehQUQv+BwHnG0gcGW/wb5k0RSAKqyv3lwetYA0e8FVJAWOYs
         ZvUE8NY0qb+cDVKPD973Rqk+NUGZXQRxdArLVGSKnbivj94BOXFqupGOJNChdgX4OIpS
         Pxtw==
X-Gm-Message-State: AOJu0Yy7OB6ZjoxQjqcg6OeN9umtEg1K2zMmq2edLu5HEvq1x/Qu44bz
	mFvqKn++Vv66pBJvK4G8rSafhVAXQA+wDdSIKUdh5SB7GCDX6nzrf1AP8yLCS90csu5jD8LtvPx
	A
X-Gm-Gg: ASbGnctMTCpR4ziqb8s4p6mypL4cJrKkBXX14pJK/P/7DHvF0tJrhlh0Ng4VdaxLiG+
	M8j8/3sz1aJDdFQSFYD2W/aUa9E+Lfb8aVhzduObMMoU5lOwM9CyHvQs4qrwPalI9Sekk7pKlZ2
	jV9OfQJmsPfhCUsoc9IkqunP8Ne80GxTNzPSH1o/1vBj1taXDeMNamKecMSMbamfOs+a9pnGUs6
	tdFHqKjvNrobkY9eJPAFW6ATT3KFP5g/TLqYDx9BGWTE9YfeDKVdQBSTGySRton4P3gJ4M=
X-Google-Smtp-Source: AGHT+IHyehTVlbuVDyMbXq52Z6iQkXNXH5SQ4ubCQvBZie9fxomZPdn4LlDP40+m3Hdvnu0zNHIWSQ==
X-Received: by 2002:a05:6402:278f:b0:5cf:5ff9:2a34 with SMTP id 4fb4d7f45d1cf-5d81ddc051cmr14540952a12.5.1735982492173;
        Sat, 04 Jan 2025 01:21:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c5a4sm20293611a12.38.2025.01.04.01.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 01:21:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH linux-msm/debugcc] Add SM8750
Date: Sat,  4 Jan 2025 10:21:23 +0100
Message-ID: <20250104092123.5600-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 meson.build |   1 +
 sm8750.c    | 839 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 840 insertions(+)
 create mode 100644 sm8750.c

diff --git a/meson.build b/meson.build
index a4221f46e59b..47fd985919f6 100644
--- a/meson.build
+++ b/meson.build
@@ -30,6 +30,7 @@ platforms = [
   'sm8450',
   'sm8550',
   'sm8650',
+  'sm8750',
   ]
 
 debugcc_srcs = [
diff --git a/sm8750.c b/sm8750.c
new file mode 100644
index 000000000000..a9ba0b8ad604
--- /dev/null
+++ b/sm8750.c
@@ -0,0 +1,839 @@
+/*
+ * Copyright (c) 2023-2024, Linaro Ltd.
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright notice,
+ * this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright notice,
+ * this list of conditions and the following disclaimer in the documentation
+ * and/or other materials provided with the distribution.
+ *
+ * 3. Neither the name of the copyright holder nor the names of its contributors
+ * may be used to endorse or promote products derived from this software without
+ * specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGE.
+ */
+#include <sys/mman.h>
+#include <err.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "debugcc.h"
+
+static struct gcc_mux gcc = {
+	.mux = {
+		.phys =	0x100000,
+		.size = 0x1f4200,
+
+		.measure = measure_gcc,
+
+		.enable_reg = 0x62004,
+		.enable_mask = BIT(0),
+
+		.mux_reg = 0x62024,
+		.mux_mask = 0x3ff,
+
+		.div_reg = 0x62000,
+		.div_mask = 0xf,
+		.div_val = 2,
+	},
+
+	.xo_div4_reg = 0x62008,
+	.debug_ctl_reg = 0x62048,
+	.debug_status_reg = 0x6204c,
+};
+
+static struct debug_mux cam_cc = {
+	.phys = 0xade0000,
+	.size = 0x20000,
+	.block_name = "cam",
+
+	.measure = measure_leaf,
+	.parent = &gcc.mux,
+	.parent_mux_val = 0x6e,
+
+	.enable_reg = 0x12008,
+	.enable_mask = BIT(0),
+
+	.mux_reg = 0x16000,
+	.mux_mask = 0xff,
+
+	.div_reg = 0x12004,
+	.div_mask = 0xf,
+	.div_val = 4,
+};
+
+static struct debug_mux disp_cc = {
+	.phys = 0xaf00000,
+	.size = 0x20000,
+	.block_name = "disp",
+
+	.measure = measure_leaf,
+	.parent = &gcc.mux,
+	.parent_mux_val = 0x73,
+
+	.enable_reg = 0xd004,
+	.enable_mask = BIT(0),
+
+	.mux_reg = 0x11000,
+	.mux_mask = 0x1ff,
+
+	.div_reg = 0xd000,
+	.div_mask = 0xf,
+	.div_val = 4,
+};
+
+static struct debug_mux gpu_cc = {
+	.phys = 0x3d90000,
+	.size = 0xa000,
+	.block_name = "gpu",
+
+	.measure = measure_leaf,
+	.parent = &gcc.mux,
+	.parent_mux_val = 0x18d,
+
+	.enable_reg = 0x9274,
+	.enable_mask = BIT(0),
+
+	.mux_reg = 0x9564,
+	.mux_mask = 0xff,
+
+	.div_reg = 0x9270,
+	.div_mask = 0xf,
+	.div_val = 2,
+};
+
+static struct debug_mux video_cc = {
+	.phys = 0xaaf0000,
+	.size = 0x10000,
+	.block_name = "video",
+
+	.measure = measure_leaf,
+	.parent = &gcc.mux,
+	.parent_mux_val = 0x78,
+
+	.enable_reg = 0x80ac,
+	.enable_mask = BIT(0),
+
+	.mux_reg = 0x9a4c,
+	.mux_mask = 0x3f,
+
+	.div_reg = 0x80a8,
+	.div_mask = 0xf,
+	.div_val = 3,
+};
+
+static struct measure_clk sm8750_clocks[] = {
+	/* GCC entries */
+	{ "gcc_sys_noc_cpuss_ahb_clk", &gcc.mux, 0x9 },
+	{ "gcc_sys_noc_nav_qx_clk", &gcc.mux, 0xa },
+	{ "gcc_sys_noc_tme_qxm_clk", &gcc.mux, 0xb },
+	{ "gcc_sys_noc_axi_clk", &gcc.mux, 0xc },
+	{ "gcc_sys_noc_sf_axi_clk", &gcc.mux, 0xd },
+	{ "gcc_sys_noc_ahb_cfg_clk", &gcc.mux, 0xe },
+	{ "gcc_sys_noc_at_clk", &gcc.mux, 0xf },
+	{ "gcc_sys_noc_qosgen_extref_clk", &gcc.mux, 0x10 },
+	{ "gcc_cnoc_apss_qh_clk", &gcc.mux, 0x11 },
+	{ "gcc_cnoc_center_qx_clk", &gcc.mux, 0x12 },
+	{ "gcc_cnoc_sf_qx_clk", &gcc.mux, 0x13 },
+	{ "gcc_cnoc_north_qx_clk", &gcc.mux, 0x14 },
+	{ "gcc_cnoc_periph_south_clk", &gcc.mux, 0x15 },
+	{ "gcc_cnoc_periph_north_clk", &gcc.mux, 0x16 },
+	{ "gcc_cfg_noc_ahb_clk", &gcc.mux, 0x17 },
+	{ "gcc_cfg_noc_ipcc_ahb_clk", &gcc.mux, 0x18 },
+	{ "gcc_cfg_noc_west_ahb_clk", &gcc.mux, 0x19 },
+	{ "gcc_cnoc_pcie_sf_axi_clk", &gcc.mux, 0x1a },
+	{ "gcc_cfg_noc_north_ahb_clk", &gcc.mux, 0x1b },
+	{ "gcc_cfg_noc_east_ahb_clk", &gcc.mux, 0x1c },
+	{ "gcc_cfg_noc_south_ahb_clk", &gcc.mux, 0x1d },
+	{ "gcc_cfg_noc_mmnoc_ahb_clk", &gcc.mux, 0x1e },
+	{ "gcc_cnoc_qdss_stm_clk", &gcc.mux, 0x1f },
+	{ "gcc_cfg_noc_usb3_prim_axi_clk", &gcc.mux, 0x20 },
+	{ "gcc_cfg_noc_lpass_clk", &gcc.mux, 0x21 },
+	{ "gcc_noc_west_dcd_xo_clk", &gcc.mux, 0x22 },
+	{ "gcc_noc_east_dcd_xo_clk", &gcc.mux, 0x23 },
+	{ "gcc_noc_north_dcd_xo_clk", &gcc.mux, 0x24 },
+	{ "gcc_noc_pcie_dcd_xo_clk", &gcc.mux, 0x25 },
+	{ "gcc_noc_south_dcd_xo_clk", &gcc.mux, 0x26 },
+	{ "gcc_noc_center_dcd_xo_clk", &gcc.mux, 0x27 },
+	{ "gcc_cfg_noc_ah2phy_xo_clk", &gcc.mux, 0x28 },
+	{ "gcc_noc_lpass_dcd_xo_clk", &gcc.mux, 0x29 },
+	{ "gcc_noc_mmnoc_cnoc_dcd_xo_clk", &gcc.mux, 0x2a },
+	{ "gcc_cnoc_periph_clk", &gcc.mux, 0x2b },
+	{ "gcc_config_noc_at_clk", &gcc.mux, 0x2c },
+	{ "gcc_config_noc_lpass_boot_clk", &gcc.mux, 0x2d },
+	{ "gcc_cfg_noc_pcie_anoc_ahb_clk", &gcc.mux, 0x2e },
+	{ "gcc_aggre_noc_south_ahb_cfg_clk", &gcc.mux, 0x2f },
+	{ "gcc_aggre_noc_ahb_clk", &gcc.mux, 0x30 },
+	{ "gcc_qmip_aggre_noc_ahb_clk", &gcc.mux, 0x31 },
+	{ "gcc_aggre_cnoc_periph_north_ahb_clk", &gcc.mux, 0x32 },
+	{ "gcc_aggre_cnoc_periph_south_ahb_clk", &gcc.mux, 0x33 },
+	{ "gcc_aggre_noc_qosgen_extref_clk", &gcc.mux, 0x34 },
+	{ "gcc_aggre_noc_center_axi_clk", &gcc.mux, 0x35 },
+	{ "gcc_aggre_noc_qdss_bam_clk", &gcc.mux, 0x36 },
+	{ "gcc_aggre_noc_center_hs_axi_clk", &gcc.mux, 0x37 },
+	{ "gcc_aggre_noc_west_axi_clk", &gcc.mux, 0x38 },
+	{ "gcc_aggre_noc_west_tunnel_clk", &gcc.mux, 0x39 },
+	{ "gcc_aggre_noc_east_axi_clk", &gcc.mux, 0x3a },
+	{ "gcc_aggre_noc_north_tunnel_clk", &gcc.mux, 0x3b },
+	{ "gcc_aggre_noc_south_hs_axi_clk", &gcc.mux, 0x3c },
+	{ "gcc_aggre_noc_south_axi_clk", &gcc.mux, 0x3d },
+	{ "gcc_aggre_noc_south_tunnel_clk", &gcc.mux, 0x3e },
+	{ "gcc_aggre_noc_north_axi_clk", &gcc.mux, 0x3f },
+	{ "gcc_aggre_noc_east_tunnel_clk", &gcc.mux, 0x40 },
+	{ "gcc_aggre_noc_pcie_axi_clk", &gcc.mux, 0x41 },
+	{ "gcc_aggre_usb3_prim_axi_clk", &gcc.mux, 0x42 },
+	{ "gcc_aggre_ufs_phy_axi_clk", &gcc.mux, 0x43 },
+	{ "gcc_aggre_noc_ipa_clk", &gcc.mux, 0x44 },
+	{ "gcc_anoc_pcie_pwrctl_clk", &gcc.mux, 0x45 },
+	{ "gcc_tic_clk", &gcc.mux, 0x46 },
+	{ "gcc_tic_cfg_qx_clk", &gcc.mux, 0x47 },
+	{ "gcc_imem_cfg_qx_clk", &gcc.mux, 0x48 },
+	{ "gcc_imem_cfg_ahb_clk", &gcc.mux, 0x49 },
+	{ "gcc_tcu_cfg_qx_clk", &gcc.mux, 0x4a },
+	{ "gcc_mmu_tcu_clk", &gcc.mux, 0x4b },
+	{ "gcc_tcu_ddrss_ubwcp_clk", &gcc.mux, 0x4c },
+	{ "gcc_mmu_tcu_slp_stg_clk", &gcc.mux, 0x4d },
+	{ "gcc_tcu_anoc_qtb1_clk", &gcc.mux, 0x4e },
+	{ "gcc_tcu_anoc_qtb2_clk", &gcc.mux, 0x4f },
+	{ "gcc_tcu_mmnoc_qtb_sf_clk", &gcc.mux, 0x50 },
+	{ "gcc_tcu_mmnoc_qtb_hf01_clk", &gcc.mux, 0x51 },
+	{ "gcc_tcu_mmnoc_qtb_hf23_clk", &gcc.mux, 0x52 },
+	{ "gcc_tcu_anoc_pcie_qtb_clk", &gcc.mux, 0x53 },
+	{ "gcc_tcu_turing_q6_qtb0_clk", &gcc.mux, 0x54 },
+	{ "gcc_tcu_lpass_audio_qtb_clk", &gcc.mux, 0x55 },
+	{ "gcc_anoc_pcie_at_clk", &gcc.mux, 0x56 },
+	{ "gcc_anoc_pcie_tsctr_clk", &gcc.mux, 0x57 },
+	{ "gcc_anoc_pcie_qosgen_extref_clk", &gcc.mux, 0x58 },
+	{ "gcc_mmnoc_at_clk", &gcc.mux, 0x59 },
+	{ "gcc_mmnoc_ahb_cfg_clk", &gcc.mux, 0x5a },
+	{ "gcc_noc_mmnoc_dcd_xo_clk", &gcc.mux, 0x5b },
+	{ "gcc_mmnoc_tsctr_clk", &gcc.mux, 0x5c },
+	{ "gcc_mmnoc_sf_clk", &gcc.mux, 0x5d },
+	{ "gcc_mmnoc_hf_qx_clk", &gcc.mux, 0x5e },
+	{ "gcc_mmnoc_pwrctl_clk", &gcc.mux, 0x5f },
+	{ "gcc_mmnoc_qosgen_extref_clk", &gcc.mux, 0x60 },
+	{ "gcc_mmss_at_clk", &gcc.mux, 0x61 },
+	{ "gcc_mmss_qmip_core_clk", &gcc.mux, 0x62 },
+	{ "gcc_mmss_trig_clk", &gcc.mux, 0x63 },
+	{ "gcc_mmss_qm_ahb_clk", &gcc.mux, 0x64 },
+	{ "gcc_camera_ahb_clk", &gcc.mux, 0x65 },
+	{ "gcc_qmip_camera_nrt_ahb_clk", &gcc.mux, 0x66 },
+	{ "gcc_qmip_camera_rt_ahb_clk", &gcc.mux, 0x67 },
+	{ "gcc_qmip_camera_cmd_ahb_clk", &gcc.mux, 0x68 },
+	{ "gcc_camera_hf_axi_clk", &gcc.mux, 0x69 },
+	{ "gcc_camera_hf_axi_slp_stg_clk", &gcc.mux, 0x6a },
+	{ "gcc_camera_sf_axi_clk", &gcc.mux, 0x6b },
+	{ "gcc_camera_sf_axi_slp_stg_clk", &gcc.mux, 0x6c },
+	{ "gcc_camera_xo_clk", &gcc.mux, 0x6d },
+	{ "camera_gcc_debug_clk", &gcc.mux, 0x6e },
+	{ "gcc_cam_bist_mclk_ahb_clk", &gcc.mux, 0x6f },
+	{ "cam_bist_gcc_debug_clk", &gcc.mux, 0x70 },
+	{ "gcc_disp_ahb_clk", &gcc.mux, 0x71 },
+	{ "gcc_disp_hf_axi_clk", &gcc.mux, 0x72 },
+	{ "mdss_gcc_debug_clk", &gcc.mux, 0x73 },
+	{ "gcc_video_ahb_clk", &gcc.mux, 0x74 },
+	{ "gcc_qmip_video_cvp_ahb_clk", &gcc.mux, 0x75 },
+	{ "gcc_qmip_video_vcodec_ahb_clk", &gcc.mux, 0x76 },
+	{ "gcc_qmip_video_v_cpu_ahb_clk", &gcc.mux, 0x77 },
+	{ "gcc_qmip_video_cv_cpu_ahb_clk", &gcc.mux, 0x78 },
+	{ "gcc_video_axi0_clk", &gcc.mux, 0x79 },
+	{ "gcc_video_axi1_clk", &gcc.mux, 0x7a },
+	{ "gcc_video_xo_clk", &gcc.mux, 0x7b },
+	{ "video_gcc_debug_clk", &gcc.mux, 0x7c },
+	{ "gcc_eva_ahb_clk", &gcc.mux, 0x7d },
+	{ "gcc_eva_axi0_clk", &gcc.mux, 0x7e },
+	{ "gcc_eva_axi0c_clk", &gcc.mux, 0x7f },
+	{ "gcc_eva_xo_clk", &gcc.mux, 0x80 },
+	{ "eva_gcc_debug_clk", &gcc.mux, 0x81 },
+	{ "gcc_qdss_dap_ahb_clk", &gcc.mux, 0x82 },
+	{ "gcc_qdss_cfg_ahb_clk", &gcc.mux, 0x83 },
+	{ "gcc_qdss_center_at_clk", &gcc.mux, 0x84 },
+	{ "gcc_south_at_clk", &gcc.mux, 0x85 },
+	{ "gcc_west_at_clk", &gcc.mux, 0x86 },
+	{ "gcc_east_at_clk", &gcc.mux, 0x87 },
+	{ "gcc_north_at_clk", &gcc.mux, 0x88 },
+	{ "gcc_phy_at_clk", &gcc.mux, 0x89 },
+	{ "gcc_qdss_etr_usb_clk", &gcc.mux, 0x8a },
+	{ "gcc_qdss_etr_ddr_clk", &gcc.mux, 0x8b },
+	{ "gcc_qdss_stm_clk", &gcc.mux, 0x8c },
+	{ "gcc_qdss_traceclkin_clk", &gcc.mux, 0x8d },
+	{ "gcc_qdss_tsctr_clk", &gcc.mux, 0x8e },
+	{ "gcc_qdss_trig_clk", &gcc.mux, 0x8f },
+	{ "gcc_qdss_dap_clk", &gcc.mux, 0x90 },
+	{ "gcc_center_apb_clk", &gcc.mux, 0x91 },
+	{ "gcc_north_apb_clk", &gcc.mux, 0x92 },
+	{ "gcc_south_apb_clk", &gcc.mux, 0x93 },
+	{ "gcc_west_apb_clk", &gcc.mux, 0x94 },
+	{ "gcc_east_apb_clk", &gcc.mux, 0x95 },
+	{ "gcc_mmnoc_apb_clk", &gcc.mux, 0x96 },
+	{ "gcc_qdss_xo_clk", &gcc.mux, 0x97 },
+	{ "gcc_qdss_usb_prim_clk", &gcc.mux, 0x98 },
+	{ "gcc_trace_noc_center_clk", &gcc.mux, 0x99 },
+	{ "gcc_trace_noc_mm_clk", &gcc.mux, 0x9a },
+	{ "gcc_trace_noc_south_clk", &gcc.mux, 0x9b },
+	{ "gcc_trace_noc_east_clk", &gcc.mux, 0x9c },
+	{ "gcc_trace_noc_north_clk", &gcc.mux, 0x9d },
+	{ "gcc_usb30_prim_master_clk", &gcc.mux, 0x9e },
+	{ "gcc_usb30_prim_sleep_clk", &gcc.mux, 0x9f },
+	{ "gcc_usb30_prim_mock_utmi_clk", &gcc.mux, 0xa0 },
+	{ "gcc_usb3_prim_phy_aux_clk", &gcc.mux, 0xa1 },
+	{ "gcc_usb3_prim_phy_com_aux_clk", &gcc.mux, 0xa2 },
+	{ "gcc_usb3_prim_phy_pipe_clk", &gcc.mux, 0xa3 },
+	{ "gcc_usb3_prim_lpc_gpll_src_0_clk_src", &gcc.mux, 0xa4 },
+	{ "gcc_usb3_prim_lpc_gpll_src_1_clk_src", &gcc.mux, 0xa5 },
+	{ "usb3dpphy_gcc_debug_clk", &gcc.mux, 0xa6 },
+	{ "usb3_phy_wrapper_gcc_usb30_pipe_clk", &gcc.mux, 0xa7 },
+	{ "qusb2phy_prim_gcc_usb30_utmi_clk", &gcc.mux, 0xa8 },
+	{ "gcc_ahb2phy_0_clk", &gcc.mux, 0xa9 },
+	{ "gcc_sdcc2_apps_clk", &gcc.mux, 0xaa },
+	{ "gcc_sdcc2_ahb_clk", &gcc.mux, 0xab },
+	{ "gcc_sdcc2_at_clk", &gcc.mux, 0xac },
+	{ "gcc_sdcc4_apps_clk", &gcc.mux, 0xad },
+	{ "gcc_sdcc4_ahb_clk", &gcc.mux, 0xae },
+	{ "gcc_sdcc4_at_clk", &gcc.mux, 0xaf },
+	{ "gcc_qupv3_i2c_s_ahb_clk", &gcc.mux, 0xb0 },
+	{ "gcc_qupv3_i2c_core_clk", &gcc.mux, 0xb1 },
+	{ "gcc_qupv3_i2c_s0_clk", &gcc.mux, 0xb2 },
+	{ "gcc_qupv3_i2c_s1_clk", &gcc.mux, 0xb3 },
+	{ "gcc_qupv3_i2c_s2_clk", &gcc.mux, 0xb4 },
+	{ "gcc_qupv3_i2c_s3_clk", &gcc.mux, 0xb5 },
+	{ "gcc_qupv3_i2c_s4_clk", &gcc.mux, 0xb6 },
+	{ "gcc_qupv3_i2c_s5_clk", &gcc.mux, 0xb7 },
+	{ "gcc_qupv3_i2c_s6_clk", &gcc.mux, 0xb8 },
+	{ "gcc_qupv3_i2c_s7_clk", &gcc.mux, 0xb9 },
+	{ "gcc_qupv3_i2c_s8_clk", &gcc.mux, 0xba },
+	{ "gcc_qupv3_i2c_s9_clk", &gcc.mux, 0xbb },
+	{ "gcc_qupv3_wrap_1_m_ahb_clk", &gcc.mux, 0xbc },
+	{ "gcc_qupv3_wrap_1_s_ahb_clk", &gcc.mux, 0xbd },
+	{ "gcc_qupv3_wrap1_core_clk", &gcc.mux, 0xbe },
+	{ "gcc_qupv3_wrap1_core_2x_clk", &gcc.mux, 0xbf },
+	{ "gcc_qupv3_wrap1_s0_clk", &gcc.mux, 0xc0 },
+	{ "gcc_qupv3_wrap1_s1_clk", &gcc.mux, 0xc1 },
+	{ "gcc_qupv3_wrap1_s2_clk", &gcc.mux, 0xc2 },
+	{ "gcc_qupv3_wrap1_s3_clk", &gcc.mux, 0xc3 },
+	{ "gcc_qupv3_wrap1_s4_clk", &gcc.mux, 0xc4 },
+	{ "gcc_qupv3_wrap1_s5_clk", &gcc.mux, 0xc5 },
+	{ "gcc_qupv3_wrap1_s6_clk", &gcc.mux, 0xc6 },
+	{ "gcc_qupv3_wrap1_s7_clk", &gcc.mux, 0xc7 },
+	{ "gcc_qupv3_wrap1_qspi_ref_clk", &gcc.mux, 0xc8 },
+	{ "gcc_qupv3_wrap_2_m_ahb_clk", &gcc.mux, 0xc9 },
+	{ "gcc_qupv3_wrap_2_s_ahb_clk", &gcc.mux, 0xca },
+	{ "gcc_qupv3_wrap2_core_clk", &gcc.mux, 0xcb },
+	{ "gcc_qupv3_wrap2_core_2x_clk", &gcc.mux, 0xcc },
+	{ "gcc_qupv3_wrap2_s0_clk", &gcc.mux, 0xcd },
+	{ "gcc_qupv3_wrap2_s1_clk", &gcc.mux, 0xce },
+	{ "gcc_qupv3_wrap2_s2_clk", &gcc.mux, 0xcf },
+	{ "gcc_qupv3_wrap2_s3_clk", &gcc.mux, 0xd0 },
+	{ "gcc_qupv3_wrap2_s4_clk", &gcc.mux, 0xd1 },
+	{ "gcc_qupv3_wrap2_s5_clk", &gcc.mux, 0xd2 },
+	{ "gcc_qupv3_wrap2_s6_clk", &gcc.mux, 0xd3 },
+	{ "gcc_qupv3_wrap2_s7_clk", &gcc.mux, 0xd4 },
+	{ "gcc_qupv3_wrap_2_ibi_2_ahb_clk", &gcc.mux, 0xd5 },
+	{ "gcc_qupv3_wrap_2_ibi_3_ahb_clk", &gcc.mux, 0xd6 },
+	{ "gcc_qupv3_wrap2_ibi_ctrl_2_clk", &gcc.mux, 0xd7 },
+	{ "gcc_qupv3_wrap2_ibi_ctrl_3_clk", &gcc.mux, 0xd8 },
+	{ "gcc_pdm_ahb_clk", &gcc.mux, 0xd9 },
+	{ "gcc_pdm_xo4_clk", &gcc.mux, 0xda },
+	{ "gcc_pdm2_clk", &gcc.mux, 0xdb },
+	{ "gcc_pmu_ahb_clk", &gcc.mux, 0xdc },
+	{ "gcc_pmu_core_clk", &gcc.mux, 0xdd },
+	{ "gcc_pmu_hw_profile_clk", &gcc.mux, 0xde },
+	{ "gcc_prng_ahb_clk", &gcc.mux, 0xdf },
+	{ "gcc_tme_ahb_clk", &gcc.mux, 0xe0 },
+	{ "gcc_tme_boot_rom_ahb_clk", &gcc.mux, 0xe1 },
+	{ "gcc_tme_snoc_qxm_clk", &gcc.mux, 0xe2 },
+	{ "gcc_tme_gpll0_clk_src", &gcc.mux, 0xe3 },
+	{ "gcc_tme_trig_clk", &gcc.mux, 0xe4 },
+	{ "gcc_tme_at_clk", &gcc.mux, 0xe5 },
+	{ "tme_gcc_debug_clk", &gcc.mux, 0xe6 },
+	{ "gcc_tcsr_ahb_clk", &gcc.mux, 0xe7 },
+	{ "gcc_tcsr_core_clk", &gcc.mux, 0xe8 },
+	{ "gcc_memred_p2s_clk", &gcc.mux, 0xe9 },
+	{ "gcc_boot_rom_ahb_clk", &gcc.mux, 0xea },
+	{ "gcc_tlmm_ahb_clk", &gcc.mux, 0xeb },
+	{ "gcc_tlmm_clk", &gcc.mux, 0xec },
+	{ "gcc_aoss_cnoc_m_ahb_clk", &gcc.mux, 0xed },
+	{ "gcc_aoss_cnoc_s_ahb_clk", &gcc.mux, 0xee },
+	{ "gcc_aoss_at_clk", &gcc.mux, 0xef },
+	{ "aoss_gcc_debug_clk", &gcc.mux, 0xf0 },
+	{ "gcc_spdm_ff_clk", &gcc.mux, 0xf1 },
+	{ "gcc_spdm_gemnoc_cy_clk", &gcc.mux, 0xf2 },
+	{ "gcc_spdm_snoc_cy_clk", &gcc.mux, 0xf3 },
+	{ "gcc_spdm_pnoc_cy_clk", &gcc.mux, 0xf4 },
+	{ "gcc_ce1_clk", &gcc.mux, 0xf5 },
+	{ "gcc_ce1_axi_clk", &gcc.mux, 0xf6 },
+	{ "gcc_ce1_ahb_clk", &gcc.mux, 0xf7 },
+	{ "gcc_at_clk", &gcc.mux, 0xf8 },
+	{ "gcc_core_clk", &gcc.mux, 0xf9 },
+	{ "gcc_ahb_config_clk", &gcc.mux, 0xfa },
+	{ "gcc_ao_pgm_clk", &gcc.mux, 0xfb },
+	{ "gcc_xo_clk", &gcc.mux, 0xfc },
+	{ "gcc_xo_div4_clk", &gcc.mux, 0xfd },
+	{ "gcc_xo_div16_clk", &gcc.mux, 0xfe },
+	{ "gcc_sleep_clk", &gcc.mux, 0xff },
+	{ "gcc_ddrss_mmnoc_sf_clk", &gcc.mux, 0x100 },
+	{ "gcc_ddrss_mmnoc_hf_qx_clk", &gcc.mux, 0x101 },
+	{ "gcc_ddrss_tcu_clk", &gcc.mux, 0x102 },
+	{ "gcc_ddrss_turing_q6_axi_clk", &gcc.mux, 0x103 },
+	{ "gcc_ddrss_mss_q6_axi_clk", &gcc.mux, 0x104 },
+	{ "gcc_ddrss_modem_clk", &gcc.mux, 0x105 },
+	{ "gcc_ddrss_gpu_axi_clk", &gcc.mux, 0x106 },
+	{ "gcc_ddrss_pcie_sf_qtb_clk", &gcc.mux, 0x107 },
+	{ "gcc_ddrss_snoc_sf_axi_clk", &gcc.mux, 0x108 },
+	{ "gcc_ddrss_config_noc_sf_clk", &gcc.mux, 0x109 },
+	{ "gcc_ddrss_cfg_ahb_clk", &gcc.mux, 0x10a },
+	{ "gcc_gemnoc_clk", &gcc.mux, 0x10b },
+	{ "gcc_ddrss_lpass_shub_clk", &gcc.mux, 0x10c },
+	{ "gcc_ddrss_at_clk", &gcc.mux, 0x10d },
+	{ "gcc_shrm_clk", &gcc.mux, 0x10e },
+	{ "gcc_ddrss_gic_clk", &gcc.mux, 0x10f },
+	{ "gcc_ddrss_cpuss_ubwcp_clk", &gcc.mux, 0x110 },
+	{ "gcc_ddrss_pwrctl_clk", &gcc.mux, 0x111 },
+	{ "gcc_ddrss_ubwcp_clk", &gcc.mux, 0x112 },
+	{ "gcc_ddrss_gpll0_main_clk_src", &gcc.mux, 0x113 },
+	{ "ddrss_gcc_debug_clk", &gcc.mux, 0x114 },
+	{ "gcc_lpass_cfg_noc_sway_clk", &gcc.mux, 0x115 },
+	{ "gcc_qmip_lpass_qtb_ahb_clk", &gcc.mux, 0x116 },
+	{ "gcc_lpass_trig_clk", &gcc.mux, 0x117 },
+	{ "gcc_lpass_at_func_clk", &gcc.mux, 0x118 },
+	{ "gcc_lpass_at_clk", &gcc.mux, 0x119 },
+	{ "gcc_lpass_axis2_clk", &gcc.mux, 0x11a },
+	{ "gcc_lpass_aon_noc_ddrss_shub_clk", &gcc.mux, 0x11b },
+	{ "gcc_lpass_aggre_noc_mpu_client_ddrss_shub_clk", &gcc.mux, 0x11c },
+	{ "gcc_lpass_hw_af_noc_ddrss_shub_clk", &gcc.mux, 0x11d },
+	{ "gcc_lpass_aggre_noc_ddrss_shub_clk", &gcc.mux, 0x11e },
+	{ "gcc_lpass_tsctr_clk", &gcc.mux, 0x11f },
+	{ "gcc_lpass_gpll0_div_clk_src", &gcc.mux, 0x120 },
+	{ "lpass_gcc_debug_clk", &gcc.mux, 0x121 },
+	{ "gcc_lpass_qtb_ahb_clk", &gcc.mux, 0x122 },
+	{ "gcc_lpass_audio_qtb_clk", &gcc.mux, 0x123 },
+	{ "gcc_lpass_qosgen_extref_clk", &gcc.mux, 0x124 },
+	{ "gcc_lpass_qdss_tsctr_clk", &gcc.mux, 0x125 },
+	{ "gcc_lpass_qtb_at_clk", &gcc.mux, 0x126 },
+	{ "gcc_lpass_xo_clk", &gcc.mux, 0x127 },
+	{ "gcc_lpass_pwrctl_clk", &gcc.mux, 0x128 },
+	{ "gcc_turing_q6_qtb0_clk", &gcc.mux, 0x129 },
+	{ "gcc_turing_nsp_ahb_clk", &gcc.mux, 0x12a },
+	{ "gcc_nsp_qosgen_extref_clk", &gcc.mux, 0x12b },
+	{ "gcc_nsp_qdss_tsctr_clk", &gcc.mux, 0x12c },
+	{ "gcc_turing_qtb_at_clk", &gcc.mux, 0x12d },
+	{ "gcc_turing_xo_clk", &gcc.mux, 0x12e },
+	{ "gcc_turing_pwrctl_clk", &gcc.mux, 0x12f },
+	{ "gcc_turing_mmnoc_sf_clk", &gcc.mux, 0x130 },
+	{ "gcc_turing_q6_axi_clk", &gcc.mux, 0x131 },
+	{ "gcc_turing_cfg_ahb_clk", &gcc.mux, 0x132 },
+	{ "gcc_turing_at_clk", &gcc.mux, 0x133 },
+	{ "gcc_qmip_turing_nsp_ahb_clk", &gcc.mux, 0x134 },
+	{ "gcc_turing_trig_clk", &gcc.mux, 0x135 },
+	{ "turing_gcc_debug_clk", &gcc.mux, 0x136 },
+	{ "gcc_cpuss_ahb_clk", &gcc.mux, 0x137 },
+	{ "gcc_cpuss_gic_clk", &gcc.mux, 0x138 },
+	{ "gcc_qmip_cpuss_gic_ahb_clk", &gcc.mux, 0x139 },
+	{ "gcc_cpuss_trig_clk", &gcc.mux, 0x13a },
+	{ "gcc_cpuss_config_noc_sf_clk", &gcc.mux, 0x13b },
+	{ "gcc_cpuss_ubwcp_clk", &gcc.mux, 0x13c },
+	{ "gcc_cpuss_at_clk", &gcc.mux, 0x13d },
+	{ "gcc_apss_qdss_tsctr_clk", &gcc.mux, 0x13e },
+	{ "gcc_apss_qdss_apb_clk", &gcc.mux, 0x13f },
+	{ "cpuss_gcc_debug_clk", &gcc.mux, 0x140 },
+	{ "gcc_noc_bus_timeout_extref_clk", &gcc.mux, 0x141 },
+	{ "gcc_rbcpr_cx_clk", &gcc.mux, 0x142 },
+	{ "gcc_rbcpr_cx_ahb_clk", &gcc.mux, 0x143 },
+	{ "gcc_rbcpr_mxc_clk", &gcc.mux, 0x144 },
+	{ "gcc_rbcpr_mxc_ahb_clk", &gcc.mux, 0x145 },
+	{ "gcc_rbcpr_mxa_clk", &gcc.mux, 0x146 },
+	{ "gcc_rbcpr_mxa_ahb_clk", &gcc.mux, 0x147 },
+	{ "gcc_rbcpr_hmx_clk", &gcc.mux, 0x148 },
+	{ "gcc_rbcpr_hmx_ahb_clk", &gcc.mux, 0x149 },
+	{ "gcc_rbcpr_gpu_clk", &gcc.mux, 0x14a },
+	{ "gcc_rbcpr_gpu_ahb_clk", &gcc.mux, 0x14b },
+	{ "gcc_rbcpr_nsp_clk", &gcc.mux, 0x14c },
+	{ "gcc_rbcpr_nsp_ahb_clk", &gcc.mux, 0x14d },
+	{ "gcc_frq_measure_ref_clk", &gcc.mux, 0x14e },
+	{ "qusb2phy_gcc_clk_test_prim", &gcc.mux, 0x14f },
+	{ "qusb2phy_gcc_clk_test_sec", &gcc.mux, 0x150 },
+	{ "gcc_gp1_clk", &gcc.mux, 0x151 },
+	{ "gcc_gp2_clk", &gcc.mux, 0x152 },
+	{ "gcc_gp3_clk", &gcc.mux, 0x153 },
+	{ "gcc_qmip_pcie_ahb_clk", &gcc.mux, 0x154 },
+	{ "gcc_pcie_0_slv_q2a_axi_clk", &gcc.mux, 0x155 },
+	{ "gcc_pcie_0_slv_axi_clk", &gcc.mux, 0x156 },
+	{ "gcc_pcie_0_mstr_axi_clk", &gcc.mux, 0x157 },
+	{ "gcc_pcie_0_cfg_ahb_clk", &gcc.mux, 0x158 },
+	{ "gcc_pcie_0_aux_clk", &gcc.mux, 0x159 },
+	{ "gcc_pcie_0_pipe_clk", &gcc.mux, 0x15a },
+	{ "gcc_pcie_0_phy_rchng_clk", &gcc.mux, 0x15b },
+	{ "pcie_0_pipe_clk", &gcc.mux, 0x15c },
+	{ "pcie_0_gcc_debug_clk", &gcc.mux, 0x15d },
+	{ "gcc_ufs_phy_axi_clk", &gcc.mux, 0x15e },
+	{ "gcc_ufs_phy_ahb_clk", &gcc.mux, 0x15f },
+	{ "gcc_ufs_phy_tx_symbol_0_clk", &gcc.mux, 0x160 },
+	{ "gcc_ufs_phy_rx_symbol_0_clk", &gcc.mux, 0x161 },
+	{ "ufs_phy_tx_symbol_0_clk", &gcc.mux, 0x162 },
+	{ "ufs_phy_rx_symbol_0_clk", &gcc.mux, 0x163 },
+	{ "gcc_ufs_phy_unipro_core_clk", &gcc.mux, 0x164 },
+	{ "gcc_ufs_phy_ice_core_clk", &gcc.mux, 0x165 },
+	{ "gcc_ufs_phy_phy_aux_clk", &gcc.mux, 0x166 },
+	{ "gcc_ufs_phy_rx_symbol_1_clk", &gcc.mux, 0x167 },
+	{ "gcc_ufs_at_clk", &gcc.mux, 0x168 },
+	{ "ufs_phy_rx_symbol_1_clk", &gcc.mux, 0x169 },
+	{ "ufs_phy_gcc_debug_clk", &gcc.mux, 0x16a },
+	{ "gcc_vddmxc_vs_clk", &gcc.mux, 0x16b },
+	{ "gcc_vddcx_vs_clk", &gcc.mux, 0x16c },
+	{ "gcc_vddmx_vs_clk", &gcc.mux, 0x16d },
+	{ "gcc_vdda_vs_clk", &gcc.mux, 0x16e },
+	{ "gcc_vs_ctrl_clk", &gcc.mux, 0x16f },
+	{ "gcc_vs_ctrl_ahb_clk", &gcc.mux, 0x170 },
+	{ "gcc_mss_vs_clk", &gcc.mux, 0x171 },
+	{ "gcc_gpu_vs_clk", &gcc.mux, 0x172 },
+	{ "gcc_apc_vs_clk", &gcc.mux, 0x173 },
+	{ "gcc_mdss_vs_0_clk", &gcc.mux, 0x174 },
+	{ "gcc_mdss_vs_1_clk", &gcc.mux, 0x175 },
+	{ "gcc_turing_vs_clk", &gcc.mux, 0x176 },
+	{ "gcc_turing_vs_hmx_clk", &gcc.mux, 0x177 },
+	{ "sleep_clk", &gcc.mux, 0x178 },
+	{ "gcc_dcc_ahb_clk", &gcc.mux, 0x179 },
+	{ "gcc_ipa_2x_clk", &gcc.mux, 0x17a },
+	{ "gcc_ipa_clk", &gcc.mux, 0x17b },
+	{ "gcc_ipa_ahb_clk", &gcc.mux, 0x17c },
+	{ "gcc_ipa_xo_clk", &gcc.mux, 0x17d },
+	{ "gcc_ipa_apb_clk", &gcc.mux, 0x17e },
+	{ "gcc_ipa_at_clk", &gcc.mux, 0x17f },
+	{ "gcc_mss_cfg_ahb_clk", &gcc.mux, 0x180 },
+	{ "gcc_qmip_mss_offline_cfg_ahb_clk", &gcc.mux, 0x181 },
+	{ "gcc_qmip_mss_q6_cfg_ahb_clk", &gcc.mux, 0x182 },
+	{ "gcc_mss_offline_axi_clk", &gcc.mux, 0x183 },
+	{ "gcc_mss_axis2_clk", &gcc.mux, 0x184 },
+	{ "gcc_mss_trig_clk", &gcc.mux, 0x185 },
+	{ "gcc_mss_at_clk", &gcc.mux, 0x186 },
+	{ "gcc_mss_snoc_axi_clk", &gcc.mux, 0x187 },
+	{ "gcc_mss_q6_gemnoc_axi_clk", &gcc.mux, 0x188 },
+	{ "gcc_mss_gpll0_div_clk_src", &gcc.mux, 0x189 },
+	{ "mss_gcc_debug_clk", &gcc.mux, 0x18a },
+	{ "gcc_glm_clk", &gcc.mux, 0x18b },
+	{ "gcc_gpu_cfg_ahb_clk", &gcc.mux, 0x18c },
+	{ "gcc_qmip_gpu_ahb_clk", &gcc.mux, 0x18d },
+	{ "gcc_gpu_at_clk", &gcc.mux, 0x18e },
+	{ "gpu_gcc_debug_clk", &gcc.mux, 0x18f },
+	{ "gcc_gpu_gemnoc_gfx_clk", &gcc.mux, 0x190 },
+	{ "gcc_gpu_trig_clk", &gcc.mux, 0x191 },
+	{ "gcc_gpu_gpll0_clk_src", &gcc.mux, 0x192 },
+	{ "gcc_gpu_gpll0_div_clk_src", &gcc.mux, 0x193 },
+	{ "gcc_sp_snoc_anoc_axi_clk", &gcc.mux, 0x194 },
+	{ "gcc_sp_scr_niu_clk", &gcc.mux, 0x195 },
+	{ "gcc_sp_cfg_ahb_clk", &gcc.mux, 0x196 },
+	{ "gcc_sp_scsr_clk", &gcc.mux, 0x197 },
+	{ "gcc_sp_trig_clk", &gcc.mux, 0x198 },
+	{ "gcc_sp_at_clk", &gcc.mux, 0x199 },
+	{ "sp_gcc_debug_clk", &gcc.mux, 0x19a },
+	{ "gcc_nav_axi_clk", &gcc.mux, 0x19b },
+	{ "nav_gcc_debug_clk", &gcc.mux, 0x19c },
+	{ "gcc_ahb2phy_1_clk", &gcc.mux, 0x19d },
+	{ "gcc_cm_phy_refgen1_clk", &gcc.mux, 0x19e },
+	{ "gcc_cm_phy_refgen2_clk", &gcc.mux, 0x19f },
+	{ "gcc_qspi_cnoc_periph_ahb_clk", &gcc.mux, 0x1a0 },
+	{ "gcc_qspi_core_clk", &gcc.mux, 0x1a1 },
+	{ "gcc_rbcpr_mmcx_clk", &gcc.mux, 0x1a2 },
+	{ "gcc_rbcpr_mmcx_ahb_clk", &gcc.mux, 0x1a3 },
+	{ "gcc_ipcc_core_clk", &gcc.mux, 0x1a4 },
+	{ "gcc_rdpm_cx_clk", &gcc.mux, 0x1a5 },
+	{ "gcc_rdpm_mxa_clk", &gcc.mux, 0x1a6 },
+	{ "gcc_rdpm_mxc_clk", &gcc.mux, 0x1a7 },
+	{ "gcc_rdpm_cx_ahb_clk", &gcc.mux, 0x1a8 },
+	{ "gcc_rdpm_mxa_ahb_clk", &gcc.mux, 0x1a9 },
+	{ "gcc_rdpm_mxc_ahb_clk", &gcc.mux, 0x1aa },
+	{ "gcc_rdpm_cb_clk", &gcc.mux, 0x1ab },
+	{ "gcc_pcie_rscc_cfg_ahb_clk", &gcc.mux, 0x1ac },
+	{ "gcc_pcie_rscc_xo_clk", &gcc.mux, 0x1ad },
+	{ "gcc_mm_rscc_cfg_ahb_clk", &gcc.mux, 0x1ae },
+	{ "gcc_mm_rscc_core_clk", &gcc.mux, 0x1af },
+	{ "gcc_mm_rscc_xo_clk", &gcc.mux, 0x1b0 },
+	{ "gcc_cmsr_cfg_ahb_clk", &gcc.mux, 0x1b1 },
+	{ "gcc_cmsr_core_clk", &gcc.mux, 0x1b2 },
+	{ "gcc_soccp_cnoc_m_ahb_clk", &gcc.mux, 0x1b3 },
+	{ "gcc_soccp_cnoc_s_ahb_clk", &gcc.mux, 0x1b4 },
+	{ "gcc_soccp_anoc_axi_clk", &gcc.mux, 0x1b5 },
+	{ "gcc_soccp_ss_h_clk", &gcc.mux, 0x1b6 },
+	{ "gcc_soccp_proc_h_clk", &gcc.mux, 0x1b7 },
+	{ "gcc_soccp_f_clk", &gcc.mux, 0x1b8 },
+	{ "gcc_soccp_dbg_clk", &gcc.mux, 0x1b9 },
+	{ "gcc_soccp_tmr_clk", &gcc.mux, 0x1ba },
+	/* CAMCC Entries */
+	{ "cam_cc_csi0phytimer_clk", &cam_cc, 0x1 },
+	{ "cam_cc_csiphy0_clk", &cam_cc, 0x2 },
+	{ "cam_cc_csid_csiphy_rx_clk", &cam_cc, 0x3 },
+	{ "cam_cc_csi1phytimer_clk", &cam_cc, 0x4 },
+	{ "cam_cc_csiphy1_clk", &cam_cc, 0x5 },
+	{ "cam_cc_csi2phytimer_clk", &cam_cc, 0x6 },
+	{ "cam_cc_csiphy2_clk", &cam_cc, 0x7 },
+	{ "cam_cc_csi3phytimer_clk", &cam_cc, 0x8 },
+	{ "cam_cc_csiphy3_clk", &cam_cc, 0x9 },
+	{ "cam_cc_csi4phytimer_clk", &cam_cc, 0xa },
+	{ "cam_cc_csiphy4_clk", &cam_cc, 0xb },
+	{ "cam_cc_csi5phytimer_clk", &cam_cc, 0xc },
+	{ "cam_cc_csiphy5_clk", &cam_cc, 0xd },
+	{ "cam_cc_ofe_main_fast_ahb_clk", &cam_cc, 0xe },
+	{ "cam_cc_ofe_anchor_fast_ahb_clk", &cam_cc, 0xf },
+	{ "cam_cc_ofe_hdr_fast_ahb_clk", &cam_cc, 0x10 },
+	{ "cam_cc_ofe_ahb_clk", &cam_cc, 0x11 },
+	{ "cam_cc_ofe_main_clk", &cam_cc, 0x12 },
+	{ "cam_cc_camnoc_nrt_ofe_main_clk", &cam_cc, 0x13 },
+	{ "cam_cc_ofe_main_slp_stg_clk", &cam_cc, 0x14 },
+	{ "cam_cc_ofe_anchor_clk", &cam_cc, 0x15 },
+	{ "cam_cc_camnoc_nrt_ofe_anchor_clk", &cam_cc, 0x16 },
+	{ "cam_cc_ofe_anchor_slp_stg_clk", &cam_cc, 0x17 },
+	{ "cam_cc_ofe_hdr_clk", &cam_cc, 0x18 },
+	{ "cam_cc_camnoc_nrt_ofe_hdr_clk", &cam_cc, 0x19 },
+	{ "cam_cc_ofe_hdr_slp_stg_clk", &cam_cc, 0x1a },
+	{ "cam_cc_ofe_spdm_clk", &cam_cc, 0x1b },
+	{ "cam_cc_ipe_nps_clk", &cam_cc, 0x1c },
+	{ "cam_cc_ipe_nps_slp_stg_clk", &cam_cc, 0x1d },
+	{ "cam_cc_camnoc_nrt_ipe_nps_clk", &cam_cc, 0x1e },
+	{ "cam_cc_ipe_pps_clk", &cam_cc, 0x1f },
+	{ "cam_cc_ipe_pps_slp_stg_clk", &cam_cc, 0x20 },
+	{ "cam_cc_ipe_nps_spdm_clk", &cam_cc, 0x21 },
+	{ "cam_cc_ipe_nps_ahb_clk", &cam_cc, 0x22 },
+	{ "cam_cc_ipe_nps_fast_ahb_clk", &cam_cc, 0x23 },
+	{ "cam_cc_ipe_pps_fast_ahb_clk", &cam_cc, 0x24 },
+	{ "cam_cc_tfe_0_main_clk", &cam_cc, 0x25 },
+	{ "cam_cc_camnoc_rt_tfe_0_main_clk", &cam_cc, 0x26 },
+	{ "cam_cc_tfe_0_main_slp_stg_clk", &cam_cc, 0x27 },
+	{ "cam_cc_tfe_0_bayer_clk", &cam_cc, 0x28 },
+	{ "cam_cc_camnoc_rt_tfe_0_bayer_clk", &cam_cc, 0x29 },
+	{ "cam_cc_tfe_0_bayer_slp_stg_clk", &cam_cc, 0x2a },
+	{ "cam_cc_tfe_0_spdm_clk", &cam_cc, 0x2b },
+	{ "cam_cc_tfe_0_main_fast_ahb_clk", &cam_cc, 0x2c },
+	{ "cam_cc_tfe_0_bayer_fast_ahb_clk", &cam_cc, 0x2d },
+	{ "cam_cc_tfe_1_main_clk", &cam_cc, 0x2e },
+	{ "cam_cc_camnoc_rt_tfe_1_main_clk", &cam_cc, 0x2f },
+	{ "cam_cc_tfe_1_main_slp_stg_clk", &cam_cc, 0x30 },
+	{ "cam_cc_tfe_1_bayer_clk", &cam_cc, 0x31 },
+	{ "cam_cc_camnoc_rt_tfe_1_bayer_clk", &cam_cc, 0x32 },
+	{ "cam_cc_tfe_1_bayer_slp_stg_clk", &cam_cc, 0x33 },
+	{ "cam_cc_tfe_1_spdm_clk", &cam_cc, 0x34 },
+	{ "cam_cc_tfe_1_main_fast_ahb_clk", &cam_cc, 0x35 },
+	{ "cam_cc_tfe_1_bayer_fast_ahb_clk", &cam_cc, 0x36 },
+	{ "cam_cc_tfe_2_main_clk", &cam_cc, 0x37 },
+	{ "cam_cc_camnoc_rt_tfe_2_main_clk", &cam_cc, 0x38 },
+	{ "cam_cc_tfe_2_main_slp_stg_clk", &cam_cc, 0x39 },
+	{ "cam_cc_tfe_2_bayer_clk", &cam_cc, 0x3a },
+	{ "cam_cc_camnoc_rt_tfe_2_bayer_clk", &cam_cc, 0x3b },
+	{ "cam_cc_tfe_2_bayer_slp_stg_clk", &cam_cc, 0x3c },
+	{ "cam_cc_tfe_2_spdm_clk", &cam_cc, 0x3d },
+	{ "cam_cc_tfe_2_main_fast_ahb_clk", &cam_cc, 0x3e },
+	{ "cam_cc_tfe_2_bayer_fast_ahb_clk", &cam_cc, 0x3f },
+	{ "cam_cc_ife_lite_clk", &cam_cc, 0x40 },
+	{ "cam_cc_ife_lite_slp_stg_clk", &cam_cc, 0x41 },
+	{ "cam_cc_camnoc_rt_ife_lite_clk", &cam_cc, 0x42 },
+	{ "cam_cc_ife_lite_csid_clk", &cam_cc, 0x43 },
+	{ "cam_cc_ife_lite_csid_slp_stg_clk", &cam_cc, 0x44 },
+	{ "cam_cc_ife_lite_cphy_rx_clk", &cam_cc, 0x45 },
+	{ "cam_cc_ife_lite_ahb_clk", &cam_cc, 0x46 },
+	{ "cam_cc_cre_clk", &cam_cc, 0x47 },
+	{ "cam_cc_camnoc_nrt_cre_clk", &cam_cc, 0x48 },
+	{ "cam_cc_cre_ahb_clk", &cam_cc, 0x49 },
+	{ "cam_cc_jpeg_0_clk", &cam_cc, 0x4a },
+	{ "cam_cc_jpeg_1_clk", &cam_cc, 0x4b },
+	{ "cam_cc_jpeg_0_slp_stg_clk", &cam_cc, 0x4c },
+	{ "cam_cc_jpeg_1_slp_stg_clk", &cam_cc, 0x4d },
+	{ "cam_cc_jpeg_spdm_clk", &cam_cc, 0x4e },
+	{ "cam_cc_icp_0_clk", &cam_cc, 0x4f },
+	{ "cam_cc_icp_0_slp_stg_clk", &cam_cc, 0x50 },
+	{ "cam_cc_icp_1_clk", &cam_cc, 0x51 },
+	{ "cam_cc_icp_1_slp_stg_clk", &cam_cc, 0x52 },
+	{ "cam_cc_icp_0_ahb_clk", &cam_cc, 0x53 },
+	{ "cam_cc_icp_1_ahb_clk", &cam_cc, 0x54 },
+	{ "cam_cc_cci_0_clk", &cam_cc, 0x55 },
+	{ "cam_cc_cci_1_clk", &cam_cc, 0x56 },
+	{ "cam_cc_cci_2_clk", &cam_cc, 0x57 },
+	{ "cam_cc_csid_clk", &cam_cc, 0x58 },
+	{ "cam_cc_csid_slp_stg_clk", &cam_cc, 0x59 },
+	{ "cam_cc_camnoc_rt_axi_clk", &cam_cc, 0x5a },
+	{ "cam_cc_camnoc_rt_axi_slp_stg_clk", &cam_cc, 0x5b },
+	{ "cam_cc_camnoc_nrt_axi_clk", &cam_cc, 0x5c },
+	{ "cam_cc_camnoc_nrt_axi_slp_stg_clk", &cam_cc, 0x5d },
+	{ "cam_cc_camnoc_dcd_xo_clk", &cam_cc, 0x5e },
+	{ "cam_cc_camnoc_xo_clk", &cam_cc, 0x5f },
+	{ "cam_cc_qdss_debug_clk", &cam_cc, 0x60 },
+	{ "cam_cc_qdss_debug_xo_clk", &cam_cc, 0x61 },
+	{ "cam_cc_core_ahb_clk", &cam_cc, 0x62 },
+	{ "cam_cc_gdsc_clk", &cam_cc, 0x63 },
+	{ "cam_cc_sleep_clk", &cam_cc, 0x64 },
+	{ "cam_cc_cam_top_fast_ahb_clk", &cam_cc, 0x65 },
+	{ "cam_cc_cam_top_fast_ahb_slp_stg_clk", &cam_cc, 0x66 },
+	{ "cam_cc_cam_top_ahb_clk", &cam_cc, 0x67 },
+	{ "cam_cc_cam_top_ahb_slp_stg_clk", &cam_cc, 0x68 },
+	{ "cam_cc_drv_xo_clk", &cam_cc, 0x69 },
+	{ "cam_cc_drv_ahb_clk", &cam_cc, 0x6a },
+	{ "csiphy0_cam_cc_debug_clk", &cam_cc, 0x6b },
+	{ "csiphy1_cam_cc_debug_clk", &cam_cc, 0x6c },
+	{ "csiphy2_cam_cc_debug_clk", &cam_cc, 0x6d },
+	{ "csiphy3_cam_cc_debug_clk", &cam_cc, 0x6e },
+	{ "csiphy4_cam_cc_debug_clk", &cam_cc, 0x6f },
+	{ "csiphy5_cam_cc_debug_clk", &cam_cc, 0x70 },
+	/* DISPCC Entries */
+	{ "chip_sleep_clk", &disp_cc, 0x1 },
+	{ "chip_sleep_clk_mxa", &disp_cc, 0x2 },
+	{ "mm_dp0_phy_pll_link_clk", &disp_cc, 0x3 },
+	{ "mm_dp0_phy_pll_vco_div_clk", &disp_cc, 0x4 },
+	{ "mm_dsi0_phy_pll_out_dsiclk", &disp_cc, 0x5 },
+	{ "mm_dsi0_phy_pll_out_byteclk", &disp_cc, 0x6 },
+	{ "mm_dsi1_phy_pll_out_dsiclk", &disp_cc, 0x7 },
+	{ "mm_dsi1_phy_pll_out_byteclk", &disp_cc, 0x8 },
+	{ "mm_dp1_phy_pll_link_clk", &disp_cc, 0x9 },
+	{ "mm_dp1_phy_pll_vco_div_clk", &disp_cc, 0xa },
+	{ "mm_dp2_phy_pll_link_clk", &disp_cc, 0xb },
+	{ "mm_dp2_phy_pll_vco_div_clk", &disp_cc, 0xc },
+	{ "mm_dp3_phy_pll_link_clk", &disp_cc, 0xd },
+	{ "mm_dp3_phy_pll_vco_div_clk", &disp_cc, 0xe },
+	{ "disp_cc_mdss_pclk0_clk", &disp_cc, 0xf },
+	{ "disp_cc_mdss_pclk1_clk", &disp_cc, 0x10 },
+	{ "disp_cc_mdss_pclk2_clk", &disp_cc, 0x11 },
+	{ "disp_cc_mdss_mdp_clk", &disp_cc, 0x12 },
+	{ "disp_cc_mdss_mdp_lut_clk", &disp_cc, 0x13 },
+	{ "disp_cc_mdss_vsync_clk", &disp_cc, 0x14 },
+	{ "disp_cc_mdss_byte0_clk", &disp_cc, 0x15 },
+	{ "disp_cc_mdss_byte0_intf_clk", &disp_cc, 0x16 },
+	{ "disp_cc_mdss_byte1_clk", &disp_cc, 0x17 },
+	{ "disp_cc_mdss_byte1_intf_clk", &disp_cc, 0x18 },
+	{ "disp_cc_mdss_esc0_clk", &disp_cc, 0x19 },
+	{ "disp_cc_mdss_esc1_clk", &disp_cc, 0x1a },
+	{ "disp_cc_mdss_dptx0_link_clk", &disp_cc, 0x1b },
+	{ "disp_cc_mdss_dptx0_usb_router_link_intf_clk", &disp_cc, 0x1c },
+	{ "disp_cc_mdss_dptx0_link_intf_clk", &disp_cc, 0x1d },
+	{ "disp_cc_mdss_dptx0_crypto_clk", &disp_cc, 0x1e },
+	{ "disp_cc_mdss_dptx0_pixel0_clk", &disp_cc, 0x1f },
+	{ "disp_cc_mdss_dptx0_pixel1_clk", &disp_cc, 0x20 },
+	{ "disp_cc_mdss_dptx0_aux_clk", &disp_cc, 0x21 },
+	{ "disp_cc_mdss_dptx1_pixel0_clk", &disp_cc, 0x22 },
+	{ "disp_cc_mdss_dptx1_pixel1_clk", &disp_cc, 0x23 },
+	{ "disp_cc_mdss_dptx1_link_clk", &disp_cc, 0x24 },
+	{ "disp_cc_mdss_dptx1_usb_router_link_intf_clk", &disp_cc, 0x25 },
+	{ "disp_cc_mdss_dptx1_link_intf_clk", &disp_cc, 0x26 },
+	{ "disp_cc_mdss_dptx1_crypto_clk", &disp_cc, 0x27 },
+	{ "disp_cc_mdss_dptx1_aux_clk", &disp_cc, 0x28 },
+	{ "disp_cc_mdss_dptx2_pixel0_clk", &disp_cc, 0x29 },
+	{ "disp_cc_mdss_dptx2_pixel1_clk", &disp_cc, 0x2a },
+	{ "disp_cc_mdss_dptx2_link_clk", &disp_cc, 0x2b },
+	{ "disp_cc_mdss_dptx2_link_intf_clk", &disp_cc, 0x2c },
+	{ "disp_cc_mdss_dptx2_crypto_clk", &disp_cc, 0x2d },
+	{ "disp_cc_mdss_dptx2_aux_clk", &disp_cc, 0x2e },
+	{ "disp_cc_mdss_dptx3_pixel0_clk", &disp_cc, 0x2f },
+	{ "disp_cc_mdss_dptx3_link_clk", &disp_cc, 0x30 },
+	{ "disp_cc_mdss_dptx3_link_intf_clk", &disp_cc, 0x31 },
+	{ "disp_cc_mdss_dptx3_aux_clk", &disp_cc, 0x32 },
+	{ "disp_cc_mdss_dptx3_crypto_clk", &disp_cc, 0x33 },
+	{ "disp_cc_mdss_ahb_clk", &disp_cc, 0x34 },
+	{ "disp_cc_osc_clk", &disp_cc, 0x35 },
+	{ "disp_cc_esync0_clk", &disp_cc, 0x36 },
+	{ "disp_cc_esync1_clk", &disp_cc, 0x37 },
+	{ "disp_cc_mdss_mdp1_clk", &disp_cc, 0x38 },
+	{ "disp_cc_mdss_mdp_lut1_clk", &disp_cc, 0x39 },
+	{ "disp_cc_mdss_vsync1_clk", &disp_cc, 0x3a },
+	{ "disp_cc_mdss_ahb1_clk", &disp_cc, 0x3b },
+	{ "disp_cc_mdss_non_gdsc_ahb_clk", &disp_cc, 0x3c },
+	{ "disp_cc_mdss_rscc_vsync_clk", &disp_cc, 0x3d },
+	{ "disp_cc_mdss_rscc_ahb_clk", &disp_cc, 0x3e },
+	{ "disp_cc_mdss_mdp_lut_slp_stg_clk", &disp_cc, 0x3f },
+	{ "disp_cc_mdss_mdp_slp_stg_clk", &disp_cc, 0x40 },
+	{ "disp_cc_mdss_mdp_lut1_slp_stg_clk", &disp_cc, 0x41 },
+	{ "disp_cc_mdss_mdp1_slp_stg_clk", &disp_cc, 0x42 },
+	{ "disp_cc_mdss_spdm_pclk0_clk", &disp_cc, 0x43 },
+	{ "disp_cc_mdss_spdm_pclk1_clk", &disp_cc, 0x44 },
+	{ "disp_cc_mdss_spdm_pclk2_clk", &disp_cc, 0x45 },
+	{ "disp_cc_mdss_spdm_mdp_clk", &disp_cc, 0x46 },
+	{ "disp_cc_mdss_spdm_dp_crypto_clk", &disp_cc, 0x47 },
+	{ "disp_cc_mdss_spdm_dp_pixel_clk", &disp_cc, 0x48 },
+	{ "disp_cc_mdss_spdm_dp_pixel1_clk", &disp_cc, 0x49 },
+	{ "disp_cc_xo_clk", &disp_cc, 0x4a },
+	{ "disp_cc_mdss_accu_shift_clk", &disp_cc, 0x4b },
+	{ "disp_cc_sleep_clk", &disp_cc, 0x4c },
+	{ "phy_debug0_clk", &disp_cc, 0x4d },
+	{ "phy_debug1_clk", &disp_cc, 0x4e },
+	{ "phy_debug2_clk", &disp_cc, 0x4f },
+	{ "phy_debug3_clk", &disp_cc, 0x50 },
+	{ "phy_debug4_clk", &disp_cc, 0x51 },
+	{ "phy_debug5_clk", &disp_cc, 0x52 },
+	/* GPUCC entries */
+	{ "gcc_gpu_cfg_ahb_clk", &gpu_cc, 0x1 },
+	{ "gcc_gpu_snoc_dvm_gfx_clk", &gpu_cc, 0x2 },
+	{ "gcc_qdss_tsctr_div16_clk", &gpu_cc, 0x3 },
+	{ "gcc_gpu_trig_clk", &gpu_cc, 0x4 },
+	{ "gcc_gpu_apb_clk", &gpu_cc, 0x5 },
+	{ "gcc_gpu_at_clk", &gpu_cc, 0x6 },
+	{ "gcc_gpu_sleep_clk", &gpu_cc, 0x7 },
+	{ "cb_clk", &gpu_cc, 0x8 },
+	{ "gcc_gpu_memnoc_axi_clk", &gpu_cc, 0x9 },
+	{ "gcc_dpm_clk", &gpu_cc, 0xa },
+	{ "gx_clk_ctl_debug_clk", &gpu_cc, 0xb },
+	{ "gx_clk_ctl_pll_out_test", &gpu_cc, 0xc },
+	{ "gpu_cc_rscc_xo_aon_clk", &gpu_cc, 0xd },
+	{ "gpu_cc_cxo_aon_clk", &gpu_cc, 0xe },
+	{ "gpu_cc_freq_measure_clk", &gpu_cc, 0xf },
+	{ "gpu_cc_demet_clk", &gpu_cc, 0x10 },
+	{ "gpu_cc_gx_gmu_clk", &gpu_cc, 0x11 },
+	{ "gpu_cc_gx_ahb_ff_clk", &gpu_cc, 0x12 },
+	{ "gpu_cc_gx_acd_ahb_ff_clk", &gpu_cc, 0x13 },
+	{ "gpu_cc_gx_rcg_ahb_ff_clk", &gpu_cc, 0x14 },
+	{ "gpu_cc_gx_accu_shift_clk", &gpu_cc, 0x15 },
+	{ "bi_tcxo_gated_for_gx", &gpu_cc, 0x16 },
+	{ "gpu_cc_ahb_clk", &gpu_cc, 0x17 },
+	{ "gpu_cc_cx_qdss_at_clk", &gpu_cc, 0x18 },
+	{ "gpu_cc_cx_qdss_tsctr_clk", &gpu_cc, 0x19 },
+	{ "gpu_cc_cx_apb_clk", &gpu_cc, 0x1a },
+	{ "gpu_cc_sleep_clk", &gpu_cc, 0x1b },
+	{ "gpu_cc_cx_qdss_trig_clk", &gpu_cc, 0x1c },
+	{ "gpu_cc_cx_gmu_clk", &gpu_cc, 0x1d },
+	{ "gpu_cc_cxo_clk", &gpu_cc, 0x1e },
+	{ "gpu_cc_hub_cx_int_clk", &gpu_cc, 0x1f },
+	{ "gpu_cc_cx_ff_clk", &gpu_cc, 0x20 },
+	{ "gpu_cc_memnoc_gfx_clk", &gpu_cc, 0x21 },
+	{ "gpu_cc_memnoc_gfx_slp_stg_clk", &gpu_cc, 0x22 },
+	{ "gpu_cc_cx_gmu_slp_stg_clk", &gpu_cc, 0x23 },
+	{ "gpu_cc_cx_accu_shift_clk", &gpu_cc, 0x24 },
+	{ "gpu_cc_dpm_clk", &gpu_cc, 0x25 },
+	{ "gpu_cc_rbcpr_clk", &gpu_cc, 0x26 },
+	{ "gpu_cc_rbcpr_ahb_clk", &gpu_cc, 0x27 },
+	{ "gpu_cc_cb_clk", &gpu_cc, 0x28 },
+	{ "gpu_cc_rscc_hub_aon_clk", &gpu_cc, 0x29 },
+	{ "gpu_cc_hub_aon_clk", &gpu_cc, 0x2a },
+	/* VIDEOCC Entries */
+	{ "video_cc_mvs0c_clk", &video_cc, 0x1 },
+	{ "video_cc_mvs0c_freerun_clk", &video_cc, 0x2 },
+	{ "video_cc_mvs0c_slp_stg_clk", &video_cc, 0x3 },
+	{ "video_cc_mvs0_clk", &video_cc, 0x4 },
+	{ "video_cc_mvs0_freerun_clk", &video_cc, 0x5 },
+	{ "video_cc_mvs0_slp_stg_clk", &video_cc, 0x6 },
+	{ "video_cc_ahb_clk", &video_cc, 0x7 },
+	{ "video_cc_xo_clk", &video_cc, 0x8 },
+	{ "video_cc_mvs0_shift_clk", &video_cc, 0x9 },
+	{ "video_cc_mvs0c_shift_clk", &video_cc, 0xa },
+	{ "video_cc_sleep_clk", &video_cc, 0xb },
+	{ "video_cc_mvs0_freerun_slp_stg_clk", &video_cc, 0xc },
+	{}
+};
+
+struct debugcc_platform sm8750_debugcc = {
+	"sm8750",
+	sm8750_clocks,
+};
-- 
2.43.0



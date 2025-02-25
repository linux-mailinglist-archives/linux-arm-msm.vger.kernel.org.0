Return-Path: <linux-arm-msm+bounces-49230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD7AA438DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DEE3BCBC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CED2686A2;
	Tue, 25 Feb 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izCIGCv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D782661B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474325; cv=none; b=csxKaSVXvvJJtEYH3Kh/gg1oj967W4BfjLtSlDMVHY7qYq4wEo+pWG71KVcwG6C3HtjESMxyPI8LmDVuwEmI64ZmHlHgkiyUD1iE44Q7sogX6HkyjPQF1DqbyCqcM2d/Oem2OqNDG3049LVH3kD1wihUrgTV8piypQbBQj+MfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474325; c=relaxed/simple;
	bh=bMnp0Uv2RC/2qm+VTO2WwzTvIrV/Oa4fubd2QbCJsQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dm5k9i8Ln5QnbFb0+vuSrN0Rpu5pXR00WrRIo8/zYkq4bVlW7WIM2j4iVk8IAAhOyv35ov1Qa7QQEJp0i6/BLFn/mTkzlCpStfjh+LVRK+2VQoJzpp+VWndk+TnLK8gai5ff+wP4+CrFlM5FYXEVLPnc//8MSINrBrRCl1oDHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izCIGCv+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f286b5281so2614130f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474320; x=1741079120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qes3tRHCIiE6XaA2j1UDqLiTUcC6/RfCgficPmtmZ0=;
        b=izCIGCv+qwqcQQQrVP5X/RnOTMNcG2g9wAdSjvRsz8S9u3T4rHes1m0+r/P2IdG6va
         0/EGyv7S7i1El/Pcd1GXP0elJr1XAMEwIpEvg/EEcQ4aE7T8+beDR30mVBQhpCsluhnC
         dLZd5ZpldVIJ5UleqthXgVYBT7ekce9W4rxFBQvfX7a4obECSiFOSNG+G+YhOZd9MiO0
         iRAS1p2QKtMBx8TZmN8/asJ0YOW8a9ht9E+IaRQIqWs9qzKLZHMpO3Ce1Ry5zihdLnrs
         X28CsrNOTVAWgeSe6PwOB9k6DTKcM1QqloMMBtJgxa4l462KMoJs+vlde7p9BpA2+QQV
         Uj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474320; x=1741079120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Qes3tRHCIiE6XaA2j1UDqLiTUcC6/RfCgficPmtmZ0=;
        b=rfR+OTEOF41oKf7xC5/0DF9hhkkx9pflQZAvTrjodMUvHlfjpA/QZ4VMfoTa8Md0iW
         qqyu7ytXO9gNVxZBgYQJez0OqArvOyLGvnXnCENy8TY5qrjPhz1hVGzeoz779J1VUNid
         ogqFP6U2//wdzNZPqfVQ3/Mw1JArc73xbmM1wY3YF5mF14gZxNDc9Q+GglHLKdd2wEAx
         ZWRZbczkNEwg5JUAadOEGgMz8REdy37SX1KcuTRU/2QwDYgAM4xZsbkgbw+sG0m8/FAY
         H2MzdvLOxCrk3pgLJ2Q9PjhPyNSkXrKix2wFSo6gwXPNn5nauQJY+Nt7dHn3LxCY3nGk
         e4Vw==
X-Gm-Message-State: AOJu0Yz0q8KzKS2kPDI+mmhCjDZmr3kWBymE7fFUFN06oSW9/dP+BehD
	8WqQPVWXKWXaYbwwoZ3+DnoMer8s3sJ7eSWYcLoZeJg6CWtQiYnmtX2caA1hm/w=
X-Gm-Gg: ASbGnctOiTKyyDO0wu2OmXYyQYhzUznbEYBRZOaHh09wDstbIKfEOs3aUaCLz5yYQ6v
	P83AehE2OR4TYqmvuuA5RjlAtkYIJxi2yqYbxrib+N7QxEh0p1HVSlVHRzDX2XUFkYk/wx1keVB
	K//DiKnjy6ime2PsR+I+S4+L3wqL6jKqjgqAAdHt90iXBMinyfgowz74dCFJYn0w/oCX4Zj1d8d
	lcpYDqt1ozvEW6Vytn3a8oohjGFxIycJrX37jK/xVqRDc8uJHnJ2YABfr072kP9A/Q9vdzRZ/xJ
	ju06Ipsjw/9P1l8BJ0QlSZ3ctSMk1fBBXNm9gBCE023GY9s=
X-Google-Smtp-Source: AGHT+IGIBleUpJRwMgi0GGFLaVVU/+CSCH6SInFt9ICHblgQKRHs2p9Ms14bMbDwb2+awMJ2P5t/dw==
X-Received: by 2002:a05:6000:1a8a:b0:38d:dcf1:d156 with SMTP id ffacd0b85a97d-38f7079f6f3mr14548229f8f.25.1740474319997;
        Tue, 25 Feb 2025 01:05:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86c93bsm1573540f8f.26.2025.02.25.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 25 Feb 2025 10:05:11 +0100
Subject: [PATCH 3/4] media: platform: qcom/iris: add support for vpu33
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-topic-sm8x50-iris-v10-v1-3-128ef05d9665@linaro.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
In-Reply-To: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12430;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bMnp0Uv2RC/2qm+VTO2WwzTvIrV/Oa4fubd2QbCJsQ4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnvYfM78sDMRxO6p7itptPpcECH1GQFVBMSjtVh6Mg
 o8067OaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ72HzAAKCRB33NvayMhJ0VsYD/
 sHTQN1AWZCDfEYV3acn/ES7P4RIV1ftVcQpzCm88+0iBRwR5aHHOG3on6mex4e+24vuBLRgcjoj1Th
 nXs74ce6Dcj31KetoCN4a7uhpdXU9kqjikD3buXM8V92x6CL8FPPJKpa2c29uOk9EcZUd4xO5xBfwS
 uTOCzvGE3CKZxd/DX1H6M/lyrdWUysO5wxJzEJPGvdomhRisrd0a9d+NNA7C5v30m03g7nBfE0i1z7
 7w5aVRrq9dCOFRNcjQx3jYdp70Vmjrtwb5Su3/PbB/hQ7SiNI1lCK2keLZcomIKWX9IVTsnzM2eA8k
 z0sNHXUDW4Skfdv0btv5KV0jwV5i2A5d9VmrcKsi+Tv3mZYZfOogc+XBdGISKtBM0WrCx5xj67ht+A
 bl5Dp28ZtVnz1fLUTn/0A9IFjPM46dlTHnLymErYDxDF8qfryYywj9w22oOBpi90Tca6qfDoC8xv5L
 M+AT90HChU+5uVZ1yC/3k54RLNY5od9FQMm5IMJ3kwAii4AN5uDlYkwSRF5tkDNuCk5n961w3hBHVK
 ZPms4B9H06tyXXmOmcdIiI4dCxSFrOY9gzhfMirfQ2NLNfqQ4Z1YsdcEiP90QVJCPVGlNVfpjb078X
 mnBUkkZ/aj1VekdF2M3zToVbjMh7WvhtNGJJFe/mpIeS8DsiL83GHgax4T1Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The IRIS acceleration found in the SM8650 platforms uses the vpu33
hardware version, and requires a slighly different reset and power off
sequences in order to properly get out of runtime suspend.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_vpu33.c      | 315 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 3 files changed, 317 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 35390534534e93f4617c1036a05ca0921567ba1d..6b64c9988505afd9707c704449d60bb53209229f 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -21,6 +21,7 @@ qcom-iris-objs += \
              iris_vdec.o \
              iris_vpu2.o \
              iris_vpu3.o \
+             iris_vpu33.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu33.c b/drivers/media/platform/qcom/iris/iris_vpu33.c
new file mode 100644
index 0000000000000000000000000000000000000000..128a050f206f99ec0d43b97ff995fa50d5684150
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu33.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_TZ_BASE_OFFS			0x000C0000
+#define AON_BASE_OFFS				0x000E0000
+#define AON_MVP_NOC_RESET			0x0001F000
+
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
+#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
+#define REQ_POWER_DOWN_PREP			BIT(0)
+#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
+#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
+#define CORE_CLK_RUN				0x0
+
+#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
+#define CTL_AXI_CLK_HALT			BIT(0)
+#define CTL_CLK_HALT				BIT(1)
+
+#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
+#define RESET_HIGH				BIT(0)
+
+#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
+#define CORE_BRIDGE_SW_RESET			BIT(0)
+#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+
+#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
+#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
+#define MSK_CORE_POWER_ON			BIT(1)
+
+#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
+#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
+
+#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
+
+#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
+
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
+
+#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
+#define SW_RESET				BIT(0)
+#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
+#define NOC_HALT				BIT(0)
+#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
+
+#define VCODEC_DMA_SPARE_3 0x87B8
+
+static int reset_control_bulk_assert_id(int num_rstcs,
+					struct reset_control_bulk_data *rstcs,
+					char *id)
+{
+	int i;
+
+	for (i = 0; i < num_rstcs; ++i) {
+		if (!strcmp(rstcs[i].id, id))
+			return reset_control_assert(rstcs[i].rstc);
+	}
+
+	return -ENODEV;
+}
+
+static int reset_control_bulk_deassert_id(int num_rstcs,
+					  struct reset_control_bulk_data *rstcs,
+					  char *id)
+{
+	int i;
+
+	for (i = 0; i < num_rstcs; ++i) {
+		if (!strcmp(rstcs[i].id, id))
+			return reset_control_deassert(rstcs[i].rstc);
+	}
+
+	return -ENODEV;
+}
+
+static bool iris_vpu33_hw_power_collapsed(struct iris_core *core)
+{
+	u32 value, pwr_status;
+
+	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+	pwr_status = value & BIT(1);
+
+	return pwr_status ? false : true;
+}
+
+static void iris_vpu33_power_off_hardware(struct iris_core *core)
+{
+	u32 reg_val = 0, value, i;
+	int ret;
+	int count = 0;
+
+	if (iris_vpu33_hw_power_collapsed(core))
+		goto disable_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	value = readl(core->reg_base + VCODEC_DMA_SPARE_3);
+	value |= BIT(0);
+	writel(value, core->reg_base + VCODEC_DMA_SPARE_3);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
+					 reg_val, reg_val & 0x400000, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
+	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	value |= BIT(0);
+	writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+	while ((!(value & BIT(0))) && (value & BIT(1) || value & BIT(2))) {
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		value &= ~BIT(0);
+		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+		usleep_range(10, 20);
+
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		value |= BIT(0);
+		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+		usleep_range(10, 20);
+
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		++count;
+		if (count >= 1000)
+			break;
+	}
+
+	if (count < 1000) {
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		value &= ~BIT(0);
+		writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+	}
+
+	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 reg_val, reg_val & 0x3, 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 reg_val, !(reg_val & 0x3), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_power:
+	iris_vpu_power_off_hw(core);
+}
+
+static int iris_vpu33_power_off_controller(struct iris_core *core)
+{
+	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+	u32 val = 0;
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
+	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+				 val, val == 0, 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
+	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
+	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
+	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
+	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
+
+	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "bus");
+	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "core");
+	usleep_range(1000, 1100);
+	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "bus");
+	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "core");
+
+	/* Disable MVP NoC clock */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+	val |= NOC_HALT;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+
+	/* enable MVP NoC reset */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+	val |= SW_RESET;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+
+	/* poll AON spare register bit0 to become zero with 50ms timeout */
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_SPARE,
+				 val, (val & BIT(0)) == 0, 1000, 50000);
+	if (ret)
+		goto disable_power;
+
+	/* enable bit(1) to avoid cvp noc xo reset */
+	val = readl(core->reg_base + AON_WRAPPER_SPARE);
+	val |= BIT(1);
+	writel(val, core->reg_base + AON_WRAPPER_SPARE);
+
+	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "xo");
+
+	/* De-assert MVP NoC reset */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+	val &= ~SW_RESET;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+
+	usleep_range(80, 100);
+	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "xo");
+
+	/* reset AON spare register */
+	writel(0, core->reg_base + AON_WRAPPER_SPARE);
+
+	/* Enable MVP NoC clock */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+	val &= ~NOC_HALT;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+
+disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+
+	return 0;
+}
+
+static u64 iris_vpu33_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 height, width, mbs_per_second, mbpf;
+	u64 fw_cycles, fw_vpp_cycles;
+	u64 vsp_cycles, vpp_cycles;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	fw_cycles = fps * caps->mb_cycles_fw;
+	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
+
+	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
+	/* 21 / 20 is minimum overhead factor */
+	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
+
+	/* 1.059 is multi-pipe overhead */
+	if (inst->fw_caps[PIPE].value > 1)
+		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
+
+	vsp_cycles = fps * data_size * 8;
+	vsp_cycles = div_u64(vsp_cycles, 2);
+	/* VSP FW overhead 1.05 */
+	vsp_cycles = div_u64(vsp_cycles * 21, 20);
+
+	if (inst->fw_caps[STAGE].value == STAGE_1)
+		vsp_cycles = vsp_cycles * 3;
+
+	return max3(vpp_cycles, vsp_cycles, fw_cycles);
+}
+
+static int iris_vpu33_reset_controller(struct iris_core *core)
+{
+	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+
+	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "bus");
+	reset_control_bulk_assert_id(rst_tbl_size, core->resets, "core");
+
+	usleep_range(1000, 1100);
+
+	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "bus");
+	reset_control_bulk_deassert_id(rst_tbl_size, core->resets, "core");
+
+	return 0;
+}
+
+const struct vpu_ops iris_vpu33_ops = {
+	.reset_controller = iris_vpu33_reset_controller,
+	.power_off_hw = iris_vpu33_power_off_hardware,
+	.power_off_controller = iris_vpu33_power_off_controller,
+	.calc_freq = iris_vpu33_calculate_frequency,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index c948d8b5aee87ccf1fd53c5518a27294232d8fb8..c4d02a3b884881eb033dc0342f948848adae2819 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -10,6 +10,7 @@ struct iris_core;
 
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
+extern const struct vpu_ops iris_vpu33_ops;
 
 struct vpu_ops {
 	int (*reset_controller)(struct iris_core *core);

-- 
2.34.1



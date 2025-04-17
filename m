Return-Path: <linux-arm-msm+bounces-54660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D12CA920B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 17:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38E1919E83AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 15:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A70D254870;
	Thu, 17 Apr 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oWZ0GJPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB825393F
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901954; cv=none; b=pN8aVfxbru0Y0QDEkKQFCETKxdpX0LbS2RGs2FxGONgNie01+bmfoO/qaVz4Nby0jCjC+JfoGB8MusYMXwxuRbEgas7k9Z2bAPkJO3dWkse/plcugP1O9m1+2WGh3uBONCV59nXMngMkFbt6u7/24KaB0/R0gxLB0gu7sjC45JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901954; c=relaxed/simple;
	bh=fdVB/WDnUbOKrbnaFpC+5KLneXfwe1Hbvq+oQZ56p8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJq/RtfTEZJk3Tr/u2qUUgqx4gxKsg7TbwTUKPfG0UuYSSxSjfkt6OKMKUCaKBGqJv1r7qhHojy4r1DqB8JCOINU+SionQ5GJy9K7Sp8SzH9CZtOFbMs7iQwRIdxpRKJO9gLrnl6Ko9PqqwdJEX0nGqLVjhyt2wgfoyodamj+Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oWZ0GJPc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c30d9085aso708595f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744901950; x=1745506750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjNA/3yEeV6k5zGB03XZkp0NfQT5RQXMDZFss0yeJfc=;
        b=oWZ0GJPcZY4pWzKrxDJ1HoMN15LCkRI780MM7h6FCVGXL73wHbAH38VxhQQuLoss1q
         GE7t9GyAlCMVSckkrsGTvxEjpNtG/eVUjEjNRhbJRqs436QLuc+rFtDXmZdVBjdn5YAR
         ehjBeJiFntVC9AQOMmgnSS0aaFAz7Pfm0yvFkNnfnjbiwFvIVWhobEshl3LDyMPuutMe
         2a+tsNppzMMzrZzjKHGtjJdZlOa6RqhgZH579JW3iiYaSeOW7SGdPx8/NDV8jj0Jwgde
         QTXJk0z1XLZqODKZDFS2rDpjYKwqKfHyp9Vv22/KweuN5zQvbDdjN7Zmjr9xmVsK0I55
         NuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901950; x=1745506750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjNA/3yEeV6k5zGB03XZkp0NfQT5RQXMDZFss0yeJfc=;
        b=kVs/finZTWRNHxXmJpncOsD9ZgLzhmCbBaNC0ieUFIOZ8PW+sjQm51IiwwEsx+VOpZ
         40QTGnxZL4yg0ZeR6AbqXiLxP9Z+AvqP1DZPVTuOVSKQzntTYh+phgaqYFn9Xp+hlg9T
         S5IdjsGnKwRm89ZxJZcAh1w6NRxU7FgEn7vF0xJypg1lGhX/5AdtjzHvFd5VCIORjOD/
         ANJwREMhOJ38D71wJg0t9wrdY4/N3uyaTUY6Ai2h0o0KkkUl3VnnqSuTk5z9uoGouZ3P
         01/q5HiCa1wSiZ2d5VX2S4F+ldjtPXuwlWTDocRhIV9d0+TOgohSicvG427R7EUl9VbT
         OmyA==
X-Forwarded-Encrypted: i=1; AJvYcCUtKkbKWN5E2P1TaudJYJoo4+oGKHXEH/7gNUiIzjt/bb/T+F32o3i4eU+nbagJWcY3d6MXk48xhdR3HQwS@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzNrs/c/dbjM56MM+quAQdxztZGyatVAs1nUAq82R5Tls/Rqh
	gsdo4CzBFlpM6JXeOCKcvQ5P18DpLY7EM+gH4wEXmJZssgIJzb9vhz1L6eEKcc/wpjbJrc37Jik
	S
X-Gm-Gg: ASbGncsag4SN5PEjJHmyQZ919Jaybop9jujWaVxvvTzs5oaB7vEIhjPy5YT4WaxDWcH
	ziYBX/AIoZl5pUMQXqHTXinCLNenWzciEDhioS8of8UoYD5PydV2Qczy1H4cyjuOo9VF6XBbeef
	8pc9PYa6L43sAxRWwFJeWqAJQNk7svkt3/XUY+FEP5LGU8HCcHCF8dmRWWeZK5RKvQohsM3CQye
	icea018BVTH3717W0S+LOMg568p3qGR6FdHm+8B1OZ5Gk8FHFwdG7IJCnFdzPy9Jsl7oiyBMtpx
	WLGJpXfgafrrsEhi+JjPpbtnPrqIwn65N6oJsR1hsZXTqn4fjpEd+hFy1lT6bw==
X-Google-Smtp-Source: AGHT+IFbhofy7jyzcHmE1e6RDe0W5wfG1rnX7r64EAn1Bd7gnW4ic8jp8TJIYWqLIqlrX6V+bVw9/w==
X-Received: by 2002:a5d:6d83:0:b0:391:49f6:dad4 with SMTP id ffacd0b85a97d-39ee5b9912dmr5309501f8f.41.1744901949643;
        Thu, 17 Apr 2025 07:59:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm20497743f8f.97.2025.04.17.07.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:59:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 17 Apr 2025 16:59:05 +0200
Subject: [PATCH v7 5/7] media: platform: qcom/iris: add support for vpu33
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-topic-sm8x50-iris-v10-v7-5-f020cb1d0e98@linaro.org>
References: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
In-Reply-To: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8847;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fdVB/WDnUbOKrbnaFpC+5KLneXfwe1Hbvq+oQZ56p8Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoARc3RuamY1AvALkb8JRdgy5Bm6FOf76C4Nd120PD
 zeIevkqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAEXNwAKCRB33NvayMhJ0eCsD/
 9X2HUgJj/jVn1M/W3hCtwiI2QnuKKHfIJkVdYxFP6f0aq9aTXe2msE1SyxILjtI8APFlgc8K4RPd4i
 IRb5leMlOsj+m2S7cb4ktAORs2Eb7p7KbEWsL+99iOq55PLxh2CUGp+56pCjL6XmvGsSxvbU4oLgT4
 CN0cVpSNb9wQFOxPTuf8sZwH5BTNqe6tw5aljp1b1qe1cuZFudGQmkvsJryi3VoHIIFj+3nunUQehw
 2MmUIF/gR+6vN1bBljSA3/7lfvoSdOxJkUKfOFGDL3x12xaxGyvBE2W6wecEMB/DKri8E1Eucom5oN
 hxnknuQmYaExVI+Z7jT9UyRCwhudnwloJiDICDb5ilUraj/TDjnnCP+tyvKqk4WxIXAd0ZniqvA0a1
 KzFybcqUwsq17lZJvsh+akmMs8HTLtn9u1pUVR7+YdHdn0AhqPXPTPAKDnWZfnCw8qniCywUH+HW3t
 gvRvyWwhCruAudSfrsVGC8EeYq5x5vpRJYjNO0Rv8MeGat4ZtbFkMZ+t2Ktyp0MNo7DZU5vWB9FM4E
 DdG/44hI3evJYCrUW+BHW2BWRGIXTyyArdVYppd61UnGQtawsGRckE3T3O7m9D2ao/6iCBHUJ1E1fz
 /a3qyxDVj9ydPII1gUWCxP6bIMiD1So+K9bkJBlRmAHGGHGgDatFeb2LpCcA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The IRIS acceleration found in the SM8650 platforms uses the vpu33
hardware version, and requires a slighly different reset and power off
sequences in order to properly get out of runtime suspend.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 160 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 2 files changed, 157 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 13dab61427b8bd0491b69a9bc5f5144d27d17362..9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -4,20 +4,39 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/reset.h>
 
 #include "iris_instance.h"
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
+#define WRAPPER_TZ_BASE_OFFS			0x000C0000
+#define AON_BASE_OFFS				0x000E0000
 #define AON_MVP_NOC_RESET			0x0001F000
 
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
+#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
+#define REQ_POWER_DOWN_PREP			BIT(0)
+#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
 
+#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
+#define CTL_AXI_CLK_HALT			BIT(0)
+#define CTL_CLK_HALT				BIT(1)
+
+#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
+#define RESET_HIGH				BIT(0)
+
 #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
 #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
 
+#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
+#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
+#define MSK_CORE_POWER_ON			BIT(1)
+
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
@@ -25,7 +44,16 @@
 
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
 
-static bool iris_vpu3_hw_power_collapsed(struct iris_core *core)
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
+
+#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
+#define SW_RESET				BIT(0)
+#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
+#define NOC_HALT				BIT(0)
+#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
+
+static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 {
 	u32 value, pwr_status;
 
@@ -40,7 +68,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	u32 reg_val = 0, value, i;
 	int ret;
 
-	if (iris_vpu3_hw_power_collapsed(core))
+	if (iris_vpu3x_hw_power_collapsed(core))
 		goto disable_power;
 
 	dev_err(core->dev, "video hw is power on\n");
@@ -79,7 +107,125 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	iris_vpu_power_off_hw(core);
 }
 
-static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
+static void iris_vpu33_power_off_hardware(struct iris_core *core)
+{
+	u32 reg_val = 0, value, i;
+	int ret;
+
+	if (iris_vpu3x_hw_power_collapsed(core))
+		goto disable_power;
+
+	dev_err(core->dev, "video hw is power on\n");
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
+		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
+					 reg_val, reg_val & 0x400000, 2000, 20000);
+		if (ret)
+			goto disable_power;
+	}
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+				 reg_val, reg_val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
+	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
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
+	u32 xo_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
+	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
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
+	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
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
+	reset_control_bulk_assert(xo_rst_tbl_size, core->controller_resets);
+
+	/* De-assert MVP NoC reset */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+	val &= ~SW_RESET;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+
+	usleep_range(80, 100);
+
+	reset_control_bulk_deassert(xo_rst_tbl_size, core->controller_resets);
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
+static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
 	struct v4l2_format *inp_f = inst->fmt_src;
@@ -119,5 +265,11 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_off_controller = iris_vpu_power_off_controller,
-	.calc_freq = iris_vpu3_calculate_frequency,
+	.calc_freq = iris_vpu3x_calculate_frequency,
+};
+
+const struct vpu_ops iris_vpu33_ops = {
+	.power_off_hw = iris_vpu33_power_off_hardware,
+	.power_off_controller = iris_vpu33_power_off_controller,
+	.calc_freq = iris_vpu3x_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f8965661c602f990d5a7057565f79df4112d097e..93b7fa27be3bfa1cf6a3e83cc192cdb89d63575f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -10,6 +10,7 @@ struct iris_core;
 
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
+extern const struct vpu_ops iris_vpu33_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);

-- 
2.34.1



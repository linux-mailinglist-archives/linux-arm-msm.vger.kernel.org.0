Return-Path: <linux-arm-msm+bounces-54703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8226EA93349
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 09:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1C7C3A8AB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 07:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A801526A086;
	Fri, 18 Apr 2025 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGBJ6508"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6237A268C41
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960462; cv=none; b=ExIMeBN/wwv/wepKGLV1f+ltm/pxRj9ThV6TPQ2TN0U12ZsFPILYjVAHTWrpH5NBcE5iGwZr6vxukaVdglz18vtGJiZoFFt3lWlAiztro7Yxuw34Q8STS8JXZqoXo6KgCvVuYdVeUgioEEd3buDVlf15+ZBeG4Kd1o7NhoH2Qvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960462; c=relaxed/simple;
	bh=k0KuEXvq+MOCnceYGenhNjNVdcAdyjcS6kAdl/Velqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaOdS/uOSHDO21/tFFpbZm0ZgT6bC0tiCNkpIMkZuUhRT9qF5OH6jBwHSWNvuDrzMCzWKwu/wLrbVVZZmIMx3l3cBZhtrxkmXVGQfGpyvF/BjrsdwYn2wDu2Xt3fKcvIroE8vP923JX/c+zCmGtWAMGH5vz7mlsgyYPT5LRJA5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGBJ6508; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so1336173f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 00:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744960459; x=1745565259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xH6IgbP0MJS61JNMi2Q8JotgjtdJCx1rOz4YKT8gRXY=;
        b=zGBJ6508pbrLVB0Xg33+QmtuAh5CiV0vnN0LHRnxD+xezfCFEJPH2dlhpPLZJW8RTr
         TjbD3qGwgmxET5+xVM/FS322oXivMw7ugFO3gBzRMUPefJI6jN2B7ZsVoAWMp2jbdJqJ
         K8p1PVnA25wAOctCgz5t0j0VBktjjDr4FqiNY+/aiOpb+Vl++o1PVkA6NR/RXCI4ddkH
         H6yc6Nvh7iUVzAAiwjMVYLSZHf6mO+ls3Xig/vX18Dkiq5I+eNZbhibRlTX9kBd8Xyqu
         kMkMjVBQHhOy0kR3XT4ixWQ1WZEWs1JgQYK3KJGU8Ri1ICcQUEelByBFSjqDrkMxWTaS
         BD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960459; x=1745565259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xH6IgbP0MJS61JNMi2Q8JotgjtdJCx1rOz4YKT8gRXY=;
        b=ke9/nnMv9Ds9z13jnqrrasMt3+M0hrBcECUuN8kqAsmSMU1ySa481GnE7O+x/PGcWI
         VPHDOOwNhFQuPlHZh7SKlmh2CFMkUikIuCk2ihjnk/qWFuDLJi9WNs/K6H97cwzLRQtH
         R28tYnS07P7Ko3DfQ26zC3U++XW/S+iGt4mR3N7IIT/25yFAD94VgGGN23fYBDfpcX7b
         yE2WfdTo6nNQ3mYXgtCsO3gwFdoxIaPFYZdMLNGyJgF5cvAgZp944ug0wsSlr1jfav45
         LS3an2ih2EOJGGjxFQ0ndJdAbQoEc3ipN4MMWm63h79fHG8T/qaJluz3m2mvqzxCx/CQ
         pwHA==
X-Gm-Message-State: AOJu0YwBTUa5tHg2/rz7qpbfyuav6ICR0d8rubSkW5smbrkOzRFZkZIc
	Ly7VLwH+/UGpNIlT40RhONoDufG7S5/fT84BD1Si/YLEncKuIPDn9fhx5fELlcU=
X-Gm-Gg: ASbGnctmStNk3l1CBXyj6Ng3EXqC6DHTluOLLQi3n314sBN5N05G7AL0Q21RDIYVD5g
	c/N6siP5jfbjy3eHdISUXqfBLXGTlZI069/jxPSqAuZHgSP2hTaqjkfnWI92KB5J1ga91iETSOT
	ddlTgT0WKCQgi0ZQ+leKZWMciSVaExrkzbZVzDNhsUbgduiy63QD0DmvhodQrUFIojU5DFE5l5/
	AEZAlHqiOvMzW0M1W0e+5n9E1Ayt5XK4ctGFx4yTGa6RDKSONwYYxCvuT3c9DkOG+ZFm7dNQPuF
	4f46hPzhvwydvAAtXOu2mVdQVrjRs0AMeOlxsg5lZ0GnsP4SdKptQxxHziUVSrUpfViVrnZe+GK
	zeYTXdg==
X-Google-Smtp-Source: AGHT+IFIsioJUDvSsEgGpkgMf+fkI+VXaoTOo9x4Gq7n/V7b85JMvT+PYj28VaPdg1Wpc5F9DveorA==
X-Received: by 2002:a05:6000:401e:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-39efbb02156mr1052886f8f.49.1744960458642;
        Fri, 18 Apr 2025 00:14:18 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d03csm1938843f8f.59.2025.04.18.00.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 00:14:18 -0700 (PDT)
Message-ID: <87f96a3e-037b-465d-92c9-4ec0db33de18@linaro.org>
Date: Fri, 18 Apr 2025 08:14:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: qcom: camss: Add CSID 340 support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
 <20250417145819.626733-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250417145819.626733-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/2025 15:58, Loic Poulain wrote:
> Add support for CSID found in QCM2290, it's a simplified gen-2 version.
> - There is no Test Pattern Generator (moved outside CSID)
> - There is no subsampling (moved to CAMIF module)
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../platform/qcom/camss/camss-csid-340.c      | 190 ++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csid.h    |   1 +
>   3 files changed, 192 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 719898f5d32b..3217bf40976d 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -6,6 +6,7 @@ qcom-camss-objs += \
>   		camss-csid.o \
>   		camss-csid-4-1.o \
>   		camss-csid-4-7.o \
> +		camss-csid-340.o \
>   		camss-csid-680.o \
>   		camss-csid-gen2.o \
>   		camss-csid-780.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> new file mode 100644
> index 000000000000..92726de48514
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module 340
> + *
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-gen2.h"
> +
> +#define CSID_RST_STROBES					(0x010)
> +#define		CSID_RST_SW_REGS			BIT(0)
> +#define		CSID_RST_IRQ				BIT(1)
> +#define CSID_RST_IFE_CLK				BIT(2)
> +#define		CSID_RST_PHY_CLK			BIT(3)
> +#define		CSID_RST_CSID_CLK			BIT(4)
> +
> +#define CSID_IRQ_STATUS						(0x070)
> +#define CSID_IRQ_MASK						(0x074)
> +#define		CSID_IRQ_MASK_RST_DONE			BIT(0)
> +#define CSID_IRQ_CLEAR						(0x078)
> +#define CSID_IRQ_CMD						(0x080)
> +#define		CSID_IRQ_CMD_CLEAR			BIT(0)
> +
> +#define CSID_CSI2_RX_CFG0					(0x100)
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES_MASK	GENMASK(1, 0)
> +#define		CSI2_RX_CFG0_DLX_INPUT_SEL_MASK		GENMASK(17, 4)
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL_MASK		GENMASK(21, 20)
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL_BASE_IDX	1
> +#define		CSI2_RX_CFG0_PHY_TYPE_SEL		BIT(24)
> +
> +
> +#define CSID_CSI2_RX_CFG1					(0x104)
> +#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN	BIT(0)
> +#define		CSI2_RX_CFG1_MISR_EN			BIT(6)
> +#define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
> +
> +#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
> +#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
> +#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
> +#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
> +#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
> +#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
> +#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
> +#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
> +#define		CSID_RDI_CFG0_ENABLE			BIT(31)
> +
> +#define CSID_RDI_CTRL(rdi)					(0x308 + 0x100 * (rdi))
> +#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
> +#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy, int vc)
> +{
> +	u32 val;
> +
> +	val = FIELD_PREP(CSI2_RX_CFG0_NUM_ACTIVE_LANES_MASK, phy->lane_cnt - 1);
> +	val |= FIELD_PREP(CSI2_RX_CFG0_DLX_INPUT_SEL_MASK, phy->lane_assign);
> +	val |= FIELD_PREP(CSI2_RX_CFG0_PHY_NUM_SEL_MASK,
> +			  phy->csiphy_id + CSI2_RX_CFG0_PHY_NUM_SEL_BASE_IDX);
> +	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> +	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> +{
> +	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
> +}
> +
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +{
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +	u8 lane_cnt = csid->phy.lane_cnt;
> +	u8 dt_id;
> +	u32 val;
> +
> +	if (!lane_cnt)
> +		lane_cnt = 4;
> +
> +	/*
> +	 * DT_ID is a two bit bitfield that is concatenated with
> +	 * the four least significant bits of the five bit VC
> +	 * bitfield to generate an internal CID value.
> +	 *
> +	 * CSID_RDI_CFG0(vc)
> +	 * DT_ID : 28:27
> +	 * VC    : 26:22
> +	 * DT    : 21:16
> +	 *
> +	 * CID   : VC 3:0 << 2 | DT_ID 1:0
> +	 */
> +	dt_id = vc & 0x03;
> +
> +	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
> +	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
> +	val |= FIELD_PREP(CSID_RDI_CFG0_VC_MASK, vc);
> +	val |= FIELD_PREP(CSID_RDI_CFG0_DTID_MASK, dt_id);
> +
> +	if (enable)
> +		val |= CSID_RDI_CFG0_ENABLE;
> +
> +	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
> +		csid->id, enable ? "enable" : "disable", format->data_type, vc);
> +
> +	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	int i;
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i);
> +			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +	}
> +}
> +
> +static int csid_reset(struct csid_device *csid)
> +{
> +	unsigned long time;
> +
> +	writel_relaxed(CSID_IRQ_MASK_RST_DONE, csid->base + CSID_IRQ_MASK);
> +	writel_relaxed(CSID_IRQ_MASK_RST_DONE, csid->base + CSID_IRQ_CLEAR);
> +	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	/* Reset with registers preserved */
> +	writel(CSID_RST_IRQ | CSID_RST_IFE_CLK | CSID_RST_PHY_CLK | CSID_RST_CSID_CLK,
> +	       csid->base + CSID_RST_STROBES);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID%u: reset timeout\n", csid->id);
> +		return -EIO;
> +	}
> +
> +	dev_dbg(csid->camss->dev, "CSID%u: reset done\n", csid->id);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t csid_isr(int irq, void *dev)
> +{
> +	struct csid_device *csid = dev;
> +	u32 val;
> +
> +	val = readl_relaxed(csid->base + CSID_IRQ_STATUS);
> +	writel_relaxed(val, csid->base + CSID_IRQ_CLEAR);
> +	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> +
> +	if (val & CSID_IRQ_MASK_RST_DONE)
> +		complete(&csid->reset_complete);
> +	else
> +		dev_warn_ratelimited(csid->camss->dev, "Spurious CSID interrupt\n");
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
> +{
> +	return -EOPNOTSUPP; /* Not part of CSID */
> +}
> +
> +static void csid_subdev_init(struct csid_device *csid) {}
> +
> +const struct csid_hw_ops csid_ops_340 = {
> +	.configure_testgen_pattern = csid_configure_testgen_pattern,
> +	.configure_stream = csid_configure_stream,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr,
> +	.reset = csid_reset,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 9dc826d8c8f6..3399e92658d8 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -213,6 +213,7 @@ extern const struct csid_formats csid_formats_gen2;
>   
>   extern const struct csid_hw_ops csid_ops_4_1;
>   extern const struct csid_hw_ops csid_ops_4_7;
> +extern const struct csid_hw_ops csid_ops_340;
>   extern const struct csid_hw_ops csid_ops_680;
>   extern const struct csid_hw_ops csid_ops_gen2;
>   extern const struct csid_hw_ops csid_ops_780;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


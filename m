Return-Path: <linux-arm-msm+bounces-40630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2375B9E620D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 01:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDFF516750A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 00:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C6E6FBF;
	Fri,  6 Dec 2024 00:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojbXmTxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E153A7
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 00:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733444092; cv=none; b=OY4YBCIGb77dL8uNOJjR5xtmeRMjyIM53oeFjkSXey5hpg13yBo07zCZQq3O17L8dA2Ms/WFWfgd5iX3tVqi0Klil+fX8g+2JdhCbfcXtn2kQ8AXlirVIMYBWQ+wx0p1ZVG8ngGZH4E83NbDfp54ACxQSSw5F0ok73/o8vDDEo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733444092; c=relaxed/simple;
	bh=eDI9ek0IIJkRL0jV9ppPBhaZ15qvWlqGWx6kEFJe6aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tiROxuaxYHG14CmF1yefsULRNhS+7F3N6Y/P76XfAHVFC0Cag0x9Qj3l68Ez3vmizw0LuyUKbRR7l9gbM+h2dAyMq2zh8LKQgNRJJudkwlREZJRuL0Lfq/7X4Bup3Nr239C4t/NXPCxYW0q2i2r0btDx5GhPLC42L2OTrmwqoGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ojbXmTxb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e0e224cbso794538f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733444088; x=1734048888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4sL2umDlHbWQbVknCoB8RPaRC85X9XafBZDJi9OBRCc=;
        b=ojbXmTxbhuBODVeOBcORhjwA1wIAlOBUvDPtziZ6H510EaU5yeWmZ+EP1dnbzX0+yx
         IQtk3XBGc3EcEkrpuRRIbqwXTseyi156gS5GX4R5/lD5ibjZIBT3kjUX/jthaq7vxtBu
         MKZw6rm7xXBkU86gaU8XYzten/+Qh9LRzGqYwymBNLl1VSXeRsbjs43i2hXn6VkJhpPw
         Z1y/Ze3BOZQQqE6KAVNk1R/wE0cWxp8VFkHtyEq94Ji74exNeNS6PFQyyy1tM2mK+Mgd
         q6d1HnXcFkmRZDeyqvvk5WrkoTJAVsEGZNcxfacHWOAXibF3vdPFWESLykG7jWrQe64t
         UfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733444088; x=1734048888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sL2umDlHbWQbVknCoB8RPaRC85X9XafBZDJi9OBRCc=;
        b=u7tM5VWp4keMBnIXQBsVx3yYdVbGZQ+MY5fDxe3+YMCK2m7DYJnKzHJRKLVBHOpJTT
         qCYtBTKuwRR92ZOF7cY96FaoEqga+OnN7dciKY3gsssYAc0O8QQSP5iEoXWcnPZD6OIR
         A2b+mylLQpUHfeuqxF+caTr7BB1WOopLoZqkDnTJ/pwS9nieLYVjnpd4H9Ocqgmda/wd
         igzrD4WRzp60XPjhSZfustdnqvTgbHCo8p7Bbr5dsje9FKIZJl2lUhtx1627zSGkSWKr
         0RoS5Q1XPmGBP1AgkpbV1+49j1SqQHPyL70ENal/9cTBeCMzsqAQZywBuDSHkR1LkZHE
         D9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfbaZP40ZD+Nto0skcRs1ewOQBKJ7LQfZicQZTwSAsQAP3zIVM5IobqpJlHbL8tloMgubO7+FsKS6pyT/h@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvMGcplvQ2p5nJT2Xt9F0i+ltKRo+Pn/8bCWV9Pu/knLfqXhe
	Jaf0DaRuhWwHjjc8aUCwgyT5yoIEWke8L2NLmLMD8pXfREfILCPmYA3Hjt9qbqI=
X-Gm-Gg: ASbGncshHvQ41A8PuMxHvzFSf1NT+v7lbxYBiEs6mNcXii6bBWghlOL581hDZEIh4Lm
	4i+CaXEnFZFWuiy9v7QbLFDOravyGxC4Y1GRIyi+17Nf5dMt5mBVfbmCdQg3EO1ujyLwgT5Arh8
	74cWJ6i1dG9O5gkTXuZTP3aiDBjCyokzK0u0CRQwAizurSP+pAkGClDTtnAXQ+ikSLIBS0OU4cR
	AMJyw4RAe/wXwviBMOTokktRk29NigI0V5dTynT88uG2gcmxcvx9IPWe2/G4+4=
X-Google-Smtp-Source: AGHT+IEuU+i6xWcGkPSc8fN/1on96qsz0/JxYTKIHeUp+7EQqZggCX5aBYO8G+VT1S8qL/EscCb67w==
X-Received: by 2002:a5d:47a5:0:b0:385:e968:f189 with SMTP id ffacd0b85a97d-3862b3e7d5cmr588379f8f.51.1733444087647;
        Thu, 05 Dec 2024 16:14:47 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190975fsm3162941f8f.68.2024.12.05.16.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 16:14:46 -0800 (PST)
Message-ID: <220068ff-9979-4bef-935f-936a276034f0@linaro.org>
Date: Fri, 6 Dec 2024 00:14:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] media: qcom: camss: Add CSID 780 support for sm8550
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-16-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205155538.250743-16-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Re: [PATCH 15/16] media: qcom: camss: Add CSID 780 support for sm8550

Please drop sm8550 in your patch title, change it to something more 
consistent with the VFE patch title i.e. your next patch.

On 05/12/2024 15:55, Depeng Shao wrote:
> The CSID in sm8550 is version 780, it has new register offset
> and new functionality. The buf done irq, register update and
> reset are moved to CSID 780.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>   .../platform/qcom/camss/camss-csid-780.c      | 333 ++++++++++++++++++
>   .../platform/qcom/camss/camss-csid-780.h      |  25 ++
>   .../media/platform/qcom/camss/camss-csid.h    |   1 +
>   drivers/media/platform/qcom/camss/camss.c     |  85 +++++
>   5 files changed, 445 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.h
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index e636968a1126..9a723e8712a2 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -7,6 +7,7 @@ qcom-camss-objs += \
>   		camss-csid-4-1.o \
>   		camss-csid-4-7.o \
>   		camss-csid-gen2.o \
> +		camss-csid-780.o \
>   		camss-csiphy-2ph-1-0.o \
>   		camss-csiphy-3ph-1-0.o \
>   		camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.c b/drivers/media/platform/qcom/camss/camss-csid-780.c
> new file mode 100644
> index 000000000000..bde24a93d01e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-780.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
> + *
> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
> + */
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-780.h"
> +
> +#define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
> +#define		OUTPUT_IFE_EN			0x100
> +#define		INTERNAL_CSID			1
> +
> +#define CSID_RST_CFG			0xC
> +#define		RST_MODE			BIT(0)
> +#define		RST_LOCATION			BIT(4)
> +
> +#define CSID_RST_CMD			0x10
> +#define		SELECT_HW_RST			BIT(0)
> +#define		SELECT_IRQ_RST			BIT(2)
> +
> +#define CSID_IRQ_CMD			0x14
> +#define		IRQ_CMD_CLEAR			BIT(0)
> +
> +#define CSID_RUP_AUP_CMD		0x18
> +#define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
> +
> +#define CSID_TOP_IRQ_STATUS		0x7C
> +#define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
> +
> +#define CSID_TOP_IRQ_MASK		0x80
> +#define CSID_TOP_IRQ_CLEAR		0x84
> +#define CSID_TOP_IRQ_SET		0x88
> +
> +#define CSID_CSI2_RX_IRQ_STATUS		0x9C
> +#define CSID_CSI2_RX_IRQ_MASK		0xA0
> +#define CSID_CSI2_RX_IRQ_CLEAR		0xA4
> +#define CSID_CSI2_RX_IRQ_SET		0xA8
> +
> +#define CSID_BUF_DONE_IRQ_STATUS	0x8C
> +#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
> +#define CSID_BUF_DONE_IRQ_MASK		0x90
> +#define CSID_BUF_DONE_IRQ_CLEAR		0x94
> +#define CSID_BUF_DONE_IRQ_SET		0x98
> +
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
> +#define		RUP_DONE_IRQ_STATUS		BIT(23)
> +
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
> +
> +#define CSID_CSI2_RX_CFG0		0x200
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
> +
> +#define CSID_CSI2_RX_CFG1		0x204
> +#define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
> +#define		CSI2_RX_CFG1_VC_MODE		BIT(2)
> +
> +#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
> +#define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
> +#define		RDI_CFG0_DECODE_FORMAT		12
> +#define		RDI_CFG0_DT			16
> +#define		RDI_CFG0_VC			22
> +#define		RDI_CFG0_DT_ID			27
> +#define		RDI_CFG0_EN			BIT(31)
> +
> +#define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
> +#define		RDI_CTRL_START_CMD		BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
> +#define		RDI_CFG1_DROP_H_EN		BIT(5)
> +#define		RDI_CFG1_DROP_V_EN		BIT(6)
> +#define		RDI_CFG1_CROP_H_EN		BIT(7)
> +#define		RDI_CFG1_CROP_V_EN		BIT(8)
> +#define		RDI_CFG1_PIX_STORE		BIT(10)
> +#define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
> +
> +#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
> +#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
> +
> +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy, int vc)
> +{
> +	int val;
> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
> +
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
> +	if (vc > 3)
> +		val |= CSI2_RX_CFG1_VC_MODE;
> +
> +	writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> +{
> +	int val = 0;
> +
> +	if (enable)
> +		val = RDI_CTRL_START_CMD;
> +
> +	writel(val, csid->base + CSID_RDI_CTRL(rdi));
> +}
> +
> +static void __csid_configure_wrapper(struct csid_device *csid)
> +{
> +	u32 val;
> +
> +	/* csid lite doesn't need to configure top register */
> +	if (csid->res->is_lite)
> +		return;
> +
> +	val = OUTPUT_IFE_EN | INTERNAL_CSID;
> +	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
> +}
> +
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +{
> +	u32 val;
> +	u8 lane_cnt = csid->phy.lane_cnt;
> +	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
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
> +	u8 dt_id = vc & 0x03;
> +
> +	val = RDI_CFG0_TIMESTAMP_EN;
> +	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= vc << RDI_CFG0_VC;
> +	val |= format->data_type << RDI_CFG0_DT;
> +	val |= dt_id << RDI_CFG0_DT_ID;
> +
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +
> +	val = RDI_CFG1_PACKING_FORMAT_MIPI;
> +	val |= RDI_CFG1_PIX_STORE;
> +	val |= RDI_CFG1_DROP_H_EN;
> +	val |= RDI_CFG1_DROP_V_EN;
> +	val |= RDI_CFG1_CROP_H_EN;
> +	val |= RDI_CFG1_CROP_V_EN;
> +
> +	writel(val, csid->base + CSID_RDI_CFG1(vc));
> +
> +	val = 0;
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +
> +	val = 1;
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +
> +	val = 0;
> +	writel(val, csid->base + CSID_RDI_CTRL(vc));
> +
> +	val = readl(csid->base + CSID_RDI_CFG0(vc));
> +
> +	if (enable)
> +		val |= RDI_CFG0_EN;
> +	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i;
> +
> +	__csid_configure_wrapper(csid);
> +
> +	/* Loop through all enabled VCs and configure stream for each */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i);
> +			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +}
> +
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool clear)
> +{
> +	if (clear) {
> +		csid->reg_update &= ~CSID_RUP_AUP_RDI(port_id);
> +	} else {
> +		csid->reg_update |= CSID_RUP_AUP_RDI(port_id);
> +		writel(csid->reg_update, csid->base + CSID_RUP_AUP_CMD);
> +	}
> +}
> +
> +/*
> + * csid_isr - CSID module interrupt service routine
> + * @irq: Interrupt line
> + * @dev: CSID device
> + *
> + * Return IRQ_HANDLED on success
> + */
> +static irqreturn_t csid_isr(int irq, void *dev)
> +{
> +	struct csid_device *csid = dev;
> +	u32 val, buf_done_val;
> +	u8 reset_done;
> +	int i;
> +
> +	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	reset_done = val & TOP_IRQ_STATUS_RESET_DONE;
> +
> +	val = readl(csid->base + CSID_CSI2_RX_IRQ_STATUS);
> +	writel(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
> +
> +	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	/* Read and clear IRQ status for each enabled RDI channel */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & RUP_DONE_IRQ_STATUS)
> +				/* clear the reg update bit */
> +				csid_subdev_reg_update(csid, i, true);
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
> +				/*
> +				 * For Titan 780, bus done and RUP IRQ have been moved to
> +				 * CSID from VFE. Once CSID received bus done, need notify
> +				 * VFE of this event. Trigger VFE to handle bus done process.
> +				 */
> +				camss_buf_done(csid->camss, csid->id, i);
> +			}
> +		}
> +
> +	val = IRQ_CMD_CLEAR;
> +	writel(val, csid->base + CSID_IRQ_CMD);
> +
> +	if (reset_done)
> +		complete(&csid->reset_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * csid_reset - Trigger reset on CSID module and wait to complete
> + * @csid: CSID device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csid_reset(struct csid_device *csid)
> +{
> +	unsigned long time;
> +	u32 val;
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	writel(1, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel(1, csid->base + CSID_IRQ_CMD);
> +	writel(1, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> +			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
> +			       csid->base + CSID_BUF_DONE_IRQ_MASK);
> +		}
> +
> +	/* preserve registers */
> +	val = RST_LOCATION | RST_MODE;
> +	writel(val, csid->base + CSID_RST_CFG);
> +
> +	val = SELECT_HW_RST | SELECT_IRQ_RST;
> +	writel(val, csid->base + CSID_RST_CMD);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void csid_subdev_init(struct csid_device *csid)
> +{
> +	/* nop */
> +}
> +
> +const struct csid_hw_ops csid_ops_780 = {
> +	/* No testgen pattern hw in csid 780 HW */
> +	.configure_testgen_pattern = NULL,
> +	.configure_stream = csid_configure_stream,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr,
> +	.reset = csid_reset,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init,
> +	.reg_update = csid_subdev_reg_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.h b/drivers/media/platform/qcom/camss/camss-csid-780.h
> new file mode 100644
> index 000000000000..7d9f88d0fc58
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-780.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * camss-csid-780.h
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
> + *
> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
> + */
> +#ifndef QC_MSM_CAMSS_CSID_780_H
> +#define QC_MSM_CAMSS_CSID_780_H

#ifndef __CAMSS_CSID_780_H__ or __QC_MSM_CAMSS_CSID_780_H__

Either way please encapsulate your guard __thus__

Same comment for all new headers added in this series.

---
bod


Return-Path: <linux-arm-msm+bounces-66868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112AB13CCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D29C117F3F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFD925C80E;
	Mon, 28 Jul 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O/praT/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1C2652B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711814; cv=none; b=WC1sRC3xNU41Z4NQXpJNiJ6jnEtwbuXMcTHbbFeQxb6/KeJDJ3gVYS03JrVnIguMXxPNv66F0m/QOjlRcDVCcXcBVatP+Kjr+vo2VwOtjIrml5d+DDSIHQHjZBlWuPxO+ym3feGVdESqOdNcgVwzmlOwBTkTpOtoRqHqVOWvwSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711814; c=relaxed/simple;
	bh=8EvVoF3QIt1vqvNKFKkVHuLYx9txREQEbvA3yi70zr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUhS270lhh3HeMAurVABwphnIYLnU6rAO36B6/9GIkblun1bay8+Cg+mD5tgwJxSob175lSrzFsNpjWe8QLXzyPutgPvjiFTzZDTM51/40IEv8VM4jVL8ZunUqaBR9HvRFrVNQwg/B+dbCBjiit6pYbfPApBzDbBYj68R5RW1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O/praT/T; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so677274266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753711810; x=1754316610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZcqKjC00tVRKF3ioY+bgjL1NjKsOLOLXQfthKgIq/ZY=;
        b=O/praT/TK2zDRccVljUNSkVprgIJq/l3YlqZr1LD6mJNIFAdMrb+6FTXljAEWTH9mZ
         4XS5mssRoSiSwbTU4zPLbmFefla/bEiOwHrOgUeLwZHuJL7LihkDvRQeiyEhzb79cMBl
         b+t7/zepup+BbOejp5qqZVl1bsbsQwLZA4FLahOT3lqbk6x5bKc9NldLQW+ynZL5DkQ+
         zHAV7GaPaKBNqAoRV8N7kMsMA27L/+H38TlbSXTvpEk38yJIb6rPN+FUx0Uaiuro4wsB
         +k04c5hV1jCRf8FwxyEwdZTO0mOZtcpv8k7o/vV7rwC9lX6y/7m/oPUMQHuZVz8oHC2s
         92tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711810; x=1754316610;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcqKjC00tVRKF3ioY+bgjL1NjKsOLOLXQfthKgIq/ZY=;
        b=dSxkX55FiLNdrygc9dcm1QPbqeqN+ZkGUE2LV8YIczBWqkUt1XTDWZGijTsnu9RpQi
         jwWNK03ZAxWwl85A9hBJA3yeVhHb/BxPI+rd+FOAAo1sBP9UD1Mm3yIxx5Msge2ZEwBs
         8tV4Dsc4onXZQ9mQ/xMSxQj4dXgFEL9cYhcJYIyIXvcMCx1fzQ2dpWrXLpgM/pLGCU1X
         hcYixD9Zy8Q1u3veghcXhtOtn2dxu7qJSzk9xxSUfoZeo53bgX8DOn7jwKsv070st9Vk
         yp1hASTSdcTHaEct8DLeWzQzX5M/LrP9/dDmKDl/scixQPqo08E6iSXp6Q67TLz0ofZW
         hIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNaGH79CV+6C0mpXYnBFTXf44j0zTyvfLsmWMjocfiRzzJfBeghDpMB3PCUm4ovDSKGoYd1Pr1Im5CUOBp@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPx635vUGcqXyF9iu6IF6emKJ86F6GyAZXteQFU8secuq6neD
	SsgxWQBLDZiJPYUETfT68rQvSk+4bJrNFDFEkll4yTLDhSvY1ZpVf2oklHoGYQFa7IY=
X-Gm-Gg: ASbGncsZpN5gz72Gz5E7g5/KtC1xwxkzw2pp6gY5yPEetypkMi1ulWJy0EJaEnEGduT
	Iqkn4MQcIhsI9fcwgbOP4MIiYNml2B/Qu+SIA5JLKq1L2s45o2sP0g97ydrHOW5l1NEIcqdvHI+
	nx4/g+q6WejIJyheQJsVusKYJUixOQPTJ2P6sheJWznlkp8BuPvKL7TunQ68hMzQBKSN/W9iXLW
	aqGivhpxcbg1wq5PhYg38ZBIio/+81uiNj5H+VrhU/G09NeBPQR0hPCsGILNfj5bM6hsm1FCMvh
	/+YI13t3BcNjtrXH/OL/wck92RSv7k5PcEMBNAeGyMG5ykf/ZHVQt2FXAVKWcVu7Fc76NzVdwWZ
	pPNSMNJyh4a/+bWQ5du0JrhsoyO0ir2wm7SZjieUf8kE75VVwgtEh8rTdXByo850=
X-Google-Smtp-Source: AGHT+IE/FYjACOhziDtGvazNjkFa6dLZB9LeEGQJm9w9O8Qxfbf3IJr6z14mY8o3jMaDMUlTEx2Q/A==
X-Received: by 2002:a17:907:7e89:b0:ae0:d7c7:97ee with SMTP id a640c23a62f3a-af61e63692amr1261585266b.41.1753711809615;
        Mon, 28 Jul 2025 07:10:09 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aca9e8sm418331766b.113.2025.07.28.07.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:10:09 -0700 (PDT)
Message-ID: <eabc8b5d-621b-45ce-9e0d-e4c0df7b561e@linaro.org>
Date: Mon, 28 Jul 2025 15:10:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] media: qcom: camss: Add support for VFE 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> Add support for VFE found on SA8775P (Titan 690). This VFE is
> different from vfe 780 w.r.t few register offsets.
> It supports two full and five lite VFE.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../platform/qcom/camss/camss-vfe-gen3.c      |  67 +++++--
>   drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
>   drivers/media/platform/qcom/camss/camss.c     | 189 ++++++++++++++++++
>   3 files changed, 242 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> index 93d16b0951e9..a5eddc8c76ae 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen3
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen2 (SA8755P/SM8550)
>    *
>    * Copyright (c) 2024 Qualcomm Technologies, Inc.
>    */
> @@ -12,13 +12,41 @@
>   #include "camss.h"
>   #include "camss-vfe.h"
>   
> -#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x200 : 0xC00)
> +#define IS_VFE_690(vfe) \
> +	    (vfe->camss->res->version == CAMSS_8775P ? true : false)
> +
Same comment. The "true : false" is a tautology, redundant.

> +#define BUS_REG_BASE_690 \
> +	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
> +#define BUS_REG_BASE_780 \
> +	    (vfe_is_lite(vfe) ? 0x200 : 0xC00)
> +#define BUS_REG_BASE \
> +	    (IS_VFE_690(vfe) ? BUS_REG_BASE_690 : BUS_REG_BASE_780)
> +
> +#define VFE_TOP_CORE_CFG (0x24)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL_690 (BUS_REG_BASE + 0xFC)
> +#define VFE_BUS_WM_TEST_BUS_CTRL_780 (BUS_REG_BASE + 0xDC)
> +#define VFE_BUS_WM_TEST_BUS_CTRL \
> +	    (IS_VFE_690(vfe) ? VFE_BUS_WM_TEST_BUS_CTRL_690 \
> +	     : VFE_BUS_WM_TEST_BUS_CTRL_780)
> +/*
> + * Bus client mapping:
> + *
> + * Full VFE:
> + * VFE_690: 16 = RDI0, 17 = RDI1, 18 = RDI2
> + * VFE_780: 23 = RDI0, 24 = RDI1, 25 = RDI2
> + *
> + * VFE LITE:
> + * VFE_690 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
> + * VFE_780 : 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4
> + */
> +#define RDI_WM_690(n)	((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
> +#define RDI_WM_780(n)	((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +#define RDI_WM(n)	(IS_VFE_690(vfe) ? RDI_WM_690(n) : RDI_WM_780(n))
>   
>   #define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
>   #define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
>   
> -#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xDC)
> -
>   #define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
>   #define		WM_CFG_EN			BIT(0)
>   #define		WM_VIR_FRM_EN			BIT(1)
> @@ -39,17 +67,6 @@
>   #define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
>   #define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
>   
> -/*
> - * Bus client mapping:
> - *
> - * Full VFE:
> - * 23 = RDI0, 24 = RDI1, 25 = RDI2
> - *
> - * VFE LITE:
> - * 0 = RDI0, 1 = RDI1, 2 = RDI3, 4 = RDI4
> - */
> -#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> -
>   static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   {
>   	struct v4l2_pix_format_mplane *pix =
> @@ -62,14 +79,23 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   
>   	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
>   
> -	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
> -	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +	if (IS_VFE_690(vfe))
> +		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
> +		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +	else
> +		writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
> +		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +
>   	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
>   	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
>   	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
>   	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
>   	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
>   
> +	/* TOP CORE CFG */
> +	if (IS_VFE_690(vfe))
> +		writel(0x600000, vfe->base + VFE_TOP_CORE_CFG);

#define BIT(22)	SOME_THING
#define BIT(21) SOME_OTHER_THING

writel(SOME_THING | SOME_OTHER_THING, ...);

Its only two bits so please document.

> +
>   	/* no dropped frames, one irq per frame */
>   	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
>   	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> @@ -92,7 +118,12 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>   			  struct vfe_line *line)
>   {
>   	wm = RDI_WM(wm);
> -	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +	if (IS_VFE_690(vfe))
> +		writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +	else
> +		writel((addr >> 8) & 0xFFFFFFFF, vfe->base +
> +		       VFE_BUS_WM_IMAGE_ADDR(wm));

No need to define the bits here 0xFFFFFFFF is obvious.

>   
>   	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
>   		wm, addr);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 4bca6c3abaff..99cbe09343f2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
> @@ -910,7 +911,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>   
>   	return (!strcmp(clock->name, vfe_name) ||
>   		!strcmp(clock->name, vfe_lite_name) ||
> -		!strcmp(clock->name, "vfe_lite"));
> +		!strcmp(clock->name, "vfe_lite") ||
> +		!strcmp(clock->name, "camnoc_axi"));
>   }
>   
>   /*
> @@ -1974,6 +1976,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_8280XP:
>   	case CAMSS_845:
>   	case CAMSS_8550:
> +	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
>   		ret = 16;
>   		break;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index b2398196b9ff..3a11c0a98eb1 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2709,6 +2709,195 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources vfe_res_8775p[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
> +			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
> +			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
> +			   "icp_ahb"},

Five AHB clocks - plus three separate AXI clocks ?

I'm not against this list but, please take the time to pick through this 
and decide if all of these are really necessary for your SoC.

> +		.clock_rate = {
> +			{ 0 },
> +			{ 480000000 },
> +			{ 300000000, 400000000 },
> +			{ 300000000, 400000000 },
> +			{ 0 },
> +			{ 0 },
> +			{ 0, 80000000 },
> +			{ 300000000, 400000000 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = false,
> +			.pd_name = NULL,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
> +			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
> +			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
> +			   "icp_ahb"},
> +		.clock_rate = {
> +			{ 0 },
> +			{ 480000000 },
> +			{ 300000000, 400000000 },
> +			{ 300000000, 400000000 },
> +			{ 0 },
> +			{ 0 },
> +			{ 0, 80000000 },
> +			{ 300000000, 400000000 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.has_pd = false,
> +			.pd_name = NULL,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE4 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite2" },
> +		.interrupt = { "vfe_lite2" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE5 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite3" },
> +		.interrupt = { "vfe_lite3" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE6 (lite) */
> +	{
> +		.regulators = {},
> +
> +		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +			   "vfe_lite"},
> +		.clock_rate = {
> +			{ 0, 0, 0, 0  },
> +			{ 300000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 400000000, 400000000, 400000000, 400000000 },
> +			{ 480000000, 600000000, 600000000, 600000000 },
> +		},
> +		.reg = { "vfe_lite4" },
> +		.interrupt = { "vfe_lite4" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.hw_ops = &vfe_ops_gen3,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
---bod


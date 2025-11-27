Return-Path: <linux-arm-msm+bounces-83561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47DC8DB6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F0073AFCC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE04274B37;
	Thu, 27 Nov 2025 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeZg9183"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC3D22AE7A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238572; cv=none; b=e3TcDnI4zVXNuYa3ttzsOGzDVw/TwO5pb9aFhVv/pSl9+3BoUZOVLjhH4TD5VKUM0oYnpAUzeFF0oPXADrzelP+Vni0KLU5GvgwQ52PHWlSIY1ZcxxhBe1KI9F0reVzNVFdDoMlma10zRTYtTgflvdOSltioC1ISN5m6/6sVh2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238572; c=relaxed/simple;
	bh=5y6CmgAS1V5MWpepkpSqAGDTqHuus6SEi+aEwCqH3FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xvnh4ZIzP1lLtzmWLq+tERdaGXet+eYqZEV20sf1QEkAeK5lhEfgGNrYlPX3HnKr2vH7zExKmFc/E4ZxSw5mWwtycEWCrFT4Q2lfC/RNE9rCwHkRHW5rygqy4A/wV0VQp+ls2do5LvZEqfshILzzhSG7uCk2EoznkhKan1lfaRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OeZg9183; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477632b0621so3376505e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764238569; x=1764843369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EV7QqHdqC/+9cLWqbuFdfIc83eswgx9YJgp4pbUoGrg=;
        b=OeZg9183bEWq735bh/HOFYN5Y0INKVHK9fHIm6wqHLufsNOx9tYoEsWGYEYoAwVM+N
         YYSki1UN6M/ZdDdC+cF0IENGdSfQxAH6RpaZX5vx7e/qThIHDigHaoFvGEjAJmLrNc1C
         Cf4LTfEt5tvd3GmckJy/3WRJsnTENJmqUnuuTzuWH/1xeHh6KG/vmDbBUOFJlAUDpFuW
         wO00Z6Uw18p0Gmh8WkP9W0NXKYlpOIfJNropXFF+Toif2PWh8uH8GvO4yWjLO2lrXzAp
         ezDLcarBpGHmoZEd5+hnfMlv/YDd5UYtVKc+m9BoN0BktksJ9ZddFKpIXLedO7RY9T2M
         PJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764238569; x=1764843369;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EV7QqHdqC/+9cLWqbuFdfIc83eswgx9YJgp4pbUoGrg=;
        b=TNpWzl83uF6UjL4rFTj6XN9wlqpWOyS/4fhTBPG88UjYvIec5mWAfJ4+LRzUzZbIPs
         w3wWk7Yzu1lbOdjR8Q5y5gZRmHLTdT8fXRbzSYb/ZV9vNEtBa53g7H+nSABHOrxtx7IB
         4vCQDmCjiXFlp/C4hoCnJy/xodt4I/Z8FumDWlY3LeIwuWgJLOp9Ke37Wl91Pd3GumSY
         c3qcn0sCBMzIIKiY8EAPMjC6zgUJz+SaIa0PJe4dfx75SFQLkJ+410QmFFhpQkP2fS3k
         1O1YBZ78o5kXvr4uAR0xNE67RVPF1bYmVvkvQNklQm8FVKxfYxyrXv4MrnDfxIvJ6jx8
         cSBw==
X-Gm-Message-State: AOJu0YzryYAZ8bisFag8PWw6kgRhtLpz3JVR4mOXyntsk8Svz6yVLf+r
	XoFAADls8vkMTRMIk1A0uQGy5qT0cWxM+fBUmNhY7qXDDjFYq7YR5FCjWJrhiKSt54E=
X-Gm-Gg: ASbGncvREhVGuSyOvE8cKPNubZNiH6r9NNM25RNySbk73rahvxX0SOOodRMHC1Q9e/t
	A+1wYXXqYxxMus45wbfFNp8q8+bG8kppeLEIO0H9guj13IAxRf0rMcU/d3PZpavW7wxII5rlACV
	b28Ru17VgxMX2Geh056y0AhuDa6Oj2Cx/vCVpeqhzjYVj6dChfy4s9UXg0OEgQP4kzKjqLrNRcD
	7dlkw4uxh56hrHY4eakMlm8G7eyyHKraRDH3t5HDNaWvvKTKWD9hQBB/q6XpQfi8MtSwJtxZhu0
	Pe7lujEURi08L8tWY7I/xMz2FIi2FvK0QwhSjg8F3z4BCNfReomBIN+ypLK8kvXWIKZqs07PCTl
	Y5K2eHH2dttlNqqU0gv+cQzvJW3Pt5xd0Mlq20fW5U9Ewx+60FASYdNNyXe1wXpg+YkfjMczYnW
	wX/n8m4X2001Nqv2ROoDOegtuUHAyDYe66LOHzzG/+Jihe/Y6gc0tV7QriFOI3C6U=
X-Google-Smtp-Source: AGHT+IG7Qb1umIooFSf3GatBLMLLBDSIXpTxSYw9SyfVXMDKifm1pT7bxobkp49EjOXRmMsbQhHTmg==
X-Received: by 2002:a05:600c:6296:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-477c10d7013mr232732285e9.11.1764238568281;
        Thu, 27 Nov 2025 02:16:08 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111561c2sm28158805e9.4.2025.11.27.02.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:16:07 -0800 (PST)
Message-ID: <47e40d25-59c8-4dc8-aa55-4a1da6adf85f@linaro.org>
Date: Thu, 27 Nov 2025 10:16:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] media: qcom: camss: vfe: Add support for VFE 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
 <20251120-add-support-for-camss-on-kaanapali-v7-5-de27f9a67ce6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251120-add-support-for-camss-on-kaanapali-v7-5-de27f9a67ce6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2025 04:43, Hangxiang Ma wrote:
> Add Video Front End (VFE) version 1080 as found on the Kaanapali SoC.
> 
> The FULL front end modules in Kaanapali camera subsystem are called TFEs
> (Thin Front End), however, retaining the name VFE at places to maintain
> consistency and avoid unnecessary code changes.
> 
> This change limits the VFE output lines to 3 for now as constrained by
> the CAMSS driver framework.
> 
> Kaanapali architecture requires for the REG_UPDATE and AUP_UPDATE to be
> issued after all of the CSID configuration has been done. Additionally,
> the number of AUP_UPDATEs should match the number of buffers enqueued to
> the write master while it's being enabled.
> 
> Although the real time data from TFE goes through the RT_CAMNOC, we are
> required to enable both the camnoc_rt_axi and camnoc_nrt_axi clocks for
> the PDX_NOC, that follows both the RT and NRT NOCs in this architecture,
> to ensure that both of the latter are idle after reset.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>   drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 143 +++++++++++++++
>   5 files changed, 350 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 3a7ed4f5a004..dc41b0d6dc21 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -22,6 +22,7 @@ qcom-camss-objs += \
>   		camss-vfe-340.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
> +		camss-vfe-1080.o \
>   		camss-vfe-gen3.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> new file mode 100644
> index 000000000000..9ad3dee2e80b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-vfe-1080.c
> + *
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v1080
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +
> +#include "camss.h"
> +#include "camss-vfe.h"
> +
> +/* VFE-1080 Bus Register Base Addresses */
> +#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
> +
> +#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
> +#define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
> +
> +#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
> +
> +#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
> +#define		WM_CFG_EN				BIT(0)
> +#define		WM_VIR_FRM_EN				BIT(1)
> +#define		WM_CFG_MODE				BIT(16)
> +#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
> +#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50C + (n) * 0x100)
> +#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
> +#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
> +#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
> +#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
> +
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
> +
> +/* VFE lite has no such registers */
> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53C + (n) * 0x100)
> +
> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
> +
> +/*
> + * IFE write master client IDs
> + *
> + * VIDEO_FULL			0
> + * VIDEO_DC4_Y			1
> + * VIDEO_DC4_C			2
> + * VIDEO_DC16_Y			3
> + * VIDEO_DC16_C			4
> + * DISPLAY_DS2_Y		5
> + * DISPLAY_DS2_C		6
> + * FD_Y				7
> + * FD_C				8
> + * PIXEL_RAW			9
> + * STATS_AEC_BG			10
> + * STATS_AEC_BHIST		11
> + * STATS_TINTLESS_BG		12
> + * STATS_AWB_BG			13
> + * STATS_AWB_BFW		14
> + * STATS_AF_BHIST		15
> + * STATS_ALSC_BG		16
> + * STATS_FLICKER_BAYERRS	17
> + * STATS_TMC_BHIST		18
> + * PDAF_0			19
> + * PDAF_1			20
> + * PDAF_2			21
> + * PDAF_3			22
> + * RDI0				23
> + * RDI1				24
> + * RDI2				25
> + * RDI3				26
> + * RDI4				27
> + *
> + * IFE Lite write master client IDs
> + *
> + * RDI0			0
> + * RDI1			1
> + * RDI2			2
> + * RDI3			3
> + * GAMMA		4
> + * STATES_BE		5
> + */
> +#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> +
> +static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> +{
> +	struct v4l2_pix_format_mplane *pix =
> +		&line->video_out.active_fmt.fmt.pix_mp;
> +
> +	wm = RDI_WM(wm);
> +
> +	/* no clock gating at bus input */
> +	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> +
> +	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> +
> +	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
> +	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
> +	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
> +	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> +
> +	/* no dropped frames, one irq per frame */
> +	if (!vfe_is_lite(vfe)) {
> +		writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +		writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +	}
> +
> +	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
> +	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
> +
> +	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_stop_1080(struct vfe_device *vfe, u8 wm)
> +{
> +	wm = RDI_WM(wm);
> +	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
> +static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 addr,
> +			       struct vfe_line *line)
> +{
> +	wm = RDI_WM(wm);
> +	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +
> +	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
> +}
> +
> +static void vfe_reg_update_1080(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear_1080(struct vfe_device *vfe,
> +					     enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}
> +
> +static const struct camss_video_ops vfe_video_ops_1080 = {
> +	.queue_buffer = vfe_queue_buffer_v2,
> +	.flush_buffers = vfe_flush_buffers,
> +};
> +
> +static void vfe_subdev_init_1080(struct device *dev, struct vfe_device *vfe)
> +{
> +	vfe->video_ops = vfe_video_ops_1080;
> +}
> +
> +static void vfe_global_reset_1080(struct vfe_device *vfe)
> +{
> +	vfe_isr_reset_ack(vfe);
> +}
> +
> +static irqreturn_t vfe_isr_1080(int irq, void *dev)
> +{
> +	/* nop */
> +	return IRQ_HANDLED;
> +}
> +
> +static int vfe_halt_1080(struct vfe_device *vfe)
> +{
> +	/* rely on vfe_disable_output() to stop the VFE */
> +	return 0;
> +}
> +
> +const struct vfe_hw_ops vfe_ops_1080 = {
> +	.global_reset = vfe_global_reset_1080,
> +	.hw_version = vfe_hw_version,
> +	.isr = vfe_isr_1080,
> +	.pm_domain_off = vfe_pm_domain_off,
> +	.pm_domain_on = vfe_pm_domain_on,
> +	.reg_update = vfe_reg_update_1080,
> +	.reg_update_clear = vfe_reg_update_clear_1080,
> +	.subdev_init = vfe_subdev_init_1080,
> +	.vfe_disable = vfe_disable,
> +	.vfe_enable = vfe_enable_v2,
> +	.vfe_halt = vfe_halt_1080,
> +	.vfe_wm_start = vfe_wm_start_1080,
> +	.vfe_wm_stop = vfe_wm_stop_1080,
> +	.vfe_buf_done = vfe_buf_done,
> +	.vfe_wm_update = vfe_wm_update_1080,
> +};
Since this patch isn't applied, you should repost this file with the 
right name.

---
bod


Return-Path: <linux-arm-msm+bounces-78227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E8CBF93A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 01:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F9A6188BBF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7659F2C11FE;
	Tue, 21 Oct 2025 23:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dh9y2uXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7241E25E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761089278; cv=none; b=E+7nF+7qq/2GLcKePCcJ7uJtT3zb8Pg2i5mhHO6MhqsVkQR+RRR6eeM5V3fqLdwUKkcgTE0htnybMNYo/X5ZenGkyGX11ynwwy3FkKkmT2dxhbRTJxaFAxjqDJPFTNgcoeAf/xCRAd3SizP9cjPbBr+T1ASkb1gIIEvPZfHmLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761089278; c=relaxed/simple;
	bh=CgkG4pMugjcs9pB9Iu6a/9GYwozm4r+tEeuBEz/VDnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHM3L48YivMrypg4cT+M+mI15BY/VfbykBWkLykHxKmqmU8fx/9mXSrerCqnPEoEfdNBxCaoPLt7w5eETNEa4AI/qSGexzfIkG6t6emp9Qrxkf0jr4AtlvjY2bVyLrNEMHW5iZnU5CFCiFPcvbyLJ+RF2R/UwgjPEKRDIn0ERdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dh9y2uXe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47112a73785so47045875e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761089274; x=1761694074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11T5RT0EtzcFdLIDswfSiZBzbAPS/UzKcdJ15Rc+GQs=;
        b=Dh9y2uXeBPwpwQj12LsDPdjmweiY5rS3A1GzmdF7zNz3YQwMcFtfLH7OOM3n6P/gYA
         fTZ9q0I83ApP0PV/UgCLh52HXgpJeNM6OkRb/hmzc71CFAxuO9Al1M2iw3WNGXIdfpud
         PhE31jIqV1norA1xjKBWrS5J1tiKnI1+ZiJu2mg8/lEEobeBdHBA8TQqf8iX6qYFK9AT
         r3na/Jbj6SsvBzkeHDHxYE+1u2iCPay6xaMMeJlli5X5dcqP+Cx0wZMKZVCwxzsyMFtV
         iORE3Bnzxdfu3LPAvuN5Q9RQaeKSegQgxSVNp3hxmsmyN/IeeHO+krYp0KwZifwq+FjC
         GsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761089274; x=1761694074;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11T5RT0EtzcFdLIDswfSiZBzbAPS/UzKcdJ15Rc+GQs=;
        b=uzFDz300adSPFy971XwgZnQHqO5AaYj8mNLsxZGHurMu5LECzmrp+W8oZOIyM/i50O
         eGEWgidiYDehEI8i/rwTDLW9ilYhL1Zy424mQ2yKZhZp8Mul3UCagnP1OPx6q1eKMhSQ
         mQHtN9R08TsdpjAnVngk7xW1AoN74QhA9yQbDyx5e58s/MX/9K4C74wCpnJC+oUOk2bE
         hgHanqhhX4w/yourjF1ZiB5VBMIFwP8u1FS2BLkf4fGxCk3TeGQYn/GlGwy8XvVsXfr7
         /vFIG/B9Aj4U6a+Ls3N3knGAm8drKqe9HN9wPjgS0rtu9GwMkTbMOazjy+7pcf4DamGo
         afLg==
X-Gm-Message-State: AOJu0YwU8rLPpfDfVBySvAcNBuxlziSAl8iyB/8H8DbOPlh1ah85ZfUy
	LQNofeGIa1DnB0MYX37FGpxA/ku/L9zIQPMX9USSGMogVn4ql1hFaHEaDXG+CSp4LeI=
X-Gm-Gg: ASbGncsx8w8hjiY0HkcDssjroIjcS0gFgV2odzXXrSgPBrkSBuGxJA89CXmkclXouPH
	5gmc8Dqy2Fj0BZqF1Ii4c/QBFVjwMc9Drie7IHUOo8cmrxxgFGkUkBob+bWoso0ll57qyAdUOvY
	KjpDCrAhUmBzc4uvydnQ1TrIOQBfbH7UKKNK2jSEwRXwQ6mD9gexz/ONzYXMGOJJTao3Rmhbfo1
	sIouqCVusHXeN60uagdp03llSlpxfCLVuFjg/UdHZYj/d+dFu1nUcv53OEzOHCiV8uUiAc6WCzC
	IYVxnsCjjXkFnPsXF7+Yz/l50KZi9Dz6MFTAwq9nbIn/emTY/zXJ7erugh+/oMqCBsM1TCwB8Tt
	nZ7jQecQPm/MchrgftXN4thL2OD9FJez7CIvJQZwYz+7S33ZsKOPZecZfIWIcxh8Q1dsrn2Q60R
	Jme2YIEEd4eYI+wXworf3lf/aMlkn84XJa69LKSmPhM8nCod6mc9opvA==
X-Google-Smtp-Source: AGHT+IH16gLXInKodyasLPwx+eTKM8EGe2d51842fK5IcPp9qAw4hLP2RVVMEPuqgvcvN/9IrDhZWg==
X-Received: by 2002:a05:600c:3149:b0:470:bcc4:b0a0 with SMTP id 5b1f17b1804b1-47117925919mr158367725e9.34.1761089273855;
        Tue, 21 Oct 2025 16:27:53 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c429e745sm15891335e9.9.2025.10.21.16.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 16:27:53 -0700 (PDT)
Message-ID: <941070d8-1abe-42d6-b639-80ff369469bf@linaro.org>
Date: Wed, 22 Oct 2025 00:27:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: iris: Move vpu register defines to common
 header file
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <YqjRCScxXDEPpVVaScQe2L-oTMtqW8BHl8RV49CNHptbE0idZxbYu1ZPJVzDfFtAd4o5U2Rba4x2evk_oA-k2A==@protonmail.internalid>
 <20251017-knp_video-v2-5-f568ce1a4be3@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017-knp_video-v2-5-f568ce1a4be3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 15:16, Vikash Garodia wrote:
> Some of vpu4 register defines are common with vpu3x. Move those into the
> common register defines header. This is done to reuse the defines for
> vpu4 in subsequent patch which enables the power sequence for vpu4.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 36 ----------------------
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 23 --------------
>   .../platform/qcom/iris/iris_vpu_register_defines.h | 32 +++++++++++++++++++
>   3 files changed, 32 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 339776a0b4672e246848c3a6a260eb83c7da6a60..0ac6373c33b7ced75ac94ac86a1a8fc303f28b5d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -11,48 +11,12 @@
>   #include "iris_vpu_common.h"
>   #include "iris_vpu_register_defines.h"
> 
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
> -#define AON_MVP_NOC_RESET			0x0001F000
> -
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> -#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> -#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
> -#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>   #define CORE_CLK_RUN				0x0
>   /* VPU v3.5 */
>   #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
> 
> -#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> -#define CTL_AXI_CLK_HALT			BIT(0)
> -#define CTL_CLK_HALT				BIT(1)
> -
> -#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> -#define RESET_HIGH				BIT(0)
> -
> -#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> -#define CORE_BRIDGE_SW_RESET			BIT(0)
> -#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> -
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
> -#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>   #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
> 
> -#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> -
> -#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> -
>   #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
>   #define SW_RESET				BIT(0)
>   #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bbd999a41236dca5cf5700e452a6fed69f4fc922..a7b1fb8173e02d22e6f2af4ea170738c6408f65b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -11,9 +11,6 @@
>   #include "iris_vpu_common.h"
>   #include "iris_vpu_register_defines.h"
> 
> -#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> -#define AON_BASE_OFFS				0x000E0000
> -
>   #define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
> 
>   #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
> @@ -38,10 +35,6 @@
>   #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
>   #define HOST2XTENSA_INTR_ENABLE			BIT(0)
> 
> -#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> -#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> -#define MSK_CORE_POWER_ON			BIT(1)
> -
>   #define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
>   #define CPU_IC_SOFTINT_H2A_SHFT			0x0
> 
> @@ -53,23 +46,7 @@
>   #define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
>   #define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
> 
> -#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> -#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> -#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> -
>   #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
> -#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> -#define CTL_AXI_CLK_HALT			BIT(0)
> -#define CTL_CLK_HALT				BIT(1)
> -
> -#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> -#define RESET_HIGH				BIT(0)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> -#define REQ_POWER_DOWN_PREP			BIT(0)
> -
> -#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> 
>   static void iris_vpu_interrupt_init(struct iris_core *core)
>   {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..bfe7ecceda894f6464970f9db2578c92dcb6c1ad 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -9,9 +9,41 @@
>   #define VCODEC_BASE_OFFS			0x00000000
>   #define CPU_BASE_OFFS				0x000A0000
>   #define WRAPPER_BASE_OFFS			0x000B0000
> +#define AON_BASE_OFFS				0x000E0000
> +#define AON_MVP_NOC_RESET			0x0001F000
> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
> +
> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
> 
>   #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +
> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> 
> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> +
> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>   #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
> +
> +#define CORE_BRIDGE_SW_RESET			BIT(0)
> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> +#define MSK_CORE_POWER_ON			BIT(1)
> +#define CTL_AXI_CLK_HALT			BIT(0)
> +#define CTL_CLK_HALT				BIT(1)
> +#define REQ_POWER_DOWN_PREP			BIT(0)
> +#define RESET_HIGH				BIT(0)
> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> +#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
> 
>   #endif
> 
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


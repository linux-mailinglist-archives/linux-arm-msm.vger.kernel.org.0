Return-Path: <linux-arm-msm+bounces-61079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2DBAD69DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DA23AF788
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 08:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7488E18CC13;
	Thu, 12 Jun 2025 08:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hi9BzEwX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FDE13C8E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 08:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715357; cv=none; b=kpdXYCs/uAjeqtIIykIB1pORdjLXaNLKos2DMKrLH7Q+yuo/w7pxF2243qe/6Dxi5A7MxexsPCHURAiouXagkawHrQSf/Jf9En+YMDwyvbpbAnLjsrtICb4bDLLCSV4nSh2INQYT0MOK7nHdPOJBrB99X5pJLc5hE6mz3ur/mcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715357; c=relaxed/simple;
	bh=3eutFv0YUpUcBiELcRGQ/X2KXhDa7HG75EdddSZ3Hb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYQsYfkwiZmE2LtcahPy2qNKxGqocGm4zS7SnDUWsWr2h6lIoQtRr37av2B+aXruloeKHuqNp8n4QGUZItlE85tgAZrQAjwq60DJHgOajgyyPHL/Z/FOH4JobxiZlXZzQMHbFl1dJPG6uSLlAvewh6xteEkqGWr2aVqkynHsSN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hi9BzEwX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1182040f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749715354; x=1750320154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+YnI2VE3dubMd3daM6I5J2k+cxEj00izt+Iu1pSlY4=;
        b=hi9BzEwXvn5wYy5yKKiAbcUB/4VRkPkX7bzmxTWmAIyCAcHBGwd7sxpikktqxCCA+Q
         3HKyo/OtoD2TIGukUsx9cu/pNeITCYVnazVCozQkHpFbTpVZv25xHBGd6IZFR1A4MRcD
         G9Sc1qcdF7/OQOUW+gCbfgzZdE2cP6KWO/qbIJ5YcxkftHqD8nZ81ApiPxIdtZ1j+O1X
         ClKDsuP7SCzvCUyxHxhf/4RkrLUfn6qficiqx9rbtGoksbkHjZOiC3INW331diI9BRMO
         DlxaJ5JSbmEz0OFz0SSZXCrKIRQNGpqXZ4/3k86NKxiXU+iHMil/qiZ2D2FEGV4WZZvb
         2c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715354; x=1750320154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+YnI2VE3dubMd3daM6I5J2k+cxEj00izt+Iu1pSlY4=;
        b=JrutvxY39/KT7pv4qnkQHRWeABJ/anou2tdH9sXP2Qj2WiVsrc3vGQebTBOKfnaX4R
         8hG+8SAbOvQD5KH85w8mXcLGIK7BlQyqkhE4YcSixgMT5ULnAsKQmx+OTXSdVzbkC7RN
         GKvfHb2XtCWaFeIAxA/5OAndQ4JUVqyPAf39auKjBcyje0xAVgEu4clRwKkdwTJdkxtw
         iSb0JFj7BPL3a6ZIeAdmZ/Ndt5fTbNnZTGiv77xOxc3texCCLlTweAsXb7tpkUlICeb1
         pzCrSF0X2pR/TpMUlXsLr+9ReAV6+hDw6RT3Z1mHbxGbagC5I2hHS19cjCrP/4zXf2kz
         aYzA==
X-Forwarded-Encrypted: i=1; AJvYcCWfYjuTllxqA4SuVxF0o1Wfx9HkLOxKoT0JyN6v8CV/1gL0UpLdID+GwE+hf/K+k1/FugRpUz9qnZ5VEXKk@vger.kernel.org
X-Gm-Message-State: AOJu0YzUSQXKxXiJP5nyXjrkD45201yLf7/ZJfJ2IdAP/QdOTeWjA+ci
	bzaqwAdj+lQuOtdXApRLMqjQWqtff9An/maDxsVPAXCa3eg1oDCc1j2L2Z0+C0Qdvyc=
X-Gm-Gg: ASbGncvw8T9CrgKmL+pwQC+39KuLKjRUxXoM1yCK+BZ+cYrZljjrpcOMOgBxBDEwzPR
	NJ0lEeidnZwXIb+wvWMU9KFmCOivfra3A86dQ53h177QI80HNohHZ9qRsyX6OG/QGai7t+VBHfG
	1kZYNMay/1lU6AXQG3ZIZkl2gY48L6gcVWFRJppMR33UfbOpWQ0PFnstgSTzKkHeiRks7+a5SBa
	OlQEt8PE9W8jK68f2xnx/3hmZi4RW+hlQ7Fpc/LmBK0UaVUX6sdG6dAobJ4AlZkQMbJknQFM7Rl
	FK/bEwEpcnTo5M1Tll46cMxtH4HYQcFrTMEa0Al9l+rV2q0aA0j+vtUyBaM8qgA2m7yP8MVOUUt
	88sNfRbl1/FmtlJnU5Lj0INCmFZE=
X-Google-Smtp-Source: AGHT+IHr17lu04o6X3T3YbGhmI/P2yypu+DOM9jKCZ/WyDlw1KtOQazaviQwWkcOGDM2PNTVAyQCaA==
X-Received: by 2002:a05:6000:178a:b0:3a1:f724:eb15 with SMTP id ffacd0b85a97d-3a56087effdmr1859459f8f.2.1749715353121;
        Thu, 12 Jun 2025 01:02:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3c756sm1214328f8f.52.2025.06.12.01.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 01:02:32 -0700 (PDT)
Message-ID: <1fc9eb4c-6da2-4146-98e2-1bb6fc422a55@linaro.org>
Date: Thu, 12 Jun 2025 09:02:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] media: qcom: camss: csiphy: simplify arguments of
 lanes_enable and lanes_disable
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250612011531.2923701-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2025 02:15, Vladimir Zapolskiy wrote:
> In some of .lanes_enable and .lanes_disable functions the second argument
> of csiphy_config type is either unused or it can be derived from the
> main function argument, this lets to remove it from the list of arguments.
> 
> Apart of being the simplification the change is needed for further updates
> to CSIPHY part of the CAMSS driver to get CSIPHY combo mode feature and
> a related to it management of non-statically assigned CSIPHY media pads.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../media/platform/qcom/camss/camss-csiphy-2ph-1-0.c  | 10 ++++------
>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 11 ++++-------
>   drivers/media/platform/qcom/camss/camss-csiphy.c      |  4 ++--
>   drivers/media/platform/qcom/camss/camss-csiphy.h      |  4 +---
>   4 files changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> index 9d67e7fa6366..d9735f61fffc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> @@ -95,10 +95,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>   }
>   
>   static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
>   				s64 link_freq, u8 lane_mask)
>   {
> -	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
> +	struct csiphy_lanes_cfg *c = &csiphy->cfg.csi2->lane_cfg;
>   	u8 settle_cnt;
>   	u8 val, l = 0;
>   	int i = 0;
> @@ -114,7 +113,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	val |= lane_mask << 1;
>   	writel_relaxed(val, csiphy->base + CAMSS_CSI_PHY_GLBL_PWR_CFG);
>   
> -	val = cfg->combo_mode << 4;
> +	val = csiphy->cfg.combo_mode << 4;
>   	writel_relaxed(val, csiphy->base + CAMSS_CSI_PHY_GLBL_RESET);
>   
>   	for (i = 0; i <= c->num_data; i++) {
> @@ -134,10 +133,9 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	}
>   }
>   
> -static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> -				 struct csiphy_config *cfg)
> +static void csiphy_lanes_disable(struct csiphy_device *csiphy)
>   {
> -	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
> +	struct csiphy_lanes_cfg *c = &csiphy->cfg.csi2->lane_cfg;
>   	u8 l = 0;
>   	int i = 0;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f732a76de93e..69d95bfeb9d2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -638,10 +638,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>   }
>   
>   static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
> -				     struct csiphy_config *cfg,
>   				     u8 settle_cnt)
>   {
> -	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
> +	struct csiphy_lanes_cfg *c = &csiphy->cfg.csi2->lane_cfg;
>   	int i, l = 0;
>   	u8 val;
>   
> @@ -758,10 +757,9 @@ static bool csiphy_is_gen2(u32 version)
>   }
>   
>   static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
>   				s64 link_freq, u8 lane_mask)
>   {
> -	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
> +	struct csiphy_lanes_cfg *c = &csiphy->cfg.csi2->lane_cfg;
>   	struct csiphy_device_regs *regs = csiphy->regs;
>   	u8 settle_cnt;
>   	u8 val;
> @@ -791,7 +789,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	if (csiphy_is_gen2(csiphy->camss->res->version))
>   		csiphy_gen2_config_lanes(csiphy, settle_cnt);
>   	else
> -		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
> +		csiphy_gen1_config_lanes(csiphy, settle_cnt);
>   
>   	/* IRQ_MASK registers - disable all interrupts */
>   	for (i = 11; i < 22; i++) {
> @@ -800,8 +798,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	}
>   }
>   
> -static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> -				 struct csiphy_config *cfg)
> +static void csiphy_lanes_disable(struct csiphy_device *csiphy)
>   {
>   	struct csiphy_device_regs *regs = csiphy->regs;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 1ba3fc2e33ac..f561811b7617 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -295,7 +295,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   		wmb();
>   	}
>   
> -	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
> +	csiphy->res->hw_ops->lanes_enable(csiphy, link_freq, lane_mask);
>   
>   	return 0;
>   }
> @@ -308,7 +308,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>    */
>   static void csiphy_stream_off(struct csiphy_device *csiphy)
>   {
> -	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
> +	csiphy->res->hw_ops->lanes_disable(csiphy);
>   }
>   
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index d82dafd1d270..3b73248f1364 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -72,10 +72,8 @@ struct csiphy_hw_ops {
>   				struct device *dev);
>   	void (*reset)(struct csiphy_device *csiphy);
>   	void (*lanes_enable)(struct csiphy_device *csiphy,
> -			     struct csiphy_config *cfg,
>   			     s64 link_freq, u8 lane_mask);
> -	void (*lanes_disable)(struct csiphy_device *csiphy,
> -			      struct csiphy_config *cfg);
> +	void (*lanes_disable)(struct csiphy_device *csiphy);
>   	irqreturn_t (*isr)(int irq, void *dev);
>   	int (*init)(struct csiphy_device *csiphy);
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


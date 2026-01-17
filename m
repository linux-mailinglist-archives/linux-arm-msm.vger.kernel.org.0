Return-Path: <linux-arm-msm+bounces-89527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37522D39125
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0E593015EF0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B8D2E92D4;
	Sat, 17 Jan 2026 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCpcSigS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30AD2E5B32
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685904; cv=none; b=tvmMB03lvYK2qsHSDgW5hq5Z21a8sZ/7gKXzouw5/lNMmHjY1fk0Z7+TTdnz6DZPvOdhRgOIYWYXn+PH2nt9QqCMMhN/gldJ1OIX1BZeIJk4lKL+qNT4KKkRmO32btI2JhwaD2ikAj+lZ0uIfBdwbyCAvEY40SZZpTUpb/7htnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685904; c=relaxed/simple;
	bh=r75LXAxamOFiLJ7w1C7qUg+8O4qE9Zd/yue01h8JojA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEr1cjUJ161rhFyyi0hlWnZM05SfPYvohj9s+XafrbLAWJy3ULwtdu6Cm1UHUcKqZJoNIJguWDl+MIWUMejyPct3eM8yMZhkFI62iL64U5JB0QWgO5yXScMghr3tSGUqzkow48rA0d8jsq7Ob6l5kwSxNS2+8k6qXPx/kx4VGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCpcSigS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d2c96215so2588091f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 13:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768685901; x=1769290701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOSrfCVt3slZZjtnDEf8LgA1EjmVMXj7ymK/XhVHifo=;
        b=UCpcSigSuj8AFXc4bBjc46Tc2LcqCDN/SdfDTYw6RdYFmloOmWjvHyyb8n4YRgIwwq
         mZsEEPc++KJkH9k6U1Tn3pn1HRF1S0Rc6hgdm8knoPO2jiucnhSxR/H8Nl0yFaV3ay7X
         BMUR/R26w52I1QK4mBjfJqoKPC54RpoFJFnQy6kDe+gPVjsbv92nJwdDsHP7Nadf5C5r
         kPCYHIJFOygVD1ZbYUPwdwuBxd0k0jrTp7ukDZFrL/29BaHuSMl52ekgWftTFoX4bRcw
         y7zIhNfTSYnzI6HHkNOvNFbRP1gdFtedFqEJ42PB/febRz++83+77xi9vcl80me/bojp
         KRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768685901; x=1769290701;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOSrfCVt3slZZjtnDEf8LgA1EjmVMXj7ymK/XhVHifo=;
        b=Gud3ZwAGTj4FfdVQM+V3CjQdFOI0nzsuiPzyk8FpSxW0ypgxM43ww9oiE2XEKBV6ab
         QZ0ae69nyKr3VvuZMpjxYt9TSBU8jd5tK82M/FGJ7NjqMuuRcKOkGJGAv86QVYAnuIQB
         LFAZS1YFDiGiMuGB20+zec/jMAwj29vLWvI/ZGj+VYxWhIprrg3u+twx7k6PttXUC/zZ
         5kdyR+DCvQV0SwczAnDeVMphGGd5t03pY7rexBezaVn74xMcEuSXJg7SXUE9722/FIog
         5NjLLRjwazfIOFGiqiyKos7vW9n30P9DfR6sZgdMltjtdehc0QKcQWeH5wbZzDq0Sl5S
         W+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPu0O5MkhZXCZdmFaRO4NLrRB/7IiPLhxRGKI2xz98Mbf5Hnp11u0Rh+l1r0rHosKYA3npbXHrsmQ79uQp@vger.kernel.org
X-Gm-Message-State: AOJu0YxIvK8GLJrX2E0l7zrdnAFvW7k5M+1d30kjCyW/x08Qn/WYSgCX
	t42TjLXrSgo/HbsSgiYYCsGAWCRMbAFRb6ybcJx+oKUtS1Ambzg20WDpYxE+XSgy5rg=
X-Gm-Gg: AY/fxX7bov55NohWaW2eMUB1xKFoftAGL8veZNsbORRCm386F6WDeCVfJrNvzph8J3q
	luHUzzsy/dIUowNGdi9t03mAjIosto5d7qaZGyNj4AsdabR589Pi0bPIF8hOdvj7kCuUefXIctU
	+EcErxVDAFPA0+V0RnVqzxN/qNeBVj+jc1mLxQ9LDYYB2Tr9Ho74UJ33AXy5cVnVIIi7SuYIZR1
	qAHvFdw/MEK4hndvcHdP3+JfxkrEeSHjOkks+D3sKnHSaz0sN38Ea5Agc+pfUATbKTO4awusK0x
	/rgo2+UgX1OE3IJ7yO9zBmSwtvyh5s1g24wpeMzAVTgeGFzovnIkKW8dtSBtsXkNet3P9jCBjiS
	rG4CeScSIkDiwzGmAoYTjbWIiGLrmDFns5izy8yKFXFD8KsWQrvY7PQUnxnFEeu9hkS3WCvUHnd
	fxg5lP0alFGRemsX1yjFUjGtMjUAmUPEWu0M4Ao36kQ7WglMfDYnOA
X-Received: by 2002:a05:6000:240e:b0:433:1d30:461 with SMTP id ffacd0b85a97d-43569bc4837mr8556092f8f.32.1768685901066;
        Sat, 17 Jan 2026 13:38:21 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569998240sm12791161f8f.43.2026.01.17.13.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:38:20 -0800 (PST)
Message-ID: <de5fbe8d-3f9e-4be8-a9e3-991b959305e4@linaro.org>
Date: Sat, 17 Jan 2026 21:38:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-2-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-2-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
> 
> Since there can be unrecognized configuration allow returning failure.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++++++-----
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  4 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
>   4 files changed, 47 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> index 9d67e7fa6366a..bb4b91f69616b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> @@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>   	return settle_cnt;
>   }
>   
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>   {
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>   	u8 settle_cnt;
> @@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		writel_relaxed(0x3f, csiphy->base +
>   			       CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
>   	}
> +
> +	return 0;
>   }
>   
>   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 4154832745525..f3a8625511e1e 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -14,6 +14,7 @@
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>   
>   #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>   #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
> @@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   
>   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>   {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask = 0;
>   
> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= (1 << lane_cfg->data[i].pos) + 1;

1 << anything == BIT(anything)

I've always disliked the look of this code and now it occurs to me why.

This code is analogous to:

lane_mask |= BIT(lane_cfg->data[i].pos) + 1);

but BIT() is less janky and more upstreamy.

janky/upstreamy - this is the on-point technical argument y'all came 
here for :)

> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>   
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= 1 << lane_cfg->data[i].pos;
> +		break;
> +	default:
> +		break;
> +	}
>   
>   	return lane_mask;
>   }
> @@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
>   	return ret;
>   }
>   
> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> -				struct csiphy_config *cfg,
> -				s64 link_freq, u8 lane_mask)
> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> +			       struct csiphy_config *cfg,
> +			       s64 link_freq, u8 lane_mask)
>   {
> +	struct device *dev = csiphy->camss->dev;
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>   	struct csiphy_device_regs *regs = csiphy->regs;
>   	u8 settle_cnt;
> @@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
> +		return -EINVAL;
> +	}
>   
>   	writel_relaxed(val, csiphy->base +
>   		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
> @@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   		writel_relaxed(0, csiphy->base +
>   			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
>   	}
> +
> +	return 0;
>   }
>   
>   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f4144..08dd238e52799 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -295,9 +295,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   		wmb();
>   	}
>   
> -	csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
> -
> -	return 0;
> +	return csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);

ick.

More high brow stuff from bod here but, more seriously this is three 
levels of indirection deep and the statement keeps getting longer.

Could you get a pointer to hw_ops() to reduce this down a bit.

>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index d198171700e73..21cf2ce931c1d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -73,9 +73,9 @@ struct csiphy_hw_ops {
>   	void (*hw_version_read)(struct csiphy_device *csiphy,
>   				struct device *dev);
>   	void (*reset)(struct csiphy_device *csiphy);
> -	void (*lanes_enable)(struct csiphy_device *csiphy,
> -			     struct csiphy_config *cfg,
> -			     s64 link_freq, u8 lane_mask);
> +	int (*lanes_enable)(struct csiphy_device *csiphy,
> +			    struct csiphy_config *cfg,
> +			    s64 link_freq, u8 lane_mask);
>   	void (*lanes_disable)(struct csiphy_device *csiphy,
>   			      struct csiphy_config *cfg);
>   	irqreturn_t (*isr)(int irq, void *dev);
> 

With those tweaks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


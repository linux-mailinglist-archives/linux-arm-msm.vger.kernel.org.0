Return-Path: <linux-arm-msm+bounces-89536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B9BD39143
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B6893009D74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E162ED869;
	Sat, 17 Jan 2026 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6pRloz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C684296BA5
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768687017; cv=none; b=jeP1T3CHFuCkTu5aWaxaUNPtPWqIPAGcQEyB0XRJsB1YLgWdC7IUC4oRvV2OdH9HukA8H1z5S4uPzbcd0Fr2FmnpWkJoXxxbaumL2vaNr0J9AxkLX6Dm3agNI+QO+1Jzrr80/w6APu2kytErGAze+DopuSV7qktZrfW8b6D4s+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768687017; c=relaxed/simple;
	bh=vF4TN1yu22+nztG/+fn/F8a92h6FiVLorTUIC6RyXGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4ODB2Bb8N8GRff0pz0/AAhJZL/je0DySsyi3yzplm2tfbKrUW+bY1WsgCjYGAiFJ/otwKaR3w3AxTA2GPShEexC0H2WiUL177cMUXe5m5onA693UiD7q6HQHOm8MhO1S7QZnfMcucO1DI/fCelMBbT35TyMUOv4dfW9RBd6KPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6pRloz7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so14125385e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 13:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768687013; x=1769291813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okLeQShl2fqm0YxPatMOb07vCxHIVDXXSr6Cq83TEoo=;
        b=O6pRloz7Xa9a2ROMub5Uygp0vjiES3ND/eE4d1qElydlgQJrlJRFZNUJZPn6PLy3Ko
         N2SAtmJ7YzVUGq/ttiQOgRYs3T2Br4ep+ufQaq/+XN4c4YN7QpxlagloNQlbRiwu8ko9
         Cn4PJ2o8NuCfXx5XiNtu52iZVMXCLRjoy9msgQjQh50pXcxd4KXZbJL5lE98Lm4GNlSg
         cTjQOFyquWqy/5bkeD/+Zre8D1A8yi0WcaSWSMIto+220JOfyHLmOikPgLGOjvnVhK0h
         XSqJs2IxzXiKJvPqIdSlczoUlPhpKoTT3vQtUF1rx8mtZ7zqXOo6Ju5V6vaya+a7Zuoj
         K50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768687013; x=1769291813;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okLeQShl2fqm0YxPatMOb07vCxHIVDXXSr6Cq83TEoo=;
        b=En1MzBtdGQEFQpqbG6isF4tdMjt0K5UVY0+2884GXV7+KAi2pYuHHdoO+irslXUY1U
         AsGo1h26OAiUKJH1ip1Ti9cBh+T43ApAJ65ORg9vqZhgZEwxn2XSjQbg2FdBy9issez1
         0mxcDW3q5A5lDLa/pduVkHIEi9lYH44ayngaa+VDcAa7GfnXkSTM746oNlNfgCzV+06k
         1OXcnjZeIwHuEbbpfsvr9Wfoiob3MMIz6dwI7M5LxAIbHAk4+Jk4HGMh3lxaVNn6xts6
         o8MKOlB+x7mAjglOWKJmULFd8fomd8c96yY+C+z0AjKSnK9DCz47ldiQ7Z/kdctExPXT
         FG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCViT3oC6tn3l8yF8xsAkYerH8ZR/BTzQscin2m6QHqx5NRc2hb3RHa2cF/zKENJa8NORKqkthpBGn0pu7ZW@vger.kernel.org
X-Gm-Message-State: AOJu0YwgqLdEz/E4YJ3/7r3yzqz2bGYXJ4lgCUBr3A+dKoMb4lhi2joR
	zjAghjjHXofYNFPRQ8DCRV8TqNkYwTLfCSPn4rbYbOqdA8aIqquP8+QH3L1/G0lFqXo=
X-Gm-Gg: AY/fxX4hhrmv5bTo5ihfZcWzdrYd3a+Mjo8OXfuv9jwz179EU7dcZS7+V1P67uQC+t3
	k/z4JSBH35WC1lkwcwPEjMoi5k0e0E0gRpRH05Yune2ClS1ZLyftqDbBrqM6sUi7CTqK5G40xqS
	w22IUW3dwkMEekTjsEOYf3iuss9V+LZEkvg4cbfB+LiuvsziAAcSzRgZKvJmc8C4BepvWdS9gSA
	w2+YtRr3bDxUWRMYoknIaI70Ujs904hJJ0Kf82CPwmI6uo+fFQHM7/RLbuKcJGZPuKeg55XD+kW
	j6+KyvG0axb1vCxygv614sxKiEbMbFosbde7O9Rj7YdQjpalg+pIRqXoCaTjcLN5guhh0LlWPON
	IS/tcrE8YuV87FRlZCDibVUs9lz+8DrdTNjIJS4IupIB3MWpBz+CqsxzeaVlFbz8oG3TTBMwW09
	C+CsiahleCUl8Zk8BR35Fd/82gCVBTRQEwIoa4ar3iLxiYtN8UT40e
X-Received: by 2002:a05:600c:4e90:b0:47e:e20e:bba3 with SMTP id 5b1f17b1804b1-4801eab54ccmr80999525e9.7.1768687013504;
        Sat, 17 Jan 2026 13:56:53 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm167386705e9.12.2026.01.17.13.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:56:53 -0800 (PST)
Message-ID: <6cdc17f7-0926-4230-8be8-ecf26cc26df4@linaro.org>
Date: Sat, 17 Jan 2026 21:56:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
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
 <20260117-qcom-cphy-v3-8-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-8-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Ensure that the link frequency divider correctly accounts for C-PHY
> operation. The divider differs between D-PHY and C-PHY, as described
> in the MIPI CSI-2 specification.
> 
> For more details, see:
> https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c   |  2 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++++--
>   drivers/media/platform/qcom/camss/camss.c        | 16 +++++++++++++---
>   drivers/media/platform/qcom/camss/camss.h        |  2 +-
>   4 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index b50b0cfe280c1..24f244d2959c9 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -545,7 +545,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +					csid->phy.lane_cnt, csid->phy.cphy);

Just pass &csid->phy ..
>   	if (link_freq < 0)
>   		link_freq = 0;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 08dd238e52799..1ea0d0ef354ff 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -144,8 +144,9 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	bool cphy = csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);

CPHY shouldn't be a boolean special case - you have a use-case for the 
containing structure, so pass that instead.
>   	if (link_freq < 0)
>   		link_freq  = 0;
>   
> @@ -270,9 +271,10 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	bool cphy = csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY;
>   	u8 val;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>   
>   	if (link_freq < 0) {
>   		dev_err(csiphy->camss->dev,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index ea0c8cf3cd806..556fedd92e065 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -32,6 +32,14 @@
>   #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>   #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>   
> +/*
> + * C-PHY encodes data by 16/7 ~ 2.28 bits/symbol
> + * D-PHY doesn't encode data, thus 16/16 = 1 b/s
> + */
> +#define CAMSS_COMMON_PHY_DIVIDENT 16
> +#define CAMSS_CPHY_DIVISOR 7
> +#define CAMSS_DPHY_DIVISOR 16
> +
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
> @@ -4280,20 +4288,22 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>    * camss_get_link_freq - Get link frequency from sensor
>    * @entity: Media entity in the current pipeline
>    * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @nr_of_lanes: Number of lanes in the link to the sensor
>    *
>    * Return link frequency on success or a negative error code otherwise
>    */
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			unsigned int nr_of_lanes, bool cphy)
>   {
>   	struct media_pad *sensor_pad;
> +	unsigned int div = nr_of_lanes * 2 * (cphy ? CAMSS_CPHY_DIVISOR :
> +						     CAMSS_DPHY_DIVISOR);
>   
>   	sensor_pad = camss_find_sensor_pad(entity);
>   	if (!sensor_pad)
>   		return -ENODEV;
>   
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, CAMSS_COMMON_PHY_DIVIDENT * bpp, div);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919e..6bf7738837b89 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -163,7 +163,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +			unsigned int lanes, bool cphy);
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> 



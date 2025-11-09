Return-Path: <linux-arm-msm+bounces-80868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 860ADC43DDD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 13:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25E8E1881D71
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 12:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177042EC09D;
	Sun,  9 Nov 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNryNons"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091352EBDE3
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762692165; cv=none; b=ehTiGItLr7gJ5MOg5lgnxm5HOerr1yEaNIIFR8p25UYbY+mEqc0+TW7i34lBoj4RqDB8Em2ePOckITG+44nMBc0bjlRCmLQLEmpUuy3vdQIwO8Gwr7nonoO74g3PoHl4N8oznKlts1PnoXDNScTc4RiUsv3N3Dd6yUcLjDLFmuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762692165; c=relaxed/simple;
	bh=6TOHpgpqHJ5WgnknUzBZQ+Cb+5OFiDU38P5bXDVOJnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eF3dT0LgyYeD9koGTSiuPGvgMQApgY7gIOm29E3nYFTh/XIkmKlQOq5LgKgOct8kvRKa3EhloTaxiC9cdLqcqJkI6qLv/c9YkEcg61+uAErS805NWUUt64BkLhK8XTJCCvdwWm7UYi8xs3CosZcgsyLbWR4MIjrXGh5xa8tKubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vNryNons; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b725ead5800so279128866b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 04:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762692161; x=1763296961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXaxtSEsQGvchBbil4q1XD2yo5gxFEG8Hu3hgTDWe1I=;
        b=vNryNonsftE4jxNo0F1H7ZDzVR2tKZIJan+FzQLQhasqwpJmkGZPpW3VPMZB8gIMV/
         BxRRrRIwWCYxwTVo9zpNaPcXxhOeTsn3LM55+b2cI9w/QwXr4TFFlOuGGytpnIO7B2kt
         HkWKgyzkjwmsvuTcisz7aezSaY9mVdWA1O1rNQlQ8Hareby7TMqd8fHbXuvQWFiCyfVq
         pa8HV328a9oz2glV95iI7M/MvLXlxFAV8bKyijbYQ0/eBjIYEyjo+HCkYqAGPGORUhak
         Ia++lRvQiFQWZxVu9KYEddSTY+Kb2WcP3xPe+vNLViI0bqn3Eye+m/98Rzkgn8XsKS+4
         FC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762692161; x=1763296961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXaxtSEsQGvchBbil4q1XD2yo5gxFEG8Hu3hgTDWe1I=;
        b=OAwJvzwukw5CWEJgAI2+St6z8/MLQwj1KSKT/3Hujct/tbNwaIWmz/NaMkemhL95DS
         eMh9XN11CfXf0kPWlI55Q72fpNHF1XOW1d8dDln01QcKqRDfTSBMW1s52XC/Aw4UOyji
         l0UH4QKrk7WJ7BhHKDDHr/dq04dxfPi3o5HUkrAdH4+3nO22VE0s6I4BMH3MoJleM94q
         pkC/YPCxyaRnkmk1oF46NlE5VghMioJ1ZIegVN7gbnOhiZPNieDz+6oJf7dNoRHfDC+d
         fJqnGXI76QFswrhDxqYPeb5MEaSPngQ0F0/+eoxTMXk0HQ8izi62SmvRnKXK95A6pBcf
         7AWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVcS0JuoZygIRdx/UG5TjYXDlV+vErMW1ZEDzaBCSKkhPi5lxrK+2RCWSoBfsBfRtlXEj9m7+w9KXn0aHp@vger.kernel.org
X-Gm-Message-State: AOJu0YzM2O0M6mvXA16qymcmqUzYztDr4jXy+6gAPlnuuAXCwvWupgL5
	c/MT+N85daDM+qjBpJbEzIE2hcYStkvY29XRbk2qUS2G6UpIJAGPmd4TiSq/cMuNI24=
X-Gm-Gg: ASbGncuwB/OzKDbMx3ZcGzu2wLljkVyXrQPcl6UgZXhda/UvbUWd4EINhbGKi7+sUyS
	4yP89Miy6ykj2zQVBOIJ1q+gfudjlbr7H/W7TPkBuvx9t8eoPk0E3CbplTuIDvKiBmgi0kyf4JW
	k/POPKcvIFlQzw99XqD3RACRNQQRuH2DlKaxKzBQN8YdWaKKrylq5uh5Oe/H2lBoHaafKyq/a84
	YKt8I5Hp93ExXgVvJ9azl7gbMcUw85ocIn509ENW70sO/AIWmJLsktY6/W+54a3APSeC4WZsLru
	rp2ZR4vSJ3+KJ5Fz4sHY7X6h9rgVcWRGPKCBro8fbydd5ZmsvKQ4Xp0AgOtD13V4lvwHr2uYQTR
	1POV8IHbgImvL1Cbif6MPJwuZQ6CQuj+bBQ+N0oOWfGpdiH40UCWFAT4hHopIOFQ483nJmaPtPo
	bFOelJD4Pe8NybOkrCoAuGOU6XsfIgLr+v4C+z32DPIgaL2iwK5nixXlZe1E59DjAZ1kolqrzXl
	PJWjjEaJmwmB5qkg76cjGDwaPUR1tV3dYV3b344YJ3f16pUQOkcg1pzIMedq59Ofw==
X-Google-Smtp-Source: AGHT+IENKoAaMYCpquqLORFICuxP93xzbU3KBb6gWvvqfSpI7tXUE7Swy7LtzA/UFFK4KqGX4Fsd5A==
X-Received: by 2002:a17:906:f58e:b0:b70:fede:1b58 with SMTP id a640c23a62f3a-b72e028b9b0mr497726566b.2.1762692161300;
        Sun, 09 Nov 2025 04:42:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6? (2001-1c00-3b8a-ea00-4729-b0ef-dcc4-b0b6.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4729:b0ef:dcc4:b0b6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bcd59sm784848566b.53.2025.11.09.04.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 04:42:40 -0800 (PST)
Message-ID: <fd0a3ac1-1a6a-486f-ab0f-e5cd69f8127e@linaro.org>
Date: Sun, 9 Nov 2025 13:42:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 7/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-7-165f7e79b0e1@ixit.cz>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251109-qcom-cphy-v1-7-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 11/9/25 10:39, David Heidelberg via B4 Relay wrote:
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
>   drivers/media/platform/qcom/camss/camss-csid.c   | 2 +-
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 6 ++++--
>   drivers/media/platform/qcom/camss/camss.c        | 7 ++++---
>   drivers/media/platform/qcom/camss/camss.h        | 2 +-
>   4 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 68adea33cc719..9fb5834b28e2b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -545,7 +545,7 @@ static int csid_set_clock_rates(struct csid_device *csid)
>   	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
>   				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
> -					csid->phy.lane_cnt);
> +					csid->phy.lane_cnt, csid->phy.cphy);
>   	if (link_freq < 0)
>   		link_freq = 0;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index a734fb7dde0a4..61f2b2ac3f159 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -144,8 +144,9 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	bool cphy = csiphy->cfg.csi2->lane_cfg.cphy;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>   	if (link_freq < 0)
>   		link_freq  = 0;
>   
> @@ -270,9 +271,10 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
>   				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>   	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
> +	bool cphy = csiphy->cfg.csi2->lane_cfg.cphy;
>   	u8 val;
>   
> -	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes, cphy);
>   
>   	if (link_freq < 0) {
>   		dev_err(csiphy->camss->dev,
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 549780f3f948b..248aa6b21b5ad 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3912,20 +3912,21 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
>    * camss_get_link_freq - Get link frequency from sensor
>    * @entity: Media entity in the current pipeline
>    * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @nr_of_lanes: Number of lanes in the link to the sensor

Missing cphy doc comment.>    *
>    * Return link frequency on success or a negative error code otherwise
>    */
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes)
> +			unsigned int nr_of_lanes, bool cphy)
>   {
>   	struct media_pad *sensor_pad;
> +	unsigned int div = nr_of_lanes * 2 * (cphy ? 7 : 16);

What do the magic numbers 7 and 16 mean? It would be nice to describe these.

Kind regards,
Casey (she/they)

>   
>   	sensor_pad = camss_find_sensor_pad(entity);
>   	if (!sensor_pad)
>   		return -ENODEV;
>   
> -	return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +	return v4l2_get_link_freq(sensor_pad, 16 * bpp, div);
>   }
>   
>   /*
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 9d9a62640e25d..0ab908b0c037f 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -162,7 +162,7 @@ int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
> -			unsigned int lanes);
> +			unsigned int lanes, bool cphy);
>   int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
>   int camss_pm_domain_on(struct camss *camss, int id);
>   void camss_pm_domain_off(struct camss *camss, int id);
> 



Return-Path: <linux-arm-msm+bounces-9050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA788427AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 16:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43231F236E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 15:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C56482D60;
	Tue, 30 Jan 2024 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Uy6upPFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC9B81ABC
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706627338; cv=none; b=rbxHJ/i+zjEIop1xUSdY2KekyPqPn6mmN6v8uibFJCFQcPVI0CRPrva/m9/mtdd6N/hzFYhaZDAAKgZhQz+ZfSNP4CAOPqs9IlP7yohNi974gzYa78OayFRVdehPimZAdl8k6TZ3Lpz/Ln3y0Lbxv+BpePwtiNVw+L5i+19iJGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706627338; c=relaxed/simple;
	bh=h0OTDxBWOisgWB2yRwbr7R3YMVBdajhXN88i633Gm28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VreCwc+BmXgQv85PLCTOIhX0eonGQTW1q9EfwoFYE6kC7E/GWyFXVzX6LNTgZSCkbR2ocSCYHlEnJduym7pkwiFJQQ5lcczdFySNN/6qobP2Bqwvs0rPWdngdgD/pMnpWRqy/Br1gP8gzxp1u8XgR7H52ZH2icG0HDH6vl2IlKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Uy6upPFK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51028acdcf0so5049804e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 07:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706627334; x=1707232134; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aeOs16K1ggzcSxM81rroSW/PgSS9ODAboh/iGfdKq7Y=;
        b=Uy6upPFKyfMncgV3j33k4kHyf0E5Al+8vVcRar6WOabwFgwL5b+XRM5p46s0N+7uZr
         3fAaK40Cr8Y1EB4kmK+GAzmN938uKHMwdaZoz5ZBjASko/nZmgy5a375syWK+uSdMdWK
         YaoBq6Q6YfiJtE0RB07QXIi3MG5TbWThdcJK4bjXRR3RtgcZrC4ve8WXACa/IsTAQ7cE
         vWVP/0YT9CZBkWbPqswECFAzqPN5lVasHvyflbRnGtYsngppnx4AAKZOtbmO034Useha
         vyV1KX20Wsv0fjNZSNsqvv+khptlyaVKEeOC+lMuhZ4AIrWmVWk8FmeJhfUuZDNJJpPG
         cS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706627334; x=1707232134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeOs16K1ggzcSxM81rroSW/PgSS9ODAboh/iGfdKq7Y=;
        b=krFkic3fN21wN9dA6fTdDp46OI3ucF+Es8UkcLZFmevEMKCeLPmTBWTPuV3WpCtgWF
         AHkOvOM/N5rWw3Iks30d4RZYrLpahE/MJPUABepixGDkuD4hoyFAd1Dhtftk8tTP37fR
         HB3vXhA1EO5F8seU4CckdS2NT2CePfWMlZFBIfORbcclxsyrrM6JIK43QYxRuR/z1rzH
         kwVsGwdMtg5Q4GzjkbDgja1ngLtVO9Q7JAu2nGueNP875sqYKLttsfUMjt4bbR498cFr
         FgaOdCWrkWH1xACeykyPkKa7+YigRaRGY9nA1lll22ayEXOR7ZSbRiVSgZlrkzrbQR12
         Yjtw==
X-Gm-Message-State: AOJu0Yycne/9lQbrcX+aRwihBKP476BD0xUHzygVaxBE0cnsbOeT75vB
	K4j3ZlYcM0eYb1eQaOLWgK2R+LZbV5/93d/6PIt7ma2jCuUZZRzo3Xwee8WOJiY=
X-Google-Smtp-Source: AGHT+IF6B+jmXhpAUXU/JypBmBfGty/Zps7VOXIocvbWg2ZzM+V6LjpS3JB2V6IpNaOfUn05BOgkfw==
X-Received: by 2002:a05:6512:3764:b0:511:1fb8:a16f with SMTP id z4-20020a056512376400b005111fb8a16fmr928741lft.8.1706627333655;
        Tue, 30 Jan 2024 07:08:53 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b0050f09876c12sm1491359lfd.208.2024.01.30.07.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 07:08:53 -0800 (PST)
Date: Tue, 30 Jan 2024 16:08:52 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, miquel.raynal@bootlin.com, rafael@kernel.org,
	rui.zhang@intel.com, lukasz.luba@arm.com,
	support.opensource@diasemi.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, andersson@kernel.org, konrad.dybcio@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com,
	srinivas.pandruvada@linux.intel.com, baolin.wang@linux.alibaba.com,
	u.kleine-koenig@pengutronix.de, hayashi.kunihiko@socionext.com,
	d-gole@ti.com, linus.walleij@linaro.org,
	DLG-Adam.Ward.opensource@dm.renesas.com, error27@gmail.com,
	heiko@sntech.de, hdegoede@redhat.com, jernej.skrabec@gmail.com,
	f.fainelli@gmail.com, bchihi@baylibre.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 06/18] thermal/drivers/rcar: Migrate to
 thermal_zone_device_register()
Message-ID: <20240130150852.GB2544372@ragnatech.se>
References: <20240130111250.185718-1-angelogioacchino.delregno@collabora.com>
 <20240130111250.185718-7-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130111250.185718-7-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

Thanks for your work.

On 2024-01-30 12:12:38 +0100, AngeloGioacchino Del Regno wrote:
> The thermal API has a new thermal_zone_device_register() function which
> is deprecating the older thermal_zone_device_register_with_trips() and
> thermal_tripless_zone_device_register().
> 
> Migrate to the new thermal zone device registration function.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_thermal.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
> index feb848d595fa..7bf9c1611a00 100644
> --- a/drivers/thermal/rcar_thermal.c
> +++ b/drivers/thermal/rcar_thermal.c
> @@ -488,10 +488,17 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  						dev, i, priv,
>  						&rcar_thermal_zone_ops);
>  		} else {
> -			priv->zone = thermal_zone_device_register_with_trips(
> -				"rcar_thermal", trips, ARRAY_SIZE(trips), 0, priv,
> -						&rcar_thermal_zone_ops, NULL, 0,
> -						idle);
> +			struct thermal_zone_device_params tzdp = {
> +				.tzp = {
> +					.type = "rcar_thermal",
> +					.ops = &rcar_thermal_zone_ops,
> +					.devdata = priv,
> +					.trips = trips,
> +					.num_trips = ARRAY_SIZE(trips),
> +					.polling_delay = idle,
> +				}
> +			};
> +			priv->zone = thermal_zone_device_register(&tzdp);
>  
>  			ret = thermal_zone_device_enable(priv->zone);
>  			if (ret) {
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund


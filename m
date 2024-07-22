Return-Path: <linux-arm-msm+bounces-26802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A9938EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75641C20EF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B60A16C871;
	Mon, 22 Jul 2024 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I22mSe2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46321754B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649632; cv=none; b=a/FkYeVPQCVUCVzQ6/qIEM6ytFeaNEwCgjtm89sJq6MlF6flfw0iuUZ6mMSpa/XfCFt+bAnskXdtDbRFf2m63CwS5wFNKuO4Qp2I2bQkWQA7dTz5VpZBPj4LyknstwYUj/pmkVxRPw/JT5blQVXlUzJB6QeWwZpLPTR/LyFphDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649632; c=relaxed/simple;
	bh=/H5dtfxa+Nw4zsSc6z5aDmVUmIULoNGWM3agejyxotY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHLK9SSkGa0JEdjpZYoRb9g0ezLqHFZ117/tLWNa7YlxOVjrvcS4cWvt7IMPzo25VzcDCEXRCHZr6Dvng+80hOUnwai5uQ9aj9PZBQjaeo0SEhfyptARc1bY/+orzhMShVFZ64OFm0gZpuEDQRBO0rVvlcbsRzBKPghVmPdGrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I22mSe2w; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eee083c044so47854991fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721649629; x=1722254429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trXo2Kud/+4CHx1yH0TBjLSkOLQ44ny84aia5JfqCsM=;
        b=I22mSe2wKPtaWjRUbhb0Zc0WRLnoLDJaRaj6ZeN+/oR7F1Iq2lbvaNh6WqzVC02jr7
         jJq9pEvafghM5tae68p5OidJwwj/lGSzTukWTg+yzXt/0vFPpT6Q5cNGY5Ck8LXLC2tq
         fyMOMa3tLVVvPkb2R6atmBBm7QAYela1Iw6eRsC2KBsI/is+GlpucGCC10sxqSPBNdHU
         UM8IWTbzoBK+YZ3AKm9jC/V/UqLRpEIMefJOeMm2vshTekTQE7n/iDRtZTEi25uN6eXZ
         L00Fp+utVCJr7l90GadlHHZyarY2Pf6GnqQD7FOUyh3pvGuTX6rA/gl6s33NMV470lWF
         QB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721649629; x=1722254429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trXo2Kud/+4CHx1yH0TBjLSkOLQ44ny84aia5JfqCsM=;
        b=dUjpN+pnK/U4CYgJua/PEy6QeqXXN0MS7NYa5bGvKcno4niVO6CGgJ4WQS5PueXT4J
         N1xAxI/G7+dWiwvtCwN13IXEL8ejZjBaw21fTzu3Tt5JZihnzdaElukxUXMg5dxPWeNY
         Nd32WEMEfyFqw/yEMl7CCjZpH9PUzi0Rk1xwljzkDeAac1dfHP/Rhwmka14DHYBPT/eb
         fGvQRkIVZ+2PQLS4+cY4ldD49Idrt/KXjzuHv4MUXkeye2AZR7PZ6ZyRXQk5HYT+3HCM
         c3t+u7Nw30Fw9LQ5E+x8o7ul6tUR+L9b0sfEeOqsBfBsI54Wk9+xO6AIdYdnFk5IqtDF
         Xo1g==
X-Forwarded-Encrypted: i=1; AJvYcCXfWaYt5DqaiyMFR1TyIxeSZpJqIUPMJh3gCD7DFxpiuyDAyE8RU9rEmKm5Az9BHZpmm6SJF0+LGodgTQPdCj0XN3qndfU3MqF/1mlOqQ==
X-Gm-Message-State: AOJu0YxQ/OjkvB7dqJcN5HHK2G1OFw3jWt8Gb7qSglX6TNRv5AGzYJ+k
	eoM1ZjgHQwwcx0SWSD/LYhM7PyKwkowpy1T9DDXgpNBkUbuORcEXW1UZH0rGR+Q=
X-Google-Smtp-Source: AGHT+IHfpRkiwCwyjhMtcbqX/KMogZuiuVRMVA2GKfuTw4dL3YtZnf0Zu/Vpy6wLwRiUYsUM8T5TnQ==
X-Received: by 2002:a2e:9f57:0:b0:2ef:2006:bfb1 with SMTP id 38308e7fff4ca-2ef2006c9e1mr40429441fa.15.1721649629135;
        Mon, 22 Jul 2024 05:00:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef2eae89ecsm4705601fa.68.2024.07.22.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 05:00:28 -0700 (PDT)
Date: Mon, 22 Jul 2024 15:00:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Message-ID: <jx26jgbw2appm4yvcz45lisa2nr3uf7r4lvdd3i2eazl5nwjar@mk2xug4zhb7h>
References: <20240722095147.3372-1-a39.skl@gmail.com>
 <20240722095147.3372-2-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722095147.3372-2-a39.skl@gmail.com>

On Mon, Jul 22, 2024 at 11:51:05AM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3023cf180a75..8971f4f5d339 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -320,6 +330,10 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->spkr_iomux))
>  		return PTR_ERR(data->spkr_iomux);
>  
> +	data->quin_iomux = devm_platform_ioremap_resource_byname(pdev, "quin-iomux");

This should probably handle -ENOENT (or -ENODEV?) case and set the
pointer to NULL.

> +	if (IS_ERR(data->quin_iomux))
> +		return PTR_ERR(data->quin_iomux);
> +
>  	snd_soc_card_set_drvdata(card, data);
>  
>  	add_ops(card);
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry


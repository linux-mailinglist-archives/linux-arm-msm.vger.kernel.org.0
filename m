Return-Path: <linux-arm-msm+bounces-76138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7ABBFF83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54DAF1896B41
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1701CDFD5;
	Tue,  7 Oct 2025 01:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VzcTr2ud"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A651D5AC0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800945; cv=none; b=e4oD9QQM5SVIBWuzKiRHJTzTZ6ZUDDPPd1rf1CvnP5AzwDYCPDdyBzgSirGzuiy+6aN0JZn5B/nhq1UrNwkyxJqnl/69CoJ5hWItmdVwXzsw569BD42Ror1q8psNA+txCLhQ85hAPW2zqboyzo2V3s8KhABSZI1XxzVedXFlWzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800945; c=relaxed/simple;
	bh=dSFf1E/J7CDTNdjk+dI/Pn6eRQ1aAq+eFCYCegQhb+0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ntIGpehYIE7eXol/600Wxxd9c4eCT4lcwRXNRNeKCCwD6qHC5rnCmLfXttjBqQL+V5+1UNtVwqpzinN39fhUhJfLHwC6UJ12b5EImKNjO2CoQVPDtPl/gVrW5v4nDTEbMwJ8SzOxFVKWC3gdi4WZhEuovh47/4tZdHmkhf8KFYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VzcTr2ud; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e47cca387so59778015e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759800941; x=1760405741; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji+JD5QBQH6eDTa+kxfbkvWxEhikk+fAOwvZw23zzwY=;
        b=VzcTr2udTjA3MDdRH+KJrmifXi4DBDEqU3uQoIzZ9b0yX/+8GSbuOtiORwWHrYXRHM
         XZcZvbnXy/22Y4MKQ6Kw2fluzLqM0hBXpTvjTBmslNa/h4UEb9sw/jddKdhmFiceuPRM
         bVRx73bHpWJmltQ2jTU1mwqHxZ0sB1AjbHRbTSLMCqzeJCLQxY8qt/G2k6y0nOp2aUTJ
         3i9CVwbp55vsRVViHMYGRcesI4Ypa7tfu9KIsVCdpwC9Fag84TMLjZS25UJThDX8GD4k
         Dbw0+QyBbbNVUJywR0R4HLjxaD7aa6HpVBJrQbELiFozIN0mjujYF9d2ETa4RvrImji9
         C3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800941; x=1760405741;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ji+JD5QBQH6eDTa+kxfbkvWxEhikk+fAOwvZw23zzwY=;
        b=CfL/5LxJ6Oyz3oZG6pqEX82Qkn345AcvyHZW6b47KBlqJO+4QbAfcg51RbgkA2fkwh
         6MN1FTCDFYBM7biEGAg43cCDMLyL966gXR2KlMF4TFDpuo9PGuxKEfqbQZrEzgr7PTt+
         Z2tLwzKWsOVZhtpq23XtfncIre79Dizc+tZX3W/7QnJsUfbxT38ROW13poplSxC10eNi
         ghbIfTAiMXGE2c0IDZNuT2P8fMATwepISt86oe5aRGE/RtQ+Fp4jskf9CNBgRAosMPsK
         ZImw/hPhZUbfHBcuLJntrWqtg3/JgmFyYy0ZyQm1xKsPPTTrWIVKQuKqgE2mrrAQ2sIj
         LQLw==
X-Forwarded-Encrypted: i=1; AJvYcCVNU6ll0epwuScpXflURnjbo+B4aYD7CpO+iy1GJDOJoBqz/29QGM684rVD7o/cfdUqBSl7rGm8tOkyT52Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwLl7dCAmv8Pk6A/WJ1AFx/sZUiWF3oq5eEq9+NnRTRvgbX56o5
	UkSzVvacGWpNQZwlZgr60wtX4mVni2X5Nv2gEFwZK2uCr8G3pLSifAyuUk92gDsCsH4=
X-Gm-Gg: ASbGncton+UrY5sTQToOcNA6GvGThWhNTC9q9eckmxDqhuB8E+FypSOEcokZ0Xn+mF5
	LniyLs3y0dzPdKllwOt4YAk0bcZEVyjp/AlDyrlbOeVKfu/4E7745246/ZL3VJkSGrTAzt4lhNE
	TFgyZxgar8vcnZGhVqirot5ABZkjxVPnoBuX15KFWG/17czQHWKxoma2GGIBEH1iztwUhAxUnYS
	KbDwliDrC/KUIjFhEhBMm8BVTirD/OS0sViqKbot/zhNBDrXXETLrIu9z3wic6V0jx3i3S5P5d7
	PXhk45yvCmRcP52Fj1zIJNwkk3UaftgrT619W+eWITgzMxKgO5zoPILoD7sO0BgN1b3ynTsveIf
	sz9Zoe/P3XLjPDgVsr5CbLaVG8bk27B9zQdsgnZ1DB7uVNihE1kiJ4H9t00FJNxo0Bw==
X-Google-Smtp-Source: AGHT+IGxegk5zS/vcDYXOHgkLn6TGJ/oSEBKxXzqmzD05DR2WTUPLYfCcOojl3EbamxexC7GUdL3oA==
X-Received: by 2002:a05:600c:8b6e:b0:46e:4499:ba30 with SMTP id 5b1f17b1804b1-46e71153ad0mr112226515e9.30.1759800940679;
        Mon, 06 Oct 2025 18:35:40 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa2d5bd52sm7679105e9.2.2025.10.06.18.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 02:35:38 +0100
Message-Id: <DDBPDACTUFEW.1VVHN1P0PC6YO@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Neil Armstrong" <neil.armstrong@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org> <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>

On Mon Oct 6, 2025 at 7:37 PM BST, Neil Armstrong wrote:
> Add support for getting the I2S clocks used for the MI2S
> interfaces, and enable/disable the clocks on the PCM
> startup and shutdown card callbacks.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  sound/soc/qcom/sc8280xp.c | 104 ++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 78e327bc2f07767b1032f09af7f45b947e7eb67a..ad4ee5c6fab8994f18de57284=
2f3dab6f4f5397e 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -4,6 +4,8 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/of_clk.h>

^^

[..]

>  static const struct snd_soc_ops sc8280xp_be_ops =3D {
> -	.startup =3D qcom_snd_sdw_startup,
> +	.startup =3D sc8280xp_snd_startup,
>  	.shutdown =3D sc8280xp_snd_shutdown,
>  	.hw_params =3D sc8280xp_snd_hw_params,
>  	.hw_free =3D sc8280xp_snd_hw_free,
> @@ -162,6 +222,44 @@ static void sc8280xp_add_be_ops(struct snd_soc_card =
*card)
>  	}
>  }
> =20
> +static const char * const i2s_bus_names[I2S_MAX_CLKS] =3D {
> +	"primary",
> +	"secondary",
> +	"tertiary",
> +	"quaternary",
> +	"quinary",
> +};
> +
> +static int sc8280xp_get_i2c_clocks(struct platform_device *pdev,
> +				   struct sc8280xp_snd_data *data)
> +{

Could you please confirm that this should be _i2c_ clocks?

[..]

Best regards,
Alexey


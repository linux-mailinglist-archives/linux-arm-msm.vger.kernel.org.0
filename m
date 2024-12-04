Return-Path: <linux-arm-msm+bounces-40219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 504839E38D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9392B36483
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA9D1AF0BE;
	Wed,  4 Dec 2024 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yoKTlx46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76FE16F851
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310337; cv=none; b=eJ9HlMRS/CvPnIm9ZSwOB77kj3nAPQVYM1bPikg+zVvDz52LKopLxdyDcItSxJL7Lkve7UiNBmbfWmNJUoZ7PAL1x8OfuwZ0RtuTOKd+KAASvfFk4wBeOxomxEZS10h2I/i7GcOMLTMOLsuaGhyDbn+cL7MHUK4gxOn/i2zwNHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310337; c=relaxed/simple;
	bh=SAidZjBk+fYmt5AwPP6zN/DjTwTQx3RLqG4jvfGi1A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuNvvZCZJY63XxsfFnKmhfz4ivmH32imsFUkQT1uxvWjRUA+XmnyK/ZynZgdG71+X5m7PIkrtyPy8R0IOHbJafQiAdGGMFzYJ2cNgx+ek7iiAQ8UTndRZzWgrEfrSiaRLuFMRytymIWLeyroNLJTZhDeeR8R2KRTB6TInioSDrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yoKTlx46; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df6322ea7so11529261e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 03:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733310334; x=1733915134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANxqChj2I4LzNaOLgxVnoZiKM49rhNSRtgRob9N8xcA=;
        b=yoKTlx46HI58pC3x4tYD54F8OmpMSE9hQaU0XwKYn79XCm/vPJVydO04iO0xllpQ3n
         /AM4mifHZYaDXQnf3zD/3v+eiciVNHMJ+vUDeP6nz9ZqmVOPa759TTTvzgAR/jAhbeax
         TU4XSHOP+FQ9RvWYG0nlhHrQHUtW3ACeGdE8YGXjraksh9gGUv7NQgGbKLQNDTtPRpHt
         yaDwEOwoMevLB8tQDeceqn3YZOioRzeoe9QXSHWVwIfaYIy2h659rlo42rob630vSTkq
         rwGxhld1FWhSLdnPXStbmQimfmCoEAm+z3HO7y7pLIy9gAY9ylr3vy/9dK6y3m7MZ43X
         rQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310334; x=1733915134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANxqChj2I4LzNaOLgxVnoZiKM49rhNSRtgRob9N8xcA=;
        b=vuvJxDzWEYsy+mDKzqAzWauWCEsS0k9rzUEo7GwxrvO8gXNwjOHvXyJ845X6ZMebE9
         f03qBbBb9BqP92vGRUM1MFVg9EeSUW221wjVA3zFx7Dkrk1GL273hkDNp4VCvJe2XSDC
         JLILseBUtD/9oOaLg958mqVy6xeflWT0enXfHvKFWM7LJwqVjv8t2jtxnVIve8gQxLb6
         IodFVVyGmtLyyd7ZbnbE6nVk+yy8aPVPjiKK119ucOFQt+F/jppGdcLCU15shIPWIiYo
         xx4U0oyJ6lzDhoSJjMHsmn8GZqfrY5VLl5Kp+4OE6TG8CTPdYG3eGskujlRepc4UL6VC
         kjVg==
X-Forwarded-Encrypted: i=1; AJvYcCUqiRPKi/eo5hT5tv4JLtHobCAtUTDDlEB0K0q3uDojkx4tm2W7fjeYz/kxd4AryDefxXW2FhNmnBg+c6Us@vger.kernel.org
X-Gm-Message-State: AOJu0YynZZPb2OebJmdl9Ucw+GvJIxtGgH415Jzo8a1c54iTDqqTw5vz
	S2gs8kwUSnIJmwoaaasEAkfDInuMTavIB02TKCjwZmFeX7kh59nmY61HT/j1pA0=
X-Gm-Gg: ASbGncuBYOAvVboIVAHMkYBhHLzQpXeNkZgRSOUCiBmZB2qwcNlU062nLSiAUJezONB
	F7SnqIIAdfS1Hc8X1A3Z5PNq4nz25ZB6qWGDJfDGXTYYNBf+TvPdvKH3RZQSl1EWTdKsRs+uFij
	E+f7FtmKjQnbOjUw8g5UaPK4KmtrTSsrn7YpaQaBPnzQiikTW3boou6FAlll2RtqFRZ/Ifsoari
	6tuCcJRzpBLEw36wd3El2C3mpRJrhCBBvlT71j2m1pTb4gC3IIcTtALKIaUweHuoMznj6EyPxcw
	ZxET2iLsGlyl+tTQpsmbmYhexeqwzQ==
X-Google-Smtp-Source: AGHT+IE02OylWuhmLiv9NeZ+y1tMELUVhyM1NPSDRneMYjkQCw9UUjW5chQGb5NxXW58BcIkBAdcuw==
X-Received: by 2002:a05:6512:3ba3:b0:539:8f3c:4586 with SMTP id 2adb3069b0e04-53e12a3930fmr4678078e87.55.1733310334049;
        Wed, 04 Dec 2024 03:05:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0065sm2182327e87.263.2024.12.04.03.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:05:32 -0800 (PST)
Date: Wed, 4 Dec 2024 13:05:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: fix ov7251 lane properties
Message-ID: <vlvchjynnwvevr2raosrwggwmjd5bdrs5skbsztskmzxjjdg7v@6qkhrjyaxlsz>
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
 <20241204-topic-misc-dt-fixes-v1-2-6d320b6454e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-2-6d320b6454e6@linaro.org>

On Wed, Dec 04, 2024 at 11:56:54AM +0100, Neil Armstrong wrote:
> Bindings documents data-lanes as a single entry with a separate
> clock-lanes property, but DT uses 2 entries in data-lanes.
> 
> This would suggest clock-lanes is missing, fix the DT using the
> bindings example.
> 
> This fixes:
> sdm845-db845c-navigation-mezzanine.dtso: camera@60: port:endpoint:data-lanes: [0, 1] is too long
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov7251.yaml#
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> index 0a87df806cafc8e726aacc07a772ca478d0ee3df..5a16f4c2b346b314af3d614266e1ca034057e643 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> @@ -115,7 +115,8 @@ camera@60 {
>  
>  		port {
>  			ov7251_ep: endpoint {
> -				data-lanes = <0 1>;
> +				clock-lanes = <1>;
> +				data-lanes = <0>;

Is it really this way or the other way around, clock = <0>, data = <1>?

>  /*				remote-endpoint = <&csiphy3_ep>; */
>  			};
>  		};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


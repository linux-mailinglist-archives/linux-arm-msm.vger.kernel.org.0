Return-Path: <linux-arm-msm+bounces-33278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED899211A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9480D28193C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB845189BB1;
	Sun,  6 Oct 2024 20:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7hCGmKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ACF189917
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246396; cv=none; b=GQPgWf3G38AFDtyZQ123XRRYWQZDc6ZH5ZFIBj1byjSKeyfBbbV1UdyNwGTfAOzxLGQIaYe9eJXDDmkwW4oepnwmM6RgNOxfJjtRqcMG/3B+EGlRCXEkcRibWZMOV/zYW//lqUbFVx8xzMElZMhmwOaZomnkbV4jg3oUeK6gKE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246396; c=relaxed/simple;
	bh=i1HSlcfG6Gk/k+UqtSwJNp1NND5qicT3kFk53HYZUe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJpYZ8FOK1hZWOgoDNdk3WSSuF3wsbraNT/kkOxyn4LKCr+iq2Da++gTPehUYCcEzM5qsJvim5ur3b/0dnItB8fqcjVw1FgTTGhhmvIzv6Pnnipu3jYH2AwLp6ft5zS9bAdx0eJVSO7uzQP0df0UlNHdy99h9aXF6aPsyeUkJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7hCGmKv; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2facf48157dso36604741fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246392; x=1728851192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBuPk8VD/ExsghxOi7SybSYIm/8sA+XnlePRO8akAWg=;
        b=d7hCGmKvqcaYbXke9FlfQ9E+9EcrwGRTml1Z2N+3RK6hqeFsFr58iSCDT+qkrX6IIG
         tnx4AD46SGeTadjAZe+MgAFCxDt1T/qR72R/NQV6ctDiTfqSlXkO94gQHslzt1yPY4De
         AFOJ267G6c/hVI7C3Bt/Yj/MmITxSktYArh6yFd2JUQ8uvqz+F+vMkM2zARnzwwUNVgC
         neaBIpuwbNDtonld4K4Tt9GMsJ+aoT4caagv6T5uML1W8meKHxAEpCiNcKKPGpLSnSVV
         PJDsIahJZ6Sy6D4kJ+4bI9YMGAYAmu2K2ZY1mKF8yQiUoXSoInxPItGovsEE2iXEFQzG
         zjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246392; x=1728851192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBuPk8VD/ExsghxOi7SybSYIm/8sA+XnlePRO8akAWg=;
        b=YWBJ+EmkA60yvodgoMl3DImJFeR9ZmAs6KdkfHV23zZsEncpZE0FYq1sYQruAVPoED
         C8cisHZiXEUux3cqKDJMaBFy4iL3u1KLnZrc14pa9MIXk47S9SIUGuIBTClAgADXWyUJ
         YJEknfuDeoNTwbqlryArm6Cf87yfpx0EKEZEzBr7iZ8z5lD1KAYDrU+G0c3wq1m8uK02
         WWIFjbewCFasNvz8CLM9a/7ObgacdlLqRH3Ytx/94N72N7SwgGFqIg4fOj4eiJjjyZ9j
         iChhJYyhmIWLBJbGmBti+14ANP7Vwm3Ye4VyXPVPRoIQP36yVWb3O2VMermgP0Nn6ntu
         /l5w==
X-Forwarded-Encrypted: i=1; AJvYcCUsj/o4XRnH6vvkdlJiNk/ubuAZ+5XBJv1z2p9ve41LXSNATgWz83rC12Q/VkQiMkMcDttocfrdEmRK32NF@vger.kernel.org
X-Gm-Message-State: AOJu0YwJIOUNVV3eIfLA497llwcbnXlxcFhAjs1lmu6Qx0qH6as8E2wx
	YpNoq0pllZy6ENdXOTOSKfvqZB6AJHcG3F7Ra5JlSwt3flpZ97tKS5a9/3q4VKs=
X-Google-Smtp-Source: AGHT+IFWMqbwIyqjBvX1et2WcBrUvnbXH6lIH+e+p5RToYoqEH6r+OtkMZyvqhjPIOtHuKw7nRa7mw==
X-Received: by 2002:a05:6512:3d10:b0:533:4522:7409 with SMTP id 2adb3069b0e04-539ab8c2165mr4593871e87.53.1728246392322;
        Sun, 06 Oct 2024 13:26:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec8b66sm602501e87.119.2024.10.06.13.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:26:31 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:26:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add thermistor
 for UFS/RAM
Message-ID: <fshhw6lknar4z36rc2sjjcgkiixpp7hak7gq3j373mjvbokax3@7s7kmzlmtjal>
References: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>

On Wed, Oct 02, 2024 at 03:01:08PM GMT, Luca Weiss wrote:
> Configure the ADC and thermal zone for the thermistor next to the
> UFS+RAM chip which is connected to GPIO_12 of PM7250B. It is used to
> measure the temperature of that area of the PCB.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 8ab30c01712e0b7c0cc1b403e0fe01650315b9e2..fdc62f1b1c5a398abaa71818fdf2858fdc445d28 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -207,6 +207,20 @@ active-config0 {
>  			};
>  		};
>  
> +		mem-thermal {
> +			polling-delay-passive = <0>;
> +
> +			thermal-sensors = <&pm7250b_adc_tm 2>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";

Is it really just "passive"? Especially with no cooling devices it
sounds more like "critical". LGTM otherwise.

> +				};
> +			};
> +		};
> +
>  		pm8008-thermal {
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&pm8008>;

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-39098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC99D864D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 14:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3002316AD21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC501822E5;
	Mon, 25 Nov 2024 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hF7K4eEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4251AAE17
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541008; cv=none; b=JzWhE0iVp7YQR/ueEK0cR5iDTdh9Lv6KzQXr7hTYhhf9a+svshIvZhFDSVGMEviFcX4N1ft4/LJNoXr6Yx3QsfE0ISKdomnl44Sv27dltOANsD45U1AymyA0V/DXsTF2PpvOZOOKy36qRFcrhpQ/WNbbKjyv19BRo9MVDZszrVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541008; c=relaxed/simple;
	bh=XdOSXy8lCeni0oZF+EIcTnWomwfB185LaVQ4QiKqYUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvsLwyr9vekguCIulSoACYQ1/0t2ZqPbagjQ/V+HBHcMlLcp3pvYOiODp7ZZUbLId7hGmJYlJo5OtntqJ/DgkZHAmgmI2N0f1fMMOuUFL/iqW2bgvkD6R6SDcjBHQKku+a1lL9LLoiFZYv4afH8CjgexgXTH6VocaBaO//wXHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hF7K4eEa; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53da6801c6dso3977517e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 05:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732541005; x=1733145805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cqgylUqRVA3P8aqcdkADreActuQPskKOQXcGbKk9s6w=;
        b=hF7K4eEaW6kuFTpDC8vOYnkZU80QdwIsfaP0oLbIN0t3nG160KbJyXMPSDqismDZun
         g9Ajz7oTjty71y7PQRh6J6SQz/kRRlUAD94qoDNHNnQa3bkaATHf31psiZryPz1RqPQD
         +wVSzlabHBCFHWSjsgnP3/Qeq65nR4e3duni9zRyxxR7SfEOiyVAaYO2YOLIdddhQsnf
         EWYRvreW8t08fcTcFRyqh+flJW7vQ+N8I8wTTcd2ZoJiILN0VynuH44AQqh8ObBv7OMj
         m9NyaCDpBUGwMivx3pJCu4K3pt06D4QnYLOFyIPPbvEjAIJiWHQhYw+5tU6lg7oI8tNr
         esaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541005; x=1733145805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqgylUqRVA3P8aqcdkADreActuQPskKOQXcGbKk9s6w=;
        b=FWGmcFWxL3X9dBFKuFQ2+ZrLkt9XP9R5pVofW4BgMTyXLqKKRM45PYGqNWGSI5TBQ2
         ZVL1KuY8shjqErwNhIVjoPz/sZLAz//g37ck3o7Z6rxeajkvAWDNZSUReTabIt6p9e3S
         WMM0ZGYqWOxoVVCXN5FW3H+mewt5ybcZqnnbTds+eYPcYSQwwo0Ij6dqcL2i3/suZCV1
         zuWNrxPStXopukl0pQ6HVuOyIhDiOkFekA2lrBM/e7+SISpmwaREwympklxU8X/bV0Ut
         zsMxLd2DzMK+ofFJqBcXy0J40RkOWWiWEHGq4kYzF/Fwd9c351oxD1YsJE253RHlYyyw
         aqiA==
X-Forwarded-Encrypted: i=1; AJvYcCXm4ev/5RkEbgViHPtxiWa0BSjgkRAw5oouQGnR/yJ2hCxdzJwxGqVDIj5fTW2xJPMkqWI9s0+PBnDlq0I+@vger.kernel.org
X-Gm-Message-State: AOJu0YwIJ3cwwRKXvnzA/Ego9pHWFmTlGALz8JJZdIbY/hAvezziNS5M
	5FRDYuaRucU2aSFxrh+HOCMdMyCTpnCoj5XjxUb3mom4KeloA/0lE508iV1lJJ3J+euzc6Dnxpj
	r
X-Gm-Gg: ASbGncs+FS322/R4SIPJANvbsePI+sZbUJiYTkD7u0LMNouEAyH0iqgSoeQVq5dxCwv
	3dHXFyT3HhOsOypLSM14wO8R/gy8Dwi+rmOtDrixsvvYTe8sDn5hmo/RtuR4Kr6X9wS6ENtAblV
	Ua4wwr5NL84v0n8E9cQc8SIw/D10Q2vVCB5UC8oRyfbSixHNr35I4vYVGTGBiBesMk848Z7CEoc
	8XRcmHxTAkA69arNZfAvWQHiYbJtWclHchr4b0pSlWnPPFQmmNnBMDs53IDWI+JqCV87Z7gZSbX
	8Olv/WC9dyPp1JK3Z2bdhaW4a6V2Gg==
X-Google-Smtp-Source: AGHT+IFTOooIa/aOyqy2c5urQieX0rO7QBZkuMOs7rhBV9SwbSTAMGIUTmurdG2bVZTp8/Y/9DvwRA==
X-Received: by 2002:ac2:424d:0:b0:53d:d3f1:13aa with SMTP id 2adb3069b0e04-53dd3f113d8mr4425960e87.20.1732541004885;
        Mon, 25 Nov 2024 05:23:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24519absm1670069e87.105.2024.11.25.05.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 05:23:24 -0800 (PST)
Date: Mon, 25 Nov 2024 15:23:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: sm8650: move board clocks to
 DTS files
Message-ID: <4kopdkvbkrpcpzwteezm427ml5putqvzsnfkpmg76spsple7l5@mg7v3ihwxnit>
References: <20241115-fix-board-clocks-v1-0-8cb00a4f57c2@linaro.org>
 <20241115-fix-board-clocks-v1-2-8cb00a4f57c2@linaro.org>
 <e9a3179e-858c-43e8-ada4-942517dc1971@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9a3179e-858c-43e8-ada4-942517dc1971@kernel.org>

On Sat, Nov 23, 2024 at 06:02:06PM +0100, Krzysztof Kozlowski wrote:
> On 15/11/2024 07:59, Dmitry Baryshkov wrote:
> > SM8650 is one of the platforms where board-level clocks (XO, sleep)
> > definitions are split between the SoC dtsi file and the board file.
> > This is not correct, as these two clocks are not a part of the SoC. Also
> > such definitions don't fully follow the DT guidelines. Move these two
> > clocks to the board files completely.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 22 ++++++++++++++--------
> >  arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 22 ++++++++++++++--------
> >  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 22 ++++++++++++++--------
> >  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 10 ----------
> >  4 files changed, 42 insertions(+), 34 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > index f00bdff4280af22f6f8b23e33238f53c602bc169..641bd817d75439bc6a050189565437e1c5ead3b5 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > @@ -30,6 +30,20 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	clocks {
> > +		xo_board: xo-board {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <76800000>;
> > +		};
> > +
> > +		sleep_clk: sleep-clk {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <32000>;
> > +		};
> > +	};
> > +
> >  	hdmi-out {
> >  		compatible = "hdmi-connector";
> >  		type = "a";
> > @@ -1112,10 +1126,6 @@ &sdhc_2 {
> >  	status = "okay";
> >  };
> >  
> > -&sleep_clk {
> > -	clock-frequency = <32000>;
> > -};
> 
> No, code has correct style. To avoid duplication, the SoC DTSI keeps the
> skeleton of the clock, which also indicates that SoC expects it to be
> provided by board. Then the board provides the clock by setting the
> frequency.

So, what is the decision maker: a deduplication or board vs soc
placement? From the duplication point of view we can keep the complete
clock in SoC.dtsi (like we did for older platforms or I did for
sar2130p). Most if not all boards use the same clock for the SoC family.
From the correctness point of view the clock should be completely in the
board DT, the clock is completely on the board and not on the SoC.
Having clock declaration in SoC.dtsi and patching the freq in board.dts
is a strange hack and mix of two solutions. For me as a reviewer and a
porter having such a split is a nightmare.

-- 
With best wishes
Dmitry


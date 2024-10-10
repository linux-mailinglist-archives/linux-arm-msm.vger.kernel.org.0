Return-Path: <linux-arm-msm+bounces-33904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7133E998CBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 18:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1656C1F24E28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB05B1CC15B;
	Thu, 10 Oct 2024 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAQDjIcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147F664C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728576305; cv=none; b=UjO8kNwhIvTc0RIa2CNl25fuhJ6IAUrE+FiW4wZxNkw73J/Irpt53CluskU+caQdRA+LK7k3BHa6pIuKZgyxtZqrL/hIhov0UB4datG1ttFRWaOZKdtMirKk6Ejn9CBzAr0p7vDNB17fK83gZWHztEa01YFdt5Dwa44UZXchLm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728576305; c=relaxed/simple;
	bh=H8EpiGxb7MZdfh1rqjoDtl0yYqhzVDv6ArYatW1EBZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zav9QoMKnpStrZC8C10NONGgdGN1Yq1t55Oj0icXLN0MEB/Ygyd5W2FRDVfzvpezGU4Cq8tMzkIvl4YESqgSuuLtXS4fAzUbZEpdm29xN6UNj2bPzG9z87qdzpIqWt5Uei3PHf/rAcIxhPTRDCLEU1/1M+UDN6nJxfFojgdPvyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAQDjIcZ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fad100dd9eso12029251fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728576302; x=1729181102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZO/1w/YU0WxgA0J9udv1RC8JJ0WK5YUdEtFL+ZE7B7Y=;
        b=OAQDjIcZ1A8yvKDpXpwV2GvkIM9nM7muE/Qua7+OaLAMgeD569eJAhGFuHiyUqHw02
         AXdFEJhvQDrwLpQT3cT8Q/TpbInr2x1ixblpPa5pW/jVtH2bLegp6Dj1XPgZ1MBlNADv
         XH+7gGCRo+/OHYmbpigTFB/pJIO2Mb0gz8wgRxcpSGe4J35puXtCkvSSxLr3b7QBzeOC
         NGOUe9d2DguXNlwc7cpDZLvXEDtpQ2eFTPbwJMyOeQ3YjwEhAxthdJTUr3uzdQAeQb3p
         93xnd8j3Z/LXCOYQenBa4hGWo+8QcKjg3tGR/YTr5k4UmUxjyRpUlrEY1o6C3408/97c
         3W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728576302; x=1729181102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZO/1w/YU0WxgA0J9udv1RC8JJ0WK5YUdEtFL+ZE7B7Y=;
        b=rQFqxxxbpEiRXTMrI3Z+dm3UH4lIzoNNPHwx9cirVHXxQO1Mcn3XFvjU1+fRRXkxKn
         AlvVS5Ez9X4jnhOkgep+GoL2VX81zJnQmqLgMx1c5LgZt4M/G4fYm71aZ9IXU+1Mbakl
         wOKP+Jx3c+7POSN1mcfB0YHxFoJ204zqnNGFHSRoJnHnneGY7CJhENx0DzNZFUVsgtYW
         JG2LTtl3Y6Gdxlt3ot8qk1QNiC3f+bumipUReo7meWC+2QmFznTp0O+WKznLzzQOQpi6
         B2WI+PNhH1+HNlz7d2bTf2ZZK8gS/hIHEhfnaglpfjvWMXF6egWC+7/05Ugg7mcDqmMl
         1ufA==
X-Forwarded-Encrypted: i=1; AJvYcCVm2S7yGxMz/QKwwQy0z7LBX1+RDbpG10GCQvdODdrn1/edpPK3pvlesEUbEhEAkoz//HT4LGrEPf+Ls+pb@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOFWPlfdhammyuPYOz8uVm5QaceRZRjr7BLyXv2pgy/tiLtG4
	Z3HwVhFWxGLVGO8Fcu4L4n9n4qXS7EnXEvrRVtHd+FxEnupm2/ZaQbTWHbKuGR0=
X-Google-Smtp-Source: AGHT+IHiF+d8UCbWAR4TFTEqWftSjyGbqLiIXHFzDdSvOTJM1rDmOqUUmm8GW6gTZjuOMRJVmU+6WA==
X-Received: by 2002:a05:651c:b0f:b0:2fa:d58d:dcf3 with SMTP id 38308e7fff4ca-2fb187cd62fmr47166951fa.33.1728576302168;
        Thu, 10 Oct 2024 09:05:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb245ab69dsm2488111fa.57.2024.10.10.09.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 09:04:59 -0700 (PDT)
Date: Thu, 10 Oct 2024 19:04:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Enable USB controllers for QCS8300
Message-ID: <iycqvw5ztqufcu3hgtpvrrir2anurjeckgmj6ll6twwsmotxhf@v72pwnmvq6yx>
References: <20241009195636.2649952-1-quic_kriskura@quicinc.com>
 <20241009195636.2649952-3-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009195636.2649952-3-quic_kriskura@quicinc.com>

On Thu, Oct 10, 2024 at 01:26:36AM GMT, Krishna Kurapati wrote:
> Enable primary USB controller on QCS8300 Ride platform and
> set the dr mode to peripheral mode.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 7eed19a694c3..3e925228379c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -265,3 +265,26 @@ &ufs_mem_phy {
>  	vdda-pll-supply = <&vreg_l5a>;
>  	status = "okay";
>  };
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l7a>;
> +	vdda18-supply = <&vreg_l7c>;
> +	vdda33-supply = <&vreg_l9a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l7a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";

Is it actually USB peripheral only? Or USB-C which isn't handled yet?

> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


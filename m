Return-Path: <linux-arm-msm+bounces-33680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EB5996710
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 12:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2340B24AD8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2051E18FDAB;
	Wed,  9 Oct 2024 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5gzntXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB1218FC8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469361; cv=none; b=hXAb/ODC5XPNroRG+JyWG3ODJ7p8Gpa3pNXvDOrtQG4lDkGtTg7F1/dTQ3Xv1u8Nafp9NUdbhyzCx4Z0oVB5CHSB65eEecHgiQ8zptYUUZTIfPonMUudz1fCRGsuLW46kHcO7IZW97r7C1MziN8FEZeXaCDLSYfJDNl5cTqXX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469361; c=relaxed/simple;
	bh=1muRWa+wXawPE1eQ9HosXZjWY4RSa8MbWKpe3P4P9uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6TRZ4EttyVWTC58XE6H897odqW4Jx9Ta5NP8krIwKSOS5XHEZov4Ftm+FhfcAwkhTh7zj3Vt76Zyp1IpGRH9lG9vZboYwrw+jmmvz8z3SLV4Tw3ZFShrTMi9nLtzVVaJgNmn4QCkrLG9wK+30MKB6yjNIpauxgv/9NPWp9WCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5gzntXx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a993f6916daso559038566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728469357; x=1729074157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5VgD+wTXaNucrBWnqcE02bPzDtE/QymMPp7ZrJAaRA=;
        b=s5gzntXx4N7oERKAZOKw8cZVIoRR0oYv5ClDy9hnyIHznRa0Y+V/JjL0F8ujk7wcKk
         E/QAnNRso08a67lItzn8TZO3TrPiIxSRu9UTEVksSEKIj1wuDn6732r7eR1ps7WgfUme
         MgyOuj/1ctCaFzJHN+//X5bMX4oGjSKwpMdN+yBUel/xGhEE6V7tIkcNPqwxPnIHP7gw
         EZQ7MnZvjGW7MVLFItEbcuPvNUfN7Ym5K4sjnpcVDfQaRJSGQ2IoV/xo6s1ibNhCASdN
         RxNRVPft5wyRiEerj//GDNw9r7EeazOliUZ512mOcMfjkAv3RjLlOJ23zEmioUhXle8L
         BUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728469357; x=1729074157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5VgD+wTXaNucrBWnqcE02bPzDtE/QymMPp7ZrJAaRA=;
        b=LEZzT4opFYfwQO45i1wZfMuzRwv4TiucV29+WkLKwC8nH3R8KaPET68jfNHQGRucDr
         LE0kRnbPhz4cn1Vkb5GLLzJI6TN0Mepa+mM13HHh10J4iDIosftPpqr+2vZITOzu8POv
         T64D/1j8G3cvartSTEsuZiaPGTZnF9h4B2Zfn6j1QfwzyFgYPr9sS9rgRDUJQphU+LhO
         BOKDzwM6ORGNCZPhSADa6oa4K8o09+2pk4QFeVWDCdnmnPCimwIJ0eoLWxYZR+hU63n+
         YDPkrk1VB0BSPyOgm1D9w5Ey7i19s3bL/U/dDGHyVSy5LOF3+F1v4G0G7iM8XaGyBege
         hOWg==
X-Forwarded-Encrypted: i=1; AJvYcCUNVxHQUyIOXF8pygvqSmaeP6AKlM2ccHCYlkRfUqU3+7i70SMKj+nyzQzZLoO8YPq0udZXHI4NJJe5ISrK@vger.kernel.org
X-Gm-Message-State: AOJu0YwkkaWbq1H10qJGb2x0YyPf3hmtNurcJFqbaTz8ZgbT6Xb/hy7i
	JWaNN0i4sbtPX8nMQ8aMzNMiIExYA91QxLKdWwq5TvVmMHBKJIKberI+imz3ybE=
X-Google-Smtp-Source: AGHT+IFgNDo1cyZoG4YBSn4FWa6hWBarcKKT8WDru+XyTCt2NUHvDMU1kIaP/0lbJiHrbIG5gGBXag==
X-Received: by 2002:a17:907:9728:b0:a80:f81c:fd75 with SMTP id a640c23a62f3a-a998cf4d7a3mr166864766b.0.1728469356565;
        Wed, 09 Oct 2024 03:22:36 -0700 (PDT)
Received: from linaro.org ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994ce357b2sm472465666b.144.2024.10.09.03.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 03:22:36 -0700 (PDT)
Date: Wed, 9 Oct 2024 13:22:34 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: x1e80100: Describe the SDHC
 controllers
Message-ID: <ZwZZalFKXiQh0BAK@linaro.org>
References: <20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org>
 <20241008-x1e80100-qcp-sdhc-v1-2-dfef4c92ae31@linaro.org>
 <syf3uyoyh55rxieyjnhsskmythce6vnkuq77asgml736gcysd7@op5b2pd6ijsj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <syf3uyoyh55rxieyjnhsskmythce6vnkuq77asgml736gcysd7@op5b2pd6ijsj>

On 24-10-09 08:49:03, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 05:05:56PM +0300, Abel Vesa wrote:
> > Describe the two SHDC v5 controllers found on x1e80100 platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 108 +++++++++++++++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index a36076e3c56b5b8815eb41ec55e2e1e5bd878201..b835fd87b977ae81f687c4ea15f6f2f89e02e9b1 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3880,6 +3880,114 @@ lpass_lpicx_noc: interconnect@7430000 {
> >  			#interconnect-cells = <2>;
> >  		};
> >  
> > +		sdhc_2: mmc@8804000 {
> > +			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0 0x08804000 0 0x1000>;
> > +
> > +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hc_irq", "pwr_irq";
> > +
> > +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> > +				 <&gcc GCC_SDCC2_APPS_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>;
> > +			clock-names = "iface", "core", "xo";
> > +			iommus = <&apps_smmu 0x520 0>;
> > +			qcom,dll-config = <0x0007642c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > +			operating-points-v2 = <&sdhc2_opp_table>;
> > +
> > +			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
> > +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
> > +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> > +			bus-width = <4>;
> > +			dma-coherent;
> > +
> > +			/* Forbid SDR104/SDR50 - broken hw! */
> 
> Is it still valid or was it just copied from old code?

So when I did the bring-up of this controller, for some reason I thought
this was needed. But I guess that's not the case since I get this
without it:

[    5.168918] mmc0: new ultra high speed SDR104 SDHC card at address

So will drop in the next version.

Keep in mind that I have no way to test the sdhc_4, so I'll drop it from
there as well.

> 
> > +			sdhci-caps-mask = <0x3 0>;
> 
> Best regards,
> Krzysztof
> 

Thanks for reviewing.

Abel


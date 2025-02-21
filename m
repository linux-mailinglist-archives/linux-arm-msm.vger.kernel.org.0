Return-Path: <linux-arm-msm+bounces-48883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124FA3F4B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 13:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04711702122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1202080FE;
	Fri, 21 Feb 2025 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EttI1ex3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6FE1E489
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740142061; cv=none; b=rfvhCUi0LE76otB5dtH4nE7Ge+4ctZzVUCI9pgrtdhGb052PlVGOvaM9cubGg2EpyHppiJFBk8j+sLAaa+IxMDR8gE9h1Sh1ihuXlmQv36GUd3SZMZNKZFOG+u5k49VnBABNvkfgU+dg63XEt8D40Pi7x1//urI/1p3uD5e6aCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740142061; c=relaxed/simple;
	bh=YaGDtt7cEBjQEPuK2P+NBfMCulX2bFrlHYN1kHN/snM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dc+QcWRowju5TSWfmYg97PNJo17v6sNzvtJj1khyQOWrLXqcnt6/phq1OSp79+TMuSOX/yjKjqhMWMDuvZoP3GPq4ABojZ+e9VMeKk3mgsN/FhX/va/TnajBx988L1+j2LFQXz1KwLYMsUI5jlwc+WyE16X1qUn3AIsjoceY/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EttI1ex3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb8045c3f3so256648066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 04:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740142057; x=1740746857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8sq8P1/rLnQs2ac3SqMeH/6Kwi56/5UD1RraEg8IJY=;
        b=EttI1ex3QwFZcq64tpbZuN4nEh5eduKWKwiUbaYkBjNi/5shgSnPiNMf7R05v1od7+
         maX+k8m/JiKzqBHQpzJq9XJ5peLt393vmm0OfYma2ESdNnkWM4HQiDsf8QHa3o43LKXU
         gclxdtxgb50MFq5zWLN/W24nsNXxpkoc91oALTofbbrOq2Roq4rEaNg0WPpv7kaSlWgv
         vifs7QGxrO+gQ228H7MHcckgKRYg9jrnhzl9mQZgWuUTlS43po1FxOoziqlLYRI1TtV2
         i/ev5sBqYQi1fXVBW19EaR2AJxibVCXidn9vbfC6X8wpjNr89Y53BizrIj7kjEKHM0zL
         4RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740142057; x=1740746857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8sq8P1/rLnQs2ac3SqMeH/6Kwi56/5UD1RraEg8IJY=;
        b=cK9C7h2bWn4EgGZ9JFi9TvKrbZMTFWSCjEOHZF8+eCr3ec829/kllYhkOUsxPfbyYQ
         52V/wh2Hs5otaaWMA4VawX/hfUlw4/7aFpRQC4rswNrf2pCIRvLXXghsZseukl4ygi/I
         jZMcjss0sWKwaZo6RTWnwcaxD1LNIjVr1LmIdWeSD5xQcGHcOi16MwzCl2FF00ukdCBb
         OVWcAiCiLsaP23P1j9CSsDKCP6dYsxIWd7kQ/7NWzz/qzEl/YjEjyN1JKUPwnRRivXd8
         eYHUqXRLN76eGnTdZrLTPwlnEs7ghgTFXyms6yK8aSbbM9etBYCnugEfQwR6Iwa+TsS4
         nZHg==
X-Forwarded-Encrypted: i=1; AJvYcCUQGArqGx6Jl5y789wvdeyQbTnjvGmL8uiEDIIvF+5fYo0ipWZrAkjHh0GzC8VB5w7qRDDMLUFxNR9k0NUW@vger.kernel.org
X-Gm-Message-State: AOJu0YxhrqNJCYzhJVKfMeuD/glzpzfkD+/v9eenVd/EgRm+CCOrH11d
	iCcGvbDz4tC8wfXUOXwOswQkhYRqD8UfL0B372pwjg4T+isU/82V0WE/5vnzbsM=
X-Gm-Gg: ASbGncssRGF1SbnZBrIgYcK2LMxk1omSWn5Z0EJs03K/pZ0gAIofUitLfn6sExwr+GK
	VtM8LlY+sQSHOQhCIoovsCnTR8Wq2bSwT9gx7wvzeQX/6C91a4ow1bCO5ng8dNgLxLaMG7xAMtn
	CdBR4XipdfRaLJR7+496ezq4CzKnTTbenrFuzsQAM/18preABXdppk+CoULkaacw/y9EpMkWVP7
	ViaLh/FEC/wSmD+dZeWmjK2foKH9ghICUSrn1Ldyt52/MWTBq8Ccu5xZGVp7GPKs0GVKL5a6PZ9
	4hNZTNl7aFuy2I5oUBUeTHI=
X-Google-Smtp-Source: AGHT+IH3aBzzFWyzyN1k83NMWlVN/InEeUhlRu8jOe9fZXx46+LcdtbGo1F3wi+BlPMYt7I1iE4rwg==
X-Received: by 2002:a17:906:31d7:b0:abb:cbba:c346 with SMTP id a640c23a62f3a-abc099b8029mr280917466b.2.1740142056993;
        Fri, 21 Feb 2025 04:47:36 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb916db37bsm1046317766b.165.2025.02.21.04.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 04:47:36 -0800 (PST)
Date: Fri, 21 Feb 2025 14:47:35 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add crypto engine
Message-ID: <Z7h152O5EV74WSEZ@linaro.org>
References: <20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org>
 <Z63xEdcvCRHchHWu@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z63xEdcvCRHchHWu@linaro.org>

On 25-02-13 14:18:09, Stephan Gerhold wrote:
> On Thu, Feb 13, 2025 at 02:44:02PM +0200, Abel Vesa wrote:
> > On X Elite, there is a crypto engine IP block similar to ones found on
> > SM8x50 platforms.
> > 
> > Describe the crypto engine and its BAM.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 9d38436763432892ceef95daf0335d4cf446357c..5a2c5dd1dc2950b918af23c0939a112cbe47398b 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3708,6 +3708,36 @@ pcie4_phy: phy@1c0e000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		cryptobam: dma-controller@1dc4000 {
> > +			compatible = "qcom,bam-v1.7.0";
> 
> Hm, I would expect this is at least "qcom,bam-v1.7.4", "qcom,bam-v1.7.0"
> given that this is a pretty recent SoC. I don't think this makes any
> functional difference though, and we don't seem to have it on other
> recent SoCs...

Yep, will add both compatibles as suggested.

> 
> > +			reg = <0 0x01dc4000 0 0x28000>;
> > +
> > +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			#dma-cells = <1>;
> > +
> > +			iommus = <&apps_smmu 0x480 0>,
> > +				 <&apps_smmu 0x481 0>;
> 
> Should be same as <&apps_smmu 0x480 0x1> (0x1 is applied as mask to the
> SID, and 0x481 & ~0x1 = 0x480).

Nope, the mask is on bit 16 through 31. That will result in different
sid.

> 
> > +
> > +			qcom,ee = <0>;
> > +			qcom,controlled-remotely;
> 
> Please add "num-channels" and "qcom,num-ees". Otherwise you risk causing
> crashes if the interconnect listed below isn't up (anymore) when the
> driver probes the device. See:
> https://lore.kernel.org/linux-arm-msm/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org/T/

Sure. Will do. This platform has 7 EEs and 30 channels according to
documentation.

> 
> > +		};
> > +
> > +		crypto: crypto@1dfa000 {
> > +			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
> > +			reg = <0 0x01dfa000 0 0x6000>;
> > +
> > +			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > +			interconnect-names = "memory";
> > +
> > +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> > +			dma-names = "rx", "tx";
> > +
> > +			iommus = <&apps_smmu 0x480 0>,
> > +				 <&apps_smmu 0x481 0>;
> 
> <&apps_smmu 0x480 0x1>;

See above.

> 
> Thanks,
> Stephan


Thanks for reviewing.

Abel


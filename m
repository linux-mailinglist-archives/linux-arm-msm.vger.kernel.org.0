Return-Path: <linux-arm-msm+bounces-33351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C999292F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119B61F239B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934141BB69B;
	Mon,  7 Oct 2024 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xq9VYYRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A931B9854
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728296784; cv=none; b=UId73Dr8OjqBWgDm6TdV02efWi/nDrU3s72L3Miz+zZTYrWsmkdjM7CDYBlLMVq0DJGpnkE5WCmddKIDfUzXaqo0t4uofEHKWB6MWrfAv4iWaW9S4qd2T9h4b4EL9fiPVCCcvFnue8q6PYI/dv4QwbmH8QoBmKukOSEn4vH7nXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728296784; c=relaxed/simple;
	bh=cIoy6krtG6eQdbiidG1W3uRY5T8yKPvH570fmXIvyXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qalhlK9a7g2GLcfHZ+uTkRLjaKS19vkKq/HgoXalDZcvjwVLOfrT/ofRN3fSQ+fOBKs+PuO3QVhcqlGMKTFs9cNZATvWS2d3b6P9QvMSlZLp9AOMyjyvNjRFQ0i9V93MEYSJUFIJHz4dTANIDama9Lsn5XtaZ3MODgolUagtLWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xq9VYYRc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so32741435e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 03:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728296781; x=1728901581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNvTm5tPSqlCYa9xyieR4IWsBkBcHoHc6vpXQGkrpxo=;
        b=Xq9VYYRcfr+Uf+l4s0edSU+rqaM6zs7zzMG/fjpY7GCYuDQz9Nf9SPT0AAnwRgBjHx
         EYYuXxmdbMCf2+Ah3HUhdmY9udRM2LldQjqb1tJ9/vmJ6zaC9JDs36Cn7WHyvKKgu8LH
         2SI0m+0UR3YXnr/UEdDt5Rs9WqYX11bPyvr4etILPuXnC8Isc6/j4eMy5hfV3Y6P8JAZ
         KpF1liQ/b97xln9aqt7UdK9Kc9n6Yafav1FwJ4W6Tqj7gmA3ASRHgEJ0xCWiyQ4BF9nM
         zKPXFDv9+92Ga2ERxOOmlz5XB/xLHAII39ze7SrxzIMxVHnDAL/9edz08az/GFb6d38i
         GnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728296781; x=1728901581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNvTm5tPSqlCYa9xyieR4IWsBkBcHoHc6vpXQGkrpxo=;
        b=dIjtyseB0dFeQiPzDq5Fw4SMxw2NXv3cmhyr3MoqvDS3o3P4JD04V++jpFc5LAAjyp
         Q3k42fgHCaY8rcaj0gvoRNMcDPB8NmfJaGWDkOmdfvG40Ep4Wp3AyIZ9S3mGCn3hR36u
         9OzTxd23t7Fw/0BSZPl4IobvF6j82GlmVtcL0wB9bcdpbF2taR3lPDLgDf8Cfw6lcc7I
         7u+P3eHvSg40vGL2tyjj0kxqNAwZsMMK3rtWSWojHJ7ZGu02PIA1UoVWaolrl8s1iW2V
         1Hbufo8J6KmG9tGSQuSZ7wp4u3cTR7nuKIbF5W1PzZBrboqxkgsGoPlCwcJdh/rubwta
         9hVg==
X-Forwarded-Encrypted: i=1; AJvYcCXGFSsxoDF7NsPvNjC4cWQK2gi799jdypwXT4lieiMfyKGLXCZEcCtZYwuoJO+FgIOJnih69IBaIhUa7Voy@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIkxjaZYzFNgIeIwPu0ssWMFbTlnAx46UDyXCDfWWAS7MP/1n
	/MANA0qHFQo8D0qAuphSeopZnVv/4a2BOvG8KYywIsTmAnkpxV9vJ3m0js/BBCI=
X-Google-Smtp-Source: AGHT+IEXRuKNTFlAn92/KAMWoSCFEkwOFUgh0p+7DZqEaknjTkT0rC3MfTFuz6wK8bwYE1y03qvjDw==
X-Received: by 2002:a05:600c:1616:b0:42f:8ac8:5e5c with SMTP id 5b1f17b1804b1-42f8ac860dcmr42031875e9.12.1728296780946;
        Mon, 07 Oct 2024 03:26:20 -0700 (PDT)
Received: from linaro.org ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a0aa6csm87466775e9.10.2024.10.07.03.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 03:26:20 -0700 (PDT)
Date: Mon, 7 Oct 2024 13:26:19 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Switch PCIe 6a to 4 lanes
 mode
Message-ID: <ZwO3SyNE4oH0lNPm@linaro.org>
References: <20241004-x1e80100-dts-fixes-pcie6a-v2-1-3af9ff7a5a71@linaro.org>
 <lxojjl6pm6yyblbaa3rczomczo7uqn76coai6a7gg6aehflq2j@4w5b7oegrc6p>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lxojjl6pm6yyblbaa3rczomczo7uqn76coai6a7gg6aehflq2j@4w5b7oegrc6p>

On 24-10-06 22:57:05, Dmitry Baryshkov wrote:
> On Fri, Oct 04, 2024 at 12:06:33PM GMT, Abel Vesa wrote:
> > The PCIe 6a controller and PHY can be configured in 4-lanes mode or
> > 2-lanes mode. For 4-lanes mode, it fetches the lanes provided by PCIe 6b.
> > For 2-lanes mode, PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2
> > lanes. Configure it in 4-lane mode and then each board can configure it
> > depending on the design. Both the QCP and CRD boards, currently upstream,
> > use PCIe 6a for NVMe in 4-lane mode. Mark the controller as 4-lane as
> > well. This is the last change needed in order to support NVMe with Gen4
> > 4-lanes on all existing X Elite boards.
> 
> What about other X1E80100 devices supported upstream? Do they also use
> this controller in 4 lane mode?

Yes, by my knowledge, all upstream boards with X1E80100 use this
controller for NVMe in 4 lanes mode.

There is a question about the Galaxy Book4 Edge, as I think that uses
UFS instead, and my guess is it doesn't use the PCIe 6a for anything.
But that is not yet merged.

> 
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> > - Re-worded the commit message according to Johan's suggestions
> > - Dropped the clocks changes.
> > - Dropped the fixes tag as this relies on the Gen4 4-lanes stability
> >   patchset which has been only merged in 6.12, so backporting this patch
> >   would break NVMe support for all platforms.
> > - Link to v1: https://lore.kernel.org/r/20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index a36076e3c56b5b8815eb41ec55e2e1e5bd878201..4ec712cb7a26d8fe434631cf15949524fd22c7d9 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -2931,7 +2931,7 @@ pcie6a: pci@1bf8000 {
> >  			dma-coherent;
> >  
> >  			linux,pci-domain = <6>;
> > -			num-lanes = <2>;
> > +			num-lanes = <4>;
> >  
> >  			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
> > @@ -2997,8 +2997,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >  		};
> >  
> >  		pcie6a_phy: phy@1bfc000 {
> > -			compatible = "qcom,x1e80100-qmp-gen4x2-pcie-phy";
> > -			reg = <0 0x01bfc000 0 0x2000>;
> > +			compatible = "qcom,x1e80100-qmp-gen4x4-pcie-phy";
> 
> Oh...

Yes, we default to 4 lanes here.

> 
> > +			reg = <0 0x01bfc000 0 0x2000>,
> > +			      <0 0x01bfe000 0 0x2000>;
> >  
> >  			clocks = <&gcc GCC_PCIE_6A_PHY_AUX_CLK>,
> >  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
> > @@ -3021,6 +3022,8 @@ pcie6a_phy: phy@1bfc000 {
> >  
> >  			power-domains = <&gcc GCC_PCIE_6_PHY_GDSC>;
> >  
> > +			qcom,4ln-config-sel = <&tcsr 0x1a000 0>;
> > +
> >  			#clock-cells = <0>;
> >  			clock-output-names = "pcie6a_pipe_clk";
> >  
> > 
> > ---
> > base-commit: c02d24a5af66a9806922391493205a344749f2c4
> > change-id: 20241003-x1e80100-dts-fixes-pcie6a-b9f1171e8d5b
> > 
> > Best regards,
> > -- 
> > Abel Vesa <abel.vesa@linaro.org>
> > 
> 
> -- 
> With best wishes
> Dmitry


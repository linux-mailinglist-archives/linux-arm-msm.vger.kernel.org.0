Return-Path: <linux-arm-msm+bounces-8409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9B83D78F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 11:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2933029AD75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52AF24204;
	Fri, 26 Jan 2024 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+gtxQ0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587A241F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706261918; cv=none; b=lIfrXpm1PmzTnAFPnXJAUntnjEckDY00V0WuxEvuZHDpTjO/0LZZg/rvx4F7FscVDy/U/psDRCqdh21y0Ac5OdiU1l/9rZlWHhkq916A9HHrdueb6ipmwPxpFC2hl8LdS7YZFLTUrq2IQrT+NT5k1kD8BseWQkcMzPW4mcIWyF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706261918; c=relaxed/simple;
	bh=3vfpV1Ilbnjr4WtTJysV6pyuIb/B9dwNZp/iIqvuAdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpjYhFEq95O7iXhViB2TnRzBoPGyfIJsZd6iXg181vTaPqRp24vr0Qa7grf0cuZ7V10BSsK8ymR67nFfOr5T3llkoNW2mP15owWvX1hG4KbkhlzBOy3gZiE75U6r5gc7w1iMmkmtEKrc4GYoOu07A4L0qx62oV8DPys3YkaXbMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L+gtxQ0t; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-339231c062bso217147f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 01:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706261915; x=1706866715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYRnOn7CihmGzjyxvq8SD+5GxdZZRHfMU/gDjslPAbs=;
        b=L+gtxQ0tcjviU2dkQJQ/gqWr92FRZX9cBVC3kD2O/I+b+drCisOEJJUxmDg3oUkS6A
         kiQY/kwZqsD/zFLdB+Bgzzg+U2667eg6F4zuFw11MBJZ9+eBa+rY5GdWE+Xw6w4onTjE
         mIdndhLxTDw1TsaEurkA/Ujaq1/Vf9uoQP6DD/oQIVbljWnDzBg9P3NHAK4hngyZSQv/
         9QXdJ6aRE6gwYzgUwbSAhHmThhlfFYEPiLud8yv77LQsPVGt3fMpvasnqkxYC3TEpSF+
         XSIO3mxu7wN7M3G2d4M6dOE0vXQtYqU8+qrFGvU4ml9AAdOju6v75WFrIpV+NeM4qwbI
         KShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706261915; x=1706866715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYRnOn7CihmGzjyxvq8SD+5GxdZZRHfMU/gDjslPAbs=;
        b=mvi5wOtdfRqbcL0VwxwuV3ApA78wmz+jSy7Mist4BeegfztFXZzsrbLaGmpM5xTelP
         M8q2WQPTxIxKDf6D72FhkKVDDqIoFNKO197pCMk211wXNfcggIb7IykXkypGM0Co+Z8g
         4TWZ0/MEtmquL9Iv6+s050cN4ZwZpv07Y3WsA/HfRAhDScDp97+7DwC/P91v6aeQA0gf
         Taeu39UT4shKofKH50exUC162mNBY3s8KLi+qMcxeL2dgWR/BfaK0a6jjJgu2lwkj8ga
         UbwZKX798yHIGwtlnMDoMbPJSEh7DnTD9x60ZQ7OU+GVncAerR80lQpheLT+OaVG1uG2
         C9RQ==
X-Gm-Message-State: AOJu0YxmQeUVUjsjq+wXVSyTGwdyoGUbZHqcXdKSL+ujq1CZgDy2c05c
	gCj7SHTfPcGY+ghaYD59CTi0d3NnUsLUYyqDlmtldiSH3rTYV87a0zhcSunwGR8=
X-Google-Smtp-Source: AGHT+IGG3M5B7BHCEytwY3wjC0SQUnh5hp5coTVJgXcDVwonETfO/Ng75w6TEa2i1Nxsf7fXK9vcgA==
X-Received: by 2002:a05:600c:214d:b0:40e:94f9:229e with SMTP id v13-20020a05600c214d00b0040e94f9229emr698007wml.68.1706261915027;
        Fri, 26 Jan 2024 01:38:35 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ci11-20020a170906c34b00b00a2f181266f6sm430269ejb.148.2024.01.26.01.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 01:38:34 -0800 (PST)
Date: Fri, 26 Jan 2024 11:38:33 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/11] arm64: dts: qcom: x1e80100: Add USB nodes
Message-ID: <ZbN9me5d6TXOHlt6@linaro.org>
References: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
 <20240123-x1e80100-dts-missing-nodes-v4-6-072dc2f5c153@linaro.org>
 <9af6d68f-ccc0-4d2b-ab59-77864a628bb4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9af6d68f-ccc0-4d2b-ab59-77864a628bb4@linaro.org>

On 24-01-23 19:17:10, Konrad Dybcio wrote:
> 
> 
> On 1/23/24 12:01, Abel Vesa wrote:
> > Add nodes for all USB controllers and their PHYs for X1E80100 platform.
> > 
> > Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 435 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 432 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 2b6c55a486b2..593ead89706c 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -5,11 +5,13 @@
> >   #include <dt-bindings/clock/qcom,rpmh.h>
> >   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> > +#include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
> >   #include <dt-bindings/dma/qcom-gpi.h>
> >   #include <dt-bindings/interconnect/qcom,icc.h>
> >   #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/mailbox/qcom-ipcc.h>
> > +#include <dt-bindings/phy/phy-qcom-qmp.h>
> >   #include <dt-bindings/power/qcom,rpmhpd.h>
> >   #include <dt-bindings/power/qcom-rpmpd.h>
> >   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > @@ -734,9 +736,9 @@ gcc: clock-controller@100000 {
> >   				 <0>,
> >   				 <0>,
> >   				 <0>,
> > -				 <0>,
> > -				 <0>,
> > -				 <0>;
> > +				 <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> > +				 <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> > +				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> >   			power-domains = <&rpmhpd RPMHPD_CX>;
> >   			#clock-cells = <1>;
> > @@ -2492,6 +2494,126 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> >   			};
> >   		};
> > +		usb_1_ss0_hsphy: phy@fd3000 {
> > +			compatible = "qcom,x1e80100-snps-eusb2-phy",
> > +				     "qcom,sm8550-snps-eusb2-phy";
> > +			reg = <0 0x00fd3000 0 0x154>;
> > +			#phy-cells = <0>;
> > +
> > +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> > +			clock-names = "ref";
> 
> You use this exact same clock for all HS PHYs. Are you sure?

The USB2 HS PHY should use TCSR_USB2_2_CLKREF_EN, while all of the USB1
SS[1-3] HS PHYs seems they share the TCSR_USB2_1_CLKREF_EN.

> 
> > +
> > +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_1_ss0_qmpphy: phy@fd5000 {
> > +			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
> > +			reg = <0 0x00fd5000 0 0x4000>;
> > +
> > +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>,
> > +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> > +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> > +			clock-names = "aux",
> > +				      "ref",
> > +				      "com_aux",
> > +				      "usb3_pipe";
> > +
> > +			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
> 
> This is likely RPMHPD_MX(A/C)

Nope, this platform has dedicated GDSCs for each of the USB1 SS[1-3] QMP
PHYs.

> 
> [...]
> 
> > +			usb_1_ss2_dwc3: usb@a000000 {
> > +				compatible = "snps,dwc3";
> > +				reg = <0 0x0a000000 0 0xcd00>;
> > +				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
> > +				iommus = <&apps_smmu 0x14a0 0x0>;
> > +				snps,dis_u2_susphy_quirk;
> > +				snps,dis_enblslpm_quirk;
> > +				snps,usb3_lpm_capable;
> > +				phys = <&usb_1_ss2_hsphy>,
> > +				       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
> > +				phy-names = "usb2-phy",
> > +				            "usb3-phy";
> 
> Should this be marked dma-coherent?

Will add.

> 
> Konrad


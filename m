Return-Path: <linux-arm-msm+bounces-24605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269991BB99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A07EDB23263
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162D01553A0;
	Fri, 28 Jun 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="akP5WYVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF015358F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719567446; cv=none; b=CP07itgFHPZ+TpYIzrSi8lFoOYcPmQoI/jnmvDcaenlqVknNSZ0WRtcCoajMRWrSiJhIQTdxINgjx4cEYaswUSdaKeiwjCIc9kzBCHk35FI+vroHgam4W1jaw+GUZLEKCVmulN8lu8EclwEqG7x8HhZud38o1KsqHxHyH24ulZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719567446; c=relaxed/simple;
	bh=WtRuAHHT69yqU4gURYurNYUVEyPdprvqJ3lgNWHjmeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5K5h3XCttzr6wU5GpC9ycH89flQxa0hGYIEICdOEnih/lunQ6YSFKJeo5zML1f4gx95JL/+4t2bkpoGRZrssVCZfKOgzysD/ZGaGh8uD3rjlLsm5+niUNjnu/ipcFLj5hwG7fVUlKIGVyKc2UlI2XwcZVgAk9AqyjVMJRVd+eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=akP5WYVI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f9b523a15cso2828925ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 02:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719567444; x=1720172244; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E4neoCm98447Of47CTz3xukfSh+rNUh5YPe17PUMr38=;
        b=akP5WYVIH6dR3sUuUux1YV4Yp8I9s74v8qRnqZJiimVr6xrqXclxBv7lIwYUml2GWQ
         b1D0kkcdWuyx9TDeoxfpIKr0ggS+iW3ItAILAD+243daa8sfPplIoEqzzlEunIqCxubM
         YhZT2dO1TkDAgI+HTeao8kaLGZCJhSYMAZMaI3APpXYrr57DyNEPZXXQ9BwBPwYQ8oKi
         kLoeYVV1AFbNzi7ArqZxNM+NtmobgL8TE2TD/NLdXlgzZ9qhw5nLGNKhwokI9CMaRQAY
         GqtxPW8fa11bIJTnzxCedGPPyvVCgZtc9m3bMwIi5N3tpsyRS28td89sSUXH0JtEW7xD
         RkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719567444; x=1720172244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4neoCm98447Of47CTz3xukfSh+rNUh5YPe17PUMr38=;
        b=qcZ8Kfuauu+y6dWLooQJossACq4xMCkpxVoTQIJ14Y1b9J/H3IU44+GhwuAdkTWFPV
         EgabsIy58jBPYrXEY91hBhi1L+AF5cmfSwqUNKdzJMg8AeKxbsNZx+4yuzGp1L0yK4/F
         +DS4wootml+o7KYTFAG8YFQfKZFGqhBkXYC0tMVcWUbeatQsXJ2geUdik5ENWZ4pWWvz
         CZz/aHT+GbyyUSPGRXXdotnIkNMNgT52y3g/wW6OoThWYz/FYPN1WleIKAaiAYkxL4yM
         jCXyg+ikrOs9bxWziduNVScpjjCJlFLkz5Ar7QUQGsJtcTZb4I/fPTw3UGh+hIC8u+B9
         2nKg==
X-Forwarded-Encrypted: i=1; AJvYcCXxDUjqAC7yQT/z0gXwaP31rw1gNPNDIPBr9W/ImfrKj9qkieQlX2sqcIAqxbczhVQuXCDP3aTn/uDkLSdtlrU76kMpxOYb1Qevf/MM0g==
X-Gm-Message-State: AOJu0Yxh6E8pJqzrI6nuNUoVbwEMoYvF2+tPsjYAUnjmUc43rG62I2Oz
	8x2NjYJdIl2kwf5GiXMp92R7mkhLD2DCo01ItYWbbe1d66n2t0zTIb8OIY6oOQ==
X-Google-Smtp-Source: AGHT+IE3+1r7knoAgAfXjjgZxmLqxm7zgs1EZKXQMbrgilvN/pdCxQN53ez7f2Ildp9w+InUibDLYA==
X-Received: by 2002:a17:902:fc8d:b0:1f6:3580:65c9 with SMTP id d9443c01a7336-1fac7f03416mr17246725ad.26.1719567443476;
        Fri, 28 Jun 2024 02:37:23 -0700 (PDT)
Received: from thinkpad ([120.60.52.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1568ea7sm11025415ad.186.2024.06.28.02.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:37:23 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:07:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: ipq9574: add PCIe2 and PCIe3
 nodes
Message-ID: <20240628093714.GD54528@thinkpad>
References: <20240501040800.1542805-1-mr.nuke.me@gmail.com>
 <20240501040800.1542805-9-mr.nuke.me@gmail.com>
 <20240624041832.GD10250@thinkpad>
 <79e57338-1671-4574-b1e2-3b3aa9045ec9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79e57338-1671-4574-b1e2-3b3aa9045ec9@gmail.com>

On Thu, Jun 27, 2024 at 11:39:10PM -0500, Alex G. wrote:
> 
> 
> On 6/23/24 23:18, Manivannan Sadhasivam wrote:
> > On Tue, Apr 30, 2024 at 11:07:50PM -0500, Alexandru Gagniuc wrote:
> > > On ipq9574, there are 4 PCIe controllers. Describe the pcie2 and pcie3
> > > nodes, and their PHYs in devicetree.
> > > 
> > > The pcie0 and pcie1 controllers use a gen3x1 PHY, which is not
> > > currently supported. Hence, only pcie2 and pcie3 are described. Only
> > > pcie2 was tested because my devboard only has conenctions to pcie2.
> > > 
> > > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 178 +++++++++++++++++++++++++-
> > >   1 file changed, 176 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > index 7f2e5cbf3bbb..c391886cf9ab 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > @@ -300,8 +300,8 @@ gcc: clock-controller@1800000 {
> > >   				 <0>,
> > >   				 <0>,
> > >   				 <0>,
> > > -				 <0>,
> > > -				 <0>,
> > > +				 <&pcie2_phy>,
> > > +				 <&pcie3_phy>,
> > >   				 <0>;
> > >   			#clock-cells = <1>;
> > >   			#reset-cells = <1>;
> > > @@ -745,6 +745,180 @@ frame@b128000 {
> > >   				status = "disabled";
> > >   			};
> > >   		};
> > > +
> > > +		pcie2_phy: phy@8c000 {
> > > +			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> > > +			reg = <0x0008c000 0x14f4>;
> > > +
> > > +			clocks = <&gcc GCC_PCIE2_AUX_CLK>,
> > > +				 <&gcc GCC_PCIE2_AHB_CLK>,
> > > +				 <&gcc GCC_PCIE2_PIPE_CLK>;
> > > +			clock-names = "aux",
> > > +				      "cfg_ahb",
> > > +				      "pipe";
> > > +
> > > +			clock-output-names = "pcie_phy2_pipe_clk";
> > > +			#clock-cells = <0>;
> > > +			#phy-cells = <0>;
> > > +
> > > +			resets = <&gcc GCC_PCIE2_PHY_BCR>,
> > > +				 <&gcc GCC_PCIE2PHY_PHY_BCR>;
> > > +			reset-names = "phy",
> > > +				      "common";
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		pcie3_phy: phy@f4000 {
> > > +			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> > > +			reg = <0x000f4000 0x14f4>;
> > > +
> > > +			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
> > > +				 <&gcc GCC_PCIE3_AHB_CLK>,
> > > +				 <&gcc GCC_PCIE3_PIPE_CLK>;
> > > +			clock-names = "aux",
> > > +				      "cfg_ahb",
> > > +				      "pipe";
> > > +
> > > +			clock-output-names = "pcie_phy3_pipe_clk";
> > > +			#clock-cells = <0>;
> > > +			#phy-cells = <0>;
> > > +
> > > +			resets = <&gcc GCC_PCIE3_PHY_BCR>,
> > > +				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
> > > +			reset-names = "phy",
> > > +				      "common";
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		/* TODO: Populate pcie0/pcie1 when gen3x1 phy support is added. */
> > > +
> > > +		pcie2: pcie@20000000 {
> > > +			compatible = "qcom,pcie-ipq9574";
> > > +			reg = <0x20000000 0xf1d>,
> > > +			      <0x20000f20 0xa8>,
> > > +			      <0x20001000 0x1000>,
> > > +			      <0x00088000 0x4000>,
> > > +			      <0x20100000 0x1000>;
> > > +			reg-names = "dbi", "elbi", "atu", "parf", "config";
> > > +
> > > +			ranges = <0x81000000 0x0 0x20200000 0x20200000 0x0 0x00100000>,
> > > +				 <0x82000000 0x0 0x20300000 0x20300000 0x0 0x07d00000>;
> > 
> > Please cross check 'ranges' property with other platforms.
> > 
> <snip>
> > 
> > Cross check 'interrupt-map' as well.
> 
> I'm not seeing the smoking gun. What am I looking for?
> 

Ah, nvm. I misread the '#address-cells' property of the GIC. This is fine.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


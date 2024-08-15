Return-Path: <linux-arm-msm+bounces-28628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC73952EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 15:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F8E81C23CA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4FF19DF97;
	Thu, 15 Aug 2024 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8+1/vgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2A17C984
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723727908; cv=none; b=M2Au2017lORjXBzh4pXZ1z2B0QybowRlm/QpQ+kMNsthIse9sKLNw6796yXy6V6iqSK0S9sc3uZY0f5inMBlRz14cxyVlW8Pd3P/ObrrnaRMvRCqYg8C7BKMT+4Lqe9ZlMMW+xsVz6AXFBLM+HAFRLfDBHyHUx53jd3bLIfuGM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723727908; c=relaxed/simple;
	bh=9QzxkGKPHGI6MZIx5pSqqR5HuH/5Fo/m92L6t1rw1yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UN+Dn1/iSYQttnWNFtPisZNZrROhYPNhF/LTQjK2YQ6WvwLdvDsvo/CiyyEnOnhcJXntsJAKRCX3SuJkj+EIT2ny+qIbtfrKhuYUU4NwK+KVZ4sKxYBijs2NpNVJC9f5mCwEgLQxaBHPUb61KLVLahFDwCCShbfSgzXFV49JpUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8+1/vgq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7bcd0so1295739a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723727905; x=1724332705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pam5Ci+C4rFF08wOghK1K2f2OhCc/g5cnbX0w9Mc4I=;
        b=Z8+1/vgq+SvqxoGZ3iOc7E5lNxrTdGmflBaEhrDtq8qrocBq9S751xBZ+J/oTqn90d
         zTdGhDVCWNbNHQR7s8AJmwdwH87jJ0WUsdga2Gt0MoCpGkmoNz4jFJP9vAVJus1G6Hi9
         kC71mWhk4l3PS15aFs53Eo23Tb5rKtVCknNlX36BU21e8Gy8Hukl7Co/pB4PQ9Tn2Xma
         wJ0quQgzhfzs1V2urxGxrTcgsGCoYH7OL7YUdA7A5gTMg28b1LN0Fe2jkf/ZpWotjFLA
         q41Ev1Uzhse7tBNa0+tUj2gQNoGYAhEWBETCCoM44M7cGkWcGLzfw/knTmjIiZscG8K4
         UPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723727905; x=1724332705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pam5Ci+C4rFF08wOghK1K2f2OhCc/g5cnbX0w9Mc4I=;
        b=lnzhyapi41dy6mUR19Vj3BhWKLjCFNsZa4/Py9ZrU5Z08NpOYeLG3l9XlgJFyHFmCq
         B2vexZ9lePQ6lv6wM5n5YjqHpV/TmtnMDSdH0oyJQHKvS+RpdW6fgktnjohdzOnKQ+kk
         qDmeNlxua/ewwCt15mo/IzLtoNDz6j7StPd4/x8Qctjtjsfk5qWpvCFFBDf37psWkeqI
         y1hgrzQu6+ZYkObWjzlkFssca2vyFic5gDuNrJUEE1B3PpzOMRpz2kQQU7GcuAzQo53x
         /Ollt54FHYNdBt5FzFFQyG7I1nvR6/oHneYnAs8TO6sSGcbDgwz0pkhGFU/4/CQOSy0X
         0EOA==
X-Forwarded-Encrypted: i=1; AJvYcCUsVucz9A39+YMNrnE8Xhbp4x1LDMBmntUztN0ZjsoLHEeOkftdX45HA5yhH/Aym4We91GjZc7vnwpgBECO/H2SkYEKtbvobJt51JAa4A==
X-Gm-Message-State: AOJu0YycyXU1h47jFbhRepD0uGLPvP+4Feo6pB6hwEWJpSjkUQhN40Nl
	PEJvYTUenTUw03y3kD5dFEDSkrJMcG7E0l0M5j/0GHw2c94GbNt8chsOZV3EZ/w=
X-Google-Smtp-Source: AGHT+IHM8+Udq7m54PDM2N1th3MFrrcrJsKXCwIA/ehjKz4VTI2MNH9h0V4lGOkyJ6MlTp8/EauXtw==
X-Received: by 2002:a17:907:7e95:b0:a77:db36:1ccf with SMTP id a640c23a62f3a-a83670913a4mr460177666b.42.1723727904580;
        Thu, 15 Aug 2024 06:18:24 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396cdbesm101056866b.200.2024.08.15.06.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 06:18:24 -0700 (PDT)
Date: Thu, 15 Aug 2024 16:18:22 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Marcus Glocker <marcus@nazgul.ch>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: Add UFS node
Message-ID: <Zr4AHoPpAXJM6AC+@linaro.org>
References: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>
 <ejeph4wspggkmvhl7qmpvw5jlojyvma7epqd67i6vk5p6fncrk@de56nvgi6vzi>
 <Zr3cuxv4EdxMQa9C@linaro.org>
 <kt5mrxse7dirsjgu3ldv4rzasgbmykluul7ie26zlavhlmfz4r@bo4fd4ybt7bx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kt5mrxse7dirsjgu3ldv4rzasgbmykluul7ie26zlavhlmfz4r@bo4fd4ybt7bx>

On 24-08-15 13:54:01, Marcus Glocker wrote:
> On Thu, Aug 15, 2024 at 01:47:23PM +0300, Abel Vesa wrote:
> 
> > On 24-08-15 12:42:29, Marcus Glocker wrote:
> > > Add the UFS Host Controller node.  This was basically copied from the
> > > arch/arm64/boot/dts/qcom/sc7180.dtsi file.
> > > 
> > > Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 71 ++++++++++++++++++++++++++
> > >  1 file changed, 71 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > index 7bca5fcd7d52..235e20e4b51f 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > @@ -2878,6 +2878,77 @@ mmss_noc: interconnect@1780000 {
> > >  			#interconnect-cells = <2>;
> > >  		};
> > >  
> > > +		ufs_mem_hc: ufs@1d84000 {
> > > +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
> > > +				     "jedec,ufs-2.0";
> > > +			reg = <0 0x01d84000 0 0x3000>;
> > > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> > > +			phys = <&ufs_mem_phy>;
> > > +			phy-names = "ufsphy";
> > > +			lanes-per-direction = <1>;
> > > +			#reset-cells = <1>;
> > > +			resets = <&gcc GCC_UFS_PHY_BCR>;
> > > +			reset-names = "rst";
> > > +
> > > +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > > +
> > > +			iommus = <&apps_smmu 0xa0 0x0>;
> > > +
> > > +			clock-names = "core_clk",
> > > +				      "bus_aggr_clk",
> > > +				      "iface_clk",
> > > +				      "core_clk_unipro",
> > > +				      "ref_clk",
> > > +				      "tx_lane0_sync_clk",
> > > +				      "rx_lane0_sync_clk";
> > > +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> > > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > > +				 <&rpmhcc RPMH_CXO_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
> > > +			freq-table-hz = <50000000 200000000>,
> > > +					<0 0>,
> > > +					<0 0>,
> > > +					<37500000 150000000>,
> > > +					<0 0>,
> > > +					<0 0>,
> > > +					<0 0>;
> > > +
> > > +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > > +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> > > +			interconnect-names = "ufs-ddr", "cpu-ufs";
> > > +
> > > +			qcom,ice = <&ice>;
> > > +
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		ufs_mem_phy: phy@1d87000 {
> > > +			compatible = "qcom,x1e80100-qmp-ufs-phy";
> > 
> > Can't find any phy patch that adds this compatible to the driver.
> 
> That might well be, since this is pretty new hardware.  But the goal
> of this submission is only to describe the hardware, not to add
> immediate support to the OS drivers.  Whether the drivers will make use
> of it, is a different story, and up to the people who maintain the
> respective drivers.
> 
> Getting the right DTB in, at least opens the possibility to continue
> development in the driver area to further support this new hardware.
> 
> But I won't touch your drivers, not my goal.

Presumably, you do have the UFS working on your Book4 laptop, right?

If so, I would expect you do have the PHY working as well and therefore
a patch that adds the X Elite compatible, right?

> 
> > > +			reg = <0 0x01d87000 0 0x1000>;
> > > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> > > +			clock-names = "ref",
> > > +				      "ref_aux",
> > > +				      "qref";
> > > +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> > > +			resets = <&ufs_mem_hc 0>;
> > > +			reset-names = "ufsphy";
> > > +			#phy-cells = <0>;
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		ice: crypto@1d90000 {
> > > +			compatible = "qcom,x1e80100-inline-crypto-engine",
> > > +				     "qcom,inline-crypto-engine";
> > > +			reg = <0 0x01d90000 0 0x8000>;
> > > +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> > > +		};
> > > +
> > >  		pcie6a: pci@1bf8000 {
> > >  			device_type = "pci";
> > >  			compatible = "qcom,pcie-x1e80100";
> > > -- 
> > > 2.39.2
> > > 


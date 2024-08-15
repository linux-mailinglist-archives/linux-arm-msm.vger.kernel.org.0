Return-Path: <linux-arm-msm+bounces-28623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A13952CFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 12:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B884E1C20401
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 10:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79DE1BD03D;
	Thu, 15 Aug 2024 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AC0JdNfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE24C1BCA11
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723718850; cv=none; b=T4/7bgoQ6S1LBDmklgHO3PGOYASwrz0tqLgbdpvSbzwzYQeMNQiyK1S0AqZQ0sqDJIXcjcFutvxtrmqfBAd04S+jTVtEARWDuTvJhpzWrlG/jXCtOf5wF/SvZbVWmcGKrOYffe1rkTvMJiSPfdESCSH7SMzWtnIJpesjnpOndV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723718850; c=relaxed/simple;
	bh=6tGzmiTzEPMRyKJk0PGvlaJdsO9+QLBrYLK+b36RDG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wf+ZPvQOMJZyMtG+0K35ooNUkCyukaOzpYuxI5gJ/m/oK+KoOARnvwkwZZGIFDflOzBCnYRKOtDRwLQ7h9wbVC1nddq7mIZxa8ST0Gbj5nbiLQowk7tTxleBrRlXcGXJ4qOSZ/8jSq25VAMrRtdtgH4Nac/NIPKFLXtYmhg2IU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AC0JdNfy; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f040733086so7954511fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723718846; x=1724323646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFiBa+U9hFlCzSJ6jAO6RRxbfDnmoUHchd4gNuf1fR0=;
        b=AC0JdNfysm7QLop8eLtmUM9be0fBWrj+5i0eGDY41c6besVtOenu6hv7N537snTW26
         lAJ5A9rRqf+IdBDVEjk/6fXY5Vjlo0ING9NWD0AgBQEgMUaqFRq5hTatv4dz+zUR822B
         uttVva25bLKgjxGIbkYP37Gvjdz8VizJ8xT+ZKJdSnaKEiV34Q84WuvPAZlhIbWVxCyY
         CyTXU7UHqSXONX9lCgqnuAXOnwLFQr7eIG58T/clNsC2IA7oFxMDUCjLMjDwevoNL1l7
         6rae/sWckiwq0xmdq1wwmgiHApaNWwcge6Us0bxu/5E5UVu7EnYyak2uJVc4HoEjf00E
         uErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723718846; x=1724323646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFiBa+U9hFlCzSJ6jAO6RRxbfDnmoUHchd4gNuf1fR0=;
        b=Apc147p9IaTZaQB8UdUlU9TYt82/FwYzjQ4l9d4GN15dVwOwOSCfnLiDldpbrqPsej
         SXS35nxJJI1s0OBO+zhxS786ubBFZTTQXY9O/+2gQHnkXHpV5wFVrFElkXl1CKk8cyfK
         +xgYpf4RgbDeRAa5szrId5lS2cI4mPjCrhlSM2BfItsBa7lDWvYmrO9Z4oMFHkpXJ3wT
         ZObvKOCcqy1pOGmS85F6dUgYDj/z4Th9RIF9dVAAi0GnsBfkbXAakhTU9jmyzqHl1Zz3
         DqhYm/uGp4Qphqd6yQmfqkAdziLApcmmqfXSPjuCIqoOOwdcqyoXPrB0C5EKOHZTEBes
         /99A==
X-Forwarded-Encrypted: i=1; AJvYcCXuxTvPRTbQtjUCLcERV/KbiZpwjEULw8xU/Vipll4QOFTVLTIbHIfDU7O3XNg6iRvv/q9/PRT9CIEv40aQQMkWB8gwhb1xvAcypCGJUQ==
X-Gm-Message-State: AOJu0YyHfBBAmxZXUXVPPTN5FQKA976MvsHUFYuoOEkCBEceVPBh5dO5
	sBhUASrv39AkFm6bfbV5PwFg2sz8RUnvauZj2J6o/hvAL1wiHswzv1vv3r/3mvA=
X-Google-Smtp-Source: AGHT+IFhIREb9DDHPxPjjEWsOsR0T8cVRKEasMD22RcTYJZf7Fjoq4Bq9TP7VGvZC1uKvZYxPNDGdA==
X-Received: by 2002:a2e:3210:0:b0:2ee:7bcd:a52 with SMTP id 38308e7fff4ca-2f3aa1f9d0dmr31464881fa.46.1723718845647;
        Thu, 15 Aug 2024 03:47:25 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe29c3sm753708a12.14.2024.08.15.03.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 03:47:25 -0700 (PDT)
Date: Thu, 15 Aug 2024 13:47:23 +0300
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
Message-ID: <Zr3cuxv4EdxMQa9C@linaro.org>
References: <v2iah5yrne4u6uzrnzg36tvtxzqrpiez6io2gyyfrht2x42umw@5ribqndiavxv>
 <ejeph4wspggkmvhl7qmpvw5jlojyvma7epqd67i6vk5p6fncrk@de56nvgi6vzi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ejeph4wspggkmvhl7qmpvw5jlojyvma7epqd67i6vk5p6fncrk@de56nvgi6vzi>

On 24-08-15 12:42:29, Marcus Glocker wrote:
> Add the UFS Host Controller node.  This was basically copied from the
> arch/arm64/boot/dts/qcom/sc7180.dtsi file.
> 
> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 71 ++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 7bca5fcd7d52..235e20e4b51f 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2878,6 +2878,77 @@ mmss_noc: interconnect@1780000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		ufs_mem_hc: ufs@1d84000 {
> +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			reg = <0 0x01d84000 0 0x3000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			phys = <&ufs_mem_phy>;
> +			phy-names = "ufsphy";
> +			lanes-per-direction = <1>;
> +			#reset-cells = <1>;
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			iommus = <&apps_smmu 0xa0 0x0>;
> +
> +			clock-names = "core_clk",
> +				      "bus_aggr_clk",
> +				      "iface_clk",
> +				      "core_clk_unipro",
> +				      "ref_clk",
> +				      "tx_lane0_sync_clk",
> +				      "rx_lane0_sync_clk";
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
> +			freq-table-hz = <50000000 200000000>,
> +					<0 0>,
> +					<0 0>,
> +					<37500000 150000000>,
> +					<0 0>,
> +					<0 0>,
> +					<0 0>;
> +
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ufs-ddr", "cpu-ufs";
> +
> +			qcom,ice = <&ice>;
> +
> +			status = "disabled";
> +		};
> +
> +		ufs_mem_phy: phy@1d87000 {
> +			compatible = "qcom,x1e80100-qmp-ufs-phy";

Can't find any phy patch that adds this compatible to the driver.

> +			reg = <0 0x01d87000 0 0x1000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		ice: crypto@1d90000 {
> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x01d90000 0 0x8000>;
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		};
> +
>  		pcie6a: pci@1bf8000 {
>  			device_type = "pci";
>  			compatible = "qcom,pcie-x1e80100";
> -- 
> 2.39.2
> 


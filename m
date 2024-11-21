Return-Path: <linux-arm-msm+bounces-38683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A739D512E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 18:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8721F24118
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 17:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F2419924A;
	Thu, 21 Nov 2024 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L63LVHjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47037198A3F
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208451; cv=none; b=fUo0QE5UMqlm/dYd6g2nlC5BbfF9UVkeHKwztJhyzdCkEmd/MxZ6NWYdxgeLBn2A7SAyAGhNv80ZrT+x0FzxdUr8bWtNqbZLpvFpEUaUJjS5AG8pcqV+NDfbKa4tlRD0I8hRak3YllrHStX0IegelP/aAXcSh4hRA0oX1qVe16A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208451; c=relaxed/simple;
	bh=jzTU/z32x3hB0JfDrm8MmAyZ6G+T5pKSWXdt0ly+8jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFnINefPRGyyszGiQmpDBvPK/OrQA31YpJ1FuuYO+Hnh89ftPo+R6VI3K3LOX4S7L3bp6AkRyFt5q9cwzYDcC75AmoiNQdIDcunJfwChto+UFAMHtkpfMt16VLROE7qkhn/PDZkp47cGLc6T9TUdogEZSpnRUnF7Hjlt5zEDxeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L63LVHjP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd1b4e01cso502908e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 09:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732208447; x=1732813247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTXid3Zut7ENV6u5lEywLtVroH0vN+GAHGKS1dMMtj0=;
        b=L63LVHjPHU791h+YKXmJCmR5Du5UeMwXxcy3Oangg5fsBdazuhST+klzqEjI4BUd37
         VCKL1hhApSfjju9vUqtvJoS1iNTlGZ8jgWB9c1a0Ki0/MWq/Hk2zgZBoOjHFxEllnr2T
         dleqlmsb4L94QZLXL9nbYYdR7enISgCVPjF7jmsycoItxl5b1vJDWON1Y/XZcB378I2B
         K3S6oH5g/UBWqEH9zlaZ8Vv4RvkvnL9iuU/JwvvjIcCIhiMgbHUMUtUtVkYpuCXKN8/k
         NZply0MBFOg2bljJ2k7piQm4zsba85IzpGCKYcoN9gc+bhLwPw8frLtLd0GWbdSUfxh0
         E0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732208447; x=1732813247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTXid3Zut7ENV6u5lEywLtVroH0vN+GAHGKS1dMMtj0=;
        b=wK6ut6fksjTVFgQywcbh3LKPTnDAPOi20QETbhnfmoWgxui+pfMPamY+5ZcicvS8en
         Bm4dlk4tqZDMzVH3AxVNRhuvgiHscVV+lLxFtp52Tgjojm1KaYWhyMbJzoSZlnTOQtfh
         s3GK401gCDnYbqaWMrc2du9Q38Kjs7moHhlzn/ErQvibymFdRjyW7isQh3uIfIPXTOyA
         6y7AWjtenUogCGR8BvLQmXC5gu5GXdrufG7kJJmvD2uEAh5qxbmWoSXcGFMZaovmlpQQ
         9YcjycbpT/K1+s2CLoFpCK3QInMyeralOVvCla1XyOHQT90wsrmojjGmA9I8z057zxWa
         4etQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1FG6s1NNDnMjcRVg8sUspvxyq1IXofbSwNdvhbtuumsMWVk8ivvsHW9ZH7u1k9qZWAinD+8+JBK+w3Z6D@vger.kernel.org
X-Gm-Message-State: AOJu0YwlA/s+b0W1EGx3BtM5HZifHNRpvc0b91SLwJFKEDG5zizURFwz
	PurzEeynrtPWkx7rxM6cd729YKkKB9kcsmPKn4bMIEtUVc/PKIS8zJ4c8scxIYc=
X-Gm-Gg: ASbGnctr2WX3t/IGpah1+xBGuZDgGP3vjzGED6FpZYpFSnJmxhNxuNTgMi+Ksr1e78c
	T5DR8OGNLP7Bcuu/DB6jIZ+VkdrfJHY4yB4jqb1anywJvGsH04v/lA/yujQQVTR3/e/XWfP21bd
	f7klNcfd22vSaINTasSpK/cnhYXucLrjkN7nlP8LTt9ACAQ3jIMu0p0XmKqqSnK2v8DDq6ElGOK
	F1P1KLLRJqN/pA/r1rk+zg05RFRriCMoKqdJRZSJ4Ps9gk7hmRn4IhR7xyEsghjUg/z7JZIclP6
	4X4Ku7z8ylgWXMu6PZdB5gTyeqnghA==
X-Google-Smtp-Source: AGHT+IHHxVFXWhGPPdA9ksqKTV8tWCXoqA5zp3uVM/KOFvDJ1Wc2NNeKT6Y5HEDYj4Oq06/7SimNdw==
X-Received: by 2002:a05:6512:32d4:b0:53d:cfe0:5937 with SMTP id 2adb3069b0e04-53dcfe059a2mr1179637e87.13.1732208445738;
        Thu, 21 Nov 2024 09:00:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24455e6sm16713e87.3.2024.11.21.09.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:00:44 -0800 (PST)
Date: Thu, 21 Nov 2024 19:00:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Liu <quic_liuxin@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	quic_jiegan@quicinc.com, quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_sayalil@quicinc.com
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qcs615: add UFS node
Message-ID: <45cb4thpg6mrtxiwdb333w2jxgtpw426akik2l3f7qv57dvwmm@kma6vrglbrjh>
References: <20241119022050.2995511-1-quic_liuxin@quicinc.com>
 <20241119022050.2995511-3-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119022050.2995511-3-quic_liuxin@quicinc.com>

On Tue, Nov 19, 2024 at 10:20:49AM +0800, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> 
> Add the UFS Host Controller node and its PHY for QCS615 SoC.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 112 +++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 590beb37f441..ceceafb2e71f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -458,6 +458,118 @@ mmss_noc: interconnect@1740000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		ufs_mem_hc: ufshc@1d84000 {
> +			compatible = "qcom,qcs615-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> +			reg = <0x0 0x01d84000 0x0 0x3000>, <0x0 0x01d90000 0x0 0x8000>;

Please consider splitting to have one entry per line (and reg-names
too).

> +			reg-names = "std", "ice";
> +
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
> +			clock-names = "core_clk",
> +				      "bus_aggr_clk",
> +				      "iface_clk",
> +				      "core_clk_unipro",
> +					  "core_clk_ice",

Wrong indentation

Other than that LGTM.


> +				      "ref_clk",
> +				      "tx_lane0_sync_clk",
> +				      "rx_lane0_sync_clk";
> +
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
> +
> +			operating-points-v2 = <&ufs_opp_table>;
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ufs-ddr",
> +					     "cpu-ufs";
> +
> +			power-domains = <&gcc UFS_PHY_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			iommus = <&apps_smmu 0x300 0x0>;
> +			dma-coherent;
> +
> +			lanes-per-direction = <1>;
> +
> +			phys = <&ufs_mem_phy>;
> +			phy-names = "ufsphy";
> +
> +			#reset-cells = <1>;
> +
> +			status = "disabled";
> +
> +			ufs_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-50000000 {
> +					opp-hz = /bits/ 64 <50000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <37500000>,
> +						 /bits/ 64 <75000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <75000000>,
> +						 /bits/ 64 <150000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <150000000>,
> +						 /bits/ 64 <300000000>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>,
> +						 /bits/ 64 <0>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +			};
> +		};
> +
> +		ufs_mem_phy: phy@1d87000 {
> +			compatible = "qcom,qcs615-qmp-ufs-phy", "qcom,sm6115-qmp-ufs-phy";
> +			reg = <0x0 0x01d87000 0x0 0xe00>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +
> +			power-domains = <&gcc UFS_PHY_GDSC>;
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>  		tcsr_mutex: hwlock@1f40000 {
>  			compatible = "qcom,tcsr-mutex";
>  			reg = <0x0 0x01f40000 0x0 0x20000>;
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry


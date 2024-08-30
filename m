Return-Path: <linux-arm-msm+bounces-30149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F39653C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 02:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1902B284D6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 00:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3D2193;
	Fri, 30 Aug 2024 00:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWsSDHDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10327182;
	Fri, 30 Aug 2024 00:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724976355; cv=none; b=QaOkELo85XbegfUNxkGD0rT/CQWAbViQdsmPGFWWw8i71rWjNeT7y+y4sCmayhLPw/asX0RI3yPDD5UBLe+afI3GQtIIlDsuedUXAB/gc+ciyDMi8MMn6DQUGNnrGwoT9wSMV05yV3pPHtqH0Ng5mA/ifUwSXPd2KvzmPSqnh6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724976355; c=relaxed/simple;
	bh=ck6V35q/nTYJVUNUtR3K129WHnq5CtFkByhsuL+l4HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZRVyB4RGmw3LZ1MwX/xHh/M2/hnzFywDp9AclQpFteuP4ddSA1xQf3Word3vcuv036/GaFIvUKM7TZyGTGriG1sIvdu1UZwsf4aNw33UBPsUH9zqTsscgqGa6+dmHdL4B9I9GMoFu1/M+RU6OEPIHw5n1UTVCN/ErT4jTCSvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWsSDHDS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B49C4CEC1;
	Fri, 30 Aug 2024 00:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724976354;
	bh=ck6V35q/nTYJVUNUtR3K129WHnq5CtFkByhsuL+l4HY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uWsSDHDSbJOaBXhtzbZly4DWZ6e4k5VMjkTU76yxDKS/Ja0nZymV55ESJKOW7YMNz
	 bWJYva6K4r8NlP3hSF1x8BpQ7welSHf3eR8KfoGeowVFLt7iA5DAHgqwz5PzlnnKrc
	 vehvPTdKXVKJ8tFLB76xbqHw+Jw2Lm375NJ0dROzCTDqZu3Nb73Uao651OkncK1LxM
	 q8oiFrEsXWBHkRa1ykFi9H3vZrJtL1ajYR7nDOeWNWUB3pEv7blC6VZq2uTIev5yiI
	 PfsSVAImLugKO/pPUYLYKF+JhVvshkiTeqUcEqz5ep+jB7RO60UVxyXPAkOHwvKWx9
	 pZcgVmDiEh7ew==
Message-ID: <cd9d5a7c-ec0b-4f0a-bac2-f747799bf295@kernel.org>
Date: Fri, 30 Aug 2024 02:05:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add UFS node
To: Marcus Glocker <marcus@nazgul.ch>, Bjorn Andersson
 <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <g5vlxrttgvfqkktlkhu4uzhtvnp3qtjcbr7l2uztapzqwhrsem@wg574xldh5ar>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.08.2024 10:38 PM, Marcus Glocker wrote:
> Add the UFS Host Controller node.  This was basically copied from the
> arch/arm64/boot/dts/qcom/sc7180.dtsi file.
> 
> Signed-off-by: Marcus Glocker <marcus@nazgul.ch>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 72 ++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 7bca5fcd7d52..9f01b3ff3737 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2878,6 +2878,78 @@ mmss_noc: interconnect@1780000 {
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

Looks like this should be 0x1a0 maybe
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

You also want

<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>

> +			freq-table-hz = <50000000 200000000>,
25000000 300000000

> +					<0 0>,
> +					<0 0>,
> +					<37500000 150000000>,
75000000 300000000

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
> +			reg = <0 0x01d87000 0 0x1000>;

most definitely should be 0x01d80000 with a size of 0x2000

> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
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

0x1d88000


All this combined means you probably wrote your init sequence into some
free(?) register space and the one left over from the bootloader was
good enough :P

Konrad


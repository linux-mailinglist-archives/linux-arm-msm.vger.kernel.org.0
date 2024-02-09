Return-Path: <linux-arm-msm+bounces-10346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FE84F9BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 17:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9DA2838FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 16:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21327E116;
	Fri,  9 Feb 2024 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4miS6A1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57617BAFD;
	Fri,  9 Feb 2024 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707496638; cv=none; b=KHogJf1ebMPeui+c8Rr6PNyjLuF8wDtZ69DR/Xvf0NR9tk7mlVVChhyQ9d53bif7Sm68YiQRY6WeByWXYhMEUJPQ01fK0bCjEXY5PRrlA+x5A2TPOVBBrmXNY2PuLj0KgpQXFUh1ngXU4xj9jRmezM5mXwzFRx8JzJLFrBEqHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707496638; c=relaxed/simple;
	bh=5vITn9HQvHi1/Ga6fSu3LijrkNlFyI/oeTS3I6OXY8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITWPxf74HLn+dykNYGwCTLcJ7cLVfz7EDL+diwcCVuDdLa4JrikfRnJYJg8bFECCDupaAvwnz1Z4s0ejTbeaCdtrdunhBX84mo9DHrNjHNprBVrkdcIf6LTQaY/ZqdxzWDDxTU7AHZGo0kMGX39sVTtoDPcwpRaLmd4rouS/BKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4miS6A1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AA0C433F1;
	Fri,  9 Feb 2024 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707496638;
	bh=5vITn9HQvHi1/Ga6fSu3LijrkNlFyI/oeTS3I6OXY8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4miS6A1gYmVxJfllih+2wFdh1HHf2/PAKWrxxpBbtGROfkh31exXNOS+cvGu2ocx
	 CkAHbcBLf1hYPE2/DMDhEdvM2IzCXQsiKr30qWh/pieKH13w5bEzSI+FXBwGMlQ7j4
	 Fjc633Mf/d7mXmc4xhbNTFtUlGraKqiTpGpIwHzLhuDKGHz35m2RT9Dopo3TF+v9wB
	 s6kQNW84VhwdqmgZPAC6XuS0bwsDmkAichfYLuIW/dm+oTmp8Qb4SNbZ+C+jm2K7kw
	 kHeKbKvrEUeuDFSwJkmhnYooAUZeEjuVHQnQcMNgGl024fK5k3p+vIEcu71jKlAxMp
	 qG7cfQTFK8vaQ==
Date: Fri, 9 Feb 2024 10:37:15 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette =?utf-8?B?wqA=?= <mturquette@baylibre.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Update protected clocks list for
 qcm6490 variants
Message-ID: <zzxpyvprhgl6f3kkcecmtxfksdplxqoljwsu6wguawlb3if2ym@jiybnvtplijc>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-6-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208062836.19767-6-quic_tdas@quicinc.com>

On Thu, Feb 08, 2024 at 11:58:36AM +0530, Taniya Das wrote:
> Certain clocks are not accessible on QCM6490-IDP and QCS6490-RB3GEN2 boards
> thus require them to be marked protected.
> 
> Also disable the LPASS nodes which are not to be used.
> 

Please find a smaller patch, to make the board boot again here:

https://lore.kernel.org/linux-arm-msm/20240209-qcm6490-gcc-protected-clocks-v1-1-bd3487b2e7b1@quicinc.com/T/#u

> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 54 +++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 50 +++++++++++++++++-
>  2 files changed, 102 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 03e97e27d16d..425e4b87490b 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
> 
>  /dts-v1/;
> @@ -415,6 +415,58 @@
>  	};
>  };
> 
> +&gcc {
> +	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
> +			<GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
> +			<GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> +			<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> +			<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,

protected-clocks should mark the clocks that Linux must not access.

With that in mind, how is listing GCC_PCIE_1_* here compatible with
Krishna's patch [1], which clearly shows that Linux is expected to use
pcie1.

[1] https://lore.kernel.org/linux-arm-msm/20240207-enable_pcie-v1-1-b684afa6371c@quicinc.com/

Regards,
Bjorn

> +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> +			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> +			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> +			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> +			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> +			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> +			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> +			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> +			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> +			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> +};
> +
> +&lpasscc {
> +	status = "disabled";
> +};
> +
> +&lpass_audiocc {
> +	qcom,adsp-skip-pll;
> +	protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
> +		<LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
> +		<LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
> +		<LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
> +		<LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
> +		<LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
> +		<LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
> +	/delete-property/ power-domains;
> +};
> +
> +&lpass_aon {
> +	status = "disabled";
> +};
> +
> +&lpass_core {
> +	status = "disabled";
> +};
> +
> +&lpass_hm {
> +	status = "disabled";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 8bb7d13d85f6..1398b84634c3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
> 
>  /dts-v1/;
> @@ -413,6 +413,54 @@
>  	};
>  };
> 
> +&gcc {
> +	protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> +			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> +			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> +			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> +			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> +			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> +			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> +			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> +			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> +			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> +};
> +
> +&lpasscc {
> +	status = "disabled";
> +};
> +
> +&lpass_audiocc {
> +	qcom,adsp-skip-pll;
> +	protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
> +		<LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
> +		<LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
> +		<LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
> +		<LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
> +		<LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
> +		<LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
> +		<LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
> +	/delete-property/ power-domains;
> +};
> +
> +&lpass_aon {
> +	status = "disabled";
> +};
> +
> +&lpass_core {
> +	status = "disabled";
> +};
> +
> +&lpass_hm {
> +	status = "disabled";
> +};
> +
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> --
> 2.17.1
> 


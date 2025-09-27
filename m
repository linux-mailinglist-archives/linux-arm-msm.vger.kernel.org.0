Return-Path: <linux-arm-msm+bounces-75375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC77BA5DD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 12:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2BC8320073
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 10:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FC92D4B52;
	Sat, 27 Sep 2025 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyetWSAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A4C1F541E;
	Sat, 27 Sep 2025 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758969643; cv=none; b=EtehLohZLnnjKjh+Lzm9RaucpgG7xgVsKmjDfjq3GfGb3Tt/u3FKj37ptKCRnCrodNZNaE0ASxecXzyzmwNzmzw8GEU0Ks5+mKNyTGYPK3lQ08wWbEswb5KczuOJyOrH4cxPJbd7h5eBvqZ87d6U/ZVH06/fWbqEghmtnFCeeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758969643; c=relaxed/simple;
	bh=MqZQcoGXG4SDq6jxLl2RGQWZXvBxfGsoLv0xZxlD0tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cucvMqOIyZPnXMQLsy9dwVp9zw4n0mosrKDCqxFFsOQnvgw80jXsJ4CuqpO4Gss5T5kdjd9yZrBgW5nbKHIib5aR3tyV8ALV+KGH8znyVbJpg73+FIGhlSWc7pCA1ApeO2i7cOC2hh/wm4RSB5S3q9cf/hx75eiFERNCsQx2HzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyetWSAX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2287C4CEE7;
	Sat, 27 Sep 2025 10:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758969643;
	bh=MqZQcoGXG4SDq6jxLl2RGQWZXvBxfGsoLv0xZxlD0tc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LyetWSAXMMwwpITPBJYkxxuHYWO7f36w79vODcBRLaiX6knQuFmmEaRMtkAmlBScN
	 7/pI32MhXZIo2T5zwXsMqLsUIJ2ejV7kR0EQjEGEyYalhqKdbfYF6g9qlc/zz8VD7r
	 VD2BA/cdww3zzkdnFGHhyvzB1WtPQOX1odBIznfWRGUZfJAz9XBPGXQDQRkRHI2PYL
	 2PNh0i9LsjUMTmj4x3H8zdEemtN/oR9NcAcVnOkGSHdFkeaAoIP1uRMquRPIo5hMR9
	 2L8zygBUUDHvrHDIWTVTP39C0sRogFxLwGeQlxsCoXvTDCil9Ob0XIK0MtjD2YTN46
	 3m8a3TU/GaGMQ==
Message-ID: <dc48e781-ca65-4afe-9780-a814a7231648@kernel.org>
Date: Sat, 27 Sep 2025 11:40:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 USB4 clocks/resets
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com>
 <20250926-topic-hamoa_gcc_usb4-v1-1-25cad1700829@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250926-topic-hamoa_gcc_usb4-v1-1-25cad1700829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2025 13:03, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some of the USB4 muxes, RCGs and resets were not initially described.
> 
> Add indices for them to allow extending the driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,x1e80100-gcc.yaml          | 62 ++++++++++++++++++++--
>   include/dt-bindings/clock/qcom,x1e80100-gcc.h      | 61 +++++++++++++++++++++
>   2 files changed, 119 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
> index 68dde0720c711320aa0e7c74040cf3c4422dda72..1b15b507095455c93b1ba39404cafbb6f96be5a9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
> @@ -32,9 +32,36 @@ properties:
>         - description: PCIe 5 pipe clock
>         - description: PCIe 6a pipe clock
>         - description: PCIe 6b pipe clock
> -      - description: USB QMP Phy 0 clock source
> -      - description: USB QMP Phy 1 clock source
> -      - description: USB QMP Phy 2 clock source
> +      - description: USB4_0 QMPPHY clock source
> +      - description: USB4_1 QMPPHY clock source
> +      - description: USB4_2 QMPPHY clock source
> +      - description: USB4_0 PHY DP0 GMUX clock source
> +      - description: USB4_0 PHY DP1 GMUX clock source
> +      - description: USB4_0 PHY PCIE PIPEGMUX clock source
> +      - description: USB4_0 PHY PIPEGMUX clock source
> +      - description: USB4_0 PHY SYS PCIE PIPEGMUX clock source
> +      - description: USB4_1 PHY DP0 GMUX 2 clock source
> +      - description: USB4_1 PHY DP1 GMUX 2 clock source
> +      - description: USB4_1 PHY PCIE PIPEGMUX clock source
> +      - description: USB4_1 PHY PIPEGMUX clock source
> +      - description: USB4_1 PHY SYS PCIE PIPEGMUX clock source
> +      - description: USB4_2 PHY DP0 GMUX 2 clock source
> +      - description: USB4_2 PHY DP1 GMUX 2 clock source
> +      - description: USB4_2 PHY PCIE PIPEGMUX clock source
> +      - description: USB4_2 PHY PIPEGMUX clock source
> +      - description: USB4_2 PHY SYS PCIE PIPEGMUX clock source
> +      - description: USB4_0 PHY RX 0 clock source
> +      - description: USB4_0 PHY RX 1 clock source
> +      - description: USB4_1 PHY RX 0 clock source
> +      - description: USB4_1 PHY RX 1 clock source
> +      - description: USB4_2 PHY RX 0 clock source
> +      - description: USB4_2 PHY RX 1 clock source
> +      - description: USB4_0 PHY PCIE PIPE clock source
> +      - description: USB4_0 PHY max PIPE clock source
> +      - description: USB4_1 PHY PCIE PIPE clock source
> +      - description: USB4_1 PHY max PIPE clock source
> +      - description: USB4_2 PHY PCIE PIPE clock source
> +      - description: USB4_2 PHY max PIPE clock source
>   
>     power-domains:
>       description:
> @@ -67,7 +94,34 @@ examples:
>                  <&pcie6b_phy>,
>                  <&usb_1_ss0_qmpphy 0>,
>                  <&usb_1_ss1_qmpphy 1>,
> -               <&usb_1_ss2_qmpphy 2>;
> +               <&usb_1_ss2_qmpphy 2>,
> +               <&usb4_0_phy_dp0_gmux_clk>,
> +               <&usb4_0_phy_dp1_gmux_clk>,
> +               <&usb4_0_phy_pcie_pipegmux_clk>,
> +               <&usb4_0_phy_pipegmux_clk>,
> +               <&usb4_0_phy_sys_pcie_pipegmux_clk>,
> +               <&usb4_1_phy_dp0_gmux_2_clk>,
> +               <&usb4_1_phy_dp1_gmux_2_clk>,
> +               <&usb4_1_phy_pcie_pipegmux_clk>,
> +               <&usb4_1_phy_pipegmux_clk>,
> +               <&usb4_1_phy_sys_pcie_pipegmux_clk>,
> +               <&usb4_2_phy_dp0_gmux_2_clk>,
> +               <&usb4_2_phy_dp1_gmux_2_clk>,
> +               <&usb4_2_phy_pcie_pipegmux_clk>,
> +               <&usb4_2_phy_pipegmux_clk>,
> +               <&usb4_2_phy_sys_pcie_pipegmux_clk>,
> +               <&usb4_0_phy_rx_0_clk>,
> +               <&usb4_0_phy_rx_1_clk>,
> +               <&usb4_1_phy_rx_0_clk>,
> +               <&usb4_1_phy_rx_1_clk>,
> +               <&usb4_2_phy_rx_0_clk>,
> +               <&usb4_2_phy_rx_1_clk>,
> +               <&usb4_0_phy_pcie_pipe_clk>,
> +               <&usb4_0_phy_max_pipe_clk>,
> +               <&usb4_1_phy_pcie_pipe_clk>,
> +               <&usb4_1_phy_max_pipe_clk>,
> +               <&usb4_2_phy_pcie_pipe_clk>,
> +               <&usb4_2_phy_max_pipe_clk>;
>         power-domains = <&rpmhpd RPMHPD_CX>;
>         #clock-cells = <1>;
>         #reset-cells = <1>;
> diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> index 710c340f24a57d799ac04650fbe9d4ea0f294bde..62aa1242559270dd3bd31cd10322ee265468b8e4 100644
> --- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> +++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
> @@ -363,6 +363,30 @@
>   #define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				353
>   #define GCC_USB3_SEC_PHY_PIPE_CLK_SRC				354
>   #define GCC_USB3_TERT_PHY_PIPE_CLK_SRC				355
> +#define GCC_USB34_PRIM_PHY_PIPE_CLK_SRC				356
> +#define GCC_USB34_SEC_PHY_PIPE_CLK_SRC				357
> +#define GCC_USB34_TERT_PHY_PIPE_CLK_SRC				358
> +#define GCC_USB4_0_PHY_DP0_CLK_SRC				359
> +#define GCC_USB4_0_PHY_DP1_CLK_SRC				360
> +#define GCC_USB4_0_PHY_P2RR2P_PIPE_CLK_SRC			361
> +#define GCC_USB4_0_PHY_PCIE_PIPE_MUX_CLK_SRC			362
> +#define GCC_USB4_0_PHY_RX0_CLK_SRC				363
> +#define GCC_USB4_0_PHY_RX1_CLK_SRC				364
> +#define GCC_USB4_0_PHY_SYS_CLK_SRC				365
> +#define GCC_USB4_1_PHY_DP0_CLK_SRC				366
> +#define GCC_USB4_1_PHY_DP1_CLK_SRC				367
> +#define GCC_USB4_1_PHY_P2RR2P_PIPE_CLK_SRC			368
> +#define GCC_USB4_1_PHY_PCIE_PIPE_MUX_CLK_SRC			369
> +#define GCC_USB4_1_PHY_RX0_CLK_SRC				370
> +#define GCC_USB4_1_PHY_RX1_CLK_SRC				371
> +#define GCC_USB4_1_PHY_SYS_CLK_SRC				372
> +#define GCC_USB4_2_PHY_DP0_CLK_SRC				373
> +#define GCC_USB4_2_PHY_DP1_CLK_SRC				374
> +#define GCC_USB4_2_PHY_P2RR2P_PIPE_CLK_SRC			375
> +#define GCC_USB4_2_PHY_PCIE_PIPE_MUX_CLK_SRC			376
> +#define GCC_USB4_2_PHY_RX0_CLK_SRC				377
> +#define GCC_USB4_2_PHY_RX1_CLK_SRC				378
> +#define GCC_USB4_2_PHY_SYS_CLK_SRC				379
>   
>   /* GCC power domains */
>   #define GCC_PCIE_0_TUNNEL_GDSC					0
> @@ -484,4 +508,41 @@
>   #define GCC_VIDEO_BCR						87
>   #define GCC_VIDEO_AXI0_CLK_ARES					88
>   #define GCC_VIDEO_AXI1_CLK_ARES					89
> +#define GCC_USB4_0_MISC_USB4_SYS_BCR				90
> +#define GCC_USB4_0_MISC_RX_CLK_0_BCR				91
> +#define GCC_USB4_0_MISC_RX_CLK_1_BCR				92
> +#define GCC_USB4_0_MISC_USB_PIPE_BCR				93
> +#define GCC_USB4_0_MISC_PCIE_PIPE_BCR				94
> +#define GCC_USB4_0_MISC_TMU_BCR					95
> +#define GCC_USB4_0_MISC_SB_IF_BCR				96
> +#define GCC_USB4_0_MISC_HIA_MSTR_BCR				97
> +#define GCC_USB4_0_MISC_AHB_BCR					98
> +#define GCC_USB4_0_MISC_DP0_MAX_PCLK_BCR			99
> +#define GCC_USB4_0_MISC_DP1_MAX_PCLK_BCR			100
> +#define GCC_USB4_1_MISC_USB4_SYS_BCR				101
> +#define GCC_USB4_1_MISC_RX_CLK_0_BCR				102
> +#define GCC_USB4_1_MISC_RX_CLK_1_BCR				103
> +#define GCC_USB4_1_MISC_USB_PIPE_BCR				104
> +#define GCC_USB4_1_MISC_PCIE_PIPE_BCR				105
> +#define GCC_USB4_1_MISC_TMU_BCR					106
> +#define GCC_USB4_1_MISC_SB_IF_BCR				107
> +#define GCC_USB4_1_MISC_HIA_MSTR_BCR				108
> +#define GCC_USB4_1_MISC_AHB_BCR					109
> +#define GCC_USB4_1_MISC_DP0_MAX_PCLK_BCR			110
> +#define GCC_USB4_1_MISC_DP1_MAX_PCLK_BCR			111
> +#define GCC_USB4_2_MISC_USB4_SYS_BCR				112
> +#define GCC_USB4_2_MISC_RX_CLK_0_BCR				113
> +#define GCC_USB4_2_MISC_RX_CLK_1_BCR				114
> +#define GCC_USB4_2_MISC_USB_PIPE_BCR				115
> +#define GCC_USB4_2_MISC_PCIE_PIPE_BCR				116
> +#define GCC_USB4_2_MISC_TMU_BCR					117
> +#define GCC_USB4_2_MISC_SB_IF_BCR				118
> +#define GCC_USB4_2_MISC_HIA_MSTR_BCR				119
> +#define GCC_USB4_2_MISC_AHB_BCR					120
> +#define GCC_USB4_2_MISC_DP0_MAX_PCLK_BCR			121
> +#define GCC_USB4_2_MISC_DP1_MAX_PCLK_BCR			122
> +#define GCC_USB4PHY_PHY_PRIM_BCR				123
> +#define GCC_USB4PHY_PHY_SEC_BCR					124
> +#define GCC_USB4PHY_PHY_TERT_BCR				125
> +
>   #endif
> 
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>


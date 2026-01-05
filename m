Return-Path: <linux-arm-msm+bounces-87516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C709CF44B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B5FB30090EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EDE3043DE;
	Mon,  5 Jan 2026 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BB7rgT5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FDC301717;
	Mon,  5 Jan 2026 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625534; cv=none; b=tvOjLDBamE+LM+Cyg+r9LbcrMJ6fRVFZ6abjqnNIou+JkG0cVvCEIYOgc2bhaF5Y7WPuybAHNBWvEQGFNOyGv4AZ/GRcHil+70dN2lqfTxui/4RR2dSsRm/pCVTsLuslKmTxdjMWE/KL2i3EZnxV6y0BhCcdA+fFgCn8PAczp/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625534; c=relaxed/simple;
	bh=VokVUVEERdlz91oMxNA8BGlACu69lb7fWgD6b+wAZfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5zE29Q528C2RIAnBvmu9JxqbKff2D0uDgvHDllLDV9KC9ptjoCn4iOlnueVE0e9gNXDfEQqz/ywgpfFIfotUkOa6wssVqNVdS1RWOwxMbmPyG4g+tem665qSinOMDw4gRrMHXBlhznG7PSv9PXA8YlSCwIfqMLfwup07WYlvkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BB7rgT5a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC2EC116D0;
	Mon,  5 Jan 2026 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767625533;
	bh=VokVUVEERdlz91oMxNA8BGlACu69lb7fWgD6b+wAZfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BB7rgT5aSiwVC/qhWQ7Z2SCtc/4bWoJ1ZHY3Z6j3+HaYZcuIVHRsJKE99nmysq9z+
	 XCxON+u9grDbxkIX9kEE8jPQFbOY9KxBcEq2jhfC9m5TMLoToweN6xHQTqf0dkFp9f
	 fK+fPncfV5WPvNsuVepTG2/YtrFIYBSj5/8ipgW7nQKiyLLlJBPC96BeglWzVeSqab
	 CYF2kJrZeqbhHjw9csvuJLzajxAVTKPYCrRy/RI9zjIWiXY1dtKzJsDr8adrsttTHf
	 1y8JN/XgUxpXchKxlQHbVs5+0P1tY+iVSkS8JoTdwbQMhR9o3UFx8HTnOndv2JIgDn
	 ohUhKMIAFUkzQ==
Date: Mon, 5 Jan 2026 09:05:30 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: weifu wu <wwfu06@163.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: add Acer Swift SFA14-11 device
 tree
Message-ID: <45ltqw6wiucwssbfxb7juci5kmd64kueqffmeabvjbwsob4sc3@55hbsetdno6w>
References: <20260105110431.2596253-1-wwfu06@163.com>
 <20260105110431.2596253-2-wwfu06@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105110431.2596253-2-wwfu06@163.com>

On Mon, Jan 05, 2026 at 07:04:30PM +0800, weifu wu wrote:
> Add initial device tree for Acer Swift SFA14-11 laptop based on Qualcomm X1E78100 SoC.
> 
> This enables basic peripherals including eDP panel, backlight, USB and PCIe.
> 
> Tested by building dtbs and booting on the target hardware.
> 
> Signed-off-by: weifu wu <wwfu06@163.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1650 +++++++++++++++++
>  2 files changed, 1652 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 76cf0115a00a..d8b4d91dec82 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -326,6 +326,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> +x1e78100-acer-swift-sfa14-11-el2-dtbs  := x1e78100-acer-swift-sfa14-11.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM) += x1e78100-acer-swift-sfa14-11.dtb x1e78100-acer-swift-sfa14-11-el2.dtb
>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb x1e78100-lenovo-thinkpad-t14s-el2.dtb
>  x1e78100-lenovo-thinkpad-t14s-oled-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s-oled.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts b/arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts
[..]
> +	vreg_edp_bl: regulator-edp-bl {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VBL9";
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&edp_bl_reg_en>;
> +
> +		regulator-boot-on;
> +	};
[..]
> +	/* two muxes together support CTIA and OMTP switching */
> +	us_euro_mux_ctrl: mux-controller {
> +		compatible = "gpio-mux";
> +		pinctrl-0 = <&us_euro_hs_sel>;
> +		pinctrl-names = "default";
> +		mux-supply = <&vreg_l16b_2p5>;
> +		#mux-control-cells = <0>;
> +		mux-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	reserved-memory {

Please keep nodes sorted as documented in: https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

(regulator- < reserved-)

Same thing with regulator-edp-bl above, should be down here.

> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};

Regards,
Bjorn


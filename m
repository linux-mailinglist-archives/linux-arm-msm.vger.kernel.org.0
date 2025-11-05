Return-Path: <linux-arm-msm+bounces-80493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD7C38368
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 23:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 708704E1A68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 22:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BFC2EAD10;
	Wed,  5 Nov 2025 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8OUJpKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E12D9EC7;
	Wed,  5 Nov 2025 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762382417; cv=none; b=hofszv+ms2uuJfb3PVm9iLP2eMWWEctNnWqg3mhQck7lvY4S6uxLI+CWB4ApkhkqwaJ5r7Le18/ERGfsXLdM2p2FqGHRLA4qio1Rf4y2+PW+iCVtTPMuAUAww45RS3tLmm8YvvbtlM3stSJ+FId5IL9AHSbzjWynjM9Z95VXLO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762382417; c=relaxed/simple;
	bh=zQ/zGlP6hOr1lsbKgXiHOPLkrv8EU8S/YKErsBAmPZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFGxC9XdqVULO+Hwe8OlSRRvsxVlb9+P7F2s550uzrKMnf8qXLYzmlc1ycenhl664L+lRi4m88HgQzc2n8M+Yr/CI+U8rOmQQFwRqj94HGAbguicLaSxxync5Zipu3P/PPGnojgU3psE3UXJt2s26qvmYjC5cWm7zALXRSyeKm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8OUJpKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28579C4CEF5;
	Wed,  5 Nov 2025 22:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762382416;
	bh=zQ/zGlP6hOr1lsbKgXiHOPLkrv8EU8S/YKErsBAmPZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8OUJpKh+bvQ+cqI6Bcu0s2v2IWhMvVV+A9VlfWLnr542ahHGfXIVnAejH4VYh2p9
	 EAEjCBttqrsQekVYx0gkYdbSSXUuduQnLE3PjJd2iUoMf9DIMGca1TEjxJPuwv1f0R
	 o9hW0MyGtx03XyiUDT7RUVtIjbS7P3irvqA4bvSX2URFpqEErKMAqnF564ZMz4UAY/
	 KACqICu3af2RlSwt0JiKtpqD0LhO/KZ8H/8Pl5ineocAuSBLRY3G0nR2NZagxihLf4
	 cmjphYA41MruRVWRnka8L1cxwCOgdwmc9rNq99QQ8hraJ9nLthtOLSldOIOhEbMY+u
	 YB1w6Kiv67ijQ==
Date: Wed, 5 Nov 2025 16:43:58 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: talos-evk: Add support for
 dual-channel LVDS panel
Message-ID: <p3bd3yfyzuayp7kysri4xf4dpmhhueyy6m5iqkwebigifttwlk@gy6xkodrzrjf>
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
 <20251028061636.724667-2-tessolveupstream@gmail.com>
 <fvtwdsthi242vxxlaqsbvqec4xkduch3fcslwqsjzkz4fidewn@mku374rrwlp7>
 <90185600-c08d-4548-8e66-16d3d0de8765@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90185600-c08d-4548-8e66-16d3d0de8765@gmail.com>

On Fri, Oct 31, 2025 at 02:42:05PM +0530, Tessolve Upstream wrote:
> 
> 
> On 29/10/25 21:18, Bjorn Andersson wrote:
> > On Tue, Oct 28, 2025 at 11:46:36AM +0530, Sudarshan Shetty wrote:
> >> This patch introduces a new device tree for the QCS615 Talos
> > 
> > "This patch" doesn't make sense when you look at the git log once the
> > patch has been accepted, please avoid it.
> > 
> > Please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > 
> > Start your commit message with a "problem description", describe what
> > this LVDS talos is, why it should have it's own dts file etc.
> 
> Okay, will update in next patch.
> > 
> >> EVK platform with dual-channel LVDS display support.
> >>
> >> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
> >> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
> >> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
> >>
> >> where channel-A carries odd pixel and channel-B carries even pixel
> >> on the QCS615 talos evk platform.
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
> >>  arch/arm64/boot/dts/qcom/talos-evk-lvds.dts | 128 ++++++++++++++++++++
> >>  2 files changed, 129 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >> index d5a3dd98137d..6e7b04e67287 100644
> >> --- a/arch/arm64/boot/dts/qcom/Makefile
> >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >> @@ -307,6 +307,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-dsi.dtb
> >> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds.dtb
> >>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> >>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> >> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> >> new file mode 100644
> >> index 000000000000..7ba4ab96ada6
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> >> @@ -0,0 +1,128 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +/dts-v1/;
> >> +#include "talos-evk.dts"
> > 
> > We don't include .dts files, split the existing one in a dtsi and dts
> > file and then include the dtsi here. Or provide provide this as a dtso
> > overlay on top of the dts.
> > 
> > It's not clear to me which is the correct way, because you didn't
> > adequately described how the SN65DSI84 enter the picture. Is it always
> > there, but not part of the standard dip-switch configuration? Or is this
> > some mezzanine?
> > 
> > Regards,
> > Bjorn
> > 
> 
> Thanks for the feedback.
> Currently, the Talos device tree hierarchy is organized as follows:
> 
> talos-som.dtsi — defines SoM-specific interfaces
> talos-evk.dts — adds carrier board (CB) interfaces such as MicroSD, power
> button, and HDMI
> talos-evk-lvds.dts — enables the LVDS display (includes SoM + CB +
> LVDS + disables HDMI)
> 
> The LVDS and HDMI displays share a common DSI output, so only one 
> interface can be active at a time. At present, talos-evk-lvds.dts 
> includes talos-evk.dts directly so that the base SoM and carrier 
> interfaces (e.g., MicroSD, power button) remain available.
> 

Are you saying that there are 2 PCBs involved:
1) The SOM
2) The EVK

And then perhaps a DIP switch or something to disable HDMI and select
LVDS?

Or are you saying there are 3 PCBs:
1) The SOM
2) The EVK
3) Something that provides LVDS - and disables HDMI on the EVK

> However, as you pointed out, including a .dts file directly is not
> recommended upstream. To address this, I am considering the following 
> restructuring options:
> 
> Option 1: Introduce a talos-cb.dtsi
> 
> talos-som.dtsi: SoM-specific interfaces
> talos-cb.dtsi: common carrier board interfaces (MicroSD, power button, etc.)

I'm guessing that what you call "carrier board" most would call "EVK"?

> talos-evk.dts: includes talos-som.dtsi + talos-cb.dtsi + HDMI
> talos-evk-lvds.dts: includes talos-som.dtsi + talos-cb.dtsi + LVDS

Is this an actual thing, or a different configuration?

> 
> This approach avoids including .dts files directly and keeps the carrier
> board interfaces centralized and reusable.It also cleanly separates SoM
> and CB content and is consistent with how other Qualcomm platforms 
> structure their EVK variants.

Can you point to an example where this is done?

The examples that comes to mind is e.g. the vison board/mezzanine. Those
are separate physical things that you plug on top of the other boards,
that's why they are described the way they are.

> 
> Option 2: Move CB interfaces to talos-som.dtsi (disabled by default)
> 
> Move MicroSD, power button, etc., to talos-som.dtsi with status = "disabled";

If those components are physically mounted on the SOM, then that is the
correct thing to do.

If you suggest moving them there to solve some other problem, then it's
not the right solution.

> Enable these interfaces in each top-level DTS (e.g., talos-evk.dts,
> talos-evk-lvds.dts)
> While this also avoids .dts inclusion, it may make the SoM DTS 
> unnecessarily complex and less reusable, as those CB-specific 
> peripherals don’t belong to the SoM hardware.
> 
> Let me know your prepared approach here.

My preferred approach is that you write DeviceTree that matches the
hardware in front of you.

Regards,
Bjorn

> >> +
> >> +/ {
> >> +
> >> +	backlight: backlight {
> >> +		compatible = "gpio-backlight";
> >> +		gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>;
> >> +		default-on;
> >> +	};
> >> +
> >> +	lcd0_pwm_en {
> >> +		compatible = "pwm-gpio";
> >> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
> >> +		pinctrl-0 = <&lcd0_bklt_pwm>;
> >> +		pinctrl-names = "default";
> >> +		#pwm-cells = <3>;
> >> +	};
> >> +
> >> +	panel-lvds {
> >> +		compatible = "auo,g133han01";
> >> +
> >> +		ports {
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +
> >> +			/* LVDS A (Odd pixels) */
> >> +			port@0 {
> >> +				reg = <0>;
> >> +				dual-lvds-odd-pixels;
> >> +
> >> +				lvds_panel_out_a: endpoint {
> >> +					remote-endpoint = <&sn65dsi84_out_a>;
> >> +				};
> >> +			};
> >> +
> >> +			/* LVDS B (Even pixels) */
> >> +			port@1 {
> >> +				reg = <1>;
> >> +				dual-lvds-even-pixels;
> >> +
> >> +				lvds_panel_out_b: endpoint {
> >> +					remote-endpoint = <&sn65dsi84_out_b>;
> >> +				};
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&adv7535 {
> >> +	status = "disabled";
> >> +};
> >> +
> >> +&i2c1 {
> >> +	clock-frequency = <400000>;
> >> +
> >> +	status = "okay";
> >> +
> >> +	sn65dsi84: sn65dsi84@2c {
> >> +		compatible = "ti,sn65dsi84";
> >> +		reg = <0x2c>;
> >> +		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> >> +		ti,dsi-lanes = <4>;
> >> +		ti,lvds-format = "jeida-24";
> >> +		ti,lvds-bpp = <24>;
> >> +
> >> +		ports {
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +
> >> +			port@0 {
> >> +				reg = <0>;
> >> +
> >> +				sn65dsi84_in: endpoint {
> >> +					data-lanes = <0 1 2 3>;
> >> +					remote-endpoint = <&mdss_dsi0_out>;
> >> +				};
> >> +			};
> >> +
> >> +			port@2 {
> >> +				reg = <2>;
> >> +
> >> +				sn65dsi84_out_a: endpoint {
> >> +					data-lanes = <0 1 2 3>;
> >> +					remote-endpoint = <&lvds_panel_out_a>;
> >> +				};
> >> +			};
> >> +
> >> +			port@3 {
> >> +				reg = <3>;
> >> +
> >> +				sn65dsi84_out_b: endpoint {
> >> +					data-lanes = <0 1 2 3>;
> >> +					remote-endpoint = <&lvds_panel_out_b>;
> >> +				};
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&mdss_dsi0 {
> >> +	vdda-supply = <&vreg_l11a>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0_out {
> >> +	remote-endpoint = <&sn65dsi84_in>;
> >> +	data-lanes = <0 1 2 3>;
> >> +};
> >> +
> >> +&tlmm {
> >> +	lcd0_bklt_en: lcd0-bklt-en-state {
> >> +		pins = "gpio115";
> >> +		function = "gpio";
> >> +		bias-disable;
> >> +	};
> >> +
> >> +	lcd0_bklt_pwm: lcd0-bklt-pwm-state {
> >> +		pins = "gpio59";
> >> +		function = "gpio";
> >> +		bias-disable;
> >> +	};
> >> +};
> >> -- 
> >> 2.34.1
> >>
> 


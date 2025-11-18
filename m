Return-Path: <linux-arm-msm+bounces-82359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5AAC6A4B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E0EC382B78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF9F3659F4;
	Tue, 18 Nov 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEGqbE2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C4365A0B;
	Tue, 18 Nov 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763479528; cv=none; b=YAwwRnxl5f7LdZJdENCypJigBeSTjjKdHfHlRBsjSUwHLA/bDPmaz9kikJukonf9UvTSoC0WvvlxAu9RBlshbMu7OXXsilbOsFIf2p2U+yCQXcJmTOkBr403+AGZfYJ+7+FGYJsi5/eyNjHBh75LgkJMuXDAudihCqOSQPeO6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763479528; c=relaxed/simple;
	bh=iRQW16mVl17RYqJUHeQTnxBKHlFKrmbwdunuW0U3P+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3qzei18IohQNTXQtT3Cx/ma3/k8E0O2VBhzMvwZj072Q6cLszAl6f0pchrse384r227TJ5kj/1WslIJ7+lB2ODQCez1c3rFBkXv+xK5zMsV6lzobNjvNZ0S/ITn46gK/D9IPsbwHJ7BQMVaSANbq0tWkb9GCVWaVn6ChOhatdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEGqbE2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131B7C116B1;
	Tue, 18 Nov 2025 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763479527;
	bh=iRQW16mVl17RYqJUHeQTnxBKHlFKrmbwdunuW0U3P+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEGqbE2Ha/Ej6UBqkYj02IYRz875R4MJ1sfVKbl127+Bf5GFKIVAoV4v/3OF6L+nU
	 BGw1yogZHBcDnVbjhLlzQOVhXsloieZ3SdIvtDO1u5JU+oGIsM/2rKSFokz8HLrAXP
	 azovQVpQYTxKd1OEU2x8KCErhUQ8pz2TLEpgAMm+j9opLVrzb1uBxtOh0AetVMSB9U
	 njblBmY6NJv4htLEtwyyZwN4Z0MO3dNcTXmL4utXEgmG9MjQ9NFzuYUHbEZDb8laiR
	 jqjBUIwDsuSbYQlI/ho2e30GqA8WLVOInYMTC/zA/qAmvPDFDnAdq6aOrOZwOA37NK
	 qKT2syN0U2/dg==
Date: Tue, 18 Nov 2025 09:30:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <w6tcgrn7dio3vmygcyhkofg6ie773dppxnk7f3v2kr6rqdufwz@klpqzkojfitk>
References: <20251118130814.3554333-1-tessolveupstream@gmail.com>
 <20251118130814.3554333-3-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118130814.3554333-3-tessolveupstream@gmail.com>

On Tue, Nov 18, 2025 at 06:38:14PM +0530, Sudarshan Shetty wrote:
> Add the device tree for the QCS615-based Talos EVK platform. The
> platform is composed of a System-on-Module following the SMARC
> standard, and a Carrier Board.
> 
> The Carrier Board supports several display configurations, HDMI and
> LVDS. Both configurations use the same base hardware, with the display
> selection controlled by a DIP switch.
> 
> To avoid duplication, use an include file, talos-evk-cb.dtsi, which
> defines the interfaces and peripherals common to both display
> variants. Two additional DTs (e.g. talos-evk and talos-evk-lvds)
> can describe the selected display configuration.
> 
> The initial device tree includes support for:
> - CPU and memory
> - UART
> - GPIOs
> - Regulators
> - PMIC
> - Early console
> - AT24MAC602 EEPROM
> - MCP2515 SPI to CAN
> - ADV7535 DSI-to-HDMI bridge
> - DisplayPort interface
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi  |  56 +++
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 447 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  94 ++++
>  4 files changed, 598 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5b52f9e4e5f3..282d744acd73 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -305,6 +305,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi

I might have missed where you replied to any of my questions. But I
still believe this file represents the Talos EVK - that is, the "Talos
SOM" + the "Talos EVK Carrier board".

> new file mode 100644
> index 000000000000..81d15ee4f366
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "talos-evk-som.dtsi"

Here this file stops being just a definition of the "carrier board",
it's now the whole EVK.

As such, this file should be called "talos-evk".

We now have two options:

1) talos-som.dtsi + talos-evk.dts + talos-evk-lvds-auo,g133han01.dtso

   We describe the SOM, we describe the "standard configuration" of the
   EVK, and we have an overlay example that disabled the HDMI portions
   and adds LVDS and the specific panel.


2) talos-som.dtsi + talos-evk.dtsi + talos-evk-hdmi.dts +
   talos-evk-lvds.dts + talos-evk-lvds-auo,g133han01.dtso

   We avoid describing HDMI, just to remove it again in the overlay.


#2 would scale better if we have a lot of these boards, but unless we
expect a lot of different boards/combinations I don't think there's much
value in it.


Please let me know if my assumptions are wrong, but for now I think #1
is the correct choice.

In either case, you should include the LVDS support in this same patch
series, so that we have all the parts that we're discussing in front of
us.

> +
> +/ {
> +	model = "Qualcomm QCS615 IQ 615 EVK";
> +	compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
> +	chassis-type = "embedded";
> +
[..]
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
[..]
> +&mdss_dp0_out {
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> +	remote-endpoint = <&dp0_connector_in>;

Don't we need/want a data-lanes property here as well?

> +};
> +

The rest of the patch looks good to me.

Regards,
Bjorn


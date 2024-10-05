Return-Path: <linux-arm-msm+bounces-33163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 979F9991395
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 02:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25031C21B37
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 00:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2BD3FD4;
	Sat,  5 Oct 2024 00:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecIY4E+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD4139B;
	Sat,  5 Oct 2024 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728089147; cv=none; b=lgvkxgRYHH9ZWO8I8M+w4wdALfxVifwOwXsKdo5CnYeEflXd8rL1YM9YrJ1TlX4+Pb+D/UJRX+8EHPN0XB3fTf5P2hGLatYX2WIW7a5fmR9FHD1O5dZu3GPhQGPW92e3swMRby8KopCZt/zOiw2ilLXrU/mMtY1N5TL4wN9F92o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728089147; c=relaxed/simple;
	bh=3aDSjqczUa2eG9JCIiEsFfROkl//7/vTr2RrvH3ccDM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=mhizrznAX4kPrNnzUHbsu1+Xbj1TPc8jc/g/ljbv+Dmjp5aZyCTaReHHhF8amnXglYOSAgEbfpnJPaCh1TDky0R3P50Gum2KBkl6/XXJL/yBJ5FiKgThMbZTrEYZt41ksQr8iiHh6YI8Cy1q6Tzv/clVuJ1aWjF/hapLytFNWuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecIY4E+j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD99C4CEC6;
	Sat,  5 Oct 2024 00:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728089146;
	bh=3aDSjqczUa2eG9JCIiEsFfROkl//7/vTr2RrvH3ccDM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ecIY4E+jHb6ugfa4jKhhpurg/lE1SlDhCK6Ccv8O+EUFzn689FYcoR98dcJoWTJ/a
	 NRb1uXT8p1+t9IuXFR+lN5k+oUmabkuuY29KPT7YbC4ypDHg7fS+0SS5DIt7Oopp3I
	 Awf92Xl3NDM4mjbLS0CPmSq5OxtS7CIL6rVB9G+kCpmmaoa2OpZcD+uCO7gPONQ+FT
	 uPWglMa12LFyrZ1HISQvnc8s+lwmaPihmcgP+rySQm0qNANLfkoSjst5giSRCmuZR4
	 0ubGsTAjlEbx13Bv/vafE6jkGPZFsvb36q4ASV9biBlVRy4N7Gng7NMIjISg+qCLjL
	 NRTpjLqFChWEQ==
Date: Fri, 04 Oct 2024 19:45:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: devicetree@vger.kernel.org, peterdekraker@umito.nl, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bryan.Kemp@dell.com, 
 tudor.laurentiu.oss@gmail.com, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, robdclark@gmail.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20241003211139.9296-1-alex.vinarskis@gmail.com>
References: <20241003211139.9296-1-alex.vinarskis@gmail.com>
Message-Id: <172808887733.121424.1299151912846511014.robh@kernel.org>
Subject: Re: [PATCH v4 0/3] X1E Dell XPS 9345 support


On Thu, 03 Oct 2024 23:10:06 +0200, Aleksandrs Vinarskis wrote:
> Introduce support for the mentioned laptop.
> 
> Very similar to other X1E laptops, device tree was derived by analyzing dtsi of
> existing models and ACPI tables of this laptop [1]. Most notable difference were
> * TZ protected SPI19.
> * Keyboard only working after suspend/resume sequence, will do a follow up patch
> to i2c-hid.
> * Lots of small deviations in LDOs voltages.
> 
> Successfully tested with Debian 12 and Gnome. Firmware for GPU/aDSP/cDSP was
> extracted from Windows, WiFi firmware from upstream linux-firmware.
> 
> Quite a few things alraedy work, details in patches, quite a few still in WIP or
> TODOs. Since fixing these may take me a while due to lack of documentation,
> sending current progress as its very much usable.
> 
> [1] https://github.com/aarch64-laptops/build/blob/master/misc/dell-xps-9345/acpi/DSDT.dsl
> 
> --------
> 
> Changes to V3:
> * Rename device from `tributo-13` to `xps13-9345`
> * Update commit description - identify EC over i2c, likely camera model
> * Update cover letter - no hacks needed when build on top of linux-next
> * v3 link: https://lore.kernel.org/all/20240927094544.6966-1-alex.vinarskis@gmail.com/
> 
> --------
> 
> Changes to V2:
> * Fix uart21 missing alias
> * Fix redundant mdss_dp3 defines
> * Fix touchscreen i2c address
> * Update commit description - OLED panel reported working
> * Update commit description - touchscreen reported working
> * Update commit description - battery info reported working
> * Update commit description - add keyboard patches link
> * v2 link: https://lore.kernel.org/all/20240921163455.12577-1-alex.vinarskis@gmail.com/
> 
> --------
> 
> Changes to V1:
> * Fix misalignments due to wrong tab/space conversion
> * Fix regulator namings
> * Fix reasonable warnings from `scripts/checkpatch.pl`
> * Restructure all (sub)nodes alphabetically
> * v1 link: https://lore.kernel.org/all/20240919170018.13672-1-alex.vinarskis@gmail.com/
> 
> Aleksandrs Vinarskis (3):
>   dt-bindings: arm: qcom: Add Dell XPS 13 9345
>   firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
>   arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 863 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              |   1 +
>  4 files changed, 866 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-dell-xps13-9345.dtb' for 20241003211139.9296-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#







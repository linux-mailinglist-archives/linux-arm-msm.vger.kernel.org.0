Return-Path: <linux-arm-msm+bounces-32030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0638B97CD80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 20:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 399591C2220E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 18:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE552225DA;
	Thu, 19 Sep 2024 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eymn/A0k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906EB2135B;
	Thu, 19 Sep 2024 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726769917; cv=none; b=V2+2RJOFgkc+mqtWxwDIN6Sz9k8apzy4aev4r75ovzEDHAhrVmAhJS6K68oy5wNW45hCSdRR8LaxikmetStCMFQOKX5k8pHg3ZW3ifZckFVFJuc9j+nLFaDKGF0waeeYssYlRuyPvmhgToPxc4ACOoeY/cNhw3k2UGArDmWobFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726769917; c=relaxed/simple;
	bh=2HYTLAuWIIiS7gziRBIjfRq23M96swliUqb3niDxuL0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=km8Pm3GQD1TY7xYi0EosSQQwCElS8A2FnWiGKHgjbO1tHQYlLig6+DopoAkGkWJBypjsrbG9zgEIcDcSAfwmvGuJemxmbOFulhtUJCxTq2EnQYTQR+e12DMGY72MfOI5FcbWqkjfdhZ3LgxMnWHeO32XKFCL2rE3+NXFc1H+WAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eymn/A0k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4E6C4CEC4;
	Thu, 19 Sep 2024 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726769917;
	bh=2HYTLAuWIIiS7gziRBIjfRq23M96swliUqb3niDxuL0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Eymn/A0k+Z8AqYMCAgFcZY5cLiBMg66nYmdi8QIU/opMipziA/Sjb3/xEJyNIy54w
	 5uXPMLksV2H3c/5LRx+CoUVCAVFfCX29CzUtGLP7KttwHLJXZZ/KEbJD97W0swwx70
	 wLmzXWvf5CRHDg44LAp0tpc5+Hq3es66Eoji6bSTbbUgzRxJ16+t3pFhQF2CHsxuL1
	 5Sso2gcNh4hsrYQ1S36p5tX93VpXJaHKpemsIUqI3kT16G7ZbYBsAuzyafIQaH7TgR
	 T7IYmWUdjNj+MALm9bU+G47I93/wtNuqMZT8FMLWtrG0aOEqr++36zca2Aobz8tAN1
	 GXaXWWC2DKrSg==
Date: Thu, 19 Sep 2024 13:18:35 -0500
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
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20240919170018.13672-1-alex.vinarskis@gmail.com>
References: <20240919170018.13672-1-alex.vinarskis@gmail.com>
Message-Id: <172676985197.765618.17726985689014014506.robh@kernel.org>
Subject: Re: [PATCH v1 0/3] X1E Dell XPS 9345 support


On Thu, 19 Sep 2024 18:59:31 +0200, Aleksandrs Vinarskis wrote:
> Introduce support for the mentioned laptop.
> 
> Very similar to other X1E laptops, device tree was derived by analyzing dtsi of
> existing models and ACPI tables of this laptop [1]. Most notable difference were
> * TZ protected SPI19.
> * Keyboard only working after suspend/resume sequence, will do a follow up patch
> to i2c-hid.
> * Lots of small deviations in LDOs voltages.
> 
> Successfully tested with Debian 12 and Gnome, although this required additional
> patches, namely harcode GPU chipid, apply [2] and _revert_ [3] - same as in Abel
> Vesa's branches. Without last two the boot process is terminated by TZ. Firmware
> for GPU/aDSP/cDSP was extracted from Windows, WiFi firmware from upstream
> linux-firmware.
> 
> Quite a few things alraedy work, details in patches, quite a few still in WIP or
> TODOs. Since fixing these may take me a while due to lack of documentation,
> sending current progress as its very much usable.
> 
> [1] https://github.com/aarch64-laptops/build/blob/master/misc/dell-xps-9345/acpi/DSDT.dsl
> [2] https://lore.kernel.org/all/20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org/
> [3] https://lore.kernel.org/all/20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org/
> 
> Aleksandrs Vinarskis (3):
>   dt-bindings: arm: qcom: Add Dell XPS 13 9345
>   firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
>   arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              |   1 +
>  4 files changed, 863 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
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


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-dell-tributo-13.dtb' for 20240919170018.13672-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#







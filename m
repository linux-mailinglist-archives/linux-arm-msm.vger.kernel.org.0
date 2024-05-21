Return-Path: <linux-arm-msm+bounces-20134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD62E8CAEA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 14:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 838DC284AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 12:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFFB770E2;
	Tue, 21 May 2024 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMMqfNwm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7721E48B;
	Tue, 21 May 2024 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716296035; cv=none; b=OwRFRQ1u4xV9SwQ+k1PIozf09/wm3iF6wlFDAsgBNb/IWeyu/knDj91Z+0Eu6RvhHOFOkF6vdq9HDIMGenCgLCHbvefK+0tJdsU3qcL7sDrtsl8atiAYwO1QMqImHtYiaLxlfHDGaM4CVAYUehSjKhsZ2Um8SLe6TtgEj1Qp02Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716296035; c=relaxed/simple;
	bh=t42l+EO81yioHSqdPuYy8/rBjxnMw7vLCdtonq47xpE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=q53rrJihxpFGZtb8xT9IxK+V8UmbGGYz5vIDS8Pjy02k0ADuOE9/6O1E8D8F/XaqWZaJbX6lK6OsKg18dUCUb37TNPQ9nOc90fqNjKVV3H2/cQybhN/eJ8QBXdS+iAKeDDYGS1ESr7ONxxOAupwe6stPMwQ3Gns/MLwlXjlCRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMMqfNwm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA1CC2BD11;
	Tue, 21 May 2024 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716296034;
	bh=t42l+EO81yioHSqdPuYy8/rBjxnMw7vLCdtonq47xpE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mMMqfNwmRyJ6amChqv8kyauIlBe2NJc56HzoFhuaPbckWeygt/a/YpnCFoGDyopkA
	 8PIzkxkw1xES342kDoW0KtBSNBXLbOwobeqZFNHfb/Ik6hZ+M3nYOajHP+KgFESqNy
	 gpDu2qwxS7qjH3XJ/fmrkNTlkwW9knyIBBNJdHufT7HksLCIERn/xmTcVgdlKRq9vF
	 0HetZ0yy83Vp8Q8RzatDxhVkvYLPKC8cz9uLxHOdsP3WMjMoiiM4/mKINrh3G5EjYR
	 4QVNoX8L4QIfGC6o0m8Op6BRpS+e0YqHrIHDMtJWUAT2QlB3VntOMobdIoqDBupzI4
	 HmAcXbtmaKUXw==
Date: Tue, 21 May 2024 07:53:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
In-Reply-To: <20240520-otter-bringup-v2-0-d717d1dab6b8@linaro.org>
References: <20240520-otter-bringup-v2-0-d717d1dab6b8@linaro.org>
Message-Id: <171629597652.3545832.2165714141282112448.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] qcom: initial support for the SHIFTphone 8


On Mon, 20 May 2024 17:29:40 +0200, Caleb Connolly wrote:
> The SHIFTphone 8 is an upcoming QCM6490 smartphone, it has the following
> features:
> 
> * 12GB of RAM, 512GB UFS storage
> * 1080p display.
> * Hardware kill switches for cameras and microphones
> * UART access via type-c SBU pins (enabled by an internal switch)
> 
> Initial support includes:
> 
> * Framebuffer display
> * UFS and sdcard storage
> * Battery monitoring and USB role switching via pmic glink
> * Bluetooth
> * Thermals
> 
> Wifi works but requires some commits to be reverted to prevent a
> firmware crash.
> 
> The serial port on the device can be accessed via the usb-cereal
> adapter, it must first be enabled by flipping the switch under the
> display. Additional info can be found on the postmarketOS wiki page.
> 
> https://wiki.postmarketos.org/wiki/SHIFT_SHIFTphone_8_(shift-otter)
> 
> ---
> Changes in v2:
> - Fix authorship
> - Address Luca's feedback
> - Link to v1: https://lore.kernel.org/r/20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org
> 
> ---
> Caleb Connolly (2):
>       dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
>       arm64: dts: qcom: add QCM6490 SHIFTphone 8
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 923 +++++++++++++++++++++++
>  3 files changed, 925 insertions(+)
> ---
> change-id: 20240507-otter-bringup-388cf3aa7ca5
> base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
> 
> // Caleb (they/them)
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


New warnings running 'make CHECK_DTBS=y qcom/qcm6490-shift-otter.dtb' for 20240520-otter-bringup-v2-0-d717d1dab6b8@linaro.org:

arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c08000: interrupt-names:0: 'msi' was expected
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: phy@88e3000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: usb@8cf8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: video-codec@aa00000: iommus: [[65, 8576, 32]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-venus.yaml#







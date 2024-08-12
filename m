Return-Path: <linux-arm-msm+bounces-28331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B494F15B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 17:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2084A2822BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 15:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4BA18629C;
	Mon, 12 Aug 2024 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="En8kdE5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938C3186287;
	Mon, 12 Aug 2024 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723475378; cv=none; b=Dcg55KPV2cLySCCKFxpkzwx9jXM2G3it9ncLxq4JBni0fMB0SnjQBX0BD9yUfuIRdZ53OxY4b7uKkGfWuK1bLVLQcPs9Ghk83uOdgNAit5zvHa/0fm11b8AjCcAZAIKKeLagFmgGgBFz4KKnjqwFT8pEQmCiXcEjzOfycgWXQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723475378; c=relaxed/simple;
	bh=0zeN1e7pfq9rhQqsjIKeuo9qUTg4rSG2IX8OKPQGTkw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=gBLOZm4ToZ57V7Dx4+mhnXqq2Si422yMQdcTtT1tYO8KsCk5xX6K97p/9/s7LAF7YFeYsbzVwa4nrTJ8aGYlzuS8stl4+SaidffzXPoD43iVfUAvW207BrukAasXnG7GtyePJGKSKwfsGtv0ZykMFLE5AoASxCYzgYJSiJdvViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=En8kdE5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229D5C4AF0F;
	Mon, 12 Aug 2024 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723475378;
	bh=0zeN1e7pfq9rhQqsjIKeuo9qUTg4rSG2IX8OKPQGTkw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=En8kdE5p7zbw1MqKsSN5FCM25qmPKazxE3GtxuIcBTmsuB7Ovz9DGfyJK8x1OsUsl
	 asdNpwuX02bcF+46+dXO2dSZceIJ65foCD58kgwHUZ7ozSaGsIT9BazC1ORNOI4m+o
	 G5E1QwG+RUINRpxbxt4Ijy60/0pZNQ9Q8k4tQa7XupzMPSAmVrIXq/4aaQItDVBbBe
	 uZgAGuUIUWHp9+Lc/o/zPmuMiwn139J8yTiRtG9QK4wKKAdfgOilz8mgQn/uA2o2Pz
	 ZioKS7SmfA8jmKEozE6itdS20QeF/j9q1ZyJi/D6yQDNmDJmAhlrD884iP1rhF+7Mb
	 iOwwW8JEVto+g==
Date: Mon, 12 Aug 2024 09:09:36 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
References: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
Message-Id: <172347514203.603234.10533034377904329406.robh@kernel.org>
Subject: Re: [PATCH 0/4] X1E Surface Laptop 7 support


On Fri, 09 Aug 2024 03:43:19 +0200, Konrad Dybcio wrote:
> This series brings support for X Elite-based Surface Laptop 7 devices.
> 
> See patch 4 for a more detailed status explanation
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
> Konrad Dybcio (4):
>       dt-bindings: arm: qcom: Add Surface Laptop 7 devices
>       firmware: qcom: scm: Allow QSEECOM on Surface Laptop 7 models
>       arm64: dts: qcom: x1e80100: Add UART2
>       arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 818 +++++++++++++++++++++
>  .../boot/dts/qcom/x1e80100-microsoft-romulus13.dts |  13 +
>  .../boot/dts/qcom/x1e80100-microsoft-romulus15.dts |  13 +
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |   8 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  52 ++
>  drivers/firmware/qcom/qcom_scm.c                   |   2 +
>  8 files changed, 910 insertions(+)
> ---
> base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
> change-id: 20240809-topic-sl7-db3eef0ada6d
> 
> Best regards,
> --
> Konrad Dybcio <quic_kdybcio@quicinc.com>
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


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-microsoft-romulus13.dtb qcom/x1e80100-microsoft-romulus15.dtb' for 20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com:

arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#







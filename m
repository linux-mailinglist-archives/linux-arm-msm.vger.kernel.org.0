Return-Path: <linux-arm-msm+bounces-62100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F18AE4915
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 17:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C437A3A2188
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 15:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBC125F98E;
	Mon, 23 Jun 2025 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDYCh5y1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807533D994;
	Mon, 23 Jun 2025 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693588; cv=none; b=k8u92AFMPZ42jsGu4SkHEhIifv7DSWSILzfIpI+whZBudArm4ZDn+lkYgTB8p0FU+vSRgmzn+uBFgt33Mox7c6I4YMrc9od6MdkeAryCRwfZHKBt09mS2mPWID/HM8mKaOlYlTJRE9l3uX6i/putxYXT9PviYczcRz2fH932d2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693588; c=relaxed/simple;
	bh=w/l6L6hU5FHxVqXs8auOKsE8vW000g2m20hcmDTlaS4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eDEz+7/FbVQZEV+Yd+79N0aUhaDyNtZyinu1Ru9gie8NsV5JZ2MGb5lmK+VFsReOvAdYcdvlsvcUMWY4VQIoXybjpxfOVA8PDeG0KaGcgBFBFXkcgcrKIFW4Y/YfQeI9AP4AvbeQY2kSDvc0HVSWLdkhqQlrp0ITxXoGMXtz2Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDYCh5y1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED43C4CEEA;
	Mon, 23 Jun 2025 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750693588;
	bh=w/l6L6hU5FHxVqXs8auOKsE8vW000g2m20hcmDTlaS4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TDYCh5y1PNN/APVI70QJMhg3IPnPWxtnrNMNT3jyMDmhR29ZFj7kPz6El99a8Zk39
	 FokW8n/W5AuT8gt1CDPoabH0V37G1+A2TAN89zwcj3SO46RCaQu/6g8TVLYP+M3VlM
	 CZbI+Y5KoeOk6VAMmRlzP18A+rg/rfMEDZp7rZFF19c4zpK0AwRGrNgDShwqbMvSNX
	 7HdsfKABsdhNrPTPnaurf1p0riOeMOsg8n5vSQQhWHDzJr21bJ91FmMjYAxqZt2Z6U
	 /E4F46TuJgvLxkyCrt1ENlr/91n0qnZJuMeq/xUrrOzox0dlMqRY9T03EzqMYFDa2p
	 sIDdc/kEAICCA==
Date: Mon, 23 Jun 2025 10:46:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 kernel@oss.qualcomm.com, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
Message-Id: <175069348269.3797007.5540625905808833666.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add support for IQ-8275-evk board


On Mon, 23 Jun 2025 18:34:18 +0530, Umang Chheda wrote:
> This series:
> 
> Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.
> 
> QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
> which has safety features, it doesn't have safety features which
> affects thermal management.
> 
> IQ8 EVK board is a single board computer (SBC) that supports various
> industrial applications, including factory automation, industrial
> robots, drones, edge AI boxes, machine vision, autonomous mobile
> robots (AMRs), and industrial gateways.
> 
> Below are detailed informations on IQ-8275-evk HW:
> ------------------------------------------------------
> QCS8275 SOM is stacked on top of IQ-8275-evk board.
> On top of IQ-8275-evk board additional mezzanine boards can be stacked
> in future.
> IQ-8275-evk is single board supporting these peripherals:
>   - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>     eMMC on mezzanine card
>   - Audio/Video, Camera & Display ports
>   - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
>   - PCIe ports
>   - USB & UART ports
> 
> Currently basic features like DSPs, UFS and 'boot to shell' via
> uart console are enabled.
> 
> Umang Chheda (2):
>   dt-bindings: arm: qcom: Add bindings for IQ8 EVK board
>   arm64: dts: qcom: Add support for QCS8275 IQ8 EVK
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
>  3 files changed, 249 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
> 
> --
> 2.25.1
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc1-5-g700a4c3f95a3 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250623130420.3981916-1-umang.chheda@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#







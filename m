Return-Path: <linux-arm-msm+bounces-33443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F99993677
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 042561F2216E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286241DE2CF;
	Mon,  7 Oct 2024 18:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WePkZ1N1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0A1DE2C9;
	Mon,  7 Oct 2024 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326677; cv=none; b=qBe/Ecwzk3XANSMA0sAAeqkz9gKNCQ4B8cRIK0/pKB/1H/kF9nalfb+qYkS0HoiVdxYojDlxcj4uDsXQKlzLP5N+iaCKtSwU806bB0561AdMCAcNsini38jwThQlglsMu/8FHdikZMnfNJFwRsFRWMAbPnIc5qH3lJUewpHC83I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326677; c=relaxed/simple;
	bh=CS9oGBmTHkaXaGYru+300UwHGHTlTNW1/uBaaO9MDv0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Yc2wxLoddsAwK+ZlYMrs48R6CVtm/KH4ozGqc1AfhCIUQ02JtLHWeeWHm74DUi+98SUUHrTsJjGjFL04B1Sia818pfwi0XG+KC2vOIkPAIPAkUBQfkmPZivXWsVHOp7nLH6x9PoTASPR1cxKoR5mqorrqpv89tyTaezn/bs6Jf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WePkZ1N1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BD7C4CEC6;
	Mon,  7 Oct 2024 18:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728326676;
	bh=CS9oGBmTHkaXaGYru+300UwHGHTlTNW1/uBaaO9MDv0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=WePkZ1N1g++dfrgJoBiGAxFc2WyRCQzeFVFXRO5IFE/UuEsDqIVeJ3yxYSOJ4nbQ2
	 66gf77asow/u7BY4cCNHsp8ZR/5TewFDygfx95LZ7dk2SpPIzCx3TWvYbXwGKafMKy
	 +uMV055hNGtmoboDBY8qFaV85+qixgxHUG5aJhJuZ6BAgy+BVQ+p3DBp780G1MK6Oz
	 5xOxKj1yGrMl95nPCq2Pm7ydxWtb6lKbxIWqpillSSut5X5TvxBYivwCEgZXpblKJO
	 HiiPEbciyE4HnaheOLVN6KpT+RonxfMgDuGMbeqFfBnLvLA3CkTkjc9RiuoLBTMalT
	 EciMKjau/QmNQ==
Date: Mon, 07 Oct 2024 13:44:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@linaro.org, konradybcio@kernel.org, 
 dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
 abel.vesa@linaro.org, quic_jjohnson@quicinc.com, devicetree@vger.kernel.org, 
 andersson@kernel.org, robh+dt@kernel.org
In-Reply-To: <20241005182250.788272-1-quic_sibis@quicinc.com>
References: <20241005182250.788272-1-quic_sibis@quicinc.com>
Message-Id: <172832632763.2106966.932778941338368937.robh@kernel.org>
Subject: Re: [PATCH V2 0/2] X1E001DE Snapdragon Devkit for Windows


On Sat, 05 Oct 2024 23:52:48 +0530, Sibi Sankar wrote:
> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
> is the speed binned variant of X1E80100 that supports turbo boost up to
> 4.3 Ghz. The initial support includes the following:
> 
> -DSPs
> -Ethernet (RTL8125BG) over the pcie 5 instance.
> -NVme
> -Wifi
> -USB-C ports
> 
> V2:
> * Fix Ghz -> GHz  [Jeff]
> * Pick up Ab tag from Rob.
> * Use Vendor in ADSP/CDSP firmware path [Dmitry]
> * Fix reserved gpios [Dmitry]
> * Only port0 supports DRD update the dt accordingly [Dmitry]
> 
> Link: https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerates-development-for-copilot--pcs-with-snapdrago
> 
> Sibi Sankar (2):
>   dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
>   arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   6 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 811 ++++++++++++++++++
>  3 files changed, 818 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y qcom/x1e001de-devkit.dtb' for 20241005182250.788272-1-quic_sibis@quicinc.com:

arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#







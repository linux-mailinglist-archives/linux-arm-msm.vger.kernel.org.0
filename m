Return-Path: <linux-arm-msm+bounces-81431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D6DC52AAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D46B500161
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C131026ED31;
	Wed, 12 Nov 2025 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVK16Lgu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9222F26D4D4;
	Wed, 12 Nov 2025 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955806; cv=none; b=i6m0teC4p3Ltr70z+yBX+UCS10WoFOG/xYHON93RDS6wRht7dKV3DeUWOLsbRN/PR4MmtOTVd8MrtJxA5f3FH+Mxjayq9lykPzAJZ8IN02iNAqWcZBw+aUd/4s0mNHhMfwduvRTTsIxGMXCLhGxZT/GyNzKhtzIc8RJuluRoJCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955806; c=relaxed/simple;
	bh=9VysWk+Q/2Wk/gqHBbWZCfUFWziKZ/B3UYPT/bITXRw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Xmv8MrZ9ONS7rJ0ZevDy0BKvqJ3se51GGq6ZFW1vUAoWKllHdWMBPuz2J9w7tf2H84btkqu0xI63JCdlewoEr818whJPnttSIS7pJiLgTyJweKGravXQJjwxWuzyO7+ERGIelo/P5225jq4VyPNLZUKq5r5L1+2NYJSfX2Tn/ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVK16Lgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F83C2BC86;
	Wed, 12 Nov 2025 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762955806;
	bh=9VysWk+Q/2Wk/gqHBbWZCfUFWziKZ/B3UYPT/bITXRw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oVK16LguOIh3nM/IjAS2+FfLBtYxyb+Ec5hDE1IAjfdOhXAokx3AWF/sAx47lOeis
	 aGw3yBTMCiUZFjFDATgg/4FhejRYnycUHJvpauZ/GQ1R4NVZXyolGRfKx9wyaYmDsA
	 ijKENPpy4CpKfAed3DAd+WrKUUQOpNJL+8jHCqhCicDIBLIV/upWcuTRvi8j6h59ii
	 9dR5T5Wj+U78o7EwfhvzsdzaSVyFu2dF26ATjnDa9DYjnUan7PVfPxiPUJ8bv0y2dd
	 XUifwrN94gD/cXwuboA3ONAOvrpaK7CJEfQiaZGxFifdmGZN9pDw1U79J3MT+AaxNW
	 dvHUH837GuXWA==
Date: Wed, 12 Nov 2025 07:56:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
Message-Id: <176295563376.1637834.15728252609575729805.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: add AP8096SG variant of DB820c


On Tue, 11 Nov 2025 18:02:50 +0200, Dmitry Baryshkov wrote:
> While debugging a crash in the DRM CI setup I noticed that the kernel
> warns about the unsupported hardware in CPU OPP tables. After a small
> research I found that board indeed uses APQ8096SG rather than APQ8096.
> Add DT file for these boards.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       dt-bindings: arm: qcom: add Dragonboard 820c using APQ8096SG SoC
>       arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 1126 +-------------------
>  .../{apq8096-db820c.dts => apq8096-db820c.dtsi}    |    5 -
>  arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts      |   15 +
>  5 files changed, 24 insertions(+), 1130 deletions(-)
> ---
> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> change-id: 20251111-db820c-pro-8ecd2a28520e
> 
> Best regards,
> --
> With best wishes
> Dmitry
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
 Base: ab40c92c74c6b0c611c89516794502b3a3173966 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@76f8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml







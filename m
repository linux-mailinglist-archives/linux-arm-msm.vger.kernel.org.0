Return-Path: <linux-arm-msm+bounces-30731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2D96BEAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 15:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B85171F25826
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54C21DC041;
	Wed,  4 Sep 2024 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrRlqAp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE841DA0E5;
	Wed,  4 Sep 2024 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725457006; cv=none; b=Vu7B3XZ4n/2Di8/d5Zb9Ac2WkmKGDvcLTgLrj3Be148GQYx4xPHFHDgVp70j+sWBlUs/gg70bayAB43r50PddtEqOP16qLRhoZzdonJcLNc5+Ie8YoGAz6XW/1SNajpLILxYNX0/Wt69RfOmTSrQg/OPpyk8ubT0xFJ6gjeoK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725457006; c=relaxed/simple;
	bh=DAx5yaNxbupsPmRr61ahZAIGEMX7CidLtwjScbEGCBM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=oI671fCMtyzesAnyUwZGZYgIGM7TY3KeAksUiAQpTzKvjBv+HgmbHgHbJVoJ1IZ7KKR53IK+j8N1az8HcPkDC+xtpvVapZoEGYL6cO95z5yyKA9XFwDCk2NWbX89jzg13XWDPyYDT/akxvMtkCPygNyf9a5kcbtNQB6iZK9IRO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrRlqAp/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E85C4CEC9;
	Wed,  4 Sep 2024 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725457006;
	bh=DAx5yaNxbupsPmRr61ahZAIGEMX7CidLtwjScbEGCBM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NrRlqAp/WFW+Oq2Ftat/A2P8I1VySWc85QHUUoRUcxYL6PjJDrjDiTnbz6SC+JAkF
	 o2n5WIxMXEyHcUxt3OIAO5ohHONiBmIn5Kq/jM5y3eDMeHESG5z4lme87AN560brTX
	 olb47aVkGd5yy7sYy1hxyzAQ25am23pF20/VdhUnQzFTNnAc7C3T+Q0jjEWh4NpqNl
	 0k8eVrjOBjs/OTzCUs8T+sLTcaCxFh1IiNL5Lu+pOFV8nBp7fRD5inSV1nPmojxPDF
	 eTKuRql5uDzhSQclcqZoS4gkQTslVvrPJCdB0F06ObO9IGlkr3zYLViyTw+JSrMtHV
	 oXTYMH/ffANrg==
Date: Wed, 04 Sep 2024 08:36:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
References: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
Message-Id: <172545686071.2410562.12642857108140027043.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: rb3gen2: add second USB port


On Wed, 04 Sep 2024 13:16:23 +0200, Caleb Connolly wrote:
> Make the necessary adjustments to enable the secondary USB controller,
> which is routed directly to a micro-USB port. This is intended for
> debugging via EUD, and is otherwise useful as a host-facing port with
> mass storage or network gadgets, allowing the type-c to be used with a
> hub.
> 
> Peripheral mode has been tested with a network gadget, but I don't have
> the necessary hardware on hand to test host mode.
> 
> ---
> Caleb Connolly (3):
>       arm64: dts: qcom: sc7280: convert usb_2 to support multiple ports
>       arm64: dts: qcom: qcs6490-rb3gen2: make node names consistent
>       arm64: dts: qcom: qcs6490-rb3gen2: describe secondary USB port
> 
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 75 ++++++++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/sc7280.dtsi         | 18 +++++--
>  2 files changed, 87 insertions(+), 6 deletions(-)
> ---
> base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
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


New warnings running 'make CHECK_DTBS=y qcom/qcs6490-rb3gen2.dtb' for 20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@8cf8800: usb@8c00000:ports:port@1: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@8cf8800: usb@8c00000: Unevaluated properties are not allowed ('ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@8cf8800: usb@8c00000: Unevaluated properties are not allowed ('ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@8c00000: ports:port@1: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@8c00000: Unevaluated properties are not allowed ('ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: connector-usb2: compatible: 'oneOf' conditional failed, one must be fixed:
	['gpio-usb-b-connector'] is too short
	'gpio-usb-b-connector' is not one of ['usb-a-connector', 'usb-b-connector', 'usb-c-connector']
	'samsung,usb-connector-11pin' was expected
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: connector-usb2: 'anyOf' conditional failed, one must be fixed:
	'vbus-gpios' is a required property
	'id-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: connector-usb2: Unevaluated properties are not allowed ('compatible', 'id-gpio', 'vbus-gpio' were unexpected)
	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#







Return-Path: <linux-arm-msm+bounces-33581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49F99528D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38698283B5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283D01DF998;
	Tue,  8 Oct 2024 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUocO6mV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE43DDDC;
	Tue,  8 Oct 2024 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399402; cv=none; b=DwzXk9U8SNzrH31swhGO6IryVi7GHP6hpId4hKzno96sXrGJTKaOKFu7AwJIShhGlji+i2aDd/FWboMgBGOKYFxHOkjSw0BRC5ZvQQUTsldc0t3R0/2w4K7/XONuL2t3UfSQuxJVukCrQk10Oz/HGOBZi8GSPWObdBjNcphppkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399402; c=relaxed/simple;
	bh=+EkY6DUNT8H79bDO5aaiph8TCjPO2G7TwhacZE1943Q=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=O/tWJqk8syL9JwvAZjFI0+YaTWycj+3SHnS+aVjdTGTDm3youB4lNrzB1Wh+wj5FaoId+T6ktnTB+5iFUf7BZrpNPHPoPSTLiOL8Eg0OxQFz6LkJddBHnkt4DQnWod8Qo6ZiuX7wBVWDCcoittYwPqqCKHEVGLMm/yFZ/GjOiUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUocO6mV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F3AC4CECD;
	Tue,  8 Oct 2024 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728399401;
	bh=+EkY6DUNT8H79bDO5aaiph8TCjPO2G7TwhacZE1943Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=aUocO6mV9Ua1/s9Zxo9oxNI63BejhSut9TGaDJqEr91T3es3e2UWi+eFbdm7ntFQH
	 QhZoX8tXrmyNkbO1Su5mRPYdWvH8uEK7X3MawWOybZTGJ8CCI4dN8YlsFUY9XFrnTb
	 sfzRpEkIx3U8z+w+flRQm4PWuHxS9IEOqPlUSorOzR9ng4/bUJiCUIIEVZhBxkQWbP
	 8hsKOs6XfKf0dcLfMJhTc3PuHzeBhOyWX/EIaQT8Z195n6EuJSXYpUFz3O26MzHCv2
	 6Uv6hj6C+Z4hAeNw/QQANYErR1KWYWgz3RJWpxPGJipZ8coiL7Xi4+X8RHyLIdwXXh
	 hpCqM3dCfutGw==
Date: Tue, 08 Oct 2024 09:56:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Joel Selvaraj <jo@jsfamily.in>, linux-kernel@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
References: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
Message-Id: <172839929004.1375659.17484732521935836404.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add Xiaomi Poco F1 touchscreen support


On Mon, 07 Oct 2024 21:59:25 -0500, Joel Selvaraj wrote:
> In the first patch, I have enabled the  qupv3_id_1 and gpi_dma1 as they
> are required for configuring touchscreen. Also added the pinctrl configurations.
> These are common for both the Poco F1 Tianma and EBBG panel variant.
> 
> In the subsequent patches, I have enabled support for the Novatek NT36672a
> touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
> Tianma and EBBG panel variant respectively.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
> Joel Selvaraj (3):
>       arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add touchscreen related nodes
>       arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: introduce touchscreen support
>       arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support
> 
>  .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 39 ++++++++++++++++++++++
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 23 +++++++++++++
>  .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    | 23 +++++++++++++
>  3 files changed, 85 insertions(+)
> ---
> base-commit: d435d1e92be5fd26cd383fbddb596942ddc52b9f
> change-id: 20241007-pocof1-touchscreen-support-c752a162cdc2
> 
> Best regards,
> --
> Joel Selvaraj <foss@joelselvaraj.com>
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


New warnings running 'make CHECK_DTBS=y qcom/sdm845-xiaomi-beryllium-ebbg.dtb qcom/sdm845-xiaomi-beryllium-tianma.dtb' for 20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com:

arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: touchscreen@38: 'panel' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pinctrl@3400000: ts-int-default-state: 'oneOf' conditional failed, one must be fixed:
	'bias-pull-down', 'drive-strength', 'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	False schema does not allow True
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sdm845-pinctrl.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb: pinctrl@3400000: ts-int-sleep-state: 'oneOf' conditional failed, one must be fixed:
	'bias-pull-down', 'drive-strength', 'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	False schema does not allow True
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sdm845-pinctrl.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pinctrl@3400000: ts-int-default-state: 'oneOf' conditional failed, one must be fixed:
	'bias-pull-down', 'drive-strength', 'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	False schema does not allow True
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sdm845-pinctrl.yaml#
arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb: pinctrl@3400000: ts-int-sleep-state: 'oneOf' conditional failed, one must be fixed:
	'bias-pull-down', 'drive-strength', 'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	False schema does not allow True
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sdm845-pinctrl.yaml#







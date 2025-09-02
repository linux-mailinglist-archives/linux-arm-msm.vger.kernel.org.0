Return-Path: <linux-arm-msm+bounces-71619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6889B402A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 15:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE68B3ACE55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFE5306486;
	Tue,  2 Sep 2025 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzukxrmN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF13305E2D;
	Tue,  2 Sep 2025 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819080; cv=none; b=rTGs4OSCN6D6dJMonw4IMBnLwt2uuxJSUsdd2Ku1nb0uGvtamSW0fJGyXf9Cn9NbjZZ+NQ5myV6bqlBw4YnFo/YDMtqgJfA0ixyQQf0YFeyMOJ2+SvOVKycSW0uzO/QF4z6gNyVgw61Hnzv5Se9QHIsj7p3twxbdl1dUDh7DinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819080; c=relaxed/simple;
	bh=z7FwtaZZzwjQdtwpEuB9tpjcm7SAnUfcPFRtC2LIdKE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dvAOuJzNKekDZQwW85fZo04NWnx13Iq1bzFriQMvSBT1wVKxug31BUb+lfvkrFhm+gvrR9Sh3DCGo2el610wqFcb4BqyI7vgP0Z1Jq8zJOGP1L3LHcqbzV+cpvjC4XW8qMdaEtjheMIY13hkqd7WSuMuNh2Mm8H6lqIRi1OeCjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzukxrmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D4FC4CEF4;
	Tue,  2 Sep 2025 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819079;
	bh=z7FwtaZZzwjQdtwpEuB9tpjcm7SAnUfcPFRtC2LIdKE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rzukxrmNB9iuxVkdbLPuZC7Jsk6tKQen9VhnAzMxmcSdjTjYKti1y9nmRy4XxvXeM
	 P6Y9wpxGAyPpsGuDQHHa8ZLzzZu7iluNZucOW+brNBoFVAta612ujIY2C4h5+M19ow
	 y6elkUFGOczdPhqYIS2bPxnwcuZ8Foin2gsvKXCFdXHP3yBjJgCjJumt0C3IAlko7J
	 YT2sHWnL2vOpl3AS1PY1GtcidjdV9DBKWxRemNtoMaWafUwiOG9kO+1swdU2E7L9sZ
	 JOarBQsSwx4J+vuSxV8XLcqnG0Ulv1olpNWzddGSmfOPK+PFo/NLt0+qB2nGsQ3ZW3
	 riarxr8TeyyVg==
Date: Tue, 02 Sep 2025 08:17:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
In-Reply-To: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
Message-Id: <175678731124.877987.10991214512843096912.robh@kernel.org>
Subject: Re: [PATCH 0/3] platform: arm64: thinkpad-t14s-ec: new driver


On Sun, 31 Aug 2025 23:28:30 +0200, Sebastian Reichel wrote:
> Introduce driver for the ThinkPad T14s Gen6 Snapdragon EC. In theory
> it seems to be compatible with the ThinkPad ACPI driver, but these
> devices are booted with device tree. As the name implies, the existing
> ThinkPad ACPI driver only supports the ACPI interface. Looking at
> the implementation, the ACPI DSDT contains many mapping functions
> to translate the low level I2C messages into the interface used by
> the ThinkPad ACPI driver. Adding DT support to the ThinkPad ACPI driver
> would require adding all those translation functions, which would add
> more or less the same amount of code as writing a separate driver using
> the low level interface directly. I don't think it's sensible to make
> the existing ACPI driver even more complicated, so I went for a separate
> driver.
> 
> I managed to get system LEDs, audio LEDs, extra keys and the keyboard
> backlight control working. The EC also seems to be used for some thermal
> bits, which I haven't looked into deeply. As far as I understand most
> thermal and fan control is handled by a different controller
> (0x36@i2c5) anyways.
> 
> Apart from that the EC is involved in proper system suspend, which
> is something I do not yet understand (I don't have any documentation
> apart from the dis-assembled DSDT and existing ACPI driver). Right
> now I disabled wake capabilities for the IRQ, since it would wake
> up the system when closing the LID. Hopefully a way to mask specific
> events will be found in the future.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> Sebastian Reichel (3):
>       dt-bindings: platform: Add Lenovo Thinkpad T14s EC
>       platform: arm64: thinkpad-t14s-ec: new driver
>       arm64: dts: qcom: x1e80100-t14s: add EC
> 
>  .../bindings/platform/lenovo,thinkpad-t14s-ec.yaml |  49 ++
>  MAINTAINERS                                        |   6 +
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  23 +
>  drivers/platform/arm64/Kconfig                     |  20 +
>  drivers/platform/arm64/Makefile                    |   1 +
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 597 +++++++++++++++++++++
>  6 files changed, 696 insertions(+)
> ---
> base-commit: c8bc81a52d5a2ac2e4b257ae123677cf94112755
> change-id: 20250831-thinkpad-t14s-ec-ddeb23dbdafb
> 
> Best regards,
> --
> Sebastian Reichel <sebastian.reichel@collabora.com>
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
 Base: using specified base-commit c8bc81a52d5a2ac2e4b257ae123677cf94112755

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com:

arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: ec@28 (lenovo,thinkpad-t14s-ec): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/platform/lenovo,thinkpad-t14s-ec.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: ec@28 (lenovo,thinkpad-t14s-ec): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/platform/lenovo,thinkpad-t14s-ec.yaml#







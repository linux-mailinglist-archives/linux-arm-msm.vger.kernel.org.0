Return-Path: <linux-arm-msm+bounces-74455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F1B9269A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 19:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08B519046A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 17:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CCD313E27;
	Mon, 22 Sep 2025 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGQwq3BA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9369126F0A;
	Mon, 22 Sep 2025 17:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758562061; cv=none; b=MA7z0lh5op0+t3IpvemQo9bSEAaE5ywvwGZ/58W98uYKIfZngv3US/iv2DInv6xBjfz+CL6EPc7yPWK0HwG7eAbVYFRrFe2tOitfPY8Lfnqm0OwLTNId/e5WgEw6IM3FjJ1+Uq3uIj+bDA2125HBH0LerC5W7lV26ALpY3c2v7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758562061; c=relaxed/simple;
	bh=HnPSSlUSpZrAcD4oDZt1QLsdHVZRdP8Zbo9c9kITCks=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EE+IhxmO3NPhcffLNdbSN84wjXssUnkcSqbx4qCav1LacV/3XLDeY/6Os1FWjp5RkzM1uaNfnmyRngUFa5RvFUn3Y3AA0kkMHtj80D2btPepCKjArReH4ypLu0b+PidWw2Yr+xFoRXLBw8nKqcwfe8JqwAYItokn8Hx6rAvaSps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGQwq3BA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1779C4CEF0;
	Mon, 22 Sep 2025 17:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562061;
	bh=HnPSSlUSpZrAcD4oDZt1QLsdHVZRdP8Zbo9c9kITCks=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BGQwq3BAV7JKQqf9KC8Jchxh6K2oO46jbR39GbEcgY6JDy4t7sVesnp+O1vduEe9I
	 ZPAq3+Xj+dWKMVqE+xwMeubFCj7lrlzPYvITjhGpGPg3b3Qars9cgIZ9oNnzd9NAwj
	 kFZKRsq1RKw7WKfm1QpQ+cPxC8ogVLXSlxouQrF+dM+zV2rP6G+/Gjw0l2TZOADwHv
	 QCFaYI5d64z0BsHgWZgWyLdLCDSWw6hqZ/r2S7CXW/9r6/AwNZaIzxIN0QYO0tbjpY
	 5CyiajgDun71TBQsGbxT+9tE4SI31mT0FSdMC6LuR/MCRijEUO8Np2Ec/RG0ii/GJu
	 YvyOcgvPCIb+w==
Date: Mon, 22 Sep 2025 12:27:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
To: =?utf-8?q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>
In-Reply-To: <20250920014637.38175-1-ghatto404@gmail.com>
References: <20250920014637.38175-1-ghatto404@gmail.com>
Message-Id: <175856183518.499741.3237175571653776732.robh@kernel.org>
Subject: Re: [PATCH 0/5] arm64: dts: qcom: r0q: enable more peripherals


On Sat, 20 Sep 2025 01:46:32 +0000, Eric Gonçalves wrote:
> This patchset adds support for multiple devices found on the Galaxy S22,
> side buttons, touchscreen, max77705 charger/fuelgauge, RTC and UFS. It
> depends on "Input: add support for the STM FTS2BA61Y touchscreen" for
> TS to be enabled.
> 
> Thanks!
> 
> Eric Gonçalves (5):
>   arm64: dts: qcom: r0q: add gpio keys
>   arm64: dts: qcom: r0q: add touchscreen support
>   arm64: dts: qcom: r0q: enable max77705 PMIC
>   arm64: dts: qcom: r0q: enable hardware clocks
>   arm64: dts: qcom: r0q: enable ufs storage
> 
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 308 +++++++++++++++++-
>  1 file changed, 299 insertions(+), 9 deletions(-)
> 
> --
> 2.51.0
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
 Base: tags/v6.17-rc1-242-g11cf389c103f (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250920014637.38175-1-ghatto404@gmail.com:

arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: / (samsung,r0q): spi-gpio@0: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: pinctrl@f100000 (qcom,sm8450-tlmm): Unevaluated properties are not allowed ('spi_clk_tsp_active', 'spi_clk_tsp_sleep', 'spi_cs_tsp_active', 'spi_cs_tsp_sleep', 'spi_miso_tsp_active', 'spi_miso_tsp_sleep', 'spi_mosi_tsp_active', 'spi_mosi_tsp_sleep', 'tsp_int_active', 'tsp_int_sleep_state' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8450-tlmm.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: spi-gpio@0 (spi-gpio): $nodename:0: 'spi-gpio@0' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: spi-gpio@0 (spi-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'spi-max-frequency', 'touchscreen@0' were unexpected)
	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: /spi-gpio@0/touchscreen@0: failed to match any schema with compatible: ['st,fts2ba61y']







Return-Path: <linux-arm-msm+bounces-21627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AAC8FB74E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 589B81F28187
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297E9149C62;
	Tue,  4 Jun 2024 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMYbQkL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51D149C58;
	Tue,  4 Jun 2024 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514946; cv=none; b=HxFnJJ0lOj5iDfjxNStthtC8rENY/ZCnIywGBTGiua68iviqjGWlx5J5tzE2FESvZXwEtm1MyfN4b24ZAkQHAJfSx4ZuC+5MGUzNsvnnaxmX6CpA2kstFabdzXfV0hsv7gPpNXbwMq6FHOOKLMtxG5zzndQzvyksDQnY61wOK/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514946; c=relaxed/simple;
	bh=mfTb8/nIO2i2gRcje+LHHzecxszLMkpseLwAZu/HtWM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Qjd6Y0VnjcVb4svOB57nky/jxEObx/w0xMg5O4dOtn8nf54fYF9UdtmLiL8/VudhpIbJwZq8vWIWRW+itxmxdbQ9njjDM3PZXEypQ1iDn7FqqMII3uJDgldddrQf/9L7jyKXDoP3WMRSNYwido+sKvsDOF88Rd+6O7KulUO3DLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMYbQkL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4667DC4AF08;
	Tue,  4 Jun 2024 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717514945;
	bh=mfTb8/nIO2i2gRcje+LHHzecxszLMkpseLwAZu/HtWM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZMYbQkL8sB8prdLwR3LZ20wOCUuHUBC1pSjXFiEkqhcr8dOYg+pUW2WMGGDgVpKM8
	 oBJ8q9525y6f+Ay8GFp6ope2Hw19AJWo19jO3wrWWBq5kylKbCJqrl3SKKG9t9HoVv
	 4UcRnt+Cju03IvM7ewve7DnPEdcnLx1IDFuyDmWzQL0I2ly7ZHoImmEYHiYRyZYKZr
	 NLj1lj4Bx4sLEyJCuoXovBdrsLGKfNyJE06zQWJ4PHmLE1xjIAQeiGnor29Q5/sGy1
	 9GGMMDkKFMCkY9fp6fFIUYiYoeo5Ad8qqguX6GqAenWAc68KEJXk3F0kzOawO2/NMh
	 drtst/bT3P/Vw==
Date: Tue, 04 Jun 2024 10:29:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, stable@vger.kernel.org, 
 Caleb Connolly <caleb.connolly@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20240604-rb12-i2c2g-pio-v1-0-f323907179d9@linaro.org>
References: <20240604-rb12-i2c2g-pio-v1-0-f323907179d9@linaro.org>
Message-Id: <171751455130.786440.9645536291683303071.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: switch RB1 and RB2 platforms to
 i2c2-gpio


On Tue, 04 Jun 2024 13:14:57 +0300, Dmitry Baryshkov wrote:
> On the Qualcomm RB1 and RB2 platforms the I2C bus connected to the
> LT9611UXC bridge under some circumstances can go into a state when all
> transfers timeout. This causes both issues with fetching of EDID and
> with updating of the bridge's firmware.
> 
> While we are debugging the issue, switch corresponding I2C bus to use
> i2c-gpio driver. While using i2c-gpio no communication issues are
> observed.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (2):
>       arm64: dts: qcom: qrb2210-rb1: switch I2C2 to i2c-gpio
>       arm64: dts: qcom: qrb4210-rb2: switch I2C2 to i2c-gpio
> 
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 13 ++++++++++++-
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 13 ++++++++++++-
>  2 files changed, 24 insertions(+), 2 deletions(-)
> ---
> base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
> change-id: 20240604-rb12-i2c2g-pio-f6035fa8e022
> 
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


New warnings running 'make CHECK_DTBS=y qcom/qrb2210-rb1.dtb qcom/qrb4210-rb2.dtb' for 20240604-rb12-i2c2g-pio-v1-0-f323907179d9@linaro.org:

arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /: i2c2-gpio: {'compatible': ['i2c-gpio'], 'sda-gpios': [[25, 6, 0]], 'scl-gpios': [[25, 7, 0]], '#address-cells': [[1]], '#size-cells': [[0]], 'status': ['okay'], 'clock-frequency': [[400000]], 'hdmi-bridge@2b': {'compatible': ['lontium,lt9611uxc'], 'reg': [[43]], 'interrupts-extended': [[25, 46, 2]], 'reset-gpios': [[25, 41, 0]], 'vdd-supply': [[107]], 'vcc-supply': [[108]], 'pinctrl-0': [[109, 110]], 'pinctrl-names': ['default'], '#sound-dai-cells': [[1]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[111]], 'phandle': [[92]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[112]], 'phandle': [[106]]}}}}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: /: i2c2-gpio: {'compatible': ['i2c-gpio'], 'sda-gpios': [[43, 6, 0]], 'scl-gpios': [[43, 7, 0]], '#address-cells': [[1]], '#size-cells': [[0]], 'status': ['okay'], 'clock-frequency': [[400000]], 'hdmi-bridge@2b': {'compatible': ['lontium,lt9611uxc'], 'reg': [[43]], 'interrupts-extended': [[43, 46, 2]], 'reset-gpios': [[43, 41, 0]], 'vdd-supply': [[178]], 'vcc-supply': [[179]], 'pinctrl-0': [[180, 181]], 'pinctrl-names': ['default'], '#sound-dai-cells': [[1]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[182]], 'phandle': [[127]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[183]], 'phandle': [[177]]}}}}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: i2c2-gpio: $nodename:0: 'i2c2-gpio' does not match '^i2c(@.*|-[0-9a-z]+)?$'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: i2c2-gpio: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'hdmi-bridge@2b' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: i2c2-gpio: $nodename:0: 'i2c2-gpio' does not match '^i2c(@.*|-[0-9a-z]+)?$'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: i2c2-gpio: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'hdmi-bridge@2b' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#







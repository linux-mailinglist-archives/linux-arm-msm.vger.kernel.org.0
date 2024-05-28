Return-Path: <linux-arm-msm+bounces-20795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC208D229B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 19:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BB66B2113E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 17:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA61224FD;
	Tue, 28 May 2024 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrw1m/Mu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E1C224D1;
	Tue, 28 May 2024 17:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716918100; cv=none; b=uNrm7s+EkP+mCISsXPIR2t83UEzjAyH/jP4Y9ogO0xk3j0BygjTLjH5vrGPQXaq8kjBL4xDQSlOzV04M2QjCVpkj+BRoY/V6FXx2s6ZNqWjucOvfe76Kmn89O7ftbSgPKHv8iMm67h+vu9pxdclWQa++Yv37XrU5dK6rAkoyXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716918100; c=relaxed/simple;
	bh=/TVduV2ZbhY2J3w1XAChQvYpluvCRq1AayWS8C1G0NA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=r5SdwB7FPxtQcXGbfZ/HglrXUNAZ6tPjzRyAUdbGpRUDkcHmJrtDZ1V4tO5i9Ayj7TdZR1LOQwstdy26ds/HwK0CcadBdLtPjlVJSTIDxBUhk18OJoWeM1RQDPFGBEpr5rfX03mLFIRgxafJN5JflI8/aHDh4HF5nke7kHtAh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrw1m/Mu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66164C3277B;
	Tue, 28 May 2024 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716918099;
	bh=/TVduV2ZbhY2J3w1XAChQvYpluvCRq1AayWS8C1G0NA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qrw1m/MuP3D+0ADSOQl2pR6tl/kLfl5zk/yTvtvHupE8yESkaXuqeVgwVCjU+C9bV
	 QMIqbvEcGL9Y2RW15prtGxmGK3sDZTDoL9hERfT5ZIGw+o4T5QLQY8QIPUwMoDg7ye
	 wX2fiMZvsOxqhm8ZltZbPwpBo/ixOWbTYWD4lHxFlxRB7a+82NIKPJ8wDxc40yy7MH
	 8MKWP7ceB1eYUc6mtMnEViE4R9YNga0bIpkNhjhjvp6R9IhrC5OY8VmODayitW6yCS
	 ZDFLV1haXsatv5BeLeAPvzdkKLbn6Qi9OizxvRoqOQO0crJAiz8rq6sdUCZnzy/jXD
	 QiPNCZrAJhe+A==
Date: Tue, 28 May 2024 12:41:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
Message-Id: <171691793133.1180499.940663320144175999.robh@kernel.org>
Subject: Re: [PATCH 00/10] arm64: dts: qcom: sc8180x: Enable the USB
 multiport controller


On Sat, 25 May 2024 11:03:53 -0700, Bjorn Andersson wrote:
> The USB multiport controller found in SC8180X is used to driver the
> camera in the Lenovo Flex 5G, and a couple of additional USB ports on
> the Primus AUX board.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> Bjorn Andersson (10):
>       dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add sc8180x USB3 compatible
>       phy: qcom-qmp-usb: Add sc8180x USB UNIPHY
>       dt-bindings: clock: qcom: Add missing USB MP resets
>       clk: qcom: gcc-sc8180x: Add missing USB MP resets
>       dt-bindings: usb: qcom,dwc3: Add SC8180X compatibles
>       arm64: dts: qcom: sc8180x-pmics: Add second PMC8180 GPIO
>       arm64: dts: qcom: sc8180x: Align USB nodes with binding
>       arm64: dts: qcom: sc8180x: Add USB MP controller and phys
>       arm64: dts: qcom: sc8180x-primus: Enable the two MP USB ports
>       arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable USB multiport controller
> 
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   3 +
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |  29 ++++
>  .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  32 ++++
>  arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |  16 +-
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  60 +++++++
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 175 +++++++++++++++++++--
>  drivers/clk/qcom/gcc-sc8180x.c                     |   4 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |   3 +
>  include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   4 +
>  9 files changed, 312 insertions(+), 14 deletions(-)
> ---
> base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
> change-id: 20240524-sc8180x-usb-mp-4eb278df7ef1
> 
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
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


New warnings running 'make CHECK_DTBS=y qcom/sc8180x-lenovo-flex-5g.dtb qcom/sc8180x-primus.dtb' for 20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com:

arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: clock-controller@af00000: clocks: [[41, 0], [42], [120, 0], [120, 1], [124, 0], [124, 1], [127, 0], [127, 1]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: clock-controller@af00000: clocks: [[41, 0], [42], [122, 0], [122, 1], [126, 0], [126, 1], [129, 0], [129, 1]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#







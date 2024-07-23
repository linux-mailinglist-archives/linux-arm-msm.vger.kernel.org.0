Return-Path: <linux-arm-msm+bounces-26841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B82093987B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 04:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224D31F2233E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 02:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B71313C677;
	Tue, 23 Jul 2024 02:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQblG2MJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4050713C3F5;
	Tue, 23 Jul 2024 02:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721703455; cv=none; b=Ce5aY88KEFpJ3WjSo7loSHfBuT0WEIX3enNRcKnjYyM1ox9KLkEut/wnjTeIt6PREFWrID/8WLycvggf2Ow0yD1JeDZtYn+VAvYTaIeYnZPQwpCNpVDoqBQeHn+lFNah9NRGTFTVSsIWQqpx6IHTkYrl8uofbjqK2k81Ch0Q2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721703455; c=relaxed/simple;
	bh=vGxDLcEEHFuXQhdgWKrtDJj6QUt2MbPCLYOlbZ/a4lU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Z0NF1o568g539wDj5leEFWBCszSWWaq+bNaVof+C/ao+mKmCo7XjpfgPb8EMsUafRNat8yqE3LN418UpvIezwm2QR48T3F6Ff0fOaX4E59peIlkapkGPsmmjSQ85JZVDzxtwtA0VnBOdX6UiWqN0+uaHbMMxAxKhYacph4fk1uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQblG2MJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF7DC116B1;
	Tue, 23 Jul 2024 02:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721703454;
	bh=vGxDLcEEHFuXQhdgWKrtDJj6QUt2MbPCLYOlbZ/a4lU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FQblG2MJ1ehxCXzbDHLFnKddUQfb0wNenhoMROvMCRBMSNCtl+aFEXsSmRE6196ez
	 qzboQWosk0MhB3lhNe0BuB163tBM0N/4gLNm/JERFnDgEuimNvOPzvKb646l3uKRI8
	 xaqhyXmZHpIv7XacR9m+ErmtEA/igJSGotbaWR9UkC4FGyXPAT3Nr24sTbqNfg96hx
	 3vtTXX6ANoZKVRU2DT9ykaZf4cgb+eYPEz1oV4GfyeWQa4CJNHu3DBWgtSuIDqEzzJ
	 E3mcqEeLUxH3haRy7EONDNh4BsBGwF5EapipjbVZhS0qX0dCZn7o8tXY8Tx/5m1dtd
	 v8M92xiP2v6+g==
Date: Mon, 22 Jul 2024 20:57:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
Message-Id: <172170324437.205162.5877409275020405960.robh@kernel.org>
Subject: Re: [PATCH 0/3] ThinkPad T14s Gen 6 support


On Fri, 19 Jul 2024 22:16:35 +0200, Konrad Dybcio wrote:
> As good as the other X1 laptops
> 
> See this page for more hw info:
> 
> https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (3):
>       dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s Gen 6
>       firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s
>       arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 +++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c                   |   1 +
>  4 files changed, 800 insertions(+)
> ---
> base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
> change-id: 20240719-topic-t14s_upstream-e53fcd0ccd2a
> 
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
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


New warnings running 'make CHECK_DTBS=y qcom/x1e78100-lenovo-thinkpad-t14s.dtb' for 20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org:

arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#







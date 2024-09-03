Return-Path: <linux-arm-msm+bounces-30538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CBD96A084
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 16:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1AAE282340
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 14:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95F9188935;
	Tue,  3 Sep 2024 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+qmk85a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A69188918;
	Tue,  3 Sep 2024 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373607; cv=none; b=Z82/GyM8tdnE8XUoyqNip4Hud7KnedmygcUDK723rJP7uyF8Se5GefamcyVBjq5OVTXNBGUoecCeEy010RHmWP/jmn7xk/IBv7ijNMvLSbNLyOeW6LsANH2sVS7YUQmyWbL+aYcilTsCJvLTzvzmqCwMj1QZbR05sHD1cFoImiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373607; c=relaxed/simple;
	bh=0obwl6rnQmXlMagSDEhIZfD7LsYE1aKBe/wuUdqZOt8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=TY3la+16zDeREsP65iWWJtIYas3rCCKz2kCmvJXzNu6ORuLlrhK9IRdaxhBptP5NM7HnHYhEWV1yIMWgulW0C5Nmlcek9WNBrIKNxfvQ1ex9UyODZp0ZuKomlkvGVsCP2aMJi5jo39IeeLqUU4MlU00SA32rm8LpWy01/uuiTiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+qmk85a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AEAC4CECB;
	Tue,  3 Sep 2024 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725373607;
	bh=0obwl6rnQmXlMagSDEhIZfD7LsYE1aKBe/wuUdqZOt8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=A+qmk85acXTQgJxLp5h7iiBoGl+o1XGKhqqZmyB8Wv5fceHPtx6VXGai08mOKBOaJ
	 fRmU8q8BEjx3dHNM/o56YKK0DHrZY2QNL2nJuaWtSkWLIhPV+cimvKM/UeVyIL0xq/
	 zupDpnkDCl81L8pGoMa0U0AGu/doDM41ezEwSvuwaY9vC6Ha6YPREjpOwa7kYjXuDm
	 YPey2gy2GTvOQk4fmHkjT6lKcWWkuhD80mS0C229nS6XW1czBaMhcRR/z/PJC9mMCR
	 3lV7eXwdCuXWN1bXuWLPbTHDfE/ecIwFM7ShcPkd2DcAoVLU2pqZQbPsPtvFf75U3R
	 OoVcs4ajLQQ4g==
Date: Tue, 03 Sep 2024 09:26:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20240903093629.16242-1-brgl@bgdev.pl>
References: <20240903093629.16242-1-brgl@bgdev.pl>
Message-Id: <172537335075.875326.5272199333006249577.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: sc8280xp: enable WLAN and
 Bluetooth


On Tue, 03 Sep 2024 11:36:25 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This enables WLAN and Bluetooth on two boards using the sc8280xp SoC.
> For the sc8280xp-crd we add the PMU, wifi and bluetooth nodes with the
> correctly modelled wiring between them. For the X13s, we rework existing
> nodes so that they align with the new DT bindings contract.
> 
> v1 -> v2:
> - fix commit message in patch 1/3
> - drop drive-strength from the wlan enable pin function
> - drop the calibration variant property from the wifi node of the CRD
> 
> Bartosz Golaszewski (2):
>   arm64: dts: qcom: sc8280xp-crd: enable bluetooth
>   arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855
> 
> Konrad Dybcio (1):
>   arm64: dts: qcom: sc8280xp-crd: model the PMU of the on-board wcn6855
> 
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 166 ++++++++++++++++++
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  98 +++++++++--
>  2 files changed, 252 insertions(+), 12 deletions(-)
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-crd.dtb qcom/sc8280xp-lenovo-thinkpad-x13s.dtb' for 20240903093629.16242-1-brgl@bgdev.pl:

arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: wifi@0: 'vddrfa1p8-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddrfa1p8-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#







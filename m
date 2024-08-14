Return-Path: <linux-arm-msm+bounces-28523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEBA951F06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB5E1C21523
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7784F1B5816;
	Wed, 14 Aug 2024 15:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+bY7KIn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E34B28DC3;
	Wed, 14 Aug 2024 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650485; cv=none; b=qApeIJuPAouUcMB4VtPZU7RvVjbLoyBUjxt9mcNXrNLou1+jFxQIDr1SpoyYWpD08j6kaI6hmE2bO7KIBzzC8vaovaN28TWDkwH4Kbx+tPPOFS3yWL53SNnz5OBlyBo0StxESyOBijnq6xT3U1mncmyW5WirBMJX1Sk/IRxp7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650485; c=relaxed/simple;
	bh=n7IuDmJ7xjiLmorJ27Cw4dIAMs1ncBH3/BXHuvFBYho=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=QbJwmrhyizSRVFrox5VWUYojWiM6f74FU/QKdw7p8Yo23A05lg91MV39fnLnqW8pY10Bw7ud7PYOdecr0LWjt4B2doCjRtqhl1pikoo5HMOKdsonqCcTjCHpgsYD3L2DANlHDezCZ2bB9arbJEF/9934Hzc1CM+krId3nDqPHm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+bY7KIn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D78C116B1;
	Wed, 14 Aug 2024 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723650484;
	bh=n7IuDmJ7xjiLmorJ27Cw4dIAMs1ncBH3/BXHuvFBYho=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=O+bY7KInwMy24ENMzdpHtvESrz0WsUKoxsDXZXD+E9+VR5hKJCO2vamWOJhe4Ert6
	 zmTgU/JmkLOSifCEYatpq+Xt4rRZl0rsuURUrYlU2TNb7Qzv1P2aD2zNY5rZXf+4+b
	 g47y0p6tC9lPSWNUw4U46FYbh2r3tQuxMQUGVxH4//5IHVjehvDg0Nb0YmAOC6/1r7
	 Zsvr1WFZ3Wx085hkna79BFhDApAgfljTVh0Bbp0OCqTPzljd1KaLshr1Yep+0cTO78
	 rxAoMg9E4H85mVw/jpE38hRC9dRtdt9sHQOqEIP6Og3CBSYd3ql3DuIlqvnGbqf7lr
	 Glhi8NcIfmhiA==
Date: Wed, 14 Aug 2024 09:48:03 -0600
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
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240813190639.154983-1-brgl@bgdev.pl>
References: <20240813190639.154983-1-brgl@bgdev.pl>
Message-Id: <172365034673.2714461.1759726822181293291.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sc8280xp: enable WLAN and
 Bluetooth


On Tue, 13 Aug 2024 21:06:35 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This enables WLAN and Bluetooth on two boards using the sc8280xp SoC.
> For the sc8280xp-crd we add the PMU, wifi and bluetooth nodes with the
> correctly modelled wiring between them. For the X13s, we rework existing
> nodes so that they align with the new DT bindings contract.
> 
> Bartosz Golaszewski (2):
>   arm64: dts: qcom: sc8280xp-crd: enable bluetooth
>   arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855
> 
> Konrad Dybcio (1):
>   arm64: dts: qcom: sc8280xp-crd: enable wifi
> 
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     | 169 ++++++++++++++++++
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  98 ++++++++--
>  2 files changed, 255 insertions(+), 12 deletions(-)
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


New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-crd.dtb qcom/sc8280xp-lenovo-thinkpad-x13s.dtb' for 20240813190639.154983-1-brgl@bgdev.pl:

arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: bluetooth: 'enable-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: bluetooth: 'swctrl-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: bluetooth: 'vddio-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: bluetooth: 'vddbtcxmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: bluetooth: 'vddrfa1p7-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'enable-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'swctrl-gpios' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddio-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddbtcxmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: bluetooth: 'vddrfa1p7-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: wifi@0: 'vddrfa1p8-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: wifi@0: 'vddrfa1p8-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: /wcn6855-pmu: failed to match any schema with compatible: ['qcom,wcn6855-pmu']
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /wcn6855-pmu: failed to match any schema with compatible: ['qcom,wcn6855-pmu']







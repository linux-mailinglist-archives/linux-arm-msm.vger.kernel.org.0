Return-Path: <linux-arm-msm+bounces-21771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34A8FCF7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42801F21336
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7A0194A61;
	Wed,  5 Jun 2024 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuYGKggv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57437143722;
	Wed,  5 Jun 2024 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717593105; cv=none; b=iI992wRjlCStteSSM7BrvVD6Z20TKcWI/D3DQ1LLqKLZiuzJ3EfUkHVRgY4TCPBsQ4wrIlHNk0y4mOVKR3JH6b4oz0iail3pto5aPq5bHqSnwfTFgdrVZqOUhx8+jPJCoE8vtK+1QKHlEfEPQfSnCtaKjq1XmZOAjFzVM2eJ6S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717593105; c=relaxed/simple;
	bh=e82jWzNHBIQ5LuoLp5xTNCnL6iSD2so1skFOuLdRsK0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=fSiHvUA1obMsAeBhgngE4wNM88WHHrpACE7RDbA/W8ApL3svIlEKUilsQh2G9ny3PYYa/DT+nDZV8ZJRec7aNreNpWw6E5SV0fv4la6DL5jTJ//rjahyo03nVz0OHqO4MIu8Z285m+gaKE0743Ku2VfK2BmhJdhxUIpJNCGqOTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuYGKggv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEA6C32781;
	Wed,  5 Jun 2024 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717593104;
	bh=e82jWzNHBIQ5LuoLp5xTNCnL6iSD2so1skFOuLdRsK0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=BuYGKggvd03FxDubIx4921UbQ3+fwhHA2KMMPF7sX9KJCHYCmjUkAWUrqgiczOfh5
	 eJygJLFA1I2kyqJZQ1QOg1dseA1fdbryODsBsEs6qMSEXD42yvTLb+9SH0DRHYkMYR
	 mdyGUqSh2NErdJmVU+znPrJYpcOeLaekj5NrzpCNehShHEfn3mnafDufQF0jX7OOaX
	 7w4ciIGZtPUh6wXoiDQrVqEBzLCpuckyrYJsEjltCLqJGsWSdnNvYRPGYXq9ZCEyLG
	 wCA6+xU/YfynPCemAU/1ndfZ48OsGPCHo+2tce31Lz2Q8IxZtOTDaz/sqlN71503xR
	 VgFng9QUDfxKg==
Date: Wed, 05 Jun 2024 07:11:42 -0600
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240605122729.24283-1-brgl@bgdev.pl>
References: <20240605122729.24283-1-brgl@bgdev.pl>
Message-Id: <171759285132.2201422.6812393889473417095.robh@kernel.org>
Subject: Re: [PATCH v9 0/4] arm64: dts: qcom: add WiFi modules for several
 platforms


On Wed, 05 Jun 2024 14:27:25 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Hi!
> 
> Here are the DTS changes for several Qualcomm boards from the
> power-sequencing series. To keep the cover-letter short, I won't repeat
> all the details, they can be found in the cover-letter for v8. Please
> consider picking them up into the Qualcomm tree. They have all been
> thorougly tested with the pwrseq series.
> 
> Changelog:
> 
> Since v8:
> - split the DTS patches out into their own series
> - Link to v8: https://lore.kernel.org/r/20240528-pwrseq-v8-0-d354d52b763c@linaro.org
> 
> Since v7:
> - added DTS changes for sm8650-hdk
> - added circular dependency detection for pwrseq units
> - fixed a KASAN reported use-after-free error in remove path
> - improve Kconfig descriptions
> - fix typos in bindings and Kconfig
> - fixed issues reported by smatch
> - fix the unbind path in PCI pwrctl
> - lots of minor improvements to the pwrseq core
> 
> Since v6:
> - kernel doc fixes
> - drop myself from the DT bindings maintainers list for ath12k
> - wait until the PCI bridge device is fully added before creating the
>   PCI pwrctl platform devices for its sub-nodes, otherwise we may see
>   sysfs and procfs attribute failures (due to duplication, we're
>   basically trying to probe the same device twice at the same time)
> - I kept the regulators for QCA6390's ath11k as required as they only
>   apply to this specific Qualcomm package
> 
> Since v5:
> - unify the approach to modelling the WCN WLAN/BT chips by always exposing
>   the PMU node on the device tree and making the WLAN and BT nodes become
>   consumers of its power outputs; this includes a major rework of the DT
>   sources, bindings and driver code; there's no more a separate PCI
>   pwrctl driver for WCN7850, instead its power-up sequence was moved
>   into the pwrseq driver common for all WCN chips
> - don't set load_uA from new regulator consumers
> - fix reported kerneldoc issues
> - drop voltage ranges for PMU outputs from DT
> - many minor tweaks and reworks
> 
> v1: Original RFC:
> 
> https://lore.kernel.org/lkml/20240104130123.37115-1-brgl@bgdev.pl/T/
> 
> v2: First real patch series (should have been PATCH v2) adding what I
>     referred to back then as PCI power sequencing:
> 
> https://lore.kernel.org/linux-arm-kernel/2024021413-grumbling-unlivable-c145@gregkh/T/
> 
> v3: RFC for the DT representation of the PMU supplying the WLAN and BT
>     modules inside the QCA6391 package (was largely separate from the
>     series but probably should have been called PATCH or RFC v3):
> 
> https://lore.kernel.org/all/CAMRc=Mc+GNoi57eTQg71DXkQKjdaoAmCpB=h2ndEpGnmdhVV-Q@mail.gmail.com/T/
> 
> v4: Second attempt at the full series with changed scope (introduction of
>     the pwrseq subsystem, should have been RFC v4)
> 
> https://lore.kernel.org/lkml/20240201155532.49707-1-brgl@bgdev.pl/T/
> 
> v5: Two different ways of handling QCA6390 and WCN7850:
> 
> https://lore.kernel.org/lkml/20240216203215.40870-1-brgl@bgdev.pl/
> 
> Bartosz Golaszewski (3):
>   arm64: dts: qcom: sm8550-qrd: add the Wifi node
>   arm64: dts: qcom: sm8650-qrd: add the Wifi node
>   arm64: dts: qcom: qrb5165-rb5: add the Wifi node
> 
> Neil Armstrong (1):
>   arm64: dts: qcom: sm8650-hdk: add the Wifi node
> 
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 103 ++++++++++++++++++++---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     |   2 +-
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts  |  97 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8550.dtsi     |   2 +-
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts  |  89 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts  |  89 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi     |   2 +-
>  7 files changed, 370 insertions(+), 14 deletions(-)
> 
> --
> 2.40.1
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


New warnings running 'make CHECK_DTBS=y qcom/qrb5165-rb5.dtb qcom/sm8550-qrd.dtb qcom/sm8650-hdk.dtb qcom/sm8650-qrd.dtb' for 20240605122729.24283-1-brgl@bgdev.pl:

arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: bluetooth: 'vddbtcmx-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: /wcn7850-pmu: failed to match any schema with compatible: ['qcom,wcn7850-pmu']
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: /wcn7850-pmu: failed to match any schema with compatible: ['qcom,wcn7850-pmu']
arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: /wcn7850-pmu: failed to match any schema with compatible: ['qcom,wcn7850-pmu']
arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: /qca6390-pmu: failed to match any schema with compatible: ['qcom,qca6390-pmu']







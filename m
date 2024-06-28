Return-Path: <linux-arm-msm+bounces-24652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2047791C2C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F253282550
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 15:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA191C688B;
	Fri, 28 Jun 2024 15:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhbc2hTn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E571DFFB;
	Fri, 28 Jun 2024 15:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589313; cv=none; b=LFpr2UoLu7P1BMEqswPAmfl1b1fkmIVQXlFvGAoKdMkRcOCadff0YZhWav7BY5UPiwUKGsQThHBRMTQVSogd4/uCNbvoxlTp4HEhK9LTds4sdviWiqNYR3riiPQJP3OHiNzFCFChtp7oS6juAoFicAapB5SlPi5RcjvYrlR4YPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589313; c=relaxed/simple;
	bh=4ihIhb0n5pT2jWpYSgDOZjuCCMDfjHRBZMny1IcFD0M=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=TRAU6MCLLtImZ5jR7ZZsHGR04l9WzZVCElkFcMJ4Hzq+GADpLWwlAeucE590h/cZdU4MJB1PCaKJHYuXp6+Ls3CFeK2v2JzLZtxxeIO2CjRvR2+pCAUl3haRKQkpRjJzU0wEqAb8weMHn/MgNuWkmj/0an/bJly6veBI7EDVtjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhbc2hTn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC510C116B1;
	Fri, 28 Jun 2024 15:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719589313;
	bh=4ihIhb0n5pT2jWpYSgDOZjuCCMDfjHRBZMny1IcFD0M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bhbc2hTnnbsNH0pDkzieLdp6IxdTwxgM8kCMOb/jX8V0JEFOOrQQxCcUBvbcvsNww
	 1bwhL/33fqSwIqcxjXHBdzlOaAvGCsJgT4dJS4WIm2COgl3ORHtJLELbxgOOrqnSgO
	 DpKAQjhpWLWSrK0r81NAvWwYrUxdjg6vWwq1/4UsXvTseoC/Qe6yXdFkHDVjfJdj+t
	 Yb7chunuebUxAlW9JnWJqIQ4sNOnEaYP7a5EI/R9Hcm/BmGjm6lQnizBv/0255pgYN
	 xuPHU2RN6kbUJ5QG7e8jWCvS5wSjyZEXFzq5rbwSC92YPgW115rM4tYwo5FGq2d585
	 wLeVVMoBc0oYw==
Date: Fri, 28 Jun 2024 09:41:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 phone-devel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20240627193013.1800-1-raymondhackley@protonmail.com>
References: <20240627193013.1800-1-raymondhackley@protonmail.com>
Message-Id: <171958904261.3122689.7431145315207852456.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add
 initial device tree


On Thu, 27 Jun 2024 19:30:30 +0000, Raymond Hackley wrote:
> Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
> other Samsung devices based on MSM8226 with only a few minor differences.
> 
> The device trees contain initial support with:
>  - GPIO keys
>  - Regulator haptic
>  - SDHCI (internal and external storage)
>  - UART (on USB connector via the TI TSU6721 MUIC)
>  - Regulators
>  - Touchscreen
>  - Accelerometer
> 
> ---
> v2: Adjust l3, l15, l22 and l27 regulator voltages. Sort nodes.
>     Set regulator-allow-set-load for vqmmc supplies.
> 
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


New warnings running 'make CHECK_DTBS=y qcom/qcom-msm8226-samsung-ms013g.dtb' for 20240627193013.1800-1-raymondhackley@protonmail.com:

arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: syscon@f9011000: compatible: 'anyOf' conditional failed, one must be fixed:
	['syscon'] is too short
	'syscon' is not one of ['al,alpine-sysfabric-service', 'allwinner,sun8i-a83t-system-controller', 'allwinner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller', 'allwinner,sun50i-a64-system-controller', 'altr,l3regs', 'altr,sdr-ctl', 'amd,pensando-elba-syscon', 'amlogic,meson-mx-assist', 'amlogic,meson-mx-bootrom', 'amlogic,meson8-analog-top', 'amlogic,meson8b-analog-top', 'amlogic,meson8-pmu', 'amlogic,meson8b-pmu', 'apm,xgene-csw', 'apm,xgene-efuse', 'apm,xgene-mcb', 'apm,xgene-rb', 'apm,xgene-scu', 'atmel,sama5d2-sfrbu', 'atmel,sama5d3-nfc-io', 'atmel,sama5d3-sfrbu', 'atmel,sama5d4-sfrbu', 'axis,artpec6-syscon', 'brcm,cru-clkset', 'brcm,sr-cdru', 'brcm,sr-mhb', 'cirrus,ep7209-syscon1', 'cirrus,ep7209-syscon2', 'cirrus,ep7209-syscon3', 'cnxt,cx92755-uc', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-syscfg', 'fsl,imx93-wakeupmix-syscfg', 'fsl,ls1088a-reset', 'fsl,vf610-anatop', 'fsl,vf610-mscm-cpucfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi6220-sramctr
 l', 'hisilicon,hip04-ppe', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hpe,gxp-sysreg', 'intel,lgm-syscon', 'loongson,ls1b-syscon', 'loongson,ls1c-syscon', 'lsi,axxia-syscon', 'marvell,armada-3700-cpu-misc', 'marvell,armada-3700-nb-pm', 'marvell,armada-3700-avs', 'marvell,armada-3700-usb2-host-misc', 'marvell,dove-global-config', 'mediatek,mt2701-pctl-a-syscfg', 'mediatek,mt2712-pctl-a-syscfg', 'mediatek,mt6397-pctl-pmic-syscfg', 'mediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,mt8173-pctl-a-syscfg', 'mediatek,mt8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sam9x60-sfr', 'microchip,sama7g5-ddr3phy', 'microchip,sparx5-cpu-syscon', 'mscc,ocelot-cpu-syscon', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'rockchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,rk3128-qos', 'rockchip,rk3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-qos', 'rockchip,rk3568-qos', 'rockchi
 p,rk3588-qos', 'rockchip,rv1126-qos', 'st,spear1340-misc', 'stericsson,nomadik-pmu', 'starfive,jh7100-sysmain', 'ti,am62-opp-efuse-table', 'ti,am62-usb-phy-ctrl', 'ti,am625-dss-oldi-io-ctrl', 'ti,am62p-cpsw-mac-efuse', 'ti,am654-dss-oldi-io-ctrl', 'ti,am654-serdes-ctrl', 'ti,j784s4-pcie-ctrl', 'ti,keystone-pllctrl']
	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#







Return-Path: <linux-arm-msm+bounces-58260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162EABAA4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 15:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 118EE1B6528D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 13:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CDE202981;
	Sat, 17 May 2025 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdAroKLu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA9938384;
	Sat, 17 May 2025 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747487912; cv=none; b=AhpSMeJ56BiGAvUWprbVDQnrefpgwqTgtsgWs+5bblNdH69CssX6FXTUb9gYVLAq7zWCBQYYRMEjGllMrk3oP2Akrjr+LBzCHG8+2iyox0XWqqS/SMCsfvG2pexWlM/QwTGQM7pUq0wR/rqqSrSzTyabq7B/t7Ot9bN9xpi/Cto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747487912; c=relaxed/simple;
	bh=US8U34UabYbHna4fUgSm3gTrAsIdgyEJ1Ed5QBjytYI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=njnr6ztpfGGaHwsU42vSt1OHaXLnNP1WVGilBiGbYkSGDBj2Up35jnWM2+arYABUPci1teXMDfeUaqqAcgIa26N70YCxRu+s9mf8N4nY+rt76JSlPF6J6eO59Zb//IDCRvFTjddnCL/YhAP/ZUG3a76VGg+0rNnH4jVp+EeuYoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdAroKLu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE1DC4CEE3;
	Sat, 17 May 2025 13:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747487912;
	bh=US8U34UabYbHna4fUgSm3gTrAsIdgyEJ1Ed5QBjytYI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RdAroKLuNahjkSUSyk9xo1Ntb/DTILI+Jps8IjhDtXqC0FWYTkZChPtl1rSp9e04D
	 9kP5A+fOeRGzjx0TwCW7q5vIeW3lJIxutlrpBq6+4o4WSfVvN2XMJNAHI0vYdpABVG
	 lSswuTijumpEZYSc2pJoEvVqBx/3QeJpA/milz86DZVk60iYDk3u0fKH4sKFAgWKTm
	 tIjFSi7L5/MUrk586lYrO1Z8GE4O86PZJqCALIaJYRFGA/qx4lpW6L6al4+gW6CDJR
	 RIlr3rQiSW01YHMbmnOBCsGWFyWGv56GRiDgHcjoEN5EAZtlGBaH8/9XTnMNVKAzpF
	 BtYGmxQ3XWZQg==
Date: Sat, 17 May 2025 08:18:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
References: <20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz>
Message-Id: <174748777105.930550.1125759790354960615.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: Add Lenovo ThinkBook 16
 device tree


On Fri, 16 May 2025 08:42:58 +0200, Jens Glathe wrote:
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> 
> Supported features:
> 
> - USB type-c and type-a ports
> - Keyboard
> - Touchpad (all that are described in the dsdt)
> - Touchscreen (described in the dsdt, no known SKUss)
> - Display including PWM backlight control
> - PCIe devices
> - nvme
> - SDHC card reader
> - ath12k WCN7850 Wifi and Bluetooth
> - ADSP and CDSP
> - GPIO keys (Lid switch)
> - Sound via internal speakers / DMIC / USB / headphone jack
> - DP Altmode with 2 lanes (as all of these still do)
> - Integrated fingerprint reader (FPC)
> - Integrated UVC camera
> 
> Not supported yet:
> 
> - HDMI port.
> - EC and some fn hotkeys.
> 
> Limited support yet:
> 
> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not the faster ones.
> 
> - The Purwa SoC has 8 compute cores and a different GPU (X1-45, apparently A730).
> The GPU is not yet supported. Graphics is only software rendered.
> The SoC has 2 instead of 3 thermal sensor banks. I have disabled all sensors on
> the 3rd bank to get rid of dmesg errors. Many of these sensor nodes have a place
> on the remaining 2 banks, but I don't know which. So the thermal management is
> clearly incomplete, but the firmware monitoring the chip does a power off before
> overheating (not experienced yet). For the Thinkbook, it has a pretty decent fan
> that can develop some air flow, so maybe this has prevented the emergency cutoff.
> As a result of these unknowns, I had to modify x1e80100.dtsi and x1p42100.dtsi to
> delete the non-existend nodes.
> 
> This work was done without any schematics or non-public knowledge of the device.
> So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
> ARM64, and pure guesswork. It has been confirmed, however, that the device really
> has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> @43).
> 
> I have brought up the Thinkbook over the last 4 months since the x1p42100-crd
> patches were available. The laptop is very usable now, and quite solid as a dev/
> test platform. GPU support would be nice, though :)
> 
> Big thanks to Alexandrs Vinarkis for helping (and sort of persisting) on the
> fingerprint, camera and HDMI issues.
> 
> [1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> Changes in v2:
> - removed nodes that gave DTC compile errors (pm8010_thermal, edp0_hpd_active)
> - amended qcom.yaml
> - shortened the commit titles to fit 75 chars
> - Link to v1: https://lore.kernel.org/r/20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz
> 
> ---
> Jens Glathe (4):
>       dt-bindings: arm: qcom: Add Lenovo TB16 support
>       firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
>       arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook 16 G7 QOY
>       arm64: dts: qcom: Add Lenovo ThinkBook 16 device tree
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   30 +-
>  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1649 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi             |   16 +
>  drivers/firmware/qcom/qcom_scm.c                   |    1 +
>  6 files changed, 1685 insertions(+), 15 deletions(-)
> ---
> base-commit: 484803582c77061b470ac64a634f25f89715be3f
> change-id: 20250511-tb16-dt-e84c433d87b1
> 
> Best regards,
> --
> Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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
 Base: using specified base-commit 484803582c77061b470ac64a634f25f89715be3f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz:

arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: / (lenovo,thinkbook-16): compatible: 'oneOf' conditional failed, one must be fixed:
	['lenovo,thinkbook-16', 'qcom,x1e80100'] is too short
	'lenovo,thinkbook-16' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
	'lenovo,thinkbook-16' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
	'lenovo,thinkbook-16' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
	'lenovo,thinkbook-16' is not one of ['qcom,apq8074-dragonboard']
	'lenovo,thinkbook-16' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
	'lenovo,thinkbook-16' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
	'lenovo,thinkbook-16' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
	'lenovo,thinkbook-16' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
	'lenovo,thinkbook-16' is not one of ['wingtech,wt82918hd']
	'lenovo,thinkbook-16' is not one of ['huawei,kiwi', 'longcheer,l9100', 'samsung,a7', 'sony,kanuti-tulip', 'square,apq8039-t2', 'wingtech,wt82918', 'wingtech,wt82918hdhw39']
	'lenovo,thinkbook-16' is not one of ['sony,kugo-row', 'sony,suzu-row']
	'lenovo,thinkbook-16' is not one of ['qcom,msm8960-cdp', 'samsung,expressatt']
	'lenovo,thinkbook-16' is not one of ['lge,hammerhead', 'samsung,hlte', 'sony,xperia-amami', 'sony,xperia-honami']
	'lenovo,thinkbook-16' is not one of ['fairphone,fp2', 'htc,m8', 'oneplus,bacon', 'samsung,klte', 'sony,xperia-aries', 'sony,xperia-castor', 'sony,xperia-leo']
	'lenovo,thinkbook-16' is not one of ['samsung,kltechn']
	'lenovo,thinkbook-16' is not one of ['acer,a1-724', 'alcatel,idol347', 'asus,z00l', 'gplus,fl8005a', 'huawei,g7', 'lg,c50', 'lg,m216', 'longcheer,l8910', 'longcheer,l8150', 'motorola,harpia', 'motorola,osprey', 'motorola,surnia', 'qcom,msm8916-mtp', 'samsung,a3u-eur', 'samsung,a5u-eur', 'samsung,e5', 'samsung,e7', 'samsung,fortuna3g', 'samsung,gprimeltecan', 'samsung,grandmax', 'samsung,grandprimelte', 'samsung,gt510', 'samsung,gt58', 'samsung,j3ltetw', 'samsung,j5', 'samsung,j5x', 'samsung,rossa', 'samsung,serranove', 'thwc,uf896', 'thwc,ufi001c', 'wingtech,wt86518', 'wingtech,wt86528', 'wingtech,wt88047', 'yiming,uz801-v3']
	'lenovo,thinkbook-16' is not one of ['xiaomi,riva']
	'lenovo,thinkbook-16' is not one of ['motorola,potter', 'xiaomi,daisy', 'xiaomi,mido', 'xiaomi,tissot', 'xiaomi,vince']
	'lenovo,thinkbook-16' is not one of ['lg,bullhead', 'lg,h815', 'microsoft,talkman', 'xiaomi,libra']
	'lenovo,thinkbook-16' is not one of ['sony,karin_windy']
	'lenovo,thinkbook-16' is not one of ['huawei,angler', 'microsoft,cityman', 'sony,ivy-row', 'sony,karin-row', 'sony,satsuki-row', 'sony,sumire-row', 'sony,suzuran-row']
	'lenovo,thinkbook-16' is not one of ['arrow,apq8096-db820c', 'inforce,ifc6640']
	'lenovo,thinkbook-16' is not one of ['oneplus,oneplus3', 'oneplus,oneplus3t', 'qcom,msm8996-mtp', 'sony,dora-row', 'sony,kagura-row', 'sony,keyaki-row', 'xiaomi,gemini']
	'lenovo,thinkbook-16' is not one of ['xiaomi,natrium', 'xiaomi,scorpio']
	'lenovo,thinkbook-16' is not one of ['asus,novago-tp370ql', 'fxtec,pro1', 'hp,envy-x2', 'lenovo,miix-630', 'oneplus,cheeseburger', 'oneplus,dumpling', 'qcom,msm8998-mtp', 'sony,xperia-lilac', 'sony,xperia-maple', 'sony,xperia-poplar', 'xiaomi,sagit']
	'lenovo,thinkbook-16' is not one of ['8dev,jalapeno', 'alfa-network,ap120c-ac']
	'lenovo,thinkbook-16' is not one of ['qcom,ipq4019-ap-dk01.1-c1', 'qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
	'lenovo,thinkbook-16' is not one of ['qcom,ipq5018-rdp432-c2', 'tplink,archer-ax55-v1']
	'lenovo,thinkbook-16' is not one of ['qcom,ipq5332-ap-mi01.2', 'qcom,ipq5332-ap-mi01.3', 'qcom,ipq5332-ap-mi01.6', 'qcom,ipq5332-ap-mi01.9']
	'lenovo,thinkbook-16' is not one of ['qcom,ipq5424-rdp466']
	'lenovo,thinkbook-16' is not one of ['mikrotik,rb3011', 'qcom,ipq8064-ap148']
	'lenovo,thinkbook-16' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq8074-hk10-c2']
	'lenovo,thinkbook-16' is not one of ['qcom,ipq9574-ap-al02-c2', 'qcom,ipq9574-ap-al02-c6', 'qcom,ipq9574-ap-al02-c7', 'qcom,ipq9574-ap-al02-c8', 'qcom,ipq9574-ap-al02-c9']
	'swir,mangoh-green-wp8548' was expected
	'lenovo,thinkbook-16' is not one of ['qcom,qrb2210-rb1']
	'lenovo,thinkbook-16' is not one of ['fairphone,fp5', 'qcom,qcm6490-idp', 'qcom,qcs6490-rb3gen2', 'shift,otter']
	'lenovo,thinkbook-16' is not one of ['qcom,qdu1000-idp', 'qcom,qdu1000-x100']
	'lenovo,thinkbook-16' is not one of ['qcom,qru1000-idp']
	'lenovo,thinkbook-16' is not one of ['qcom,qar2130p']
	'lenovo,thinkbook-16' is not one of ['acer,aspire1', 'qcom,sc7180-idp']
	'google,coachz-rev1' was expected
	'google,coachz' was expected
	'google,coachz-rev1-sku0' was expected
	'google,coachz-sku0' was expected
	'google,homestar-rev2' was expected
	'google,homestar-rev3' was expected
	'google,homestar' was expected
	'google,kingoftown-rev0' was expected
	'google,kingoftown' was expected
	'google,lazor-rev0' was expected
	'google,lazor-rev1' was expected
	'google,lazor-rev3' was expected
	'google,lazor-rev9' was expected
	'google,lazor' was expected
	'google,lazor-rev1-sku2' was expected
	'google,lazor-rev3-sku2' was expected
	'google,lazor-rev9-sku2' was expected
	'google,lazor-sku2' was expected
	'google,lazor-rev1-sku0' was expected
	'google,lazor-rev3-sku0' was expected
	'google,lazor-rev9-sku0' was expected
	'google,lazor-sku0' was expected
	'google,lazor-rev4-sku4' was expected
	'google,lazor-rev9-sku4' was expected
	'google,lazor-sku4' was expected
	'google,lazor-rev4-sku5' was expected
	'google,lazor-rev5-sku5' was expected
	'google,lazor-rev9-sku6' was expected
	'google,lazor-sku6' was expected
	'google,mrbland-rev0-sku0' was expected
	'google,mrbland-sku1536' was expected
	'google,mrbland-rev0-sku16' was expected
	'google,mrbland-sku1024' was expected
	'google,pazquel-sku5' was expected
	'google,pazquel-sku1' was expected
	'google,pazquel-sku6' was expected
	'google,pazquel-sku0' was expected
	'google,pazquel-sku22' was expected
	'google,pazquel-sku21' was expected
	'google,pompom-rev1' was expected
	'google,pompom-rev2' was expected
	'google,pompom' was expected
	'google,pompom-rev1-sku0' was expected
	'google,pompom-rev2-sku0' was expected
	'google,pompom-sku0' was expected
	'google,quackingstick-sku1537' was expected
	'google,quackingstick-sku1536' was expected
	'google,trogdor' was expected
	'google,trogdor-sku0' was expected
	'google,wormdingler-rev0-sku16' was expected
	'google,wormdingler-sku1024' was expected
	'google,wormdingler-sku1025' was expected
	'google,wormdingler-rev0-sku0' was expected
	'google,wormdingler-sku0' was expected
	'google,wormdingler-sku1' was expected
	'qcom,sc7280-crd' was expected
	'google,zoglin' was expected
	'google,zoglin-sku1536' was expected
	'qcom,sc7280-idp' was expected
	'qcom,sc7280-idp2' was expected
	'google,evoker' was expected
	'google,evoker-sku512' was expected
	'google,herobrine' was expected
	'google,villager-rev0' was expected
	'google,villager' was expected
	'google,villager-sku512' was expected
	'google,zombie' was expected
	'google,zombie-sku512' was expected
	'google,zombie-sku2' was expected
	'google,zombie-sku514' was expected
	'lenovo,thinkbook-16' is not one of ['lenovo,flex-5g', 'microsoft,surface-prox', 'qcom,sc8180x-primus']
	'lenovo,thinkbook-16' is not one of ['huawei,gaokun3', 'lenovo,thinkpad-x13s', 'microsoft,arcata', 'microsoft,blackrock', 'qcom,sc8280xp-crd', 'qcom,sc8280xp-qrd']
	'lenovo,thinkbook-16' is not one of ['lenovo,tbx605f', 'motorola,ali']
	'lenovo,thinkbook-16' is not one of ['sony,discovery-row', 'sony,kirin-row', 'sony,pioneer-row', 'sony,voyager-row']
	'lenovo,thinkbook-16' is not one of ['inforce,ifc6560']
	'lenovo,thinkbook-16' is not one of ['fairphone,fp3', 'motorola,ocean']
	'lenovo,thinkbook-16' is not one of ['sony,mermaid-row']
	'lenovo,thinkbook-16' is not one of ['xiaomi,lavender']
	'lenovo,thinkbook-16' is not one of ['google,sargo']
	'lenovo,thinkbook-16' is not one of ['qcom,sdx55-mtp', 'qcom,sdx55-telit-fn980-tlb', 'qcom,sdx55-t55']
	'lenovo,thinkbook-16' is not one of ['qcom,sdx65-mtp']
	'lenovo,thinkbook-16' is not one of ['qcom,sdx75-idp']
	'lenovo,thinkbook-16' is not one of ['qcom,ipq6018-cp01', 'qcom,ipq6018-cp01-c1']
	'lenovo,thinkbook-16' is not one of ['qcom,qcs404-evb-1000', 'qcom,qcs404-evb-4000']
	'lenovo,thinkbook-16' is not one of ['qcom,qcs8300-ride']
	'lenovo,thinkbook-16' is not one of ['qcom,qcs615-ride']
	'lenovo,thinkbook-16' is not one of ['qcom,sa8155p-adp']
	'lenovo,thinkbook-16' is not one of ['qcom,sa8295p-adp', 'qcom,sa8540p-ride']
	'lenovo,thinkbook-16' is not one of ['qcom,sa8775p-ride', 'qcom,sa8775p-ride-r3']
	'lenovo,thinkbook-16' is not one of ['qcom,qcs9100-ride', 'qcom,qcs9100-ride-r3']
	'lenovo,thinkbook-16' is not one of ['google,cheza', 'google,cheza-rev1', 'google,cheza-rev2', 'lenovo,yoga-c630', 'lg,judyln', 'lg,judyp', 'oneplus,enchilada', 'oneplus,fajita', 'qcom,sdm845-mtp', 'shift,axolotl', 'samsung,starqltechn', 'samsung,w737', 'sony,akari-row', 'sony,akatsuki-row', 'sony,apollo-row', 'thundercomm,db845c', 'xiaomi,beryllium', 'xiaomi,beryllium-ebbg', 'xiaomi,polaris']
	'lenovo,thinkbook-16' is not one of ['oneplus,billie2']
	'lenovo,thinkbook-16' is not one of ['qcom,qrb4210-rb2']
	'lenovo,thinkbook-16' is not one of ['qcom,sm4450-qrd']
	'lenovo,thinkbook-16' is not one of ['fxtec,pro1x']
	'lenovo,thinkbook-16' is not one of ['lenovo,j606f']
	'lenovo,thinkbook-16' is not one of ['sony,pdx201', 'xiaomi,ginkgo', 'xiaomi,laurel-sprout']
	'lenovo,thinkbook-16' is not one of ['sony,pdx213']
	'lenovo,thinkbook-16' is not one of ['sony,pdx225']
	'lenovo,thinkbook-16' is not one of ['xiaomi,curtana', 'xiaomi,joyeuse']
	'lenovo,thinkbook-16' is not one of ['google,sunfish']
	'lenovo,thinkbook-16' is not one of ['fairphone,fp4']
	'lenovo,thinkbook-16' is not one of ['nothing,spacewar']
	'lenovo,thinkbook-16' is not one of ['microsoft,surface-duo', 'qcom,sm8150-hdk', 'qcom,sm8150-mtp', 'sony,bahamut-generic', 'sony,griffin-generic']
	'lenovo,thinkbook-16' is not one of ['qcom,qrb5165-rb5', 'qcom,sm8250-hdk', 'qcom,sm8250-mtp', 'sony,pdx203-generic', 'sony,pdx206-generic', 'xiaomi,elish', 'xiaomi,pipa']
	'lenovo,thinkbook-16' is not one of ['microsoft,surface-duo2', 'qcom,sm8350-hdk', 'qcom,sm8350-mtp', 'sony,pdx214-generic', 'sony,pdx215-generic']
	'lenovo,thinkbook-16' is not one of ['qcom,sm8450-hdk', 'qcom,sm8450-qrd', 'sony,pdx223', 'sony,pdx224']
	'lenovo,thinkbook-16' is not one of ['qcom,sm8550-hdk', 'qcom,sm8550-mtp', 'qcom,sm8550-qrd', 'samsung,q5q', 'sony,pdx234']
	'lenovo,thinkbook-16' is not one of ['qcom,qcs8550-aim300-aiot']
	'lenovo,thinkbook-16' is not one of ['qcom,sm8650-hdk', 'qcom,sm8650-mtp', 'qcom,sm8650-qrd']
	'lenovo,thinkbook-16' is not one of ['qcom,sm8750-mtp', 'qcom,sm8750-qrd']
	'lenovo,thinkbook-16' is not one of ['qcom,x1e001de-devkit']
	'lenovo,thinkbook-16' is not one of ['lenovo,thinkpad-t14s-lcd', 'lenovo,thinkpad-t14s-oled']
	'lenovo,thinkbook-16' is not one of ['asus,vivobook-s15', 'asus,zenbook-a14-ux3407ra', 'dell,xps13-9345', 'hp,elitebook-ultra-g1q', 'hp,omnibook-x14', 'lenovo,yoga-slim7x', 'microsoft,romulus13', 'microsoft,romulus15', 'qcom,x1e80100-crd', 'qcom,x1e80100-qcp']
	'qcom,apq8016' was expected
	'qcom,apq8026' was expected
	'qcom,apq8064' was expected
	'qcom,apq8074' was expected
	'qcom,msm8660' was expected
	'qcom,apq8084' was expected
	'qcom,msm8226' was expected
	'qcom,msm8926' was expected
	'qcom,msm8929' was expected
	'qcom,msm8939' was expected
	'qcom,msm8956' was expected
	'qcom,msm8960' was expected
	'qcom,msm8974' was expected
	'qcom,msm8974pro' was expected
	'samsung,klte' was expected
	'qcom,msm8916' was expected
	'qcom,msm8917' was expected
	'qcom,msm8953' was expected
	'qcom,msm8992' was expected
	'qcom,apq8094' was expected
	'qcom,msm8994' was expected
	'qcom,apq8096-sbc' was expected
	'qcom,msm8996' was expected
	'qcom,msm8996pro' was expected
	'qcom,msm8998' was expected
	'qcom,ipq4018' was expected
	'qcom,ipq4019' was expected
	'qcom,ipq5018' was expected
	'qcom,ipq5332' was expected
	'qcom,ipq5424' was expected
	'qcom,ipq8064' was expected
	'qcom,ipq8074' was expected
	'qcom,ipq9574' was expected
	'swir,wp8548' was expected
	'qcom,qrb2210' was expected
	'qcom,qcm6490' was expected
	'qcom,qdu1000' was expected
	'qcom,qru1000' was expected
	'qcom,sar2130p' was expected
	'qcom,sc7180' was expected
	'google,coachz-rev2' was expected
	'google,coachz-rev2-sku0' was expected
	'google,homestar-rev23' was expected
	'google,lazor-rev2' was expected
	'google,lazor-rev4' was expected
	'google,lazor-rev2-sku2' was expected
	'google,lazor-rev4-sku2' was expected
	'google,lazor-rev2-sku0' was expected
	'google,lazor-rev4-sku0' was expected
	'google,lazor-rev9-sku10' was expected
	'google,lazor-sku10' was expected
	'google,lazor-rev5-sku4' was expected
	'google,lazor-rev9-sku15' was expected
	'google,lazor-sku15' was expected
	'google,lazor-rev5-sku6' was expected
	'google,lazor-rev9-sku18' was expected
	'google,lazor-sku18' was expected
	'google,mrbland-sku768' was expected
	'google,pazquel-sku4' was expected
	'google,pazquel-sku2' was expected
	'google,pazquel-sku20' was expected
	'google,hoglin-rev3' was expected
	'google,hoglin' was expected
	'google,hoglin-sku1536' was expected
	'google,senor' was expected
	'google,piglin' was expected
	'qcom,sc7280' was expected
	'google,zombie-sku3' was expected
	'qcom,sc8180x' was expected
	'qcom,sc8280xp' was expected
	'qcom,sdm450' was expected
	'qcom,sdm630' was expected
	'qcom,sda660' was expected
	'qcom,sdm632' was expected
	'qcom,sdm636' was expected
	'qcom,sdm660' was expected
	'qcom,sdm670' was expected
	'qcom,sdx55' was expected
	'qcom,sdx65' was expected
	'qcom,sdx75' was expected
	'qcom,ipq6018' was expected
	'qcom,qcs404-evb' was expected
	'qcom,qcs8300' was expected
	'qcom,qcs615' was expected
	'qcom,sa8155p' was expected
	'qcom,sa8540p' was expected
	'qcom,sa8775p' was expected
	'qcom,qcs9100' was expected
	'qcom,sdm845' was expected
	'qcom,sm4250' was expected
	'qcom,qrb4210' was expected
	'qcom,sm4450' was expected
	'qcom,sm6115' was expected
	'qcom,sm6115p' was expected
	'qcom,sm6125' was expected
	'qcom,sm6350' was expected
	'qcom,sm6375' was expected
	'qcom,sm7125' was expected
	'qcom,sm7150' was expected
	'qcom,sm7225' was expected
	'qcom,sm7325' was expected
	'qcom,sm8150' was expected
	'qcom,sm8250' was expected
	'qcom,sm8350' was expected
	'qcom,sm8450' was expected
	'qcom,sm8550' was expected
	'qcom,qcs8550-aim300' was expected
	'qcom,sm8650' was expected
	'qcom,sm8750' was expected
	'qcom,x1e001de' was expected
	'lenovo,thinkpad-t14s' was expected
	'qcom,x1p42100' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: panel (lenovo,len160wuxga): 'backlight' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,atna33xc20.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: panel (lenovo,len160wuxga): compatible: 'oneOf' conditional failed, one must be fixed:
	['lenovo,len160wuxga', 'samsung,atna33xc20'] is too long
	'samsung,atna33xc20' was expected
	'lenovo,len160wuxga' is not one of ['samsung,atna40yk20', 'samsung,atna45af01', 'samsung,atna45dc02', 'samsung,atna56ac03']
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,atna33xc20.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: failed to match any schema with compatible: ['lenovo,len160wuxga', 'samsung,atna33xc20']







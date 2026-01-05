Return-Path: <linux-arm-msm+bounces-87536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA0BCF51FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 18:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 603573007933
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 17:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A931833BBC4;
	Mon,  5 Jan 2026 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPPvo3uN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C0338598;
	Mon,  5 Jan 2026 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767635963; cv=none; b=kbwJr0uxlIQSTVCFPWt/+V56tIcI8OaOtVMe63JfRoFVQdruHpOcrCN1Crz1OI6QfBUL4nCD0tj8nLH2Iq7bfs/F6IIICduAbW6/LLSJvH2y1kd523B++LBaFy5XMi1laMHnH27nLyUpgqobDWvuFx5mDCywks1YbDv3eNs9X2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767635963; c=relaxed/simple;
	bh=38lfFq1vG3Ei2s2fHA+ybdTaOcqKJy6oNtVPeQ/HGOE=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=M8gvllhdj41b4skGv2tXFyQs0QLZqvvx04MnyioaOeeNk5j2nD8oQpcJRx3VW67kVcpLGsxMWnjyTjOOBLsQIql6PornmtRRudzcRd17sY6M3shX2dY3NHrkaQodKrQpTPj8uWrfBGWcHREtBnJZ3Rw3CVIPCPT05MqDDpwd6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPPvo3uN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF10C116D0;
	Mon,  5 Jan 2026 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767635963;
	bh=38lfFq1vG3Ei2s2fHA+ybdTaOcqKJy6oNtVPeQ/HGOE=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=iPPvo3uNxklgiQNoVAOPnGdixavH/RJn7uefogsdZJ8EIbNu2vI5XvKnMr+CvUOTH
	 ToB4IeUG53IbB/Prqd8OjJKAIirnbqJKHDX8nZ7ONL+AMT7p7IF/JEyxo+D65TgLXL
	 Kqvpok2PQiiytLa64rJ13MTCGU/JcrM4XJqGrpoBATdjqJgr1TwGlbX7Um9rbMqjyl
	 KENTZwO20N1+jZniv2QWQ11gyIO25jQ5/9+M9+SvaePsOfI1jNrlrIQ/5wUgOJO/Lu
	 euYuxOQOOIB2sx0eclcAs3+oPKiY25rQqJc6N9fTBSN7RP87whgDRRGEgKR5xDv6LI
	 0b50b2K6La+tQ==
From: Rob Herring <robh@kernel.org>
Date: Mon, 05 Jan 2026 11:59:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org
To: weifu wu <boss@oi-io.cc>
In-Reply-To: <tencent_9C28E18B378E0835E704B3173AC4045BA606@qq.com>
References: <tencent_9C28E18B378E0835E704B3173AC4045BA606@qq.com>
Message-Id: <176763568528.3016971.2841916910009383489.robh@kernel.org>
Subject: Re: [PATCH 2/2] [PATCH v1 2/2] arm64: dts: qcom: add Acer Swift
 SFA14-11 device tree


On Sun, 04 Jan 2026 22:37:08 +0800, weifu wu wrote:
> Add initial device tree for Acer Swift SFA14-11 laptop based on
> Qualcomm X1E78100 SoC. This enables basic peripherals including
> eDP panel, backlight, USB and PCIe.
> 
> Tested by building dtbs and booting on the target hardware.
> 
> Signed-off-by: weifu wu <boss@oi-io.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1650 +++++++++++++++++
>  2 files changed, 1652 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts
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
 Base: tags/v6.19-rc1-22-g328407ba89ae (exact match)
 Base: tags/v6.19-rc1-22-g328407ba89ae (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for tencent_9C28E18B378E0835E704B3173AC4045BA606@qq.com:

arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dtb: / (acer,swift-sfa14-11): compatible: 'oneOf' conditional failed, one must be fixed:
	['acer,swift-sfa14-11', 'lenovo,thinkpad-t14s', 'qcom,x1e78100', 'qcom,x1e80100'] is too long
	['acer,swift-sfa14-11', 'lenovo,thinkpad-t14s', 'qcom,x1e78100', 'qcom,x1e80100'] is too short
	'acer,swift-sfa14-11' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
	'acer,swift-sfa14-11' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
	'acer,swift-sfa14-11' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
	'acer,swift-sfa14-11' is not one of ['qcom,apq8074-dragonboard']
	'acer,swift-sfa14-11' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
	'acer,swift-sfa14-11' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
	'acer,swift-sfa14-11' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
	'acer,swift-sfa14-11' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
	'acer,swift-sfa14-11' is not one of ['wingtech,wt82918hd']
	'acer,swift-sfa14-11' is not one of ['asus,z00t', 'huawei,kiwi', 'longcheer,l9100', 'samsung,a7', 'sony,kanuti-tulip', 'square,apq8039-t2', 'wingtech,wt82918', 'wingtech,wt82918hdhw39']
	'acer,swift-sfa14-11' is not one of ['sony,kugo-row', 'sony,suzu-row']
	'acer,swift-sfa14-11' is not one of ['qcom,msm8960-cdp', 'samsung,expressatt']
	'acer,swift-sfa14-11' is not one of ['sony,huashan']
	'acer,swift-sfa14-11' is not one of ['lge,hammerhead', 'samsung,hlte', 'sony,xperia-amami', 'sony,xperia-honami', 'sony,xperia-togari']
	'acer,swift-sfa14-11' is not one of ['fairphone,fp2', 'htc,m8', 'oneplus,bacon', 'samsung,klte', 'sony,xperia-aries', 'sony,xperia-castor', 'sony,xperia-leo']
	'acer,swift-sfa14-11' is not one of ['samsung,kltechn']
	'acer,swift-sfa14-11' is not one of ['longcheer,l9360']
	'acer,swift-sfa14-11' is not one of ['acer,a1-724', 'alcatel,idol347', 'asus,z00l', 'gplus,fl8005a', 'huawei,g7', 'lg,c50', 'lg,m216', 'longcheer,l8910', 'longcheer,l8150', 'motorola,harpia', 'motorola,osprey', 'motorola,surnia', 'qcom,msm8916-mtp', 'samsung,a3u-eur', 'samsung,a5u-eur', 'samsung,e5', 'samsung,e7', 'samsung,fortuna3g', 'samsung,gprimeltecan', 'samsung,grandmax', 'samsung,grandprimelte', 'samsung,gt510', 'samsung,gt58', 'samsung,j3ltetw', 'samsung,j5', 'samsung,j5x', 'samsung,rossa', 'samsung,serranove', 'thwc,uf896', 'thwc,ufi001c', 'wingtech,wt86518', 'wingtech,wt86528', 'wingtech,wt88047', 'yiming,uz801-v3']
	'acer,swift-sfa14-11' is not one of ['xiaomi,riva']
	'acer,swift-sfa14-11' is not one of ['xiaomi,land']
	'acer,swift-sfa14-11' is not one of ['flipkart,rimob', 'motorola,potter', 'xiaomi,daisy', 'xiaomi,mido', 'xiaomi,tissot', 'xiaomi,vince']
	'acer,swift-sfa14-11' is not one of ['lg,bullhead', 'lg,h815', 'microsoft,talkman', 'xiaomi,libra']
	'acer,swift-sfa14-11' is not one of ['sony,karin_windy']
	'acer,swift-sfa14-11' is not one of ['huawei,angler', 'microsoft,cityman', 'sony,ivy-row', 'sony,karin-row', 'sony,satsuki-row', 'sony,sumire-row', 'sony,suzuran-row']
	'acer,swift-sfa14-11' is not one of ['arrow,apq8096-db820c', 'inforce,ifc6640']
	'acer,swift-sfa14-11' is not one of ['oneplus,oneplus3', 'oneplus,oneplus3t', 'qcom,msm8996-mtp', 'sony,dora-row', 'sony,kagura-row', 'sony,keyaki-row', 'xiaomi,gemini']
	'acer,swift-sfa14-11' is not one of ['xiaomi,natrium', 'xiaomi,scorpio']
	'acer,swift-sfa14-11' is not one of ['asus,novago-tp370ql', 'fxtec,pro1', 'hp,envy-x2', 'lenovo,miix-630', 'oneplus,cheeseburger', 'oneplus,dumpling', 'qcom,msm8998-mtp', 'sony,xperia-lilac', 'sony,xperia-maple', 'sony,xperia-poplar', 'xiaomi,sagit']
	'acer,swift-sfa14-11' is not one of ['8dev,jalapeno', 'alfa-network,ap120c-ac']
	'acer,swift-sfa14-11' is not one of ['qcom,ipq4019-ap-dk01.1-c1', 'qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
	'acer,swift-sfa14-11' is not one of ['qcom,ipq5018-rdp432-c2', 'tplink,archer-ax55-v1']
	'acer,swift-sfa14-11' is not one of ['qcom,ipq5332-ap-mi01.2', 'qcom,ipq5332-ap-mi01.3', 'qcom,ipq5332-ap-mi01.6', 'qcom,ipq5332-ap-mi01.9']
	'acer,swift-sfa14-11' is not one of ['qcom,ipq5424-rdp466']
	'acer,swift-sfa14-11' is not one of ['mikrotik,rb3011', 'qcom,ipq8064-ap148']
	'acer,swift-sfa14-11' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq8074-hk10-c2']
	'acer,swift-sfa14-11' is not one of ['qcom,ipq9574-ap-al02-c2', 'qcom,ipq9574-ap-al02-c6', 'qcom,ipq9574-ap-al02-c7', 'qcom,ipq9574-ap-al02-c8', 'qcom,ipq9574-ap-al02-c9']
	'acer,swift-sfa14-11' is not one of ['qcom,kaanapali-mtp', 'qcom,kaanapali-qrd']
	'swir,mangoh-green-wp8548' was expected
	'acer,swift-sfa14-11' is not one of ['qcom,qrb2210-rb1']
	'acer,swift-sfa14-11' is not one of ['fairphone,fp5', 'particle,tachyon', 'qcom,qcm6490-idp', 'qcom,qcs6490-rb3gen2', 'radxa,dragon-q6a', 'shift,otter']
	'acer,swift-sfa14-11' is not one of ['qcom,qdu1000-idp', 'qcom,qdu1000-x100']
	'acer,swift-sfa14-11' is not one of ['qcom,qru1000-idp']
	'acer,swift-sfa14-11' is not one of ['qcom,qar2130p']
	'acer,swift-sfa14-11' is not one of ['acer,aspire1', 'qcom,sc7180-idp']
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
	'acer,swift-sfa14-11' is not one of ['lenovo,flex-5g', 'microsoft,surface-prox', 'qcom,sc8180x-primus']
	'acer,swift-sfa14-11' is not one of ['huawei,gaokun3', 'lenovo,thinkpad-x13s', 'microsoft,arcata', 'microsoft,blackrock', 'qcom,sc8280xp-crd', 'qcom,sc8280xp-qrd']
	'acer,swift-sfa14-11' is not one of ['lenovo,tbx605f', 'motorola,ali']
	'acer,swift-sfa14-11' is not one of ['sony,discovery-row', 'sony,kirin-row', 'sony,pioneer-row', 'sony,voyager-row']
	'acer,swift-sfa14-11' is not one of ['inforce,ifc6560']
	'acer,swift-sfa14-11' is not one of ['fairphone,fp3', 'motorola,ocean']
	'acer,swift-sfa14-11' is not one of ['sony,mermaid-row']
	'acer,swift-sfa14-11' is not one of ['xiaomi,lavender']
	'acer,swift-sfa14-11' is not one of ['google,sargo']
	'acer,swift-sfa14-11' is not one of ['qcom,sdx55-mtp', 'qcom,sdx55-telit-fn980-tlb', 'qcom,sdx55-t55']
	'acer,swift-sfa14-11' is not one of ['qcom,sdx65-mtp']
	'acer,swift-sfa14-11' is not one of ['qcom,sdx75-idp']
	'acer,swift-sfa14-11' is not one of ['qcom,ipq6018-cp01', 'qcom,ipq6018-cp01-c1']
	'acer,swift-sfa14-11' is not one of ['qcom,qcs404-evb-1000', 'qcom,qcs404-evb-4000']
	'acer,swift-sfa14-11' is not one of ['qcom,monaco-evk', 'qcom,qcs8300-ride']
	'acer,swift-sfa14-11' is not one of ['qcom,qcs615-ride']
	'acer,swift-sfa14-11' is not one of ['qcom,sa8155p-adp']
	'acer,swift-sfa14-11' is not one of ['qcom,sa8295p-adp', 'qcom,sa8540p-ride']
	'acer,swift-sfa14-11' is not one of ['qcom,sa8775p-ride', 'qcom,sa8775p-ride-r3']
	'acer,swift-sfa14-11' is not one of ['qcom,lemans-evk', 'qcom,qcs9100-ride', 'qcom,qcs9100-ride-r3']
	'acer,swift-sfa14-11' is not one of ['huawei,planck', 'lenovo,yoga-c630', 'lg,judyln', 'lg,judyp', 'oneplus,enchilada', 'oneplus,fajita', 'qcom,sdm845-mtp', 'shift,axolotl', 'samsung,starqltechn', 'samsung,w737', 'sony,akari-row', 'sony,akatsuki-row', 'sony,apollo-row', 'thundercomm,db845c', 'xiaomi,beryllium', 'xiaomi,beryllium-ebbg', 'xiaomi,polaris']
	'acer,swift-sfa14-11' is not one of ['oneplus,billie2']
	'acer,swift-sfa14-11' is not one of ['qcom,qrb4210-rb2']
	'acer,swift-sfa14-11' is not one of ['qcom,sm4450-qrd']
	'acer,swift-sfa14-11' is not one of ['fxtec,pro1x']
	'acer,swift-sfa14-11' is not one of ['lenovo,j606f']
	'acer,swift-sfa14-11' is not one of ['sony,pdx201', 'xiaomi,ginkgo', 'xiaomi,laurel-sprout']
	'acer,swift-sfa14-11' is not one of ['sony,pdx213']
	'acer,swift-sfa14-11' is not one of ['sony,pdx225']
	'acer,swift-sfa14-11' is not one of ['xiaomi,curtana', 'xiaomi,joyeuse']
	'acer,swift-sfa14-11' is not one of ['google,sunfish']
	'acer,swift-sfa14-11' is not one of ['fairphone,fp4']
	'acer,swift-sfa14-11' is not one of ['nothing,spacewar']
	'acer,swift-sfa14-11' is not one of ['microsoft,surface-duo', 'qcom,sm8150-hdk', 'qcom,sm8150-mtp', 'sony,bahamut-generic', 'sony,griffin-generic']
	'acer,swift-sfa14-11' is not one of ['qcom,qrb5165-rb5', 'qcom,sm8250-hdk', 'qcom,sm8250-mtp', 'samsung,r8q', 'samsung,x1q', 'sony,pdx203-generic', 'sony,pdx206-generic', 'xiaomi,elish', 'xiaomi,pipa']
	'acer,swift-sfa14-11' is not one of ['microsoft,surface-duo2', 'qcom,sm8350-hdk', 'qcom,sm8350-mtp', 'sony,pdx214-generic', 'sony,pdx215-generic']
	'acer,swift-sfa14-11' is not one of ['qcom,sm8450-hdk', 'qcom,sm8450-qrd', 'samsung,r0q', 'sony,pdx223', 'sony,pdx224']
	'acer,swift-sfa14-11' is not one of ['qcom,sm8550-hdk', 'qcom,sm8550-mtp', 'qcom,sm8550-qrd', 'samsung,q5q', 'sony,pdx234']
	'acer,swift-sfa14-11' is not one of ['qcom,qcs8550-aim300-aiot']
	'acer,swift-sfa14-11' is not one of ['qcom,sm8650-hdk', 'qcom,sm8650-mtp', 'qcom,sm8650-qrd']
	'acer,swift-sfa14-11' is not one of ['qcom,sm8750-mtp', 'qcom,sm8750-qrd']
	'acer,swift-sfa14-11' is not one of ['qcom,x1e001de-devkit']
	'acer,swift-sfa14-11' is not one of ['lenovo,thinkpad-t14s-lcd', 'lenovo,thinkpad-t14s-oled']
	'acer,swift-sfa14-11' is not one of ['medion,sprchrgd14s1', 'tuxedo,elite14gen1']
	'acer,swift-sfa14-11' is not one of ['asus,vivobook-s15', 'asus,zenbook-a14-ux3407ra', 'dell,inspiron-14-plus-7441', 'dell,latitude-7455', 'dell,xps13-9345', 'hp,elitebook-ultra-g1q', 'hp,omnibook-x14', 'lenovo,yoga-slim7x', 'microsoft,romulus13', 'microsoft,romulus15', 'qcom,x1e80100-crd', 'qcom,x1e80100-qcp']
	'acer,swift-sfa14-11' is not one of ['qcom,hamoa-iot-evk']
	'acer,swift-sfa14-11' is not one of ['asus,zenbook-a14-ux3407qa-lcd', 'asus,zenbook-a14-ux3407qa-oled']
	'acer,swift-sfa14-11' is not one of ['hp,omnibook-x14-fe1', 'lenovo,thinkbook-16', 'qcom,x1p42100-crd']
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
	'qcom,msm8960t' was expected
	'qcom,msm8974' was expected
	'qcom,msm8974pro' was expected
	'samsung,klte' was expected
	'qcom,msm8976' was expected
	'qcom,msm8916' was expected
	'qcom,msm8917' was expected
	'qcom,msm8937' was expected
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
	'qcom,kaanapali' was expected
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
	'qcom,x1e78100' was expected
	'qcom,x1e80100' was expected
	'qcom,hamoa-iot-som' was expected
	'asus,zenbook-a14-ux3407qa' was expected
	'qcom,x1p42100' was expected
	'qcom,apq8096' was expected
	'qcom,mdm9615' was expected
	'qcom,qcm2290' was expected
	'google,lazor-rev5' was expected
	'google,lazor-rev5-sku2' was expected
	'google,lazor-rev5-sku0' was expected
	'google,lazor-rev6-sku4' was expected
	'google,lazor-rev6-sku6' was expected
	'google,hoglin-rev4' was expected
	'google,zombie-sku515' was expected
	'qcom,qcs404' was expected
	'qcom,sm6150' was expected
	'qcom,qcs8550' was expected
	'google,lazor-rev6' was expected
	'google,lazor-rev6-sku2' was expected
	'google,lazor-rev6-sku0' was expected
	'google,lazor-rev7-sku4' was expected
	'google,lazor-rev7-sku6' was expected
	'google,piglin-rev3' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dtb: /: failed to match any schema with compatible: ['acer,swift-sfa14-11', 'lenovo,thinkpad-t14s', 'qcom,x1e78100', 'qcom,x1e80100']







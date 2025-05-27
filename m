Return-Path: <linux-arm-msm+bounces-59581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D32AC597B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B9EA4C1A4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A68228641E;
	Tue, 27 May 2025 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLz709dV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21541280CCF;
	Tue, 27 May 2025 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368588; cv=none; b=blJfzW3pjCg6MmYi1hT5CA5OAhFOq8Ky0WdrQUSRIrT2Q9oN5jH90LDL/KD1605taspV/E/yofePbkf2YKJWc06oVPWXbEEXHi/4onbND7tr4nfPFSNG5QJ2nNHafFhtpnWUpks86rew6pR4VQRgXCnen5BAUUkGY7NQVH9f6xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368588; c=relaxed/simple;
	bh=owkLAY4Q07RyWkVKVNn0xVi0ZMlKNUvYuQQOFtKsHLE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tmBgGfOchpc5HCW7435P+aKcJJUnDmkap/YI4JWBF5n6TIyaX5ciUwLntScWo/OdD6L3OXq2Yx/kJLyntdFRb1aReWK8NbXq6d4yjGoxEqk0/+npDynYtxmXhDqmwnNh34qGBYr8iHfVlv/foBXVv1t87rShukaEIHPpw9c5eMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLz709dV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79C6C4CEF1;
	Tue, 27 May 2025 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748368587;
	bh=owkLAY4Q07RyWkVKVNn0xVi0ZMlKNUvYuQQOFtKsHLE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mLz709dVIsC3dEC2Hvny0/dHlx7dyqiklzFcyqyNWeEFCrKOgUImwJET5SPI4HD0n
	 9+jmZ8MeKGWwpFj8b05TVNGIklAwriGs+mR9BlNQtY2Q1PJTk8k5jxC4uvKEfy/Zvr
	 OEIUHjDuxaYegrVbBzNAHoKPlrPx0fKZUUaZwkZfKoNSW2aLN5GA5r3Y+1cdsezoil
	 l+urd18PbiUpZ8Vck4WOAmCgg4MD9Ed+zX9SVt3/Eows2cCMnHiwtjKhW81TYJv7mt
	 fb9IFMdB170W2VrXTEnSqBu8+H/ZiGiSqSi1Yj+F4lotPgYrddfbWw2qYSp+zo5dXo
	 Xpjsm1FurceiQ==
Date: Tue, 27 May 2025 12:56:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, quic_zijuhu@quicinc.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, quic_jiaymao@quicinc.com, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, quic_mohamull@quicinc.com
To: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <20250526054228.221095-1-quic_chejiang@quicinc.com>
References: <20250526054228.221095-1-quic_chejiang@quicinc.com>
Message-Id: <174836830852.840855.4256348742404144012.robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: Add Bluetooth support for qcs9075
 IQ-9075-EVK


On Mon, 26 May 2025 13:42:28 +0800, Cheng Jiang wrote:
> Add Bluetooth support for qcs9075 IQ-9075-EVK
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
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
 Base: using specified base-commit 176e917e010cb7dcc605f11d2bc33f304292482b
 Deps: looking for dependencies matching 6 patch-ids
 Deps: Applying prerequisite patch: [PATCH v7 2/6] arm64: dts: qcom: iq9: Introduce new memory map for qcs9100/qcs9075
 Deps: Applying prerequisite patch: [PATCH v7 3/6] arm64: dts: qcom: qcs9075: Introduce QCS9075 SOM
 Deps: Applying prerequisite patch: [PATCH v7 4/6] arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK
 Deps: Applying prerequisite patch: [PATCH 1/2] arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK
 Deps: Applying prerequisite patch: [PATCH v7 6/6] arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250526054228.221095-1-quic_chejiang@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: / (qcom,qcs9075-iq-9075-evk): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs9075-iq-9075-evk', 'qcom,qcs9075', 'qcom,sa8775p'] is too long
	['qcom,qcs9075-iq-9075-evk', 'qcom,qcs9075', 'qcom,sa8775p'] is too short
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
	'qcom,qcs9075-iq-9075-evk' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
	'qcom,qcs9075-iq-9075-evk' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,apq8074-dragonboard']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
	'qcom,qcs9075-iq-9075-evk' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
	'qcom,qcs9075-iq-9075-evk' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
	'qcom,qcs9075-iq-9075-evk' is not one of ['wingtech,wt82918hd']
	'qcom,qcs9075-iq-9075-evk' is not one of ['huawei,kiwi', 'longcheer,l9100', 'samsung,a7', 'sony,kanuti-tulip', 'square,apq8039-t2', 'wingtech,wt82918', 'wingtech,wt82918hdhw39']
	'qcom,qcs9075-iq-9075-evk' is not one of ['sony,kugo-row', 'sony,suzu-row']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,msm8960-cdp', 'samsung,expressatt']
	'qcom,qcs9075-iq-9075-evk' is not one of ['lge,hammerhead', 'samsung,hlte', 'sony,xperia-amami', 'sony,xperia-honami']
	'qcom,qcs9075-iq-9075-evk' is not one of ['fairphone,fp2', 'htc,m8', 'oneplus,bacon', 'samsung,klte', 'sony,xperia-aries', 'sony,xperia-castor', 'sony,xperia-leo']
	'qcom,qcs9075-iq-9075-evk' is not one of ['samsung,kltechn']
	'qcom,qcs9075-iq-9075-evk' is not one of ['acer,a1-724', 'alcatel,idol347', 'asus,z00l', 'gplus,fl8005a', 'huawei,g7', 'lg,c50', 'lg,m216', 'longcheer,l8910', 'longcheer,l8150', 'motorola,harpia', 'motorola,osprey', 'motorola,surnia', 'qcom,msm8916-mtp', 'samsung,a3u-eur', 'samsung,a5u-eur', 'samsung,e5', 'samsung,e7', 'samsung,fortuna3g', 'samsung,gprimeltecan', 'samsung,grandmax', 'samsung,grandprimelte', 'samsung,gt510', 'samsung,gt58', 'samsung,j3ltetw', 'samsung,j5', 'samsung,j5x', 'samsung,rossa', 'samsung,serranove', 'thwc,uf896', 'thwc,ufi001c', 'wingtech,wt86518', 'wingtech,wt86528', 'wingtech,wt88047', 'yiming,uz801-v3']
	'qcom,qcs9075-iq-9075-evk' is not one of ['xiaomi,riva']
	'qcom,qcs9075-iq-9075-evk' is not one of ['motorola,potter', 'xiaomi,daisy', 'xiaomi,mido', 'xiaomi,tissot', 'xiaomi,vince']
	'qcom,qcs9075-iq-9075-evk' is not one of ['lg,bullhead', 'lg,h815', 'microsoft,talkman', 'xiaomi,libra']
	'qcom,qcs9075-iq-9075-evk' is not one of ['sony,karin_windy']
	'qcom,qcs9075-iq-9075-evk' is not one of ['huawei,angler', 'microsoft,cityman', 'sony,ivy-row', 'sony,karin-row', 'sony,satsuki-row', 'sony,sumire-row', 'sony,suzuran-row']
	'qcom,qcs9075-iq-9075-evk' is not one of ['arrow,apq8096-db820c', 'inforce,ifc6640']
	'qcom,qcs9075-iq-9075-evk' is not one of ['oneplus,oneplus3', 'oneplus,oneplus3t', 'qcom,msm8996-mtp', 'sony,dora-row', 'sony,kagura-row', 'sony,keyaki-row', 'xiaomi,gemini']
	'qcom,qcs9075-iq-9075-evk' is not one of ['xiaomi,natrium', 'xiaomi,scorpio']
	'qcom,qcs9075-iq-9075-evk' is not one of ['asus,novago-tp370ql', 'fxtec,pro1', 'hp,envy-x2', 'lenovo,miix-630', 'oneplus,cheeseburger', 'oneplus,dumpling', 'qcom,msm8998-mtp', 'sony,xperia-lilac', 'sony,xperia-maple', 'sony,xperia-poplar', 'xiaomi,sagit']
	'qcom,qcs9075-iq-9075-evk' is not one of ['8dev,jalapeno', 'alfa-network,ap120c-ac']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,ipq4019-ap-dk01.1-c1', 'qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,ipq5018-rdp432-c2', 'tplink,archer-ax55-v1']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,ipq5332-ap-mi01.2', 'qcom,ipq5332-ap-mi01.3', 'qcom,ipq5332-ap-mi01.6', 'qcom,ipq5332-ap-mi01.9']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,ipq5424-rdp466']
	'qcom,qcs9075-iq-9075-evk' is not one of ['mikrotik,rb3011', 'qcom,ipq8064-ap148']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq8074-hk10-c2']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,ipq9574-ap-al02-c2', 'qcom,ipq9574-ap-al02-c6', 'qcom,ipq9574-ap-al02-c7', 'qcom,ipq9574-ap-al02-c8', 'qcom,ipq9574-ap-al02-c9']
	'swir,mangoh-green-wp8548' was expected
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qrb2210-rb1']
	'qcom,qcs9075-iq-9075-evk' is not one of ['fairphone,fp5', 'qcom,qcm6490-idp', 'qcom,qcs6490-rb3gen2', 'shift,otter']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qdu1000-idp', 'qcom,qdu1000-x100']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qru1000-idp']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qar2130p']
	'qcom,qcs9075-iq-9075-evk' is not one of ['acer,aspire1', 'qcom,sc7180-idp']
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
	'qcom,qcs9075-iq-9075-evk' is not one of ['lenovo,flex-5g', 'microsoft,surface-prox', 'qcom,sc8180x-primus']
	'qcom,qcs9075-iq-9075-evk' is not one of ['huawei,gaokun3', 'lenovo,thinkpad-x13s', 'microsoft,arcata', 'microsoft,blackrock', 'qcom,sc8280xp-crd', 'qcom,sc8280xp-qrd']
	'qcom,qcs9075-iq-9075-evk' is not one of ['lenovo,tbx605f', 'motorola,ali']
	'qcom,qcs9075-iq-9075-evk' is not one of ['sony,discovery-row', 'sony,kirin-row', 'sony,pioneer-row', 'sony,voyager-row']
	'qcom,qcs9075-iq-9075-evk' is not one of ['inforce,ifc6560']
	'qcom,qcs9075-iq-9075-evk' is not one of ['fairphone,fp3', 'motorola,ocean']
	'qcom,qcs9075-iq-9075-evk' is not one of ['sony,mermaid-row']
	'qcom,qcs9075-iq-9075-evk' is not one of ['xiaomi,lavender']
	'qcom,qcs9075-iq-9075-evk' is not one of ['google,sargo']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sdx55-mtp', 'qcom,sdx55-telit-fn980-tlb', 'qcom,sdx55-t55']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sdx65-mtp']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sdx75-idp']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,ipq6018-cp01', 'qcom,ipq6018-cp01-c1']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qcs404-evb-1000', 'qcom,qcs404-evb-4000']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qcs8300-ride']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qcs615-ride']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sa8155p-adp']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sa8295p-adp', 'qcom,sa8540p-ride']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sa8775p-ride', 'qcom,sa8775p-ride-r3']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qcs9100-ride', 'qcom,qcs9100-ride-r3']
	'qcom,qcs9075-iq-9075-evk' is not one of ['google,cheza', 'google,cheza-rev1', 'google,cheza-rev2', 'lenovo,yoga-c630', 'lg,judyln', 'lg,judyp', 'oneplus,enchilada', 'oneplus,fajita', 'qcom,sdm845-mtp', 'shift,axolotl', 'samsung,starqltechn', 'samsung,w737', 'sony,akari-row', 'sony,akatsuki-row', 'sony,apollo-row', 'thundercomm,db845c', 'xiaomi,beryllium', 'xiaomi,beryllium-ebbg', 'xiaomi,polaris']
	'qcom,qcs9075-iq-9075-evk' is not one of ['oneplus,billie2']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qrb4210-rb2']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sm4450-qrd']
	'qcom,qcs9075-iq-9075-evk' is not one of ['fxtec,pro1x']
	'qcom,qcs9075-iq-9075-evk' is not one of ['lenovo,j606f']
	'qcom,qcs9075-iq-9075-evk' is not one of ['sony,pdx201', 'xiaomi,ginkgo', 'xiaomi,laurel-sprout']
	'qcom,qcs9075-iq-9075-evk' is not one of ['sony,pdx213']
	'qcom,qcs9075-iq-9075-evk' is not one of ['sony,pdx225']
	'qcom,qcs9075-iq-9075-evk' is not one of ['xiaomi,curtana', 'xiaomi,joyeuse']
	'qcom,qcs9075-iq-9075-evk' is not one of ['google,sunfish']
	'qcom,qcs9075-iq-9075-evk' is not one of ['fairphone,fp4']
	'qcom,qcs9075-iq-9075-evk' is not one of ['nothing,spacewar']
	'qcom,qcs9075-iq-9075-evk' is not one of ['microsoft,surface-duo', 'qcom,sm8150-hdk', 'qcom,sm8150-mtp', 'sony,bahamut-generic', 'sony,griffin-generic']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qrb5165-rb5', 'qcom,sm8250-hdk', 'qcom,sm8250-mtp', 'sony,pdx203-generic', 'sony,pdx206-generic', 'xiaomi,elish', 'xiaomi,pipa']
	'qcom,qcs9075-iq-9075-evk' is not one of ['microsoft,surface-duo2', 'qcom,sm8350-hdk', 'qcom,sm8350-mtp', 'sony,pdx214-generic', 'sony,pdx215-generic']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sm8450-hdk', 'qcom,sm8450-qrd', 'sony,pdx223', 'sony,pdx224']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sm8550-hdk', 'qcom,sm8550-mtp', 'qcom,sm8550-qrd', 'samsung,q5q', 'sony,pdx234']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,qcs8550-aim300-aiot']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sm8650-hdk', 'qcom,sm8650-mtp', 'qcom,sm8650-qrd']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,sm8750-mtp', 'qcom,sm8750-qrd']
	'qcom,qcs9075-iq-9075-evk' is not one of ['qcom,x1e001de-devkit']
	'qcom,qcs9075-iq-9075-evk' is not one of ['lenovo,thinkpad-t14s-lcd', 'lenovo,thinkpad-t14s-oled']
	'qcom,qcs9075-iq-9075-evk' is not one of ['asus,vivobook-s15', 'asus,zenbook-a14-ux3407ra', 'dell,xps13-9345', 'hp,elitebook-ultra-g1q', 'hp,omnibook-x14', 'lenovo,yoga-slim7x', 'microsoft,romulus13', 'microsoft,romulus15', 'qcom,x1e80100-crd', 'qcom,x1e80100-qcp']
	'qcom,qcs9075-iq-9075-evk' is not one of ['asus,zenbook-a14-ux3407qa', 'qcom,x1p42100-crd']
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
	'qcom,x1e80100' was expected
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
	'qcom,qcs8550' was expected
	'qcom,x1e78100' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: /: failed to match any schema with compatible: ['qcom,qcs9075-iq-9075-evk', 'qcom,qcs9075', 'qcom,sa8775p']
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: /: failed to match any schema with compatible: ['qcom,qcs9075-iq-9075-evk', 'qcom,qcs9075', 'qcom,sa8775p']
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: serial@88c000 (qcom,geni-uart): Unevaluated properties are not allowed ('qcom,load-firmware', 'qcom,xfer-mode' were unexpected)
	from schema $id: http://devicetree.org/schemas/serial/qcom,serial-geni-qcom.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfacmn-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa0p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: bluetooth (qcom,wcn6855-bt): 'pinctrl-0' is a dependency of 'pinctrl-names'
	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#







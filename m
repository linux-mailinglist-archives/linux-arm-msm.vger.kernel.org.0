Return-Path: <linux-arm-msm+bounces-27929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6D0947D8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 17:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D929FB23655
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 15:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331831662FA;
	Mon,  5 Aug 2024 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEwcof3B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072AF165F1B;
	Mon,  5 Aug 2024 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870023; cv=none; b=OOPXtWL01olO8SXFBdPWvfJvf0sC4H2RN1e/jY9JM9t/yq4B0maGRikpfuzTZD1Dtcjs3GpSmDOAug4n3U2zyKUvYeWGB8FYcm4SPMJiZ3G+LfXLLnFt4RA+WfdgA6sNZExyfuYo1WkIfp0CKAuUpK2gUZMGKJn2HfefLzZjQcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870023; c=relaxed/simple;
	bh=7DHDGqSkQLgNddqVzs6AUi5YEfjN+4d6BibOfTi3Z14=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=H0K6mISix3hLNkm6XneLt+jH5gdMEjW24hlRumW31wC/m26RTxHuVK24DIj9DTR17y7HWNRK/kaBCYMzxlliTvJat2ZTitbbvfuvSClH5LvvhIoxVcVCkpSduFSfgFOnbU2HCE4mjtG2QkK9oADoakw3X8UV9kfEq4gu50b2wfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEwcof3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C99C32782;
	Mon,  5 Aug 2024 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722870022;
	bh=7DHDGqSkQLgNddqVzs6AUi5YEfjN+4d6BibOfTi3Z14=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LEwcof3BOOiK4lCOzsHJpUt6E5U7Y0fjve0oiSSXad3PrEr/Ze4a6BDx8ahQRbjb2
	 kf4qL72jjhjURvOvJ9w0LLJ+aoWxwRl7i+wfqZudmiRk1B7lwkkKgQt4oi7QCw86yp
	 iIaFRx8ZKkx22BnVuK1RGTiYhc4C+ast1A0R7YObrARoWJo2TFhH3mItU4gYrVWN/B
	 ToPP20recwJV+j5HeKETNNsXS0lY5Ibj4/OgydBPNAwboPggEoY+BAWyA3dWsiQf3L
	 hBHwc3Cks8nw8ux1vD7MUhac47g7zbY6WLRa4W7IarRkB6VQHnD96hxI0OIqoD58CE
	 +z7ThG1KHe3hQ==
Date: Mon, 05 Aug 2024 09:00:21 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marcus Glocker <marcus@nazgul.ch>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <o2ysrhejn2xlba6mh4wueh7mgb4l54zvh4tcep3g5wizpaidk6@33mqoj3246zv>
References: <o2ysrhejn2xlba6mh4wueh7mgb4l54zvh4tcep3g5wizpaidk6@33mqoj3246zv>
Message-Id: <172286967393.2711086.2608235829254170744.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: Add X1E80100 Samsung Galaxy Book4
 Edge


On Sun, 04 Aug 2024 10:10:08 +0200, Marcus Glocker wrote:
> Hi,
> 
> We recently added initial support in OpenBSD for the Samsung Galaxy
> Book4 Edge by below DTS diff.
> 
> - x1e80100-samsung-galaxy-book4-edge.dts:
>   Is a copy of x1e80100-crd.dts, and then modified to our needs.
> 
> - x1e80100.dtsi:
>   Includes the UFSHCI peaces, which was basically pulled from
>   sc7180.dtsi.
> 
> Main stuff working:
> 
> - UFSHCI.
> - Keyboard.
> - Touch-pad.
> - USB (as far tested).
> 
> Main stuff not working yet:
> 
> - Touch-screen:  Pin 51, which mostly works on the other X1E80100
>   models, is creating an interrupt storm on the Samsung Galaxy Book4
>   Edge.  Probing the other pins didn't showed success yet.  Not sure at
>   this point what the problem is.
> 
> Regards,
> Marcus
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


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-samsung-galaxy-book4-edge.dtb' for o2ysrhejn2xlba6mh4wueh7mgb4l54zvh4tcep3g5wizpaidk6@33mqoj3246zv:

arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['samsung,galaxy-book4-edge', 'qcom,x1e80100'] is too short
	'samsung,galaxy-book4-edge' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
	'samsung,galaxy-book4-edge' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
	'samsung,galaxy-book4-edge' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
	'samsung,galaxy-book4-edge' is not one of ['qcom,apq8074-dragonboard']
	'samsung,galaxy-book4-edge' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
	'samsung,galaxy-book4-edge' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
	'samsung,galaxy-book4-edge' is not one of ['microsoft,dempsey', 'microsoft,makepeace', 'microsoft,moneypenny', 'motorola,falcon', 'samsung,ms013g', 'samsung,s3ve3g']
	'samsung,galaxy-book4-edge' is not one of ['htc,memul', 'microsoft,superman-lte', 'microsoft,tesla', 'motorola,peregrine', 'samsung,matisselte']
	'samsung,galaxy-book4-edge' is not one of ['huawei,kiwi', 'longcheer,l9100', 'samsung,a7', 'sony,kanuti-tulip', 'square,apq8039-t2']
	'samsung,galaxy-book4-edge' is not one of ['sony,kugo-row', 'sony,suzu-row']
	'samsung,galaxy-book4-edge' is not one of ['qcom,msm8960-cdp', 'samsung,expressatt']
	'samsung,galaxy-book4-edge' is not one of ['lge,hammerhead', 'samsung,hlte', 'sony,xperia-amami', 'sony,xperia-honami']
	'samsung,galaxy-book4-edge' is not one of ['fairphone,fp2', 'htc,m8', 'oneplus,bacon', 'samsung,klte', 'sony,xperia-aries', 'sony,xperia-castor', 'sony,xperia-leo']
	'samsung,galaxy-book4-edge' is not one of ['samsung,kltechn']
	'samsung,galaxy-book4-edge' is not one of ['acer,a1-724', 'alcatel,idol347', 'asus,z00l', 'gplus,fl8005a', 'huawei,g7', 'lg,c50', 'lg,m216', 'longcheer,l8910', 'longcheer,l8150', 'motorola,harpia', 'motorola,osprey', 'motorola,surnia', 'qcom,msm8916-mtp', 'samsung,a3u-eur', 'samsung,a5u-eur', 'samsung,e5', 'samsung,e7', 'samsung,fortuna3g', 'samsung,gprimeltecan', 'samsung,grandmax', 'samsung,grandprimelte', 'samsung,gt510', 'samsung,gt58', 'samsung,j5', 'samsung,j5x', 'samsung,rossa', 'samsung,serranove', 'thwc,uf896', 'thwc,ufi001c', 'wingtech,wt88047', 'yiming,uz801-v3']
	'samsung,galaxy-book4-edge' is not one of ['motorola,potter', 'xiaomi,daisy', 'xiaomi,mido', 'xiaomi,tissot', 'xiaomi,vince']
	'samsung,galaxy-book4-edge' is not one of ['lg,bullhead', 'microsoft,talkman', 'xiaomi,libra']
	'samsung,galaxy-book4-edge' is not one of ['sony,karin_windy']
	'samsung,galaxy-book4-edge' is not one of ['huawei,angler', 'microsoft,cityman', 'sony,ivy-row', 'sony,karin-row', 'sony,satsuki-row', 'sony,sumire-row', 'sony,suzuran-row']
	'samsung,galaxy-book4-edge' is not one of ['arrow,apq8096-db820c', 'inforce,ifc6640']
	'samsung,galaxy-book4-edge' is not one of ['oneplus,oneplus3', 'oneplus,oneplus3t', 'qcom,msm8996-mtp', 'sony,dora-row', 'sony,kagura-row', 'sony,keyaki-row', 'xiaomi,gemini']
	'samsung,galaxy-book4-edge' is not one of ['xiaomi,natrium', 'xiaomi,scorpio']
	'samsung,galaxy-book4-edge' is not one of ['asus,novago-tp370ql', 'fxtec,pro1', 'hp,envy-x2', 'lenovo,miix-630', 'oneplus,cheeseburger', 'oneplus,dumpling', 'qcom,msm8998-mtp', 'sony,xperia-lilac', 'sony,xperia-maple', 'sony,xperia-poplar', 'xiaomi,sagit']
	'samsung,galaxy-book4-edge' is not one of ['8dev,jalapeno', 'alfa-network,ap120c-ac']
	'samsung,galaxy-book4-edge' is not one of ['qcom,ipq4019-ap-dk01.1-c1', 'qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
	'samsung,galaxy-book4-edge' is not one of ['qcom,ipq5018-rdp432-c2', 'tplink,archer-ax55-v1']
	'samsung,galaxy-book4-edge' is not one of ['qcom,ipq5332-ap-mi01.2', 'qcom,ipq5332-ap-mi01.3', 'qcom,ipq5332-ap-mi01.6', 'qcom,ipq5332-ap-mi01.9']
	'samsung,galaxy-book4-edge' is not one of ['mikrotik,rb3011', 'qcom,ipq8064-ap148']
	'samsung,galaxy-book4-edge' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq8074-hk10-c2']
	'samsung,galaxy-book4-edge' is not one of ['qcom,ipq9574-ap-al02-c2', 'qcom,ipq9574-ap-al02-c6', 'qcom,ipq9574-ap-al02-c7', 'qcom,ipq9574-ap-al02-c8', 'qcom,ipq9574-ap-al02-c9']
	'swir,mangoh-green-wp8548' was expected
	'samsung,galaxy-book4-edge' is not one of ['qcom,qrb2210-rb1']
	'samsung,galaxy-book4-edge' is not one of ['fairphone,fp5', 'qcom,qcm6490-idp', 'qcom,qcs6490-rb3gen2', 'shift,otter']
	'samsung,galaxy-book4-edge' is not one of ['qcom,qdu1000-idp', 'qcom,qdu1000-x100']
	'samsung,galaxy-book4-edge' is not one of ['qcom,qru1000-idp']
	'samsung,galaxy-book4-edge' is not one of ['acer,aspire1', 'qcom,sc7180-idp']
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
	'samsung,galaxy-book4-edge' is not one of ['lenovo,flex-5g', 'microsoft,surface-prox', 'qcom,sc8180x-primus']
	'samsung,galaxy-book4-edge' is not one of ['lenovo,thinkpad-x13s', 'qcom,sc8280xp-crd', 'qcom,sc8280xp-qrd']
	'samsung,galaxy-book4-edge' is not one of ['lenovo,tbx605f', 'motorola,ali']
	'samsung,galaxy-book4-edge' is not one of ['sony,discovery-row', 'sony,kirin-row', 'sony,pioneer-row', 'sony,voyager-row']
	'samsung,galaxy-book4-edge' is not one of ['inforce,ifc6560']
	'samsung,galaxy-book4-edge' is not one of ['fairphone,fp3', 'motorola,ocean']
	'samsung,galaxy-book4-edge' is not one of ['sony,mermaid-row']
	'samsung,galaxy-book4-edge' is not one of ['xiaomi,lavender']
	'samsung,galaxy-book4-edge' is not one of ['google,sargo']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sdx55-mtp', 'qcom,sdx55-telit-fn980-tlb', 'qcom,sdx55-t55']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sdx65-mtp']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sdx75-idp']
	'samsung,galaxy-book4-edge' is not one of ['qcom,ipq6018-cp01', 'qcom,ipq6018-cp01-c1']
	'samsung,galaxy-book4-edge' is not one of ['qcom,qcs404-evb-1000', 'qcom,qcs404-evb-4000']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sa8155p-adp']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sa8295p-adp', 'qcom,sa8540p-ride']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sa8775p-ride', 'qcom,sa8775p-ride-r3']
	'samsung,galaxy-book4-edge' is not one of ['google,cheza', 'google,cheza-rev1', 'google,cheza-rev2', 'lenovo,yoga-c630', 'lg,judyln', 'lg,judyp', 'oneplus,enchilada', 'oneplus,fajita', 'qcom,sdm845-mtp', 'shift,axolotl', 'samsung,starqltechn', 'samsung,w737', 'sony,akari-row', 'sony,akatsuki-row', 'sony,apollo-row', 'thundercomm,db845c', 'xiaomi,beryllium', 'xiaomi,beryllium-ebbg', 'xiaomi,polaris']
	'samsung,galaxy-book4-edge' is not one of ['oneplus,billie2']
	'samsung,galaxy-book4-edge' is not one of ['qcom,qrb4210-rb2']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sm4450-qrd']
	'samsung,galaxy-book4-edge' is not one of ['fxtec,pro1x']
	'samsung,galaxy-book4-edge' is not one of ['lenovo,j606f']
	'samsung,galaxy-book4-edge' is not one of ['sony,pdx201', 'xiaomi,laurel-sprout']
	'samsung,galaxy-book4-edge' is not one of ['sony,pdx213']
	'samsung,galaxy-book4-edge' is not one of ['sony,pdx225']
	'samsung,galaxy-book4-edge' is not one of ['xiaomi,curtana', 'xiaomi,joyeuse']
	'samsung,galaxy-book4-edge' is not one of ['fairphone,fp4']
	'samsung,galaxy-book4-edge' is not one of ['microsoft,surface-duo', 'qcom,sm8150-hdk', 'qcom,sm8150-mtp', 'sony,bahamut-generic', 'sony,griffin-generic']
	'samsung,galaxy-book4-edge' is not one of ['qcom,qrb5165-rb5', 'qcom,sm8250-hdk', 'qcom,sm8250-mtp', 'sony,pdx203-generic', 'sony,pdx206-generic', 'xiaomi,elish', 'xiaomi,pipa']
	'samsung,galaxy-book4-edge' is not one of ['microsoft,surface-duo2', 'qcom,sm8350-hdk', 'qcom,sm8350-mtp', 'sony,pdx214-generic', 'sony,pdx215-generic']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sm8450-hdk', 'qcom,sm8450-qrd', 'sony,pdx223', 'sony,pdx224']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sm8550-hdk', 'qcom,sm8550-mtp', 'qcom,sm8550-qrd', 'samsung,q5q', 'sony,pdx234']
	'samsung,galaxy-book4-edge' is not one of ['qcom,qcs8550-aim300-aiot']
	'samsung,galaxy-book4-edge' is not one of ['qcom,sm8650-hdk', 'qcom,sm8650-mtp', 'qcom,sm8650-qrd']
	'samsung,galaxy-book4-edge' is not one of ['asus,vivobook-s15', 'lenovo,yoga-slim7x', 'qcom,x1e80100-crd', 'qcom,x1e80100-qcp']
	'qcom,apq8016' was expected
	'qcom,apq8026' was expected
	'qcom,apq8064' was expected
	'qcom,apq8074' was expected
	'qcom,msm8660' was expected
	'qcom,apq8084' was expected
	'qcom,msm8226' was expected
	'qcom,msm8926' was expected
	'qcom,msm8939' was expected
	'qcom,msm8956' was expected
	'qcom,msm8960' was expected
	'qcom,msm8974' was expected
	'qcom,msm8974pro' was expected
	'samsung,klte' was expected
	'qcom,msm8916' was expected
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
	'qcom,ipq8064' was expected
	'qcom,ipq8074' was expected
	'qcom,ipq9574' was expected
	'swir,wp8548' was expected
	'qcom,qrb2210' was expected
	'qcom,qcm6490' was expected
	'qcom,qdu1000' was expected
	'qcom,qru1000' was expected
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
	'qcom,sa8155p' was expected
	'qcom,sa8540p' was expected
	'qcom,sa8775p' was expected
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
	'qcom,sm7225' was expected
	'qcom,sm8150' was expected
	'qcom,sm8250' was expected
	'qcom,sm8350' was expected
	'qcom,sm8450' was expected
	'qcom,sm8550' was expected
	'qcom,qcs8550-aim300' was expected
	'qcom,sm8650' was expected
	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: /: failed to match any schema with compatible: ['samsung,galaxy-book4-edge', 'qcom,x1e80100']
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: ufshc@1d84000: compatible:0: 'qcom,x1e80100-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6115-ufshc', 'qcom,sm6125-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc', 'qcom,sm8650-ufshc']
	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: /soc@0/ufshc@1d84000: failed to match any schema with compatible: ['qcom,x1e80100-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: /soc@0/phy@1d87000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-ufs-phy']
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: crypto@1d90000: compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine']
	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#







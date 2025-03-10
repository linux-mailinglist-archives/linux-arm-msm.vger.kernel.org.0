Return-Path: <linux-arm-msm+bounces-50857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B4A597D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 15:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84AED16D61D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7277622F39B;
	Mon, 10 Mar 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfxd2Taz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443ED22F389;
	Mon, 10 Mar 2025 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741617383; cv=none; b=E5DWc1AMk/i4qUB8L52doB9PbnZz4GI6iX9EWAZ3ArmeyY07WQNdpGqZDfd8LQvaFQS+cYemBkngLbD+WWdkrQZJS+hx+jzrdrQczKaH5VPaQzJS6xoS8q7YdjUAMR8pomwvuQuQpgJd08hibKzBJhowwGyQS09S39/QQI8kC1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741617383; c=relaxed/simple;
	bh=q3s4rOnXy37wdFzxQu/RNjjCEcykgoi23YsXA8+FOWI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Hv9mCRCViZZ5YF/NMnlb6Rm6BveVxu6SO9zYi8tYPxpBnuOk7/HCqD18ypsXaTHIjH3bKocRPzHyU3jIaXJrl67jDdL8Mp3IrEiLlSnxifEfU+wNP5f9faQ4qt8GHLHaVUiZKZR84zCL3RBs03PqyaNApca0BWBFL4YiD1aq2zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfxd2Taz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81848C4CEE5;
	Mon, 10 Mar 2025 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741617382;
	bh=q3s4rOnXy37wdFzxQu/RNjjCEcykgoi23YsXA8+FOWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kfxd2TazEccTDm5XMf3ZFHC9m1w7x2tUDW/VVBLqF3WLhn5RMrq+sMt32CecErOFF
	 JJeosqitGJGV/gbwweEC15l3qqCUXdxagzMXiGmxD/XitdHtD4GHzJLh1yCcxcyUvY
	 YS9on5cE2x7iNLSWFGLP6H7FJ9aQo5ITqzjUB8cipqWQp8xZmQEA54QqbENncsq18U
	 0PS14rlzzX5K9E98e+E4xi90y8frHVbKYGOqf/1gKLvhvIzsT2MBZd0O5/4f54lX9c
	 D+Ak4vAY09nJOTwB28pfcV7hjQBsUNF85rfODa2fBwPb8bvuyG4KjPgVLREaxBD57A
	 EXpHn+j++IzIg==
Date: Mon, 10 Mar 2025 09:36:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
 Tony Luck <tony.luck@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Ivan Belokobylskiy <belokobylskij@gmail.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz>
References: <20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz>
Message-Id: <174161712658.4185344.17167597331215036705.robh@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: nexus4: Initial dts


On Sun, 09 Mar 2025 01:45:51 +0100, David Heidelberg wrote:
> From: Ivan Belokobylskiy <belokobylskij@gmail.com>
> 
> Add initial support for LG Nexus 4 (mako).
> 
> Features currently working: regulators, eMMC, WiFi, and volume keys.
> 
> Signed-off-by: Ivan Belokobylskiy <belokobylskij@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v3:
> - rebased against next-20250307
> - dropped backlight until driver gets converted to DT
> 
> Changes in v2:
> - lge vendor doesn't exist anymore, rename to lg
> - sdcc@ to mmc@ to comply with dt-schema
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 342 +++++++++++++++++++++
>  2 files changed, 343 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz:

Error: arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts:289.1-10 Label or path pmicintc not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm/boot/dts/qcom] Error 2
make[2]: Target 'arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1467: qcom/qcom-apq8064-lg-nexus4-mako.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'qcom/qcom-mdm9615-wp8548-mangoh-green.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq4019-ap.dk07.1-c1.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974pro-samsung-klte.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq4019-ap.dk07.1-c2.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8916-samsung-serranove.dtb' not remade because of errors.
make: Target 'qcom/qcom-sdx65-mtp.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8226-samsung-ms013g.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq4018-ap120c-ac-bit.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8226-microsoft-dempsey.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8916-samsung-grandmax.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8064-ifc6410.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8064-sony-xperia-lagan-yuga.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq4019-ap.dk01.1-c1.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974pro-samsung-kltechn.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974pro-sony-xperia-shinano-aries.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8026-samsung-matisse-wifi.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8064-cm-qs600.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8084-ifc6540.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq4019-ap.dk04.1-c3.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8916-samsung-e7.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8226-samsung-s3ve3g.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq4018-jalapeno.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8026-samsung-milletwifi.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8026-lg-lenok.dtb' not remade because of errors.
make: Target 'qcom/qcom-sdx55-mtp.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8960-cdp.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8016-sbc.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8064-asus-nexus7-flo.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq4018-ap120c-ac.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974pro-htc-m8.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8026-asus-sparrow.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8926-htc-memul.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8026-huawei-sturgeon.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq8064-ap148.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8226-microsoft-makepeace.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq8064-rb3011.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974pro-fairphone-fp2.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8074-dragonboard.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8916-samsung-e5.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8926-motorola-peregrine.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8926-samsung-matisselte.dtb' not remade because of errors.
make: Target 'qcom/msm8226-motorola-falcon.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8060-dragonboard.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974pro-oneplus-bacon.dtb' not remade because of errors.
make: Target 'qcom/qcom-sdx55-t55.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8084-mtp.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8960-samsung-expressatt.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8926-microsoft-tesla.dtb' not remade because of errors.
make: Target 'qcom/qcom-ipq4019-ap.dk04.1-c1.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8926-microsoft-superman-lte.dtb' not remade because of errors.
make: Target 'qcom/qcom-sdx55-telit-fn980-tlb.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8660-surf.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8974-samsung-hlte.dtb' not remade because of errors.
make: Target 'qcom/qcom-apq8064-lg-nexus4-mako.dtb' not remade because of errors.
make: Target 'qcom/qcom-msm8226-microsoft-moneypenny.dtb' not remade because of errors.







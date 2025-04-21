Return-Path: <linux-arm-msm+bounces-54870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26936A95355
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 17:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4079B1890810
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 15:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2601DF26B;
	Mon, 21 Apr 2025 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8199oIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD701DEFDD;
	Mon, 21 Apr 2025 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248057; cv=none; b=eYN2cT9U3n6fo30DS68G7P4Y6aWz6+h0FXCaGjfytC7Hdia/I/cmiNOC8wPMAm9YtzGsZrZeUQVuOZ2/oCiiM8RDVsLz2oOVPY/noEz6RxnhnvvrPPIM5Q6LdtlcwrlG1e+4LvyVB06yBn+21R+FG92Ya+XXZhlNej2bmR0PDAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248057; c=relaxed/simple;
	bh=GNFLSUAHNULFFpfcAVg2KpjSTX/Bx8WvskY00SOoIz4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mDMbCDJW853oQMjPWczoHtpu+ry8UXKz6GYAcFmykhgVex/88JTFbOM197byCHV4qHfkdWCQFJ7nD9IlLiDDHgH5KUFqgwRy7x77rp+RYgvTLPzIEImuA44Ti0NBAG77Q9ZgpM6OXHYXVVto74DNALPI8ygFGyaEGHAuDtiVPkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8199oIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22294C4CEEE;
	Mon, 21 Apr 2025 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745248057;
	bh=GNFLSUAHNULFFpfcAVg2KpjSTX/Bx8WvskY00SOoIz4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=k8199oIp+Fh0gyEh3kAd7bYBDQDincTwfB2WFXR+zu5vuTCfHmsj7XieDhnrrhBk6
	 IirPUFfLybYEUpYCvrs7Qv6HtYc48yio6e4n2cymtZ2+dnc5iwLDp1d32ucMOeMd0Z
	 BqUEVCWc16whklzLCrsfpq3E1C/JbHQhK+qknwnOyA0TocPvGqsxvQWkgzQl7VPpm/
	 ZZFaaV8j1+vxvzf+0M5H3jeWKTqH3EXNZrN05S5yZAIjr4JCxrFY0k9Ms/OzoByr/d
	 3rqg1KbueI6NQgfV/zco1dfgMe3U4K6xbhVu71MUMyAdYhP657Y3Qbw4Y98ZddnQ8f
	 TU/meulH4vf6w==
Date: Mon, 21 Apr 2025 10:07:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kevin Widjaja <kevin.widjaja21@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
Message-Id: <174524752324.2425843.5400927480880072443.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add support for Sony Xperia Z Ultra (togari)


On Sat, 19 Apr 2025 11:00:37 +0200, Luca Weiss wrote:
> Do some tweaks to the common file for the devices in the 'rhine' family
> of Sony devices, and add a dts for togari.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Kevin Widjaja (4):
>       ARM: dts: qcom: sony-xperia-rhine: Enable USB charging
>       ARM: dts: qcom: sony-xperia-rhine: Move camera buttons to amami & honami
>       dt-bindings: arm: qcom: Add Sony Xperia Z Ultra (togari)
>       ARM: dts: qcom: Add initial support for Sony Xperia Z Ultra (togari)
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml         |  1 +
>  arch/arm/boot/dts/qcom/Makefile                         |  1 +
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts   | 16 ++++++++++++++++
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts  | 16 ++++++++++++++++
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts  | 16 ++++++++++++++++
>  .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi   | 17 ++---------------
>  6 files changed, 52 insertions(+), 15 deletions(-)
> ---
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> change-id: 20250419-togari-bcec79829337
> 
> Best regards,
> --
> Luca Weiss <luca@lucaweiss.eu>
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
 Base: using specified base-commit 8ffd015db85fea3e15a77027fda6c02ced4d2444

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250419-togari-v1-0-45840c677364@lucaweiss.eu:

arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dtb: l2-cache (cache): Unevaluated properties are not allowed ('qcom,saw' was unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#







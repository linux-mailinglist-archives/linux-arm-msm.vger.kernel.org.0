Return-Path: <linux-arm-msm+bounces-21626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2AB8FB746
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA2BBB261F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A71148836;
	Tue,  4 Jun 2024 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="in24Zz6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C791814882A;
	Tue,  4 Jun 2024 15:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514935; cv=none; b=WBQzhfLTjsGMNV6p2cG5w4NR3TnyUKC6PBUwBdt7O0SqhHx4gq0lGW4YP2lBwS+KXwIXCAQuEBXEF1bwHD7AgzriDcHeGBr/anEQn78S4rdmjCFLx2MiffhLHPyrXjmTGigXhksvpoeOl8xxeXB47lEHpOcAGNAcc+JRW6sm9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514935; c=relaxed/simple;
	bh=K1Ee1R8TldPk6BZzvsq82fAn3sJ9O9Ii5+0/Af43M9U=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=GhMKMxgaCeNHOz1Gh3vR+b0We63c7RzTEcW7IU7oeGj7R8ot/2LYhEJQbuDVsYvjZ8SnyMN9z0i3i11YZ5+a0IrC/LKJY9jc4eeLtCjvIMMkENyf+8/jOHPmQRVLd63cDSCf4fL+KNqKrNUO1iRb3nF1FKsET97jMm5aopdb/S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=in24Zz6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136A2C32786;
	Tue,  4 Jun 2024 15:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717514935;
	bh=K1Ee1R8TldPk6BZzvsq82fAn3sJ9O9Ii5+0/Af43M9U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=in24Zz6v3eShsEeqa0beiaweu4A1etIEqHM18BPuwZGgRlmzUQoeNePW5uoTExTOR
	 P92gScAnXSwa69c51xFB3Bv6g7fQwuhLvRSzDLCQBNxSzd9qdhWsG1R42BzL187h2z
	 v6MKUs5CWxktAykBMnfQNBwNZ+YYSeBPaAQTSw7JOO5WwPYQMoF/5j5hSyCHOjgFJY
	 YDJcKYNqE4BaWOvOjLl+H3H+wDdYfTJCYspWwluneKANq3vlvYn18h3iTolS+5FVyH
	 48WDtuXMRXAXU+FD8i83QsexxQ6MEN5WWphSB+lVDZVtK3NmBvnscJfoKJIYyTp+d2
	 MXq3hbehmY+sA==
Date: Tue, 04 Jun 2024 10:28:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandre Messier <alex@me.ssier.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
In-Reply-To: <20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org>
References: <20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org>
Message-Id: <171751454900.786007.17271404951768782420.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add HTC One (M8) support


On Mon, 03 Jun 2024 02:28:55 -0400, Alexandre Messier wrote:
> Add an initial device tree to support the HTC One (M8) smartphone,
> aka "htc,m8".
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---
> Alexandre Messier (2):
>       dt-bindings: arm: qcom: add HTC One (M8)
>       ARM: dts: qcom: Add initial support for HTC One (M8)
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml   |   1 +
>  arch/arm/boot/dts/qcom/Makefile                   |   1 +
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 353 ++++++++++++++++++++++
>  3 files changed, 355 insertions(+)
> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> change-id: 20240603-m8-support-9458b378f168
> 
> Best regards,
> --
> Alexandre Messier <alex@me.ssier.org>
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


New warnings running 'make CHECK_DTBS=y qcom/qcom-msm8974pro-htc-m8.dtb' for 20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org:

arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
	from schema $id: http://devicetree.org/schemas/cache.yaml#







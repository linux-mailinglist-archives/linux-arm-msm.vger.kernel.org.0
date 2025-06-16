Return-Path: <linux-arm-msm+bounces-61502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 711FAADBC3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 23:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75E0D167724
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 21:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6630F237176;
	Mon, 16 Jun 2025 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGAEKy6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42606237163
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110421; cv=none; b=tsHt1RZANZ1VJlfeTnp6RjvJ/wwteEoDtLiCjjT544MQgRvV/L76x6QIef2aDUIc0duZA7kZ+IJvnqURbLqHacPYlK+ppVCGnbARkKjy8Ac1teY8u/T7HB+gBWu4kulH84GHPb4gPe5yfeu6wSrnF8fS5JipuZs3ZNrvbKfUuWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110421; c=relaxed/simple;
	bh=OxtoI+EZlcvK+W8Y3RlhOzAMcfdp4j+WsQnfoVzmJXI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eBqAvzcpxgRI9gSf8AXClADKLfwos8Vm6jM6da82klL3BJDdV9zQi/n/Gy0u2n5o+//8S7nGfxcY9OinURtahsc12BCZ1aNR3+e/DzRB2PlC7LJytGz1zpmMJFqDytinqa5ylhfrENxDdmIIB6cjfTLKdJTPumrYXn2J7YsAob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGAEKy6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1D0C4CEEA;
	Mon, 16 Jun 2025 21:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750110419;
	bh=OxtoI+EZlcvK+W8Y3RlhOzAMcfdp4j+WsQnfoVzmJXI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IGAEKy6ebs1+galbyviq7aWppWLr2FGXMON4S0DI0gnbogKoNFX1RKg5pZF9fTy8Z
	 YfFwSQwl4ahv0p0iTHKWB5xS+WhIn9jppncI1N+/RPRrT1eW1RB2nVgW/a5Y960twy
	 8EH/ZIl/9Ig/mQSb3aLK0J7jGEWEGeB3Ot52mY4qGFTfxTbyge3HjKrtUVZyiuBLGQ
	 OelHye7D1ia5U/o9JVP0WEwnspgzwD9unHTSOj5PT3RWD44xM6E016gplX83Q+xIW4
	 F2nojSKxdDSeYy+MazYXiuo80tA61US8AwzmM+Kiv267BHYkx0yc15wgLtfsD+wn7f
	 N0RmgVDJSnGMw==
Date: Mon, 16 Jun 2025 16:46:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
To: =?utf-8?q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>
In-Reply-To: <20250616090250.36605-1-ghatto404@gmail.com>
References: <20250616090250.36605-1-ghatto404@gmail.com>
Message-Id: <175011006658.2434090.7267983990519095558.robh@kernel.org>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: add initial support for
 Samsung Galaxy S22


On Mon, 16 Jun 2025 09:02:48 +0000, Eric Gonçalves wrote:
> Changes in v5:
> - Properly format the thread
> 
> Changes in v4:
> - Try to properly format the thread
> 
> Changes in v3:
> - Removed unnecessary initrd start and end addresses
> - Make sure r0q is in right order on Makefile
> - Properly format memory addresses
> - Set r0q to the correct, alphabetical order in documents
> 
> I'm sorry for my mistakes, this is my first patch and I got
> a bit confused on how the whole patch system works.
> I hope that is cleared up.
> 
> Eric Gonçalves (2):
>   dt-bindings: arm: qcom: document r0q board binding
>   arm64: dts: qcom: add initial support for Samsung Galaxy S22
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 363 ++++++++++++++++++
>  3 files changed, 365 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> 
> --
> 2.49.0
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250616 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250616090250.36605-1-ghatto404@gmail.com:

arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: / (samsung,r0q): memory: 'ddr_device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/memory.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: / (samsung,r0q): memory: False schema does not allow {'ddr_device_type': [8], 'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 1778384896], [0, 4055891968, 0, 239075328], [8, 0, 0, 984612864], [8, 1073741824, 1, 1073741824], [8, 990904320, 0, 31457280]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: memory@fe200000 (qcom,rmtfs-mem): Unevaluated properties are not allowed ('reg-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,rmtfs-mem.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#







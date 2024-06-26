Return-Path: <linux-arm-msm+bounces-24284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD74F91824B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ADE22829DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 13:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0D41836E4;
	Wed, 26 Jun 2024 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXyXNWNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A841822F3;
	Wed, 26 Jun 2024 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719408316; cv=none; b=ZccrZgGIk4McNaMSuQs9Dx4WlIrebeBQlFZTVSa72oujB3/6KZgIFmgfVjvrNqNu4TxwdnM30E5brLB6LbNBVwib3A52THmaKmGXHSvuFp37SQ9H3IMv2+svtT2EeNEh27QdSBRlVgZqi0CG9ND7HHP16oqNiQl78NBsIdGZOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719408316; c=relaxed/simple;
	bh=EGit2F4HKLGhDNiVHa9AMMoIirVo0tUW+pFwmlWOOG4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=awx8+TCQl5Jm9LhKJ3vecgwTW7WafqYBbs9uU55nHYtS4GHs6tibpRlp4zeZAu3COdbMYEHnI6oOxn4OoK9AMwx1Eu/D67qv/9cz+RfkrV5xr3vy4l7v7YNG7thY8Ae4jvsGxkQ4Zo73QAmZfwk9vWgp3RSlW2vxr3bHgcqMXvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXyXNWNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1B5C2BD10;
	Wed, 26 Jun 2024 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719408316;
	bh=EGit2F4HKLGhDNiVHa9AMMoIirVo0tUW+pFwmlWOOG4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EXyXNWNod6EqpAqfmrmiFgNdiuCFX/Pgutt4Tgsm4VOJYzoh2p7naEqWVArXxbU64
	 iVyB7J/NDaoqaLm65W2gPcnStDTzZe4vVoFbNlhmCw8fNxvwEwfesOraQvfJ29Byl4
	 rxsE7imU4Ie9lDENJzZWClHQJuLcH4K2YH3Q4sWQV3o0NGZ/+1hw6rQHT8gn5u+ZWY
	 01C4eilyiokLcDmFAbMVF8No3KXyqule+Uus9tg9i7x2Bzyhrdsdcyf/YWrewWB+c3
	 M+HOtjSAj/sZckt2hxV4uFgOYDFFP3pQRywH+uTY+lE8k7oRqRmqf1nceYSrMp/xa8
	 +wFrY8lw6wdVw==
Date: Wed, 26 Jun 2024 07:25:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nikita Travkin <nikita@trvn.ru>
Cc: ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Anton Bambura <jenneron@postmarketos.org>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
References: <20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru>
Message-Id: <171940791013.2950956.14057690637549910661.robh@kernel.org>
Subject: Re: [PATCH 0/3] Introduce msm8916 based LG devices


On Sun, 23 Jun 2024 14:26:29 +0500, Nikita Travkin wrote:
> This series introduces two msm8916-based LG devices:
> 
> - LG Leon LTE (c50)
> - LG LG K10 (m216)
> 
> The devices only have basic support for now.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> Anton Bambura (1):
>       arm64: dts: qcom: msm8916-lg-c50: add initial dts for LG Leon LTE
> 
> Cristian Cozzolino (1):
>       arm64: dts: qcom: msm8916-lg-m216: Add initial device tree
> 
> Nikita Travkin (1):
>       dt-bindings: arm: qcom: Add msm8916 based LG devices
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |   2 +
>  arch/arm64/boot/dts/qcom/Makefile               |   2 +
>  arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts     | 140 +++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts    | 251 ++++++++++++++++++++++++
>  4 files changed, 395 insertions(+)
> ---
> base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
> change-id: 20240621-msm8916-lg-initial-8d4a399ec3c2
> 
> Best regards,
> --
> Nikita Travkin <nikita@trvn.ru>
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


New warnings running 'make CHECK_DTBS=y qcom/msm8916-lg-c50.dtb qcom/msm8916-lg-m216.dtb' for 20240623-msm8916-lg-initial-v1-0-6fbcf714d69b@trvn.ru:

arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/audio-codec@771c000: failed to match any schema with compatible: ['qcom,msm8916-wcd-digital-codec']
arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/audio-codec@771c000: failed to match any schema with compatible: ['qcom,msm8916-wcd-digital-codec']
arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/i2c@78b9000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']







Return-Path: <linux-arm-msm+bounces-27928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB177947D83
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 17:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87C60284BBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0BA15F400;
	Mon,  5 Aug 2024 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPB+SZ7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8920D15F3F3;
	Mon,  5 Aug 2024 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870018; cv=none; b=ZZrhIsOBnRE6NY8Xx31fOrnEG13uyToXFEKbYuzls0WE0oj8kwgEQIUDPvaflxJiogwFdyFfF8wsPlH77pSO6bZVINKy8vW23Fwak49j67UWUOiPT18tI43VKAow94jUR720LmwV5M4+wscAU7QKg1MOsBFcxvefDNpdWuaV2MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870018; c=relaxed/simple;
	bh=QMaY66zonE2pj6F2rnx/k9di7OL7zdn/ZAOCrMtqjjk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Ew0AMwCovDm6A0v3AmXePSaOy/wzvQOa1L0VO76+/x6UXrVJ0ry++gNOpx5k776WcTD7K3/duSBjYarHEVw4x3NGyKrJaQOJzBVZo0/6pQn4+nwQZWj4OHUgIOYzUShxFJ2eduQZ5yY3ya/3PqqDpyoFCyi6hOH5IoTi4YuSFM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPB+SZ7W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B1BC4AF0E;
	Mon,  5 Aug 2024 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722870018;
	bh=QMaY66zonE2pj6F2rnx/k9di7OL7zdn/ZAOCrMtqjjk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tPB+SZ7W49QWln/GkG5rDG+UhrTCZmiyGvjhSPPzgOqC6xA47ilxJgDesXzD5zs6K
	 79c/ytuSGH50LhKSF9NI1p9Y8wWDEICdFq92jK2Zo7QOwqiGTPZNO27lM55sKd/9yl
	 g8xZ5dIgSiqoQViUK8drs53/75TOtfp2hMbkkBNWT37jewIwwJlJBEi0NHvTAMLyFr
	 CYlTl9dSdOiWv2oEvXYcNv0eAYQeA/1sl/pt3XpqP/kZbDMTRK5omvuRGEyZ6pLjP0
	 hLld8RojhtWLc5FL4MfXVEnTqLzFCfo0Xr7uge1QF7t3H7iuxUkh8XrpoaglhskPDj
	 MxnFcPedxoQUw==
Date: Mon, 05 Aug 2024 09:00:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20240804065854.42437-1-linmengbo06890@proton.me>
References: <20240804065854.42437-1-linmengbo06890@proton.me>
Message-Id: <172286967129.2710260.12547511216605996134.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: msm8916-samsung-j3ltetw: Add
 initial device tree


On Sun, 04 Aug 2024 06:59:06 +0000, Lin, Meng-Bo wrote:
> The dts and dtsi add support for msm8916 variant of Samsung Galaxy J3
> SM-J320YZ smartphone released in 2016.
> 
> Add a device tree for SM-J320YZ with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART (on USB connector via the SM5703 MUIC)
> - WCNSS (WiFi/BT)
> - Regulators
> - QDSP6 audio
> - Speaker/earpiece/headphones/microphones via digital/analog codec in
>   MSM8916/PM8916
> - WWAN Internet via BAM-DMUX
> - Touchscreen
> - Accelerometer
> 
> There are different variants of J3, with some differences in MUIC, sensor,
> NFC and touch key I2C buses.
> 
> The common parts are shared in msm8916-samsung-j3-common.dtsi to reduce
> duplication.
> 
> ---
> v2: Add accelerometer
> V1: Initial device tree
> Link: https://lore.kernel.org/r/20240802080701.3643-1-linmengbo06890@proton.me
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


New warnings running 'make CHECK_DTBS=y qcom/msm8916-samsung-j3ltetw.dtb' for 20240804065854.42437-1-linmengbo06890@proton.me:

arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']







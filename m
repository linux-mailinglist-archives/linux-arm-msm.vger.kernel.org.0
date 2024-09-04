Return-Path: <linux-arm-msm+bounces-30738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 331E596BFCF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2454C1C24B38
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E051DAC46;
	Wed,  4 Sep 2024 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIPcun/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E91DA62E;
	Wed,  4 Sep 2024 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459292; cv=none; b=dZ9y+joJBqd3txlmU6HSE8hQFEWVTv6ELL6q3p51iSFADoS7rRCToHONBSqEA3p/B+J2Z2YvIGdkSEEzpS1ZMfdOzWkIi5ND/gJlshKO7bPDZnfhTkMa6yFWp/BSfC6NxH1JddT+AHPRsijdbDU1bHljRHe22al/lJ79oLvEKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459292; c=relaxed/simple;
	bh=gHK9KtejZw/O6/y3h2YawlnOBHqqkz/Ay87HYtuFIzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvUbXr3LrhtiOmAlFeV3C9voDqTgyFioFUaBCzaMW4P8zjyCv7Odie8dek8exZ3TioA2sYxqBE9ZpIouYfLdoaCftxdhSra5/nvssUFSOHBkqLDyZDOhUvZfIMM2Wlo2ZF2Zdg1P/Pxx3GmVBaU3wsHZKTvs2i9v5Jb0q2+/8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIPcun/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEC3C4CEC2;
	Wed,  4 Sep 2024 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725459292;
	bh=gHK9KtejZw/O6/y3h2YawlnOBHqqkz/Ay87HYtuFIzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dIPcun/f6kQO1Qkz7AXoTDgjVYxXs+iS5SYYmhpJMGlMsoI071gNDQ7Y1lSa4RPqM
	 sgKdZq878aG2u+akTltbOnokBjq8FpIURWfjlu3WFvve447ajybahCHRieUO5bv/42
	 v9JtnWymDkONsOllMC9wjpbC6xRGYefFVXayNUSxwCJGIoxTrdQck26+XxKYymDwAl
	 05tCTV0Ppc92rqpAQhUrO+lbw/+kwtDJ76fx3jBmgw5P5av4hreFQVhy+DTbqBomRE
	 TzDU/yk8kGCvL/h56JzMzJRMCSPnYl0Eha/Imc9GGuuE49GDrPuzuyFXM7jBydZNwg
	 wUJ6e+wMjm0EQ==
Message-ID: <a9590918-4f64-4fb0-8fb0-7562e212417a@kernel.org>
Date: Wed, 4 Sep 2024 16:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro
 9 5G
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
 <20240903224252.6207-5-jerome.debretagne@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240903224252.6207-5-jerome.debretagne@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4.09.2024 12:42 AM, Jérôme de Bretagne wrote:
> Add an initial devicetree for the Microsoft Surface Pro 9 5G, based
> on SC8280XP.
> 
> It enables the support for Wi-Fi, NVMe, the two USB Type-C ports,
> Bluetooth, 5G cellular modem, audio output (via Bluetooth headsets),
> external display via DisplayPort over Type-C (only the bottom USB
> Type-C port is working so far, corresponding to the usb1 / dp1 nodes),
> charging, the Surface Aggregator Module (SAM) to get keyboard and
> touchpad working with the Surface Type Cover accessories.
> 
> Some key features not supported yet:
> - built-in display (but software fallback is working with efifb
>   when blacklisting the msm module)
> - built-in display touchscreen
> - external display with the top USB Type-C port
> - speakers and microphones
> - physical volume up and down keys
> - LID switch detection
> 
> This devicetree is based on the other SC8280XP ones, for the Lenovo
> ThinkPad X13s and the Qualcomm CRD.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../sc8280xp-microsoft-surface-pro-9-5G.dts   | 1099 +++++++++++++++++
>  2 files changed, 1100 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-surface-pro-9-5G.dts

Please match the filename to the compatible (i.e. sc8280xp-microsoft-arcata)

Konrad



Return-Path: <linux-arm-msm+bounces-64347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8253AFFFC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71C937A14E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 10:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13242E0934;
	Thu, 10 Jul 2025 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9oQg7CY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF42DFF22;
	Thu, 10 Jul 2025 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752144819; cv=none; b=qlSpfNctEwimfFuh4lVlLZ0zRNHOz+ZVNk6bykPKnz2HpPKY/OOhHikqxdFLijbAxCgh2cxjYfG/E3ypjIykKphx557PuIBYiPeqaRVUCYK4bTKYcNkn+gvU5idh0/PWeyzuRHOYlwM7wyx3251Tv6pWxsGr0coqs0hyItmtxlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752144819; c=relaxed/simple;
	bh=ro3Q/mxkYE02hXN/xizwugoeeaB4lO8rt4m4w9jCPK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Him+Ot/jye0vwd3AaKYqjENNLYhK1z4YRJWFW1qD0HIweShLpNSO4lUqabCExTlGSdpSYCwcrBe0Hvnd1glRjV1Z3Len78vh1wvJimF0a3J6fZVd1Ol0bABfKoIGFq9FlkUobHuRKM7I3C7CdbN0L861RBX7E+zkAQWOnXvu1Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9oQg7CY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7878C4CEE3;
	Thu, 10 Jul 2025 10:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752144819;
	bh=ro3Q/mxkYE02hXN/xizwugoeeaB4lO8rt4m4w9jCPK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C9oQg7CY40/3rFkstDrq8Z2gapwbi6Ye3YWLqmmYeFST3pvTKl8RxeqAg1XHEipYg
	 dqs2joZnbiscrnMV+EJcAqGGnc3nNG38ZQmXniBwZx/rrvZIpA7FqDzgtOt6pBO4nI
	 AYCoeDEYRuBnh24pzIM8PViYnglwn/tBdKBbvqRrA4zyo6G6/hLqqd6rW9Ix4qTkSz
	 +FuhimKljlNylvzdOv124QorX5d1IwFAuZw0tKcqv2xrNf0ruR/Onb74CBr0qGUUM2
	 kUJ5HV6SxEWL6gqkCDpo7Xb1hh5sNJ81oD5ziwf04djNADKIlGGNPQUlZwfeU3L8sH
	 PhvQAM4n2zjsQ==
Message-ID: <553adfd2-8518-40b8-a762-1be026fb15b6@kernel.org>
Date: Thu, 10 Jul 2025 12:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
To: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/07/2025 12:50, Jens Glathe via B4 Relay wrote:
> This patch series adds support for the HP Omnibook X Laptop 14-fe1xxx. [1]
> 
> Since this is actually the same model as the 14-fe0xxx, but with an
> X1P-42-100 SoC (Purwa), it needs a slightly different device tree.
> To have as minimal duplicate definition as possible, the hp X14 gets 
> commonalized into a dtsi (and it stays compatible to the derived 
> device trees, like the Ultrabook G1q). 
> 
> The supported features are the same as for the original Omnibook X14:
> 
> - Keyboard (no function keys though)
> - Display
> - PWM brightness control
> - Touchpad
> - Touchscreen
> - PCIe ports (pcie4, pcie6a)
> - USB type-c, type-a
> - WCN6855 Wifi-6E
> - WCN6855 Bluetooth
> - ADSP and CDSP
> - X1 GPU
> - GPIO Keys (Lid switch)
> - Audio definition (works via USB and with internal speakers)
> 
> [1]: https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-next-gen-ai-pc-14-fe100-14-a4nd1av-1#techSpecs
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> Changes in v7:
> - rebased to next-20250710.
> - reworded commit message for patch #2
> - picked up reviewed-by for patch #3 (thanks)
> - fixed link ref in patch #3
> - Link to v6: https://lore.kernel.org/r/20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz

Please slow down a bit. You keep sending every day. It is fine for
simple patchsets reaching v2 or v3... but this keeps going and you
reached v7!

Instead wait for few days to give people actually chance to review.

Best regards,
Krzysztof


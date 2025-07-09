Return-Path: <linux-arm-msm+bounces-64129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7BAFE181
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 09:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F46F3A3DCE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E694726FD9F;
	Wed,  9 Jul 2025 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOF2ptKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BAB23D2A8;
	Wed,  9 Jul 2025 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752046757; cv=none; b=ZahZCwdWqOawxoPTem5LWUZ27uztNEG+TxNANoGMuxNvGtjVdwbCBHhXAaNdt0viwTLpxxHl/dfNZYQTTrkfMObDF21yse6GUNXeIjiOgGT/FGAg56rrE3u0Y6ep/4n0Li2JK7bsJO/hsjsSYl7GWOllDVUFT58AhiYsnyGhJmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752046757; c=relaxed/simple;
	bh=7T2VttiyfuYfzV16XO7PiYIBrzZ6e4CWp40wmEQeqe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkfoSHn+dhDsT8R+lkLw9u4xOrXEDKJpN8njF+5LLslAmURMuT3laEYOMGw057YG6GzlAmXzv9WO9iVvQRed0ySv7H9kwfHiaEGo/KdzQ/Ce8wPDArAz+TewPUUIDXX+gboPzWpsspYt0vea1wysL4Y5uVvz3vWgBYpzLQfDJ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOF2ptKA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF26C4CEF0;
	Wed,  9 Jul 2025 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752046757;
	bh=7T2VttiyfuYfzV16XO7PiYIBrzZ6e4CWp40wmEQeqe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOF2ptKAUaHLLzvSGMuVQXc2yeqBp8F9JTxsmLWDElqMJLksZ8MY6MtkiU0yWEWMf
	 KGRZ5CINYWnfHZHUfLPp6XIYFq12HWL7tU7Hpv+HZ+Ujia72rH/JJwDIXIXEihYVHd
	 RY/lYsCc0zY93HcAK+zH6PcoLaQFoFSoMMLkc9cRb6JKF7k7xzDkDUkrlcvKP0pvO+
	 WpKEWz7FDTbaOK/nMLAWBQylumaKaW6hbsU464j57H1aePCmWubj5h5RhM01gu9CRO
	 M9sl9NMEnSwiEXa7FuxIECFn9ZIiR8NIRjXOk70khqUFsgM19bEQqB3l9+5ukrkL0N
	 TRl/91HjDzyEA==
Date: Wed, 9 Jul 2025 09:39:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Message-ID: <20250709-arboreal-basilisk-of-opportunity-bafaf1@krzk-bin>
References: <20250708-hp-x14-x1p-v5-0-44c916efa973@oldschoolsolutions.biz>
 <20250708-hp-x14-x1p-v5-3-44c916efa973@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-hp-x14-x1p-v5-3-44c916efa973@oldschoolsolutions.biz>

On Tue, Jul 08, 2025 at 10:34:08PM +0200, Jens Glathe wrote:
> These laptops are the same as the already known 14-fe0xxx models, but
> with a Purwa SoC, SKU number 14-fe1xxx. [1]
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
> https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-next-gen-ai-pc-14-fe100-14-a4nd1av-1#techSpecs
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  2 ++
>  .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     | 36 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..63bf3ccc11124a70efb09782b57970b274d80d49 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -333,3 +333,5 @@ x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
>  x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
> +x1p42100-hp-omnibook-x14-el2-dtbs := x1p42100-hp-omnibook-x14.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-hp-omnibook-x14.dtb x1p42100-hp-omnibook-x14-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..4ec975f9acec30dc8a2383a4c6c15c3e1ee754e1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.

Odd copyrights. How could this file be published in 2023? Before the
laptop was even made? And by Qualcomm? Qualcomm did nothing for this
laptop on Linux - it's a Windows platform for them.

Best regards,
Krzysztof



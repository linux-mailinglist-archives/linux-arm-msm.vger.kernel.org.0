Return-Path: <linux-arm-msm+bounces-61372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AAEADA814
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 08:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564B81890CD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 06:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532CF73451;
	Mon, 16 Jun 2025 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHtKbxMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAA11863E;
	Mon, 16 Jun 2025 06:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750054691; cv=none; b=qwBRPQ/Ma6Wkg+cYe9kBTRThePntoYbFcyZUiBxWQZVbY9xM01IgKsQH0NEejt9uiqRBvs+2dauoMKvmeIPVLjd1BCNUpWjXV50Ds88Qr2y3DNlDClwQnBILNBvh/KbJ43sS5dQ/SebtineKUMsjbMkWDvok0zyMl5nYFuzAy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750054691; c=relaxed/simple;
	bh=kS2pJgU6Nff7S8fAfvWuwuBfcDcxJoQKLg8XbbWLVAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=neIdJLr5aHFPnFSzJlVy5aQagFPQjZv2GTvuPtQBlDqtimTHDyZytwKKJWqxwEr9vKZ0wy+BWZc7DT24UiREEFfXOyUzscr3HSpCL1LNfY5naQB0oiLUg2DCzWeg1Hez/1c0ED9ORjXbE+tpgrJPs6hbHNMkUZo5x499WZS8tJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHtKbxMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F035C4CEEA;
	Mon, 16 Jun 2025 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750054690;
	bh=kS2pJgU6Nff7S8fAfvWuwuBfcDcxJoQKLg8XbbWLVAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UHtKbxMMirg3ZnEReYpc7u8FYbA0iOABuOfF3DseRrkR/dGeAF2PgAxcFjavEXN1W
	 7+WJd0H0jsMIR5RBeLZH1B3068aSxlkHwnAB+b/U9Yosot/BIJMaxs240VIwJczjba
	 gZnWHqKupY+sDD0gijBfrCgYTtE2h17QUmgYTBjl6worYTZ360gesaVHq2YOXPOKQl
	 dsDTqZ+X/Y/1NbspJMJSZWvP7iuNIsq7RcqWF98OjM6czQ5Biu8YKOcMC3NhiERB84
	 R6UYw7Od7XuccomrkcEpnN9uK6JUr53+ZkohjPMBbM77YCdPmT+BXD2+RAJWIag6Lz
	 xG0xLUJhiVn4A==
Message-ID: <41d6142c-0198-4a39-b0f6-e3d292e10bf4@kernel.org>
Date: Mon, 16 Jun 2025 08:18:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: add initial tree for Samsung Galaxy
 S22
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
 linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, konradybcio@kernel.org, robh@kernel.org
References: <20250615205608.1133129-1-ghatto404@gmail.com>
 <20250615205608.1133129-2-ghatto404@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250615205608.1133129-2-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/06/2025 22:56, Eric Gonçalves wrote:
> Adds new device support for the Samsung Galaxy S22 (SM-S901E) phone
> 
> Working features:
> - simple-framebuffer
> - side buttons
> - storage
> - usb

Thread and name your patches correctly, e.g. use b4 or git format-patch
-vX -2, and add changelog in cover letter or under '---' of individual
patches describing changes from previous version.

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.
</form letter>

> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 365 ++++++++++++++++++
>  2 files changed, 366 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 669b888b27a1..cde80a17f2ab 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -287,6 +287,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx223.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx224.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-samsung-r0q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> new file mode 100644
> index 000000000000..cb58626e879e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> @@ -0,0 +1,365 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025, Eric Gonçalves <ghatto404@gmail.com>
> + * Copyright (c) 2025, Arthur Aligon <arthurus36.alt2@tutanota.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sm8450.dtsi"
> +#include "pm8350.dtsi"
> +#include "pm8350b.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pm8450.dtsi"
> +#include "pmk8350.dtsi"
> +#include "pmr735a.dtsi"
> +
> +/delete-node/ &xbl_ramdump_mem;
> +/delete-node/ &xbl_sc_mem;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &mte_mem;
> +/delete-node/ &trusted_apps_mem;
> +/delete-node/ &trusted_apps_ext_mem;
> +
> +/ {
> +	chassis-type = "handset";
> +	model = "Samsung Galaxy S22 (SM-S901E)";
> +	compatible = "samsung,r0q", "qcom,sm8450";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		bootargs = "clk_ignore_unused pd_ignore_unused";

This is not really part of mainline DTS. If it is, then you need to
clearly document the reasons with comment.

> +		linux,initrd-start = <0x00 0xb6915000>;
> +		linux,initrd-end = <0x00 0xb7fff22c>;

Why this has to be in DTS?

Best regards,
Krzysztof


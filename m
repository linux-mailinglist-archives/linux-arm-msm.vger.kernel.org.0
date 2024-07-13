Return-Path: <linux-arm-msm+bounces-26076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5C9304DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 12:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49432815F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 10:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E5647F46;
	Sat, 13 Jul 2024 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8JZp6JA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365443BBF6;
	Sat, 13 Jul 2024 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720864946; cv=none; b=j+6Jq33AcHEgIVUchSv54zzwhc4TZnJgIcnE9w7NkQyBcZGyr0kBjYg7PeCwl2PxDHeCyqL67ERTVXdYnKSZ4oH6Vz/plNeNpwqEHUbDmeMY1x+3pFWygPXTS+0cIBWyUDz02Mb94TQmC+uwnXuBVu5b/zWfy6gaLq3NoFTJTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720864946; c=relaxed/simple;
	bh=/tSL1J1BmBhOXuZJmyUJfD8SNa/r5dpwJ99Tl9HRTkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARfgvzT1gUrWekxwTop3MNhIWejZt6v+AgQdjJjxaRBLweDjpdVoeq8DwQehpYPgo0IiICUvG58IeHI0ntByvPGzLcUHKk4fe4hHQOeGdVPE0S8Ot2av9FTH2uQOX7ofV+cyXWYJOF9RY0JhER54494ZNczc0AICUbZHdk7sQcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8JZp6JA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3386C32781;
	Sat, 13 Jul 2024 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720864945;
	bh=/tSL1J1BmBhOXuZJmyUJfD8SNa/r5dpwJ99Tl9HRTkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s8JZp6JAfL4RUHtQ7wBc5lwf4E/dXFk73ucxSPsrcPHFQMUQt96WLYLcuKVOLhlMU
	 WjmMvehmxgVtrEuy49jn5tUxqvAHpOVTzylubUMaZZzyoaG1/i1tDP7VW/gvjaFxA1
	 s7UhAuJTPOdNayD8bIZIwtVbJfHlA/vrbgixID8C2K8Obqt7CP3yg9QcOHDmDtU1oi
	 RgCes6G6660vnIAweW4adQbvqJDzOb4xPs1dCQNFWO4pzPKuMYBKVV5uLpMIVRt0Zp
	 pXtqHvnOr6dVwIjOKS5PwIuM/5gRtjb21S8MBfhyb+idjVI0dXReZsUp3OPvZrkhXz
	 E8vmeJwqaP0mA==
Message-ID: <f377a55c-4a74-4555-926d-afb7dd813e00@kernel.org>
Date: Sat, 13 Jul 2024 12:02:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
To: Nikita Travkin <nikita@trvn.ru>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 =?UTF-8?B?QWRhbSBTxYJhYm/FhA==?= <asaillen@protonmail.com>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
 <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/07/2024 18:04, Nikita Travkin wrote:
> From: Adam Słaboń <asaillen@protonmail.com>
> 
> This commit introduces multiple hardware variants of Lenovo Vibe K5.
> 
> - A6020a40 (msm8929-wingtech-wt82918hd)
> - A6020a46/A6020l36 (msm8939-wingtech-wt82918)
> - A6020a40 S616 H39 (msm8939-wingtech-wt82918hd)
> 
> These devices are added with support for many features, notably:
> 
> - Basic features like USB, mmc/sd storage, wifi, buttons, leds;
> - Accelerometer;
> - Touchscreen;
> - Sound and modem.
> 
> Note that "HD" variant of K5 is based on msm8929 which is a lower bin
> of msm8939 SoC. A simple dtsi is added for this soc along with the new
> devices.
> 
> Unfortunately, despite the heavy similarities, the combination of minor
> differences between variants make them incompatible between each other.
> 
> Signed-off-by: Adam Słaboń <asaillen@protonmail.com>
> [Nikita: Minor cleanup, commit message]
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   3 +
>  .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
>  arch/arm64/boot/dts/qcom/msm8929.dtsi              |   5 +
>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  16 ++
>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 254 +++++++++++++++++++++
>  .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  16 ++
>  6 files changed, 311 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index fd4c7c41ddc4..48ec781fa1d8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -58,10 +58,13 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
> new file mode 100644
> index 000000000000..f9a358e852f8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "msm8939-wingtech-wt82918.dtsi"
> +#include "msm8929.dtsi"
> +
> +/ {
> +	model = "Lenovo Vibe K5 (HD) (Wingtech WT82918)";
> +	compatible = "wingtech,wt82918hd", "qcom,msm8929";
> +	chassis-type = "handset";
> +};
> +
> +&touchscreen {
> +	touchscreen-size-x = <720>;
> +	touchscreen-size-y = <1280>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8929.dtsi b/arch/arm64/boot/dts/qcom/msm8929.dtsi
> new file mode 100644
> index 000000000000..c3d1d1ace2f6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8929.dtsi
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +&opp_table {
> +	/delete-node/ opp-550000000;
> +};

That's a very odd SoC DTSI.

SoCs DTSIs are not meant to be included as complementary, but rather as
full DTSI.

IOW, this is very confusing code and will confuse everyone reading it.


Best regards,
Krzysztof



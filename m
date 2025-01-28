Return-Path: <linux-arm-msm+bounces-46335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9BA205A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 09:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15A9118867ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 08:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D38B1DDC15;
	Tue, 28 Jan 2025 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G3HY/E84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63141DC994
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051656; cv=none; b=HT1KtQK5LU6DRI2LpZZLG4Q8RhF/3grU8hRTG94eGkfZJ2P9Z7LA7awYM2iEnTVGTywCX5XWiUHAHrscaGA2iPt5YwXJGRj4y+R/Rdq08mYuNuuyj4odtYOv/LJfRnRcNB2shAPDGweUZXhUJQg6H23EFocPdSnxiceykPMFLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051656; c=relaxed/simple;
	bh=fU/tckP/5UqPp7g2LTABAExa7RQaGvyFPzFMOwFUios=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCv2BWgOp7cQ1jWCc88Bb3KPTQZ55gzlM0aVBzcVF9RMh9CdQdNKNqha87cJsO8AfkUkNTiI1vT+kraKqRuJ8wU8IEikhdBItPriiIkHv6Ovmt8TCVoZFFTRmKPb/Mavp5x9hpTsGPwEMpAuozKriRihSLbyB/maM9mGahyjAhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G3HY/E84; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso34375275e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 00:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738051652; x=1738656452; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nk+4dUfm3RLF6cEwakRkyvt72Fn0RenQLoBqykugPCY=;
        b=G3HY/E84F4Sh0OYCd5C+8+0YcXlEPXWEtVHUVKWDl7Mn5LJy0UuZ6xGh8ynbZx+zIJ
         v+VL7a+3c58VOyWchoQkuFZPrWcPxveVIkf5Xv0/xS0yJAPrEvHEdWbLpJtMJL4OKZEV
         czGZxBwZm0KnVB31QULaJ+0/USeBqAqtZHnptkP1XzLHPOOSUbOu7bTHZJS8KLqd7pcT
         tA8ub/AcxkCI9EREjocuBBDybx6yEizE0PuH1EUX5Rsxwka6iiOTLMONGhATPFwYCnD7
         6+d3qkjLPrsKABxKR6HOiQkXXBJgnl7R1HqqGHH9aq/kH9WiKrtY5V5uy6+rIchrwG5Z
         bUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051652; x=1738656452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk+4dUfm3RLF6cEwakRkyvt72Fn0RenQLoBqykugPCY=;
        b=SSSbQ7V998QAUq//0sFdOmCSrSE5EL7UJzZWb9sSnZoskCCYDtTSRV53Osc8ExiW7J
         HnxBrnzzy0omsvLs5UvDzSlaTL28ZiAy+Le12YXTO8l1K2lgvRMQr1in3kxCzi8hRsuC
         ZfTUURNPdDeetv1S9iOn0q9Qj4783fbTN4MntTTd1IzF1Iuwt0qhAMLvEb6DSZn6jRGx
         s//LrqdOramm0qj6enQX99IvXs3XkomRRJPVfMi0nj7qG7iLKyCNsL7cISndPo1BeRhc
         6KEgQUjgLi0PNf2ojBDPZ9C2WKrwJotEHRxLhDi9nswzZMHIf6SJwqnmxNVmvA/kFnux
         Otbg==
X-Forwarded-Encrypted: i=1; AJvYcCVnm1wAtmLOYF2hsvhwvfsQQmASwZIlYki0WnnTrB+Pk5F2d9xx3vF/TxR7puFXnEnbyIaui6IIfZgdSsNH@vger.kernel.org
X-Gm-Message-State: AOJu0YwKJZHleFT/2iYJ0Mvrj9XFItsnuNdmuiZE1Gb8i4YnOuQuZt9k
	Hds+Q+3JdZF6WiEL3mAwCYva2K0Xk3+Nl0idCV5Id++gv2srsPM4EbYCgyGYOsc=
X-Gm-Gg: ASbGnctY/7w7klCFqjbLFpUAZRbNeqg+8I06RfliNTaSMvxjK5ZlmQL+QBStpSZVlFp
	PjUc47iNiUMTApzNbZm1cKael2XLB5ShbBY29bpGnGrzKxsAtFfPceCFcB0m1QwIEyiSGvpRMNx
	ZAEBvJx+I+q+E+0UqptdcNk3qBdu1kY7rbAewmu96KG2mwuLBuCc0HMJKjzVxUPqY8SEud9DfNk
	+S/n1Eg852MgffuEuB5mOhhCVIz2BGz9KyVLUh/zkhZbcAeDbC+l/IqC3NfAr0PaUQ8VAOGaMVr
	ANQlgn8kfLiEU3uJLX/qJtLrBVdEOLrqhRHLIQ==
X-Google-Smtp-Source: AGHT+IFHFytzRhe8qShNNxEVr/A1T+bzdYm6EGCEgGEM29/hYF2iePKBkaJ5GE7ot1uukB9F3g8xsw==
X-Received: by 2002:a05:600c:34d0:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-4389142e805mr370329005e9.19.1738051652123;
        Tue, 28 Jan 2025 00:07:32 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd50233dsm156786785e9.15.2025.01.28.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:07:31 -0800 (PST)
Date: Tue, 28 Jan 2025 09:07:29 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/13] ARM: dts: qcom: Introduce dtsi for LTE-capable
 MSM8926
Message-ID: <Z5iQQQRtuUzTDRVW@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:43PM +0100, Luca Weiss wrote:
> MSM8926, while being 'just' an LTE-capable variant of MSM8226, the dts
> needs to slightly change since the modem doesn't use the ext-bhs-reg and
> needs mss-supply, therefore it gets a new compatible.
> 
> Since we already have two -common.dtsi files which are used on both
> APQ8026/MSM8226 and MSM8926 devices, change the setup a bit by removing
> the SoC include from those and requiring the device dts to pick the
> correct one.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/msm8926.dtsi                           | 11 +++++++++++
>  arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts  |  1 +
>  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi     |  6 +++++-
>  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts     |  1 +
>  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts   |  1 +
>  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts  |  1 +
>  .../boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi    |  6 +++++-
>  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts             |  2 +-
>  .../arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts |  1 +
>  arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts       |  1 +
>  arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts    |  2 +-
>  arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts    |  1 +
>  12 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/msm8926.dtsi b/arch/arm/boot/dts/qcom/msm8926.dtsi

I'm personally not a big fan of mixing the naming with and without qcom-
prefix. But anyway:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> new file mode 100644
> index 0000000000000000000000000000000000000000..629654c525b4bf415e41dca7b3d9fc60a5ee75fd
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/msm8926.dtsi
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Luca Weiss <luca@lucaweiss.eu>
> + */
> +
> +#include "qcom-msm8226.dtsi"
> +
> +&modem {
> +	compatible = "qcom,msm8926-mss-pil";
> +	/delete-property/ qcom,ext-bhs-reg;
> +};
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> index da3be658e822fb6408738e7e79453b87c39478e1..4546fa8beba46d31345da1ee3eded20e8a853f6b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> @@ -5,6 +5,7 @@
>  
>  /dts-v1/;
>  
> +#include "qcom-msm8226.dtsi"
>  #include "qcom-msm8226-samsung-matisse-common.dtsi"
>  
>  / {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
> index ca76bf8af75e463bc3a2a5cfc1c2b574f0ac17f5..d4a32af0ef8f1ca6c0926261d7756a4d6bfba23f 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi
> @@ -8,7 +8,11 @@
>   * Copyright (c) 2023, Rayyan Ansari <rayyan@ansari.sh>
>   */
>  
> -#include "qcom-msm8226.dtsi"
> +/*
> + * The .dts should first include qcom-msm8226.dtsi or msm8926.dtsi depending on
> + * the SoC on the given device.
> + */
> +
>  #include "pm8226.dtsi"
>  #include <dt-bindings/input/input.h>
>  
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts
> index 2c664b5934ec54b7d53a2e3a8d86a1df864d33a9..f448c908841610bc53cccccb431d5ce50d205fc1 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts
> @@ -8,6 +8,7 @@
>  
>  /dts-v1/;
>  
> +#include "qcom-msm8226.dtsi"
>  #include "qcom-msm8226-microsoft-common.dtsi"
>  
>  / {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts
> index 731c5c3756784677580f09fad31ba28b0533145d..94bf3b1ad1bd1fb926ac5bb7174394965d52609c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts
> @@ -8,6 +8,7 @@
>  
>  /dts-v1/;
>  
> +#include "qcom-msm8226.dtsi"
>  #include "qcom-msm8226-microsoft-common.dtsi"
>  
>  / {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
> index a28a83cb534055a36a55f907094b34f48b6266be..d8cdb75dfbb8bdafd8bb8fecfe3b9ab3f42b41e4 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
> @@ -8,6 +8,7 @@
>  
>  /dts-v1/;
>  
> +#include "qcom-msm8226.dtsi"
>  #include "qcom-msm8226-microsoft-common.dtsi"
>  
>  /* This device has no magnetometer */
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> index fbd568c7d6b7415d240aa1a2329d07cf9135274c..0a3147656f36ca2616e0e3cc7c1dd808b55f3a88 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> @@ -3,8 +3,12 @@
>   * Copyright (c) 2022, Matti Lehtimäki <matti.lehtimaki@gmail.com>
>   */
>  
> +/*
> + * The .dts should first include qcom-msm8226.dtsi or msm8926.dtsi depending on
> + * the SoC on the given device.
> + */
> +
>  #include <dt-bindings/input/input.h>
> -#include "qcom-msm8226.dtsi"
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> index 18396623a91dd4bf4b66f01c1d983c391722f3b5..d6eaa82cee4daf6a1386902f537f1351811d4a06 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> @@ -5,7 +5,7 @@
>  
>  /dts-v1/;
>  
> -#include "qcom-msm8226.dtsi"
> +#include "msm8926.dtsi"
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts
> index 9b48661d69c53829c30ece8544ffff97f3032a59..eea4fd8cd9725f1ef629aae446ff7aa6c49fb2fa 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts
> @@ -8,6 +8,7 @@
>  
>  /dts-v1/;
>  
> +#include "msm8926.dtsi"
>  #include "qcom-msm8226-microsoft-common.dtsi"
>  
>  /* This device has touchscreen on i2c3 instead */
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
> index 55077a5f2e34f84857ee35d22157362759151c5a..f23bbb94cc5e4343f667e53d66bc289228a85134 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
> @@ -8,6 +8,7 @@
>  
>  /dts-v1/;
>  
> +#include "msm8926.dtsi"
>  #include "qcom-msm8226-microsoft-common.dtsi"
>  
>  /* This device has touchscreen on i2c1 instead */
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
> index 376a33125941028a3977e76373ee96959b08ee3e..db3273c755c2b5480b9c00336314b63900a74cbd 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
> @@ -2,7 +2,7 @@
>  
>  /dts-v1/;
>  
> -#include "qcom-msm8226.dtsi"
> +#include "msm8926.dtsi"
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &smem_region;
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> index d0e1bc39f8ef700aa648148ac070f59062d049d7..772827cad972ad4ff032cfb9310568c5d2f0170f 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
> @@ -6,6 +6,7 @@
>  
>  /dts-v1/;
>  
> +#include "msm8926.dtsi"
>  #include "qcom-msm8226-samsung-matisse-common.dtsi"
>  
>  / {
> 
> -- 
> 2.48.1
> 


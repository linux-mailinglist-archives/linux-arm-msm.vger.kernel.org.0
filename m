Return-Path: <linux-arm-msm+bounces-8259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B32E83C376
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0CD71C2376E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EB64F8A6;
	Thu, 25 Jan 2024 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClJ8Nmz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2750A76
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706188752; cv=none; b=dbcZYs0cgJ1QoL29FvecUA7EUODdVtaukGC9pYM4hS6pOEWMCrHsfea9EUy7E0TbjyAES8pGh9iZwwNHjmxgbYmGiFz7OO82l0AgfJhPeukeOkL48uB58rwmRstvkQ2P709LIsv2q6uWSzbYMGH8JrXNIuSnmBsJGND/KaCsHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706188752; c=relaxed/simple;
	bh=8ZwYMGT29+2aOw1eN9EP3kUeI/wEb4MnmErpaR8lCeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKCn1c8jfjuYgrpM7UJvAY/gOh+e+++BijEw5fj2OOWJElVKYz11Xd7syvkHg5H1xSfY3FjUpCOAZp0AOYgI4DuukIIE0NluhwXLamflD4EmDnimhWQcCVTi7T+SBHNsOJQ2tt4UpxtGeMEMqw0tkBVtzKQoRHhLlBizmPUEkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClJ8Nmz5; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc226dca91aso6327282276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706188749; x=1706793549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=13Rb80VOvvaXUse1uPuWqVFXOg9vSOw6wfFVQXf5Clw=;
        b=ClJ8Nmz5ID7ZPKnkX5f5vXSnMoNUpuLYcmlEeJ+CeAYt5Bo3PEFQMcX8HHUZT+YZKj
         f8phtNVxvy7IK7/xDhW2lbUjBLmhhkFbpLv64FC5+jzIbKx3oX3Szf9G782iqaAB0wsG
         Oy92RETYDBJYX0utrKKlvj9kOvQvZPuZR3q5mPuixqpF4SjmzDfV7BemwjRtoKCfxwrL
         z5HW9AUXavSHmT30rO/K3b20+666aC3qVwl1rJc5yL14DI4ef3dNK0y7EGvY65+EyyNG
         leLX6HzlHmX/OaO4jv77pCyyK4c5aDtBi8Tp2JS3hEIEUDwXAoGYUNaziOR9dbukQv/M
         nP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706188749; x=1706793549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13Rb80VOvvaXUse1uPuWqVFXOg9vSOw6wfFVQXf5Clw=;
        b=gk+7J7lOkjqbPJGefl0Rh7u/aaTsTslhaEm+AQHs/aNIESQWeX/JTu1XOQ+16MShCN
         tw7MZjQZdLhWQauWqF0uGz3Z6z6583NaG8IqI3I7v3Lw7Lp+ckkKqJUqIyPFAE0+o02w
         BSeMIQNbHBRaKaHjPiFE84NpcwROMJltaeSSyXqC04iAzCqVf9gF2KOKgq3zwT0UtrzD
         stXHPuHGlurYQwsn1S2eA9e/a2B0Av3CIlKlm9rvxO7vCcWS5lDKFqErFHGq9DmYCdUt
         7bAEPKm5Fv3mMcxhTb6fjj9rTP2zwPDRJN2gLOX5L4rVdv1cPpcXzmw6enEfKgxeyCEl
         daXg==
X-Gm-Message-State: AOJu0YwnqzOyAgfUMZvTH8EaEuFKzsSsa+virLVchX2pzQKQQmUDYsTm
	ahNUbLWHlQpoaWcZMqCeY+Wid/eupvaR1uPW0/V7eX4Lcd9ZkF8IUhvrQ1nQaI7EMm96DfVqZBm
	1PhXxVrTo971aH5l5VfTxT0uK89Cokpu0NK3oZA==
X-Google-Smtp-Source: AGHT+IFsnb98+co8kdXhhrvZvf7JpU2va+eR8/Qjp+9lVnk0u3xiBR+WFtOcK5UiEHgsksEzWXz8zTLqItdwAHLViaw=
X-Received: by 2002:a5b:682:0:b0:dc2:8282:8893 with SMTP id
 j2-20020a5b0682000000b00dc282828893mr650947ybq.127.1706188748827; Thu, 25 Jan
 2024 05:19:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org> <20240125130626.390850-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240125130626.390850-2-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jan 2024 15:18:57 +0200
Message-ID: <CAA8EJprfhZ3m6aKcPsQMAUjDFPPeqN_L-E6Tz604pYJqgSvDZA@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: describe all PCI MSI interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 15:07, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Each group of MSI interrupts is mapped to the separate host interrupt.
> Describe each of interrupts in the device tree for PCIe hosts.  Not
> tested on hardware.
>
> PCIe0 was done already in commit f2819650aab5 ("arm64: dts: qcom:
> sm8250: provide additional MSI interrupts").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 760501c1301a..41f5e6eb2f6b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2248,8 +2248,16 @@ pcie1: pcie@1c08000 {
>                         ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
>                                  <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
>
> -                       interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
> -                       interrupt-names = "msi";
> +                       interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "msi0", "msi1", "msi2", "msi3",
> +                                         "msi4", "msi5", "msi6", "msi7";
>                         #interrupt-cells = <1>;
>                         interrupt-map-mask = <0 0 0 0x7>;
>                         interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> @@ -2349,8 +2357,16 @@ pcie2: pcie@1c10000 {
>                         ranges = <0x01000000 0x0 0x00000000 0x0 0x64200000 0x0 0x100000>,
>                                  <0x02000000 0x0 0x64300000 0x0 0x64300000 0x0 0x3d00000>;
>
> -                       interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> -                       interrupt-names = "msi";
> +                       interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "msi0", "msi1", "msi2", "msi3",
> +                                         "msi4", "msi5", "msi6", "msi7";

This part looks a bit suspicious. All other platforms have these
interrupts in a continuous range.

Other than that, LGTM

>                         #interrupt-cells = <1>;
>                         interrupt-map-mask = <0 0 0 0x7>;
>                         interrupt-map = <0 0 0 1 &intc 0 290 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry


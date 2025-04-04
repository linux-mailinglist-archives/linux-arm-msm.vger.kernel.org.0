Return-Path: <linux-arm-msm+bounces-53215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD268A7BAE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 12:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2651B60F55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 10:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2391DF721;
	Fri,  4 Apr 2025 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/4st2RZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226561DDC37
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762710; cv=none; b=M+QRPv92tNep2Jf2lIEbUDmhn7Nktl2EiaftGJFUuws/AOIVcAL/3fhCM1nw/uhe6c7RVMz9aWgBac8QBT9yF2+SXet+Hc328UKZJSzkerCRCeSqQsUsIXHww4DuQwFSizSLid8ZuMJlLExAlASQTNHa5QK+XoEo6NTF9Gcf2IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762710; c=relaxed/simple;
	bh=puo0zeWGfg/XrDDKhEtVrd4WcWPM6KhzepuNu4U2cy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMukXNDxuFQN7FnsScdIqYh1a0vOfW8Sbl1BEYFJ2JLo68rpITQinUQSybDhk0vBoyoYYoqIXmy40SCaQmEDQrRtsU14BW5qLKdvpBnHvhlXK/M5XYf7rc0xezfA2agvSNbQU2TvAQECA8CkmOk3nk6sFzmdW7dshHPpWodlvYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/4st2RZ; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ff1e375a47so19347317b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743762707; x=1744367507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p2d7X4LZ95qskY0j6wRpuQmYie6Gy7m1icDTnjrkreI=;
        b=m/4st2RZ1mYZE75yFAAubk3/IIDJ6JIabR/ozRM8VS8xImfsqQIuAVxlGtQU97pD/N
         at9MecDkuLyDTFBTc/GnSfKatPHJXGGwPdSlb62nm79r/vCFoKJhws0GY0YYQdx6I9do
         yc7ttS8xCmP/SM5eAR8IoV5v4lD5mxYS74ErF7dLTE1RcqS4ijiM5nZ1nrMGuJO+cmiB
         7mnsRQRQDIFoc6BZxTFQAwLXf+0JHDocNLZKYAci5Rki3RGyrtWdNLmNjsNCdXAniL6Y
         iHoJNl2txeZVsiBZJY783GrBNnFFFqE3lVM/e4l3QrhuC5MYIOWYY2fi4NrLLRA+Jcwo
         aLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762707; x=1744367507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2d7X4LZ95qskY0j6wRpuQmYie6Gy7m1icDTnjrkreI=;
        b=DYELlqi4PGKpo5HxeZCfiuzna7dOrL+SILi9ovo1oFvx+JWQMKCh36DuZLmNSJKoQV
         Bb4t44VCRNtvVDYpvmi4dK+ymXQbFMiocExjKC5Y3dovID8+zYR2za8psZtq64pIRwg6
         KyHbYKtSjLcPlI5JxJrEO1cNjo+ZYjm5rsR8F8o/a0CzcFEaXL7nej/TJJKdKCvd2eUo
         taH9dyUCmtM5LoKOg5ryLKXQ6D5p7MDQ0yrC1l9fOYP1eWTYGxYAFrrdRo6scxJpP99b
         +qGPLLHeRauRVh13u7QG4nz/z4kQBHQFc5CwEiYWPfERckDMFh2ONDs1oOW32RYe/zqf
         PNLg==
X-Forwarded-Encrypted: i=1; AJvYcCU5dWf3VGX+/wRB3KSsP6q1dt2f+63aEdwqGZjjj3pY2EqxGhYPEJmXg9QvETsO6gwKMPtngGenZGCtftwv@vger.kernel.org
X-Gm-Message-State: AOJu0YwRXasTf8N3wJFNVap1A9EKunLOTIStDFfFy705YfpqyWoL4LoP
	Bo4foL6bhHjRWZ2OozfoigjxO1SqoAE0zYINTfvLtMiwNnAO9Vlt3Y97sBD1czivXaaeTZO6FK2
	zI3HruZvsntox0FnEBDTNYaddbMyWuJskh9Gmwg==
X-Gm-Gg: ASbGncspaz9qWgRw/4vOruSKdQi7yH01VoOhYKkZXRAgAeRvCdC1RFW2DGUNtoy2oNQ
	DHlp5cTkErzbPY4e7YsQ48UuMdhBc/0kdhMYNGtjoX5wlI5smbTH1T6qWeicJTGaAQDXy65MYib
	KkNSzGiyKCiYKTOyhzM6M8r14cyDuZ5pYll8f1rQ==
X-Google-Smtp-Source: AGHT+IHL6tNiMt83fP/8QoVhxPRtZTRBqTJ/Cw9tCME3kjDGJ0WhVAtLf3L7QrkxkDkyR8ahdAf3HNvn/ambJdKtSJE=
X-Received: by 2002:a05:690c:9a0d:b0:702:d85:5347 with SMTP id
 00721157ae682-703e16473e9mr44558927b3.36.1743762706998; Fri, 04 Apr 2025
 03:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org> <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Apr 2025 12:30:59 +0200
X-Gm-Features: AQ5f1JoO4h1zt0Jv8N6Q3VB80QU6oNypKSnO1edlCmwT1znvOfAf3BOWzm_IC6U
Message-ID: <CAPDyKFoEEp8AZ7aJ8-wwp8=n+T4gbij15oYaCNhF1Bd-E1nMbg@mail.gmail.com>
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 05:02, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> "rpmhpd" is not documented nor used anywhere. As the enable-method is
> "psci" use "psci" for the power-domain name.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 2 +-
>  arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> index 39530eb580ea..64d9858b4248 100644
> --- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> @@ -57,7 +57,7 @@ cpu0: cpu@0 {
>                         enable-method = "psci";
>                         clocks = <&apcs>;
>                         power-domains = <&rpmhpd SDX55_CX>;
> -                       power-domain-names = "rpmhpd";
> +                       power-domain-names = "psci";

As I understand it, this isn't for cpu-power-mgmt but for
cpu-performance-scaling.

I have been thinking of adding a common power-domain-name for this,
but never reached to do it. I think the last one we added was the
Airoha SoC [1] which uses "perf", which seems to be the most common
one. Still I don't see that being documented.

>                         operating-points-v2 = <&cpu_opp_table>;
>                 };
>         };
> diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
> index 6b23ee676c9e..bfd04e53c5a8 100644
> --- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
> @@ -58,7 +58,7 @@ cpu0: cpu@0 {
>                         enable-method = "psci";
>                         clocks = <&apcs>;
>                         power-domains = <&rpmhpd SDX65_CX_AO>;
> -                       power-domain-names = "rpmhpd";
> +                       power-domain-names = "psci";

Ditto.

>                         operating-points-v2 = <&cpu_opp_table>;
>                 };
>         };
>
> --
> 2.47.2
>
>

Kind regards
Uffe

[1]
drivers/cpufreq/airoha-cpufreq.c
Documentation/devicetree/bindings/cpufreq/airoha,en7581-cpufreq.yaml
drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c


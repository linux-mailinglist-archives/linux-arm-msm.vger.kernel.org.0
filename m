Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B995898D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 20:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfF0SNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 14:13:18 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43770 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbfF0SNR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 14:13:17 -0400
Received: by mail-qk1-f196.google.com with SMTP id m14so2538020qka.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2019 11:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=achxTO4wJS2fcy+fUTW8FntaVv1vHUgFzLLxG1fhXOw=;
        b=eNWXsQ0exTa1bSakdTqOObGEKGnEgDwblZVQJJhMc6tmDj1FOYA3GcFlLKKZEzd1Cz
         PI1/WySjJmmOesMQoLAuP+etojDEqkaHSv6lb+JY73A3B+3a1HiX+heGo1ia1cUK6Z1+
         ptU2jD38bfQFl4WxKH8Zd2QcTi8jQQ0x6t3PeyLMitPC9SFto7PhMElWCdS5MMm4cI/7
         Y637ZXCORBvtnEfNFooPmgcvnnW9dlt59aW86uO0x+Q3Ans2TezNzWkbTN6KH/h3/k7Y
         SO2yFoMWPEHLq70bMYSorYbVTSi1oA9Ju9XuG7+HTQscnd7xxkK4iBbErwrUfwGYXnE+
         Yb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=achxTO4wJS2fcy+fUTW8FntaVv1vHUgFzLLxG1fhXOw=;
        b=pIRQQKnxy+rKKW4y9O5FGhJUlfkxkCzsHx4cuNvABfcF91t6/rmiQPwW5x0Jt4tTGU
         On2YIc3rbRCkGXnUQNRVxoSq57lLtq1vqB7xRLGnI5nAqrFOXsiWli/txxA1JQDZ+Nph
         iU5ouI69BJt390uHgIcYDLqZW/CHgc2hAVmkAvdXvA2M7RgbB9Z2tUzyzjm/G2mKXpLt
         O6O1dz67uxo3DmjgVvtkxkgqd47PIE0uCmX+396GqE0KyMqVG00bP4O0ImLMJdJ6SBvF
         KvlmkeeQfFnMyw3Ae5kNhvrN671mu4SRPctxC2tRIixqzvU6qJHSZ4S4beI7cHsd36Zp
         L4Kw==
X-Gm-Message-State: APjAAAWgW9vhfMBLwyrQv9BuTOpU8pQdSat48llfTUAwd32a6GYwMXx/
        s/r5FkQ7rA1/ftSRoPaW3rj6mJ8nZAgY+d7cArytfw==
X-Google-Smtp-Source: APXvYqwy7qrDg0HYHuRZfowIs3mJ0VwSKLbwaN0ySbdrrf99WLvEu5Te/G7yoyWBHxruC9YCspZoJRpGtsabOzFcrXE=
X-Received: by 2002:a05:620a:1285:: with SMTP id w5mr4441274qki.302.1561659197011;
 Thu, 27 Jun 2019 11:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190627140215.29353-1-niklas.cassel@linaro.org>
In-Reply-To: <20190627140215.29353-1-niklas.cassel@linaro.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 27 Jun 2019 23:43:05 +0530
Message-ID: <CAP245DVTcQ5DXiSHWud42tOXFXAy7LFkqGsfUDoY0cm+7wQCBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add missing space for
 cooling-cells property
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 27, 2019 at 7:32 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> There should be a space both before and after the equal sign.
> Add a missing space for the cooling cells property.
>
> Fixes: f48cee3239a1 ("arm64: dts: qcom: qcs404: Add thermal zones for each sensor")
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Acked-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 01a51f381850..3d0789775009 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -35,7 +35,7 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> -                       #cooling-cells= <2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 CPU1: cpu@101 {
> @@ -45,7 +45,7 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> -                       #cooling-cells= <2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 CPU2: cpu@102 {
> @@ -55,7 +55,7 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> -                       #cooling-cells= <2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 CPU3: cpu@103 {
> @@ -65,7 +65,7 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> -                       #cooling-cells= <2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 L2_0: l2-cache {
> --
> 2.21.0
>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0838272747
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 07:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfGXFVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 01:21:50 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33583 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfGXFVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 01:21:50 -0400
Received: by mail-ua1-f67.google.com with SMTP id g11so17961782uak.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 22:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oi/OjsgOU/56zWqfJ08vj5GsGuTHtcSjKS7DehgEZ00=;
        b=Ny/ccUmsgikYkzhJxwqhFM0rKqUpt+oemiMOdIlgorofwJaszzajLDUlrd3p94oiAt
         cHMbiaokXpIHwJTdQURza4IV92tvAYWdb7Ul8EPdTh5rDmI1wbeS8dwuzmBHmt72JP1l
         K7giyPr6ybXNVlnfO0+CRAs0g5ZieYtYQKrqQGthdoDQJ1hzRYcax91fYW2JL5I7gluf
         nifWdnqbKT4vX7tcZ3CwOburD9zuBYjubfKgE/Fsxm7bpNaqpTxfzy3JEGFrSvw26cho
         2H3OvtPUDmW+EaH53e7badSsivfa7GCl0hBmVQZFOmKhaGhgJXGrE3OtVYaHveOnF8qD
         t3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oi/OjsgOU/56zWqfJ08vj5GsGuTHtcSjKS7DehgEZ00=;
        b=Ko+F2vK6ezbWC7pA+0sqZTJM6ERaJdweIqJB3HPCU/yh9ZyF2ewmFuNYIMRorovckE
         iPFQdPHluBThVgKH+gWHaWeGl3A4mZQXL7wOadT/+IkPxcniiJ5gD3QYU0CZttP1j49H
         lr5Eq/ZHTU9NasSYqZsoVA0im9Ixool+GfrPZtUF6kH1rZVqXk9/cDI3wDzcsBQGRux5
         VMhRxJYdksC90GV9fGx+ZmHs6EzOYTf+QFAwR3ylmtymRYBWHdrm8Zdyw+9Nli6xda3u
         f/Vfml9gWDMZeEWW9S78z0EPWyFASATl5fqniDxOU1B6Z5Zt/b1XsDP0B7kMcm8HN/Wz
         keCg==
X-Gm-Message-State: APjAAAX31MvYpYQ5Hmg17pHr3MQnsQ5csRpI6Hw9tZaukN2Sa6AI3Q0D
        lxrVzjSOyNe0dbI5UVbbUHWE2xD1uO/zHNFf3eM=
X-Google-Smtp-Source: APXvYqx0WauV/PjdF1lUUuZXSYyiqRlLYG/T7Zia0hA1FLzkRtsJ0o5mtJz3PFpQjgZM43vU8do8IXGnuxnc8EduObw=
X-Received: by 2002:ab0:30f5:: with SMTP id d21mr49123116uam.67.1563945709074;
 Tue, 23 Jul 2019 22:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-6-vkoul@kernel.org>
In-Reply-To: <20190724044906.12007-6-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 24 Jul 2019 10:51:38 +0530
Message-ID: <CAHLCerNWnjSYEqDOEdSzULLvTHkMxVMiEL2BaCY9R4eDF_uBrg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from
 unit name
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 24, 2019 at 10:20 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Unit address is supposed to be a number, using a macro with hex value is
> not recommended, so add the value in unit name.
>
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name should not have leading "0x"
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 1ebbd568dfd7..9b27b8346ba1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -963,27 +963,27 @@ ap_ts_i2c: &i2c14 {
>  };
>
>  &pm8998_adc {
> -       adc-chan@ADC5_AMUX_THM1_100K_PU {
> +       adc-chan@4d {
>                 reg = <ADC5_AMUX_THM1_100K_PU>;
>                 label = "sdm_temp";
>         };
>
> -       adc-chan@ADC5_AMUX_THM2_100K_PU {
> +       adc-chan@4e {
>                 reg = <ADC5_AMUX_THM2_100K_PU>;
>                 label = "quiet_temp";
>         };
>
> -       adc-chan@ADC5_AMUX_THM3_100K_PU {
> +       adc-chan@4f {
>                 reg = <ADC5_AMUX_THM3_100K_PU>;
>                 label = "lte_temp_1";
>         };
>
> -       adc-chan@ADC5_AMUX_THM4_100K_PU {
> +       adc-chan@50 {
>                 reg = <ADC5_AMUX_THM4_100K_PU>;
>                 label = "lte_temp_2";
>         };
>
> -       adc-chan@ADC5_AMUX_THM5_100K_PU {
> +       adc-chan@51 {
>                 reg = <ADC5_AMUX_THM5_100K_PU>;
>                 label = "charger_temp";
>         };
> --
> 2.20.1
>

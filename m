Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B653710CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 07:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732641AbfGWFIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 01:08:21 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:44368 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732169AbfGWFIV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 01:08:21 -0400
Received: by mail-vs1-f68.google.com with SMTP id v129so27967694vsb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tDS4gSwn4vjiBJe81KYYzL7InQAaE1qq2PXrKhXqlTs=;
        b=j2KDdcapzsm80aR134jUbGPOcIEjhGx/YtVlRLot6jVeXKbFVo2V6o2h1GGw8NGfQC
         3A1QdC8IzxVAJqs2Ts+V5VbaKUmNDsxpnBgVGkb6yp792JEqQVZAk+Fiv6MVkaZUjCcd
         MC/MWFWlp/PPKJs+hDTiDJdPKiIoE7/Avv5FZkpIhdH76Crk73OHLTGYm6G98STksvLL
         DI1NuHdqP7pAPYkerHyXPKBDJzx5JxUdCtGyvDjjOuY5kbYc+uvmaP0/B9ea4m3cuD5j
         XrPiAJRhJaLwmcM61oSGQoScFRtCqfLLOGa39hVcbEBed86bhpG1Ds/Lx+Ojewk/MIhm
         C/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tDS4gSwn4vjiBJe81KYYzL7InQAaE1qq2PXrKhXqlTs=;
        b=PiGl9vl09MD96O55zWKwPmuwghPbaeht/yJ7E/g7vraZDNl4RjkLTsNfLOBKy4kHZJ
         4WN8KDVbukHgALpk04osmGOli0o3VHjdlVEy3/hx5qMxLd+uHMRjGEBB6A3tzHAW3pAO
         n90BELYndphzdQYwM7WjmndYI+JaFc+zTRQUqDg9S7wtPN2+NH5PyajoECeIvACmTDbb
         ZaYBIcV+0c1QLSpYLyCRFGC6sZBW78DSIAnoUCz+5u2i5rT2Ni6OeYSSyTpmj1Yoi7/x
         fcBskBq+DDb4qWujA5q8y95fNd8PviGqTOBI9jJpKWv7SRJzFXC7CVFxuwPVDP0itlJ9
         MrNQ==
X-Gm-Message-State: APjAAAWzGNkzAC7mLoDUSeoL0DiQtyfsuhkkDuTlni8IYqjeqSA2NkTI
        y3nEmjWR/JJSpQDRj6ugNuwKfjMew9kozVTdsBg=
X-Google-Smtp-Source: APXvYqxSMp8D+aU6wN4mzW36IwWXd8EVY96kOzI5ofuaEVtfyj5O46xSTrH7ZpBTy4a/02bd6633pdIqQcvPZfcuqxs=
X-Received: by 2002:a67:2e0e:: with SMTP id u14mr46945969vsu.182.1563858500194;
 Mon, 22 Jul 2019 22:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190722123422.4571-1-vkoul@kernel.org> <20190722123422.4571-6-vkoul@kernel.org>
In-Reply-To: <20190722123422.4571-6-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 23 Jul 2019 10:38:09 +0530
Message-ID: <CAHLCerPC0thO9gsaDAxc+XaexinrzG6JGJ8BhB4bFFuQ-P9Jxg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from
 unit name
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 22, 2019 at 6:06 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Unit name is supposed to be a number, using a macro with hex value is

/s/name/address?

> not recommended, so add the value in unit name.
>
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name should not have leading "0x"
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
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

I'm a little conflicted about this change. If we're replacing the
address with actual values, perhaps we should do that same for the reg
property to keep them in sync? Admittedly though, it is a bit easier
to read the macro name and figure out its meaning.

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

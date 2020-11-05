Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD2A2A73C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 01:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730325AbgKEAaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 19:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732248AbgKEAaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 19:30:05 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20ECC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 16:30:04 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id w123so614934vka.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 16:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d5o9eOs5Tiv+TUmgROBahgNX011WshZjeFSi3IU5ZO4=;
        b=Jz8xTXMUGfKjYINWV76nnlMyGNncfJDBZmnGTdthlDIuR5k52NxJXwzvCdDKnptQAH
         yS3AyKnVlm7JiwHOaYYSrP0nqH4628VWotg6zKA7qq14CjilU7RYzeQ+E2gm3hCrTYWS
         9h2CZCT1huTTy8VOtstkeS9+YJJ8ZVoinMDpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d5o9eOs5Tiv+TUmgROBahgNX011WshZjeFSi3IU5ZO4=;
        b=RxZDb13jWV8zLiAw9j4OKDb0hFRqJ6duQSdxku8b+zIGy0viuuHfrkwvhirF16OGCi
         Vzh/r77LpAa0YQpgaLvJ8ixghEmPJfGKhmriFyM/k6mHqf3KzVuG8mYh1s9X5CEJVCH0
         YCJDTrEFXsK+XYlpJZN5Nk6G5V/FaeyD+wA6NEAqrQJj1MLPRojdejHUmd9c1c0y/LlZ
         n1s9/iAQeXn6cU7o5eMf1rOYuw8/Ck93nSfy5ELU34bqLWvKAHAHVziq3hk20wdO7E6o
         CVai7wndOUPVFR/01bhHOCQTe4KkrD3afCaALhdscWoWdJd/e45wtsO0gbSV06Q2AHPZ
         0bPQ==
X-Gm-Message-State: AOAM531qRfFNbxw2ijLqHM/str8inpZ/hqU1bRZ4+JuRH9dgn8bgQHsk
        DaSsEpdy8L3TzGhJvx5edoiMzaN+rzQA5w==
X-Google-Smtp-Source: ABdhPJx7I+Pj9q0hjyyYoZFbkrapbKWhYih4jWxI9y6cOxwKBtl0X3WDAxtLo0cbiL2gSuAWDc82Ew==
X-Received: by 2002:a1f:2ed2:: with SMTP id u201mr43571vku.7.1604536203652;
        Wed, 04 Nov 2020 16:30:03 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id l16sm518507vke.27.2020.11.04.16.30.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 16:30:02 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id r23so6227uak.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 16:30:02 -0800 (PST)
X-Received: by 2002:a9f:36a1:: with SMTP id p30mr250823uap.64.1604536202255;
 Wed, 04 Nov 2020 16:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20201103103749.1.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
In-Reply-To: <20201103103749.1.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 4 Nov 2020 16:29:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wc-b75a-QSX8qLq0+fCbcnvh_6q+N6azL=+Tk+rMie1g@mail.gmail.com>
Message-ID: <CAD=FV=Wc-b75a-QSX8qLq0+fCbcnvh_6q+N6azL=+Tk+rMie1g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the
 default supply for pp3300_hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 3, 2020 at 10:38 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The trogdor design has two options for supplying the pp3300_hub power rail,
> it can be supplied by pp3300_l7c or pp3300_a. Initially pp3300_l7c was
> used, newer revisions (will) use pp3300_a as supply.
>
> Add a DT node for the pp3300_a path which includes a power switch that is
> controlled by a GPIO. Make this path the default and keep trogdor rev1,
> lazor rev0 and rev1 on pp3300_l7c.

It might not hurt to mention that even on early hardware that GPIO84
was allocated to this purpose but that it was a stuff option for what
actually provided power to the hub.  This explains why it's OK to add
the fixed regulator (just with no clients) even on old hardware.  If
GPIO84 had been used for something else on old hardware this would
have been bad.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index bf875589d364..2d64e75a2d6d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -174,6 +174,21 @@ pp3300_fp_tp: pp3300-fp-tp-regulator {
>                 vin-supply = <&pp3300_a>;
>         };
>
> +       pp3300_hub: pp3300-hub {
> +               compatible = "regulator-fixed";
> +               regulator-name = "pp3300_hub";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&en_pp3300_hub>;
> +
> +               vin-supply = <&pp3300_a>;

You're leaving things in a bit of an inconsistent state here.  The
"pp3300_hub_7c" is always_on / boot_on.  This new one isn't.  I know
this is slightly more complicated due to the fact that downstream we
have a way to control the hub power but didn't quite get that resolved
upstream, but the way you have it now, on new hardware upstream will
power off the hub but also keep "pp3300_hub_7c" powered on for no
reason.  Seems like that should be fixed?


> +       };
> +
>         /* BOARD-SPECIFIC TOP LEVEL NODES */
>
>         backlight: backlight {
> @@ -469,7 +484,7 @@ ppvar_l6c: ldo6 {
>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>                 };
>
> -               pp3300_hub:
> +               pp3300_hub_7c:

nit: If it were me, I probably wouldn't have bothered introducing the
"pp3300_hub_7c" alias since it's not a real thing in the schematic.  I
would have just had the older revisions refer to "pp3300_l7c".  If you
really love the "pp3300_hub_7c", though, I won't stand in your way.


>                 pp3300_l7c: ldo7 {
>                         regulator-min-microvolt = <3304000>;
>                         regulator-max-microvolt = <3304000>;
> @@ -1151,6 +1166,19 @@ pinconf {
>                 };
>         };
>
> +       en_pp3300_hub: en-pp3300-hub {
> +               pinmux {
> +                       pins = "gpio84";
> +                       function = "gpio";
> +               };
> +
> +               pinconf {
> +                       pins = "gpio84";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +               };
> +       };
> +
>         en_pp3300_dx_edp: en-pp3300-dx-edp {

"hub" sorts after "dx", so the ordering is slightly wrong here.

-Doug

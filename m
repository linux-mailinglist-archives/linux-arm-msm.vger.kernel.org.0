Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3090D52F5A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 00:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353903AbiETWXi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 18:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353889AbiETWXe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 18:23:34 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E221A074A
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 15:23:30 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id y13so17246943eje.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 15:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wSe3xVUI2FvJ4kebDMAPMIferoZFBFRpydfGGpjOOiI=;
        b=d3g7VML/NPjGnWZ3BdRu1VkDMIeAXgr5VS3O6o6ZCryHnBCT4zEH08/ougquUx7+WC
         LKFYkKA8niA8PKfMmOydnjabGoYoKyLa+N2J6fk3r6mzU2rFMnlNeYTgbeOFDdd1Igqz
         XFWA1sOlbvmNXKnlaOyskUg+txMParmR/z84U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wSe3xVUI2FvJ4kebDMAPMIferoZFBFRpydfGGpjOOiI=;
        b=fd5J+xYESZO7OUyJU/5v3GtbTfCTAzZRTvP46OPpn9mPSNCc9/JH+mun5u+XNFxjp3
         LnQp5UO59cD50jkp7zDcUAKLRkwplBWTrU5t5uOt77rL62pzdWQ8IzaPyMrl/tica+zk
         UKeNI8OqoB5y91bS5PcZ/CDXJ4tI16aykK3Jc9lruQzpTIk5MZ7NS3CFv6ikgvOaFsdD
         RLHmV+VFAMsweVLfErEOcWxlYWcVwEFJd27x4TFZ8nWtOsckBZ6ODKj3rvRxgAj40M5T
         AP0n5B66b96eq/cFTEGuL6yTl5FqSELFH/3O9CFC1bDWDFaLiTYsVi8vv252mT3DLTQU
         6mJw==
X-Gm-Message-State: AOAM532NmhuoUkYOYeX43SVYuaYiTG3qVP+RvImdUtIrimBnw66cOXyA
        rrBCHSl9Sv4mDZasUD2p9P1xFoKkrqsr9T0j1CU=
X-Google-Smtp-Source: ABdhPJzFFzIU95sVH97QKighEVvqdiDAe6QRQs4hPuelhfL8qKdc0NRradRWU7MJnfrsZhrDEYHLwA==
X-Received: by 2002:a17:907:6e04:b0:6f4:d6f3:c72a with SMTP id sd4-20020a1709076e0400b006f4d6f3c72amr10324734ejc.636.1653085409190;
        Fri, 20 May 2022 15:23:29 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906728c00b006f3ef214e32sm3644668ejl.152.2022.05.20.15.23.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 15:23:27 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id r6-20020a1c2b06000000b00396fee5ebc9so5056537wmr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 15:23:26 -0700 (PDT)
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr6876190wmr.15.1653085405984; Fri, 20
 May 2022 15:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220518172525.3319993-1-swboyd@chromium.org>
In-Reply-To: <20220518172525.3319993-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 15:23:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1-jZYgPeKDi23=w2YL6y8ZGE7zwOWHdc9xXv6nMDy_w@mail.gmail.com>
Message-ID: <CAD=FV=V1-jZYgPeKDi23=w2YL6y8ZGE7zwOWHdc9xXv6nMDy_w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Split out keyboard node
 and describe detachables
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 18, 2022 at 10:25 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Trogdor devices that have a detachable keyboard still have a
> non-detachable keyboard input device present because we include the
> cros-ec-keyboard.dtsi snippet in the top-level sc7180-trogdor.dtsi file
> that every variant board includes. We do this because the
> keyboard-controller node also provides some buttons like the power
> button and volume buttons. Unfortunately, this means we register a
> keyboard input device that doesn't do anything on boards with a
> detachable keyboard.
>
> Change the node's compatible on detachables to the newly introduced
> "google,cros-ec-keyb-switches" compatible to indicate that there are
> only switches and no keyboard to register. Similarly, move the keyboard
> include that defines the keyboard-controller node out of
> sc7180-trogdor.dtsi to boards that actually have a keyboard so that the
> matrix properties are not defined on boards with the switches
> compatible. Future boards can either use the include approach or the
> node definition approach to describe a keyboard with possible switches
> or just some switches.
>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> This is based on an immutable branch from Dmitry (on Cc)
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/5.17-cros-ec-keyb
>
> where this patch should be applied on top of so that a bisect doesn't
> break. The driver side change only supports one compatible or the other,
> so we can't apply this patch unless the driver side change is present.
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 4 ++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 6 ++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 2 ++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi   | 2 ++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts        | 2 ++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 1 -
>  6 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> index 14ed09f30a73..a131dba4bf97 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> @@ -86,6 +86,10 @@ &camcc {
>  };
>
>  &cros_ec {
> +       keyboard-controller {
> +               compatible = "google,cros-ec-keyb-switches";
> +       };
> +
>         cros_ec_proximity: proximity {
>                 compatible = "google,cros-ec-mkbp-proximity";
>                 label = "proximity-wifi";
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
> index f32369af1351..5d7ca89f7862 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
> @@ -121,6 +121,12 @@ &camcc {
>         status = "okay";
>  };
>
> +&cros_ec {
> +       keyboard-controller {
> +               compatible = "google,cros-ec-keyb-switches";
> +       };
> +};
> +
>  &panel {
>         compatible = "samsung,atna33xc20";
>         enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> index 69666f92176a..4601f5afe255 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> @@ -9,6 +9,8 @@
>  ap_h1_spi: &spi0 {};
>
>  #include "sc7180-trogdor.dtsi"
> +/* Must come after sc7180-trogdor.dtsi to modify cros_ec */
> +#include <arm/cros-ec-keyboard.dtsi>

As pointed out in a separate email [1], I think the include of
sc7180-trogdor.dtsi needs to be removed from this file. I think it's
still OK to include the keyboard.dtsi file here, though, since the
trogdor.dtsi file will always be included before the lazor.dtsi. You
just might need to update the comment.

https://lore.kernel.org/r/CAD=FV=VSMyJrs9bTE2XEC=q7VtZi6YKFaKJQJyLTZhVaYa9-Jg@mail.gmail.com/

Other than that, this looks good to me.

This will, of course, need to be coordinated with Joe's patches adding
the new boards.

-Doug

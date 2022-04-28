Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544CE513881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 17:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234535AbiD1PlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 11:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234156AbiD1PlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 11:41:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BE1B1AA7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 08:38:01 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gh6so10435157ejb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uAQT8HaM1F/C7tI0w3YAOWuIicIw4A32c+GrUwkdwpQ=;
        b=aFj7WCsl9W2elIghvPF/0aoqi+ZIwLetMRy93r16p5B5v2Z9g0a/wGR9ENUf36Yqqn
         P4N6UC5a1do9q3I7xV8inSoMr7BYKd/gM/oDozailW2vC4ysRvTBi32rUo1cFuw9pmGC
         Ndiagl5DtuLdbsmZZLk+131jtQO4I2gs21A7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uAQT8HaM1F/C7tI0w3YAOWuIicIw4A32c+GrUwkdwpQ=;
        b=cnH0124T2MZOTFy1koV7l7l75Pse29GXaMmYJFFU2umoiJFKzjwH6Fl3n5tceFU5yQ
         HBfS5EzwS55uVtB3ihM4s1AmwmfrtQpL966iEZv/tu6NvXAVl6sWCQyZLLgxVRyMB+Kt
         40U9sz7LfkwWrjs/wBokYe6gLasdkIYgh6Eg06vYkUfKJQv1DUvaNAFxOGgOVKvcATu2
         tOoU4VpJnQHMDEUe87wC/PjfecYc8TyCLVKK8qu31uYeh1hPrPjQthVJIkvNyse/IRk0
         G8/DpMnnri5lRy1OUBN/AXH5t7d3F5P/NUikyUcV5CcGQg0vKALAM27PLFGqO2v+yRbJ
         0PVg==
X-Gm-Message-State: AOAM530loz4dWU7uTgbBcKhcjGnvmvinh+oxoMWuus77JaEldvonfYMJ
        STvMulqnpbaVbLM3iNB9loQ6VhS9JU5RgWoD
X-Google-Smtp-Source: ABdhPJymyiF+lNL5K3Tlhnd65n7bR+ho5GoWTzdh9z1skAMxW1pwyavcXuUnu94D0Dboge5M3bqSog==
X-Received: by 2002:a17:907:6d07:b0:6f3:d077:813a with SMTP id sa7-20020a1709076d0700b006f3d077813amr7409520ejc.138.1651160279769;
        Thu, 28 Apr 2022 08:37:59 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id i12-20020a056402054c00b0042617ba6385sm1746585edx.15.2022.04.28.08.37.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 08:37:58 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id v12so7277045wrv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 08:37:57 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr18483210wrx.422.1651160276475; Thu, 28
 Apr 2022 08:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220428014022.v1.1.I08a15a73996211d37dff16810c40ee1539658601@changeid>
In-Reply-To: <20220428014022.v1.1.I08a15a73996211d37dff16810c40ee1539658601@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Apr 2022 08:37:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W716PePPFRJ+tjyKWg5CGtC7qz1+amVpq=iVk7neqkqg@mail.gmail.com>
Message-ID: <CAD=FV=W716PePPFRJ+tjyKWg5CGtC7qz1+amVpq=iVk7neqkqg@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7180: Add mrbland dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 28, 2022 at 1:41 AM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> +&i2c4 {
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       ap_ts: touchscreen@5d {
> +               compatible = "goodix,gt7375p";
> +               reg = <0x5d>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
> +
> +               interrupt-parent = <&tlmm>;
> +               interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +
> +               reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +
> +               vdd-supply = <&pp3300_ts>;
> +       };
> +};

This is a detachable, right? So can you add these to match what
Stephen is doing for existing detachables [1]

&keyboard_controller {
       /delete-property/keypad,num-rows;
       /delete-property/keypad,num-columns;
};

It should be sorted based on the name of the node you're overriding,
so it should come right after &i2c4 I believe.


> +tp_en: &en_pp3300_dx_edp {
> +       pinmux {
> +               pins = "gpio85";
> +               };
> +       pinconf {
> +               pins = "gpio85";
> +       };
> +};

The above has the exact same problem that Stephen asked you to fix on
wormdingler [2] about indentation / blank lines. Can you fix it here
too?

In addition to the changes requested above, it's probably nicer to
keep all 3 patches you're sending in one series just because they all
touch the Makefile.

[1] https://lore.kernel.org/r/20220426225748.324759-1-swboyd@chromium.org
[2] https://lore.kernel.org/r/CAE-0n53juQ8--Sai=wKypj8URw+V1giOOhzd-p13fVbe_vxZ0Q@mail.gmail.com/

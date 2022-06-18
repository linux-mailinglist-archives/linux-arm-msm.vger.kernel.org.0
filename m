Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7846B550140
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 02:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383572AbiFRAQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 20:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383611AbiFRAQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 20:16:44 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399E236E1A
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:43 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id p69so6089317iod.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUY4IDfHVWw771LXx7m4NTtTCDxzgte6IAjfOYq4YV0=;
        b=Z7sV+UaSj09IY9kA8WmG0cAhyHKUJQzu0VKFQDd35RCeypxP2w5NJwsNUhCgMjUqKd
         SUwKjLrCI+SJgR8B8wx6BKirjcr9zkigekjP4pH4pP1gHiqDd7b/5nG/hrIYYxxMwC+G
         YIU5lBenThrlc8Xox7yVYVZNtzkkY2AEO2kps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUY4IDfHVWw771LXx7m4NTtTCDxzgte6IAjfOYq4YV0=;
        b=LMr12t2WvW/giyKR9noHuGpY05jDMa91uyA9HBry0kEc48CmdBHUw5WMbokYGk/9tc
         fm6/B0ngMzaNwGAVSEJLyhOhUlQI/xt3FhjMIiV6IUe7UPbgPhpFw7dtvw5qlczO1SOR
         Jl8C61E6t4F3iCOd9GAnnnsMEll3c5HirZVxPYO5hFS89ClPmGF4jPKt2oWQJvOQbPzq
         ZJBp/YGPVg7tJxrc6s5u4Zz3D3Iqqk1GRQtVjAOZIhY/eOij1185fkJDt/9ehTsy1Eae
         0V03rJCBO7ImQokjeQ5DEUlCBp69tv6Vb43GKQZd95rdgF6L6e7o/vgJ3Z2fgzkBw76X
         pRJw==
X-Gm-Message-State: AJIora95/GDicAC5WjHRB+bwdU1BPwxxSh5hmXSHPiIVNp6VVd13Zqto
        1hG92vEx6ITepc0N8vpyJLtTILgfa2Eo/BPlR4Y=
X-Google-Smtp-Source: AGRyM1veHeLKjVVBI2GUgRNpEuLkH+/4Q0G3YE0D/j5xR6FQpLVJIcVTMlOK1k3Az0H3/lw1+fJwAw==
X-Received: by 2002:a05:6602:2b0b:b0:64f:acc1:52c3 with SMTP id p11-20020a0566022b0b00b0064facc152c3mr6194507iov.38.1655511402503;
        Fri, 17 Jun 2022 17:16:42 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id h22-20020a02c736000000b0033792143bf5sm1230077jao.67.2022.06.17.17.16.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 17:16:42 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id r5so6044505iod.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 17:16:41 -0700 (PDT)
X-Received: by 2002:a05:6638:3472:b0:338:3aa2:fe9 with SMTP id
 q50-20020a056638347200b003383aa20fe9mr2033865jav.209.1655511401321; Fri, 17
 Jun 2022 17:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220617164000.v8.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
 <20220617164000.v8.4.I41e2c2dc12961fe000ebc4d4ef6f0bc5da1259ea@changeid>
In-Reply-To: <20220617164000.v8.4.I41e2c2dc12961fe000ebc4d4ef6f0bc5da1259ea@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jun 2022 17:16:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFxpBdsp7HN3B_cyq9un8zCH4bhyZXghBuHnixi2jn3w@mail.gmail.com>
Message-ID: <CAD=FV=XFxpBdsp7HN3B_cyq9un8zCH4bhyZXghBuHnixi2jn3w@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: sc7180: Add pazquel dts files
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 17, 2022 at 4:40 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Pazquel is a trogdor-based board. These dts files are unchanged copies
> from the downstream Chrome OS 5.4 kernel.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v7)
>
> Changes in v7:
>     - Incorporated changes from Stephen's "Simplify!" series.

You missed an important bit here. Pazquel has a trackpad, doesn't it?
In the "Simplify!" series Stephen made it so that devices that have a
trackpad need to enable it, right?


> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5cfd6316768c..dc26704dfe34 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -79,6 +79,10 @@ dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-mrbland-rev0-auo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-mrbland-rev0-boe.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-mrbland-rev1-auo.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-mrbland-rev1-boe.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pazquel-lte-parade.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pazquel-lte-ti.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pazquel-parade.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pazquel-ti.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r1-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-pompom-r2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
> new file mode 100644
> index 000000000000..ecedab8d1662
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Pazquel board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"

This is not good and was an important part of "Simplify!" sc7180.dtsi
should only be included by sc7180-trogdor.dtsi.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
> new file mode 100644
> index 000000000000..5991c94b4aa1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Pazquel board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +#include "sc7180-trogdor.dtsi"
> +
> +&ap_sar_sensor {
> +       compatible = "semtech,sx9324";
> +       semtech,ph0-pin = <1 3 3>;
> +       semtech,ph1-pin = <3 1 3>;
> +       semtech,ph2-pin = <1 3 3>;
> +       semtech,ph3-pin = <0 0 0>;
> +       semtech,ph01-resolution = <1024>;
> +       semtech,ph23-resolution = <1024>;
> +       semtech,startup-sensor = <1>;
> +       semtech,ph01-proxraw-strength = <3>;
> +       semtech,ph23-proxraw-strength = <1>;
> +       semtech,avg-pos-strength = <128>;


You seem to be missing the recent downstream changes here.

semtech,input-analog-gain = <0>;
semtech,cs-idle-sleep = "gnd";

You had this right in one of your two v6 series. Not sure why you keep
regressing random things each version...

-Doug

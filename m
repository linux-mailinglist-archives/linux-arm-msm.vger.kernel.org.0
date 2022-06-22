Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28039555596
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 22:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245653AbiFVU5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 16:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244773AbiFVU5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 16:57:42 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA6D186FE
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 13:57:41 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id cf14so15864257edb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 13:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRHKL/PCh7uXTEVmvzsqwR97j4jnEpJ37ZwcTnRNvyY=;
        b=JrK4AgfieY7iUl/TlyvCpR+aSalICydr1GM9EJaGrnuIsxQrjeveuSgEf23RvIdYLD
         U7shVro3lwFkUBMoDdZEK+A3SDD9K+JohD0MPPSwnT1YjHrP8kwMZZKM18SeWJLEqf4z
         yGuFfbETIr+QFFiB5HvzT1GyrUTcb2ByOEWYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRHKL/PCh7uXTEVmvzsqwR97j4jnEpJ37ZwcTnRNvyY=;
        b=26ngaU/5Iyhi0GB6ymtv2+k/D/5U0bRzcOnh7mw/3lJICpJaaOvcZZ3+kCjWa+GqZ+
         3udvPamG5SBHIHk3+iyXC2GZ8bX2s3ec6Q4gb5kCf0+ALhXTHcnEx6znvw8VOAAdUvFI
         V/lZNXsJ5A1CVHTCywLj7TX4uweQnnof2SxK1/u4YYbPzlaqDqi/MW15XOcKmdM8+pwi
         GufOmyhXmAerGx3irlFjiNYCMkZ1UVbC7rYGFP7RU/VhyZGLwmL4JvCyOac7fZtjJHTU
         zz6z8XIrAP251SfswaJO8Q5yf0/CVsPvLzh5YdyfbRP+8V6v8bUUexqydrtHOK5DRAMY
         igig==
X-Gm-Message-State: AJIora/ln9V1DZ91p6UAaJvwA3/TEQ+tnX4U70F9AvTRy8mZyU/JIeRV
        +1Ga5QVvjsLmr3pVlxXI9LWRduEKqv5yg0+15TE=
X-Google-Smtp-Source: AGRyM1uFmcVRfTHFmq7o/q5de3WWZHTCV4/JFxmkls9PD3UcbOJxb+JcwdzY0oyYU2hJpPR/3+02+g==
X-Received: by 2002:aa7:d685:0:b0:435:7910:f110 with SMTP id d5-20020aa7d685000000b004357910f110mr6272743edr.247.1655931458935;
        Wed, 22 Jun 2022 13:57:38 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id o2-20020a170906768200b0070b8a467c82sm9790558ejm.22.2022.06.22.13.57.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 13:57:37 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id g27so18447194wrb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 13:57:37 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr4985933wrr.583.1655931457096; Wed, 22
 Jun 2022 13:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220621053351.650431-1-joebar@chromium.org> <20220620223345.v9.5.Ib62291487a664a65066d18a3e83c5428a6d2cc6c@changeid>
In-Reply-To: <20220620223345.v9.5.Ib62291487a664a65066d18a3e83c5428a6d2cc6c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Jun 2022 13:57:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4T8R3b9V+m-xtebPJK2gXA+O5H2G8yXHVQ5BTa84JEA@mail.gmail.com>
Message-ID: <CAD=FV=W4T8R3b9V+m-xtebPJK2gXA+O5H2G8yXHVQ5BTa84JEA@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] arm64: dts: qcom: sc7180: Add kingoftown dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
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

On Mon, Jun 20, 2022 at 10:35 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Kingoftown is a trogdor-based board. These dts files are unchanged copies
> from the downstream Chrome OS 5.4 kernel.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
> Changes in v9:
> - Simplify trackpad enabling (51d30402be75).
>
> Changes in v7:
> - Simplify spi0/spi6 labeling (d277cab7afc7).
> - Remove #include of <arm/cros-ec-keyboard.dtsi>.
>
> Changes in v6:
> - Add #include of <arm/cros-ec-keyboard.dtsi> from v5.4.
>
> Changes in v4:
> - Fix description (no downstream bits removed).
> - Add missing version history.
>
> Changes in v2:
> - First inclusion in series.
>
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  44 ++++
>  .../dts/qcom/sc7180-trogdor-kingoftown-r1.dts |  17 ++
>  .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   | 224 ++++++++++++++++++
>  4 files changed, 287 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index dc26704dfe34..a9f2ad013179 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -60,6 +60,8 @@ dtb-$(CONFIG_ARCH_QCOM)       += sc7180-trogdor-coachz-r3-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-homestar-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-homestar-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-homestar-r4.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-kingoftown-r0.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-kingoftown-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-lazor-r0.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-lazor-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += sc7180-trogdor-lazor-r1-kb.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
> new file mode 100644
> index 000000000000..85aec1be98fc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dts
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Kingoftown board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"

Just like for pazquel, the fact that you have "sc7180.dtsi" included
here means that you didn't incorporate the "Simplify!" changes
properly. Please try again.

-Doug

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916F554FE67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 22:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346993AbiFQUeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348868AbiFQUdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:33:42 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C1619016
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:33:40 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id n10so10753615ejk.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kGM6owAKWdqJSsOUHDqpYoze7aqTncMo34VzgmTxAdU=;
        b=oMQYGmc82OXfxoFSmPDVYmgcWQaXhz/B0B69AsuztTlZwrqqvSAi9841ngCw4LKaV2
         wHI5TejUzoQ89cwRUL6Kw2+TI0KjFebw6Xo3IcoMcvVkye9b5dnAgqzl4bcsJzBmIwuO
         y1MIHM0aUqtlmbezX6K7NDmuFRVrXfX3MtsTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kGM6owAKWdqJSsOUHDqpYoze7aqTncMo34VzgmTxAdU=;
        b=6ZOoJ5x7mrwGrnrXbDsECPtBXM9txlxESLDIUpVpgRGdvNw2WLDllyHSjIOFmHOSw/
         Phjz2kw3W5VnW3n2p10lffvxj5y8gMbwF9dsAw80wj3lVNr0aV4Hj0m7F1YueV7ne42S
         RlVmZ5g0NV4fmPcRctbzxuO8i6PFrfN64rb6y+262+gljoH8dnVROmWjFE+6dIN5ouG0
         7pBCLv6ZFPINlTiH85Wz74rne6bGscRYDNaA/In+rT6bCUK+dH3+rFnstHDw2UvqiZIA
         G0TVNtAdAXXjAlAHiRh+/yWcacuer5f7O3QIIArwYClgHm0ihY3WOyKv1IMkLlPiczo8
         3obw==
X-Gm-Message-State: AJIora9EdkXCL/t82naH/N5Lg2bVawtjiWBlj733JvY3vlQ0JlPfhwe+
        8fQMKQO/piwlToatJoffC0iH37JQfLI/QelMvZo=
X-Google-Smtp-Source: AGRyM1stcBit8CYyX1Ku71xmt70qGkyNOGlnIUOsbaHub97IH6u/SceOel1p7wB7xRo1WcZBZgWpzA==
X-Received: by 2002:a17:907:c26:b0:711:ca03:ab3c with SMTP id ga38-20020a1709070c2600b00711ca03ab3cmr11152783ejc.654.1655498019022;
        Fri, 17 Jun 2022 13:33:39 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id gg19-20020a170906899300b00715705dd23asm2533055ejc.89.2022.06.17.13.33.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 13:33:38 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id z9so2834504wmf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:33:38 -0700 (PDT)
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr22300001wmd.118.1655498017647; Fri, 17
 Jun 2022 13:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220617111021.v6.1.I9e299d3fa6fbf50df6fc7207050bf5c3a7bf4c61@changeid>
 <20220617111021.v6.2.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
In-Reply-To: <20220617111021.v6.2.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jun 2022 13:33:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTn0RuwDw8pxA4j4RP8EKbReeoPWzO0S237-sZFdi_9Q@mail.gmail.com>
Message-ID: <CAD=FV=XTn0RuwDw8pxA4j4RP8EKbReeoPWzO0S237-sZFdi_9Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: sc7180: Add wormdingler dts files
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

On Fri, Jun 17, 2022 at 11:12 AM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
> new file mode 100644
> index 000000000000..1a921a540075
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Wormdingler board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + *
> + * SKU: 0x401 => 1025
> + *  - bits 11..8: Panel ID: 0x4 (BOE)
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180-trogdor-wormdingler.dtsi"
> +
> +/ {
> +       model = "Google Wormdingler rev1+ (BOE, rt5682s)";
> +       compatible = "google,wormdingler-sku1025", "qcom,sc7180";
> +};
> +
> +&panel {
> +       compatible = "boe,tv110c9m-ll3";
> +};
> +
> +&alc5682 {
> +       compatible = "realtek,rt5682s";
> +       realtek,dmic1-clk-pin = <2>;
> +       realtek,dmic-clk-rate-hz = <2048000>;
> +};
> +
> +&dsi_phy {
> +       qcom,phy-rescode-offset-top = /bits/ 8 <31 31 31 31 (-32)>;
> +       qcom,phy-rescode-offset-bot = /bits/ 8 <31 31 31 31 (-32)>;
> +       qcom,phy-drive-ldo-level = <450>;> +};


This seems to have undone the changes I asked for previously. :(
Please go back to what you had in v5 where
`sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts` includes
`sc7180-trogdor-wormdingler-rev1-boe.dts` and just overrides the audio
stuff.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts
> new file mode 100644
> index 000000000000..1129e3fed165
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Wormdingler board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + *
> + * SKU: 0x0001 => 1
> + *  - bits 11..8: Panel ID: 0x0 (INX)
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180-trogdor-wormdingler.dtsi"
> +
> +/ {
> +       model = "Google Wormdingler rev1+ (INX, rt5682s)";
> +       compatible = "google,wormdingler-sku1", "qcom,sc7180";
> +};
> +
> +&panel {
> +       compatible = "innolux,hj110iz-01a";
> +};

This seems to have undone the changes I asked for previously. :(
Please go back to what you had in v5 where
`sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts` includes
`sc7180-trogdor-wormdingler-rev1-inx.dts` and just overrides the audio
stuff.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
> new file mode 100644
> index 000000000000..cced926364e5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Wormdingler board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +
> +ap_ec_spi: &spi6 {};
> +ap_h1_spi: &spi0 {};
> +
> +#include "sc7180-trogdor.dtsi"

Since you sent your v5, Stephen landed his "Simplify!" series. See commits:

19794489fa24 arm64: dts: qcom: Only include sc7180.dtsi in sc7180-trogdor.dtsi
d277cab7afc7 arm64: dts: qcom: sc7180-trogdor: Simplify spi0/spi6 labeling
51d30402be75 arm64: dts: qcom: sc7180-trogdor: Simplify trackpad enabling

Your series needs to take into account what Stephen did and do the
same thing with the new boards you're adding. That means you shouldn't
be doing thue weird spi6 / spi0 definitions here. It also means you
shouldn't be including "sc7180.dtsi" directly in the wormdingler file.
...and, of course, you'll need to see how the different trackpad
enabling applies to your files.

This is what I asked you do in my response to your v5:
https://lore.kernel.org/r/CAD=FV=Vkiqxv5QRiEqCjZVSNUH=K1N+JuYEsXu=XtFNxRtvttw@mail.gmail.com/

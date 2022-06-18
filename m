Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6F5B5505A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 17:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiFRPRR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 11:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbiFRPRQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 11:17:16 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EFD63D5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 08:17:15 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id n20so6883968ejz.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r3bsZ5PtgloBu+ce8z+3L4x+sg128A5Sp6K47kwhsvQ=;
        b=YT25ALkZgQzYOT2SRVos+zCEngrlf1XIizM6ljJnKz8vnC+3/gThfZzLJvjs9adJ5l
         2CpkqnXIzY9KLoYkBjn3Q/wkonDFTEZn2M1E9hOEyPlUkzq5tEYdQ1wETAcq/M0JVq2X
         3lnGAD9LzRNa11xZrYyIOTIrgCKcgLn94KZw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r3bsZ5PtgloBu+ce8z+3L4x+sg128A5Sp6K47kwhsvQ=;
        b=6AVaPjjiNT/L2TDKzS+sEjpNKk773IQZ88qo4KgrOLy9ayh07RJlQ6PIl+Gt/N3/SN
         4r2A+7YyPr3YMumxWV6PpR936UkJMM6NieUTXItQeB2x38QOmboxZ8888HuyNXZFje6v
         hXldfn5e/MncVgWuF4YrLU44eNl3wy1JpGAdKSS5JNX7nXJY9AU1YumTK5uFvI278itf
         MMCggMxGSKWLdEp3rgKt7ljeMZassr08NLQ+wz1rHHOlDNOPNgWVQ35qvogxWQ2KTw7V
         37PGAv56EPTlIrepUaVWhBeLHYUT4qiH2geM2wbL9PFPSbABEuRjMxKGQIgtTU9CQTFd
         /kbg==
X-Gm-Message-State: AJIora/GKW79+PLNg6sQifJU2ieemwSHhkElH6oHSLKQQ8HyaXAB0rus
        eTuDyUiNg0Y6uNT23spn8z0sXea5/Uq47dP6
X-Google-Smtp-Source: AGRyM1tNjCP0G27Id5IjrdcqTt4yuwn2qFXW2XRx8P5Pl1N8GQqlMu3l3jk0EZGit/73i+eRCbidVg==
X-Received: by 2002:a17:907:86ac:b0:708:9c4a:c6e9 with SMTP id qa44-20020a17090786ac00b007089c4ac6e9mr13840794ejc.297.1655565433443;
        Sat, 18 Jun 2022 08:17:13 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id g5-20020a50d5c5000000b004356c0d7436sm1863600edj.42.2022.06.18.08.17.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jun 2022 08:17:12 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id c130-20020a1c3588000000b0039c6fd897b4so5691795wma.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 08:17:12 -0700 (PDT)
X-Received: by 2002:a05:600c:202:b0:39c:40de:ec19 with SMTP id
 2-20020a05600c020200b0039c40deec19mr26024244wmi.29.1655565431641; Sat, 18 Jun
 2022 08:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220617164000.v8.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
 <a664b2a9-3cfa-9e8d-039a-bdd3b7448170@linaro.org>
In-Reply-To: <a664b2a9-3cfa-9e8d-039a-bdd3b7448170@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 18 Jun 2022 08:16:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXEuOycHibuYgKhFoqUf6cH7-zHBDuSssEtScq1502nA@mail.gmail.com>
Message-ID: <CAD=FV=VXEuOycHibuYgKhFoqUf6cH7-zHBDuSssEtScq1502nA@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: sc7180: Add wormdingler dts files
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "Joseph S. Barrera III" <joebar@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 17, 2022 at 5:32 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/06/2022 16:40, Joseph S. Barrera III wrote:
> > Wormdingler is a trogdor-based board, shipping to customers as the
> > Lenovo IdeaPad Chromebook Duet 3. These dts files are copies from
> > the downstream Chrome OS 5.4 kernel, but with the camera
> > (sc7180-trogdor-mipi-camera.dtsi) #include removed.
> >
> > Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> >
> > ---
> >
> > (no changes since v7)
> >
> > Changes in v7:
> > - Incorporated changes from Stephen's "Simplify!" series.
> >
> > Changes in v5:
> > - Replaced _ in node name with -
> > - Ordered nodes by name
> >
> > Changes in v4:
> > - Cleaned up rt5682s files
> > - Restored camcc definition
> > - Added missing version history
> >
> > Changes in v3:
> > - Removed camcc definition
> >
> > Changes in v2:
> > - Word wrapped patch description.
> > - Removed "Author" from patch description.
> > - Fixed whitespace around "en_pp3300_dx_edp"
> >
> >  arch/arm64/boot/dts/qcom/Makefile             |   6 +
> >  .../sc7180-trogdor-wormdingler-rev0-boe.dts   |  22 +
> >  .../sc7180-trogdor-wormdingler-rev0-inx.dts   |  22 +
> >  .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  53 +++
> >  ...0-trogdor-wormdingler-rev1-boe-rt5682s.dts |  29 ++
> >  .../sc7180-trogdor-wormdingler-rev1-boe.dts   |  28 ++
> >  ...0-trogdor-wormdingler-rev1-inx-rt5682s.dts |  29 ++
> >  .../sc7180-trogdor-wormdingler-rev1-inx.dts   |  22 +
> >  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 408 ++++++++++++++++++
> >  9 files changed, 619 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 2f8aec2cc6db..e4114e22548a 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -81,6 +81,12 @@ dtb-$(CONFIG_ARCH_QCOM)    += sc7180-trogdor-pompom-r2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-pompom-r2-lte.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-pompom-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-pompom-r3-lte.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-wormdingler-rev0-boe.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-wormdingler-rev0-inx.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-wormdingler-rev1-boe.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-wormdingler-rev1-inx.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-r1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-r1-lte.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7280-herobrine-crd.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
> > new file mode 100644
> > index 000000000000..d6ed7d0afe4a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
> > @@ -0,0 +1,22 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Wormdingler board device tree source
> > + *
> > + * Copyright 2021 Google LLC.
> > + *
> > + * SKU: 0x10 => 16
> > + *  - bits 7..4: Panel ID: 0x1 (BOE)
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7180-trogdor-wormdingler-rev0.dtsi"
> > +
> > +/ {
> > +     model = "Google Wormdingler rev0 BOE panel board";
> > +     compatible = "google,wormdingler-rev0-sku16", "qcom,sc7180";
>
> There was a v6 a second ago, now it is v8... It's confusing. Don't send
> too often, especially without incorporating actual review.

I think the problem was that the v6 sent a second ago was supposed to
be v7 but Joe forgot to increment the version number so there are two
v6 sets. I guess he decided to just send a v8 out to fix things...


> You need to document the compatibles. Please base on Doug's patches
> adding the compatibles for existing boards.

I think all of the compatibles here are documented by my series, but
that could be mentioned in the cover letter that I've asked Joe to
write for v9. Basically point to:

https://lore.kernel.org/r/20220520143502.v4.5.Ie8713bc0377672ed8dd71189e66fc0b77226fb85@changeid

-Doug

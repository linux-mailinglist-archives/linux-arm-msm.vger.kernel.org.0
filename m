Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5CD50015F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 23:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbiDMVvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 17:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234010AbiDMVvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 17:51:35 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938F94665C
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 14:49:13 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bv19so6589204ejb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gMs2rmBWWmIoOW18P1m2w3YjRnMa95bN+gWj8N2yU/k=;
        b=lR2kiAbTOIdBj36E6Dy3mUbmR3oIHehaxz1cxShoZAzI4SPRU42Lbk1A2VS8PzepLj
         rHTlIFE9fqY5EXevEnSfLxM9WrqG6wbvR/j6kKHiQ8Nl2zxWPc+w1cTDj+eSK3O+9TbO
         Qo8+zpSh7Zt9GI07IFP4eK7xk+76Xmxnto0b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gMs2rmBWWmIoOW18P1m2w3YjRnMa95bN+gWj8N2yU/k=;
        b=EKE+6O0+5zxQKSYMc5HL/qO0zSUDb8EOqBa7xEtuYrOm4OFtOfS5YMg3zlLWSbjOvY
         xmiIzLg6U9y/TNznZ+qkvB3t1vvr0l4tGgQD399xXrnz/lfucarhkc5n8nEEzjClxDm0
         t5Be0LNsWpDtxeHS7lebSVV1gmmnff4tDlczj+eo/E+de42ZWJlKkyAQwYbJCrWnl43J
         7rUXg3Xq1W5fXMF1ty2tYFrzFNLZygULA3S4DKJOTQLmRvDDzioGn6BW1ZVZ+csHDru6
         xwhAHnLA7TraU33qOv9gCvaAdZ4angwieLRngooVJIBnTM8woCdFJ6Paf7yASGi6iesL
         fhyA==
X-Gm-Message-State: AOAM533iz6BiCcBTsMM9jkEJ/7keIXSoDMWnNsqym6UrKqYgl5JS0UvW
        U3qkdbn9OjkAStRCsaPiUaTBq04kNJS68ngK
X-Google-Smtp-Source: ABdhPJzdq56OhtuF/ijlBGuJPIbQayQsvMbodGCwPM1h+/W/9sP5J1BIpYHJGd9m7mL1e1YF7LBJ1g==
X-Received: by 2002:a17:906:a2c5:b0:6e7:f44d:ed7d with SMTP id by5-20020a170906a2c500b006e7f44ded7dmr40560041ejb.329.1649886551838;
        Wed, 13 Apr 2022 14:49:11 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id eq7-20020a056402298700b00419d8d46a8asm61535edb.39.2022.04.13.14.49.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 14:49:11 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id l9-20020a05600c4f0900b0038ccd1b8642so3609078wmq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 14:49:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr119391wmb.199.1649886550796; Wed, 13
 Apr 2022 14:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220330090947.9100-1-chenxiangrui@huaqin.corp-partner.google.com>
 <a0eb6bf9-256a-29b1-2211-496df710f531@linaro.org>
In-Reply-To: <a0eb6bf9-256a-29b1-2211-496df710f531@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 13 Apr 2022 14:48:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjyLofXZqnj=bL89fza5JS6O5Np9W-A4V4WK+na0hdrw@mail.gmail.com>
Message-ID: <CAD=FV=UjyLofXZqnj=bL89fza5JS6O5Np9W-A4V4WK+na0hdrw@mail.gmail.com>
Subject: Re: [PATCH] CHROMIUM: arm64: dts: qcom: Add sc7180-gelarshie
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 30, 2022 at 10:25 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/03/2022 11:09, Mars Chen wrote:
> > Initial attempt at Gelarshie device tree.
> >
> > BUG=b:225756600
> > TEST=emerge-strongbad chromeos-kernel-5_4
> >
> > Signed-off-by: Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../dts/qcom/sc7180-trogdor-gelarshie-r0.dts  |  15 +
> >  .../dts/qcom/sc7180-trogdor-gelarshie.dtsi    | 304 ++++++++++++++++++
> >  3 files changed, 320 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie-r0.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index f9e6343acd03..cf8f88b065c3 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -57,6 +57,7 @@ dtb-$(CONFIG_ARCH_QCOM)     += sc7180-trogdor-coachz-r1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-coachz-r1-lte.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-coachz-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-coachz-r3-lte.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-gelarshie-r0.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-homestar-r2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-homestar-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)      += sc7180-trogdor-homestar-r4.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie-r0.dts
> > new file mode 100644
> > index 000000000000..027d6d563a5f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-gelarshie-r0.dts
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Google Gelarshie board device tree source
> > + *
> > + * Copyright 2022 Google LLC.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sc7180-trogdor-gelarshie.dtsi"
> > +
> > +/ {
> > +     model = "Google Gelarshie (rev0+)";
> > +     compatible = "google,gelarshie", "qcom,sc7180";
>
> Missing bindings. Please document the compatible.

I'm actually kinda curious: is there really a good reason for this? I
know I haven't been adding things to
`Documentation/devicetree/bindings/arm/qcom.yaml` for Qualcomm
Chromebooks.  Ironically, it turns out that the script I typically use
to invoke checkpatch happens to have "--no-tree" as an argument and
that seems to disable this check. Doh!

That being said, though, I do wonder a little bit about the value of
enumerating the top-level compatible like this in a yaml file.
Certainly the yaml schema validation in general can be quite useful,
but this top-level listing seems pure overhead. I guess it makes some
tools happy, but other than that it seems to provide very little
value...

-Doug

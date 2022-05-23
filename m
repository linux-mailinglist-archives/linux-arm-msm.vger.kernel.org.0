Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080A753137C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 18:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238631AbiEWQRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 12:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238664AbiEWQQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 12:16:58 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB41F66204
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 09:16:51 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id j4so15360351edq.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G7LMHKesunD0Xjsfifj+i4ChGcHMQrcfYbEuTuPQdfY=;
        b=aj6E5qsVJYrGiJvSGurWbMCeqmRehL8+I2dJOljymHvfaN/8tZM1uY41O6LWstvuGE
         K6tFibZ5ifzLAcNKtIapH6gQEeMhnymx1+Bivy/FeBsTD1qK9lJ2MM9O8SPZY+xLNPnZ
         r2S2qwTO37YLvZamYaYQC5uMgCV+R9PuoP834=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G7LMHKesunD0Xjsfifj+i4ChGcHMQrcfYbEuTuPQdfY=;
        b=nCIbKGRofwv4Yyt1lc13FhlRWAUIIPnbOM5+xuiEAhA1e9AiY3R6luC9UWO3JUP4XZ
         RjDXI8slZQBWRB37eu4+g4AdmbdhXsyu8ORpQWbzRZbeZA+V2iPPT/fecjk+U4A6dyYK
         g52d98gh/nLYlc746DYwZDVltY7BeBWh+Dyhr8jrb00VxD50+c7I6JlIXzDSnm+ir6Oz
         VHEZOuo/W+HUhsB5JC3ffd2aPErl6N+BDhDUMKbQJae8pFu82HDlhe3fFS4n0C6NkGPu
         4lgFL3GIHbCwXjSRM1AblU6xRNCVD36wyxJkMacoYgvFqPVdKQ/UTiG7/Y59olqm7ef+
         Y1gQ==
X-Gm-Message-State: AOAM533BgD4wDZDC2OuIG+PoENgZPDfXTUYWXypIa2te+yeVA95R2X7p
        O6nxtSfrMOhGymMAPnSac4pvJ01GnmloZrip
X-Google-Smtp-Source: ABdhPJwfu1Fvtshv3EuK2m8WJgZH1CZ5fTSvT5lJBEl65bYVmOIr3O292uyxlNhc8SCZMoYgbizF+g==
X-Received: by 2002:a05:6402:2993:b0:42a:b25c:c9ce with SMTP id eq19-20020a056402299300b0042ab25cc9cemr24310304edb.0.1653322609884;
        Mon, 23 May 2022 09:16:49 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id c6-20020a056402120600b0042aa6a43ccdsm8451992edw.28.2022.05.23.09.16.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 09:16:48 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id n124-20020a1c2782000000b003972dfca96cso7076054wmn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 09:16:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr20836726wmb.29.1653322607614; Mon, 23
 May 2022 09:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220520143502.v4.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
 <20220520143502.v4.3.I9804fcd5d6c8552ab25f598dd7a3ea71b15b55f0@changeid> <7c1598a9-476d-0115-ab13-11dfa0d89436@linaro.org>
In-Reply-To: <7c1598a9-476d-0115-ab13-11dfa0d89436@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 23 May 2022 09:16:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UC+eFZaUiPQNKBMmLmjx21YpH4Yeg3Yz9NiDLXnh+nDg@mail.gmail.com>
Message-ID: <CAD=FV=UC+eFZaUiPQNKBMmLmjx21YpH4Yeg3Yz9NiDLXnh+nDg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: arm: qcom: Add sc7180 Chromebook
 board bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        patches@lists.linux.dev,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, May 22, 2022 at 12:57 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/05/2022 23:38, Douglas Anderson wrote:
> > This copy-pastes compatibles from sc7180-based boards from the device
> > trees to the yaml file so that `make dtbs_check` will be happy.
> >
> > NOTES:
> > - I make no attempt to try to share an "item" for all sc7180 based
> >   Chromebooks. Because of the revision matching scheme used by the
> >   Chromebook bootloader, at times we need a different number of
> >   revisions listed.
> > - Some of the odd entries in here (like google,homestar-rev23 or the
> >   fact that "Google Lazor Limozeen without Touchscreen" changed from
> >   sku5 to sku6) are not typos but simply reflect reality.
> > - Many revisions of boards here never actually went to consumers, but
> >   they are still in use within various companies that were involved in
> >   Chromebook development. Since Chromebooks are developed with an
> >   "upstream first" methodology, having these revisions supported with
> >   upstream Linux is important. Making it easy for Chromebooks to be
> >   developed with an "upstream first" methodology is valuable to the
> >   upstream community because it improves the quality of upstream and
> >   gets Chromebooks supported with vanilla upstream faster.
> >
> > One other note here is that, though the bootloader effectively treats
> > the list of compatibles in a given device tree as unordered, some
> > people would prefer future boards to list higher-numbered revisions
> > first in the list. Chromebooks here are not changing and typically
> > list lower revisions first just to avoid churn.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> > (no changes since v3)
> >
> > Changes in v3:
> > - Split link to Chromebook boot doc into a separate patch.
> > - Added a note to desc about revision ordering within a device tree.
> >
> > Changes in v2:
> > - Add link to doc about how Chromebook devicetrees work.
> > - Use a "description" instead of a comment for each item.
> > - Use the marketing name instead of the code name where possible.
> >
> >  .../devicetree/bindings/arm/qcom.yaml         | 182 +++++++++++++++++-
> >  1 file changed, 181 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 5ac28e11ea7b..01e40ea40724 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -219,11 +219,191 @@ properties:
> >                - qcom,ipq8074-hk10-c2
> >            - const: qcom,ipq8074
> >
> > -      - items:
> > +      - description: Qualcomm Technologies, Inc. SC7180 IDP
> > +        items:
> >            - enum:
> >                - qcom,sc7180-idp
> >            - const: qcom,sc7180
> >
> > +      - description: HP Chromebook x2 11c (rev1 - 2)
> > +        items:
> > +          - const: google,coachz-rev1
> > +          - const: google,coachz-rev2
> > +          - const: qcom,sc7180
> > +
> > +      - description: HP Chromebook x2 11c (newest rev)
> > +        items:
> > +          - const: google,coachz
> > +          - const: qcom,sc7180
> > +
> > +      - description: HP Chromebook x2 11c with LTE (rev1 - 2)
> > +        items:
> > +          - const: google,coachz-rev1-sku0
> > +          - const: google,coachz-rev2-sku0
> > +          - const: qcom,sc7180
> > +
> > +      - description: HP Chromebook x2 11c with LTE (newest rev)
> > +        items:
> > +          - const: google,coachz-sku0
> > +          - const: qcom,sc7180
> > +
> > +      - description: Lenovo Chromebook Duet 5 13 (rev2)
> > +        items:
> > +          - const: google,homestar-rev2
> > +          - const: google,homestar-rev23
> > +          - const: qcom,sc7180
> > +
> > +      - description: Lenovo Chromebook Duet 5 13 (rev3)
> > +        items:
> > +          - const: google,homestar-rev3
> > +          - const: qcom,sc7180
> > +
> > +      - description: Lenovo Chromebook Duet 5 13 (newest rev)
> > +        items:
> > +          - const: google,homestar
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 (rev0)
> > +        items:
> > +          - const: google,lazor-rev0
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 (rev1 - 2)
> > +        items:
> > +          - const: google,lazor-rev1
> > +          - const: google,lazor-rev2
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 (rev3 - 8)
> > +        items:
> > +          - const: google,lazor-rev3
> > +          - const: google,lazor-rev4
> > +          - const: google,lazor-rev5
> > +          - const: google,lazor-rev6
> > +          - const: google,lazor-rev7
> > +          - const: google,lazor-rev8
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 (newest rev)
> > +        items:
> > +          - const: google,lazor
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 with KB Backlight (rev1 - 2)
> > +        items:
> > +          - const: google,lazor-rev1-sku2
> > +          - const: google,lazor-rev2-sku2
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 with KB Backlight (rev3 - 8)
> > +        items:
> > +          - const: google,lazor-rev3-sku2
> > +          - const: google,lazor-rev4-sku2
> > +          - const: google,lazor-rev5-sku2
> > +          - const: google,lazor-rev6-sku2
> > +          - const: google,lazor-rev7-sku2
> > +          - const: google,lazor-rev8-sku2
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 with KB Backlight (newest rev)
> > +        items:
> > +          - const: google,lazor-sku2
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 with LTE (rev1 - 2)
> > +        items:
> > +          - const: google,lazor-rev1-sku0
> > +          - const: google,lazor-rev2-sku0
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 with LTE (rev3 - 8)
> > +        items:
> > +          - const: google,lazor-rev3-sku0
> > +          - const: google,lazor-rev4-sku0
> > +          - const: google,lazor-rev5-sku0
> > +          - const: google,lazor-rev6-sku0
> > +          - const: google,lazor-rev7-sku0
> > +          - const: google,lazor-rev8-sku0
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook Spin 513 with LTE (newest rev)
> > +        items:
> > +          - const: google,lazor-sku0
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook 511 (rev4 - rev8)
> > +        items:
> > +          - const: google,lazor-rev4-sku4
> > +          - const: google,lazor-rev5-sku4
> > +          - const: google,lazor-rev6-sku4
> > +          - const: google,lazor-rev7-sku4
> > +          - const: google,lazor-rev8-sku4
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook 511 (newest rev)
> > +        items:
> > +          - const: google,lazor-sku4
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook 511 without Touchscreen (rev4)
> > +        items:
> > +          - const: google,lazor-rev4-sku5
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook 511 without Touchscreen (rev5 - rev8)
> > +        items:
> > +          - const: google,lazor-rev5-sku5
> > +          - const: google,lazor-rev5-sku6
> > +          - const: google,lazor-rev6-sku6
> > +          - const: google,lazor-rev7-sku6
> > +          - const: google,lazor-rev8-sku6
> > +          - const: qcom,sc7180
> > +
> > +      - description: Acer Chromebook 511 without Touchscreen (newest rev)
> > +        items:
> > +          - const: google,lazor-sku6
> > +          - const: qcom,sc7180
> > +
> > +      - description: Sharp Dynabook Chromebook C1 (rev1)
> > +        items:
> > +          - const: google,pompom-rev1
> > +          - const: qcom,sc7180
> > +
> > +      - description: Sharp Dynabook Chromebook C1 (rev2)
> > +        items:
> > +          - const: google,pompom-rev2
>
> I understand why you do not share "item" (your first notes) for some of
> boards, but I don't get why "google,pompom-rev1" cannot be combined with
> "google,pompom-rev2". Do you see any chances to alter the bindings for
> these two boards?
>
> The same for other such cases (not newest revision).

Yeah, I thought about it when I was writing the file and decided
against it. I guess it's just a style decision. If we combine these
two then I guess it raises the question: do we only combine entries
that list a single revision if they're the same board, or do we have
one uber entry at the end of the list that combines all
single-revision sc7180 Chromebooks? ...and in either case, what should
the description be?

Personally, though it takes up more lines of code, I prefer the
simplicity of having each entry here correspond to a single dts file.

Unless you feel really strongly about it, I'd tend to leave the
decision here to Bjorn.

-Doug

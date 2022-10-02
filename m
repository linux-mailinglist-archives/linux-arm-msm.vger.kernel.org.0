Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D5C5F230D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Oct 2022 14:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiJBMVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Oct 2022 08:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiJBMVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Oct 2022 08:21:10 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205DA222AF
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 05:21:09 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 65so10248224ybp.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 05:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yyoj7KPOm1UcXOaFIK6PvbZotY/Ro2VUw6Ks/T2G+8M=;
        b=b6j9q56JDQHAkXKJGDvlABjIML1dEzDgxP05njvj6mWdozZZiBVsfnSEHWk+SxPGcL
         OsH8p6ZP5THnjq9Ki3xzabSC/z6rRHDqnEHWCtM/3jo/dGQ2P3umMH3pjwrW2xmWy6b9
         UPPXCXlXTngZSUB8dnBjqIruNCadb28ptGn+Otj4DsNpGIqMbA6YX0q0hZ87aW34yuWq
         4NRJa+3e+nFHwKle7P6t9gEY99np3rwpx5ny8bKw2sqUR5//0am4yqQPndAC6ca+xlMe
         N+QhB50a6YZ0f6Ve/bw/Npc6GSKtAhCwQoV3hvEOWDZnm2mItA0m1t+n3vRhwkJd9DYX
         zNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yyoj7KPOm1UcXOaFIK6PvbZotY/Ro2VUw6Ks/T2G+8M=;
        b=76Z2ByWGR4WUVi0NaOr1dhy7GwCxteoX0Nacwkr4uiTdPfNvAO2QXiqfkxqvqA6/9u
         mI1+oJzezPcuAzXY7QLG3BWjv4VObEiAWvdDppDvFCA8lyessR6oGeJdlcWH1Ftj3VCr
         NOMkLsiEAAtbmZ7yOYZHgAX+G6pjHNy/Zy0lUX2w0Mr3sfHYwttJZqKBbJzjV+QRnEjf
         4IgArLhBBKtaq5UQpAK5rqXGZcGXJcwDhXmVqcWoYtb6dHSXofs448ZugFZ3GOtKJ1pK
         VI8Pn1PuZxJip6qCfPZ2LQ6/EGmrd7ki7s8qWJmg2of7ye/UikucYg3Qu4MLhW6+yIEX
         6Rfg==
X-Gm-Message-State: ACrzQf3Fv/UjchynVrfHmAfKimB2sPD2j7yGjPJy9ZZ5tl/nW76DRQ7X
        rrVj31B/yPKnMuaTdHb80ZwlIiHtDRggMPQ6g6M/Cw==
X-Google-Smtp-Source: AMsMyM6PkPHmvRM6bb4VGI9/Pk0Sbm3jOz64JhNW0ovVDiQbMLkD1ItITQc9aeJDpNOzsRTdPZvY/MfC5nnzCjdKyZA=
X-Received: by 2002:a05:6902:102e:b0:6bd:bdd2:ac32 with SMTP id
 x14-20020a056902102e00b006bdbdd2ac32mr154873ybt.516.1664713268310; Sun, 02
 Oct 2022 05:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220930231416.925132-1-dmitry.baryshkov@linaro.org> <a743d50f-fc59-161e-c98f-f10b26e2afe5@linaro.org>
In-Reply-To: <a743d50f-fc59-161e-c98f-f10b26e2afe5@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 2 Oct 2022 15:20:57 +0300
Message-ID: <CAA8EJpo9kSs_h28SneAwQ0FLHJ0PipmbQRm791hb-vHtGwXwDQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,spm: support regulator SAW2 devics
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 2 Oct 2022 at 11:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/10/2022 01:14, Dmitry Baryshkov wrote:
> > Merge qcom,saw2.txt bindings to existing qcom,spm.yaml. This fixes
> > compatibility of qcom,spm schema with regulator SAW2 devices.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/arm/msm/qcom,saw2.txt | 58 -------------------
> >  .../bindings/soc/qcom/qcom,spm.yaml           | 44 +++++++++-----
>
> You need to update reference in
> Documentation/devicetree/bindings/arm/cpus.yaml

ack

>
> >  2 files changed, 30 insertions(+), 72 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> >
> > diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> > deleted file mode 100644
> > index c0e3c3a42bea..000000000000
> > --- a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt

[skipped]

> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> > index f433e6e0a19f..8fe35fde70b8 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> > @@ -16,23 +16,33 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - qcom,sdm660-gold-saw2-v4.1-l2
> > -          - qcom,sdm660-silver-saw2-v4.1-l2
> > -          - qcom,msm8998-gold-saw2-v4.1-l2
> > -          - qcom,msm8998-silver-saw2-v4.1-l2
> > -          - qcom,msm8909-saw2-v3.0-cpu
> > -          - qcom,msm8916-saw2-v3.0-cpu
> > -          - qcom,msm8226-saw2-v2.1-cpu
> > -          - qcom,msm8974-saw2-v2.1-cpu
> > -          - qcom,apq8084-saw2-v2.1-cpu
> > -          - qcom,apq8064-saw2-v1.1-cpu
> > +    oneOf:
> >        - const: qcom,saw2
>
> I understand old bindings had it, but I don't think we really want to
> support the generic compatible on its own. Even old bindings indicated
> that there are several differences between SAWs.
>
> Especially confusing is that once qcom,saw2 can be alone and in other
> cases must be preceded by specific compatible. IOW, you allow for
> apq8064 two cases:
>
> 1. qcom,apq8064-saw2-v1.1-cpu, qcom,saw2
> 2. qcom,saw2
>
> I think we should instead add everywhere specific compatibles.

I see your point. Yes, it's probably worth doing that.

Robert, Christian, can you possibly check the version of the SAW2 used
on ipq4019 and ipq8064? It can be read from the SPM block at the
register offset 0xfd0.

> > +      - items:
> > +          - enum:
> > +              - qcom,sdm660-gold-saw2-v4.1-l2
> > +              - qcom,sdm660-silver-saw2-v4.1-l2
> > +              - qcom,msm8998-gold-saw2-v4.1-l2
> > +              - qcom,msm8998-silver-saw2-v4.1-l2
> > +              - qcom,msm8909-saw2-v3.0-cpu
> > +              - qcom,msm8916-saw2-v3.0-cpu
> > +              - qcom,msm8226-saw2-v2.1-cpu
> > +              - qcom,msm8974-saw2-v2.1-cpu
> > +              - qcom,apq8084-saw2-v2.1-cpu
> > +              - qcom,apq8064-saw2-v1.1-cpu
> > +          - const: qcom,saw2
> >
> >    reg:
> > -    description: Base address and size of the SPM register region
> > -    maxItems: 1
> > +    description: Base address and size of the SPM register region. An optional
> > +      second element specifies the base address and size of the alias register
> > +      region.
> > +    minItems: 1
> > +    maxItems: 2
>
> And it seems second region is not present on some variants?

The second region is a bit of a puzzle for me as it doesn't seem to be
used at all.

-- 
With best wishes
Dmitry

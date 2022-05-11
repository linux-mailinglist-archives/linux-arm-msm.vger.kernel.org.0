Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA66D523834
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 18:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344371AbiEKQKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 12:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344372AbiEKQKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 12:10:17 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA6E2375DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:10:09 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id j6so4991789ejc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtUTymC8Y9rwA+nR5RnPnabs1W1L3QArgmlQfxUtvi0=;
        b=KejbTgIcaTbt/QNzcRpsI//433QGnVimyV9DcWdNpVyg/b3Kgu3p8PCPgMJjwVjHja
         fmVl95gma0wX465mkoUCKlfmdRJ1uKxPyyvDWJ24BWigQSe90s3rHSWWhAg9y0arb5Yk
         sVhhxBQYSc+q6vFjLDE4wZZ6IJrYYIhtcbwPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtUTymC8Y9rwA+nR5RnPnabs1W1L3QArgmlQfxUtvi0=;
        b=MogYocXQLDpMfArb9l5uzsyGZD+28heOcCQzA1Dv9FL5gyzGGpK2aLn/k2DzladRYv
         Pf6efhkpe0mFVX86E1deI0q4vsfKxTuz2Z/oOKLJCjLPSKewSQIR3NHzmtI33kQcu3dJ
         qwphml+uuAvAuOPdi03jK86TIEQ6kSSEDsa3xR8F1t4tkx0rNnaKg+XzyazmCXEdQgdf
         fWfawwy/WH34GeBph4fqQYqX7MtviXBdCMJTcCSEKzTLXTLhxiV3zX2NCpDAMPlgSUEs
         W0xsM7AQr0YZLluMWXwzrDMq4VXMMB8X+hztI+4p9L73TE4Afi4TbFJwpTDKuNFdXLco
         yMNA==
X-Gm-Message-State: AOAM53012ZTxPSfwDZ441DRHoJHDJC2QqeoLmKYVCrxQllVDPOj8nrLq
        SMqiBPguHWIwqHRRJk/F7nFRgDhIaX1Jrm3OOkY=
X-Google-Smtp-Source: ABdhPJzaa/mcEArPUtrhI7niZLixExNHjlJgcZkPwCpTb1VkI/COADy8jvQaAGnaPUaO42dtk6N4Gg==
X-Received: by 2002:a17:907:608f:b0:6f6:1155:99ab with SMTP id ht15-20020a170907608f00b006f6115599abmr22254001ejc.306.1652285407950;
        Wed, 11 May 2022 09:10:07 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906430600b006f3ef214e57sm1118245ejm.189.2022.05.11.09.10.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:10:07 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id u3so3695497wrg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:10:06 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id q13-20020adff50d000000b0020ae09600efmr23211050wro.679.1652285406324;
 Wed, 11 May 2022 09:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220330090947.9100-1-chenxiangrui@huaqin.corp-partner.google.com>
 <a0eb6bf9-256a-29b1-2211-496df710f531@linaro.org> <CAD=FV=UjyLofXZqnj=bL89fza5JS6O5Np9W-A4V4WK+na0hdrw@mail.gmail.com>
 <b7ff08b8-60fb-7629-9399-3d5cca46ab9e@linaro.org> <CAD=FV=Vx5g_xTRZGc9wW=ZLnfsOcubTYFcnYQRC5jLm+n3en0w@mail.gmail.com>
 <606cc762-a0c2-49a4-3e5d-d2dbd4595bc7@linaro.org> <CAD=FV=W_SA-3PfDFi-Gkjk9pew5bchFNjQhXX8MkZyuy5UohEQ@mail.gmail.com>
 <CAJKOXPdt5WTg4VU-TEW3dmPHR76dKg63XVxRQfa7ZSKc_jz6Ag@mail.gmail.com>
 <CAD=FV=XQqQSQDNh-zXqEQkwsrax5Qb3OtfKZoQLkncJj_4mcQw@mail.gmail.com>
 <daf66d41-42ac-50dc-3f8d-c261da8e452d@linaro.org> <CAD=FV=WhA=n_=Ys6NfedPtNPddL81HnG6Qws_R+vq9w8Nrsn5A@mail.gmail.com>
 <ce2ea308-b63d-ad27-4cea-7353268f8ebb@linaro.org> <CAODwPW857CkH0+ZnBaUeowW4te-hSy6nrdeeX6-OLPOs5TptsQ@mail.gmail.com>
 <55dcf917-7ac0-efe9-8531-b77be682125a@linaro.org>
In-Reply-To: <55dcf917-7ac0-efe9-8531-b77be682125a@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 May 2022 09:09:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UPKo4CxRVmdHr05rRPaNHFYfaQTqmBJAU5ZF61ccKgEA@mail.gmail.com>
Message-ID: <CAD=FV=UPKo4CxRVmdHr05rRPaNHFYfaQTqmBJAU5ZF61ccKgEA@mail.gmail.com>
Subject: Re: [PATCH] CHROMIUM: arm64: dts: qcom: Add sc7180-gelarshie
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Julius Werner <jwerner@chromium.org>,
        =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 11, 2022 at 12:20 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/05/2022 04:39, Julius Werner wrote:
> >> Wait, we agreed that you don't consider them identical, didn't we? If
> >> they are identical, you do not need rev4 at all. So they are not
> >> identical...
> >
> > Well, they are identical until they're not. We intend them to be
> > identical. But for practical purposes it does sometimes happen that
> > two board revisions which were meant to be indistinguishable by
> > software end up needing to be distinguished at a later point, when
> > both the hardware and firmware can no longer be changed. We need to
> > allow an escape hatch for that case. It does not happen often, so just
> > treating them all as separate boards from the start is not a scalable
> > solution. DTBs are not free when they all need to be packaged in the
> > same kernel image.
>
> You split more important part of my message, ignoring the point.
>
> So you choose they are not identical, fine. Why insisting on adding
> fallback compatible while not keeping bindings updated? Just don't add
> the compatible and work on rev3 or rev4. Doug even once wrote "_we don't
> know_ if -rev7 and -rev8 are compatible", so don't make them compatible.
> Don't add fallbacks or some generic unspecified front-compatibles and
> just work on revision.

Somehow, it seems like we keep talking past each other here and it
feels like folks are getting upset and we're not moving forward. Maybe
the right way to make progress is to find some face-to-face time at a
future conference and sit in front of a white board and hash it out.
That being said:

* Without changing our bootloader or having a big explosion in the
number of dts files, we really can't change our scheme. The best we
can do is document it.

* If we want to change our scheme, we'd need to sit down and come to
an agreement that satisfies everyone, if such a thing is possible.
That would only be able to affect future boards. We don't want to
change the bootloader dts loading scheme on old boards.


> >> Right now it's not possible to validate QCOM DTSes against DT bindings
> >> because they throw big fat warnings about undocumented top compatibles.
> >> This is a downside for us.
> >
> > But that's a solvable problem, right? As I understand, what Doug was
> > initially just asking was whether it made _sense_ to document all of
> > these... not that we couldn't do it. Then this whole thread went down
> > a rabbit hole of whether our compatible assignments are allowed in the
> > first place. If we can compromise on this discussion by just doing
> > whatever needs to be done to make the tool happy, I think(?) we can
> > provide that.
>
> None of recent patches from Chromium were doing it, even after
> complaining from my side, so why do you suddenly believe that it is
> "doable"? If yes, please start doing it and fix the DTSes which you
> already submitted without bindings.
>
> To remind - entire discussion started with Doug saying it is pure
> overhead for him.

I mean, to be fair I said it _seems_ pure overhead and then said that
we could do it if it makes some tools happy. ...but before doing that,
I wanted to make sure it was actually valuable. I still have doubts
about the assertion that the most specific compatible is guaranteed to
uniquely identify hardware. So if the whole reason for doing this is
to make the validation tools happy and there's no other value, then at
least it's plausible to argue that the tools could simply be fixed to
allow this and not shout about it. Now, certainly I'm not arguing that
yaml validation in general is useless. I'm in agreement that we want
dts files to be able to be formally validated because it catches
typos, missing properties, and bugs. I am _only_ saying that I still
haven't seen a good argument for why we need to validate the top-level
compatible string. Since there no properties associated with the
top-level compatible string, it's mostly just checking did some one
copy-paste the compatible string from one file (the dts file) to the
other file (the yaml file) correctly. To me, that does not feel like a
useful check.

The other thing I wanted to make sure was that we weren't just going
to get NAKed later if/when we had to adjust compatible strings on
existing dts files.

In any case, I guess I'll make an attempt to document the compatibles
for existing Chromebooks and we'll see what happens. I'm still not
convinced of the value, but as long as we're not going to get NAKed
for documenting reality it's fine.

-Doug

-Doug

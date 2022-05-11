Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6AA523BDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 19:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345806AbiEKRtj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 13:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345801AbiEKRti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 13:49:38 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148E8BA98F
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 10:49:37 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id g6so5607703ejw.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQuubGtd0mpwX+LKmxSAA3U7GpvwZ1mzYyhs1YQaY+k=;
        b=OJiCbw7IG/ulyvP3DKIxIckp8YkedTNelTyv73ImcVlXH3o1WDCtU6WUPBfUnB04oc
         o6Rh5fEGdkI0pj1ypnFHm7dDZaVYR5GrS11x0bZ08EMb6TE5lzGBQ1+zTcLDG8jbLnOF
         j0FlqePjxKypeItKizgIs/aZ1MADcYSNuSzsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQuubGtd0mpwX+LKmxSAA3U7GpvwZ1mzYyhs1YQaY+k=;
        b=S5mUtHG6Lyv8GXpyyVn1xvemAJBDL04rt8n/9CIXybc86uV+CrVYB9MY6jX96ihVGV
         xZ59wKN27RXFxePW+LBq3zcXRtA6rvn9pSDkUlNBd/JD1xrKzsXRvOf93xJiMmGU/7El
         NzYHajnjKsxGYT+gorokRzCmB7USyWM+HBF1f7yKtmu63UVlNeynxfTwQgt69zP1a37r
         5a7R35W5/3BPIIlrkPFqXaf0hj4WhJ4s3hRm3+vFdgB7BIo0pgUQ5BzXtd/43PoqEVQE
         /RoekLKTQDiKHHjBxZOWaXHgsIwpGaO+X96G/zg9D5dLTJ75wfSY0JGRccF/zltoouMY
         qYEQ==
X-Gm-Message-State: AOAM533LO/amhgG/yzk/s2ZxRFCfeFzku2jOJly4iPGobw2uoW8rdmN0
        jZl1e+r1t/qV7pjPARZDFg6OTvUzn1tdmdPvlzU=
X-Google-Smtp-Source: ABdhPJyFEofe9ebaS48mESsxlO8lETwfWAEo3YMZCOjKcDUULZHG8NBQSq9I4sO66AOwx9Y4xPEycA==
X-Received: by 2002:a17:907:6d17:b0:6f4:6b6e:32da with SMTP id sa23-20020a1709076d1700b006f46b6e32damr27482386ejc.301.1652291375205;
        Wed, 11 May 2022 10:49:35 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id h18-20020a1709067cd200b006f3ef214df5sm1259769ejp.91.2022.05.11.10.49.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:49:34 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id m2-20020a1ca302000000b003943bc63f98so1653292wme.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 10:49:33 -0700 (PDT)
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr6094352wmk.15.1652291373235; Wed, 11 May
 2022 10:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220330090947.9100-1-chenxiangrui@huaqin.corp-partner.google.com>
 <a0eb6bf9-256a-29b1-2211-496df710f531@linaro.org> <CAD=FV=UjyLofXZqnj=bL89fza5JS6O5Np9W-A4V4WK+na0hdrw@mail.gmail.com>
 <b7ff08b8-60fb-7629-9399-3d5cca46ab9e@linaro.org> <CAD=FV=Vx5g_xTRZGc9wW=ZLnfsOcubTYFcnYQRC5jLm+n3en0w@mail.gmail.com>
 <606cc762-a0c2-49a4-3e5d-d2dbd4595bc7@linaro.org> <CAD=FV=W_SA-3PfDFi-Gkjk9pew5bchFNjQhXX8MkZyuy5UohEQ@mail.gmail.com>
 <CAJKOXPdt5WTg4VU-TEW3dmPHR76dKg63XVxRQfa7ZSKc_jz6Ag@mail.gmail.com>
 <CAD=FV=XQqQSQDNh-zXqEQkwsrax5Qb3OtfKZoQLkncJj_4mcQw@mail.gmail.com>
 <daf66d41-42ac-50dc-3f8d-c261da8e452d@linaro.org> <CAD=FV=WhA=n_=Ys6NfedPtNPddL81HnG6Qws_R+vq9w8Nrsn5A@mail.gmail.com>
 <ce2ea308-b63d-ad27-4cea-7353268f8ebb@linaro.org> <CAODwPW857CkH0+ZnBaUeowW4te-hSy6nrdeeX6-OLPOs5TptsQ@mail.gmail.com>
 <55dcf917-7ac0-efe9-8531-b77be682125a@linaro.org> <CAD=FV=UPKo4CxRVmdHr05rRPaNHFYfaQTqmBJAU5ZF61ccKgEA@mail.gmail.com>
 <b619b455-c944-0cc6-ca83-e65490612ed7@linaro.org>
In-Reply-To: <b619b455-c944-0cc6-ca83-e65490612ed7@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 May 2022 10:49:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTNk_WPw+1sVRdToZLvDH_ve9QL+-+-unNEAK0k2hGMg@mail.gmail.com>
Message-ID: <CAD=FV=VTNk_WPw+1sVRdToZLvDH_ve9QL+-+-unNEAK0k2hGMg@mail.gmail.com>
Subject: Re: [PATCH] CHROMIUM: arm64: dts: qcom: Add sc7180-gelarshie
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Julius Werner <jwerner@chromium.org>,
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 11, 2022 at 10:36 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> > * If we want to change our scheme, we'd need to sit down and come to
> > an agreement that satisfies everyone, if such a thing is possible.
>
> There is open CFP for ELCE 2022 (in Ireland). Maybe we could organize
> some session there? But we for sure would need Rob, so the arrangements
> should rather focus on him, not on my availability.

Looks plausible to me to make it.


> > I mean, to be fair I said it _seems_ pure overhead and then said that
> > we could do it if it makes some tools happy. ...but before doing that,
> > I wanted to make sure it was actually valuable. I still have doubts
> > about the assertion that the most specific compatible is guaranteed to
> > uniquely identify hardware. So if the whole reason for doing this is
> > to make the validation tools happy and there's no other value, then at
> > least it's plausible to argue that the tools could simply be fixed to
> > allow this and not shout about it.
>
> Instead of adding bindings, you can indeed change/fix the tools. Go
> ahead. :)

I will try to take a quick look to see what this would look like.


> > Since there no properties associated with the
> > top-level compatible string, it's mostly just checking did some one
> > copy-paste the compatible string from one file (the dts file) to the
> > other file (the yaml file) correctly. To me, that does not feel like a
> > useful check.
>
> Still it can detect messing of SoC compatibles or not defining any
> board-level compatible thus pretending that someone's board is just
> SC7180. Imagine now user-space or bootloader trying to parse it...
>
> BTW, the bindings validation of top-level compatible might actually help
> you - to be sure that DTSes have proper compatibles matching what
> bootloader expects.

I'm still not seeing the help here. Is it somehow going to be easier
for someone to sneak in a dts file to the kernel tree that is just
"sc7180" than it will be to sneak an entry into the bindings that is
just "sc7180"? The people reviewing the dts and the list of allowed
boards in the bindings are the same people, right? Every entry in the
bindings gets used to match exactly one board, so, as I said, it's
pretty much just a question of whether you copy-pasted properly...

-Doug

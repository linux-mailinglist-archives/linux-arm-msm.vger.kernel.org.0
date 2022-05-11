Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79751523AF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 18:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345207AbiEKQzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 12:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345187AbiEKQzO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 12:55:14 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DB9E15F9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:55:12 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-ee1e7362caso3498759fac.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e3giz9a5p6PvP3nI2WSHt0o4PXurVZJIiRH9HCmnbgA=;
        b=uBPOYhmJyrZG0FGOnJJGKTdVuYYwxHxOhcB6nDfe79s8E2xsWIOzqB0165KN9XHcia
         tBfF4m0V5qF8xggSG6dLqi/4kKpcisL04i5iHEIHWvu6Ilo2BELbDPs0dlDBNAOy/KHa
         3H7EZAxGJrU/g9FUsizaDPkHleJbdPbkuDSP3PVqCe+LhSs3L2uvcV1YsXDudQ9V6hgw
         f88baRvNO3b9BQurljvLlIuVYqaOhKwfoJlP6qPbSbQj2foXq2bWroCazfUaOrGRrmVs
         1TIIA1rWkPC/eGu+f9SOmFUBsPjtq1tUS/nSqfY9TLtDQd2dBirMrl/5hFb8A7hZhy7o
         bgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e3giz9a5p6PvP3nI2WSHt0o4PXurVZJIiRH9HCmnbgA=;
        b=pyfvzjkdoFSBiXGqKU2qC3kc5sip95S0LLMqtIdjCG+9pWz/I2DD4O2IgJons98Zf1
         kDlVHXHZm+NFEnqVIzc38RrwawwcKyKh2/FHkTyp1NxAA8LuqpRXGYmbSEyTgV8wtpD/
         NAhmkIf0W7FzSNeTUIRLUEw4k7wDUD7K3HIfGeMUWQH8gGMsJfnQfyTx0CkAF5IdX3ej
         kJOCBxC2xarYtmFow5kZ4EVG3QVXhY80krWqHgW7moB6sf+UtwUcMexd+y2T7UbZnIrs
         bkD9/VE0ljnBXGgrDUN5WCVlfSHumQU3elInpJ9ILdd9eC10TMHiygIPJS6GjWzGI9L8
         RgTQ==
X-Gm-Message-State: AOAM531RWIzC5QeO87R53aYSNFhszqgNVJGiA7lQsX2Nq4WjHlYkEtqj
        pQJ3JM1aIjG9jp+pLLfIL1Pa3Q==
X-Google-Smtp-Source: ABdhPJxEdwJtX69e+zhiWdIzMm1ZqMWIkh8OiCFXiuYll6RGXhu6yrgmeL6C/g/GRpjKiPK0o0fgSg==
X-Received: by 2002:a05:6870:a707:b0:e2:cc85:d98 with SMTP id g7-20020a056870a70700b000e2cc850d98mr3275858oam.131.1652288111734;
        Wed, 11 May 2022 09:55:11 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g6-20020acab606000000b00325cda1ffbasm895644oif.57.2022.05.11.09.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 09:55:10 -0700 (PDT)
Date:   Wed, 11 May 2022 09:57:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Julius Werner <jwerner@chromium.org>,
        Krzysztof Koz??owski <k.kozlowski.k@gmail.com>,
        Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] CHROMIUM: arm64: dts: qcom: Add sc7180-gelarshie
Message-ID: <YnvrBWiOMB8vZ61D@ripper>
References: <606cc762-a0c2-49a4-3e5d-d2dbd4595bc7@linaro.org>
 <CAD=FV=W_SA-3PfDFi-Gkjk9pew5bchFNjQhXX8MkZyuy5UohEQ@mail.gmail.com>
 <CAJKOXPdt5WTg4VU-TEW3dmPHR76dKg63XVxRQfa7ZSKc_jz6Ag@mail.gmail.com>
 <CAD=FV=XQqQSQDNh-zXqEQkwsrax5Qb3OtfKZoQLkncJj_4mcQw@mail.gmail.com>
 <daf66d41-42ac-50dc-3f8d-c261da8e452d@linaro.org>
 <CAD=FV=WhA=n_=Ys6NfedPtNPddL81HnG6Qws_R+vq9w8Nrsn5A@mail.gmail.com>
 <ce2ea308-b63d-ad27-4cea-7353268f8ebb@linaro.org>
 <CAODwPW857CkH0+ZnBaUeowW4te-hSy6nrdeeX6-OLPOs5TptsQ@mail.gmail.com>
 <55dcf917-7ac0-efe9-8531-b77be682125a@linaro.org>
 <CAD=FV=UPKo4CxRVmdHr05rRPaNHFYfaQTqmBJAU5ZF61ccKgEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UPKo4CxRVmdHr05rRPaNHFYfaQTqmBJAU5ZF61ccKgEA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 May 09:09 PDT 2022, Doug Anderson wrote:

> Hi,
> 
> On Wed, May 11, 2022 at 12:20 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 11/05/2022 04:39, Julius Werner wrote:
> > >> Wait, we agreed that you don't consider them identical, didn't we? If
> > >> they are identical, you do not need rev4 at all. So they are not
> > >> identical...
> > >
> > > Well, they are identical until they're not. We intend them to be
> > > identical. But for practical purposes it does sometimes happen that
> > > two board revisions which were meant to be indistinguishable by
> > > software end up needing to be distinguished at a later point, when
> > > both the hardware and firmware can no longer be changed. We need to
> > > allow an escape hatch for that case. It does not happen often, so just
> > > treating them all as separate boards from the start is not a scalable
> > > solution. DTBs are not free when they all need to be packaged in the
> > > same kernel image.
> >
> > You split more important part of my message, ignoring the point.
> >
> > So you choose they are not identical, fine. Why insisting on adding
> > fallback compatible while not keeping bindings updated? Just don't add
> > the compatible and work on rev3 or rev4. Doug even once wrote "_we don't
> > know_ if -rev7 and -rev8 are compatible", so don't make them compatible.
> > Don't add fallbacks or some generic unspecified front-compatibles and
> > just work on revision.
> 
> Somehow, it seems like we keep talking past each other here and it
> feels like folks are getting upset and we're not moving forward. Maybe
> the right way to make progress is to find some face-to-face time at a
> future conference and sit in front of a white board and hash it out.
> That being said:
> 
> * Without changing our bootloader or having a big explosion in the
> number of dts files, we really can't change our scheme. The best we
> can do is document it.
> 
> * If we want to change our scheme, we'd need to sit down and come to
> an agreement that satisfies everyone, if such a thing is possible.
> That would only be able to affect future boards. We don't want to
> change the bootloader dts loading scheme on old boards.
> 

In particular we don't want to end up with a scheme that requires you to
spin new software for hardware that you think is compatible with the
existing description provided to the software, that would just cause
logistical overhead.

> 
> > >> Right now it's not possible to validate QCOM DTSes against DT bindings
> > >> because they throw big fat warnings about undocumented top compatibles.
> > >> This is a downside for us.
> > >
> > > But that's a solvable problem, right? As I understand, what Doug was
> > > initially just asking was whether it made _sense_ to document all of
> > > these... not that we couldn't do it. Then this whole thread went down
> > > a rabbit hole of whether our compatible assignments are allowed in the
> > > first place. If we can compromise on this discussion by just doing
> > > whatever needs to be done to make the tool happy, I think(?) we can
> > > provide that.
> >
> > None of recent patches from Chromium were doing it, even after
> > complaining from my side, so why do you suddenly believe that it is
> > "doable"? If yes, please start doing it and fix the DTSes which you
> > already submitted without bindings.
> >
> > To remind - entire discussion started with Doug saying it is pure
> > overhead for him.
> 
> I mean, to be fair I said it _seems_ pure overhead and then said that
> we could do it if it makes some tools happy. ...but before doing that,
> I wanted to make sure it was actually valuable. I still have doubts
> about the assertion that the most specific compatible is guaranteed to
> uniquely identify hardware. So if the whole reason for doing this is
> to make the validation tools happy and there's no other value, then at
> least it's plausible to argue that the tools could simply be fixed to
> allow this and not shout about it. Now, certainly I'm not arguing that
> yaml validation in general is useless. I'm in agreement that we want
> dts files to be able to be formally validated because it catches
> typos, missing properties, and bugs. I am _only_ saying that I still
> haven't seen a good argument for why we need to validate the top-level
> compatible string. Since there no properties associated with the
> top-level compatible string, it's mostly just checking did some one
> copy-paste the compatible string from one file (the dts file) to the
> other file (the yaml file) correctly. To me, that does not feel like a
> useful check.
> 
> The other thing I wanted to make sure was that we weren't just going
> to get NAKed later if/when we had to adjust compatible strings on
> existing dts files.
> 

I don't have a reason for rejecting such changes, as long as it doesn't
affect your ability to run off existing DTBs - but in the end you'd be
the ones suffering most from that...

Regards,
Bjorn

> In any case, I guess I'll make an attempt to document the compatibles
> for existing Chromebooks and we'll see what happens. I'm still not
> convinced of the value, but as long as we're not going to get NAKed
> for documenting reality it's fine.
> 
> -Doug
> 
> -Doug

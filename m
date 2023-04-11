Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1536DE019
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 17:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjDKP4Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 11:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjDKP4Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 11:56:24 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE55AE58
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 08:56:23 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id c2-20020a056830348200b006a3ab0ba8a2so8442739otu.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681228583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blZTaPYlMR7AQP+71+NEiokmd1N4qfMAzJNYCFJD4Bg=;
        b=jzQOnNVGM/ALI7dsZpyXhpbkIed3eDV57GxgWlpta6fNfcxOBW8cKWKutgcRGcGN2m
         EN5waxx7JzGYnfsRtlkenrRFv/IWlfX9x0S7hgnhb9CkYiVgXQa032iqqQ6rsVabP0Lg
         bpuWeSnPVxoX1G7EIQb9WuBEIEMc12ZiGEOba4pzgcNmcKcOVX+DoMxTuimUCsQvbe+F
         YakMQbPbQvLIU3YdWoIJ51O1kxnIlCmencEORCpfLbx9MiYppacowNxPSO1wUpX4f4kr
         uq3ehEVVnifACLQTB2tqyAhRq6ROlPPLr1bcVRxzCXtVxFrR5rFLRTxt+UYZxLI5IQ8v
         CbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681228583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blZTaPYlMR7AQP+71+NEiokmd1N4qfMAzJNYCFJD4Bg=;
        b=7PB1OgXtts9FT4VvxGoXjG2yk3nMhgw3JnUYFSRo2EYawJF1a+yRU6YM5NUmz5rFl3
         Ueuyb3RwUkIpg8Z8bLebDdOMf6iEyqsNr4mMlFbieznYEIlNBITRQj2DMZZjso2Pk+LM
         jGDXxtCvC5E8CE6TsoE6GhfVy0p0Eq4ehCVfCJPgk3SGpW9M0AvUSYJ2t/sku/dOtLRw
         1wHGavPXOh7IADW4O7RvDCBgUjPYSlMLb/izsqPEhL+ksNCgA4SC+hRXobs64oFhZZ1J
         p2zF8OQT16WM+VKX+BFt1koCovTxZp4VGd/Z5dRP9/80RzbqnpjOl2WZCVJPFLkhKGO/
         CFYA==
X-Gm-Message-State: AAQBX9ei/5J8CByXm2DNeexyjx5w3rXcKyhXqY3equa9HPOVvss9aXh2
        d8xieE5tlWkqJ4PmruuIHJOzeCSSlzoQKFV39Pc=
X-Google-Smtp-Source: AKy350ZeTt35ctmMkf1y/Tm/091yGhyN8QNjPCOcWeYZuyqpqiPMUz4+j/S2KORH+eswkhXOEbtBcjdcg+grziNVopo=
X-Received: by 2002:a05:6830:108c:b0:6a3:e43a:c707 with SMTP id
 y12-20020a056830108c00b006a3e43ac707mr2862709oto.7.1681228583088; Tue, 11 Apr
 2023 08:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGvwuj5tabyW910+N-B=5kFNAC7QNYoQ=0xi3roBjQvFFQ@mail.gmail.com>
 <ZDU2ASmAWEL0yjrc@phenom.ffwll.local> <CAF6AEGsLnPempzs1nCEKc4hNF54A_e5eG0gi92hyMd-y3_b3Sg@mail.gmail.com>
 <ZDV1+T9n4HCPnfUM@phenom.ffwll.local>
In-Reply-To: <ZDV1+T9n4HCPnfUM@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 11 Apr 2023 08:56:11 -0700
Message-ID: <CAF6AEGtbwS7-SKd_Q8t0AEPsE0j7ZsvHK2DmH-Ggnp0V6jhXoQ@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-next-2023-04-10 for v6.4
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Dave Airlie <airlied@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 11, 2023 at 8:00=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Tue, Apr 11, 2023 at 07:55:33AM -0700, Rob Clark wrote:
> > On Tue, Apr 11, 2023 at 3:27=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch>=
 wrote:
> > > > Konrad Dybcio (18):
> > > >       drm/msm/adreno: Use OPP for every GPU generation
> > >
> > > This had a minor conflict with refactoring from drm-misc-next, I went
> > > what's in your pr. Please double check I didn't screw up, but at leas=
t it
> > > compiles :-)
> >
> > Hmm, am I looking at the wrong thing.. the conflict I'm seeing is with
> > drm_gem_lru (and looks to be correctly resolved)
>
> Yeah that one was trivial. Unfortunately git does not report anything if
> you only keep one or the other branch entirely in your resolution, so the
> only way for you to see the conflict is to re-create the merge :-) Or at
> least my git foo isn't good enough for a better way ...

Ahh, right.. yes, this looks like the correct resolution (change
coming from drm-misc side was something that was removed from msm-next
side)

BR,
-R

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

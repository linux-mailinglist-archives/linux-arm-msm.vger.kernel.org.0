Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517FF7486A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 16:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjGEOnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 10:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbjGEOnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 10:43:20 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9D1170B
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 07:43:10 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-38c35975545so5403110b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688568190; x=1691160190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A14fZKmtNXyFXPY9J+wKEhzDJ4Yasz3lPL7wl3xXT9o=;
        b=FIi4zGZzJBDn8pZYMtFbQmJtUX0w1mBSjt1CFCfchGzflvfxL8Wc4DBsmeLraczciA
         c9iMzPtumc7Xwtwy2kxuNtLi8CN/ZTHn6+yoFE2fLEt/S2pr4x8KiX0ZE8vsEy6atGZh
         nQOJqfMtd1ISqII0qF6v6HwxnxRPyfEjtPKfSrLXcRJUCTheyMsYzTDWLnFXKu1IiGHc
         RrYKuSULFzNBEjUS1BX/8p66q7y2EKq34iA0HkSwjamLEyAfT1ehovgrDTS6tXrYWaK9
         vxPzZxEg2GmESH4tLOX8DUX/tYf9P+VGYcDH9R5iOcJYalbTup24ABetIf9ghr2PGPPV
         gGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688568190; x=1691160190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A14fZKmtNXyFXPY9J+wKEhzDJ4Yasz3lPL7wl3xXT9o=;
        b=ks9tj2gGrWUbxydkVIHBcaorIUtCxSMeVd+HE8i5a0LTi+2d6vzCSJt6RrzpQ3pkxM
         UNdt0CHjy2iOWUzvjoINTtBQKXt84PMm0jYzZtxJXeh+bxUaEgLp49FwXs8DCLi1bRw2
         ByM97hO+5jIjlcUKWd1ci/ISeGElArXMliwdL78oGJKWYahhPBG2BCZksZeiaC1FlGqP
         AX3AlOC0/X+GQutkdZD6aavKhB6Ch10aBHHAa6sIwl0ZayfWCCCO/BO7WAxi4zDIWOYc
         2WfmRb4EvSVAxvpoy3h4hvTYv336qwb5Hr0+DlSNHUQ8J/S49kBN8ZI90zUJO4+MG4Fj
         1v6Q==
X-Gm-Message-State: AC+VfDykI5fMWuHYZrropbCJ5TMHeDrZ7yjNb6bHYQPNq85a3nfRBFbZ
        kSRme4hagHsslEYr5ymyiqh6+0c3F+tzyRtN+eg=
X-Google-Smtp-Source: ACHHUZ7wimCD6cHiqgUUi7EIyKNS4Oju/YJSxp80yq2fiPDdvKbbukpLa9lMbEkKnQdf8CYYXHcb5acmpO4Y3of/RI0=
X-Received: by 2002:a05:6808:164e:b0:39d:adbe:fa29 with SMTP id
 az14-20020a056808164e00b0039dadbefa29mr17369355oib.4.1688568190086; Wed, 05
 Jul 2023 07:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230704163640.6162-1-robdclark@gmail.com> <CAA8EJpoAZ7z2aURWHs1ouEuTzj2c0O-CypCHmocXO62EpuffsQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoAZ7z2aURWHs1ouEuTzj2c0O-CypCHmocXO62EpuffsQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 5 Jul 2023 07:42:58 -0700
Message-ID: <CAF6AEGtUq3Y3YjTt1qazWcP4NcH2q_k4p2pfzEcrJMP34n_L+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/adreno: Fix warn splat for devices without revn
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 4, 2023 at 10:20=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 4 Jul 2023 at 19:36, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Recently, a WARN_ON() was introduced to ensure that revn is filled befo=
re
> > adreno_is_aXYZ is called. This however doesn't work very well when revn=
 is
> > 0 by design (such as for A635).
> >
> > Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified bef=
ore being set")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 65379e4824d9..ef1bcb6b624e 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -149,7 +149,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct =
adreno_rev rev2);
> >
> >  static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32=
_t revn)
> >  {
> > -       WARN_ON_ONCE(!gpu->revn);
> > +       /* revn can be zero, but if not is set at same time as info */
> > +       WARN_ON_ONCE(!gpu->info);
> >
> >         return gpu->revn =3D=3D revn;
> >  }
> > @@ -161,14 +162,16 @@ static inline bool adreno_has_gmu_wrapper(const s=
truct adreno_gpu *gpu)
> >
> >  static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
> >  {
> > -       WARN_ON_ONCE(!gpu->revn);
> > +       /* revn can be zero, but if not is set at same time as info */
> > +       WARN_ON_ONCE(!gpu->info);
> >
> >         return (gpu->revn < 300);
>
> This is then incorrect for a635 / a690 if they have revn at 0.

Fortunately not any more broken that it has ever been.  But as long as
sc7280/sc8280 have GPU OPP tables, you'd never hit this.  I'm working
on a better solution for next merge window.

BR,
-R

> >  }
> >
> >  static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
> >  {
> > -       WARN_ON_ONCE(!gpu->revn);
> > +       /* revn can be zero, but if not is set at same time as info */
> > +       WARN_ON_ONCE(!gpu->info);
> >
> >         return (gpu->revn < 210);
>
> And this too.
>
> >  }
> > --
> > 2.41.0
> >
>
>
> --
> With best wishes
> Dmitry

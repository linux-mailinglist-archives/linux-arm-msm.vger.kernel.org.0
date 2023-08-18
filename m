Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E50780D20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 15:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377455AbjHRNzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Aug 2023 09:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377543AbjHRNzR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Aug 2023 09:55:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906534211;
        Fri, 18 Aug 2023 06:55:04 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ff9b389677so1376858e87.3;
        Fri, 18 Aug 2023 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692366903; x=1692971703;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqOZRpA/sOgX9s7qNLK01/u1l1ZaHRKeAVuzjchXvhA=;
        b=QHuoY3NIpW/k876nQ+vV7jF/2k4zSbkiduPJJF1C1hrmKXu4x7e5pb9x7ImSdHL7If
         iJyLT/ekMP5/oVudColuOE5yJk8xJt/KMAodY4UmiENl5o8QLPFcaaAFC4EJJvrIwRJc
         cfDo5bx7xVdM9Xbi+QTbYZ7OlOFecz0ONEuLRPJm3sS2Iy2jdiLn8p4thpsqNvU8h0Oo
         BKxA8oznKkyeLF04VnePuSLMfDrKIaplfoQw322yUvU5E/VIKaBA1A1IaRQCume9nNQm
         vhrAnPkMtcWsSTkMqw3Vc0snwVF0TRl5hNlYk/E9WI4rSPQu09+zAt5ePepicQDE+Muj
         8GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692366903; x=1692971703;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqOZRpA/sOgX9s7qNLK01/u1l1ZaHRKeAVuzjchXvhA=;
        b=TqK+evR8ClkJQGLwG+13cmLZlaZ/xgIJdGejtEuhq92NTbboCdfppZ6XHwjQm36QGX
         qQRmAVHSTOY9XqOcrjMEkjB9NnigplycTTezPTf+E4q1ZISNFHe0rZS95lOfATtidZSO
         JjYvOd/P3qhV+Z2JiG/VuJTBCUAkA4W1ow/r8DRyRsMYO/OuqUS8rNSuWeKnF9JI1UXj
         O2BdBaaDclZOdAeqZj6RM2UwlETxZbS3k+KYc6EFJtiJdsiwWACINKEQXmJZFVetRJEi
         ka97T36anRayJoIA5lNJC6KMl86cnB1SgyQz6OJOnIrtoF3+vNqC0qEldvMG4kzN3imS
         610w==
X-Gm-Message-State: AOJu0Yyg1cwtq1chMB1Dp256rGb8fxGMt4cOYgfj07URT4+r/qVZNyjg
        cUKhNupkdgA4AWY+0gl1cn8=
X-Google-Smtp-Source: AGHT+IFBCMJIe6tXw9Hr2Trz4Gu0e9s26ICPKqd6btUGeso2ERHa6UCAX8DfyJ042bGbqMxnVkKIDg==
X-Received: by 2002:a05:6512:b19:b0:4fd:ddbc:1577 with SMTP id w25-20020a0565120b1900b004fdddbc1577mr2161268lfu.2.1692366902532;
        Fri, 18 Aug 2023 06:55:02 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id f16-20020ac251b0000000b004fdc7ec5cbesm351776lfk.300.2023.08.18.06.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:55:02 -0700 (PDT)
Date:   Fri, 18 Aug 2023 16:55:00 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sebastian Wick <sebastian.wick@redhat.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        laurent.pinchart@ideasonboard.com, ville.syrjala@linux.intel.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC v5 02/10] drm: Introduce solid fill DRM plane
 property
Message-ID: <20230818165500.50360195@eldfell>
In-Reply-To: <c4b7e9eb-fb5d-4b2f-8358-f41598d7d983@linaro.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
        <20230728-solid-fill-v5-2-053dbefa909c@quicinc.com>
        <CAA8EJpq=pbDoYc9wqKKrX+RahXp8zWTPFqVqA=S-0TkWXXJUjQ@mail.gmail.com>
        <CA+hFU4y38MTTUsbri1jy=n4Vyp7xx2CosD9Nmk97z_au6NHCdQ@mail.gmail.com>
        <CAA8EJpoFpUcQL_7pb0toDoLFsK=9GdBLQH+h_MMffrp9k7eCyw@mail.gmail.com>
        <20230818135133.3fdeddba@eldfell>
        <c4b7e9eb-fb5d-4b2f-8358-f41598d7d983@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U=vUEXpdxtWCvJFEbe144qV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/U=vUEXpdxtWCvJFEbe144qV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Aug 2023 14:03:14 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On 18/08/2023 13:51, Pekka Paalanen wrote:
> > On Fri, 4 Aug 2023 16:59:00 +0300
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >  =20
> >> On Fri, 4 Aug 2023 at 16:44, Sebastian Wick <sebastian.wick@redhat.com=
> wrote: =20
> >>>
> >>> On Fri, Aug 4, 2023 at 3:27=E2=80=AFPM Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote: =20
> >>>>
> >>>> On Fri, 28 Jul 2023 at 20:03, Jessica Zhang <quic_jesszhan@quicinc.c=
om> wrote: =20
> >>>>>
> >>>>> Document and add support for solid_fill property to drm_plane. In
> >>>>> addition, add support for setting and getting the values for solid_=
fill.
> >>>>>
> >>>>> To enable solid fill planes, userspace must assign a property blob =
to
> >>>>> the "solid_fill" plane property containing the following informatio=
n:
> >>>>>
> >>>>> struct drm_mode_solid_fill {
> >>>>>          u32 version;
> >>>>>          u32 r, g, b;
> >>>>> };
> >>>>>
> >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>> ---
> >>>>>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
> >>>>>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 ++++++++++++++++++=
+++++++++++++
> >>>>>   drivers/gpu/drm/drm_blend.c               | 30 +++++++++++++++++
> >>>>>   include/drm/drm_blend.h                   |  1 +
> >>>>>   include/drm/drm_plane.h                   | 35 ++++++++++++++++++=
++
> >>>>>   include/uapi/drm/drm_mode.h               | 24 ++++++++++++++
> >>>>>   6 files changed, 154 insertions(+)
> >>>>>    =20
> >>>>
> >>>> [skipped most of the patch]

...

> >>> Maybe another COLOR_FILL enum value
> >>> with alpha might be better? Maybe just doing the alpha via the alpha
> >>> property is good enough. =20
> >>
> >> One of our customers has a use case for setting the opaque solid fill,
> >> while keeping the plane's alpha intact. =20
> >=20
> > Could you explain more about why they must keep plane alpha intact
> > instead of reprogramming everything with atomic? Is there some
> > combination that just cannot reach the same end result via userspace
> > manipulation of the solid fill values with plane alpha?
> >=20
> > Or is it a matter of userspace architecture where you have independent
> > components responsible for different KMS property values? =20

> The latter one. The goal is to be able to switch between pixel sources=20
> without touching any additional properties (including plane's alpha value=
).

Sorry, but that does not seem like a good justification for KMS UAPI
design.

It is even in conflict with how atomic KMS UAPI was designed to work:
collect all your changes into a single commit, and push it at once.
Here we are talking about separate components changing the different
properties of the same KMS plane even. If you want to change both plane
opacity and contents, does it mean you need two refresh cycles, one at
a time? Could the two components be even racing with each other,
stalling each other randomly?


Thanks,
pq

--Sig_/U=vUEXpdxtWCvJFEbe144qV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTfeDQACgkQI1/ltBGq
qqctxg/9FrNHfSu24l0Eay/mQWxFRFTxi4VcYtO0f3lBxbhFeA3cb8q/w4TYtgDb
rkAWpN6SyDBIK4uvXxXP6soVQg7eRmRp7flQO7xO/SKouylbN+4HGA0FImfrN05p
SVWa5Kn7SMesPQamPiLD/CJj972to2csMOxYPkJ3CTB1i8eD7JWwVzR0hKW5x3qP
uxLdSJZFL4p4Qf9jqRLQC6aRl3OR1fckFpurTM7n9buZBPLSW6aWWka3GLw2+mpx
RCN//J5J4kVNOP0m9EAT51dI6O1X9CPxa7EPO/GJmUQszihFfA0pDd9yXE47LDrR
fJ5nB0rSCozHIZNYmtU++slYD1WrCFLod7L/fkP2Mf+ID+PUMcFJyih0PRuW4IbL
ILNmZRUgdH+ECVse9mEyubO2CnKAbg+2uXv222kyvLIQZfeoe8ts7kWKP9mDsI7A
WxFHEOmzR2IkXX3td2Ij6AjoMqnMKL5Y4qDlz/SPyKUUwolPL4/lp8xfjtaWLl6y
d0zOBLPuuObUNxA8KaRysDSyNfudF5vKUCrbt4lPCouDGxovcXmoyl/CdHkyQmzA
3mccDmUyx0bufemnoncWfq6PmVsT8GyI4ueaof5V7Al2V3pX0rFWC4CSej/AMZz4
XZyunx0mmvwAVfpU2rzjBQ2QBkT29X3IODJFkstM8rCTZpprYw8=
=xGHs
-----END PGP SIGNATURE-----

--Sig_/U=vUEXpdxtWCvJFEbe144qV--

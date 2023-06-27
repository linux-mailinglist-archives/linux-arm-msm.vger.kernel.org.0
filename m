Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB51E73F640
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 09:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjF0H65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 03:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjF0H64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 03:58:56 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615CA1716
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 00:58:55 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b44d77e56bso63401551fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 00:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687852733; x=1690444733;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oTS3fSe3r0f/6ByayGhePS4oD9QfJK+nEUrgD7pCsJk=;
        b=huX4s5sf8BKf1RCEGjUW5BJJGhtTkOyJcvYxrNS1SPZK8qhGFt/cb/sXYHxFQdDqPg
         I1AktCrwkuQ1bHByaHMsbXVXHt+cv1iFqi8YccVhvtgeRCHqMRpF0CX4leNd9FGbbUTx
         esce51oVfNxfLPZqnK5eIzVha0rsvgPvehclvTMn/ElG6FFJ8HNfyazPnxdiMEuE3iV5
         F5jH98jgHb2NlsIxEE0DULhKfItkayS1rw4Leh2JDc7P313GS+6HPXIN61xEXMdy7KrM
         fsYARsnX1+jQh0XaT5tY3DuFIPfeAoqvtmpmlLN44A2og3DoNWSt1BlXdflImJhpSVeo
         foLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852733; x=1690444733;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTS3fSe3r0f/6ByayGhePS4oD9QfJK+nEUrgD7pCsJk=;
        b=fMaJOWnP9/n+O6503/Hp00hJclF/Qh3hQTSqn/94zeaJNIw04CUJW5297yJ4x/6RxA
         xw0lMC3Rhx1GobmvPetEmVlvyHkyN3DCXKw5JmZraEIabjhnUcWPxGFm+0eJZDasouBc
         G9hC5O0yAYH8YpGiOIOjxmW49yxoaQe0uQKKQCyFWFSHGvfnuu+KBIckchwrWdWLi3Kk
         eCURGAQg3xN0Fvat9FFGEXB5ZlWzogT9kbq9mFxi5kqILp+VeJ7szVMD5xJS+dGKMM5U
         zi07BWdQ29Oep2GFjvPt9InC4xPeg0G5LlHWpLRkBiglY1KIbQCX1CzSt9QzTpL22sQr
         iksg==
X-Gm-Message-State: AC+VfDyqTY3E/MqgM9Pj2seYgRMK9tC9gH4I1KPzs8f5XU0RnMM2BR+X
        N+N4IUP2gxU8w5MWngpy1ao=
X-Google-Smtp-Source: ACHHUZ6+Jj822+nMyQbeFXCz2UduS9qwqpND5fA4rkY5e2oEyEG4SghXX0a9OjS8GrfM283RxwnFBw==
X-Received: by 2002:a05:6512:110a:b0:4fb:7bf8:51c8 with SMTP id l10-20020a056512110a00b004fb7bf851c8mr743594lfg.1.1687852733029;
        Tue, 27 Jun 2023 00:58:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id o4-20020ac24344000000b004fb8118a1aasm250684lfl.274.2023.06.27.00.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:58:52 -0700 (PDT)
Date:   Tue, 27 Jun 2023 10:58:49 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        daniel.vetter@ffwll.ch, quic_abhinavk@quicinc.com,
        dri-devel@lists.freedesktop.org, swboyd@chromium.org,
        seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        wayland-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Message-ID: <20230627105849.004050b3@eldfell>
In-Reply-To: <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
        <Y2leZDfLj/5963wl@intel.com>
        <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cawiMM3/kuZMggByy=fJ+.m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/cawiMM3/kuZMggByy=fJ+.m
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jun 2023 16:02:50 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 11/7/2022 11:37 AM, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote: =20
> >> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> >> properties. When the color fill value is set, and the framebuffer is s=
et
> >> to NULL, memory fetch will be disabled. =20
> >=20
> > Thinking a bit more universally I wonder if there should be
> > some kind of enum property:
> >=20
> > enum plane_pixel_source {
> > 	FB,
> > 	COLOR,
> > 	LIVE_FOO,
> > 	LIVE_BAR,
> > 	...
> > } =20
>=20
> Reviving this thread as this was the initial comment suggesting to=20
> implement pixel_source as an enum.
>=20
> I think the issue with having pixel_source as an enum is how to decide=20
> what counts as a NULL commit.
>=20
> Currently, setting the FB to NULL will disable the plane. So I'm=20
> guessing we will extend that logic to "if there's no pixel_source set=20
> for the plane, then it will be a NULL commit and disable the plane".
>=20
> In that case, the question then becomes when to set the pixel_source to=20
> NONE. Because if we do that when setting a NULL FB (or NULL solid_fill=20
> blob), it then forces userspace to set one property before the other.

Right, that won't work.

There is no ordering between each property being set inside a single
atomic commit. They can all be applied to kernel-internal state
theoretically simultaneously, or any arbitrary random order, and the
end result must always be the same. Hence, setting one property cannot
change the state of another mutable property. I believe that doing
otherwise would make userspace fragile and hard to get right.

I guess there might be an exception to that rule when the same property
is set multiple times in a single atomic commit; the last setting in
the array prevails. That's universal and not a special-case between two
specific properties.

> Because of that, I'm thinking of having pixel_source be represented by a=
=20
> bitmask instead. That way, we will simply unset the corresponding=20
> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in=20
> order to detect whether a commit is NULL or has a valid pixel source, we=
=20
> can just check if pixel_source =3D=3D 0.

Sounds fine to me at first hand, but isn't there the enum property that
says if the kernel must look at solid_fill blob *or* FB_ID?

If enum prop says "use solid_fill prop", the why would changes to FB_ID
do anything? Is it for backwards-compatibility with KMS clients that do
not know about the enum prop?

It seems like that kind of backwards-compatiblity will cause problems
in trying to reason about the atomic state, as explained above, leading
to very delicate and fragile conditions where things work intuitively.
Hence, I'm not sure backwards-compatibility is wanted. This won't be
the first or the last KMS property where an unexpected value left over
will make old atomic KMS clients silently malfunction up to showing no
recognisable picture at all. *If* that problem needs solving, there
have been ideas floating around about resetting everything to nice
values so that userspace can ignore what it does not understand. So far
there has been no real interest in solving that problem in the kernel
though.

Legacy non-atomic UAPI wrappers can do whatever they want, and program
any (new) properties they want in order to implement the legacy
expectations, so that does not seem to be a problem.


Thanks,
pq


>=20
> Would be interested in any feedback on this.
>=20
> Thanks,
>=20
> Jessica Zhang
>=20
> >  =20
> >> In addition, loosen the NULL FB checks within the atomic commit callst=
ack
> >> to allow a NULL FB when color_fill is nonzero and add FB checks in
> >> methods where the FB was previously assumed to be non-NULL.
> >>
> >> Finally, have the DPU driver use drm_plane_state.color_fill and
> >> drm_plane_state.color_fill_format instead of dpu_plane_state.color_fil=
l,
> >> and add extra checks in the DPU atomic commit callstack to account for=
 a
> >> NULL FB in cases where color_fill is set.
> >>
> >> Some drivers support hardware that have optimizations for solid fill
> >> planes. This series aims to expose these capabilities to userspace as
> >> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> >> hardware composer HAL) that can be set by apps like the Android Gears
> >> app.
> >>
> >> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to=
 a
> >> DRM format, setting COLOR_FILL to a color fill value, and setting the
> >> framebuffer to NULL. =20
> >=20
> > Is there some real reason for the format property? Ie. why not
> > just do what was the plan for the crttc background color and
> > specify the color in full 16bpc format and just pick as many
> > msbs from that as the hw can use?
> >  =20
> >>
> >> Jessica Zhang (3):
> >>    drm: Introduce color fill properties for drm plane
> >>    drm: Adjust atomic checks for solid fill color
> >>    drm/msm/dpu: Use color_fill property for DPU planes
> >>
> >>   drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++---------=
--
> >>   drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
> >>   drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
> >>   drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
> >>   drivers/gpu/drm/drm_plane.c               |  8 +--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
> >>   include/drm/drm_atomic_helper.h           |  5 +-
> >>   include/drm/drm_blend.h                   |  2 +
> >>   include/drm/drm_plane.h                   | 28 ++++++++++
> >>   10 files changed, 188 insertions(+), 76 deletions(-)
> >>
> >> --=20
> >> 2.38.0 =20
> >=20
> > --=20
> > Ville Syrj=C3=A4l=C3=A4
> > Intel =20


--Sig_/cawiMM3/kuZMggByy=fJ+.m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSalrkACgkQI1/ltBGq
qqeuGA//T9IdKPztEBLF3Udcj+pDgWM7dy+5zHtaGFRro1Lgivkl8tB2JFcMg0AF
4RMbjYLF+HPMTJ78W9p6L0BpfHIhj68SdSWO5SOF3EoAqwJ+P3HjZ36eNcdwWhd8
0wVtd/dNxVkvgDNRNYhWVmTVxTklh4I+iVVUJs9TNhP14CDGONYp5a6Lc31Gf2vW
lNb0OqfdXdVtX2X7qcIM+LU16DqF3dmKniMRyYYSZtF/IMPO0ZZUV3/C5VKQkk+P
5sRBafP3Mpb42vjn4czyN9J+175mRlZ80YVMO34u1fCc4MEpQmlqsVNVfgF5n/al
SjWWxeEPmS3E0+AMKu1P4THHbJw+th/BJnilQPzXBqhCfTvJsbhLLcPa9D8nlSJ0
k/JjDiTVnVFQXGUw/L5BzeMbWmUkKmAk+eOhB6KTB5GpD8iisM+8ReYfLPnZuCKm
EGw3iZ5Wm4uLqO3e46jBzgKE0p57aMg/8nnSGQgMgXlksoW4PJsu/jfrk6ERXx5Q
xJuCLDszcEYK1SsJwqxsgPx//dvC9HVzO0jCxYyshI/8SlFLTfIXkaEzCr+vPU5W
fq8lDtSbUp24FKjfOfRTc8JDgIOpybUOSaOifXNthTZO2L2vesZS2oW7u1gZqcXz
JWm5OUHia7dh5sncc8suPN50qmiSQ3gF8LN7z7Zj2OKxZknUefU=
=4Ljo
-----END PGP SIGNATURE-----

--Sig_/cawiMM3/kuZMggByy=fJ+.m--

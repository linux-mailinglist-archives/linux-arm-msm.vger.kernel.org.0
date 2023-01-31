Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D31682CF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 13:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjAaMtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 07:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbjAaMtV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 07:49:21 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C5635277
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 04:49:19 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id mf7so22534287ejc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 04:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AAbR4Xe0uoGGQiQAop/NiRbEwRMK95qB6zq+0BjtLMk=;
        b=L13OHgHk+3cVPV8Ev7PPWxZec7OP8VDkKitOYIgWBiDGbPGiazs+nHpU0OLeAi0OXp
         qYjgRheMjkFiBrgBGCmAAnQ3FMWaBAHqNcaFHAabm0kM3IBValGOIvOHlGPxe8eNadfW
         ZHug4c9MYMKP6x1ZTLRY3nmHns1yJLyYHPFnBbz+Dnqi4rwHzanSaIAWzQauuK/yRYeL
         j1aqm2vQVqptB8zZYRIfHZm3akdLKSPgsnQGsuBqak4/LP35O+KtEBlKMKStpaEOLBAY
         XmyDT2Pwa6sa6knrQPYGOKgqN8lyLrStjCcvauICvSu0KjhVY3NbZHvwq4K5byk3VIpA
         Yoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAbR4Xe0uoGGQiQAop/NiRbEwRMK95qB6zq+0BjtLMk=;
        b=1igvwHRBTbE8YYXtSEdf6fmbaNbf6wnwF01EBF5o7sc0IbPSg96UC0NE318eYHXAc1
         zqOSvEShTDG4qlUmkWvSeEMa1kSRvDO66ABkgxwwV1QQiS3knCa1V/1U5dqkwIZ/WE7p
         RBSyRLRue+qf+VwU0zrnzbx/Z3Dt1X3Mmn82GaX4KvxZuaCtolm4NAyUBuZzXzrvBbRO
         oAHB3+TzoOdxV8cJRarpjJ1CKUrNEQlNq/nl8exr6qRuP+NCaTt/xzyvQxPUl4AaswzV
         iiTC4iXRQB6LqXeUyTD336rf57Xwl9PtkZGtl3SW39YMVc87F5fIhCRb2YyAhiXUcqar
         hj9A==
X-Gm-Message-State: AO0yUKV5hiBihhT+EECuRZvEtfSA4lfBJl5um1quVnr+QChOvMhnBbwS
        RXqoDE5iPsXwa2w3j2/c0eY=
X-Google-Smtp-Source: AK7set9vuJ6ZqJ1sPa3LSY9w+yI0rEDxAXokT7UqBXUrKAbNgFOqq2fkb3HGDMe52NV17sP+Lcne9g==
X-Received: by 2002:a17:907:1303:b0:878:5524:e92d with SMTP id vj3-20020a170907130300b008785524e92dmr17307236ejb.33.1675169358028;
        Tue, 31 Jan 2023 04:49:18 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id f1-20020a17090631c100b00889a77458dbsm2505022ejf.21.2023.01.31.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 04:49:17 -0800 (PST)
Date:   Tue, 31 Jan 2023 14:49:13 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Simon Ser <contact@emersion.fr>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, daniel.vetter@ffwll.ch,
        laurent.pinchart@ideasonboard.com, sebastian.wick@redhat.com,
        wayland-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <20230131144913.5ff840dd@eldfell>
In-Reply-To: <x3f8jyn_QDj34hYn9rgumw2uhFTpWzOw2E-715WYVOfwNOpthv26sefM6ePtwqbuHH54ATupqQzzz9qIWqAbDvMpb06bhdiU5BJlMjsaCdo=@emersion.fr>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
        <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
        <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
        <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
        <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
        <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
        <20230131112527.32ab8ba5@eldfell>
        <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
        <20230131131326.75b43152@eldfell>
        <x3f8jyn_QDj34hYn9rgumw2uhFTpWzOw2E-715WYVOfwNOpthv26sefM6ePtwqbuHH54ATupqQzzz9qIWqAbDvMpb06bhdiU5BJlMjsaCdo=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EmDrZ4hurITVKxCJok9HQE1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/EmDrZ4hurITVKxCJok9HQE1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Jan 2023 11:21:18 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, January 31st, 2023 at 12:13, Pekka Paalanen <ppaalanen@gmail.=
com> wrote:
>=20
> > On Tue, 31 Jan 2023 10:06:39 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >  =20
> > > On Tuesday, January 31st, 2023 at 10:25, Pekka Paalanen <ppaalanen@gm=
ail.com> wrote:
> > >  =20
> > > > indeed, what about simply using a 1x1 framebuffer for real? Why was=
 that
> > > > approach rejected?   =20
> > >=20
> > > Ideally we don't want to allocate any GPU memory for the solid-fill
> > > stuff. And if we special-case 1x1 FB creation to not be backed by real
> > > GPU memory then we hit several situations where user-space expects a
> > > real FB but there isn't: for instance, GETFB2 converts from FB object
> > > ID to GEM handles. Even if we make GETFB2 fail and accept that this
> > > breaks user-space, then there is no way for user-space to recover the
> > > FB color for flicker-free transitions and such.
> > >=20
> > > This is all purely from a uAPI PoV, completely ignoring the potential
> > > issues with the internal kernel abstractions which might not be suita=
ble
> > > for this either. =20
> >=20
> > I mean a real 1x1 buffer: a dumb buffer.
> >=20
> > It would be absolutely compatible with anything existing, because it is
> > a real FB. As a dumb buffer it would be trivial to write into and read
> > out. As 1x1 it would be tiny (one page?). Even if something needs to
> > raw-access uncached memory over 33 MHz PCI bus or whatever the worst
> > case is, it's just one pixel, so it's fast enough, right? And it only
> > needs to be read once when set, like USB display drivers do. The driver
> > does not need to manually apply any color operations, because none are
> > supported in this special case.
> >=20
> > One can put all these limitations and even pixel format in the plane
> > property that tells userspace that a 1x1 FB works here.
> >=20
> > To recap, the other alternatives under discussion I see right now are:
> >=20
> > - this proposal of dedicated fill color property
> > - stuffing something new into FB_ID property
> >=20
> > There is also the question of other kinds of plane content sources like
> > live camera feeds where userspace won't be shovelling each frame
> > individually like we do now.
> >=20
> > 1x1 dumb buffer is not as small and lean as a dedicated fill color
> > property, but the UAPI design questions seem to be much less. What's
> > the best trade-off and for whom? =20
>=20
> By "real memory" yes I mean the 1 page.
>=20
> Using a real buffer also brings back other discussions, e.g. the one about
> which pixel formats to accept.

Yeah, which is why I wrote: "One can put all these limitations and even
pixel format in the plane property". It doesn't even need to be a
variable in the UAPI, it can be hardcoded in the UAPI doc.

Please, do not understand this as me strongly advocating for the real FB
approach! I just don't want that option to be misunderstood.

I don't really care which design is chosen, but I do care about
documenting why other designs were rejected. If the rejection reasons
were false, they should be revised, even if the decision does not
change.


Thanks,
pq

--Sig_/EmDrZ4hurITVKxCJok9HQE1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPZDkkACgkQI1/ltBGq
qqfFuA//cXcBUGHpyc5sGl5km0khKB4iASj0k7C1h51QvyDpHvvTkOD++ITErIcw
nZLWxEq1rYt+i4Ef5Hb8LswZvzmmh36LqnM9HDiLA2NQ2EuK6W6WUXV7nikfwQwD
rd3pNBukq4lxtn1AY1dP8JOa29WdFennsF/3L8jtWjf1qGq/yPt2lvt+e5XRtCC2
bGmrjBGvTMNolB50dfZCdIPiNn35PAgRMGSFBwJPtmIJlUqw5GtNm3w3A16f8PJZ
Tiqu3gbFnCBrbQXhg4tUDV8oAuQDFPOOnBFFru2tHglEjNOxhUoV00aKFKKHTO5k
7SzIRBQ8Voy/RFbvn3r/mOoKXP1F4G12pzE9R27XNk6Xq6hi7WtXnybefa0FDAXL
8v+U8UdsgV6uVI/u+IkSgUmWRkp6vr4FDp5MredZJ3OKE8+luIX31mM9ydkA9RKh
DuS43I0p8m9HSBqjK0PIpmyEsK3zICWz5z0BwUqBW4N6GDJDVd9NSJT6le0Vwncg
qGFnDA9kh1P67TfBrn7inzVKmDJJBnkn4kTz60DaxNElATgCgiEdUFLKjB8otNIK
e/uhLsEri2hPaXeNmQwGdmFQC0UxbCrufeAakhgMmeEoB7DWfABz0LjXJdMfGHCK
fFapTSmBtBttOEUiJHX3m3vx8PDJ2UXn5Q2RS/pAochtCLoB1Uw=
=9eOz
-----END PGP SIGNATURE-----

--Sig_/EmDrZ4hurITVKxCJok9HQE1--

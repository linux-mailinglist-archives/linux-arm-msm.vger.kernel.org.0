Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05CEB73F09B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjF0BqZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjF0BqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:46:25 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22F910F5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:46:22 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-bfee66a5db6so2528258276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687830382; x=1690422382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bRgShizAyrq4ywTgGYbTsfOTVKcXWK3I643AU1+WOo=;
        b=PiFAya7eepsENtFteEhdYxjkDQ2fR+5ZIqU7g8HlAcxiBbTASHNr4+puvS20O1mCID
         VpKKpFjVakeiXMotVqKCLHAelCmuzZ0mGdF/2R68rQD4E1jFe/gCuGdw09+F1FUxKJ7y
         ajEAz8nQTZGrv1bpahmqPYQfEctu7YvV27JwhnUVmBB47uqU+R+oVZhyJsUKhE2rX+Xk
         HLFE9Yw/d15FrZmiz4D/aLK68P9Ar4+tl8OVgW8ulGEmEUfaI9lZ5O+YoCMDpVvdp3yf
         SksNpmIcqg0ftjw04Ff+wxSu4F4nJcbkeZCYdstyrbsYiRn7dBqGAwihbtjvzWdnu+PL
         asOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687830382; x=1690422382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bRgShizAyrq4ywTgGYbTsfOTVKcXWK3I643AU1+WOo=;
        b=FbOgeenvfL5P762UiJs94/0lSU++RR8Hj1YSpD9/FsLHRYk5biHJOQIPqpCuhjaCa+
         VqseY5I4hGGaYSU4YshXtYSnY0OMdQIFIFjYI3e+ykslMbctN6KNVEJff/471V9x1WaV
         J2pOrdBC+ZDtnn7RAjmrKUMEwdlVWp/WoyVOKtv30epNQexcSbFAMLPbviyH4H6u5zkj
         +L24y1onvAz9gzk0psscTTABMj/xGgEewSDDHkuozxQ3cergfe/5pgbZpp3f6JwkASnT
         vc42+FAz+r0Ljkl8FSYLLjGmR5dVimS7IfPLJH1WRB4lr94hhQZ/MjOxmGnlcUi9W7o2
         2PkA==
X-Gm-Message-State: AC+VfDwTQUXmlVpLpsI29N/HUffW5dxk/qUTi0DDP0QX6LvLPxZ5c1zb
        v4OuRXrb/HFM7zCD/kwQUD5AsPgt22jZUdKuGmaJag==
X-Google-Smtp-Source: ACHHUZ5BQVAof3ACJ0RbwvuMHHQBnDo4hYsUHes6spt6mLpONQOpBBdX0oDMZJCj/4KBBKJTewAN/ehvZdkdSsLUMvA=
X-Received: by 2002:a25:af04:0:b0:c21:88bd:3ffc with SMTP id
 a4-20020a25af04000000b00c2188bd3ffcmr3510612ybh.17.1687830381788; Mon, 26 Jun
 2023 18:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com> <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
 <d8b1e910-6943-d7b7-5433-71f8b350bfcb@linaro.org> <5879e5c1-3f78-995b-b5ef-bbdf31019693@quicinc.com>
In-Reply-To: <5879e5c1-3f78-995b-b5ef-bbdf31019693@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 27 Jun 2023 04:46:10 +0300
Message-ID: <CAA8EJpp-W1rvV8Hb_HSmRn0aBdL_-jaxeWOnEeWguEAGBDeZug@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
        laurent.pinchart@ideasonboard.com,
        wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Jun 2023 at 03:45, Jessica Zhang <quic_jesszhan@quicinc.com> wro=
te:
>
>
>
> On 6/26/2023 5:06 PM, Dmitry Baryshkov wrote:
> > On 27/06/2023 02:02, Jessica Zhang wrote:
> >>
> >>
> >> On 11/7/2022 11:37 AM, Ville Syrj=C3=A4l=C3=A4 wrote:
> >>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> >>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> >>>> properties. When the color fill value is set, and the framebuffer is
> >>>> set
> >>>> to NULL, memory fetch will be disabled.
> >>>
> >>> Thinking a bit more universally I wonder if there should be
> >>> some kind of enum property:
> >>>
> >>> enum plane_pixel_source {
> >>>     FB,
> >>>     COLOR,
> >>>     LIVE_FOO,
> >>>     LIVE_BAR,
> >>>     ...
> >>> }
> >>
> >> Reviving this thread as this was the initial comment suggesting to
> >> implement pixel_source as an enum.
> >>
> >> I think the issue with having pixel_source as an enum is how to decide
> >> what counts as a NULL commit.
> >>
> >> Currently, setting the FB to NULL will disable the plane. So I'm
> >> guessing we will extend that logic to "if there's no pixel_source set
> >> for the plane, then it will be a NULL commit and disable the plane".
> >>
> >> In that case, the question then becomes when to set the pixel_source
> >> to NONE. Because if we do that when setting a NULL FB (or NULL
> >> solid_fill blob), it then forces userspace to set one property before
> >> the other.
> >
> > Why? The userspace should use atomic commits and as such it should all
> > properties at the same time.
>
> Correct, userspace will set all the properties within the same atomic
> commit. The issue happens when the driver iterates through each property
> within the MODE_ATOMIC ioctl [1].
>
> For reference, I'm thinking of an implementation where we're setting the
> pixel_source within drm_atomic_plane_set_property().
>
> So something like:
>
> drm_atomic_plane_set_property( ... )
> {
>      if (property =3D=3D config->prop_fb_id) {
>          if (fb)
>              state->pixel_source =3D FB;
>          else
>              state->pixel_source =3D NONE;
>      } else if (property =3D=3D config->prop_solid_fill) {
>          if (solid_fill_blob)
>              state->pixel_source =3D SOLID_FILL;
>      }
>
>      // ...
> }

I think this is somewhat overcomplicated. Allow userspace to set these
properties as it sees fit and then in
drm_atomic_helper_check_plane_state() consider all of them to set
plane_state->visible.

We still have to remain compatible with older userspace (esp. with a
non-atomic one). It expects that a plane is enabled after setting both
CRTC and FB. So maybe you are right and we should force pixel_source
to FB if FB is set.

>
> If userspace sets solid_fill to a valid blob and FB to NULL, it's
> possible for driver to first set the solid_fill property then set the
> fb_id property later. This would cause pixel_source to be set to NONE
> after all properties have been set.
>
> I've also considered an implementation without the `pixel_source =3D NONE=
`
> line in the prop_fb_id case, but we would still need to find somewhere
> to set the pixel_source to NONE in order to allow userspace to disable a
> plane.

Good point. I don't think we would need NONE (just setting CRTC to
none or FB to none and pixel_source to FB would disable the plane),
but I might be missing something here.

>
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic=
_uapi.c#L1385
>
> >
> >> Because of that, I'm thinking of having pixel_source be represented by
> >> a bitmask instead. That way, we will simply unset the corresponding
> >> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in
> >> order to detect whether a commit is NULL or has a valid pixel source,
> >> we can just check if pixel_source =3D=3D 0.
> >>
> >> Would be interested in any feedback on this.
> >
> > This is an interesting idea. Frankly speaking, I'd consider it
> > counter-intuitive at the first glance.
> >
> > Consider it to act as a curtain. Setup the curtain (by writing the fill
> > colour property). Then one can close the curtain (by switching source t=
o
> > colour), or open it (by switching to any other source). Bitmask wouldn'=
t
> > complicate this.
>
> So if I'm understanding your analogy correctly, pixel_source won't
> necessarily be set whenever the FB or solid_fill properties are set. So
> that way we can have both FB *and* solid_fill set at the same time, but
> only the source that pixel_source is set to would be displayed.

Yes. And if the source is not configured, the plane will be marked as
not visible.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>
> >> Thanks,
> >>
> >> Jessica Zhang
> >>
> >>>
> >>>> In addition, loosen the NULL FB checks within the atomic commit
> >>>> callstack
> >>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
> >>>> methods where the FB was previously assumed to be non-NULL.
> >>>>
> >>>> Finally, have the DPU driver use drm_plane_state.color_fill and
> >>>> drm_plane_state.color_fill_format instead of
> >>>> dpu_plane_state.color_fill,
> >>>> and add extra checks in the DPU atomic commit callstack to account
> >>>> for a
> >>>> NULL FB in cases where color_fill is set.
> >>>>
> >>>> Some drivers support hardware that have optimizations for solid fill
> >>>> planes. This series aims to expose these capabilities to userspace a=
s
> >>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Andr=
oid
> >>>> hardware composer HAL) that can be set by apps like the Android Gear=
s
> >>>> app.
> >>>>
> >>>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT
> >>>> to a
> >>>> DRM format, setting COLOR_FILL to a color fill value, and setting th=
e
> >>>> framebuffer to NULL.
> >>>
> >>> Is there some real reason for the format property? Ie. why not
> >>> just do what was the plan for the crttc background color and
> >>> specify the color in full 16bpc format and just pick as many
> >>> msbs from that as the hw can use?
> >>>
> >>>>
> >>>> Jessica Zhang (3):
> >>>>    drm: Introduce color fill properties for drm plane
> >>>>    drm: Adjust atomic checks for solid fill color
> >>>>    drm/msm/dpu: Use color_fill property for DPU planes
> >>>>
> >>>>   drivers/gpu/drm/drm_atomic.c              | 68
> >>>> ++++++++++++-----------
> >>>>   drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
> >>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
> >>>>   drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
> >>>>   drivers/gpu/drm/drm_plane.c               |  8 +--
> >>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
> >>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++-----=
---
> >>>>   include/drm/drm_atomic_helper.h           |  5 +-
> >>>>   include/drm/drm_blend.h                   |  2 +
> >>>>   include/drm/drm_plane.h                   | 28 ++++++++++
> >>>>   10 files changed, 188 insertions(+), 76 deletions(-)


--=20
With best wishes
Dmitry

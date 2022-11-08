Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC6E62078E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 04:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbiKHDes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 22:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233087AbiKHDe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 22:34:29 -0500
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC496463
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 19:34:25 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-13d9a3bb27aso14197514fac.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 19:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDw3Gg68r1mAo82wyeCHUt98gJiZsSI0ml7JTaDn03s=;
        b=QOkIOZbqsVhd+vTtWIJAAoUhey3ujk0tDMJGx62ppq7jEsavzriI0c7g/bAzp9oG5A
         yIePbu4jLTiq0zBKlATb6sPP0ZzuNa2fiP+805uK899nh287O5rShjXSobnbT8vg/xQm
         5VI3mbbI55PhVqLAS+A2QifGt07WVcvdo3IHimJ1k+xU4oeM8hRy8gCHrovt/X+Mp0JL
         yvsUx69uPQhlaJqjWn8WG7xi4LSTb8WrxO2RIAdi/2i/3WpECx8Xtwggwa/0adgikGEX
         nvOHhX2sU00rFkftHW0skUxGNEtIMfaCtX9/Da71ClBW5IAWJ7iT0Rt79wSWqOhNe+La
         U90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDw3Gg68r1mAo82wyeCHUt98gJiZsSI0ml7JTaDn03s=;
        b=otr2tb9w0Z+jexFKDS7z94bgH+KpMgCvIxeivSHoTzbwJwjMw7iI2mnBXbbnIQ21er
         xdHRb7J6bCd0jWnRn63dn8ptoU7rReh9OlqEbjEwcS+Ssw2LCrE6pI66xwq0uNlsXZTW
         jdkR5a7xSs7G67Twl/kFOgg0GMJCu8lW6AMtrN0/y7nG4jG3+ZJ2DtT7IbOEd2Pk2EJy
         z5dxtVfFatn4ClW/bBCbOET/jybtMez1OMUA3IWzO92orZ49JucyjCnBcvEFnH/Ldnd+
         UHACNywAiFU3qaNgqUme5Dp9zYunsTa9k8oEPJ5EseWf/NFOm6aTzDnMK/X1sD279Yhx
         aGyA==
X-Gm-Message-State: ACrzQf3wWxd1ReDCdffuwFCPqK0t+m28BanArO05sYnsqq3YbakX058A
        AB8/z0i7EHWL+/OzhFJNa2i5XkKrAuAJ7Azvtso=
X-Google-Smtp-Source: AMsMyM6ic9iVzhaVGRyEno7zttlTNzS/Qd1k0Nk9bzSpHReLupGdrIOatJuMj7zFolXXNFdzxWKjblGETD0oeLTFtI4=
X-Received: by 2002:a05:6871:6a4:b0:13b:a056:f97f with SMTP id
 l36-20020a05687106a400b0013ba056f97fmr31413824oao.38.1667878464722; Mon, 07
 Nov 2022 19:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com> <5a9167d5-f88d-ed6b-abff-8ae39117feb1@quicinc.com>
 <CAF6AEGtbwsvr5A+mX7BxP95u3RyRiUFzE6dfiZacS96WVBhuvw@mail.gmail.com> <c196f010-34e7-4c1c-4ca6-852a4c32b154@quicinc.com>
In-Reply-To: <c196f010-34e7-4c1c-4ca6-852a4c32b154@quicinc.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 7 Nov 2022 19:34:43 -0800
Message-ID: <CAF6AEGtJcz6dK-vgnYuJsBqm2tDRUYB7Tg2jtQm1-KuTi+z8ZA@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 0/3] Support for Solid Fill Planes
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        daniel.vetter@ffwll.ch, quic_abhinavk@quicinc.com,
        dri-devel@lists.freedesktop.org, swboyd@chromium.org,
        seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 7, 2022 at 4:22 PM Jessica Zhang <quic_jesszhan@quicinc.com> wr=
ote:
>
>
>
> On 11/7/2022 2:09 PM, Rob Clark wrote:
> > On Mon, Nov 7, 2022 at 1:32 PM Jessica Zhang <quic_jesszhan@quicinc.com=
> wrote:
> >>
> >>
> >>
> >> On 11/7/2022 11:37 AM, Ville Syrj=C3=A4l=C3=A4 wrote:
> >>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> >>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> >>>> properties. When the color fill value is set, and the framebuffer is=
 set
> >>>> to NULL, memory fetch will be disabled.
> >>>
> >>> Thinking a bit more universally I wonder if there should be
> >>> some kind of enum property:
> >>>
> >>> enum plane_pixel_source {
> >>>        FB,
> >>>        COLOR,
> >>>        LIVE_FOO,
> >>>        LIVE_BAR,
> >>>        ...
> >>> }
> >>
> >> Hi Ville,
> >>
> >> Makes sense -- this way, we'd also lay some groundwork for cases where
> >> drivers want to use other non-FB sources.
> >>
> >>>
> >>>> In addition, loosen the NULL FB checks within the atomic commit call=
stack
> >>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
> >>>> methods where the FB was previously assumed to be non-NULL.
> >>>>
> >>>> Finally, have the DPU driver use drm_plane_state.color_fill and
> >>>> drm_plane_state.color_fill_format instead of dpu_plane_state.color_f=
ill,
> >>>> and add extra checks in the DPU atomic commit callstack to account f=
or a
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
> >>>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT =
to a
> >>>> DRM format, setting COLOR_FILL to a color fill value, and setting th=
e
> >>>> framebuffer to NULL.
> >>>
> >>> Is there some real reason for the format property? Ie. why not
> >>> just do what was the plan for the crttc background color and
> >>> specify the color in full 16bpc format and just pick as many
> >>> msbs from that as the hw can use?
> >>
> >> The format property was added because we can't assume that all hardwar=
e
> >> will support/use the same color format for solid fill planes. Even for
> >> just MSM devices, the hardware supports different variations of RGB
> >> formats [1].
> >
> > Sure, but the driver can convert the format into whatever the hw
> > wants.  A 1x1 color conversion is not going to be problematic ;-)
>
> Hi Rob,
>
> Hm... that's also a fair point. Just wondering, is there any advantage
> of having the driver convert the format, other than not having to
> implement an extra format property?
>
> (In case we end up wrapping everything into a prop blob or something)
>

It keeps the uabi simpler.. for obvious reasons you don't want the
driver to do cpu color conversion for an arbitrary size plane, which
is why we go to all the complexity to expose formats and modifiers for
"real" planes, but we are dealing with a single pixel value here,
let's not make the uabi more complex than we need to.  I'd propose
making it float32[4] if float weren't a pita for kernel/uabi, but
u16[4] or u32[4] should be fine, and drivers can translate that easily
into whatever weird formats their hw wants for solid-fill.

BR,
-R

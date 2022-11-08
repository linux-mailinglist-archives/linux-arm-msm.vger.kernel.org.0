Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CFA621C7E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 19:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiKHSvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 13:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiKHSu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 13:50:57 -0500
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C4168284
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 10:50:47 -0800 (PST)
Date:   Tue, 08 Nov 2022 18:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1667933446; x=1668192646;
        bh=iR4z0fcOUj4kLBli87jk8SRgbWffMR5GcTiGRWNAqFU=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=iodNwh3Yn79pSho7+Gaty5eM6k9SHFtE74jY2vKRDnn+w8g9LiaBg59FbKx1ufA5/
         Vliap1b51XYM6e7cvCTNDAC+scDHnRXXxCnK3MnbV7V6KnoSyjneVAfCsPCb1FRqy5
         KYbLDG1WwxgPlYjNHMbOEuf+V7G5KJKf7N8seZBU1j5SzTx+LXagWr5pY3/VBAcfd6
         ipxtgQ0KuhhYGXsb8xvKJqI5dWWiytpvoP/7CaGd3+Ni5By2TNnSu3/tZGbviVbjhC
         ZaJlK0gyJAQYl99GXdjTIwG8Gec3yUWFn8xV35mCKMMDE66j0b0Ym0XCS9SIAvQVWn
         GjonFHFmCI8ZA==
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Simon Ser <contact@emersion.fr>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, daniel.vetter@ffwll.ch,
        laurent.pinchart@ideasonboard.com,
        wayland-devel <wayland-devel@lists.freedesktop.org>,
        Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Message-ID: <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
In-Reply-To: <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com> <20221028225952.160-2-quic_jesszhan@quicinc.com> <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

cc'ing Pekka and wayland-devel for userspace devs feedback on the new uAPI.

On Saturday, October 29th, 2022 at 14:08, Dmitry Baryshkov <dmitry.baryshko=
v@linaro.org> wrote:

> On 29/10/2022 01:59, Jessica Zhang wrote:
> > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > drm_plane. In addition, add support for setting and getting the values
> > of these properties.
> >
> > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > represents the format of the color fill. Userspace can set enable solid
> > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > framebuffer to NULL.
> >
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>=20
> Planes report supported formats using the drm_mode_getplane(). You'd
> also need to tell userspace, which formats are supported for color fill.
> I don't think one supports e.g. YV12.
>=20
> A bit of generic comment for the discussion (this is an RFC anyway).
> Using color_fill/color_fill_format properties sounds simple, but this
> might be not generic enough. Limiting color_fill to 32 bits would
> prevent anybody from using floating point formats (e.g.
> DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with
> e.g. using 64-bit for the color_fill value, but then this doesn't sound
> extensible too much.
>=20
> So, a question for other hardware maintainers. Do we have hardware that
> supports such 'color filled' planes? Do we want to support format
> modifiers for filling color/data? Because what I have in mind is closer
> to the blob structure, which can then be used for filling the plane:
>=20
> struct color_fill_blob {
>      u32 pixel_format;
>      u64 modifiers4];
>      u32 pixel_data_size; // fixme: is this necessary?
>      u8 pixel_data[];
> };
>=20
> And then... This sounds a lot like a custom framebuffer.
>=20
> So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_FILL
> flag to the framebuffers, which would e.g. mean that the FB gets stamped
> all over the plane. This would also save us from changing if (!fb)
> checks all over the drm core.
>=20
> Another approach might be using a format modifier instead of the FB flag.
>=20
> What do you think?

First off, we only need to represent the value of a single pixel here. So I=
'm
not quite following why we need format modifiers. Format modifiers describe=
 how
pixels are laid out in memory. Since there's a single pixel described, this
is non-sensical to me, the format modifier is always LINEAR.

Then, I can understand why putting the pixel_format in there is tempting to
guarantee future extensibility, but it also adds complexity. For instance, =
how
does user-space figure out which formats can be used for COLOR_FILL? Can
user-space use any format supported by the plane? What does it mean for
multi-planar formats? Do we really want the kernel to have conversion logic=
 for
all existing formats? Do we need to also add a new read-only blob prop to
indicate supported COLOR_FILL formats?

We've recently-ish standardized a new Wayland protocol [1] which has the sa=
me
purpose as this new kernel uAPI. The conclusion there was that using 32-bit
values for each channel (R, G, B, A) would be enough for almost all use-cas=
es.
The driver can convert these high-precision values to what the hardware exp=
ects.
The only concern was about sending values outside of the [0.0, 1.0] range,
which may have HDR use-cases.

So, there are multiple ways to go about this. I can think of:

- Put "RGBA32" in the name of the prop, and if we ever need a different
  color format, pick a different name.
- Define a struct with an enum of possible fill kinds:
  #define FILL_COLOR_RGBA32 1
  #define FILL_COLOR_F32 2
  struct color_fill_blob { u32 kind; u8 data[]; };
- Define a struct with a version and RGBA values:
  struct color_fill_blob { u32 version; u32 rgba[4]; };
  If we need to add more formats later, or new metadata:
  struct color_fill_blob2 { u32 version; /* new fields */ };
  where version must be set to 2.
- Define a struct with a "pixel_format" prop, but force user-space to use a
  fixed format for now. Later, if we need another format, add a new prop to
  advertise supported formats.
- More complicated solutions, e.g. advertise the list of supported formats =
from
  the start.

[1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_reque=
sts/104

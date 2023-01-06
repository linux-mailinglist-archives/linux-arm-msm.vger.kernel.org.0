Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4AA6660898
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 22:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjAFVDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 16:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjAFVDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 16:03:44 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962B163FC
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 13:03:42 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id jo4so6200042ejb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncNdpkHYDCuzDDV8W7mrRJJ4OL6xfKFon52nI6t6AR0=;
        b=OOMaVPF8PE33Yz9D50YP7LpaQEpk0GhXEZmO6kxhOY0F2fwTeXe09oMNPVWMAa8Knt
         hVpxBHhT1iY7YZbwM90JrWfMCLfBPM8Bj/4uw+mr04p911eXAEI1rtHcxS3aS07O7iAb
         6q0haKsfjWhbl8N/PVH6BjrZUkMBFtTUp+r04hYrPerl+ziIcndtlFCdIXp6uWHJVPLJ
         j/B9DnKOfhMWZBFFgB0HRgil+AqpAFAgmMC2kmEBdEh8tPPHiJI3elD1+3XhXIcXRd3/
         9v4SbMavpWDI802A4gCrKOvaJfAIRs0LOp6IlDErBT8w4yUOhD1rFPblzx35CwajdhpV
         EX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncNdpkHYDCuzDDV8W7mrRJJ4OL6xfKFon52nI6t6AR0=;
        b=smWvC9CfQz9O6xOvysA2uFtigqY4OEfJBcQv6UOWmrywogESemUY+p3PpU8k276gul
         gyu7hgVe2i4hXUO86uM62JmamW9VPMi1EQqtiQ5C6kNrycTY96Xl30SW/TLKBW7Jz2nW
         8bQqjv0XOkpYuQ8QwcidzYzSZiiv00Pckgfbmqfo5mH/uo9wnydpDZDfHUsh6MCI/pRs
         VpeUkJCQxPWA/x30eqnLsFBudVVXUsqqBJKJvCXlnG7IE35To20Wqva89Fj5uv4C0LQF
         teHEwhgDGG0SwdIlm3pUa3s5ON7MuOlJ8xdPC8YrS8GySqOPNoir0s31/xl4Jrhzu3Ed
         +EuA==
X-Gm-Message-State: AFqh2krhV/XG3chQmnmz/x3Lj30KiSx4VQpMaciPSjcioBwnYwUz9ffE
        NjIJLl3P5dyh3Zl2LKO4aTUoFcnwKGFzHrozeUHNJQ==
X-Google-Smtp-Source: AMrXdXsOPompBRikxSt1YgMhfN96Cl5lZBz061/02/RdBo5YhLPTsjR2CJjx3w/9oOFZWtD8MkXn+KW0WapXWE7jXDY=
X-Received: by 2002:a17:906:e2c4:b0:829:e4f0:bf2b with SMTP id
 gr4-20020a170906e2c400b00829e4f0bf2bmr3719830ejb.389.1673039021141; Fri, 06
 Jan 2023 13:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20230106112324.22055-1-tzimmermann@suse.de> <5dcecae8-5c55-0e2e-bdf0-18fd559f8e00@suse.de>
In-Reply-To: <5dcecae8-5c55-0e2e-bdf0-18fd559f8e00@suse.de>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Fri, 6 Jan 2023 15:03:29 -0600
Message-ID: <CAKXuJqiy=NY1f-3scOCmVtKnidvcHsZ0RtxHFJMAphqovrp=6w@mail.gmail.com>
Subject: Re: [PATCH v4] drm/fb-helper: Replace bpp/depth parameter by color mode
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, mcanal@igalia.com, dmitry.baryshkov@linaro.org,
        javierm@redhat.com, airlied@gmail.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 6, 2023 at 8:05 AM Thomas Zimmermann <tzimmermann@suse.de> wrot=
e:
>
> Hi,
>
> I've pushed this fix into drm-misc-next. It will hopefully restore the
> fbdev consoles. Sorry for the inconvenience. If things still don't work,
> stating
>
>    video=3D1024x768-32
>
> on the kernel command line should be a safe override on most systems.
>
> Best regards
> Thomas
>
> Am 06.01.23 um 12:23 schrieb Thomas Zimmermann:
> > Replace the combination of bpp and depth with a single color-mode
> > argument. Handle special cases in simpledrm and ofdrm. Hard-code
> > XRGB8888 as fallback format for cases where no given format works.
> >
> > The color-mode argument accepts the same values as the kernel's video
> > parameter. These are mostly bpp values between 1 and 32. The exceptions
> > are 15, which has a color depth of 15 and a bpp value of 16; and 32,
> > which has a color depth of 24 and a bpp value of 32.
> >
> > v4:
> >       * add back lost test for bpp_specified (Maira)
> >       * add Fixes tag (Daniel)
> > v3:
> >       * fix ofdrm build (Maxime)
> > v2:
> >       * minimize changes (Daniel)
> >       * use drm_driver_legacy_fb_format() (Daniel)
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format sele=
ction")
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/drm_fb_helper.c  | 42 ++++++++++++++++++-------------=
-
> >   drivers/gpu/drm/tiny/ofdrm.c     |  7 +++++-
> >   drivers/gpu/drm/tiny/simpledrm.c |  7 +++++-
> >   3 files changed, 36 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> > index 1369ca4ae39b..427631706128 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -1756,24 +1756,21 @@ static uint32_t drm_fb_helper_find_format(struc=
t drm_fb_helper *fb_helper, const
> >       return DRM_FORMAT_INVALID;
> >   }
> >
> > -static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper=
 *fb_helper,
> > -                                               const uint32_t *formats=
, size_t format_count,
> > -                                               const struct drm_cmdlin=
e_mode *cmdline_mode)
> > +static uint32_t drm_fb_helper_find_color_mode_format(struct drm_fb_hel=
per *fb_helper,
> > +                                                  const uint32_t *form=
ats, size_t format_count,
> > +                                                  unsigned int color_m=
ode)
> >   {
> >       struct drm_device *dev =3D fb_helper->dev;
> >       uint32_t bpp, depth;
> >
> > -     if (!cmdline_mode->bpp_specified)
> > -             return DRM_FORMAT_INVALID;
> > -
> > -     switch (cmdline_mode->bpp) {
> > +     switch (color_mode) {
> >       case 1:
> >       case 2:
> >       case 4:
> >       case 8:
> >       case 16:
> >       case 24:
> > -             bpp =3D depth =3D cmdline_mode->bpp;
> > +             bpp =3D depth =3D color_mode;
> >               break;
> >       case 15:
> >               bpp =3D 16;
> > @@ -1784,7 +1781,7 @@ static uint32_t drm_fb_helper_find_cmdline_format=
(struct drm_fb_helper *fb_helpe
> >               depth =3D 24;
> >               break;
> >       default:
> > -             drm_info(dev, "unsupported bpp value of %d\n", cmdline_mo=
de->bpp);
> > +             drm_info(dev, "unsupported color mode of %d\n", color_mod=
e);
> >               return DRM_FORMAT_INVALID;
> >       }
> >
> > @@ -1817,10 +1814,13 @@ static int __drm_fb_helper_find_sizes(struct dr=
m_fb_helper *fb_helper, int prefe
> >               drm_client_for_each_connector_iter(connector, &conn_iter)=
 {
> >                       struct drm_cmdline_mode *cmdline_mode =3D &connec=
tor->cmdline_mode;
> >
> > -                     surface_format =3D drm_fb_helper_find_cmdline_for=
mat(fb_helper,
> > -                                                                      =
  plane->format_types,
> > -                                                                      =
  plane->format_count,
> > -                                                                      =
  cmdline_mode);
> > +                     if (!cmdline_mode->bpp_specified)
> > +                             continue;
> > +
> > +                     surface_format =3D drm_fb_helper_find_color_mode_=
format(fb_helper,
> > +                                                                      =
     plane->format_types,
> > +                                                                      =
     plane->format_count,
> > +                                                                      =
     cmdline_mode->bpp);
> >                       if (surface_format !=3D DRM_FORMAT_INVALID)
> >                               break; /* found supported format */
> >               }
> > @@ -1829,17 +1829,23 @@ static int __drm_fb_helper_find_sizes(struct dr=
m_fb_helper *fb_helper, int prefe
> >               if (surface_format !=3D DRM_FORMAT_INVALID)
> >                       break; /* found supported format */
> >
> > -             /* try preferred bpp/depth */
> > -             surface_format =3D drm_fb_helper_find_format(fb_helper, p=
lane->format_types,
> > -                                                        plane->format_=
count, preferred_bpp,
> > -                                                        dev->mode_conf=
ig.preferred_depth);
> > +             /* try preferred color mode */
> > +             surface_format =3D drm_fb_helper_find_color_mode_format(f=
b_helper,
> > +                                                                   pla=
ne->format_types,
> > +                                                                   pla=
ne->format_count,
> > +                                                                   pre=
ferred_bpp);
> >               if (surface_format !=3D DRM_FORMAT_INVALID)
> >                       break; /* found supported format */
> >       }
> >
> >       if (surface_format =3D=3D DRM_FORMAT_INVALID) {
> > +             /*
> > +              * If none of the given color modes works, fall back
> > +              * to XRGB8888. Drivers are expected to provide this
> > +              * format for compatibility with legacy applications.
> > +              */
> >               drm_warn(dev, "No compatible format found\n");
> > -             return -EAGAIN;
> > +             surface_format =3D drm_driver_legacy_fb_format(dev, 32, 2=
4);
> >       }
> >
> >       info =3D drm_format_info(surface_format);
> > diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.=
c
> > index 39c5fd463fec..6e349ca42485 100644
> > --- a/drivers/gpu/drm/tiny/ofdrm.c
> > +++ b/drivers/gpu/drm/tiny/ofdrm.c
> > @@ -1352,6 +1352,7 @@ static int ofdrm_probe(struct platform_device *pd=
ev)
> >   {
> >       struct ofdrm_device *odev;
> >       struct drm_device *dev;
> > +     unsigned int color_mode;
> >       int ret;
> >
> >       odev =3D ofdrm_device_create(&ofdrm_driver, pdev);
> > @@ -1363,7 +1364,11 @@ static int ofdrm_probe(struct platform_device *p=
dev)
> >       if (ret)
> >               return ret;
> >
> > -     drm_fbdev_generic_setup(dev, drm_format_info_bpp(odev->format, 0)=
);
> > +     color_mode =3D drm_format_info_bpp(odev->format, 0);
> > +     if (color_mode =3D=3D 16)
> > +             color_mode =3D odev->format->depth; // can be 15 or 16
> > +
> > +     drm_fbdev_generic_setup(dev, color_mode);
> >
> >       return 0;
> >   }
> > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/si=
mpledrm.c
> > index 7355617f38d3..f658b99c796a 100644
> > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > @@ -802,6 +802,7 @@ static int simpledrm_probe(struct platform_device *=
pdev)
> >   {
> >       struct simpledrm_device *sdev;
> >       struct drm_device *dev;
> > +     unsigned int color_mode;
> >       int ret;
> >
> >       sdev =3D simpledrm_device_create(&simpledrm_driver, pdev);
> > @@ -813,7 +814,11 @@ static int simpledrm_probe(struct platform_device =
*pdev)
> >       if (ret)
> >               return ret;
> >
> > -     drm_fbdev_generic_setup(dev, drm_format_info_bpp(sdev->format, 0)=
);
> > +     color_mode =3D drm_format_info_bpp(sdev->format, 0);
> > +     if (color_mode =3D=3D 16)
> > +             color_mode =3D sdev->format->depth; // can be 15 or 16
> > +
> > +     drm_fbdev_generic_setup(dev, color_mode);
> >
> >       return 0;
> >   }
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev

I know it's already in drm-misc-next, but wanted to chime in...

I've tested v4 on the Thinkpad X13s as well as the Yoga C630 WoS, both
msm based systems and this does fix the issue I was seeing as well as
make my patch not needed and can be considered abandoned.

Tested-by: Steev Klimaszewski <steev@kali.org>

Return-Path: <linux-arm-msm+bounces-26575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37A935009
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 17:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFA0B1C203F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 15:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF51E1442FD;
	Thu, 18 Jul 2024 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3GY9K87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB3613E8B6;
	Thu, 18 Jul 2024 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721317017; cv=none; b=AaWq+VTkI16JM0jgu3T4gyKP8SScFaM9VDxlFXz/tDG0jJVUaGmv7hqZn+9Wgrxv0na3VqO7wPtEdk0Xx1qwaj3W3fWZkTMV0YSTTPjnouzBxk52pyoDDfH6HQPS6jYLfA6M+zDuuCYdKTrYrNsxKOCEXwsuxI/TBgJuysKJtgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721317017; c=relaxed/simple;
	bh=0ZLne28MQFdVXHn5c4tncEFKxNsVECfQ/+GK2PHJKd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xwlz/ROsTguFWTPiFCZIFTl8z/t2FlNPNUbbYccelqhajvW+8wtoyIumtC1urglagxufQZwYDI/vJ5y/sSC2HaNDK9HE9gn53ECL3rLeweLezt/U+pl1hU97jzeZwMMFuLCxINANk91n6RKmp1lRiTZN1zTHiUs5uXJyv6K3IDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3GY9K87; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a2a90243c9so43583a12.0;
        Thu, 18 Jul 2024 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721317014; x=1721921814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVeii/OxO9OmPKHmSe8CmSnaEo17pSKoTgl51HUdVxU=;
        b=W3GY9K87+arSetk2LZBQ4yVnasr1zfBP340OBJiDA1p8K6tv5mF+nXWHlByvBxJhE/
         SCMVWMTXfZy+59nyg9bwEzOw4rZAamwBXtD9prv1Y/3jF0YBIeg0w/a1n7dgV0eNuQhk
         dd8vHmEg4chQmK7JEBKd1vVpR5pswtnnjOrrCZgKymDpATTuuH5WnFIX99l38q89ts3d
         P5PFGJoI4/wsKPoxlA5o1gFkXWARy8gzETVGOHNAhUdda8oI+2+o90MuJ12kH+x8Zs65
         vAlldtlhHJWuhSHhiO1koIJc6vdIPV2uHF2CHti1bGnhJcmHoNGt1plfZK6izaexS+91
         Fx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721317014; x=1721921814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVeii/OxO9OmPKHmSe8CmSnaEo17pSKoTgl51HUdVxU=;
        b=OoHQfSUeJdYPsrKnWBcRlf5mTBO7xq5VsEiL13relaLy66GaaE7zV0B/XZjh8+wf2Y
         1JeQ3Dr3t1WpwcZ62kTzb97fgJiTmQKyIW/vkQq6lVH+/EhDh8t252jruuywYGFDErOH
         FzQ8YNhIiDB3xFpvlgqGzjZwwM1yyF2nBs+kWCr6GcnIhigPob0gVX4rCtrSgSXgBzkW
         ukzBpxfvbWhpd+A7+UPqyq7qtjUG1M6rf6jksxiQdppAv1hERiJljPXrHBrhyOIQgqjX
         ysn5hxMTQn2fUlXv95GPFQ+hNP598NRIkZEYYYQJenlm9KYM681a1tLrIjVF0HiSlbMn
         kF7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWeK0vNnEPGmV0doAznkMwCl4k6wlmcu4cFNQVDB7Lz3jSUGgP9vx3NN5J/t7z2PDyOeLAa2RpQeV0Dav9++dGcgZH4tTwdlC/5VVfh1uBDbVmljrlYQkg+CJ6ss1d4hmMCuG7TWvRurrGIrQ==
X-Gm-Message-State: AOJu0Yz4gzB2FmKdUXUTq0P0WvIagXv8Nf3PIsXGj/SSY9H39t1W/qDA
	ToWw6hmccrWlyDu2iUiLuy+97hHU2GGhwPX0UW7fN5fuj2ORXLJU9FdeyMmo+pWQwHc14URGnaM
	ekh2UGpDRKwB/SUsk+vmmKDK9mPA=
X-Google-Smtp-Source: AGHT+IFBVJ8w2xbQHZeBGl7vKPDXYF9c+PaKm7qiUaGkAVR3bkdEWI/f9Fuq+mErnUAwA4VeMFu6xSAhuoPulh1vcBY=
X-Received: by 2002:a50:8d51:0:b0:5a1:3b03:d0cb with SMTP id
 4fb4d7f45d1cf-5a13b03d7b5mr2240672a12.32.1721317013848; Thu, 18 Jul 2024
 08:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717215847.5310-1-robdclark@gmail.com> <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com> <d5vfynn6ba4fwkaw7cegzillhw5qkl5z5huw2xb347j3tv7gnu@etgiotbc2x3r>
In-Reply-To: <d5vfynn6ba4fwkaw7cegzillhw5qkl5z5huw2xb347j3tv7gnu@etgiotbc2x3r>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Jul 2024 08:36:41 -0700
Message-ID: <CAF6AEGuTjQ2QLUmp2+LhhCwJvyNX243CvgXV5BjtuPmL7_Rvfw@mail.gmail.com>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 5:31=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Jul 17, 2024 at 06:09:29PM GMT, Rob Clark wrote:
> > On Wed, Jul 17, 2024 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Jul 17, 2024 at 2:58=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Just a guess on the panel timings, but they appear to work.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I cou=
ldn't
> > > > find any datasheet so timings is just a guess.  But AFAICT everythi=
ng
> > > > works fine.
> > > >
> > > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Given that this is a Samsung ATNA<mumble>, is there any chance it's a=
n
> > > OLED panel? Should it be supported with the Samsung OLED panel driver
> > > like this:
> > >
> > > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2=
f658a3@linaro.org
> >
> > it is an OLED panel, and I did see that patchset and thought that
> > samsung panel driver would work.  But changing the compat string on
> > the yoga dts only gave me a black screen (and I didn't see any of the
> > other mentioned problems with bl control or dpms with panel-edp).  So
> > :shrug:?  It could be I overlooked something else, but it _seems_ like
> > panel-edp is fine for this panel. Plus, it would avoid awkwardness if
> > it turned out there were other non-samsung 2nd sources, but so far
> > with a sample size of two 100% of these laptops have the same panel
> > ;-)
> >
> > But that was the reason for posting this as an RFC.  I was hoping
> > someone had some hint about where to find datasheets (my google'ing
> > was not successful), etc.
>
> Panelook has a datasheet for ATNA45DC01. It's behind a 'register new
> business email' paywall.

but it does not appear to have ATNA45DC02

fwiw, edid:

----------------
edid-decode (hex):

00 ff ff ff ff ff ff 00 4c 83 89 41 00 00 00 00
00 21 01 04 b5 1f 14 78 02 0b d1 af 51 3d b6 23
0b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 1e cc 80 50 b0 30 10 74 08 20
88 00 38 c3 10 00 00 1b 1e cc 80 50 b0 30 50 70
08 20 88 00 38 c3 10 00 00 1b 00 00 00 fe 00 53
44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 41 54 4e 41 34 35 44 43 30 32 2d 30 20 01 06

02 03 0f 00 e3 05 80 00 e6 06 05 01 8a 6a 02 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9c

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.4
  Vendor & Product Identification:
    Manufacturer: SDC
    Model: 16777
    Made in: 2023
  Basic Display Parameters & Features:
    Digital display
    Bits per primary color channel: 10
    DisplayPort interface
    Maximum image size: 31 cm x 20 cm
    Gamma: 2.20
    Supported color formats: RGB 4:4:4
    First detailed timing includes the native pixel format and
preferred refresh rate
  Color Characteristics:
    Red  : 0.6835, 0.3164
    Green: 0.2402, 0.7138
    Blue : 0.1396, 0.0439
    White: 0.3125, 0.3291
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  2944x1840   59.999173 Hz  16:10   172.798 kHz
522.540000 MHz (312 mm x 195 mm)
                 Hfront    8 Hsync  32 Hback   40 Hpol P
                 Vfront    8 Vsync   8 Vback 1024 Vpol N
    DTD 2:  2944x1840   89.998760 Hz  16:10   172.798 kHz
522.540000 MHz (312 mm x 195 mm)
                 Hfront    8 Hsync  32 Hback   40 Hpol P
                 Vfront    8 Vsync   8 Vback   64 Vpol N
    Alphanumeric Data String: 'SDC          '
    Alphanumeric Data String: 'ATNA45DC02-0 '
  Extension blocks: 1
Checksum: 0x06

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Native detailed modes: 0
  Colorimetry Data Block:
    BT2020RGB
  HDR Static Metadata Data Block:
    Electro optical transfer functions:
      Traditional gamma - SDR luminance range
      SMPTE ST2084
    Supported static metadata descriptors:
      Static metadata type 1
    Desired content max luminance: 138 (993.486 cd/m^2)
    Desired content max frame-average luminance: 106 (496.743 cd/m^2)
    Desired content min luminance: 2 (0.001 cd/m^2)
Checksum: 0x9c  Unused space in Extension Block: 112 bytes
----------------


BR,
-R


> >
> > BR,
> > -R
>
> --
> With best wishes
> Dmitry


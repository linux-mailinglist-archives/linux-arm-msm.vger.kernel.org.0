Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0DD612FD3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 20:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgACTrv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 14:47:51 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44843 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbgACTrv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 14:47:51 -0500
Received: by mail-ed1-f67.google.com with SMTP id bx28so42447862edb.11;
        Fri, 03 Jan 2020 11:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LZOZVHTb+3h6BOMb+3kqKp315cgiSfb0pLuDtSxBQBM=;
        b=i3r00vQHBL2sDAI4dtuZ/zsg+OhlwmfLKu1EbtUfmBblRf30KdraxcjZ5+9veNm9+r
         VXPC3GqUBlyAZ2xaezE8Z6qR+NXMthbazKJgnZFCBVaJXKn6Pc8UUk9iMLC+RLcPevva
         xISwU6UG214McmTcnRcRYScHJo4U/JMBIVddPkryu6S2q/4RLbaaux28wruieZHpq8Ds
         NlkXomCh4PiKX71W4UzU2WEFksc1CG6x+oS3eAUGn6nDdGR9WdrwKWNmcEFrAaayXduY
         UGlw7GHvFnPbPYChG2Uld3vGf47M7GMTPvcZ79CQ+uSkYaRr2L1tMZ/X4l282KKuzGBG
         Wspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZOZVHTb+3h6BOMb+3kqKp315cgiSfb0pLuDtSxBQBM=;
        b=k7iMmWZw3puEPbIiRlV8MwM1mbZ5CUa4aTnYS671KtSoVkuhTRJsATB8DOu56shKMR
         VO58W3fM7lCxtJg7udax7BdjsyRrR/ayuhtR+oBx8fq2ab4feyAFi0umaxwMrS5RpJec
         xQoscm/Ex5hR5apTN1eQsWQ1uI5wKh2FY3qUoFqfD3joehN+8iwov/NFpZE8BTQOHWg6
         zIiUQO7J/hn4/93liZ8tmI04xw0ROANnMXa3l6ePMvJrUcnuNeZpYvJxHt7qtSxe9AGO
         QnNSTjtZX7EbUBflV91wZpWle3XpKVJhtDmyM7HEkqG4YfyP2ZEznZIKqEEKiPoo+Gfy
         oFXQ==
X-Gm-Message-State: APjAAAXZQR2s8L1b3JFOxoH+5UQ8WNFtQ+TdVp2Db1l1wfLpMMnSX9XE
        OWbLnIeHVjgdLZ6Hk6um6VcHD/vi+cWJgDylBSc=
X-Google-Smtp-Source: APXvYqzm/Ay3X26OiUyZcxYr2sA8q0KNwmLg0kGhYCUvD0jASZvMzylVMe6yq9epmuFVENGUaj3upvLcAFe5N1iieeg=
X-Received: by 2002:a17:906:34d7:: with SMTP id h23mr17921481ejb.90.1578080869160;
 Fri, 03 Jan 2020 11:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20200103183025.569201-1-robdclark@gmail.com> <20200103183025.569201-2-robdclark@gmail.com>
 <20200103193135.GA21515@ravnborg.org>
In-Reply-To: <20200103193135.GA21515@ravnborg.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 3 Jan 2020 11:47:38 -0800
Message-ID: <CAF6AEGtdFA7XzSq3w3N6_TRLWQY+zumU2mahbsPY=pc0r_x6fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add support for AUO B116XAK01 panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 3, 2020 at 11:31 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Fri, Jan 03, 2020 at 10:30:24AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 5d487686d25c..895a25cfc54f 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -680,6 +680,35 @@ static const struct panel_desc auo_b116xw03 = {
> >       },
> >  };
> >
> > +static const struct drm_display_mode auo_b116xak01_mode = {
> > +     .clock = 69300,
> > +     .hdisplay = 1366,
> > +     .hsync_start = 1366 + 48,
> > +     .hsync_end = 1366 + 48 + 32,
> > +     .htotal = 1366 + 48 + 32 + 10,
> > +     .vdisplay = 768,
> > +     .vsync_start = 768 + 4,
> > +     .vsync_end = 768 + 4 + 6,
> > +     .vtotal = 768 + 4 + 6 + 15,
> > +     .vrefresh = 60,
> > +     .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > +};
> > +
> > +static const struct panel_desc auo_b116xak01 = {
> > +     .modes = &auo_b116xak01_mode,
> > +     .num_modes = 1,
> > +     .bpc = 6,
> > +     .size = {
> > +             .width = 256,
> > +             .height = 144,
> > +     },
> > +     .delay = {
> > +             .hpd_absent_delay = 200,
> > +     },
> > +     .bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > +     .connector_type = DRM_MODE_CONNECTOR_eDP,
> > +};
> Entries in alphabetical order - check.
> .connector_type specified - check.
> .flags and .bus_format specified - check.
> .bus_flags not specified but optional - OK.
>
> > +
> >  static const struct drm_display_mode auo_b133xtn01_mode = {
> >       .clock = 69500,
> >       .hdisplay = 1366,
> > @@ -3125,6 +3154,9 @@ static const struct of_device_id platform_of_match[] = {
> >       }, {
> >               .compatible = "auo,b133htn01",
> >               .data = &auo_b133htn01,
> > +     }, {
> > +             .compatible = "auo,b116xa01",
> > +             .data = &auo_b116xak01,
> This entry most also be in alphabetical order.
>
> >       }, {
> >               .compatible = "auo,b133xtn01",
> >               .data = &auo_b133xtn01,
>
> Please fix and resend.
>
> I am in general holding back on patches to panel-simple.
> I hope we can reach a decision for the way forward with the bindings
> files sometimes next week.

I've fixed the sort-order and the couple things you've pointed out in
the bindings.  Not sure if you want me to resend immediately or
hang-tight until the bindings discussion is resolved?

BR,
-R

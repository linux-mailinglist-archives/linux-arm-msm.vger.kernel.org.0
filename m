Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF0E5AD34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 21:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfF2T4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 15:56:17 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39624 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfF2T4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 15:56:17 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so16617164edv.6;
        Sat, 29 Jun 2019 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KEEhZe9y6Tj5RmcezO+cewOsrq7aqdui6cDX8dh2Q2k=;
        b=JdzMUl+g0sgQi4R0D+GbHLxaAa5c7AWRgFEEklS/7g6WAeoD6rJIKsdrMTwlbY9rXP
         oLHHjRu5HRgDSjiwgAgR2TdDmljNPySDVTB16UX/vaiIppKpOjBUNVG6px1Vd64zi5iz
         VIktfHa4jIIRFZVScW6Su4o6aDd3Tu+RzPh4n/KOLvxOsVZzOhoRxm7bwD3MaUfKLbpO
         UpEUmQWsHVI8E/tk4c9rVWDmqy3GcC3zlZWnnv4teHQuw2qtnZtmsL4wzWbjqyBVEnwc
         MyqiZ4WSMKt00UHmIzosXVqHIW9RPCtaZubzJw60t7vFIXOToT1Ls7e0NgNOJ0uFYSRp
         TkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KEEhZe9y6Tj5RmcezO+cewOsrq7aqdui6cDX8dh2Q2k=;
        b=AFHSiKCGytqdq2lGm5Zp1iADP2T1JVBkq8+WHP0rspFAnLFy+hQ1jnBo1WV6iibETB
         dCOf0fvtDU22O8XX2yeG5cADLD8XWHBOnwbWGljHjNfAHgWNn9GMXd+94U0UFz4O4Yn0
         zqf+hMfj5RgNv8J8Q188SsY1U4GmntT9Ci1k/lWn2LcA6fekuNBPpVJY43NKRwdgqRlg
         lBsAd0o5esUybvzsIq2PLyeYjpZq6o0AhyejuBaWKuqsiHnhZUTJggBESWEf22xy3ZDj
         bhyaoVNFo1ezfqirn6HXdgUnRGMCh6r0RA2bjvx3cZoTNPyClQu1MB3IO3Sjb3gRPUpi
         icug==
X-Gm-Message-State: APjAAAXJSoKOkffy18EoJfIW8K2wGD8/qJfOq6mvUM72XRaOloeAo1xO
        0smaNa/JBCQhSW2yKLxbdXyMM80BLi4XC+zHx6A=
X-Google-Smtp-Source: APXvYqxN8gyKudU+Xnn2u4IYRblYxfkXdpeZl+cSB3KMU/hJ1uQ2wvTMlirxK6ZIgGSs/Sn7JnpPaVq3iwWKiFzvauw=
X-Received: by 2002:a17:906:3612:: with SMTP id q18mr15527385ejb.278.1561838175538;
 Sat, 29 Jun 2019 12:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190628162831.20645-1-jeffrey.l.hugo@gmail.com> <CAF6AEGuLvgfWYdGm-0caGbWcvzt7raCWkz_sBCxFKV99YQZmeg@mail.gmail.com>
In-Reply-To: <CAF6AEGuLvgfWYdGm-0caGbWcvzt7raCWkz_sBCxFKV99YQZmeg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 29 Jun 2019 12:55:59 -0700
Message-ID: <CAF6AEGty6eJwi5ORm5z5xtC6pKe5iKiSAVLaT_++Qn_ZTX-0zw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Transition console to msm framebuffer
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 29, 2019 at 10:46 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Jun 28, 2019 at 9:28 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > If booting a device using EFI, efifb will likely come up and claim the
> > console.  When the msm display stack finally comes up, we want the
> > console to move over to the msm fb, so add support to kick out any
> > firmware based framebuffers to accomplish the console transition.
> >
> > Suggested-by: Rob Clark <robdclark@gmail.com>
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>
> lgtm,
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

and I'll also add, on yoga c630,

Tested-by: Rob Clark <robdclark@gmail.com>


>
>
> > ---
> >  drivers/gpu/drm/msm/msm_fbdev.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> > index 2429d5e6ce9f..e3836c7725a6 100644
> > --- a/drivers/gpu/drm/msm/msm_fbdev.c
> > +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> > @@ -169,6 +169,9 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
> >         if (ret)
> >                 goto fini;
> >
> > +       /* the fw fb could be anywhere in memory */
> > +       drm_fb_helper_remove_conflicting_framebuffers(NULL, "msm", false);
> > +
> >         ret = drm_fb_helper_initial_config(helper, 32);
> >         if (ret)
> >                 goto fini;
> > --
> > 2.17.1
> >

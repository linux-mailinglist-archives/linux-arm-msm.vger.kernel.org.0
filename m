Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA9F393863
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 23:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbhE0VsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 17:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhE0VsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 17:48:15 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB26C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 14:46:41 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so1620901oth.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 14:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1zVv1GjmK07EWaIPDoxGxKRBfboRr4vWM9HdAWgd8h8=;
        b=gFbhrH/lrOqgsguvnI/seGtIdQLXd0j1mB0K0q/fZNVu9/dKg42cRWlvGWBMdLcmsm
         GR0LhjRyfauN/Us2dCVxfMDz0prbbMtTpZJJjo+6Ee/old3HeprB1ckBgqS2/neIatq6
         DXeRV+iVk5XYHVkdu0Vcf+TzEWtQYMSmh4Myk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1zVv1GjmK07EWaIPDoxGxKRBfboRr4vWM9HdAWgd8h8=;
        b=mp1ihmdMN7SeFf8fuprDswtvvy5M5k0bDMH7qgxe8cOrTLTyUH8pQrwcz4QdCURBmJ
         r9+JfEplJv8RhrNw02ruvSG989r1jAYjOcdSh1C5K+dxMuwF6UyO9JD22rNE/nUUF6sh
         FcusQG+RSHLF38JXZueHpq+2ltw0d/xmRXgYvElH3GTWhn0lUp9VVlsI5BJkGcqAeZyx
         ibVPrdFQW8EfRDldczkteCaYJXhabjc89B/nZXXgkJt/lIw7qqGUcJ7hgbyy5pKdt2vk
         N1s/HrvHDRLZXebNyxTr0PgA5X3+XLw/cP9MvZjVUaVa940vYlUq13ynTIHekNHxJWo7
         a45g==
X-Gm-Message-State: AOAM531Peejk7cyOLx/OG8743Shtmda2CV5YhgTt/8BdMM+c1k5HT5yp
        Za1R7QbJTqTEdeiGacUcz1yQ3tj/6WXMiA==
X-Google-Smtp-Source: ABdhPJzRnlFDGibTgkAyOnA0SIh5ZjDTDCW73oDQsCXMiKKHnIgvhN20nLNRZ9lp1E0X8ZmPF3uXiA==
X-Received: by 2002:a9d:4b0c:: with SMTP id q12mr4615884otf.49.1622152000625;
        Thu, 27 May 2021 14:46:40 -0700 (PDT)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com. [209.85.161.45])
        by smtp.gmail.com with ESMTPSA id m1sm751371otk.33.2021.05.27.14.46.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 14:46:40 -0700 (PDT)
Received: by mail-oo1-f45.google.com with SMTP id s20-20020a4ae9940000b02902072d5df239so463691ood.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 14:46:40 -0700 (PDT)
X-Received: by 2002:a25:8191:: with SMTP id p17mr7998436ybk.405.1622151679762;
 Thu, 27 May 2021 14:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
 <CAD=FV=WzQ0Oc=e3kmNeBZUA+P1soKhBk8zt7bG1gqJ-Do-Tq_w@mail.gmail.com> <42db3a26684a5329287d57e1e78d0475@codeaurora.org>
In-Reply-To: <42db3a26684a5329287d57e1e78d0475@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 May 2021 14:41:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UuWuKibpT15McweuZ24qxsSAsSvJ3Q2MbZqgw5oggBVQ@mail.gmail.com>
Message-ID: <CAD=FV=UuWuKibpT15McweuZ24qxsSAsSvJ3Q2MbZqgw5oggBVQ@mail.gmail.com>
Subject: Re: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        mkrishn@codeaurora.org, Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 27, 2021 at 5:21 AM <rajeevny@codeaurora.org> wrote:
>
> >> @@ -171,6 +172,19 @@ struct panel_desc {
> >>
> >>         /** @connector_type: LVDS, eDP, DSI, DPI, etc. */
> >>         int connector_type;
> >> +
> >> +       /**
> >> +        * @uses_dpcd_backlight: Panel supports eDP dpcd backlight
> >> control.
> >> +        *
> >> +        * Set true, if the panel supports backlight control over eDP
> >> AUX channel
> >> +        * using DPCD registers as per VESA's standard.
> >> +        */
> >> +       bool uses_dpcd_backlight;
> >> +};
> >> +
> >> +struct edp_backlight {
> >> +       struct backlight_device *dev;
> >
> > Can you pick a name other than "dev". In my mind "dev" means you've
> > got a "struct device" or a "struct device *".
>
> In the backlight.h "bd" is used for "struct backlight_device". I can use
> "bd"?

That would be OK w/ me since it's not "dev". In theory you could also
call it "base" like panel-simple does with the base class drm_panel,
but I'll leave that up to you. It's mostly that in my brain "dev" is
reserved for "struct device" but otherwise I'm pretty flexible.


> >> +       struct drm_edp_backlight_info info;
> >>  };
> >>
> >>  struct panel_simple {
> >> @@ -194,6 +208,8 @@ struct panel_simple {
> >>
> >>         struct edid *edid;
> >>
> >> +       struct edp_backlight *edp_bl;
> >> +
> >
> > I don't think you need to add this pointer. See below for details, but
> > basically the backlight device should be in base.backlight. Any code
> > that needs the containing structure can use the standard
> > "container_of" syntax.
> >
>
> The documentation of the "struct drm_panel -> backlight" mentions
> "backlight is set by drm_panel_of_backlight() and drivers shall not
> assign it."
> That's why I was not sure if I should touch that part. Because of this,
> I added
> backlight enable/disable calls inside panel_simple_disable/enable().

Fair enough. In my opinion (subject to being overridden by the adults
in the room), if you move your backlight code into drm_panel.c and
call it drm_panel_dp_aux_backlight() then it's fair game to use. This
basically means that it's no longer a "driver" assigning it since it's
being done in drm_panel.c. ;-) Obviously you'd want to update the
comment, too...


> >> +               err = drm_panel_of_backlight(&panel->base);
> >> +               if (err)
> >> +                       goto disable_pm_runtime;
> >> +       }
> >
> > See above where I'm suggesting some different logic. Specifically:
> > always try the drm_panel_of_backlight() call and then fallback to the
> > AUX backlight if "panel->base.backlight" is NULL and "panel->aux" is
> > not NULL.
>
> What I understood:
> 1. Create a new API drm_panel_dp_aux_backlight() in drm_panel.c
> 1.1. Register DP AUX backlight if "struct drm_dp_aux" is given and
>      drm_edp_backlight_supported()
> 2. Create a call back function for backlight ".update_status()" inside
> drm_panel.c ?
>    This function should also handle the backlight enable/disable
> operations.
> 3. Use the suggested rules to call drm_panel_dp_aux_backlight() as a
> fallback, if
>     no backlight is specified in the DT.
> 4. Remove the @uses_dpcd_backlight flag from panel_desc as this should
> be auto-detected.

This sounds about right to me.

As per all of my reviews in the DRM subsystem, this is all just my
opinion and if someone more senior in DRM contradicts me then, of
course, you might have to change directions. Hopefully that doesn't
happen but it's always good to give warning...

-Doug

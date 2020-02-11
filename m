Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFFC715941E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 17:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgBKP77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 10:59:59 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:44370 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728389AbgBKP77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 10:59:59 -0500
Received: by mail-io1-f66.google.com with SMTP id z16so12269527iod.11;
        Tue, 11 Feb 2020 07:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9yyotndcLhvUKHC5GDiLNlYrWJmGfmUU1jrbauqKqrw=;
        b=bRMRCR8oY9RFO5yYVwxFSVaEFSLu7eMobI6WkVrdMWmn1fF8mC2oPP75BDVReMKHqO
         gOvFHPKRuWxVGzMpbjPO51vL3zSa9cEcp7Ee8VO6wdUEnmQEFzeHboPSV8H9e0zTJyA1
         dDtUnOLnqTac3hlWF0mQTuuvRrgT9AdhG3ac0Nm6oi9FS6C/Hkd4N0/lisIHAXHz0CM5
         hhKN8NCyUijGCoarBqU6EDfcDs+aqYuxXP55PX2TJHSBqxawBE7l5pqd2Ag+cYxxRdug
         pkHH2hk1S8foGsylqyDjG/ITdVfSI4bKw8CuAbD9eLi/+BJmRgqz8N9zb2Y8I6wPBdm7
         5XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9yyotndcLhvUKHC5GDiLNlYrWJmGfmUU1jrbauqKqrw=;
        b=UHL1zcYpJeVNwhzYIrK+KxEo+z+uD0M3avBCgSODrXHDDzh5hDHS65v5hrJCA9K7+v
         Leah0ii1aJxMWhh9t/IWlCWy9KrV6RoFYece9XK3qhEbJnjb16oCIuAMMVf+NznSTSTe
         /8t6Z0bUyMAM+LAMpI2RhQQ6C56gk6KzXvu5Fn9tklk9cTTduD86nRYpIyBESPbBy2Az
         iS39Ir00qBt1qKUJE4AEDMWWVC/JvD4qtogIum7/sd+e1Sv1nZf2EntAYLBcX0+JAaTa
         MpRObGYi617C5ac9OjWSkBXUkBhYV2ba9g0yZnwVILaozurgCGc1hUYAheYkxUdObSen
         593g==
X-Gm-Message-State: APjAAAXeX7fYFglcteHtImqWBJu7chpOLUmDk9xwMbF+Z6WGAF+v27mC
        EBm1MygcXaPkTYdyDCuvNHDKHUisRB3/ZUHRPfo=
X-Google-Smtp-Source: APXvYqzRgDSxtpGoPVVkFNDjDpnOEbay2M89fpnAYpRCiHPDQf41hjNJcWT+m5zGf6F3a1WQILXy8TFaYzj1gZKv58U=
X-Received: by 2002:a6b:6205:: with SMTP id f5mr14270198iog.42.1581436797145;
 Tue, 11 Feb 2020 07:59:57 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org> <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
 <1d201377996e16ce25acb640867e1214@codeaurora.org> <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
In-Reply-To: <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 11 Feb 2020 08:59:46 -0700
Message-ID: <CAOCk7NrH6hWiHL29_DozXcXrXhkCaZ6LTCtJUrvqtXc=nQuLrg@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
To:     Rob Clark <robdclark@gmail.com>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 11, 2020 at 8:44 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Feb 10, 2020 at 9:58 PM <harigovi@codeaurora.org> wrote:
> >
> > On 2020-02-07 19:40, Jeffrey Hugo wrote:
> > > On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
> > >>
> > >> On 2020-02-06 20:29, Jeffrey Hugo wrote:
> > >> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
> > >> > wrote:
> > >> >>
> > >> >> For a given byte clock, if VCO recalc value is exactly same as
> > >> >> vco set rate value, vco_set_rate does not get called assuming
> > >> >> VCO is already set to required value. But Due to GDSC toggle,
> > >> >> VCO values are erased in the HW. To make sure VCO is programmed
> > >> >> correctly, we forcefully call set_rate from vco_prepare.
> > >> >
> > >> > Is this specific to certain SoCs? I don't think I've observed this.
> > >>
> > >> As far as Qualcomm SOCs are concerned, since pll is analog and the
> > >> value
> > >> is directly read from hardware if we get recalc value same as set rate
> > >> value, the vco_set_rate will not be invoked. We checked in our idp
> > >> device which has the same SOC but it works there since the rates are
> > >> different.
> > >
> > > This doesn't seem to be an answer to my question.  What Qualcomm SoCs
> > > does this issue apply to?  Everything implementing the 10nm pll?  One
> > > specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
> > > so I'm interested to know what is the actual impact here.  I don't see
> > > an "IDP" SoC in the IP catalog, so I really have no idea what you are
> > > referring to.
> >
> >
> > This is not 10nm specific. It is applicable for other nms also.
> > Its specific to the frequency being set. If vco_recalc returns the same
> > value as being set by vco_set_rate,
> > vco_set_rate will not be invoked second time onwards.
> >
> > For example: Lets take below devices:
> >
> > Cheza is based on SDM845 which is 10nm only.
> > Clk frequency:206016
> > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1236096000
> > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1236095947
> >
> > Trogdor is based on sc7180 which is also 10nm.
> > Clk frequency:69300
> > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663200000
> > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663200000
> >
> > In same trogdor device, we slightly changed the clock frequency and the
> > values actually differ which will not cause any issue.
> > Clk frequency:69310
> > dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663440000
> > dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663439941
>
>
> tbh, loosing state when power is off is kind of the behavior that I'd
> expect.  It kinda makes me wonder if things are not getting powered
> off all the way on some SoCs?
>
> jhugo, are you worried that this patch will cause problems on other
> users of the 10nm pll?

Essentially yes.  Conceptually it doesn't seem like this change should
cause any harm, however -

This sounds like we are trying to work around the clk framework, which
seems wrong.  It feels like we should be able to set a clk flag for
this and make the framework deal with it.

Also, this fix is 10nm specific, yet this issue affects all
implementations?  Seems like this should perhaps be in common code so
that we don't need to play whack-a-mole by fixing every implementation
piecemeal.

Finally, the PLLs are notorious for not taking a configuration unless
they are running.  I admit, I haven't looked at this patch in detail
to determine if that is the case here, but there doesn't seem to be
any indication from the commit test or a comment that doing so is
actually valid in all cases.

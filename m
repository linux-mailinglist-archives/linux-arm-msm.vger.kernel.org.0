Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BACF415937C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 16:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgBKPoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 10:44:22 -0500
Received: from mail-ed1-f43.google.com ([209.85.208.43]:45033 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727962AbgBKPoW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 10:44:22 -0500
Received: by mail-ed1-f43.google.com with SMTP id g19so5157361eds.11;
        Tue, 11 Feb 2020 07:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xlR00ADJradjotkCl4UlmMojkVu0xcxZBqzsuQumm74=;
        b=NvQExPCB8DI0IP1gFi+4sXuJgnDnc+3sGrABcCQBUhEtdW8umNWi+t6DLqUPNGUeCK
         +2Fo1BxAKf9Ge7XhKz0zsotmk3csdx0+aPVkukynRe0EUzkmvsRViU4D71ZYDFtnj86Q
         g3jqxsr8lTzrutSK3BNOyGpevnnnWU+qUZuxplWXAkvlgvm+mGS2e6uoZzslvqJ86mTS
         to4PLxgKuZS5+2D7SttIzvMzyl8v9YPdyNeLJdICpVJ2t36bCNV6O4Nkf29KFl9yrt4P
         VdHGJUulikhpW5WwkpQF3vYcZROgf72tQ09vs5ydiDKiMjgq0Cq9GM5CFHRHF8wzzW5F
         as6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xlR00ADJradjotkCl4UlmMojkVu0xcxZBqzsuQumm74=;
        b=SMl5Zu4w1wTLSdtKHmtWlbnmAszmWsTCOV5kXz1fhpm4cItRq97GRfKFq7uo/6mL9X
         q1uos7JmRGKBPv8dRzWqg9hZqCDlmslb6J3yr2KbjkPsJbB3gQUTtsMQiQJRZiLxQfU6
         5vGVpw3htb2S4kA63Y6j3/ZLUjZXJ9P0XWZBfJdPZQEDEsfcLpaD8qFjeThUK5yiHwkO
         8vzGPiVFu0uDBVQs9o6KRFz+0ZyXI1e0dqVTeyMAw9iqkHzdB+/gmeHRy3iXiXVoWMTC
         CVpOhe+MMmHAyKQ407FCXlO6ob3ZvgX2iP47FlH4maNPHdb11AuGTKFtQvDStZ6JQEgr
         JWFg==
X-Gm-Message-State: APjAAAW2kmtQADOf/oKmkWeMfzSTbJ7B0PBFnUpWsi6J4H+UCsrh/DjJ
        3577snIB4CChfVJjOgxCTaptbBBX2rc9bEVMjjo=
X-Google-Smtp-Source: APXvYqyCzdecpsQM0lw4triJNxJwSEFMbxi4XZz3qtjCH0Quta/P/aV1VGix4DQ+ffz64Nm+arwNBPjkvBa9ztigP+U=
X-Received: by 2002:aa7:c6c5:: with SMTP id b5mr6258346eds.281.1581435860509;
 Tue, 11 Feb 2020 07:44:20 -0800 (PST)
MIME-Version: 1.0
References: <1580980321-19256-1-git-send-email-harigovi@codeaurora.org>
 <CAOCk7Nr9n-xLtWq=LEM-QFhJcY+QOuzazsoi-yjErA9od2Jwmw@mail.gmail.com>
 <2f5abc857910f70faa119fea5bda81d7@codeaurora.org> <CAOCk7NoCH9p9gOd7as=ty-EMeerAAhQtKZa8f2wZrDeV2LtGrw@mail.gmail.com>
 <1d201377996e16ce25acb640867e1214@codeaurora.org>
In-Reply-To: <1d201377996e16ce25acb640867e1214@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 11 Feb 2020 07:44:09 -0800
Message-ID: <CAF6AEGu8265DWN-XABwR1N-124m1j=EkgeNDEWZ16TVpSCZSZw@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi/pll: call vco set rate explicitly
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
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

On Mon, Feb 10, 2020 at 9:58 PM <harigovi@codeaurora.org> wrote:
>
> On 2020-02-07 19:40, Jeffrey Hugo wrote:
> > On Fri, Feb 7, 2020 at 5:38 AM <harigovi@codeaurora.org> wrote:
> >>
> >> On 2020-02-06 20:29, Jeffrey Hugo wrote:
> >> > On Thu, Feb 6, 2020 at 2:13 AM Harigovindan P <harigovi@codeaurora.org>
> >> > wrote:
> >> >>
> >> >> For a given byte clock, if VCO recalc value is exactly same as
> >> >> vco set rate value, vco_set_rate does not get called assuming
> >> >> VCO is already set to required value. But Due to GDSC toggle,
> >> >> VCO values are erased in the HW. To make sure VCO is programmed
> >> >> correctly, we forcefully call set_rate from vco_prepare.
> >> >
> >> > Is this specific to certain SoCs? I don't think I've observed this.
> >>
> >> As far as Qualcomm SOCs are concerned, since pll is analog and the
> >> value
> >> is directly read from hardware if we get recalc value same as set rate
> >> value, the vco_set_rate will not be invoked. We checked in our idp
> >> device which has the same SOC but it works there since the rates are
> >> different.
> >
> > This doesn't seem to be an answer to my question.  What Qualcomm SoCs
> > does this issue apply to?  Everything implementing the 10nm pll?  One
> > specific SoC?  I don't believe I've seen this on MSM8998, nor SDM845,
> > so I'm interested to know what is the actual impact here.  I don't see
> > an "IDP" SoC in the IP catalog, so I really have no idea what you are
> > referring to.
>
>
> This is not 10nm specific. It is applicable for other nms also.
> Its specific to the frequency being set. If vco_recalc returns the same
> value as being set by vco_set_rate,
> vco_set_rate will not be invoked second time onwards.
>
> For example: Lets take below devices:
>
> Cheza is based on SDM845 which is 10nm only.
> Clk frequency:206016
> dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1236096000
> dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1236095947
>
> Trogdor is based on sc7180 which is also 10nm.
> Clk frequency:69300
> dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663200000
> dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663200000
>
> In same trogdor device, we slightly changed the clock frequency and the
> values actually differ which will not cause any issue.
> Clk frequency:69310
> dsi_pll_10nm_vco_set_rate - DSI PLL0 rate=1663440000
> dsi_pll_10nm_vco_recalc_rate - DSI PLL0 returning vco rate = 1663439941


tbh, loosing state when power is off is kind of the behavior that I'd
expect.  It kinda makes me wonder if things are not getting powered
off all the way on some SoCs?

jhugo, are you worried that this patch will cause problems on other
users of the 10nm pll?

BR,
-R

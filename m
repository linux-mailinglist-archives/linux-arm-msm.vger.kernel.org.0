Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E25262FB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 16:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730531AbgIIOZr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 10:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729298AbgIIM7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 08:59:30 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9C4C06179B
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 05:48:41 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id e41so815768uad.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q9M1Vskts4JRHY9FBKuy5Sl90Ew3XMdMRCLYYCvUArU=;
        b=Ir+Aia3k1phkbjo07kIy3KryziEAUctzOrRfSX0hHbEaIIaFzvCIHoB6CfDuJY7T2n
         cNbGu0p3qDNT60dSu4TPUyPjir0s+gOl2VwwnvNVL9Nnq0x8pLYNyTwysa54ofQ6hZTr
         S/V2zmAsJ4IhxygFVxkZGwF/fH7EQg3/OHK8NrhRGWuRxvT96z/OJur4wjDewVY5+UeM
         7tpi51C47+E2EM9oPhzZlPDDk/j3TM96dqWItzfBKv6Oq5cVYioygMpGXrHyKJ5la7QU
         7+YQMJKbvbjIkezmrtAgpGKLnP0PHEHbeINRKBjlOHjNJpuiaEnpcBLb3SXm9k/4bNV4
         wi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q9M1Vskts4JRHY9FBKuy5Sl90Ew3XMdMRCLYYCvUArU=;
        b=eLXex8uQHSVxiB4aCPcT7vbCTexjEXrtRbUpb7s6BqGSgDtUaA/BNfAGuGYayWLyRs
         oV/d1KudjLt1pUpcqVHJxKChH35F7XI7scn/EcSFiNio1aibRe7dNmSfFRhG00EzIa7N
         zjlgkPZS5F4yjxaptHtV+DFwK2JgpXCo/mmk86NYraM9Lg9hOewfjL06ZDp/haU/kF+Y
         zxY4F0cowIklXPC3zb/7mJ2dokv/SuVXhLJILUGUQv9Ps2iTq4GkpKoYihuTZHkJZnXV
         tQm63jyzd4gflkdv77HnoANLOR01kHRGvDrE+zjFbPllp3maReVhfD1Q37KxnV2RJts+
         FEBg==
X-Gm-Message-State: AOAM532zpkZUtzOW6ng+vwdQ6QKFA8PQvNbU/mTjbspYpvf0URzdMT4o
        oOHUPwVf6AKWMJYwUyb+81+W+avQF7gogiR3OpG6LA==
X-Google-Smtp-Source: ABdhPJwdE+navQ2r6yXbpY92vwAATdTQhd3CubjjUMOOk3FM3FdxGXP5NUGBX80ycQbG1aS7lVhw7lyGqD/GlOFmbG0=
X-Received: by 2002:ab0:2ea1:: with SMTP id y1mr368999uay.104.1599655720008;
 Wed, 09 Sep 2020 05:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598594714.git.viresh.kumar@linaro.org> <1d7c97524b9e1fbc60271d9c246c5461ca8a106c.1598594714.git.viresh.kumar@linaro.org>
 <CAPDyKFpdZhzXQv3hpTzf3UkJDhFqBhgMXCqVfAfE6PejLCxvfg@mail.gmail.com>
 <20200831104453.ux5fb5bpt57tj5am@vireshk-i7> <CAPDyKFp1fCE3bBKngcia1LBKHEkQRoVzUwZYE6+Y++Hu=6aJfw@mail.gmail.com>
 <20200909110707.jv2beta5rdr3wux3@vireshk-i7>
In-Reply-To: <20200909110707.jv2beta5rdr3wux3@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Sep 2020 14:48:03 +0200
Message-ID: <CAPDyKFr-u31Z=uqJj1q8BK0Xi7paWaKdXyU_G7tA5G=wpS+AXg@mail.gmail.com>
Subject: Re: [PATCH V2 4/8] mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Sep 2020 at 13:07, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 31-08-20, 12:57, Ulf Hansson wrote:
> > On Mon, 31 Aug 2020 at 12:45, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 28-08-20, 10:43, Ulf Hansson wrote:
> > > > On Fri, 28 Aug 2020 at 08:08, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > >
> > > > > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > > > > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > > > > the device). And we can call dev_pm_opp_of_remove_table()
> > > > > unconditionally here.
> > > > >
> > > > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > > >
> > > > Replaced v1 with v2 on my next branch, thanks!
> > > >
> > > > Just to be sure, this patch doesn't depend on any changes for the opp
> > > > core that are queued for v5.10?
> > >
> > > The recent crashes reported by Anders and Naresh were related to a OPP
> > > core bug, for which I have just sent the fix here:
> > >
> > > https://lore.kernel.org/lkml/922ff0759a16299e24cacfc981ac07914d8f1826.1598865786.git.viresh.kumar@linaro.org/
> > >
> > > This is already tested by Naresh now and finally everything works as
> > > expected.
> > >
> > > I am going to get this fix merged in 5.9-rc4, but we do have a
> > > dependency now with that fix.
> > >
> > > What's the best way to handle this stuff now ? The easiest IMO would
> > > be for me to send these patches through the OPP tree, otherwise people
> > > need to carry this and the OPP fix (for which I can provide the
> > > branch/tag).
> >
> > No need for a tag/branch to be shared. Instead I am simply going to
> > defer to pick up any related changes for mmc, until I can rebase my
> > tree on an rc[n] that contains your fix.
> >
> > When that is possible, please re-post the mmc patches.
>
> The dependency patch got merged in 5.9-rc4. Do you still want me to
> resend this patch or you can apply it directly from here ?

Please re-submit, then I will pick it from the patchtracker.

Kind regards
Uffe

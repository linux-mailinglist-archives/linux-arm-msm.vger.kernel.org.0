Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F751ABB6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 10:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502371AbgDPIhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 04:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502496AbgDPIfd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 04:35:33 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB78C03C1A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 01:24:26 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id t189so224757vst.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/TaBcNBr0LmHmhCu1jIrvYkIUcv+feENwdQ/ZDbQJes=;
        b=YUjM35XZNkCke18ASEVQzu3oQOeQ67Z70V6beRoVND6LL9BBZ+3//1papRDqvwu0ET
         tQ4NufGIlbdwNCmPwdQqkrrAGiSSOTwPtFR2mLdFrRsMdTb/QsflO8TZ31VhqZvny3hN
         2PY6Cv1TAFkYPf9Nq55TNDQPdM4CZR5yFLfriuIVACuwdRMuBTL30ZcSh7fdpzH/kx9O
         RhlOJjOCIABO8hrrWqJxxEjlfDg6y8EUdm2J6ym3mBDh+tfwsoQsvgh9yO0sq1KeYq+5
         uyrbZ/Ek1LmsVDH01d/yEhBpQbbbwwR/FtG9PpLOjjaRQWuShfKBQmS3yqjb/oBDsOgf
         Vjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/TaBcNBr0LmHmhCu1jIrvYkIUcv+feENwdQ/ZDbQJes=;
        b=cEXyW3OHYNd34Ch1iwZtl2FBu6bkRo9tnTjIYom8fnV1ZYBv7lpiSINOn4Z17PU4dO
         KfH+ncd9ij6HJLHP0PtIGRX3vwIc0YjsZbB+XdBid10caoPt749YstjTo1YJEUHIYlat
         MbaVU60ie0lkixftzDXsVujbbozPTbG+lu4o8ZI0lwKOtD/AMSEcM07SGQ++868Rij/C
         jMom4iXWX+SkK02SuPz5f09+qf9sFu5ATuuCNSOoQHUI1GJC8cVKdGND011Ov+9BuIBB
         SlkyO4EglAAIDPg6joYle9pzyJKWTHgLGJ5qUGF1zt1gvV+Ozz6WpNylp4PUaPyjBsGP
         XjTg==
X-Gm-Message-State: AGi0Pubo98SraYUURJrlPs0ci9PWogv5rBV44oCV1rxAyA/0A2dfv2rp
        6MwRoBY8aCXEsM16syKAx9T/zRGEr4dzQ4maLZclXsOU
X-Google-Smtp-Source: APiQypLB3ByHxPcUtZOdM+rFhnnuQHeltCT3o4Wld28Z33lBkBrgQXNCizCw/78zmL5SElkXmD9y+IsRZr/CeHWIJLY=
X-Received: by 2002:a67:11c4:: with SMTP id 187mr8059654vsr.34.1587025465228;
 Thu, 16 Apr 2020 01:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-14-git-send-email-rnayak@codeaurora.org>
 <CAPDyKFrOFOLCWHu8nE4i5t=d+Ei-kcJ15_42Ft3ROSUDe5jkpw@mail.gmail.com> <3e5f8e78-7cd1-30fb-e005-78c1e7111794@codeaurora.org>
In-Reply-To: <3e5f8e78-7cd1-30fb-e005-78c1e7111794@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 16 Apr 2020 10:23:49 +0200
Message-ID: <CAPDyKFrD7sh4gnbX8B2j22h18T=7ZRGCc_RYXd0ePm2fZwDcVA@mail.gmail.com>
Subject: Re: [PATCH 13/21] mmc: sdhci-msm: Use OPP API to set clk/perf state
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Apr 2020 at 18:43, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
>
> On 4/15/2020 7:22 PM, Ulf Hansson wrote:
> > On Wed, 8 Apr 2020 at 15:48, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >>
> >> On some qualcomm SoCs we need to vote on a performance state of a power
> >> domain depending on the clock rates. Hence move to using OPP api to set
> >> the clock rate and performance state specified in the OPP table.
> >> On platforms without an OPP table, dev_pm_opp_set_rate() is eqvivalent to
> >> clk_set_rate()
> >>
> >> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> >> Cc: Pradeep P V K <ppvk@codeaurora.org>
> >> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> >> Cc: Subhash Jadavani <subhashj@codeaurora.org>
> >> Cc: linux-mmc@vger.kernel.org
> >
> > This looks good to me!
> >
> > However, are there any of the other patches in the series that
> > $subject patch depends on - or can I apply this as a standalone mmc
> > patch?
>
> Hey Ulf, thanks for the review. I'll just need to respin these to make
> sure I do not do a dev_pm_opp_of_remove_table() if dev_pm_opp_of_add_table()
> isn;t successful as discussed with Viresh on another thread [1]
>
> As for the dependencies, its only PATCH 01/21 in this series and that's
> already been queued by Viresh [2]

I see, thanks!

Looks like Viresh is sending it to be included for v5.7-rc2, so I can
pick your new version of $subject patch next week.

[...]

Kind regards
Uffe

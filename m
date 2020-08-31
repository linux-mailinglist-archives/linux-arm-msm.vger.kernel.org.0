Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5EA2577D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 12:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgHaK6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 06:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgHaK6P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 06:58:15 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5161BC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 03:58:14 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id p185so2963381vsp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 03:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nb3cs3W2I9yxQBIg3cdHDlV7kIJB+7DEi6PeKTo8Eug=;
        b=FWfmKzY8I4/to8pNWD+NRmED0JdcgjGghZCt02Q/PD2WPltmddNnEU7gh9Yiai14nc
         5h02XEuhqDhrTPOFUO/jMmv6W2EHW1IArLgTQJ+Sc/+vACeFQN6fT7sYeVPwiLOBhSj6
         kpuETe5M0yfTLShfo0XhaW1RCGbqmCYBl2rx4o0sm6zxS5tF1l4rNjgsZq4sfpGZXD2M
         0NLBlph1iU+t1j7PGe9HdpA7hdYobAJt2ag2kLqU1EsmSuBi/TSNHAlkc+9QhyTIGfpG
         H0Pu8zTVR2cfljtJUd5zZkb+Kfdyxj4/hW9QNaJS+avJDDLzfZ5bv3udlqA28rqDjeBh
         sDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nb3cs3W2I9yxQBIg3cdHDlV7kIJB+7DEi6PeKTo8Eug=;
        b=a0q61eDK39yjEv8hmmI8f0hw2xnI1FDt8EfseSLK7ClW9rLvjllau3JRSyrHTJ1kOM
         O9LSYA1u8eHxSIdMKaxQWu6qNZ3xKDO0g1GR5CO3v7J5cxtQeHkjmzTwMbiEPcdbt9hX
         3VJa8swN+k5YQNDJ7eplMI8ubpVtiIsbk5vaPPb0xcXRvh/Jo5/jgrWGWfjneWc0beyD
         ocGN/q0LtVWRqLTb8aXj5Mc1PgGn23AcU00eFAe/CXQPKjwZC1M0LlWCeRpJUs2vOLrD
         5t8LMjNTqAAnOcwPXRT5ZVP5eAtQCV8g+zz3q97A1adawEYskbSpNCx8f1IgCdngCASX
         ydLw==
X-Gm-Message-State: AOAM533zLE+zcR1++6ny6EnFemC1jIIBa9IqXGrb2bGa/cTMezWeWm4S
        4F5rclzlPi4Ei9U1bZSbij2aCVly1jizb7MldKpKUQ==
X-Google-Smtp-Source: ABdhPJwAM6SX62N09ud6DGQlvIZyV+WjRiF2eKERvJGlTG7C+O5xt0gwAmiMgQUZbjyRUjEQwt7NFwqBL8NyDQy4oTk=
X-Received: by 2002:a67:7c4e:: with SMTP id x75mr445921vsc.60.1598871492254;
 Mon, 31 Aug 2020 03:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598594714.git.viresh.kumar@linaro.org> <1d7c97524b9e1fbc60271d9c246c5461ca8a106c.1598594714.git.viresh.kumar@linaro.org>
 <CAPDyKFpdZhzXQv3hpTzf3UkJDhFqBhgMXCqVfAfE6PejLCxvfg@mail.gmail.com> <20200831104453.ux5fb5bpt57tj5am@vireshk-i7>
In-Reply-To: <20200831104453.ux5fb5bpt57tj5am@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 31 Aug 2020 12:57:35 +0200
Message-ID: <CAPDyKFp1fCE3bBKngcia1LBKHEkQRoVzUwZYE6+Y++Hu=6aJfw@mail.gmail.com>
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

On Mon, 31 Aug 2020 at 12:45, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 28-08-20, 10:43, Ulf Hansson wrote:
> > On Fri, 28 Aug 2020 at 08:08, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > > the device). And we can call dev_pm_opp_of_remove_table()
> > > unconditionally here.
> > >
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Replaced v1 with v2 on my next branch, thanks!
> >
> > Just to be sure, this patch doesn't depend on any changes for the opp
> > core that are queued for v5.10?
>
> The recent crashes reported by Anders and Naresh were related to a OPP
> core bug, for which I have just sent the fix here:
>
> https://lore.kernel.org/lkml/922ff0759a16299e24cacfc981ac07914d8f1826.1598865786.git.viresh.kumar@linaro.org/
>
> This is already tested by Naresh now and finally everything works as
> expected.
>
> I am going to get this fix merged in 5.9-rc4, but we do have a
> dependency now with that fix.
>
> What's the best way to handle this stuff now ? The easiest IMO would
> be for me to send these patches through the OPP tree, otherwise people
> need to carry this and the OPP fix (for which I can provide the
> branch/tag).

No need for a tag/branch to be shared. Instead I am simply going to
defer to pick up any related changes for mmc, until I can rebase my
tree on an rc[n] that contains your fix.

When that is possible, please re-post the mmc patches.

Kind regards
Uffe

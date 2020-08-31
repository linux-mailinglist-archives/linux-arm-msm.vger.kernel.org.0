Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1250025778D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 12:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgHaKpK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 06:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgHaKpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 06:45:06 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A71C061236
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 03:45:06 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h2so2850333plr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LTjNuf+4HDb4ylh7ga9ASwLKTNx5USoQDR62ZwnBw0Q=;
        b=QPVXhTnBxUmkPbv3F29VXSio/tiyHbxa5KkZd80nOptWc/leJh9X9TjcMzoOjC60iP
         VgGn4GjhV2GWkcnuf8pvbmSELvngSJ/PGInoQL2f8QAYG6K/cbDPxUdFeAoOjUwYtvCn
         ZmTy1yyraKhtleKUrGW0nrOm55Pqr28ikFCFGmpULITULAfxe/zRECVmNWJg94UyeU7t
         fW9aqY4F63qj7HxzzqJxM50sw6sTk581rQAczy7+JJD5LDskTedWs33i19BNUjlY7wy+
         xkfKkaDCk6ZLsUrpHgLolyojtTZa+SNbDw4zF3RK1jbc7qX+qpSxXw57SShdFKpLxVSG
         +WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LTjNuf+4HDb4ylh7ga9ASwLKTNx5USoQDR62ZwnBw0Q=;
        b=gS3oQDFPhSmA+flM3aZ6GD0MZst796HYsmB9Z2m5nlGvHSMR1uobkPMHlcuJ/ssE01
         LrWgHRkoQPvDVmL7aDdr7rWlrmWfvxjHItFTJNwCTmKB28f2d5/cD5202Ig3kVbfZ5cI
         cMbE3VxWyKoYJgmsvL8h2yBjoAUYvOlzns0iFR0DnJNj9p4KUeIa2ozigO1antQokCnZ
         QaIXyM3z2wWm1bCVpErR9Hv+Dp7ViGgTMtOZGW7mFObdKQ1DMguHgpjmYqv4WhESt2gn
         SM3o+a9vIJNHxhXmA3UJtEwxFZ94oC7WpZA/+qt/1U6sW3qvT8IJIxkjMq8rrC9vZMz2
         XLJw==
X-Gm-Message-State: AOAM530LqnLOwXLZv1Z1fSwItsze+gQrVS20oIL7P4a/hAGV3meylqDn
        8YMoL66IsnBgTFh45QZj6XtFhw==
X-Google-Smtp-Source: ABdhPJygxplFkMGZQpt6GSdWy76OfK4XavrXsjjZzwVY6vR5cyeAHdXL7iFT8xF5Nap5B/MxOmM9iQ==
X-Received: by 2002:a17:902:44f:: with SMTP id 73mr600714ple.178.1598870705884;
        Mon, 31 Aug 2020 03:45:05 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id t20sm6747600pjg.21.2020.08.31.03.45.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 03:45:04 -0700 (PDT)
Date:   Mon, 31 Aug 2020 16:14:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
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
Subject: Re: [PATCH V2 4/8] mmc: sdhci-msm: Unconditionally call
 dev_pm_opp_of_remove_table()
Message-ID: <20200831104453.ux5fb5bpt57tj5am@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <1d7c97524b9e1fbc60271d9c246c5461ca8a106c.1598594714.git.viresh.kumar@linaro.org>
 <CAPDyKFpdZhzXQv3hpTzf3UkJDhFqBhgMXCqVfAfE6PejLCxvfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpdZhzXQv3hpTzf3UkJDhFqBhgMXCqVfAfE6PejLCxvfg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-08-20, 10:43, Ulf Hansson wrote:
> On Fri, 28 Aug 2020 at 08:08, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> > find the OPP table with error -ENODEV (i.e. OPP table not present for
> > the device). And we can call dev_pm_opp_of_remove_table()
> > unconditionally here.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Replaced v1 with v2 on my next branch, thanks!
> 
> Just to be sure, this patch doesn't depend on any changes for the opp
> core that are queued for v5.10?

The recent crashes reported by Anders and Naresh were related to a OPP
core bug, for which I have just sent the fix here:

https://lore.kernel.org/lkml/922ff0759a16299e24cacfc981ac07914d8f1826.1598865786.git.viresh.kumar@linaro.org/

This is already tested by Naresh now and finally everything works as
expected.

I am going to get this fix merged in 5.9-rc4, but we do have a
dependency now with that fix.

What's the best way to handle this stuff now ? The easiest IMO would
be for me to send these patches through the OPP tree, otherwise people
need to carry this and the OPP fix (for which I can provide the
branch/tag).

-- 
viresh

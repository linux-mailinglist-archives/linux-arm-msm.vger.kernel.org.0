Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244A6257329
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 06:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgHaEuf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 00:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgHaEu3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 00:50:29 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D572C061755
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2020 21:50:27 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ls14so2344368pjb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2020 21:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gWtwtmTmWJP6PRe7RtDEcLG6uFWLJu+zwinARouQGBI=;
        b=HEijcHzxI2VMtgmNUkIiZPvHhNw/oFoLqcKsqdbuqS4QPIfYtRTRr63g1xxeixHwcO
         rhJNqnPyHcVxUgte1hSWuwf+J1auAK8DPxTClOjAd8U2S2XoyGBEsFOUun+sbdSD0f8i
         UaHB7pF4lik2dYvKY2fnHbT0xV1bQBgASNVNtj2Glyavl7Sp2lGJrOvueGn3LBq31Vx9
         3uVYyaistU6w0cTPt1ybo+v48J3re2dQ8knRPgccIlpq6J5aFMnobHbQLaHfOF6FD4UD
         lAAM73zY6FuSzTnMzm950cvgVdhJS13811ri/2v+kAcIq0RKymhlMs2KSgJOFjXZab+p
         +x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gWtwtmTmWJP6PRe7RtDEcLG6uFWLJu+zwinARouQGBI=;
        b=UILb5MQisqF0OfmgVeWeQUSGA6R6gN1u0SpdE878FUP4hoqAdk2EANP7v7tt8hr02k
         V/btyrAzUgMeYU8v/cqmYsjvC/ty3pbp213IHQ3FSZu4H3Zh8QYlK5bSt9t6hQFeO9cD
         hDpAKjS1NEfSaOo1HdUfeWw966tmDfdj3rEKEyY+xwCxvD4dCg9AGm0DwJoZos3Dym3a
         Cv8Qk577nUEeVhsWa2qK8+h4XNfgXN4qtcwWXPGWrHhDfgIXV77au2vY0e656qVitWsu
         IuWpsckuhuw/Z6dpivIvjWg+/uZA8s8dquTemTg7KCEks3gQXCwBijmBErFC+kDJSszC
         Knlg==
X-Gm-Message-State: AOAM532qaJCUYinglaKwn9MAb6aCAJqJV10fce+HlbWqm48pLUg2qVQD
        5DL7Nh19AYcKnB7Cbjc2r1SoKQ==
X-Google-Smtp-Source: ABdhPJyO6I1gTBITTbvxngJzCMisDDlT/VpCcwXWCv84oG3HDtIaiAJOKOHwcoRK8DW6qK0kDVx40A==
X-Received: by 2002:a17:90a:d251:: with SMTP id o17mr8910724pjw.215.1598849426694;
        Sun, 30 Aug 2020 21:50:26 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id lk16sm5241275pjb.13.2020.08.30.21.50.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2020 21:50:25 -0700 (PDT)
Date:   Mon, 31 Aug 2020 10:20:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH] mmc: sdhci-msm: When dev_pm_opp_of_add_table() returns 0
 it's not an error
Message-ID: <20200831045023.b2i2y3ed4tiwraey@vireshk-i7>
References: <20200827083330.1.I669bb4dc3d92bd04e9a695f97904797dc8241b79@changeid>
 <CA+G9fYtWpBQb8Ew_G=bjcR7wBHMgKm=EXV7vuk6FE9m0-4Ef3A@mail.gmail.com>
 <CA+G9fYt-k9FMq0HcRN5iQyvt7yaz8YMpENcUktm7yQ1y+zgd1A@mail.gmail.com>
 <CAD=FV=V7SuUEFAtqPhDpW0O9H3bznsGma_n-fB-JArDAtfHrFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=V7SuUEFAtqPhDpW0O9H3bznsGma_n-fB-JArDAtfHrFg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-08-20, 07:56, Doug Anderson wrote:
> I've confirmed that the current mmc/next (with Viresh's new patch) no
> longer breaks me.  :-)
> 
> $ git show --format=fuller linux_mmc/next | head -8
> commit 174e889d08aa54219b841464458f81d13fafec93
> Merge: c282fdb49b18 8048822bac01
> Author:     Ulf Hansson <ulf.hansson@linaro.org>
> AuthorDate: Fri Aug 28 14:26:25 2020 +0200
> Commit:     Ulf Hansson <ulf.hansson@linaro.org>
> CommitDate: Fri Aug 28 14:26:25 2020 +0200
> 
>     Merge branch 'fixes' into next

Well, it fixed someone's problem at least :)

-- 
viresh

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96136DE74F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 11:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfJUI74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 04:59:56 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37824 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfJUI74 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 04:59:56 -0400
Received: by mail-ua1-f68.google.com with SMTP id w7so3570872uag.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GkOKxxpsGK/80WlQWwLBXhyhiD8tMwT8+Cgd/zEVlCY=;
        b=gkO7kkILMDe7OJ4KFmrFBHJ2ZE1ERHJD1rmFfjWKt4iYJxpHRjQFsR5YmbgdNoGqlQ
         RdqhZ7g1SOnR99RsgsurMaDeuGuzGcZGnOM6/vbC+m6YDrcDI/s+R8iHEGq/225QMv8S
         BNZ/5z2RSQfjyt6mFh+ARMFUOGF2p256asXG6RXH0R59A4tV+/MZqC6SY5jO4oihmr9y
         1eHwV9hExJcsM7prdU8uLUGv5oQHJxgUqafgwkM7tTOBW915Z5QczaoSas68EUPMrsrG
         gvYdDZ4+MvCf7GPMJbdM09rRUuZAGetP38SPMjYDuyKgnNF4BEXhkJrMAmoTE6trglqn
         IIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GkOKxxpsGK/80WlQWwLBXhyhiD8tMwT8+Cgd/zEVlCY=;
        b=B7peGaf/P3ApZF10nJhDEQqcnr8eQs1mbVbVM0Zc96IC+mKQ8I2G1JVTyZWVbp6YHY
         LLbxyeNSgVsoQohBHkwB93M4kV6XTps+3oJ13yLw4maCxFn0YUXApfaSI/vM+BPCuvis
         U13wrCrdV37dTm9zh/bLuLgfco4sL6kQk7d+3ExfIVEIxBFwAFf4TLo9rFxX91giZMFY
         nOM/cSxbX0OHzVIZzUhwsvpkO6g7pLNX21w1g3HMUMN2Qlj9eZbk75CpsYVH9y/FM1MC
         s05/+EQUwnyOIEUmkjmgq1w3+v37yGGN1xgdNqD30f6aWkpAhAKlprehFQdMV5XOQxmX
         LlWQ==
X-Gm-Message-State: APjAAAWiSycQp31k3dJLXfV4RkZ974IK/G8CeYvqxJ6y57QRFJv2l+2P
        wo4OrRg12m723tZb/j8ZlKMoR6f0NBYlxqFky3xglQ==
X-Google-Smtp-Source: APXvYqy1skCw5iA/y67UrQPP3MAZhJ04h3rF2rtlEMmZQVVO3ryPl7j+34VyGLMMcpvzuCqueqM59hhRx1AvMlcjFdo=
X-Received: by 2002:ab0:2015:: with SMTP id v21mr12191265uak.94.1571648394900;
 Mon, 21 Oct 2019 01:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571387352.git.amit.kucheria@linaro.org>
 <66d8ae593ce7936a5f492d0c6855c1ac225b64ee.1571387352.git.amit.kucheria@linaro.org>
 <20191021080811.GA54219@gmail.com>
In-Reply-To: <20191021080811.GA54219@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 21 Oct 2019 14:29:43 +0530
Message-ID: <CAHLCerOcdnSTppKRm2vi6V8E7vyVWvwDakaQcnXnnDVqKDXmBA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] cpufreq: Initialize cpufreq-dt driver earlier
To:     Ingo Molnar <mingo@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 1:38 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> > This allows HW drivers that depend on cpufreq-dt to initialise earlier.
>
> My obsessive-compulsive in-brain spellchecker noticed that the title says
> 'initialize' (US spelling), while the comment uses 'initialise' (UK
> spelling). Just in case this is not some post-Brexit expression of
> cross-Atlantic friendliness you might want to fix it. :)

Naah, its just my confused brain that grew up learning British
English, then spent enough time in US to pick up some of that too. I
think it is a form of selective spelling blindness :-)

Will fix.

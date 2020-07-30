Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2A5232BBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 08:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgG3GKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 02:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbgG3GKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 02:10:45 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DCCC061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 23:10:45 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id j20so14424353pfe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 23:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uQYpM0l2BVpiJWQZFm1BaeuXeXgCvf7ouFHsM+pxK3o=;
        b=XBqp9xb8A9zcXM17E9TiNethe3UCCEif5I2cMuTLDm+LzY/Q2h/KEWFSUUIU7+OOsp
         fGEfbag1AKQoz9XbUpT/O8kbZdNkENjutG77LUQoYDU1WZSv71gcM3J/pBNKIVOkdclA
         FLTQ7DrgWZXGCECvMsiy7JgW113vuB7rqh+MYWSubjaMXMJDnSj1gFZMVwHl9DVCZWnr
         V1QOc8GZRqNu9ZCgYrn1pMnHs9SapztI74OlUkc0AskHJD/mQ9yWV9lupgZKwp63IBNg
         afahJsaFHOxnIDSCUeF37d3jphtAWoDYcShcDIXQ22qeNvzkR4hQyZz+1pQhbjw8WLa1
         NhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uQYpM0l2BVpiJWQZFm1BaeuXeXgCvf7ouFHsM+pxK3o=;
        b=qQXkHUcfZObI3Nq6XOmgHDgNCKo9wzAvrODlOjm/p/BeFjzpMqBr1NOA1a61tFnRRd
         ElCuudxcZfIJ2cplKjl9Y4JcCAENqDGHEqQj5UM43RE+I0w7wNc9rQprP/pl21j5RCAl
         OEHxbsJkwi86PY++Z1JoKgbaIkjsXSJh6PyGiFSsQX7UOxK0q48vuRch843YDuDHtW6n
         agyvsnnfBli10E9dxQrqivVWJpJAAzoj6LMje9v94H1HJseE5B5013ukR3o15pUS0dTo
         boNoRvb8m8THaJ1TdfARPTWimRzYjIuFShu9lwBeZOiBRreIxjM7Z9CfRr0jwDhdcXNb
         7HLA==
X-Gm-Message-State: AOAM530nG289ZAkA72P6tUNOhZNrbSjabSWBpu11o//vgAypycwzquSb
        V28WIAJzhw1BaDVBXBHcAhd32Levdyg=
X-Google-Smtp-Source: ABdhPJxSQvMRu1T3KgR5lHuZ010N5ABhbRziRXq9ba4d0wesRySTDuiJw9HJ7RCTVwThb1P+v7OFrQ==
X-Received: by 2002:a62:7c09:: with SMTP id x9mr1632779pfc.229.1596089444870;
        Wed, 29 Jul 2020 23:10:44 -0700 (PDT)
Received: from localhost ([106.201.14.19])
        by smtp.gmail.com with ESMTPSA id t73sm4667429pfc.78.2020.07.29.23.10.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 23:10:44 -0700 (PDT)
Date:   Thu, 30 Jul 2020 11:40:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        ionela.voinescu@arm.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: cached_resolved_idx can not be negative
Message-ID: <20200730061041.gyprgwfkzfb64t3m@vireshk-mac-ubuntu>
References: <d48d824ab3abacb2356878780979d7ed42191eaf.1596080365.git.viresh.kumar@linaro.org>
 <CAHLCerP4YPHc4sKD_RTq=Gxfj+ex4F=J2is1Y-UzGXcOuEOrOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerP4YPHc4sKD_RTq=Gxfj+ex4F=J2is1Y-UzGXcOuEOrOQ@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-07-20, 11:29, Amit Kucheria wrote:
> On Thu, Jul 30, 2020 at 9:38 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > It is not possible for cached_resolved_idx to be invalid here as the
> > cpufreq core always sets index to a positive value.
> >
> > Change its type to unsigned int and fix qcom usage a bit.
> 
> Shouldn't you fix up idx in cpufreq_driver_resolve_freq() to be
> unsigned int too?

Yes, merged this into the patch.

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0128de3603df..053d72e52a31 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -538,7 +538,7 @@ unsigned int cpufreq_driver_resolve_freq(struct cpufreq_policy *policy,
        policy->cached_target_freq = target_freq;
 
        if (cpufreq_driver->target_index) {
-               int idx;
+               unsigned int idx;
 
                idx = cpufreq_frequency_table_target(policy, target_freq,
                                                     CPUFREQ_RELATION_L);

-- 
viresh

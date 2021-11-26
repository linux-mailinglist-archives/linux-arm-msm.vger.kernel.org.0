Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B1345EE31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 13:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377539AbhKZMor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 07:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbhKZMmq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 07:42:46 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C971C0613B7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 04:05:50 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id l22so23731802lfg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 04:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ad78gPgRANP0ns5h2SPcFEcBt7/4TrzbtwXXFw7gKwU=;
        b=pHpWqFGvgPJmQFlX9VUZ++RDpjJP9i5hE+V+s/IbIXYSrTi/vO0HggU7ZnYlE1Ffei
         yV0CQIFdRab9Xx2grDg/OkKrTRaujb4xZzyCm43V5yn5uhl2tt/H4fw266u0JAokjxwN
         4C/19nfVtPPo07HMKsm2AVAPOhtmjjsrk50zKob893/JTQyI+xoe/9gRwNugRGCuW8c6
         X+K4R88JxB+ER0CEtyMiQX+QcLXWL7B9emgAqJWjjehQw1cfArhbD3pOBsGuUG4XygF4
         nmMf/KfsrxH0BecGQhFwL2EGncsI0XeBnCPfAfSEk3FeYQIu8SDhhRsTNYdcBKlpk3Wm
         Xdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ad78gPgRANP0ns5h2SPcFEcBt7/4TrzbtwXXFw7gKwU=;
        b=13ucpVZ81vcfnTpl8IhCKI/njFcfNq40+jyndL3hiVxmYiAcO0X1iVkJL+kvbB0+W3
         r6GizpiTnZwt2x0kop/GDzgdnUGURpTpf9Lx9t80xv2JchF2CFj82Fc6zch3TqjmvX7c
         fduwWDYfgbbmBlCZ4TlV0qQrg45TJ+kbLXxZWx89FzR6zdHeUUiVGMEDrM+JwKUn+0XO
         NUm1sjYqA57DyPK8R1yydDds42zHYHn6BMJcHoOlaIvd+ubltgn3t8u+9mGk6iLXyhCi
         QhcX1DEAbJ6TeY5E/nVIzCuwYsJy7DtRhoPRHH/elUyJNkUy2mtGw9zKNBoEinLQZSz+
         5wmw==
X-Gm-Message-State: AOAM5307UC/GOhHTzJbIyMY1Tn9zsZf8xg1aCZkEOYWvdNsX0htLG8WW
        LW9eQlKtOT9dqMqMSBLIqdswKdJnl/LXGl/iBBIfrQ==
X-Google-Smtp-Source: ABdhPJzRr4kRWZmYIZbavgZi9Awdb01BWO8GajoIKLrUXdV645jcFnKCGjJD0JwTJL+PeSToTWRK6+zBAp1e2itZKCo=
X-Received: by 2002:ac2:5607:: with SMTP id v7mr29278692lfd.71.1637928348376;
 Fri, 26 Nov 2021 04:05:48 -0800 (PST)
MIME-Version: 1.0
References: <1637831676-32737-1-git-send-email-quic_mkshah@quicinc.com>
 <YZ9ctgCBYJEEjuwt@hirez.programming.kicks-ass.net> <687d97b6-347a-92c0-34ba-00331dfb6c82@quicinc.com>
In-Reply-To: <687d97b6-347a-92c0-34ba-00331dfb6c82@quicinc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 26 Nov 2021 13:05:12 +0100
Message-ID: <CAPDyKFo8Z+G-14t-o-HiHf1_xuexBAGo3eumca-0QO8eTqNpsw@mail.gmail.com>
Subject: Re: [PATCH] sched/idle: Export cpu_idle_poll_ctrl() symbol
To:     Maulik Shah <quic_mkshah@quicinc.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_lsrao@quicinc.com, rnayak@codeaurora.org,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Nov 2021 at 15:13, Maulik Shah <quic_mkshah@quicinc.com> wrote:
>
> Hi Peter,
>
> On 11/25/2021 3:21 PM, Peter Zijlstra wrote:
> > On Thu, Nov 25, 2021 at 02:44:36PM +0530, Maulik Shah wrote:
> >> Export cpu_idle_poll_ctrl() so that module drivers can use same.
> > This does not seem like a really safe interface to expose to the
> > world.
>
> Thanks for the review.
>
> Keeping the cpuidle enabled from boot up may delay/increase the boot up
> time.
> Below is our use case to force cpuidle to stay in cpu_idle_poll().
>
> We keep cpuidle disabled from boot up using "nohlt" option of kernel
> command line which internally sets cpu_idle_force_poll = 1;
> and once the device bootup reaches till certain point (for example the
> android homescreen is up) userspace may notify a
> vendor module driver which can invoke cpu_idle_poll_ctrl(false); to come
> out of poll mode.
> So vendor module driver needs cpu_idle_poll_ctrl() exported symbol.

Waiting for the homescreen can be considered as rather late, from the
kernel boot progress point of view.

That said, I am wondering if a similar improvement can be achieved by
just allowing WFI (thus no deeper idle states) until homescreen? If
so, that can be quite easily achieved by modularizing the cpuidle-psci
driver.

[...]

Kind regards
Uffe

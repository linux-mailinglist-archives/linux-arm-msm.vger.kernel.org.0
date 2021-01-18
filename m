Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959C72F9A36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 07:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732366AbhARGzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 01:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731682AbhARGzD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 01:55:03 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2328C061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 22:54:22 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id x21so12669846iog.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 22:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hSduwCfeRHk7rJa0LW6/pCYpFQHeIzODmV/9rNFvP08=;
        b=X0EDM0PDQ1A9Ay5/rcySBWrH7IYUn/h/N+qS3fEhWDtwsh2fQBTJL5lIOrxP9ALS+/
         ufnTeA6zEePajReSHyoMQOc9tS4afpdHTtA3nxaAup0qKv6G8i5stweEc3MKQUINUcaH
         RxZ2udrv+ArmqAnt1JvpXj5Dw9b/OoQhJzSgl0ElPdfWlVGIYVyEvg1RMjNBklMDIKQw
         8IVb2yL9gko5HIAjNqRlvXLR3WitxA7DD0IGOSuwwphCauIuTb/+Bl3zV4oc4V+Owvm/
         agZpJQgNBDGK+vPhjf9GrNxuzlWAEGjbHqIqkFrWnzH6L83gLZD1Xsrtj8KTLk4fwtHq
         ZP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hSduwCfeRHk7rJa0LW6/pCYpFQHeIzODmV/9rNFvP08=;
        b=EK4ICk6VBksuP4bfihzns0DuRVx3vdgkxm6U8EOoTz0qYPeuh0BwDE1Fru/HJRCcXX
         7Bpg9gKp4gYWxJ6Z0CAuTGCghMjagYHwogXw+E2CHX0Bnm9nbdvdVPtvjqnbV5KNvoRx
         Eh08V0bsAZQrWAsdsF8Lg5VxhpVD9WvmqhQ53JAzRtnRzVxzSPSN0vz7vNvqISgGDVOL
         q8ltGHwJtMkjc3uAJiS/lDxAO0Wv4ONRwTewSXzWTfN4FAUrC0vp/AJ7YQfzLfwULthi
         bMXKcUmNPxeqtJF61zza3FKydblOdJK9/JFjHBPxvEaJEP0gnBRhWkOtK17ZLvXeYSR1
         vslA==
X-Gm-Message-State: AOAM5320jcKLAkB2aGE/o8C33kKbVgi8rCbchdLuJPnhWvScGIrrQx5s
        1vvWj9MqH0touwqMnSbp+3vYPKdzgPmMp1Wq4BvJfhf/5FE=
X-Google-Smtp-Source: ABdhPJz6pC4RFNp89fKOE0UIhOBuGVPvJfcKwk3uHrN9VT2mRAWdFJC3Jl8jtcT/6RdEMODlSz8mBKxutwKBqILNEfs=
X-Received: by 2002:a05:6602:2197:: with SMTP id b23mr7652205iob.126.1610952862280;
 Sun, 17 Jan 2021 22:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20210112095236.20515-1-shawn.guo@linaro.org> <X/210llTiuNt3haG@builder.lan>
 <20210113043143.y45mmnw3e2kjkxnl@vireshk-i7> <X/5+GbueKg66DoEE@builder.lan>
 <20210113050651.q2txref3d6bifrf3@vireshk-i7> <20210118064316.nuo6ivetefxt63n6@vireshk-i7>
In-Reply-To: <20210118064316.nuo6ivetefxt63n6@vireshk-i7>
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Mon, 18 Jan 2021 14:54:11 +0800
Message-ID: <CAAQ0ZWTBohYPL5xtcG=T=nz1L40qYtUaWrwsgiHZykyGi4xh3g@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: qcom-hw: add missing devm_release_mem_region() call
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 18, 2021 at 2:43 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 13-01-21, 10:36, Viresh Kumar wrote:
> > On 12-01-21, 22:59, Bjorn Andersson wrote:
> > > But that said, why are the ioremap done at init and not at probe time?
> >
> > These are some hardware registers per cpufreq policy I believe, and so
> > they did it from policy init instead.
> >
> > And yes I agree that we shouldn't use devm_ from init() for the cases
> > where we need to put the resources in exit() as well. But things like
> > devm_kzalloc() are fine there.
> >
> > Ionela, since you were the first one to post a patch about this, can
> > you send a fix for this by dropping the devm_ thing altogether for the
> > ioremap thing ? Mark it suggested by Bjorn. Thanks.
>
> Ionela, I hope you are working on this so we can get it fixed quickly
> ?

Let me take it over.  I will try to send a patch out today.

Shawn

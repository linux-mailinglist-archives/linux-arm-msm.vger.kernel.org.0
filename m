Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4205645469E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 13:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbhKQMwh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 07:52:37 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:40557 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237288AbhKQMwZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 07:52:25 -0500
Received: by mail-oi1-f179.google.com with SMTP id bk14so6170281oib.7;
        Wed, 17 Nov 2021 04:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YVpOUkHWrxcL6gn2WZBUPNSgFOs0aLPQopQvD8QcrBs=;
        b=D/ulIE40XUbUpxCnlsDg+aBxt9HDOrss3OUda/WlItJugJwLqkDJB+4eRRm4R94/cH
         xRfCvvRqeKyiRTiqGbbG06SKcEYL6P+HOTl5/W0lvzTJB1Q8ViFjGhChp/aNCyxiUtKr
         SmxEJGSmRD0/iITeu2i8hUEIieeuILv7CA7UX36n0kghxDD5KGmrdhcvPLAJ4rjnopV7
         w4K2i1JAGRldu+/jBhsFfiVVzyp+L8CYQiTWjfTL3H1b0pZgxFQswgQCfOUa7QyJ3exa
         3+hw3CoL3aJFZmr4OuOByOZ1fKYz7MHxA5kzBG29MwGSYxz6qDNYf3jwtK6C/zT7Ij64
         Zn6Q==
X-Gm-Message-State: AOAM530ziuemazZ83+8U3Xz5iamZWXNnxnyfJJhkld2X5d3ZOmVN8uP9
        IY+stzx9lxVuJsk7X38TaECnz8jyc6aW5AMLf2M=
X-Google-Smtp-Source: ABdhPJxRRH7QGlS3j4zHL4sqgjhdqiLp5hEUtVmiX0R5XQbuaEtlwVSb2durVB5xnVUeuWssaiqhyw47vboFp7EfluM=
X-Received: by 2002:a05:6808:14c2:: with SMTP id f2mr13857416oiw.154.1637153366804;
 Wed, 17 Nov 2021 04:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
 <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com> <8f7397e3-4e92-c84d-9168-087967f4d683@arm.com>
In-Reply-To: <8f7397e3-4e92-c84d-9168-087967f4d683@arm.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 17 Nov 2021 13:49:15 +0100
Message-ID: <CAJZ5v0iRDtr5yae5UndwU2SmVL4cak=BN0irVGbgNzQiS8K3mA@mail.gmail.com>
Subject: Re: Re: [PATCH] base: arch_topology: Use policy->max to calculate freq_factor
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 17, 2021 at 11:46 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Rafael,
>
> On 11/16/21 7:05 PM, Rafael J. Wysocki wrote:
> > On Mon, Nov 15, 2021 at 9:10 PM Thara Gopinath
> > <thara.gopinath@linaro.org> wrote:
> >>
> >> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  Since
> >> we don't consider boost frequencies while calculating cpu capacities, use
> >> policy->max to populate the freq_factor during boot up.
> >
> > I'm not sure about this.  schedutil uses cpuinfo.max_freq as the max frequency.
>
> Agree it's tricky how we treat the boost frequencies and also combine
> them with thermal pressure.
> We probably would have consider these design bits:
> 1. Should thermal pressure include boost frequency?

Well, I guess so.

Running at a boost frequency certainly increases thermal pressure.

> 2. Should max capacity 1024 be a boost frequency so scheduler
>     would see it explicitly?

That's what it is now if cpuinfo.max_freq is a boost frequency.

> - if no, then schedutil could still request boost freq thanks to
>    map_util_perf() where we add 25% to the util and then
>    map_util_freq() would return a boost freq when util was > 1024
>
>
> I can see in schedutil only one place when cpuinfo.max_freq is used:
> get_next_freq(). If the value stored in there is a boost,
> then don't we get a higher freq value for the same util?

Yes. we do, which basically is my point.

The schedutil's response is proportional to cpuinfo.max_freq and that
needs to be taken into account for the results to be consistent.

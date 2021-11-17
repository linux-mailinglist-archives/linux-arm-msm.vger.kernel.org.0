Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C830454CAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 18:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbhKQSCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 13:02:15 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:44906 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhKQSCP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 13:02:15 -0500
Received: by mail-ot1-f51.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso6080027otj.11;
        Wed, 17 Nov 2021 09:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoxl3U29QPybXdTn3lCAkC7wxqpVbVrgb5RkC9VtBC8=;
        b=0EwGqwdSgelFkUmigHBTGFrVKd7SP5DmbxsMrZM5rqAcx8TSDD4InqXG2ZizZn1qNC
         8GNQLqS47of8gsALGTyWkeQnYgeoovIx8CpIIso5gtXj9JUYy1lfWgBL/uV4zZa0poPZ
         /c34hOeEIFG2PZv1OGh+Fx9KHqDLZG+tqqjqMENRPNqbwB7C1HZBCCYFtU7A3D+lqjC6
         UDZ2YSTF41CDBlzfIIGkCrKyIYYGlotWoNXPA5oC6YpqOhgfoOLXEMyJCGU/MBaqzkhT
         UGFD6naa3SS/Hf5egwH12qvRgV7AYuOScfksILtXlW75a8ENheDhfBEXleLSJtXPuXzd
         vbRA==
X-Gm-Message-State: AOAM531k0eByW1jDiGdIbtTLLNA1c+6dUxk8vdAKqYy3AKgtiW9zAVVD
        ejaKhc+QyXAqbget1wyKfQOyp5W4LRqWZouKzFe3SiD3slo=
X-Google-Smtp-Source: ABdhPJxgrNHEcIl1QbZvbdkU44kPdvatZwekdY2SihVSNjlbfys7UZ3YEy61+fdkmJjVlMfC6Ap5ScQ6f/pN8aOYGAY=
X-Received: by 2002:a9d:a64:: with SMTP id 91mr15229416otg.198.1637171956227;
 Wed, 17 Nov 2021 09:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
 <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
 <8f7397e3-4e92-c84d-9168-087967f4d683@arm.com> <CAJZ5v0iRDtr5yae5UndwU2SmVL4cak=BN0irVGbgNzQiS8K3mA@mail.gmail.com>
 <af59de78-49b0-d2e6-4bf0-7c897c2fccb1@linaro.org>
In-Reply-To: <af59de78-49b0-d2e6-4bf0-7c897c2fccb1@linaro.org>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 17 Nov 2021 18:59:05 +0100
Message-ID: <CAJZ5v0h3O_rSR38X4fV1FC2O2DYQnxzeLbxcSqh1vpnE65Nd+A@mail.gmail.com>
Subject: Re: [PATCH] base: arch_topology: Use policy->max to calculate freq_factor
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 17, 2021 at 6:01 PM Thara Gopinath
<thara.gopinath@linaro.org> wrote:
>
> Hi,
>
> On 11/17/21 7:49 AM, Rafael J. Wysocki wrote:
> > On Wed, Nov 17, 2021 at 11:46 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
> >>
> >> Hi Rafael,
> >>
> >> On 11/16/21 7:05 PM, Rafael J. Wysocki wrote:
> >>> On Mon, Nov 15, 2021 at 9:10 PM Thara Gopinath
> >>> <thara.gopinath@linaro.org> wrote:
> >>>>
> >>>> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  Since
> >>>> we don't consider boost frequencies while calculating cpu capacities, use
> >>>> policy->max to populate the freq_factor during boot up.
> >>>
> >>> I'm not sure about this.  schedutil uses cpuinfo.max_freq as the max frequency.
> >>
> >> Agree it's tricky how we treat the boost frequencies and also combine
> >> them with thermal pressure.
> >> We probably would have consider these design bits:
> >> 1. Should thermal pressure include boost frequency?
> >
> > Well, I guess so.
> >
> > Running at a boost frequency certainly increases thermal pressure.
> >
> >> 2. Should max capacity 1024 be a boost frequency so scheduler
> >>      would see it explicitly?
> >
> > That's what it is now if cpuinfo.max_freq is a boost frequency.
> >
> >> - if no, then schedutil could still request boost freq thanks to
> >>     map_util_perf() where we add 25% to the util and then
> >>     map_util_freq() would return a boost freq when util was > 1024
> >>
> >>
> >> I can see in schedutil only one place when cpuinfo.max_freq is used:
> >> get_next_freq(). If the value stored in there is a boost,
> >> then don't we get a higher freq value for the same util?
> >
> > Yes. we do, which basically is my point.
> >
> > The schedutil's response is proportional to cpuinfo.max_freq and that
> > needs to be taken into account for the results to be consistent.
>
> So IIUC, cpuinfo.max_freq is always supposed to be the highest supported
> frequency of a cpu, irrespective of whether boost is enabled or not.
> Where as policy->max is the currently available maximum cpu frequency
> which can be equal to cpuinfo.max_freq or lower (depending on whether
> boost is enabled, whether there is a constraint on policy->max placed by
> thermal etc).

It may also depend on the limit set by user space.

> So in this case isn't it better for schedutil to consider
> policy->max instead of cpuinfo.max ?

Not really.

In that case setting policy->max to 1/2 of cpuinfo.max_freq would
cause schedutil to choose 1/4 of cpuinfo.max_freq for 50% utilization
which would be rather unexpected.

policy->max is a cap, not the current maximum capacity.

> Like you mentioned above same
> utilization will relate to different frequencies depending on the
> maximum frequency.

Which is not how it is expected (and defined) to work, though.

If you really want to play with the current maximum capacity, you need
to change it whenever boost is disabled or enabled - and there is a
mechanism for updating cpufinfo.max_freq in such cases.

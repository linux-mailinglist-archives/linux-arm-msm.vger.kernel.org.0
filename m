Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4FF4549C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 16:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbhKQPUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 10:20:52 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:44842 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbhKQPUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 10:20:52 -0500
Received: by mail-ot1-f49.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso5244518otj.11;
        Wed, 17 Nov 2021 07:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=39SwSrn4ksq9tL6uZGaTaGvTEJxmaV/otgzmXvO/0xU=;
        b=U4pkVpReOjXs+RX7lzQLxj1hY+UtDlkoEGq3Ek2yVyFYgpA49FOgmoE32hb7G/mhXY
         q8rRaixPHzbt5xrmdyezqfW8v8JjXwkFJSFLvdYDwz8meomnNTms0LlPhY99vEv6fGRr
         H2uHsymXuIG/UpS1BZG0sfIepPekrHAzUpxZzuTpY90tlK0UOKQsCa+dO//FiLU92qj9
         4lqpDWkPNA5GbrIhmnkrRBFmCRkYYZVJtYQlR28K/CvdjQubETv+kU2zWR3ROV8ADSz1
         ftbER7udLcVgmXNkY8i4wECEbz/M/UZh9Lxqetm31lVtQgmgniZ5wBV0wT3ZLqfu+LWq
         6i2A==
X-Gm-Message-State: AOAM5328nPxGAu4m8tqi/Z0QyT5lGCWh/lyZWsDCzKmVCPtbjDxW0Xw8
        ahYrZc4VfuWGllcTo8y5UQXr8PrYIa7BBcb4T+s=
X-Google-Smtp-Source: ABdhPJwT20oIgLmpQJ9In00rTWddqeFLLZIxtV/9eREzRr7Zgb4OvRWxVLsBBxNQaxpfMaisZWeGMVj3XAbqwWJfEPY=
X-Received: by 2002:a05:6830:348f:: with SMTP id c15mr14417147otu.254.1637162273025;
 Wed, 17 Nov 2021 07:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
 <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
 <8f7397e3-4e92-c84d-9168-087967f4d683@arm.com> <CAJZ5v0iRDtr5yae5UndwU2SmVL4cak=BN0irVGbgNzQiS8K3mA@mail.gmail.com>
 <7f077790-da4c-35b8-0eea-cbdc630f9d2a@arm.com>
In-Reply-To: <7f077790-da4c-35b8-0eea-cbdc630f9d2a@arm.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 17 Nov 2021 16:17:42 +0100
Message-ID: <CAJZ5v0gtkQYfeEELLrNjRQmywkxrtqzVZp1Kb-f9JPsqEckevw@mail.gmail.com>
Subject: Re: [PATCH] base: arch_topology: Use policy->max to calculate freq_factor
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

On Wed, Nov 17, 2021 at 4:08 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
>
>
> On 11/17/21 12:49 PM, Rafael J. Wysocki wrote:
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
> >
>
> This boost thing wasn't an issue for us, because we didn't have
> platforms which come with it (till recently). I've checked that you have
> quite a few CPUs which support huge boost freq, e.g. 5GHz vs. 3.6GHz
> nominal max freq [1]. Am I reading this correctly as kernel boost freq?

That actually depends on the driver.

For instance, intel_pstate can be run with turbo (== boost) enabled or
disabled.  If turbo is enabled, cpuinfo.max_freq is the max turbo
frequency.

In acpi_cpufreq things are sort of weird, because the highest bin in
there is a turbo frequency, but not the max one and it is used to
enable the entire turbo range.  The driver sets cpuinfo.max_freq to
this one if boost is enabled IIRC.

> Do you represent this 5GHz as 1024 capacity?

Yes (but see above).

>  From this schedutil get_next_freq() I would guess yes.
>
> I cannot find if you use thermal pressure, could you help me with this,
> please?

It is not used on x86 AFAICS.

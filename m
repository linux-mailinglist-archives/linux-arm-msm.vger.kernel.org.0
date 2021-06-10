Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73193A2D00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 15:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbhFJNa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 09:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbhFJNa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 09:30:58 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22081C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 06:28:49 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id b14so11907315iow.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v4hLoN0siMfHmp2NeUt0J1eeOoHTnNdIx4P036PPjEI=;
        b=Wk2mffK1+ySY6phuAC9E6Oscs2QoIMJbvTczGwXAWqrgPaSNdboavkfXm+SHEyHUeN
         a7Cw5c2uW9jwxssW5/CHcxTLxz/zoQkIybbfmRMePDAjimANLEjvKq4MeAf8rppdazHw
         UDKe3a2tjdjRTtfXlGuSN/UwMx6wavCnuFK9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v4hLoN0siMfHmp2NeUt0J1eeOoHTnNdIx4P036PPjEI=;
        b=cx/oyXA+XMRdGV6gAaFSXSElvZ7okE9PmKALY54tqSvYa+laTO5IMuyfbzjm/zW0Bz
         NyQ3olsWLTk6cID0vzH0z4ArG4hJlI9333Q2fTmFuGi6wsF8Qu7kKc417cSdP/aHJSJ8
         8er6Ikap54Xe8jp03bxrHWhog9aXEQkHP3S/JgOqboD3k2xvztXb3NjU1xWSYTkq0RyR
         5dHeONS0mJM0pvxEL1w2wcAdOv56rHAIjCyyNYf/WLpukaczSmOxeNkzz+xIiseCoLeh
         QzcfTY5LAWaSPVA+ecoNl/t4mh7GdkCXFS/VU1feLUUE9Iodo3/3mYaCzSrrTLCabODQ
         kWIw==
X-Gm-Message-State: AOAM530m90h43yyrDr/MCdGCNTnB3zpx7+3vMoCDrDxkjOSFyULWg028
        fPwLlPEpQIvTHucD3s9xs55eE/m6fnGjpA2+COtH+A==
X-Google-Smtp-Source: ABdhPJwDWhkRU1fVAP0bMfTTGja5FWHh/AN0sLKJdb5q2n5Skn/iVPxz7MLUvyRN1QZI0LSB0X1ZlcBFwRk8mJUuCsc=
X-Received: by 2002:a02:354d:: with SMTP id y13mr4772274jae.83.1623331728198;
 Thu, 10 Jun 2021 06:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <87tupqu10c.fsf@linux.intel.com> <20210309063828.26392-1-saiprakash.ranjan@codeaurora.org>
 <20210309144423.GD203350@tassilo.jf.intel.com> <24e0d604750babd3461768897bb2ae82@codeaurora.org>
In-Reply-To: <24e0d604750babd3461768897bb2ae82@codeaurora.org>
From:   Mattias Nissler <mnissler@chromium.org>
Date:   Thu, 10 Jun 2021 15:28:35 +0200
Message-ID: <CAKUbbx+C=O4J7dz8ANGvpb-n=u=bC8XQYR6BPw-yYqZC1WuGyA@mail.gmail.com>
Subject: Re: [PATCHv2 0/4] perf/core: Add support to exclude kernel mode PMU tracing
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andi Kleen <ak@linux.intel.com>, acme@kernel.org,
        Al Grant <al.grant@arm.com>,
        alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        Denis Nikitin <denik@chromium.org>,
        Douglas Anderson <dianders@chromium.org>, jolsa@redhat.com,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, mingo@redhat.com,
        namhyung@kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I know this reply is hopelessly late, but I still want to clarify a
few things (see inline for that) and provide some background on the
thinking that led to this proposal and where we ultimately landed for
the benefit of folks that come across this thread in the future.

The team working on tracing had asked me to provide input on the
security angle. We generally follow principle of least privilege /
attack surface minimization principles, and so the conclusion "kernel
tracing not needed" -> let's turn it off so we have one less thing to
potentially worry about was an easy one. What I hadn't been aware of
is that (a) no such config option exists in the kernel and (b) the
approach that the kernel is taking is to limit access to tracing data
to privileged users (via perf_event_paranoid sysctl, CAP_PERFMON).
Same for leaking kernel code pointers (note that kernel tracing
trivially defeats KASLR), privileged userspace can already read
/proc/kallsysms. While I would still like the kernel to give us a
build time option to disable kernel tracing, we can work with the
current state of affairs.

On Wed, Mar 10, 2021 at 4:17 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Andi,
>
> On 2021-03-09 20:14, Andi Kleen wrote:
> >> The disk encryption is just one example

The intention behind that example was to illustrate the point that
there are some data items that the kernel should hide to all of
userspace, including privileged processes. I know this has been
controversial in the past, but I hope we all agree that the kernel (if
configured appropriately) is aiming to do so.

>
> and there might be others
> >> which
> >> we might not be aware of yet and we are not suspecting there is
> >> something
> >> wrong with the crypto code that needs to be fixed.
> >
> > Then you don't have any leaks relating to branch tracing.
>
> >
> >> restrict an external(in the sense that its not related to crypto or
> >> any
> >> other security related component) entity such as hardware assisted
> >> tracing
> >> like ARM coresight and so on. I don't see why or how the crypto code
> >> needs
> >> to be fixed for something that is not related to it although it is
> >> affected.
> >
> > It's just a general property that if some code that is handling secrets
> > is data dependent it already leaks.

Timing side channels have been a constant source of grief in crypto
implementations for decades now. Things have become better in the most
popular implementations, but bugs continue to be found. I happened to
chat about this topic with David Benjamin (boringssl maintainer)
recently, and his take was that timing side channels are a well
understood problem meanwhile, but in practice few implementations get
the details right. And the thing with high-resolution timestamps in
traces is that it gives you a tool to observe timing differences
closer to the source (so less noise) than if you just measure syscall
latency from userspace. So, in theory you are right - data-dependent
branches should not exist in crypto code, and if they do we should
just fix them, since they're potentially exploitable already. In
practice, timestamp information in tracing data can act as a
magnifying glass that may well make a difference between whether a
timing side channel is problematic in practice or not.

> >
> >
> >> The analogy would be like of the victims and a perpetrator. Lets take
> >> coresight
> >> as an example for perpetrator and crypto as the victim here. Now we
> >> can try
> >
> > There's no victim with branch tracing, unless it is already leaky.
> >
> >> If we just know one victim (lets say crypto code here), what happens
> >> to the
> >> others which we haven't identified yet? Do we just wait for someone to
> >> write
> >> an exploit based on this and then scramble to fix it?
> >
> > For a useful security mitigation you need a threat model first I would
> > say.
> >
> > So you need to have at least some idea how an attack with branch
> > tracing would work.
> >
> >
> >> Initial change was to restrict this only to HW assisted instruction
> >> tracing [1]
> >
> > I don't think it's needed for instruction tracing.
> >
>
>  From what I know, newer ARM A-profile cores doesn't allow data tracing.
> And you
> are saying that just the instruction tracing cannot be used to infer any
> important data.
>
> There are few security folks in CC who probably can give us more details
> on how
> branch tracing can be used for an exploit. @mnissler?
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation

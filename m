Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732CD1BE473
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 18:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD2Q6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 12:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726519AbgD2Q6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 12:58:20 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D60C035493
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 09:58:20 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l3so2092670edq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ogDrOAl7G6R5M0XUTzfpv8HBCXJwGCgP8zEpM4loM3U=;
        b=zauYR8tU4FWgFSLIPcB0PE18RWF7a1HIGfPTK34kiI8e7KgEh+eHLqnzGD67BckQkM
         j3WFcfBvXOqqUHWCvynzRnpAu+wylkyVpuagm97sUrX0sYf64Y6Dxgur0LDKRHzpDkbe
         RBV7hcY9gTSRX6JcjXtwllqshEKfl6w/i66AfeuW9lt5sVyhuQzgLM2QOEk0NIIXkoQX
         MbcfsQ+/2mEgqiwjxOLZz6Zs+m0GAlopAXflPoE+nb3p7asCRCblpbTh5qJbr/VGc6AX
         JCJjV9XZDA0DBeHVJ+RIX6zJgMiFD7NWUJlVXV0jk2I7fV5NJCzofwDDCAKTBiC3p14o
         jOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ogDrOAl7G6R5M0XUTzfpv8HBCXJwGCgP8zEpM4loM3U=;
        b=lJYhMIjhEAIgYugo/Jr+pF5a1UWf4wI49p5QLSejedPpVNyNujf/3Gva+geYwj8StY
         W+b4BVw31hAaozWUU9X01RGLC6CwA82F1vi3QbwRsa2UCMwl95gOVBGXgX/rmsteeeND
         CpXZZ86anYtJp7rmwumVo+vr7+l3t2GpGxLJUQzNwDxceYa288dmCIMKHYw6TN5fckMc
         SJrlmY/jOXyxydXdqqrJqY+8sPt+QshIQpDg+7EPXaXiL1SSL81T2fc/czG3JwiQK17k
         i3tA9HXbosD9bLauSQxcfzkkokPe4eVhAJtIRIsLUmFb+2stCQywQx9DoXXlfTDUaRdh
         QsxA==
X-Gm-Message-State: AGi0PuayC7EI3WjsSNINxyyF3XkAZjhhOw+7cOvHWtybSeLPPV+h7uoD
        nITsnLfl0RfwQNmFlfuSqERY3iUBovnKXxGt0KstYg==
X-Google-Smtp-Source: APiQypJNRESvMoFx0wfjNE/Z9j5gYluuYW53gfqVJJx5bH5mNo6BF1bdmpCLLVEfooL3vo6gpPsjHnPkqB0SQiEPQ5U=
X-Received: by 2002:a05:6402:712:: with SMTP id w18mr3441495edx.386.1588179498898;
 Wed, 29 Apr 2020 09:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com> <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com> <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org> <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
 <7d343e96cf0701d91152fd14c2fdec42@codeaurora.org> <CAJ9a7VgEiX19ukjwakNHBHDeZJ05f5Z7pAYG9iEnpXCuuDfBqg@mail.gmail.com>
 <a4bba03d41a2b0145b3c6c19d48698eb@codeaurora.org>
In-Reply-To: <a4bba03d41a2b0145b3c6c19d48698eb@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 29 Apr 2020 17:58:07 +0100
Message-ID: <CAJ9a7Vj4eyv1n=RxuqfV=pdBN3SDG+ShYS5J4s40KJtqOnR7vw@mail.gmail.com>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple connections
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 29 Apr 2020 at 15:48, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mike,
>
> On 2020-04-29 19:57, Mike Leach wrote:
> > Hi,
> >
>
> [...]
>
> >> >> Looking more into replicator1(swao_replicator) values as 0x0 even
> >> >> after replicator_reset()
> >> >> in replicator probe, I added dynamic_replicator_reset in
> >> >> dynamic_replicator_enable()
> >> >> and am not seeing any hardlockup. Also I added some prints to check
> >> >> the idfilter
> >> >> values before and after reset and found that its not set to 0xff even
> >> >> after replicator_reset()
> >> >> in replicator probe, I don't see any other path setting it to 0x0.
> >> >>
> >> >> After probe:
> >> >>
> >> >> [    8.477669] func replicator_probe before reset replicator
> >> >> replicator1 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
> >> >> [    8.489470] func replicator_probe after reset replicator
> >> >> replicator1 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> >> >
> >> > AFAICS, after the reset both of them are set to 0xff.
> >>
> >> Yes I see this too as we call replicator_reset() in probe. What I
> >> wanted
> >> to highlight was the below part where it is set to 0x0 before enabling
> >> dynamic replicator.
> >>
> >> >
> >> >> [    8.502738] func replicator_probe before reset replicator
> >> >> replicator0 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
> >> >> [    8.515214] func replicator_probe after reset replicator
> >> >> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> >> >
> >> >
> >> >
> >> >> localhost ~ #
> >> >> localhost ~ #
> >> >> localhost ~ # echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> >> >> localhost ~ #
> >> >> localhost ~ # echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> >> >> [   58.490485] func dynamic_replicator_enable before reset replicator
> >> >> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> >> >> [   58.503246] func dynamic_replicator_enable after reset replicator
> >> >> replicator0 REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
> >> >> [   58.520902] func dynamic_replicator_enable before reset replicator
> >> >> replicator1 REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
> >> >
> >> > You need to find what is resetting the IDFILTERs to 0 for replicator1.
> >> >
> >>
> >> That is right.
> >>
> >
> > By default all replicators have the IDFILTER registers set to 0 out of
> > hardware reset. This ensures that programmable replicators behave in
> > the same way as non-programmable replicators out of reset.
> >
> > The  dynamic_replicator_reset() is of course a driver state reset -
> > which filters out all trace on the output ports. The trace is then
> > enabled when we set the trace path from source to sink.
> >
>
> Thanks for these explanations.
>
> > It seems to me that you have 2 problems that need solving here:
> >
> > 1) Why does the reset_replicator() called from probe() _not_ work
> > correctly on replicator 1? It seems to work later if you introduce a
> > reset after more of the system has powered and booted. This is
> > startiing to look a little like a PM / clocking issue.
>
> reset_replicator() does work in probe correctly for both replicators,
> below logs is collected before and after reset in probe. It is later
> that it's set back to 0x0 and hence the suggestion to look at firmware
> using this replicator1.
>
OK - sorry I read your statement saying that replicator1 was 0 after
the reset in probe(), rather than look at the logs.

From the logs it is working at the time probe() occurs, but by the
time we come to enable the replicator later, something has reset these
registers / hardware outside the control of the replicator driver.


> [    8.477669] func replicator_probe before reset replicator replicator1
> REPLICATOR_IDFILTER0=0x0 REPLICATOR_IDFILTER1=0x0
> [    8.489470] func replicator_probe after reset replicator replicator1
> REPLICATOR_IDFILTER0=0xff REPLICATOR_IDFILTER1=0xff
>
> >
> > This failure is causing the state when we are trying to set an output
> > port that both branches of this replicator are enabled for output.
> > In effect for this replicator, setting the output port has no effect
> > as it is already enabled.
> >
> > 2) Why does having both ports of this repilicator enabled cause a hard
> > lockup? This is a separate hardware  / system issue.
> >
> > The worst that should happen if both branches of a replicator are
> > enabled is that you get undesirable back pressure. (e.g. there is a
> > system we have seen - I think it is Juno - where there is a static
> > replicator feeding the TPIU and ETR - we need to disable the TPIU to
> > prevent undesired back pressure).
> >
>
> Ok so hardlockup is not expected because of this backpressure.
>

Hardlockup is not expected, but this is not related to any possible
backpressure.

Ordinarily having both legs of a replicator enabled should not cause
system failure.

Mike

> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

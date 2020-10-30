Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B992A0C63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 18:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgJ3R0W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 13:26:22 -0400
Received: from z5.mailgun.us ([104.130.96.5]:41767 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726885AbgJ3R0V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 13:26:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604078780; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ApagzBEHmy4pQ9nSEZNslcZNN8M1wmnYo5rgOzRaMxA=;
 b=XlsderXZVNZpSgxXtmoT0T2w5j+pWtst7X4LVMyc5w1NRpdq+m8KQ8ly1JARg5JSQp9ha3YO
 9OiX2B1gmcpLb/WATAwuPYGwih+7zx1lgKee6b+swQh+FWVAn+aLWt427qsRrPos8hh2aIJw
 zhDbOYPz0fcSwRg9KqA/WTTaCfk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f9c4cb3d5ed89ceee4afc9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 17:26:10
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E248BC433AF; Fri, 30 Oct 2020 17:26:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87166C433CB;
        Fri, 30 Oct 2020 17:26:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 30 Oct 2020 22:56:09 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Suzuki Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 2/4] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
In-Reply-To: <20201030164806.GB1301231@xps15>
References: <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
 <20201023094115.GR2611@hirez.programming.kicks-ass.net>
 <bd8c136d-9dfa-a760-31f9-eb8d6698aced@arm.com>
 <20201023105431.GM2594@hirez.programming.kicks-ass.net>
 <2457de8f-8bc3-b350-fdc7-61276da31ce6@arm.com>
 <20201023131628.GY2628@hirez.programming.kicks-ass.net>
 <728fd89c-78f2-0c5c-0443-c91c62b02f0e@arm.com>
 <20201023134416.GA2628@hirez.programming.kicks-ass.net>
 <20201023203729.GA819775@xps15>
 <70e3a508af119be481c8f0a0acf0a44d@codeaurora.org>
 <20201030164806.GB1301231@xps15>
Message-ID: <85c285361ce1c71b1a8274493aab9ca7@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 2020-10-30 22:18, Mathieu Poirier wrote:
> On Fri, Oct 30, 2020 at 01:29:56PM +0530, Sai Prakash Ranjan wrote:
>> Hello guys,
>> 
>> On 2020-10-24 02:07, Mathieu Poirier wrote:
>> > On Fri, Oct 23, 2020 at 03:44:16PM +0200, Peter Zijlstra wrote:
>> > > On Fri, Oct 23, 2020 at 02:29:54PM +0100, Suzuki Poulose wrote:
>> > > > On 10/23/20 2:16 PM, Peter Zijlstra wrote:
>> > > > > On Fri, Oct 23, 2020 at 01:56:47PM +0100, Suzuki Poulose wrote:
>> > >
>> > > > > > That way another session could use the same sink if it is free. i.e
>> > > > > >
>> > > > > > perf record -e cs_etm/@sink0/u --per-thread app1
>> > > > > >
>> > > > > > and
>> > > > > >
>> > > > > > perf record -e cs_etm/@sink0/u --per-thread app2
>> > > > > >
>> > > > > > both can work as long as the sink is not used by the other session.
>> > > > >
>> > > > > Like said above, if sink is shared between CPUs, that's going to be a
>> > > > > trainwreck :/ Why do you want that?
>> > > >
>> > > > That ship has sailed. That is how the current generation of systems are,
>> > > > unfortunately. But as I said, this is changing and there are guidelines
>> > > > in place to avoid these kind of topologies. With the future
>> > > > technologies, this will be completely gone.
>> > >
>> > > I understand that the hardware is like that, but why do you want to
>> > > support this insanity in software?
>> > >
>> > > If you only allow a single sink user (group) at the same time, your
>> > > problem goes away. Simply disallow the above scenario, do not allow
>> > > concurrent sink users if sinks are shared like this.
>> > >
>> > > Have the perf-record of app2 above fail because the sink is in-user
>> > > already.
>> >
>> > I agree with you that --per-thread scenarios are easy to deal with, but
>> > to
>> > support cpu-wide scenarios events must share a sink (because there is
>> > one event
>> > per CPU).  CPU-wide support can't be removed because it has been around
>> > for close to a couple of years and heavily used. I also think using the
>> > pid of
>> > the process that created the events, i.e perf, is a good idea.  We just
>> > need to
>> > agree on how to gain access to it.
>> >
>> > In Sai's patch you objected to the following:
>> >
>> > > +     struct task_struct *task = READ_ONCE(event->owner);
>> > > +
>> > > +     if (!task || is_kernel_event(event))
>> >
>> > Would it be better to use task_nr_pid(current) instead of event->owner?
>> > The end
>> > result will be exactly the same.  There is also no need to check the
>> > validity of
>> > @current since it is a user process.
>> >
>> 
>> We have devices deployed where these crashes are seen consistently,
>> so for some immediate relief, could we atleast get some fix in this
>> cycle without major design overhaul which would likely take more time.
>> Perhaps my first patch [1] without any check for owner or
>> I can post a new version as Suzuki suggested [2] dropping the export
>> of is_kernel_event(). Then we can always work on top of it based on 
>> the
>> conclusion of this discussion, we will atleast not have the systems
>> crash in the meantime, thoughts?
> 
> For the time being I think [1], exactly the way it is, is a reasonable 
> way
> forward.
> 

Sure, I just checked now and [1] still applies neatly on top of 
coresight
next branch.

[1] https://lore.kernel.org/patchwork/patch/1318098/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

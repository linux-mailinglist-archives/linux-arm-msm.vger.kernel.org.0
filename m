Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD3F2960DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 16:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368111AbgJVOXh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 10:23:37 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:40694 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S368117AbgJVOXh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 10:23:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603376616; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5qB5Dccn15buC2KJI/Udo57VxjYkbuR0df0+slTqVyE=;
 b=fFlaaB0N1iXx4H4H/y0u6vY02kydoeZ0fSc5aciDmbk/Sz3U6jFurKpbuBj7aQ6g5z0sv1OJ
 QMgvK+JT7KSLJS3c3B3iM7/DsCDk+87Ary0KwnINTxW56RcB5QXYhx55XMDeohvTyC6z3gdV
 YGZBav0i2V38FZrVhVAiTZ/GJmI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f9195e53711fec7b136efd4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 14:23:33
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2C0ABC43395; Thu, 22 Oct 2020 14:23:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 40BC8C433CB;
        Thu, 22 Oct 2020 14:23:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 22 Oct 2020 19:53:32 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCHv2 2/4] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
In-Reply-To: <20201022133414.GH2611@hirez.programming.kicks-ass.net>
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <a6eadc723ae52396a655c61b9f8d4eef@codeaurora.org>
 <20201022133414.GH2611@hirez.programming.kicks-ass.net>
Message-ID: <8ecb29f116a78855ca59928c1e0e1eb7@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-22 19:04, Peter Zijlstra wrote:
> On Thu, Oct 22, 2020 at 06:19:37PM +0530, Sai Prakash Ranjan wrote:
>> On 2020-10-22 17:02, Peter Zijlstra wrote:
>> > On Thu, Oct 22, 2020 at 04:27:52PM +0530, Sai Prakash Ranjan wrote:
>> >
>> > > Looking at the ETR and other places in the kernel, ETF and the
>> > > ETB are the only places trying to dereference the task(owner)
>> > > in tmc_enable_etf_sink_perf() which is also called from the
>> > > sched_in path as in the call trace.
>> >
>> > > @@ -391,6 +392,10 @@ static void *tmc_alloc_etf_buffer(struct
>> > > coresight_device *csdev,
>> > >  {
>> > >  	int node;
>> > >  	struct cs_buffers *buf;
>> > > +	struct task_struct *task = READ_ONCE(event->owner);
>> > > +
>> > > +	if (!task || is_kernel_event(event))
>> > > +		return NULL;
>> >
>> >
>> > This is *wrong*... why do you care about who owns the events?
>> >
>> 
>> The original issue was the owner being NULL and causing
>> a NULL pointer dereference. I did ask some time back
>> if it is valid for the owner to be NULL [1] and should
>> probably be handled in events core?
> 
> No, what I asked is why do you care about ->owner to begin with? That
> seems wrong. A driver should not touch ->owner _at_all_.
> 

Ah ok, so Suzuki explained that in other reply and if there is
some other better way?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

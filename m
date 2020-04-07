Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08B8E1A0AEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 12:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgDGKT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 06:19:57 -0400
Received: from foss.arm.com ([217.140.110.172]:54460 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbgDGKT5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 06:19:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC2CC1FB;
        Tue,  7 Apr 2020 03:19:56 -0700 (PDT)
Received: from [10.37.12.154] (unknown [10.37.12.154])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10FA63F73D;
        Tue,  7 Apr 2020 03:19:54 -0700 (PDT)
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
To:     saiprakash.ranjan@codeaurora.org, mike.leach@linaro.org
Cc:     mathieu.poirier@linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
 <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <906d374d-a4d6-f2f2-6845-88b97a5ff7d9@arm.com>
Date:   Tue, 7 Apr 2020 11:24:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/07/2020 10:46 AM, Sai Prakash Ranjan wrote:
> Hi Mike,
> 
> Thanks for taking a look.
> 
> On 2020-04-06 16:25, Mike Leach wrote:
>> Hi,
>>
>> The programmable replicator hardware by design enables trace through
>> both ports on reset. (see 1, section 4.4, 9.11)  The replicator driver
>> overrides this functionality to disable output, until the Coresight
>> infrastructure chooses a path from source to sink.
>> Now given that the hardware design is such that we must be able to
>> allow trace to be sent to both ports, a generic patch to prevent this
>> does not seem appropriate here.
>>
>> I think this needs further investigation - to determine why this
>> appears to be failing in this particular instance.
>>
> 
> Yes, this probably needs further investigation, but CPU hardlock stack
> trace doesnt help much. I could always trigger this hard lockup without
> this patch on SC7180 SoC and this is only seen when ETR is used as the 
> sink.
> 
> The only difference I could see between non working case (on SC7180 [1]) 
> and
> the working case (on SDM845 [2]) is the path from source to sink.


> 
> SC7180 source to sink path(Not working):
> ----------------------------------------
> 
>        etm0_out
>       |
>    apss_funnel_in0
>           |
>   apss_merge_funnel_in
>           |
>       funnel1_in4
>       |
>    merge_funnel_in1
>       |
>     swao_funnel_in
>           |
>         etf_in
>       |
>   swao_replicator_in
>           |
>    replicator_in
>       |
>         etr_in


There seems to be two replicators back to back here. What is connected
to the other output of both of them ? Are there any TPIUs ? What happens
if you choose a sink on the other end of "swao_replicator" (ETB ?)

After boot, what do the idfilter registers read for both the replicators ?


I believe we need to properly assign the TRACE_IDs for tracing sessions,
(rather than static ids) in a way such that we could filter them and use
the multiple sinks in parallel for separate trace sessions and this is
not simple (involves kernel driver changes and the perf tool to be able
to decode the trace id changes too).


So for the moment, we need to :

1) Disallow turning the replicator ON, when it is already turned ON
2) Do what your patch does. i.e, disable the other end while one end
    is turned on.

Thoughts ?

Kind regards
Suzuki

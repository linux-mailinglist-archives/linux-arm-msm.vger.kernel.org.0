Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91668158932
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 05:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgBKEqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 23:46:21 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:24718 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726219AbgBKEqV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 23:46:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581396380; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Vf1UBypaOO4wm7gSUEA6iBZFSN7xzA5hrx7GNrypxkY=; b=Zzi8U0PM78O2Gux8t1swZuqeASnQk6J0uA07Z/qemJ0ywppg3THeHFWcN5s8Llel1UR2Ixa5
 nBwAyiMVJLED8Xpv2ycdpp7158zPABJrKdV+iWX2gJV1TDNoRfS3GGfF2UNqs7nYYnjF3FsL
 K34WuUt6TtazEajTRgKUDNIOZPE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e423191.7fd8403b8bc8-smtp-out-n03;
 Tue, 11 Feb 2020 04:46:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9C20EC4479C; Tue, 11 Feb 2020 04:46:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.218.68] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26C4BC43383;
        Tue, 11 Feb 2020 04:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26C4BC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: Query: Regarding Notifier chain callback debugging or profiling
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     akpm@linux-foundation.org,
        linux-kernel <linux-kernel@vger.kernel.org>, tglx@linutronix.de,
        linux-arm-msm@vger.kernel.org, neeraju@codeaurora.org
References: <82d5b63e-4ae6-fb5f-8a1c-2d5755db2638@codeaurora.org>
 <6e077b43-6c9e-3f4e-e079-db438e36a4eb@codeaurora.org>
 <20200210210626.GA1373304@kroah.com>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <9d3206f9-5554-1f1d-7ee0-61fdcdf3070e@codeaurora.org>
Date:   Tue, 11 Feb 2020 10:16:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210210626.GA1373304@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/11/2020 2:36 AM, Greg KH wrote:
> On Mon, Feb 10, 2020 at 05:26:16PM +0530, Gaurav Kohli wrote:
>> Hi,
>>
>> In Linux kernel, everywhere we are using notification chains to notify for
>> any kernel events, But we don't have any debugging or profiling mechanism to
>> know which callback is taking time or currently we are stuck on which call
>> back(without dumps it is difficult to say for last problem)
> 
> Callbacks are a mess, I agree.
> 
>> Below are the few ways, which we can implement to profile callback on need
>> basis:
>>
>> 1) Use trace event before and after callback:
>>
>> static int notifier_call_chain(struct notifier_block **nl,
>>                                 unsigned long val, void *v,
>>                                 int nr_to_call, int *nr_calls)
>> {
>>          int ret = NOTIFY_DONE;
>>          struct notifier_block *nb, *next_nb;
>>
>>
>> +		trace_event for entry of callback
>>                  ret = nb->notifier_call(nb, val, v);
>> +		trace_event for exit of callback
> 
> Ick.
> 
>>          }
>>          return ret;
>> }
>>
>> 2) Or use pr_debug instead of trace_event
>>
>> 3) Both of the above approach has certain problems, like it will dump
>> callback for each notifier chain, which might flood trace buffer or dmesg.
>>
>> So we can use bool variable to control that and dump the required
>> notification chain only.
>>
>> Some thing like below we can use:
>>
>>   struct srcu_notifier_head {
>>          struct mutex mutex;
>>          struct srcu_struct srcu;
>>          struct notifier_block __rcu *head;
>> +       bool debug_callback;
>>   };
>>
>>
>>   static int notifier_call_chain(struct notifier_block **nl,
>>                                 unsigned long val, void *v,
>> -                              int nr_to_call, int *nr_calls)
>> +                              int nr_to_call, int *nr_calls, bool
>> debug_callback)
>>   {
>>          int ret = NOTIFY_DONE;
>>          struct notifier_block *nb, *next_nb;
>> @@ -526,6 +526,7 @@ void srcu_init_notifier_head(struct srcu_notifier_head
>> *nh)
>>          if (init_srcu_struct(&nh->srcu) < 0)
>>                  BUG();
>>          nh->head = NULL;
>> +       nh->debug_callback = false; -> by default it would be false for
>> every notifier chain.
>>
>> 4) we can also think of something pre and post function, before and after
>> each callback, And we can enable only for those who wants to profile.
>>
>> Please let us what approach we can use, or please suggest some debugging
>> mechanism for the same.
> 
> Why not just pay attention to the specific notifier you want?  Trace
> when the specific blocking_notifier_call_chain() is called.
> 
> What specific notifier call chain is causing you problems that you need
> to debug?

Thanks Greg for the reply.
I agree, we can trace specific notifier chain, but that is very hacky(we 
have to add debug code here and there when problems comes)

We are using lot of SRCU notifier callchain to notify clients for 
events, And if we have something generic debugging mechanism, we just 
have to switch on for that particular client for initial testing phase.

As mentioned above, if we can come up with something like below then 
only client has to switch on who wants to debug:
 >>   struct srcu_notifier_head {
 >>          struct mutex mutex;
 >>          struct srcu_struct srcu;
 >>          struct notifier_block __rcu *head;
 >> +       bool debug_callback; -> this we can turn on for particular 
client.
 >>   };

Right now we don't have any generic way to debug notifier chains, please 
suggest some approach. On live target, it is difficult to say where 
notification chain got stuck.


Regards
Gaurav
> 
> thanks,
> 
> greg k-h
> 

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

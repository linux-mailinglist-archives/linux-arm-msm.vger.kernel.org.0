Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C83273C09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 09:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbgIVHch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 03:32:37 -0400
Received: from z5.mailgun.us ([104.130.96.5]:15880 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729932AbgIVHch (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 03:32:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600759956; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=XMkIYt7brFpIOXbFvg/bEeHfh+eGJ7z5UeCurwHdJS4=; b=RnMkT5N1s1aYanbZ84B4e0GpkQ6K8QJwdngr//dnYpFcd5XyeGjvK7v6VPX2Zd0Ef8NmsTob
 oWzNCHKt8Wf1FfWNPGMp1kQtZcfaM0gSBQQzUG7gb8K+MtfkYz/Vgj1yBX62e4Ea+h0/3buR
 B2z15FYcqhawgshx0E3wIbOGXQE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f69a8568d7a44125d431e04 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 07:31:34
 GMT
Sender: gkohli=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A3A7C433FE; Tue, 22 Sep 2020 07:31:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.4] (unknown [117.98.148.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5E1BC433CB;
        Tue, 22 Sep 2020 07:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5E1BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH] trace: Fix race in trace_open and buffer resize call
From:   Gaurav Kohli <gkohli@codeaurora.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     mingo@redhat.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1599199797-25978-1-git-send-email-gkohli@codeaurora.org>
 <d4691a90-9a47-b946-f2cd-bb1fce3981b0@codeaurora.org>
 <2fe2a843-e2b5-acf8-22e4-7231d24a9382@codeaurora.org>
 <20200915092353.5b805468@gandalf.local.home>
 <08d6f338-3be3-c5a2-ba4b-0116de9672c2@codeaurora.org>
 <20200915141304.41fa7c30@gandalf.local.home>
 <17b53f76-fa90-0086-8a9e-de166b789e60@codeaurora.org>
Message-ID: <42818d2b-41b8-ef43-24eb-c7c75b939cf5@codeaurora.org>
Date:   Tue, 22 Sep 2020 13:01:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <17b53f76-fa90-0086-8a9e-de166b789e60@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/16/2020 12:02 PM, Gaurav Kohli wrote:

>>>
>>> Yes, got your point. then we can avoid export. Actually we are seeing
>>> issue in older kernel like 4.19/4.14/5.4 and there below patch was not
>>> present in stable branches:
>>>
>>> ommit b23d7a5f4a07 ("ring-buffer: speed up buffer resets by
>>>   > avoiding synchronize_rcu for each CPU")
>>
>> If you mark this patch for stable, you can add:
>>
>> Depends-on: b23d7a5f4a07 ("ring-buffer: speed up buffer resets by 
>> avoiding synchronize_rcu for each CPU")
>>
> 
> Thanks Steven, Yes this needs to be back ported. I have tried this in 
> 5.4 but this need more patches like
> 13292494379f92f532de71b31a54018336adc589
> tracing: Make struct ring_buffer less ambiguous
> 
> Instead of protecting all reset, can we do it individually like below:
> 
> 
> +++ b/kernel/trace/ring_buffer.c
> @@ -4838,7 +4838,9 @@ rb_reset_cpu(struct ring_buffer_per_cpu *cpu_buffer)
>   static void reset_disabled_cpu_buffer(struct ring_buffer_per_cpu 
> *cpu_buffer)
>   {
>          unsigned long flags;
> +       struct trace_buffer *buffer = cpu_buffer->buffer;
> 
> +       mutex_lock(&buffer->mutex);
>          raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
> 
>          if (RB_WARN_ON(cpu_buffer, local_read(&cpu_buffer->committing)))
> @@ -4852,6 +4854,7 @@ static void reset_disabled_cpu_buffer(struct 
> ring_buffer_per_cpu *cpu_buffer)
> 
>    out:
>          raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
> +       mutex_unlock(&buffer->mutex);
>   }
> 

Hi Steven,
Not seeing issue with above patch in 5.4, Please let me know if above 
approach looks good to you, will raise patch for same.

Otherwise we will raise patch for older approach by marking depends on 
of below patch:
depends-on: b23d7a5f4a07 ("ring-buffer: speed up buffer resets by

Thanks,
Gaurav
> Please let me know, if above looks good, we will do testing with this.
> And this we can directly use in older kernel as well in 
> ring_buffer_reset_cpu.
> 
>>>
>>> Actually i have also thought to take mutex lock in ring_buffer_reset_cpu
>>> while doing individual cpu reset, but this could cause another problem:
>>
>> Hmm, I think we should also take the buffer lock in the reset_cpu() call
>> too, and modify tracing_reset_cpu() the same way.
>>
> 
> if we take above patch, then this is not required.
> Please let me know for the approach.
>>>
>>> Different cpu buffer may have different state, so i have taken lock in
>>> tracing_reset_online_cpus.
>>
>> Why would different states be an issue in synchronizing?
>>
>> -- Steve
>>
> 
> Yes, this should not be problem.


-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

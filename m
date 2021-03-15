Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9E633B033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 11:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCOKpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 06:45:32 -0400
Received: from m42-2.mailgun.net ([69.72.42.2]:53004 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229868AbhCOKpT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 06:45:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615805118; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ylc7MyxGKHBcPhryCW6d+Kcj0fWmkTz65X3rtbGl2n8=; b=EKY5tM05ON6sXxDC/tiaQgor4ZKo0Q04L75fvnAelVWs1sMu/9Pc9oFjjLGla2BNebdJdA9s
 kNEVivvZZhvxxY4OXiIzZ5rDzdXZIkVUOtI+I5loyelVE9/kWlh1f+T9hWmoSrPj8ccyEU07
 963Bz+sEQGEjIvFZRnC7SBzFF7U=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 604f3abe1de5dd7b993e94f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 10:45:18
 GMT
Sender: ylal=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EDF41C433ED; Mon, 15 Mar 2021 10:45:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.172] (unknown [49.206.45.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ylal)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66AC4C433CA;
        Mon, 15 Mar 2021 10:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66AC4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ylal@codeaurora.org
Subject: Re: [PATCH] driver core: Use unbound workqueue for deferred probes
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, pkondeti@codeaurora.org,
        neeraju@codeaurora.org
References: <1614167749-22005-1-git-send-email-ylal@codeaurora.org>
 <YDZKCk+it/7RpgUJ@kroah.com>
 <a40db2a2-f58a-aaec-6976-977d4b9f9e0e@codeaurora.org>
 <YDeNq+mBXDlHUlG4@kroah.com>
From:   Yogesh Lal <ylal@codeaurora.org>
Message-ID: <8061fa06-f101-e932-c67d-193e305d20b8@codeaurora.org>
Date:   Mon, 15 Mar 2021 16:15:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YDeNq+mBXDlHUlG4@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/25/2021 5:14 PM, Greg KH wrote:
> On Thu, Feb 25, 2021 at 04:03:50PM +0530, Yogesh Lal wrote:
>> Hi Greg,
>>
>>
>> On 2/24/2021 6:13 PM, Greg KH wrote:
>>> On Wed, Feb 24, 2021 at 05:25:49PM +0530, Yogesh Lal wrote:
>>>> Queue deferred driver probes on unbounded workqueue, to allow
>>>> scheduler better manage scheduling of long running probes.
>>>
>>> Really?  What does this change and help?  What is the visable affect of
>>> this patch?  What problem does it solve?
>>>
>>
>> We observed boot up improvement (~400 msec) when the deferred probe work is
>> made unbound. This is due to scheduler moving the worker running deferred
>> probe work to big CPUs. without this change, we see the worker is running on
>> LITTLE CPU due to affinity.
> 
> Why is none of this information in the changelog text?  How are we
> supposed to know this?  And is this 400msec out of 10 seconds or

We wanted to  first understand the requirement of bounded deferred probe 
why it was really required.

> something else?  Also, this sounds like your "little" cpus are really
> bad, you might want to look into fixing them first :)
> 

~600ms (deferred probe bound to little core) and ~200ms (deferred probe 
queued on unbound wq).

> But if you really want to make this go faster, do not deferr your probe!
> Why not fix that problem in your drivers instead?
> 

Yes, we are exploring in that direction as well but want to get upstream 
opinion and understand the usability of unbounded wq.

>> Please let us now if there are any concerns/restrictions that deferred probe
>> work should run only on pinned kworkers. Since this work runs deferred probe
>> of several devices , the locality may not be that important
> 
> Can you prove that it is not important?  I know lots of gyrations are
> done in some busses to keep probe happening on the same CPU for very
> good reasons.  Changing that should not be done lightly as you will
> break this.

While debugging further and checking if probe are migrating found that 
init thread can potentially migrate, as it has cpu affinity set to all 
cpus, during driver probe (or there is something which prevents it, 
which I am missing?) . Also, async probes use unbounded workqueue.
So, using unbounded wq for deferred probes looks to be similar to these, 
w.r.t. scheduling behavior.


> 
> thanks,
> 
> greg k-h
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

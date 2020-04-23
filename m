Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137FB1B5B47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 14:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgDWMWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 08:22:04 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:57727 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726164AbgDWMWE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 08:22:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587644523; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xmKbPe6qYAz7syjI+7B563Vnwnt8egJotMv+Ym61YWs=;
 b=P62W6e1ev+m8s8zQQDfgOAVPrDF9D24TYHyzqQUVZRGjv6bBZQd/TN8vSXYizTIKTVD3VkzZ
 3NoC1JUuD+vCdgaUhj5cAM4pYyVuf/fk8RSpPGxEhl2a+Xj7vBmunFiGtWSMYVR9QmFxyCZj
 MwU17aASpriR/ub0Mwy17QA46b8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea18856.7f73800a3618-smtp-out-n01;
 Thu, 23 Apr 2020 12:21:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1194C43636; Thu, 23 Apr 2020 12:21:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04DC7C433CB;
        Thu, 23 Apr 2020 12:21:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 23 Apr 2020 17:51:40 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
In-Reply-To: <e9c299c4-caeb-9eb8-f019-b311bfce756a@arm.com>
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
 <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
 <906d374d-a4d6-f2f2-6845-88b97a5ff7d9@arm.com>
 <39a2b3fff165a108fa59d72b630b5f14@codeaurora.org>
 <bb209f80-ac02-6321-dac4-ebf9ee6fa9a0@arm.com>
 <bd05b31c2391edfff5044f22f2f83edf@codeaurora.org>
 <e9c299c4-caeb-9eb8-f019-b311bfce756a@arm.com>
Message-ID: <526ee10ba1df05b41f9471613550a0fd@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-04-07 20:23, Suzuki K Poulose wrote:
> On 04/07/2020 02:56 PM, Sai Prakash Ranjan wrote:
>> Hi Suzuki,
>> 
>> On 2020-04-07 18:38, Suzuki K Poulose wrote:
>>> On 04/07/2020 12:29 PM, Sai Prakash Ranjan wrote:
>>>> Hi Suzuki,
>>>> 
>>>> Thanks for looking into this issue.
>>>> 
>>>> On 2020-04-07 15:54, Suzuki K Poulose wrote:
>>>>> On 04/07/2020 10:46 AM, Sai Prakash Ranjan wrote:
>>>>> 
>>>>> There seems to be two replicators back to back here. What is 
>>>>> connected
>>>>> to the other output of both of them ? Are there any TPIUs ? What 
>>>>> happens
>>>>> if you choose a sink on the other end of "swao_replicator" (ETB ?)
>>>>> 
>>>> 
>>>> The other outport of swao replicator is connected to EUD which is a
>>>> QCOM specific HW which can be used as a sink like USB.
>>>> And the other outport of other replicator(replicator_out) is 
>>>> connected to
>>>> TPIU.
>>>> 
>>>>> After boot, what do the idfilter registers read for both the 
>>>>> replicators ?
>>>>> 
>>>> 
>>>> Added some prints in replicator_probe.
>>>> 
>>>>   replicator probe ret=-517 devname=6046000.replicator idfilter0=0x0 
>>>> idfilter1=0x0
>>>>   replicator probe ret=0 devname=6b06000.replicator idfilter0=0xff 
>>>> idfilter1=0xff
>>>>   replicator probe ret=0 devname=6046000.replicator idfilter0=0xff 
>>>> idfilter1=0xff
>>> 
>>> Curious to see how the idfilterX is set to 0:
>>>      if that is never used.
>>>         Or
>>>      if the user doesn't reset it back to 0xff.
>>> 
>> 
>> For both replicators, the default value seems to be 0x0.
>> 
>>   replicator probe in res ret=0 devname=6046000.replicator 
>> idfilter0=0x0 idfilter1=0x0
>>   replicator probe ret=-517 devname=6046000.replicator idfilter0=0x0 
>> idfilter1=0x0
>>   replicator probe in res ret=0 devname=6b06000.replicator 
>> idfilter0=0x0 idfilter1=0x0
>>   replicator probe ret=0 devname=6b06000.replicator idfilter0=0xff 
>> idfilter1=0xff
>>   replicator probe in res ret=0 devname=6046000.replicator 
>> idfilter0=0x0 idfilter1=0x0
>>   replicator probe ret=0 devname=6046000.replicator idfilter0=0xff 
>> idfilter1=0xff
> 
> I am not sure how you have added the debugs, but it looks like the
> drivers set 0xff for both the port filters on a successful probe.
> 

About the earlier mentioned points on:

1) Disallow turning the replicator ON, when it is already turned ON
2) Do what your patch does. i.e, disable the other end while one end
    is turned on.

Do we need 1) and should we go ahead with this?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8943F1A1007
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 17:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbgDGPS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 11:18:58 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:31646 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729064AbgDGPS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 11:18:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586272736; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MkHWeN7jEYivOg5ls6MEofDm2yhzyIloU6lj3iDRPEs=;
 b=dKwo/ZV25eoEOHn5mobbkJbkvkxMh09wV1XYP2tVpQFRPjLqV+9NUEY5kWYc0lAlDiy4YXm9
 DQWwWgWmGX9j8ngnrpUUkbJQnwSSWAa2wFaUfZ23LEt1F66MdWw81vRaSasCO9A/MQ75dBR3
 R+4cAROcnR5aS0B2A9KN3WtYinA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c99e0.7f42bc7b51f0-smtp-out-n05;
 Tue, 07 Apr 2020 15:18:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 390D5C44788; Tue,  7 Apr 2020 15:18:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 63272C433D2;
        Tue,  7 Apr 2020 15:18:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 07 Apr 2020 20:48:54 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
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
Message-ID: <a7074f44ebbde720b5e0189801eab7c9@codeaurora.org>
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

Yes, thats done by replicator_reset in probe right? Below is the diff:

@@ -242,6 +244,9 @@ static int replicator_probe(struct device *dev, 
struct resource *res)
                 }
                 drvdata->base = base;
                 desc.groups = replicator_groups;
+               pr_info("replicator probe in res ret=%d devname=%s 
idfilter0=%#lx idfilter1=%#lx\n",
+                       ret, dev_name(dev), (readl_relaxed(base + 
REPLICATOR_IDFILTER0)),
+                       (readl_relaxed(base + REPLICATOR_IDFILTER1)));
         }

         dev_set_drvdata(dev, drvdata);
@@ -272,6 +277,12 @@ static int replicator_probe(struct device *dev, 
struct resource *res)
  out_disable_clk:
         if (ret && !IS_ERR_OR_NULL(drvdata->atclk))
                 clk_disable_unprepare(drvdata->atclk);
+
+       if (res)
+               pr_info("replicator probe ret=%d devname=%s 
idfilter0=%#lx idfilter1=%#lx\n",
+                       ret, dev_name(dev), (readl_relaxed(base + 
REPLICATOR_IDFILTER0)),
+                       (readl_relaxed(base + REPLICATOR_IDFILTER1)));
+
         return ret;
  }

>> 
>>> Does your test ever touch EUD (enable the port for EUD at
>>> swao-replicator) ? What are the values before you run your test ?
>>> 
>>> 
>> 
>> No, we do not use EUD, downstream it is used as dummy sink.
>> And I just try to select the ETR as the sink and enable ETM0 as the 
>> trace source.
>> 
>> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>> 
>> Also I see the KASAN warning but that seems like some other issue.
>> 
> 
> Does your funnel have sparse input described ? I think we have an
> issue with the "refcnt" tracking for funnels (especially). When we
> have a sparse input ports described (ie. if only input ports 0, 3,
> 5 are described to protect the secure side connections), we could
> end up accessing beyond the memory allocated for csdev->refcnts.
> i.e, csdev->pdata->nr_inport = 3, and we could access 
> csdev->refcnts[5],
> while sizeof(csdev->refcnts) = sizeof(atomic_t) * 3.
> 
> I will send a patch.
> 

Thanks, I can test it out.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

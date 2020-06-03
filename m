Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878731ED0E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 15:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgFCNeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 09:34:16 -0400
Received: from foss.arm.com ([217.140.110.172]:33540 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgFCNeQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 09:34:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E2C355D;
        Wed,  3 Jun 2020 06:34:15 -0700 (PDT)
Received: from [10.57.0.45] (unknown [10.57.0.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 828073F52E;
        Wed,  3 Jun 2020 06:34:13 -0700 (PDT)
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
To:     Mike Leach <mike.leach@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15>
 <6d759cc28628ea72767c1304883630eb@codeaurora.org>
 <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
 <f0357072de96970b641bbd0da98c1d61@codeaurora.org>
 <CAJ9a7Vj9STJw4jBxWU_9wHftj4Q7+k8o1nTc8tr21KjYi0RkpQ@mail.gmail.com>
 <4a09cd2e054836d85f2e024ca4435e91@codeaurora.org>
 <CAJ9a7VgCFeHNbY_9Gwvu6uT9MFBeY=_GCaN4N1dwmm+iNpfJOw@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1a5a6a6d-b86d-df45-cf91-7081e70d88a3@arm.com>
Date:   Wed, 3 Jun 2020 14:34:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ9a7VgCFeHNbY_9Gwvu6uT9MFBeY=_GCaN4N1dwmm+iNpfJOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-03 14:22, Mike Leach wrote:
> Hi Sai,
> 
> On Wed, 3 Jun 2020 at 13:14, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>>
>> Hi Mike,
>>
>> On 2020-06-03 16:57, Mike Leach wrote:
>>> Hi,
>>>
>>> On Wed, 3 Jun 2020 at 11:24, Sai Prakash Ranjan
>>> <saiprakash.ranjan@codeaurora.org> wrote:
>>>>
>>>> Hi Mike,
>>>>
>>>> Thanks again for looking at this.
>>>>
>>>> On 2020-06-03 03:42, Mike Leach wrote:
>>>> [...]
>>>>
>>>>>>
>>>>>> SMMU/IOMMU won't be able to do much here as it is the client's
>>>>>> responsiblity to
>>>>>> properly shutdown and SMMU device link just makes sure that
>>>>>> SMMU(supplier) shutdown is
>>>>>> called only after its consumers shutdown callbacks are called.
>>>>>
>>>>> I think this use case can be handled slightly differently than the
>>>>> general requirements for modular CoreSight drivers.
>>>>>
>>>>> What is needed here is a way of stopping the underlying ETR hardware
>>>>> from issuing data to the SMMU, until the entire device has been shut
>>>>> down, in a way that does not remove the driver, breaking existing
>>>>> references and causing a system crash.
>>>>>
>>>>> We could introduce a new mode to the ETR driver - e.g.
>>>>> CS_MODE_SHUTDOWN.
>>>>>
>>>>> At the end of the block tmc_shutdown(struct amba_device *adev), set
>>>>> drvdata->mode to CS_MODE_SHUTDOWN & remove the coresight_unregister().
>>>>> This new mode can be used to  prevent the underlying hardware from
>>>>> being able to restart until the device is re-powered.
>>>>>
>>>>> This mode can be detected in the code that enables / disables the ETR
>>>>> and handled appropriately (updates to tmc_enable_etr_sink and
>>>>> tmc_disable_etr_sink).
>>>>> This mode will persist until the device is re-started - but because we
>>>>> are on the device shutdown path this is not an issue.
>>>>>
>>>>> This should leave the CoreSight infrastructure stable until the
>>>>> drivers are shut down normally as part of the device power down
>>>>> process.
>>>>>
>>>>
>>>> Sounds good to me, but if the coresight_unregister() is the trouble
>>>> point
>>>> causing these crashes, then can't we just remove that from
>>>> tmc_shutdown()
>>>> callback? This would be like maintaining the same behaviour as now
>>>> where
>>>> on reboot/shutdown we basically don't do anything except for disabling
>>>> ETR.
>>>
>>> No - the new mode prevents race conditions where the thread shutting
>>> down the SMMU does the ETR shutdown, but then another thread happens
>>> to be trying to start trace and restarts the ETR.
>>> It also prevents the condition Mathieu discussed where a thread might
>>> be attempting to shutdown trace - this could try to disable the
>>> hardware again re-releasing resources/ re-flushing and waiting for
>>> stop.
>>>
>>
>> I do not think there will a race between SMMU shutdown and ETR shutdown.
>> Driver core takes care of calling SMMU shutdown after its consumer
>> shutdown callbacks via device link, otherwise there would already be
>> bugs in all other client drivers.
>>
> 
> I am not saying there could be a race between tmc_shutdowm and
> Smmu_shutdown - there may be a case if the coresight_disable_path
> sequence is running and gets to the point of disabling the ETR after
> the SMMU callback has disabled it.

I'm confused now - there is no "SMMU callback", we're talking about the 
system-wide cleanup from kernel_shutdown_prepare() or 
kernel_restart_prepare(). As far as I'm aware userspace should be long 
gone by that point, so although trace may have been left running, the 
chance of racing against other driver operations seems pretty unlikely.

Robin.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27FD1ED19F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 16:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgFCOCn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 10:02:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43342 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgFCOCm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 10:02:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591192961; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=J214EwOvlFydBxA2xNNpRsC3SX8eUgmp6bfcai4+/EE=;
 b=II+p6nEShzZ8M4I++k8nNIGdJ5iphDvk7SeWIFi6fNZMYaRaDe5Kza4C8jwa1H+4odwB2Tal
 ommOgdcOgFEQQvnJ7/o9DU2IDyCPyEBOCrQLCMCT2ZP8lzNuqAdqScq/FTO8Vp5458JM5gqq
 yj3f9wviKmOyb/NjZ75RGZI+KHE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ed7ad5b3131442d9503063a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Jun 2020 14:02:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46E90C43395; Wed,  3 Jun 2020 14:02:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37166C433CA;
        Wed,  3 Jun 2020 14:02:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Jun 2020 19:32:01 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
In-Reply-To: <CAJ9a7Vj3sL=4O3DU+aJWYLhue1UxQmX4Ba5JdEnmxKDEYo_z4Q@mail.gmail.com>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15>
 <6d759cc28628ea72767c1304883630eb@codeaurora.org>
 <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
 <f0357072de96970b641bbd0da98c1d61@codeaurora.org>
 <CAJ9a7Vj9STJw4jBxWU_9wHftj4Q7+k8o1nTc8tr21KjYi0RkpQ@mail.gmail.com>
 <4a09cd2e054836d85f2e024ca4435e91@codeaurora.org>
 <CAJ9a7VgCFeHNbY_9Gwvu6uT9MFBeY=_GCaN4N1dwmm+iNpfJOw@mail.gmail.com>
 <1a5a6a6d-b86d-df45-cf91-7081e70d88a3@arm.com>
 <CAJ9a7Vj3sL=4O3DU+aJWYLhue1UxQmX4Ba5JdEnmxKDEYo_z4Q@mail.gmail.com>
Message-ID: <d6efeb9a327ecea615f0f537e0bac616@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 2020-06-03 19:21, Mike Leach wrote:
> Hi,
> 
> 
> On Wed, 3 Jun 2020 at 14:34, Robin Murphy <robin.murphy@arm.com> wrote:
>> 
>> On 2020-06-03 14:22, Mike Leach wrote:
>> > Hi Sai,
>> >
>> > On Wed, 3 Jun 2020 at 13:14, Sai Prakash Ranjan
>> > <saiprakash.ranjan@codeaurora.org> wrote:
>> >>
>> >> Hi Mike,
>> >>
>> >> On 2020-06-03 16:57, Mike Leach wrote:
>> >>> Hi,
>> >>>
>> >>> On Wed, 3 Jun 2020 at 11:24, Sai Prakash Ranjan
>> >>> <saiprakash.ranjan@codeaurora.org> wrote:
>> >>>>
>> >>>> Hi Mike,
>> >>>>
>> >>>> Thanks again for looking at this.
>> >>>>
>> >>>> On 2020-06-03 03:42, Mike Leach wrote:
>> >>>> [...]
>> >>>>
>> >>>>>>
>> >>>>>> SMMU/IOMMU won't be able to do much here as it is the client's
>> >>>>>> responsiblity to
>> >>>>>> properly shutdown and SMMU device link just makes sure that
>> >>>>>> SMMU(supplier) shutdown is
>> >>>>>> called only after its consumers shutdown callbacks are called.
>> >>>>>
>> >>>>> I think this use case can be handled slightly differently than the
>> >>>>> general requirements for modular CoreSight drivers.
>> >>>>>
>> >>>>> What is needed here is a way of stopping the underlying ETR hardware
>> >>>>> from issuing data to the SMMU, until the entire device has been shut
>> >>>>> down, in a way that does not remove the driver, breaking existing
>> >>>>> references and causing a system crash.
>> >>>>>
>> >>>>> We could introduce a new mode to the ETR driver - e.g.
>> >>>>> CS_MODE_SHUTDOWN.
>> >>>>>
>> >>>>> At the end of the block tmc_shutdown(struct amba_device *adev), set
>> >>>>> drvdata->mode to CS_MODE_SHUTDOWN & remove the coresight_unregister().
>> >>>>> This new mode can be used to  prevent the underlying hardware from
>> >>>>> being able to restart until the device is re-powered.
>> >>>>>
>> >>>>> This mode can be detected in the code that enables / disables the ETR
>> >>>>> and handled appropriately (updates to tmc_enable_etr_sink and
>> >>>>> tmc_disable_etr_sink).
>> >>>>> This mode will persist until the device is re-started - but because we
>> >>>>> are on the device shutdown path this is not an issue.
>> >>>>>
>> >>>>> This should leave the CoreSight infrastructure stable until the
>> >>>>> drivers are shut down normally as part of the device power down
>> >>>>> process.
>> >>>>>
>> >>>>
>> >>>> Sounds good to me, but if the coresight_unregister() is the trouble
>> >>>> point
>> >>>> causing these crashes, then can't we just remove that from
>> >>>> tmc_shutdown()
>> >>>> callback? This would be like maintaining the same behaviour as now
>> >>>> where
>> >>>> on reboot/shutdown we basically don't do anything except for disabling
>> >>>> ETR.
>> >>>
>> >>> No - the new mode prevents race conditions where the thread shutting
>> >>> down the SMMU does the ETR shutdown, but then another thread happens
>> >>> to be trying to start trace and restarts the ETR.
>> >>> It also prevents the condition Mathieu discussed where a thread might
>> >>> be attempting to shutdown trace - this could try to disable the
>> >>> hardware again re-releasing resources/ re-flushing and waiting for
>> >>> stop.
>> >>>
>> >>
>> >> I do not think there will a race between SMMU shutdown and ETR shutdown.
>> >> Driver core takes care of calling SMMU shutdown after its consumer
>> >> shutdown callbacks via device link, otherwise there would already be
>> >> bugs in all other client drivers.
>> >>
>> >
>> > I am not saying there could be a race between tmc_shutdowm and
>> > Smmu_shutdown - there may be a case if the coresight_disable_path
>> > sequence is running and gets to the point of disabling the ETR after
>> > the SMMU callback has disabled it.
>> 
>> I'm confused now - there is no "SMMU callback", we're talking about 
>> the
>> system-wide cleanup from kernel_shutdown_prepare() or
>> kernel_restart_prepare(). As far as I'm aware userspace should be long
>> gone by that point, so although trace may have been left running ||
>            ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7)), 
> the
>> chance of racing against other driver operations seems pretty 
>> unlikely.
>> 
> 
> Sorry - bad choice of terminology. I was referring to the SMMU
> ensuring that it had all its clients shut-down before if shut down. To
> quote Sai...
> 
>>>>>> SMMU device link just makes sure that
>> >>>>>> SMMU(supplier) shutdown is
>> >>>>>> called only after its consumers shutdown callbacks are called.
> 
> I agree it is unlikely, but if removing the device from the CoreSight
> infrastructure via coresight_unregister() is a potential source of a
> crash, it would seem that there is a potential path where some
> CoreSight driver side work might be possible. therefore a mode to
> prevent this crash, and ensure that the device hardware remains off
> and not sending trace to SMMU until such time as shutdown / reboot
> restart occurs, seemed prudent.
> 

Actually I did not see any crash with coresight_unregister() during
reboot/shutdown as I mentioned previously to Mathieu's query on
this being similar to remove callback. I think the crash with
coresight_unregister() is only seen when we have coresight as module
and the userspace is pretty much there to enable/disable trace when
we try to bind/unbind. But here we only consider the system 
reboot/shutdown
where pretty much everything is down by this point.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

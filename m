Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E73195E0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 20:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgC0TDC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 15:03:02 -0400
Received: from foss.arm.com ([217.140.110.172]:51450 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbgC0TDC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 15:03:02 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF59E30E;
        Fri, 27 Mar 2020 12:03:00 -0700 (PDT)
Received: from [10.57.60.204] (unknown [10.57.60.204])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6527F3F71E;
        Fri, 27 Mar 2020 12:02:59 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
 <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
Date:   Fri, 27 Mar 2020 19:02:58 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-27 3:09 pm, Sai Prakash Ranjan wrote:
> Hi Robin,
> 
> Thanks for taking a look at this.
> 
> On 2020-03-27 19:42, Robin Murphy wrote:
>> On 2020-03-27 1:28 pm, Sai Prakash Ranjan wrote:
>>> Currently on reboot/shutdown, the following messages are
>>> displayed on the console as error messages before the
>>> system reboots/shutdown.
>>>
>>> On SC7180:
>>>
>>>    arm-smmu 15000000.iommu: removing device with active domains!
>>>    arm-smmu 5040000.iommu: removing device with active domains!
>>>
>>> Demote the log level to debug since it does not offer much
>>> help in identifying/fixing any issue as the system is anyways
>>> going down and reduce spamming the kernel log.
>>
>> I've gone back and forth on this pretty much ever since we added the
>> shutdown hook - on the other hand, if any devices *are* still running
>> in those domains at this point, then once we turn off the SMMU and let
>> those IOVAs go out on the bus as physical addresses, all manner of
>> weirdness may ensue. Thus there is an argument for *some* indication
>> that this may happen, although IMO it could be downgraded to at least
>> dev_warn().
>>
> 
> Any pointers to the weirdness here after SMMU is turned off?
> Because if we look at the call sites, device_shutdown is called
> from kernel_restart_prepare or kernel_shutdown_prepare which would
> mean system is going down anyways, so do we really care about these
> error messages or warnings from SMMU?
> 
>   arm_smmu_device_shutdown
>    platform_drv_shutdown
>     device_shutdown
>      kernel_restart_prepare
>       kernel_restart

Imagine your network driver doesn't implement a .shutdown method (so the 
hardware is still active regardless of device links), happens to have an 
Rx buffer or descriptor ring DMA-mapped at an IOVA that looks like the 
physical address of the memory containing some part of the kernel text 
lower down that call stack, and the MAC receives a broadcast IP packet 
at about the point arm_smmu_device_shutdown() is returning. Enjoy 
debugging that ;)

And if coincidental memory corruption seems too far-fetched for your 
liking, other fun alternatives might include "display tries to scan out 
from powered-off device, deadlocks interconnect and prevents anything 
else making progress", or "access to TZC-protected physical address 
triggers interrupt and over-eager Secure firmware resets system before 
orderly poweroff has a chance to finish".

Of course the fact that in practice we'll *always* see the warning 
because there's no way to tear down the default DMA domains, and even if 
all devices *have* been nicely quiesced there's no way to tell, is 
certainly less than ideal. Like I say, it's not entirely clear-cut 
either way...

Robin.

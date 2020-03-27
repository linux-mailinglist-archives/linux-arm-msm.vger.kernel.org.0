Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC696195994
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 16:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgC0PJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 11:09:49 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:38223 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727263AbgC0PJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 11:09:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585321788; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8L+aqMqfHrTgXBDzMaiX/dTs4tE5Ws3f3P4pNDyIQpM=;
 b=kfckDuQfJvRjondC8tT83a4GS9IH0apzNzHY+aZTB1+Nszgk3sYBH3mqeUXY7S0Iy1dgW0EP
 PssoSXp7d9pxCdfH/1SqbYuDQMe3gmURs3vTHgUwD80F8aKXzz7qJm7uYc7qeLYDFgvdVO1h
 tBeVNdnXscJGaL60hUNQq/LaIpQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7e173c.7fd0d56e96f8-smtp-out-n05;
 Fri, 27 Mar 2020 15:09:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B5D8C433F2; Fri, 27 Mar 2020 15:09:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3E0BC433D2;
        Fri, 27 Mar 2020 15:09:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 27 Mar 2020 20:39:46 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
In-Reply-To: <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
Message-ID: <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

Thanks for taking a look at this.

On 2020-03-27 19:42, Robin Murphy wrote:
> On 2020-03-27 1:28 pm, Sai Prakash Ranjan wrote:
>> Currently on reboot/shutdown, the following messages are
>> displayed on the console as error messages before the
>> system reboots/shutdown.
>> 
>> On SC7180:
>> 
>>    arm-smmu 15000000.iommu: removing device with active domains!
>>    arm-smmu 5040000.iommu: removing device with active domains!
>> 
>> Demote the log level to debug since it does not offer much
>> help in identifying/fixing any issue as the system is anyways
>> going down and reduce spamming the kernel log.
> 
> I've gone back and forth on this pretty much ever since we added the
> shutdown hook - on the other hand, if any devices *are* still running
> in those domains at this point, then once we turn off the SMMU and let
> those IOVAs go out on the bus as physical addresses, all manner of
> weirdness may ensue. Thus there is an argument for *some* indication
> that this may happen, although IMO it could be downgraded to at least
> dev_warn().
> 

Any pointers to the weirdness here after SMMU is turned off?
Because if we look at the call sites, device_shutdown is called
from kernel_restart_prepare or kernel_shutdown_prepare which would
mean system is going down anyways, so do we really care about these
error messages or warnings from SMMU?

  arm_smmu_device_shutdown
   platform_drv_shutdown
    device_shutdown
     kernel_restart_prepare
      kernel_restart


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

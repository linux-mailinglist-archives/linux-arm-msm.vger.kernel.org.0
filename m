Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286BC2532B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 17:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgHZPB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 11:01:28 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:39729 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726843AbgHZPBY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 11:01:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598454084; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Es/0pFaKnR2kzEaSjZ72M+ID+T80ab88lrWvsjkbJzY=;
 b=fffb76nut89n9XFIiTqmKD7Cy7nvpF+ywTit9IgippUouwr7WyJnLFA3NicIGVWene51u+/9
 fvuF8DcVYoV+F9hhE2xFS5v60iOBDsHqEUlQ2fRFF1Ecbo2szKn+WNhlu0kOLw/Is/QfiCSg
 dsI7auyngje3SzRgGcRRF7uK9Nk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f46793138ba93790fc76c4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 15:01:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E7010C4339C; Wed, 26 Aug 2020 15:01:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73DB9C433A1;
        Wed, 26 Aug 2020 15:01:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 26 Aug 2020 20:31:03 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
In-Reply-To: <a03ce8f0-cab5-2782-ac50-930cf94b7dcd@arm.com>
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
 <e3e4da33-a44f-0a07-9e2e-0f806875ab0b@arm.com>
 <d9b1f1b614057d87279c26e13cbbb1f5@codeaurora.org>
 <a03ce8f0-cab5-2782-ac50-930cf94b7dcd@arm.com>
Message-ID: <f8ac8f57bcf10b2218b4795197efb854@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-26 19:21, Robin Murphy wrote:
> On 2020-08-26 13:17, Sai Prakash Ranjan wrote:
>> On 2020-08-26 17:07, Robin Murphy wrote:
>>> On 2020-08-25 16:42, Sai Prakash Ranjan wrote:
>>>> Currently the non-strict or lazy mode of TLB invalidation can only 
>>>> be set
>>>> for all or no domains. This works well for development platforms 
>>>> where
>>>> setting to non-strict/lazy mode is fine for performance reasons but 
>>>> on
>>>> production devices, we need a more fine grained control to allow 
>>>> only
>>>> certain peripherals to support this mode where we can be sure that 
>>>> it is
>>>> safe. So add support to filter non-strict/lazy mode based on the 
>>>> device
>>>> names that are passed via cmdline parameter 
>>>> "iommu.nonstrict_device".
>>> 
>>> There seems to be considerable overlap here with both the existing
>>> patches for per-device default domain control [1], and the broader
>>> ongoing development on how to define, evaluate and handle "trusted"
>>> vs. "untrusted" devices (e.g. [2],[3]). I'd rather see work done to
>>> make sure those integrate properly together and work well for
>>> everyone's purposes, than add more disjoint mechanisms that only
>>> address small pieces of the overall issue.
>>> 
>>> Robin.
>>> 
>>> [1]
>>> https://lore.kernel.org/linux-iommu/20200824051726.7xaJRTTszJuzdFWGJ8YNsshCtfNR0BNeMrlILAyqt_0@z/ 
>>> [2]
>>> https://lore.kernel.org/linux-iommu/20200630044943.3425049-1-rajatja@google.com/ 
>>> [3]
>>> https://lore.kernel.org/linux-iommu/20200626002710.110200-2-rajatja@google.com/
>> 
>> Thanks for the links, [1] definitely sounds interesting, I was under 
>> the impression
>> that changing such via sysfs is late, but seems like other Sai has got 
>> it working
>> for the default domain type. So we can extend that and add a strict 
>> attribute as well,
>> we should be definitely OK with system booting with default strict 
>> mode for all
>> peripherals as long as we have an option to change that later, Doug?
> 
> Right, IIRC there was initially a proposal of a command line option
> there too, and it faced the same criticism around not being very
> generic or scalable. I believe sysfs works as a reasonable compromise
> since in many cases it can be tweaked relatively early from an initrd,
> and non-essential devices can effectively be switched at any time by
> removing and reprobing their driver.
> 

Ah I see, so the catch is that device must not be bound to the driver
and won't work for the internal devices or builtin drivers probed early.

-Sai

> As for a general approach for internal devices where you do believe
> the hardware is honest but don't necessarily trust whatever firmware
> it happens to be running, I'm pretty sure that's come up already, but
> I'll be sure to mention it at Rajat's imminent LPC talk if nobody else
> does.
> 
> Robin.


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

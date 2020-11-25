Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F912C4526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 17:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731889AbgKYQ1M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 11:27:12 -0500
Received: from z5.mailgun.us ([104.130.96.5]:20583 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730560AbgKYQ1M (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 11:27:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606321631; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0T3+We0M9CayRe4wp2JEFrYfpww/I9At8EAv//yDBAU=; b=hr2CH6Ky2LAxrIPDehRWF48eRurvBYLQ78JX5I5oGqqb3WzVDhkbXZjq1kJD2qpslXrAwT5E
 rHfVFb3NjArDkoJn/p+2+ASrqqQR0j4j9sCP6xzQVXQ9BTPaUGAF3v6eYJOrBrW9rmG41m55
 pVLqkl0pln+9++b+bunB8DWAoAg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fbe85d7d64ea0b703c7939e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 16:27:03
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D989C43470; Wed, 25 Nov 2020 16:27:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D1112C43462;
        Wed, 25 Nov 2020 16:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D1112C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Indexed MHI controller name
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org>
 <1093835e-3ed6-5579-5fbe-39a6d8fbadaf@codeaurora.org>
 <005093de-c8e4-2075-050a-5998a3cbcfcc@codeaurora.org>
 <CAMZdPi-XNbfQuXJnGmodqTUH+Oh23RHZWy8_CMcFEu9Ga70MpQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <f153e356-8750-cd18-3a4c-904e41136e7d@codeaurora.org>
Date:   Wed, 25 Nov 2020 09:26:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi-XNbfQuXJnGmodqTUH+Oh23RHZWy8_CMcFEu9Ga70MpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/25/2020 9:23 AM, Loic Poulain wrote:
> On Wed, 25 Nov 2020 at 16:49, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 11/25/2020 8:42 AM, Jeffrey Hugo wrote:
>>> On 11/25/2020 8:43 AM, Loic Poulain wrote:
>>>> Today the MHI controller name is simply cloned from the underlying
>>>> bus device (its parent), that gives the following device structure
>>>> for e.g. a MHI/PCI controller:
>>>> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0
>>>> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0/0000:02:00.0_IPCR
>>>>
>>>> ...
>>>>
>>>> That's quite misleading/confusing and can cause device registering
>>>> issues because of duplicate dev name (e.g. if a PCI device register
>>>> two different MHI instances).
>>>>
>>>> This patch changes MHI core to create indexed mhi controller names
>>>> (mhi0, mhi1...) in the same way as other busses (i2c0, usb0...).
>>>>
>>>> The previous example becomes:
>>>> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
>>>> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR
>>>> ...
>>>>
>>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>>
>>>
>>> How does this change /sys/bus/mhi/devices/ ?
>>>
>>> The point of having the bus name in the mhi device name is to give an
>>> easy way to correlate those devices back to the "root" device (I have a
>>> lot of users which do that).
>>>
>>> Also, do we actually have some device that actually exposes multiple MHI
>>> interfaces?
>>>
>>>
>>
>> Looking at the code change itself, looks like the controller index is
>> essentially random, and not persistent.  Is that expected?
>>
>> I'm thinking it might be confusing if you have say 12 MHI controllers
>> from 12 different devices, and some of those devices crash at roughly
>> the same time.  The controllers get removed, and re-initialized, which
>> means that you have essentially a race condition where the controller
>> for the same device now has a different index.
> 
> There is no race since ID is atomically allocated, but yes your
> controller can get a different index on unregister/register, like e.g
> network interfaces index, usb devices ID, video devices, etc... can be
> enumerated in various order. Not sure why the user should take care of
> the MHI controller index.

You said there is no race, but then literally described a race.

It appears we agree, the enumeration first time around may not be the 
same enumeration order later on.

The point is not that the user cares that they always talk to mhi0.  The 
point is that the user was talking to mhi0, that crashed, re-enumerated, 
and is now mhi3.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

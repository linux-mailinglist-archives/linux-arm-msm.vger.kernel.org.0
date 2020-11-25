Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE4C2C44E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 17:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbgKYQYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 11:24:18 -0500
Received: from z5.mailgun.us ([104.130.96.5]:11632 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730747AbgKYQYP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 11:24:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606321454; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0E8qFLAmA+eGllebKkYc7JS9X1MoOk7ANyTbIF7qlVo=; b=n9RB3AFf8tWv6/ZDVElifjy11XjAg5WCi9q+4A+8Tm8bl+FGaxy+DYQB2yUnd/nnHW96vgWM
 i/K6UFdMgp4v1wmVe8m/O2KzJrzOhe9cGZ+iIxORdw6koHrjxsfreLNYHYQ/RWbQwn+vH31F
 A7u7cuLPcIPtqmB+0y6o36QqW4A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fbe85277e9d874dfc45f03e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 16:24:07
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30AD3C43460; Wed, 25 Nov 2020 16:24:07 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86FD4C433C6;
        Wed, 25 Nov 2020 16:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86FD4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Indexed MHI controller name
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org>
 <1093835e-3ed6-5579-5fbe-39a6d8fbadaf@codeaurora.org>
 <CAMZdPi_9vWxupthj0piMM_cHjma1qpSU+sQWVF_c1SjBkEKX4w@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <97494f35-2d00-9df9-a6f9-7ad69978f3cd@codeaurora.org>
Date:   Wed, 25 Nov 2020 09:24:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi_9vWxupthj0piMM_cHjma1qpSU+sQWVF_c1SjBkEKX4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/25/2020 9:15 AM, Loic Poulain wrote:
> On Wed, 25 Nov 2020 at 16:42, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 11/25/2020 8:43 AM, Loic Poulain wrote:
>>> Today the MHI controller name is simply cloned from the underlying
>>> bus device (its parent), that gives the following device structure
>>> for e.g. a MHI/PCI controller:
>>> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0
>>> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0/0000:02:00.0_IPCR
>>> ...
>>>
>>> That's quite misleading/confusing and can cause device registering
>>> issues because of duplicate dev name (e.g. if a PCI device register
>>> two different MHI instances).
>>>
>>> This patch changes MHI core to create indexed mhi controller names
>>> (mhi0, mhi1...) in the same way as other busses (i2c0, usb0...).
>>>
>>> The previous example becomes:
>>> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
>>> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR
>>> ...
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>
>>
>> How does this change /sys/bus/mhi/devices/ ?
> 
> That does change sysfs device dir names:
> $ ls -al /sys/bus/mhi/devices/
> lrwxrwxrwx 1 root root 0 nov.  25 16:27 mhi0 ->
> ../../../devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
> lrwxrwxrwx 1 root root 0 nov.  25 16:28 mhi0_DIAG ->
> ../../../devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_DIAG
> lrwxrwxrwx 1 root root 0 nov.  25 16:28 mhi0_IPCR ->
> ../../../devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR
> 
>> The point of having the bus name in the mhi device name is to give an
>> easy way to correlate those devices back to the "root" device (I have a
>> lot of users which do that).
> 
> I see your point but it's not a problem specific to MHI bus, user can
> rely on sysfs/uevent to get device information such ass devices
> attributes, children, or parent devices. Do you have a concrete
> example in mind for your case?

3 I think -

1. I think its same to assume these names are going to trickle down to 
mhi_uci.  For a QAIC device, there is a /dev/qaic chardev for doing the 
AI work, and a /dev chardev from mhi_uci exposing the DIAG channel. 
Both of these are correlated to a specific PCI device by the BDF, which 
the user application will want to know so that relevant DIAG traffic for 
a qaic device is routed to the correct chardev, and thus the correct 
device.  For 1 device, this is simple.  For 12, some correlation needs 
to be done programmatically.

2. User is physically on the shell, and wants to look at 
/sys/bus/mhi/devices to see the state of a device.  Perhaps the expected 
mhi_uci devices are not present.

3. User is physically on the shell, and wants to invoke soc_reset on the 
controller.  The user needs to know which mhi controller instance 
(mhi1?) maps to a specific PCI BDF to make sure the right device is reset.

1 is used a lot by our userspace stack.  2/3 is used a lot by testers 
and developers.

> 
>>
>> Also, do we actually have some device that actually exposes multiple MHI
>> interfaces?
> 
> No, but better to fix possible problems ahead of time.

Good to know.  I was thinking this was not needed, and unlikely to be 
needed, but it just occurs to me I might have a usecase for this in 
development.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

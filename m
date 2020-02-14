Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB21615E57A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 17:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405518AbgBNQlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 11:41:36 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:31274 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405060AbgBNQlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 11:41:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581698495; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=WltS4zcJeH0uP66dN2NhOuW1mnYqFlmxLmvlY4c5A+0=; b=H9vBX1t/jJAjWWkOXk1mMBPo1ceIHGGocf4/plBEbCb08ZVj6XnkkeAZk0pHNJ/iMmDnk7Sp
 2QtTKVeSoyhm4oJrrQ89CQmGio8TP6SRIe1SspO0THB6X7fmkPFovgyicY0oMR+LO8aMu6Yr
 ycrAjKfZ1UtRMsdMWBBNp9prRUw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e46cdbe.7ff9e18ec928-smtp-out-n02;
 Fri, 14 Feb 2020 16:41:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73983C447AD; Fri, 14 Feb 2020 16:41:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03ED5C447AB;
        Fri, 14 Feb 2020 16:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03ED5C447AB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
To:     Greg KH <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
 <20200206165755.GB3894455@kroah.com>
 <20200211184130.GA11908@Mani-XPS-13-9360>
 <20200211192055.GA1962867@kroah.com> <20200213152013.GB15010@mani>
 <20200213153418.GA3623121@kroah.com> <20200213154809.GA26953@mani>
 <20200213155302.GA3635465@kroah.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <e45e18cd-20df-4492-cc6f-24576aea032c@codeaurora.org>
Date:   Fri, 14 Feb 2020 09:41:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200213155302.GA3635465@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/13/2020 8:53 AM, Greg KH wrote:
> On Thu, Feb 13, 2020 at 09:18:09PM +0530, Manivannan Sadhasivam wrote:
>> Hi Greg,
>>
>> On Thu, Feb 13, 2020 at 07:34:18AM -0800, Greg KH wrote:
>>> On Thu, Feb 13, 2020 at 08:50:13PM +0530, Manivannan Sadhasivam wrote:
>>>> On Tue, Feb 11, 2020 at 11:20:55AM -0800, Greg KH wrote:
>>>>> On Wed, Feb 12, 2020 at 12:11:30AM +0530, Manivannan Sadhasivam wrote:
>>>>>> Hi Greg,
>>>>>>
>>>>>> On Thu, Feb 06, 2020 at 05:57:55PM +0100, Greg KH wrote:
>>>>>>> On Fri, Jan 31, 2020 at 07:19:55PM +0530, Manivannan Sadhasivam wrote:
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/drivers/bus/mhi/core/init.c
>>>>>>>> @@ -0,0 +1,407 @@
>>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>>> +/*
>>>>>>>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>>>>>>>> + *
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#define dev_fmt(fmt) "MHI: " fmt
>>>>>>>
>>>>>>> This should not be needed, right?  The bus/device name should give you
>>>>>>> all you need here from what I can tell.  So why is this needed?
>>>>>>>
>>>>>>
>>>>>> The log will have only the device name as like PCI-E. But that won't specify
>>>>>> where the error is coming from. Having "MHI" prefix helps the users to
>>>>>> quickly identify that the error is coming from MHI stack.
>>>>>
>>>>> If the driver binds properly to the device, the name of the driver will
>>>>> be there in the message, so I suggest using that please.
>>>>>
>>>>> No need for this prefix...
>>>>>
>>>>
>>>> So the driver name will be in the log but that won't help identifying where
>>>> the log is coming from. This is more important for MHI since it reuses the
>>>> `struct device` of the transport device like PCI-E. For instance, below is
>>>> the log without MHI prefix:
>>>>
>>>> [   47.355582] ath11k_pci 0000:01:00.0: Requested to power on
>>>> [   47.355724] ath11k_pci 0000:01:00.0: Power on setup success
>>>>
>>>> As you can see, this gives the assumption that the log is coming from the
>>>> ath11k_pci driver. But the reality is, it is coming from MHI bus.
>>>
>>> Then you should NOT be trying to "reuse" a struct device.
>>>
>>>> With the prefix added, we will get below:
>>>>
>>>> [   47.355582] ath11k_pci 0000:01:00.0: MHI: Requested to power on
>>>> [   47.355724] ath11k_pci 0000:01:00.0: MHI: Power on setup success
>>>>
>>>> IMO, the prefix will give users a clear idea of logs and that will be very
>>>> useful for debugging.
>>>>
>>>> Hope this clarifies.
>>>
>>> Don't try to reuse struct devices, if you are a bus, have your own
>>> devices as that's the correct way to do things.
>>>
>>
>> I assumed that the buses relying on a different physical interface for the
>> actual communication can reuse the `struct device`. I can see that the MOXTET
>> bus driver already doing it. It reuses the `struct device` of SPI.
> 
> How can you reuse anything?
> 
>> And this assumption has deep rooted in MHI bus design.
> 
> Maybe I do not understand what this is at all, but a device can only be
> on one "bus" at a time.  How is that being broken here?

Maybe I can bring some clarity to the discussion.  I hope I do not muddy 
things.

My interest in this series is I am developing a kernel driver for a 
product which uses MHI.  Unfortunately I am currently under embargo, 
otherwise I would post an RFC of my kernel driver which uses this 
series.  Let me try to dance around the embargo issue to hopefully 
illustrate how I aim to use this series.

Note that I expect my usecase is not the "defining" usecase.  I fully 
expect other usecases to exist.  IE what I hope to explain is not to be 
taken as the "one true way" to use MHI.

At the physical layer, my product is attached to a PCIE bus.  Thus my 
driver registers as a PCI driver for a device containing a specific 
VID/PID.  My product uses MHI as the "control path".  When I want to 
give commands to my product, they occur via the MHI protocol.  The "data 
path" occurs outside of MHI, and thus there is direct access to that 
hardware via PCIE.

In my usecase, my driver acts as both MHI Controller, and also MHI 
Client Driver.  Based on the PCIE device probe, my driver registers a 
MHI Controller.  Its going to be important for me that I have some means 
of associating the MHI Controller instance to the PCIE device instance 
(struct device) so that I can then correlate MHI devices to the PCIE 
device (more on that in a bit).  Right now, since the MHI controller 
essentially reuses the struct device from the PCIE device (provided by 
my driver), I can do that.

My MHI Controller exposes a number of channels, but for this discussion, 
the relevant one is the "control" channel.

My kernel driver also registers a MHI Client Driver which binds to this 
control channel.  Since its possible to have multiple instances of my 
product, I need to make a connection between the specific control 
channel device that my MHI Client Driver has probed on, and the PCIE 
device this control channel runs on so that I can store this connection 
in my struct that is in the driver data of the struct device of the pci 
device.  With that connection made, I can then correlate activity on the 
control MHI channel for a particular device with the services that my 
driver provides.

So, what we have, in my case, is a layering of buses, and its important 
to be able to identify the relationships (ie this particular MHI bus is 
associated with this particular PCI device on the PCI bus).

As I said, currently since the MHI bus is reusing the PCI struct device, 
its possible for my driver to make these connections as necessary.  If 
the MHI bus needs to have its own struct device instance, then how do 
you propose those connections be determined?  The MHI bus device is a 
child of the PCI device (thus from the MHI bus device, we dereference 
its parent)?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60BD209855
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 03:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389239AbgFYBwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 21:52:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62860 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389238AbgFYBwl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 21:52:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593049960; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8B6Pxy32SmGdNLfWwVSEcjH7KvONhou3Vtz1xrwMALQ=; b=lo5wCOnDnvSOu/AlzGWamg6PUE+LhE/HaejaOctFGo14qUuyKLFBrp0ksUBu6WbHR8tpPcM8
 I5oC0xSfZjSxbsydGJotnhJ+2J06k9pabGkyc43+vebA4OvbjV0FHGjBK/U1+nU3OD3jszfs
 MJUpU86b/ZRppVrk/JA+D5doVsc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5ef403570206ad41d12b1014 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 01:52:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58EFBC433C8; Thu, 25 Jun 2020 01:52:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70DB7C433C6;
        Thu, 25 Jun 2020 01:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70DB7C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 3/4] docs: Add documentation for user space client
 interface
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
 <1591899224-3403-4-git-send-email-hemantk@codeaurora.org>
 <20200619063948.GC3245@Mani-XPS-13-9360>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <7b64f78e-40c7-7c65-3832-4bbc5da93674@codeaurora.org>
Date:   Wed, 24 Jun 2020 18:52:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200619063948.GC3245@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 6/18/20 11:39 PM, Manivannan Sadhasivam wrote:
> On Thu, Jun 11, 2020 at 11:13:43AM -0700, Hemant Kumar wrote:
>> MHI user space client driver is creating device file node
>> for user application to perform file operations. File
>> operations are handled by MHI core driver. Currently
>> Loopback MHI channel is supported by this driver.
>>
>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>> ---
>>   Documentation/mhi/index.rst |  1 +
>>   Documentation/mhi/uci.rst   | 19 +++++++++++++++++++
>>   2 files changed, 20 insertions(+)
>>   create mode 100644 Documentation/mhi/uci.rst
>>
>> diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
>> index 1d8dec3..c75a371 100644
>> --- a/Documentation/mhi/index.rst
>> +++ b/Documentation/mhi/index.rst
>> @@ -9,6 +9,7 @@ MHI
>>   
>>      mhi
>>      topology
>> +   uci
>>   
>>   .. only::  subproject and html
>>   
>> diff --git a/Documentation/mhi/uci.rst b/Documentation/mhi/uci.rst
>> new file mode 100644
>> index 0000000..a5c5c4f
>> --- /dev/null
>> +++ b/Documentation/mhi/uci.rst
>> @@ -0,0 +1,19 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=================================
>> +User space Client Interface (UCI)
> 
> Stick to 'Userspace' everywhere.
Done.
> 
>> +=================================
>> +
>> +UCI driver enables user space clients to communicate to external MHI devices
>> +like modem and WLAN. It creates standard character device file nodes for user
> 
> UCI driver creates a single char device, isn't it?
No, it is created per device name. For example Loopback has its own char 
device file node. if we add another channel for a new mhi device new 
device file node would be created.
> 
>> +space clients to perform open, read, write, pool and close file operations.
>> +
> 
> poll? Btw, you need to mention explicitly how this char device can be used.
> You are just mentioning standard file operations.
Will fix poll.My idea was indeed to mention generic file operations so 
that we dont have to be specific with use case. Any userspace entity who 
wants to communicate over mhi can use the driver. Reason we have this 
driver is to abstract the mhi core specific details. Even for loopback 
use case, userspace can echo to device file node on one channel and get 
a same in response from another channel back. I can add more examples of
other user space drivers use case if that helps.
> 
>> +Device file node is created with format:-
>> +
>> +/dev/mhi_<controller_name>_<mhi_device_name>
>> +
>> +controller_name is the name of underlying bus used to transfer data.
> 
> underlying controller instance.
Done.
> 
>> +mhi_device_name is the name of the MHI channel being used by MHI client
> 
> What do you mean by MHI client here? Are you referring to userspace client?
yes. i can say "MHI client in userspace"?
> 
>> +to send or receive data using MHI protocol. MHI channels are statically
>> +defined by MHI specification. Driver currently supports LOOPBACK channel
>> +index 0 (Host to device) and 1 (Device to Host).
> 
> s/index/identifier
Done.
> 
> And explain a bit on how this LOOPBACK channel is getting used.
Done.
> 
> Thanks,
> Mani
> 
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

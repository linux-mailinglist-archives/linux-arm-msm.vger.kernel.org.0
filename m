Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C4A29CC1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 23:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2902335AbgJ0Wnv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 18:43:51 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:40251 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S372875AbgJ0Wnu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 18:43:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603838630; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3rDmPFdxOUjBCqUsTJliBqGs3RTx+ZIi5ERCsbuDXX8=; b=eR/eNvh6Sy6J6wAEIvGbbUf3or5NAuADtK4U00nmgXdLgSUtmhIa/2V8yZwDLiknF26we7sn
 iucEZIif5zct6O8V4SyJChMUPYEXEYfZzwYEfBnOFHRS2/eCr5u/5xuHAuhrvQEW0vX0lEEH
 JPc4pGtHfuT+0VN212nz/U7zQhU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f98a2a0f119df899762fbe7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 22:43:44
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9A093C433F0; Tue, 27 Oct 2020 22:43:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD780C433C9;
        Tue, 27 Oct 2020 22:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD780C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Introduce sysfs ul chan id for mhi chan
 device
To:     Jeffrey Hugo <jhugo@codeaurora.org>, carl.yin@quectel.com,
        manivannan.sadhasivam@linaro.org, sfr@canb.auug.org.au
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        naveen.kumar@quectel.com
References: <20201027094304.23025-1-carl.yin@quectel.com>
 <b1da800d-4919-edac-b651-ecdd7e0625ca@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <d041b002-7a2c-64be-f5bd-0988c3611503@codeaurora.org>
Date:   Tue, 27 Oct 2020 15:43:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b1da800d-4919-edac-b651-ecdd7e0625ca@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Carl,

On 10/27/20 8:06 AM, Jeffrey Hugo wrote:
> On 10/27/2020 3:43 AM, carl.yin@quectel.com wrote:
>> From: "carl.yin" <carl.yin@quectel.com>
>>
>> User space software like ModemManager can identify the function
>> of the mhi chan device by ul_chan_id.
>>
>> Signed-off-by: carl.yin <carl.yin@quectel.com>
>> ---
>>   Documentation/ABI/stable/sysfs-bus-mhi | 10 ++++++++++
>>   drivers/bus/mhi/core/init.c            | 15 +++++++++++++++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi 
>> b/Documentation/ABI/stable/sysfs-bus-mhi
>> index ecfe766..6d52768 100644
>> --- a/Documentation/ABI/stable/sysfs-bus-mhi
>> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
>> @@ -19,3 +19,13 @@ Description:    The file holds the OEM PK Hash 
>> value of the endpoint device
>>           read without having the device power on at least once, the file
>>           will read all 0's.
>>   Users:        Any userspace application or clients interested in 
>> device info.
>> +
>> +What:        /sys/bus/mhi/devices/.../ul_chan_id
>> +Date:        November 2020
>> +KernelVersion:    5.10
>> +Contact:    Carl Yin <carl.yin@quectel.com>
>> +Description:    The file holds the uplink chan id of the mhi chan 
>> device.
>> +        User space software like ModemManager can identify the 
>> function of
>> +        the mhi chan device. If the mhi device is not a chan device,
>> +        eg mhi controller device, the file read -1.
>> +Users:        Any userspace application or clients interested in 
>> device info.
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index c6b43e9..ac4aa5c 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -105,9 +105,24 @@ static ssize_t oem_pk_hash_show(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RO(oem_pk_hash);
>> +static ssize_t ul_chan_id_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buf)
>> +{
>> +    struct mhi_device *mhi_dev = to_mhi_device(dev);
>> +    int ul_chan_id = -1;
>> +
>> +    if (mhi_dev->ul_chan)
>> +        ul_chan_id = mhi_dev->ul_chan_id;
>> +
>> +    return snprintf(buf, PAGE_SIZE, "%d\n", ul_chan_id);
>> +}
>> +static DEVICE_ATTR_RO(ul_chan_id);
>> +
>>   static struct attribute *mhi_dev_attrs[] = {
>>       &dev_attr_serial_number.attr,
>>       &dev_attr_oem_pk_hash.attr,
>> +    &dev_attr_ul_chan_id.attr,
>>       NULL,
>>   };
>>   ATTRIBUTE_GROUPS(mhi_dev);
>>
> 
> NACK
> 
> Channel ID is a device specific detail.  Userspace should be basing 
> decisions on the channel name.
> 
I agree with Jeff, why do you need to know the channel id, if you need 
to poll for any device node to get created you can try to open the 
device node from user space and wait until the device gets opened.
Are you trying to wait for EDL channels to get started using UCI ?

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

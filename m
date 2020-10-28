Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C86E29D647
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730850AbgJ1WN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:13:26 -0400
Received: from z5.mailgun.us ([104.130.96.5]:40532 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731025AbgJ1WNO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:13:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603923192; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+eMjWsYprps71mDuYG0jMZuCDHwiRlS4uCWPPPF7zBA=; b=tHuE279Va3lFafF3a/Id6OKHIAUoM/5DqbmR00OOd4NTsK64c3WSNuC27hrB7A7KiKO3ktPt
 AVQKAI0F7DFzmweyvjxsmwRNdzLqAapiNPxbRPJjDoJ5LnUL/nWgEb+jS2FdWYzwTF7SOfsY
 6U/jWs71sPSuLerht0YwliqIocc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f997d8038c6e400454f8c48 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 14:17:36
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E53A2C433CB; Wed, 28 Oct 2020 14:17:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F6B5C433C9;
        Wed, 28 Oct 2020 14:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1F6B5C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSBidXM6IG1oaTogY29yZTogSW50cm9k?=
 =?UTF-8?Q?uce_sysfs_ul_chan_id_for_mhi_chan_device?=
To:     =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Naveen Kumar <naveen.kumar@quectel.com>
References: <1cdcb3c25ef3781b3baa2d6943cea3ea@sslemail.net>
 <d041b002-7a2c-64be-f5bd-0988c3611503@codeaurora.org>
 <HK2PR06MB3507E92A9F5E24BC6FDA5FB586170@HK2PR06MB3507.apcprd06.prod.outlook.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <ebd89efb-6927-20c6-765e-42a9ca9da211@codeaurora.org>
Date:   Wed, 28 Oct 2020 08:17:32 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <HK2PR06MB3507E92A9F5E24BC6FDA5FB586170@HK2PR06MB3507.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/27/2020 7:18 PM, Carl Yin(殷张成) wrote:
> Hi Jeffery and Hemant:
> 
> On Wednesday, October 28, 2020 6:44 AM, hemantk wrote:
>> On 10/27/20 8:06 AM, Jeffrey Hugo wrote:
>> Hi Carl,
>>
>> On 10/27/20 8:06 AM, Jeffrey Hugo wrote:
>>> On 10/27/2020 3:43 AM, carl.yin@quectel.com wrote:
>>>> From: "carl.yin" <carl.yin@quectel.com>
>>>>
>>>> User space software like ModemManager can identify the function of
>>>> the mhi chan device by ul_chan_id.
>>>>
>>>> Signed-off-by: carl.yin <carl.yin@quectel.com>
>>>> ---
>>>>    Documentation/ABI/stable/sysfs-bus-mhi | 10 ++++++++++
>>>>    drivers/bus/mhi/core/init.c            | 15 +++++++++++++++
>>>>    2 files changed, 25 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi
>>>> b/Documentation/ABI/stable/sysfs-bus-mhi
>>>> index ecfe766..6d52768 100644
>>>> --- a/Documentation/ABI/stable/sysfs-bus-mhi
>>>> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
>>>> @@ -19,3 +19,13 @@ Description:    The file holds the OEM PK Hash
>>>> value of the endpoint device
>>>>            read without having the device power on at least once, the
>>>> file
>>>>            will read all 0's.
>>>>    Users:        Any userspace application or clients interested in
>>>> device info.
>>>> +
>>>> +What:        /sys/bus/mhi/devices/.../ul_chan_id
>>>> +Date:        November 2020
>>>> +KernelVersion:    5.10
>>>> +Contact:    Carl Yin <carl.yin@quectel.com>
>>>> +Description:    The file holds the uplink chan id of the mhi chan
>>>> device.
>>>> +        User space software like ModemManager can identify the
>>>> function of
>>>> +        the mhi chan device. If the mhi device is not a chan device,
>>>> +        eg mhi controller device, the file read -1.
>>>> +Users:        Any userspace application or clients interested in
>>>> device info.
>>>> diff --git a/drivers/bus/mhi/core/init.c
>>>> b/drivers/bus/mhi/core/init.c index c6b43e9..ac4aa5c 100644
>>>> --- a/drivers/bus/mhi/core/init.c
>>>> +++ b/drivers/bus/mhi/core/init.c
>>>> @@ -105,9 +105,24 @@ static ssize_t oem_pk_hash_show(struct device
>>>> *dev,
>>>>    }
>>>>    static DEVICE_ATTR_RO(oem_pk_hash);
>>>> +static ssize_t ul_chan_id_show(struct device *dev,
>>>> +                struct device_attribute *attr,
>>>> +                char *buf)
>>>> +{
>>>> +    struct mhi_device *mhi_dev = to_mhi_device(dev);
>>>> +    int ul_chan_id = -1;
>>>> +
>>>> +    if (mhi_dev->ul_chan)
>>>> +        ul_chan_id = mhi_dev->ul_chan_id;
>>>> +
>>>> +    return snprintf(buf, PAGE_SIZE, "%d\n", ul_chan_id); } static
>>>> +DEVICE_ATTR_RO(ul_chan_id);
>>>> +
>>>>    static struct attribute *mhi_dev_attrs[] = {
>>>>        &dev_attr_serial_number.attr,
>>>>        &dev_attr_oem_pk_hash.attr,
>>>> +    &dev_attr_ul_chan_id.attr,
>>>>        NULL,
>>>>    };
>>>>    ATTRIBUTE_GROUPS(mhi_dev);
>>>>
>>>
>>> NACK
>>>
>>> Channel ID is a device specific detail.  Userspace should be basing
>>> decisions on the channel name.
>>>
>> I agree with Jeff, why do you need to know the channel id, if you need to poll for
>> any device node to get created you can try to open the device node from user
>> space and wait until the device gets opened.
>> Are you trying to wait for EDL channels to get started using UCI ?
> [carl.yin] In my opinion, mhi chan id is something like 'bInterfaceNumber' of USB device.
> A USB device and several USB interfaces, and a mhi devices have 128 mhi chans.
> Chan id is a physical attribute of one mhi chan.
> 
> Next is the udev info of one mhi chan:
> # udevadm info -a /dev/mhi_0000\:03\:00.0_EDL
>    looking at parent device '/devices/pci0000:00/0000:00:1d.0/0000:03:00.0/0000:03:00.0_EDL':
>      KERNELS=="0000:03:00.0_EDL"
>      SUBSYSTEMS=="mhi"
>      DRIVERS=="mhi_uci"
>      ATTRS{serial_number}=="Serial Number: 2644481182"
>      ATTRS{ul_chan_id}=="34"
> 
> If no ul_chan_id, the udev ruler will be ' KERNEL=="*_EDL" '

I have several usecases where this works just fine today.

> With ul_chan_id, the udev ruler will be ' ATTRS{ul_chan_id}=="34"'

This breaks when there is some new device that has the EDL channel on 
some different chan_id, like 7.  The above does not.  Additionally if 
there is a different device that is using chan_id 34 for a different 
purpose, say Diag, then your udev rule also breaks.

The name of the channel is the interface to the channel.  Not the 
chan_id.  This holds true within the kernel, and should be the same for 
userspace.  I still oppose this change.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

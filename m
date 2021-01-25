Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF13B303450
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732337AbhAZFWb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:22:31 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:26680 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728007AbhAYMZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 07:25:32 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10PAh1DN022642;
        Mon, 25 Jan 2021 11:52:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tXd3M2ItuZ7tpZg66nEEuBS/rKqYkgB3GdCw/VU5/cs=;
 b=2DOcuIft/jK7bqI9H7ePVgL1XWZR4adtOa4kig4Rdz8Oz/APCiTqyO1A31UBunC5PIVJ
 rYeZEeVybn4HjgqbSpKF96RIL8Ftukg0i8sMYHdYr35QuNFXo9wNPKguaa+I2Cdtd2yA
 UCEP6VvcKfpjJZfDbGeEEY4ZDWiho+ijtElHFtIsm7A5+d8dAE8N1Xiu8uXHZH4CwvzG
 ukq0sueHtLbhf8rlJuKfkVvT3pGaupz45UDVQNP7aWDBM0k79Luj/R3MIdZ6kBqx9oz/
 RI13iXxgAwKHruCUKPylyzOu3wlP0ZAN5x5FiqdXDl+sZD+uOAZ4p9NYGBu1iUodiLZX dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 368a56afqt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 Jan 2021 11:52:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA302100038;
        Mon, 25 Jan 2021 11:52:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDA5D23BD5C;
        Mon, 25 Jan 2021 11:52:13 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 11:52:13 +0100
Subject: Re: [PATCH v2 04/16] rpmsg: ctrl: implement the ioctl function to
 create device
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
 <20210121235258.GG611676@xps15>
 <1b76bf93-9647-c658-b4dd-1b10264a1189@foss.st.com>
 <20210122205934.GA866146@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <3ad1b5e8-3b16-bfd2-bfd9-2d8d0ac8e8d5@foss.st.com>
Date:   Mon, 25 Jan 2021 11:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122205934.GA866146@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-25_03:2021-01-25,2021-01-25 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 1/22/21 9:59 PM, Mathieu Poirier wrote:
> On Fri, Jan 22, 2021 at 02:05:27PM +0100, Arnaud POULIQUEN wrote:
>> Hi Mathieu,
>>
>> On 1/22/21 12:52 AM, Mathieu Poirier wrote:
>>> On Tue, Dec 22, 2020 at 11:57:14AM +0100, Arnaud Pouliquen wrote:
>>>> Implement the ioctl function that parses the list of
>>>> rpmsg drivers registered to create an associated device.
>>>> To be ISO user API, in a first step, the driver_override
>>>> is only allowed for the RPMsg raw service, supported by the
>>>> rpmsg_char driver.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> ---
>>>>  drivers/rpmsg/rpmsg_ctrl.c | 43 ++++++++++++++++++++++++++++++++++++--
>>>>  1 file changed, 41 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>>>> index 065e2e304019..8381b5b2b794 100644
>>>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>>>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>>>> @@ -56,12 +56,51 @@ static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static const char *rpmsg_ctrl_get_drv_name(u32 service)
>>>> +{
>>>> +	struct rpmsg_ctl_info *drv_info;
>>>> +
>>>> +	list_for_each_entry(drv_info, &rpmsg_drv_list, node) {
>>>> +		if (drv_info->ctrl->service == service)
>>>> +			return drv_info->ctrl->drv_name;
>>>> +	}
>>>> +
>>>
>>> I'm unsure about the above... To me this looks like what the .match() function
>>> of a bus would do.  And when I read Bjorn's comment he brought up the
>>> auxiliary_bus.  I don't know about the auxiliary_bus but it is worth looking
>>> into.  Registering with a bus would streamline a lot of the code in this
>>> patchset.
>>
>> As answered Bjorn, we already have the RPMsg bus to manage the rpmsg devices.
>> Look like duplication from my POV, except if the IOCTL does not manage channel
>> but only endpoint.
>>
>> In my design I considered that the rpmsg_ctrl creates a channel associated to a
>> rpmsg_device such as the RPMsg ns_announcement.
>>
>> Based on this assumption, if we implement the auxiliary_bus (or other) for the
>> rpmsg_ctrl a RPMsg driver will have to manage the probe by rpmsg_bus and by the
>> auxillary bus. The probe from the auxiliary bus would lead to the creation of an
>> RPMsg device on the rpmsg_bus, so a duplication with cross dependencies and
>> would probably make tricky the remove part.
>>
>> That said, I think the design depends on the functionality that should be
>> implemented in the rpmsg_ctrl. Here is an alternative approach based on the
>> auxiliary bus, which I'm starting to think about:
>>
>> The current approach of the rpmsg_char driver is to use the IOCTRL interface to
>> instantiate a cdev with an endpoint (the RPMsg device is associated with the
>> ioctl dev). This would correspond to the use of an auxiliary bus to manage local
>> endpoint creations.
>>
>> We could therefore consider an RPMsg name service based on an RPmsg device. This
>> RPMsg device would register a kind of "RPMsg service endpoint" driver on the
>> auxiliary rpmsg_ioctl bus.
>> The rpmsg_ctrl will be used to instantiate the endpoints for this RPMsg device.
>> on user application request the rpmsg_ctrl will call the appropriate auxiliary
>> device to create an endpoint.
>>
>> If we consider that one objective of this series is to allow application to
>> initiate the communication with the remote processor, so to be able to initiate
>> the service (ns announcement sent to the remote processor).
>> This implies that:
>> -either the RPMsg device has been probed first by a remote ns announcement or by
>> a Linux kernel driver using the "driver_override", to register an auxiliary
>> device. In this case an endpoint will be created associated to the RPMsg service
>> - or create a RPMsg device on first ioctl endpoint creation request, if it does
>> not exist (that could trig a NS announcement to remote processor).
>>
>> But I'm not sure that this approach would work with QCOM RPMsg backends...
>>
> 
> I don't think there is a way forward with this set without a clear understanding
> of the Glink and SMD drivers.  I have already spent a fair amount of time in the
> Glink driver and will continue on Monday with SMD.  
> 
>>>
>>> I'm out of time for today - I will continue tomorrow.
>>
>> It seems to me that the main point to step forward is to clarify the global
>> design and features of the rpmsg-ctrl.
>> Depending on the decision taken, this series could be trashed and rewritten from
>> a blank page...To not lost to much time on the series don't hesitate to limit
>> the review to the minimum.
>>
> 
> I doubt you will ever get clear guidelines on the whole solution.  I will get
> back to you once I am done with the SMD driver, which should be in the
> latter part of next week.


Thanks for your time past on this topic!

I don't expect a clear guidance but that we clarify the objective of this RPMsg
IOCTL. A first step would be sure that we are in line with the objective of the
RPMsg IOCTL.
For instance should we continue in a way to have the rpmsg_char more "rpmsg
service" generic, relying on a rpmsg_ioctl for the control part? Or should we
implement something independent (with is own API) to limit dependency with QCOM
backends constraints?
At the end, if implementing a IOCTL interface directly in the RPMsg TTY seems to
you and Bjorn simpler, I can also go on this way...

On my side I expect to find time this week to prototype a RPMSg ioctl using the
auxiliary bus to better understand involved mechanism.

Thanks,
Arnaud

> 
>> Thanks,
>> Arnaud
>>
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>> +	return NULL;
>>>> +}
>>>> +
>>>>  static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
>>>>  				 unsigned long arg)
>>>>  {
>>>>  	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
>>>> -
>>>> -	dev_info(&ctrldev->dev, "Control not yet implemented\n");
>>>> +	void __user *argp = (void __user *)arg;
>>>> +	struct rpmsg_channel_info chinfo;
>>>> +	struct rpmsg_endpoint_info eptinfo;
>>>> +	struct rpmsg_device *newch;
>>>> +
>>>> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>>>> +		return -EFAULT;
>>>> +
>>>> +	/*
>>>> +	 * In a frst step only the rpmsg_raw service is supported.
>>>> +	 * The override is foorced to RPMSG_RAW_SERVICE
>>>> +	 */
>>>> +	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
>>>> +	if (!chinfo.driver_override)
>>>> +		return -ENODEV;
>>>> +
>>>> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
>>>> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
>>>> +	chinfo.src = eptinfo.src;
>>>> +	chinfo.dst = eptinfo.dst;
>>>> +
>>>> +	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
>>>> +	if (!newch) {
>>>> +		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
>>>> +		return -ENXIO;
>>>> +	}
>>>>  
>>>>  	return 0;
>>>>  };
>>>> -- 
>>>> 2.17.1
>>>>

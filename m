Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2233830894B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 14:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhA2ML3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jan 2021 07:11:29 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:12606 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232681AbhA2MID (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 07:08:03 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10T9MHhF015033;
        Fri, 29 Jan 2021 10:45:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ydMVnitGfD8/FjKB3zOlqZqI2djuBc8w9do4vpZ0zDI=;
 b=CKbi65fvzCCeOQOVxaPrL+TtRMYlT7UOy9xOgDprKzejJ7s/kv/OoMTH3KD1Ep5wG9Cy
 qz2TWauzbzy3ccf62m33mF+3Co/O8725sTzqJWlvP3WJKdMuiMo7iOcXJD983OXNH0nD
 LnG7ruzpP9ITP9rasMh8VXtce74MKAl4iStl0JcI8Xq80/16J5JTesSeTedwibSPFkBp
 peKt58dodYdsSuhq76whrxywxqyq3+AXhzrpnFNluLu8bBqHdMPjksQSk2OCkJU99/FA
 4asfD6jGFQewXQrzTc6MV1p8iR6gojVB0Mu3G3mmkYD0RtICnixYLV02txfGn/5gCD2B 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3689tecmwa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 29 Jan 2021 10:45:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4612010002A;
        Fri, 29 Jan 2021 10:45:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AAFC22CD1D;
        Fri, 29 Jan 2021 10:45:09 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 10:45:08 +0100
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
 <20210122205934.GA866146@xps15> <20210129001303.GA1211489@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <d8176140-73bf-fa0b-6d0e-f521c6c90910@foss.st.com>
Date:   Fri, 29 Jan 2021 10:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129001303.GA1211489@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-01-29_04:2021-01-28,2021-01-29 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/29/21 1:13 AM, Mathieu Poirier wrote:
> [...]
> 
>>> It seems to me that the main point to step forward is to clarify the global
>>> design and features of the rpmsg-ctrl.
>>> Depending on the decision taken, this series could be trashed and rewritten from
>>> a blank page...To not lost to much time on the series don't hesitate to limit
>>> the review to the minimum.
>>>
>>
>> I doubt you will ever get clear guidelines on the whole solution.  I will get
>> back to you once I am done with the SMD driver, which should be in the
>> latter part of next week.
>>
> 
> After looking at the rpmsg_chrdev driver, its current customers (i.e the Qcom
> drivers), the rpmsg name service and considering the long term goals of this
> patchset I have the following guidelines: 
> 
> 1) I thought long and hard about how to split the current rpmsg_chrdev driver
> between the control plane and the raw device plane and the end solution looks
> much slimpler than I expected.  Exporting function rpmsg_eptdev_create() after
> moving it to another file (along with other dependencies) should be all we need.
> Calling rpmsg_eptdev_create() from rpmsg_ctrldev_ioctl() will automatically load
> the new driver, the same way calling rpmsg_ns_register_device() from
> rpmsg_probe() took care of loading the rpmsg_ns driver.
> 
> 2) While keeping the control plane functionality related to
> RPMSG_CREATE_EPT_IOCTL intact, introduce a new RPMSG_CREATE_DEV_IOCTL that will
> allow for the instantiation of rpmsg_devices, exactly the same way a name service
> announcement from a remote processor does.  I envision that code path to
> eventually call rpmsg_create_channel().
> 
> 3) Leave the rpmsg_channel_info structure intact and use the
> rpmsg_channel_info::name to bind to a rpmsg_driver, exactly how it is currently
> done for name service driver selection.  That will allow us to re-use the
> current rpmsg_bus intrastructure, i.e rpmsg_bus::match(), without having to deal
> with yet another bus type.  Proceeding this way gives us the opportunity to keep
> the current channel name convention for other rpmch_chrdev users untouched.
> 
> 4) In a prior conversation you indicated the intention of instantiating the
> rpmsg_chrdev from the name service interface.  I agree with doing so but 
> conjugating that with the RPMSG_CHAR kenrel define may be tricky.  I will wait
> to see what you come up with.
> 
> I hope this helps.

Thank you for these guidelines! It need a bit of time to look at the details
(especially point 1) ), but your suggestion seems to me to be a good compromise.
I hope to come back soon with a new revision based on this point.

Regards,
Arnaud

> 
> Thanks,
> Mathieu
> 
> 
>  
>>> Thanks,
>>> Arnaud
>>>
>>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>>>> +	return NULL;
>>>>> +}
>>>>> +
>>>>>  static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
>>>>>  				 unsigned long arg)
>>>>>  {
>>>>>  	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
>>>>> -
>>>>> -	dev_info(&ctrldev->dev, "Control not yet implemented\n");
>>>>> +	void __user *argp = (void __user *)arg;
>>>>> +	struct rpmsg_channel_info chinfo;
>>>>> +	struct rpmsg_endpoint_info eptinfo;
>>>>> +	struct rpmsg_device *newch;
>>>>> +
>>>>> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>>>>> +		return -EFAULT;
>>>>> +
>>>>> +	/*
>>>>> +	 * In a frst step only the rpmsg_raw service is supported.
>>>>> +	 * The override is foorced to RPMSG_RAW_SERVICE
>>>>> +	 */
>>>>> +	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
>>>>> +	if (!chinfo.driver_override)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
>>>>> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
>>>>> +	chinfo.src = eptinfo.src;
>>>>> +	chinfo.dst = eptinfo.dst;
>>>>> +
>>>>> +	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
>>>>> +	if (!newch) {
>>>>> +		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
>>>>> +		return -ENXIO;
>>>>> +	}
>>>>>  
>>>>>  	return 0;
>>>>>  };
>>>>> -- 
>>>>> 2.17.1
>>>>>

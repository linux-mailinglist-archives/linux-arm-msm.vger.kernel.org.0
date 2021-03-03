Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4A132C1E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389554AbhCCVjV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:39:21 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:47334 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241960AbhCCNZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 08:25:50 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 123DL0Ep003994;
        Wed, 3 Mar 2021 14:22:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iWcMqaioAbOcEOUYc2PgX4sjLWX0rmRYYIEX6Aexrls=;
 b=7mMxG78oxY9mNZQEcSHcjvnffXSccMz7nMDgWejxe1zgpIdl4axXFV0pH4dKSOuYi02F
 Hg9q5zXQuZfPVEBx1Ultdruu3DV3GyYXF4kOXzXt2HXOBxHjDdIMuU+hZU43bVqHOZXU
 qDUhXYjCyTMq15Z94noWyt1GP+SxL2Gw0Ogzhhd4giwM2GT9zBNEdbg7GX5OP9n0DiWZ
 +7t/M3ZtmRFTWjIkeINY8va0AW6bbmDLhJc2lWtp5/pU0G350DDnyJU0HWQ1J/FLY0Wt
 rbvDUUeZ3TiKqUgimjKZ6MmtZUjK3KMZ6ioBkjoN5C8k7wQBe3SQ4WjrJegKj1+ms25a +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 370xehwtgp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 Mar 2021 14:22:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E81010002A;
        Wed,  3 Mar 2021 14:22:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52E0D246CF5;
        Wed,  3 Mar 2021 14:22:38 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Mar
 2021 14:22:37 +0100
Subject: Re: [PATCH v5 04/16] rpmsg: char: export eptdev create an destroy
 functions
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-5-arnaud.pouliquen@foss.st.com>
 <20210302175702.GA3791957@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <4b361c08-09ad-b353-4896-97af3edfc9c6@foss.st.com>
Date:   Wed, 3 Mar 2021 14:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302175702.GA3791957@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-03_04:2021-03-03,2021-03-03 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 3/2/21 6:57 PM, Mathieu Poirier wrote:
> Good morning,
> 
> I have started to review this set - comments will be staggered over several
> days.
> 
> On Fri, Feb 19, 2021 at 12:14:49PM +0100, Arnaud Pouliquen wrote:
>> To prepare the split code related to the control and the endpoint
>> devices in separate files:
>> - suppress the dependency with the rpmsg_ctrldev struct,
>> - rename and export the functions in rpmsg_char.h.
>>
>> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 22 ++++++++++------
>>  drivers/rpmsg/rpmsg_char.h | 51 ++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 66 insertions(+), 7 deletions(-)
>>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 9e33b53bbf56..78a6d19fdf82 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -1,5 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /*
>> + * Copyright (C) 2021, STMicroelectronics
>>   * Copyright (c) 2016, Linaro Ltd.
>>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
>>   * Copyright (c) 2012, PetaLogix
>> @@ -22,6 +23,7 @@
>>  #include <linux/uaccess.h>
>>  #include <uapi/linux/rpmsg.h>
>>  
>> +#include "rpmsg_char.h"
>>  #include "rpmsg_internal.h"
>>  
>>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>> @@ -78,7 +80,7 @@ struct rpmsg_eptdev {
>>  	wait_queue_head_t readq;
>>  };
>>  
>> -static int rpmsg_eptdev_destroy(struct device *dev, void *data)
>> +static int rpmsg_eptdev_destroy(struct device *dev)
>>  {
>>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>>  
>> @@ -277,7 +279,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>>  		return -EINVAL;
>>  
>> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
>> +	return rpmsg_eptdev_destroy(&eptdev->dev);
>>  }
>>  
>>  static const struct file_operations rpmsg_eptdev_fops = {
>> @@ -336,10 +338,15 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>>  	kfree(eptdev);
>>  }
>>  
>> -static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>> +{
>> +	return rpmsg_eptdev_destroy(dev);
>> +}
>> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
> 
> Below we have rpmsg_chrdev_create_eptdev() so it would make sense to have
> rpmsg_chrdev_destroy_ept().
> 
> I would also rename rpmsg_eptdev_destroy() to rpmsg_chrdev_destroy_ept() and
> export that symbol rather than introducing a function that only calls another
> one.  You did exactly that for rpmsg_chrdev_create_eptdev().

This function is used in rpmsg_ctrl to remove eptdev devices.
As device_for_each_child request a specific function prototype I do not only
export but change function prototype.

I can squash all in one function but that means that the "data" parameter is
just always unused.

> 
>> +
>> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>>  			       struct rpmsg_channel_info chinfo)
>>  {
>> -	struct rpmsg_device *rpdev = ctrldev->rpdev;
>>  	struct rpmsg_eptdev *eptdev;
>>  	struct device *dev;
>>  	int ret;
>> @@ -359,7 +366,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>>  
>>  	device_initialize(dev);
>>  	dev->class = rpmsg_class;
>> -	dev->parent = &ctrldev->dev;
>> +	dev->parent = parent;
>>  	dev->groups = rpmsg_eptdev_groups;
>>  	dev_set_drvdata(dev, eptdev);
>>  
>> @@ -402,6 +409,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>>  
>>  	return ret;
>>  }
>> +EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>>  
>>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
>>  {
>> @@ -441,7 +449,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>>  	chinfo.src = eptinfo.src;
>>  	chinfo.dst = eptinfo.dst;
>>  
>> -	return rpmsg_eptdev_create(ctrldev, chinfo);
>> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
> 
> Not sure why we have to change the signature of rpmsg_eptdev_create() but I may
> find an answer to that question later on in the patchset.

Here I need to break dependency with rpmsg_ctrldev that will move to the
rpmsg_ctrl.c. rpmsg_eptdev_create doesn't need it but just parent devices to be
attached to.

I will add more explicit information about this, in the commit message.

Thanks,
Arnaud

> 
>>  };
>>  
>>  static const struct file_operations rpmsg_ctrldev_fops = {
>> @@ -527,7 +535,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>>  	int ret;
>>  
>>  	/* Destroy all endpoints */
>> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
>> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>>  	if (ret)
>>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
>>  
>> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
>> new file mode 100644
>> index 000000000000..0feb3ea9445c
>> --- /dev/null
>> +++ b/drivers/rpmsg/rpmsg_char.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * Copyright (C) STMicroelectronics 2021.
>> + */
>> +
>> +#ifndef __RPMSG_CHRDEV_H__
>> +#define __RPMSG_CHRDEV_H__
>> +
>> +#if IS_ENABLED(CONFIG_RPMSG_CHAR)
>> +/**
>> + * rpmsg_chrdev_create_eptdev() - register char device based on an endpoint
>> + * @rpdev:  prepared rpdev to be used for creating endpoints
>> + * @parent: parent device
>> + * @chinfo: assiated endpoint channel information.
>> + *
>> + * This function create a new rpmsg char endpoint device to instantiate a new
>> + * endpoint based on chinfo information.
>> + */
>> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>> +			       struct rpmsg_channel_info chinfo);
>> +
>> +/**
>> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device
>> + * @data: parent device
>> + * @chinfo: assiated endpoint channel information.
>> + *
>> + * This function create a new rpmsg char endpoint device to instantiate a new
>> + * endpoint based on chinfo information.
>> + */
>> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
>> +
>> +#else  /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
>> +
>> +static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
>> +					     struct device *parent,
>> +					     struct rpmsg_channel_info chinfo)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +#endif /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
>> +
>> +#endif /*__RPMSG_CHRDEV_H__ */
>> -- 
>> 2.17.1
>>

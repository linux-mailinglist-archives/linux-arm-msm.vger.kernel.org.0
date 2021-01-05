Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884602EB0EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 18:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730489AbhAEREM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 12:04:12 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:17532 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729278AbhAEREM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 12:04:12 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105H2TLU010179;
        Tue, 5 Jan 2021 18:03:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Z4vwLQY6vI9O8i7p/Kx9x6nqcBw01hW25ssbUaEcFgs=;
 b=JMT0LgOgbwOh/Va1SRnjKacfWnM2xmzSN5NiJbUg6X0asBByJQu3ghVEg+gOtYLu83tM
 1FGxEg/d6RljVnUO43d5bdy4904oY4qR2bR+p8iFcRrT1mmixBK0ZVWDRQf6JDTapBuh
 6f+gD/RIVD7XSdRE4rRfIuQOOaw1YTsu+5W4VJsBPWpAkrehM4p2efAUSmdya2rag2wB
 r7mKIkwCiNsFEPDZGNBdrIjkaTgJDN6PQRTex7uPrbgeql2MBxF2AaJEi/6yxVPpxxgM
 e51ARMAYshUbjH7/dfqve2i8876IqC8vnsVS41fltNrCw00cmto8Eb8vNRHALGmjWf9m TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35teuv2eqw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Jan 2021 18:03:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF59E10002A;
        Tue,  5 Jan 2021 18:03:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA30E233143;
        Tue,  5 Jan 2021 18:03:22 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 18:03:21 +0100
Subject: Re: [PATCH v2 07/16] rpmsg: char: clean up rpmsg class
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-8-arnaud.pouliquen@foss.st.com>
 <X/O3KkJrmVfGvFEF@builder.lan> <X/O4rZfY74ryFQK4@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <813bf9dd-e189-66cc-83c1-775270561019@foss.st.com>
Date:   Tue, 5 Jan 2021 18:03:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/O4rZfY74ryFQK4@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-05_05:2021-01-05,2021-01-05 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/5/21 1:54 AM, Bjorn Andersson wrote:
> On Mon 04 Jan 18:47 CST 2021, Bjorn Andersson wrote:
> 
>> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
>>
>> This patch doesn't "clean up" the class, as described in $subject. It
>> just removes it.
>>
>>> Suppress the management of the rpmsg class as attribute. It is already
>>> handled in /sys/bus rpmsg as specified in
>>> documentation/ABI/testing/sysfs-bus-rpmsg.
>>
>> Afaict it doesn't relate to /sys/bus/rpmsg, but rather what attributes
>> should be associated with the rpmsg_device (and thereby present in its
>> sysfs directory). But if these attributes are also added by the bus,
>> then why do we have this code? If that's the case this seems like a nice
>> cleanup that we should do outside/before merging the other patches.
>>
>>> This patch prepares the migration of the control device in rpmsg_ctrl.
>>>
>>
>> It would be useful if the commit message described how it prepares for
>> the migration and why.
>>
> 
> Now I see what this patch does, it removes the attributes from the
> character device's struct device, because they are provided by the
> struct rpmsg_device's bus!
> 
> I wish your commit message made this obvious.
> 
> Also, this implies that for a few patches here rpmsg_char is just
> broken - which I don't like.

I will move this patch at the end of the series and clarify commit message

Thanks
Arnaud

> 
> Regards,
> Bjorn
> 
>> Regards,
>> Bjorn
>>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>> ---
>>>  drivers/rpmsg/rpmsg_char.c | 48 --------------------------------------
>>>  1 file changed, 48 deletions(-)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>> index 4bbbacdbf3bb..732f5caf068a 100644
>>> --- a/drivers/rpmsg/rpmsg_char.c
>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>> @@ -27,7 +27,6 @@
>>>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>>>  
>>>  static dev_t rpmsg_major;
>>> -static struct class *rpmsg_class;
>>>  
>>>  static DEFINE_IDA(rpmsg_ctrl_ida);
>>>  static DEFINE_IDA(rpmsg_ept_ida);
>>> @@ -291,41 +290,6 @@ static const struct file_operations rpmsg_eptdev_fops = {
>>>  	.compat_ioctl = compat_ptr_ioctl,
>>>  };
>>>  
>>> -static ssize_t name_show(struct device *dev, struct device_attribute *attr,
>>> -			 char *buf)
>>> -{
>>> -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
>>> -
>>> -	return sprintf(buf, "%s\n", eptdev->chinfo.name);
>>> -}
>>> -static DEVICE_ATTR_RO(name);
>>> -
>>> -static ssize_t src_show(struct device *dev, struct device_attribute *attr,
>>> -			 char *buf)
>>> -{
>>> -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
>>> -
>>> -	return sprintf(buf, "%d\n", eptdev->chinfo.src);
>>> -}
>>> -static DEVICE_ATTR_RO(src);
>>> -
>>> -static ssize_t dst_show(struct device *dev, struct device_attribute *attr,
>>> -			 char *buf)
>>> -{
>>> -	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
>>> -
>>> -	return sprintf(buf, "%d\n", eptdev->chinfo.dst);
>>> -}
>>> -static DEVICE_ATTR_RO(dst);
>>> -
>>> -static struct attribute *rpmsg_eptdev_attrs[] = {
>>> -	&dev_attr_name.attr,
>>> -	&dev_attr_src.attr,
>>> -	&dev_attr_dst.attr,
>>> -	NULL
>>> -};
>>> -ATTRIBUTE_GROUPS(rpmsg_eptdev);
>>> -
>>>  static void rpmsg_eptdev_release_device(struct device *dev)
>>>  {
>>>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>>> @@ -358,9 +322,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>>>  	init_waitqueue_head(&eptdev->readq);
>>>  
>>>  	device_initialize(dev);
>>> -	dev->class = rpmsg_class;
>>>  	dev->parent = &ctrldev->dev;
>>> -	dev->groups = rpmsg_eptdev_groups;
>>>  	dev_set_drvdata(dev, eptdev);
>>>  
>>>  	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
>>> @@ -477,7 +439,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>>  	dev = &ctrldev->dev;
>>>  	device_initialize(dev);
>>>  	dev->parent = &rpdev->dev;
>>> -	dev->class = rpmsg_class;
>>>  
>>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>>  	ctrldev->cdev.owner = THIS_MODULE;
>>> @@ -553,17 +514,9 @@ static int rpmsg_char_init(void)
>>>  		return ret;
>>>  	}
>>>  
>>> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
>>> -	if (IS_ERR(rpmsg_class)) {
>>> -		pr_err("failed to create rpmsg class\n");
>>> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>> -		return PTR_ERR(rpmsg_class);
>>> -	}
>>> -
>>>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>>>  	if (ret < 0) {
>>>  		pr_err("rpmsgchr: failed to register rpmsg driver\n");
>>> -		class_destroy(rpmsg_class);
>>>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>  	}
>>>  
>>> @@ -574,7 +527,6 @@ postcore_initcall(rpmsg_char_init);
>>>  static void rpmsg_chrdev_exit(void)
>>>  {
>>>  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>>> -	class_destroy(rpmsg_class);
>>>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>>>  }
>>>  module_exit(rpmsg_chrdev_exit);
>>> -- 
>>> 2.17.1
>>>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DE032E755
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 12:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCELmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 06:42:45 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46726 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229494AbhCELmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 06:42:45 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 125BgFCj016426;
        Fri, 5 Mar 2021 12:42:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ayap1z4ytk+f58IuXbxbKEhdT2MiFhxsxYLzw+aUaUU=;
 b=M5qQWPFaJ/+ecOybKEIVTyq8sLJ36eyGPTsbCz7GmwPN4EJCW1N0/aONz9qThZKOiMj+
 ck0HJT1B9TWqf3AJQr5fygf2ehv5qbZXq8TUokWzboPfmlynhdB8D1gkfQ5DaRAFXNde
 3x0CUdNZcW5yO9hC+PfycbLOudcUlfIfEBhSW58Cskmz7ZhvqgUzNSeweU5h6KOx5Tri
 XyGo7WCE1xbLq3IidEMUG2jt/PlI4+b8DRI0DmPC93Xmm7JhVrIMGUCz5ZK7at5nlQ2s
 kSkVSEHnGNT0IoY/m+me59nKmhr6YqVnE6LLbY59IpgxIIXmGbbnM8YA4jJR0siJQWsg lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 373cb5tt2b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Mar 2021 12:42:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB06710002A;
        Fri,  5 Mar 2021 12:42:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7D1E24EE26;
        Fri,  5 Mar 2021 12:42:37 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Mar
 2021 12:42:37 +0100
Subject: Re: [PATCH v5 13/16] rpmsg: char: introduce
 __rpmsg_chrdev_create_eptdev function
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
 <20210304190553.GD3854911@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b22e9ab4-f278-d20c-628b-13676a83b232@foss.st.com>
Date:   Fri, 5 Mar 2021 12:42:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304190553.GD3854911@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-05_05:2021-03-03,2021-03-05 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu

On 3/4/21 8:05 PM, Mathieu Poirier wrote:
> On Fri, Feb 19, 2021 at 12:14:58PM +0100, Arnaud Pouliquen wrote:
>> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
>> the rpmsg_eptdev context structure.
> 
> Add newlines between paragraphs.
> 
>> This patch prepares the introduction of a RPMsg device for the
>> char device. the RPMsg device will need a reference to the context.
> 
> s/the/The
> 
> s/RPMsg/RPMSG - throughout the patchset.
> 
> As a general note please be mindful of patch changelogs.  I often find myself
> having to decipher the ideas being conveyed.

Sure, i will rewrite changelogs and comments to make them more explicit.

> 
> I am done reviewing this set.  There are things I will want to come back to but
> the general goals behind the patchset are being achieved.

Thanks for the review! So I'm going to move forward with this approach.

For the next revision I would propose, to simplify the review, to remove patches
related to the RPMSG_CREATE_DEV_IOCTL.

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
>>  1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 09ae1304837c..66dcb8845d6c 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -328,8 +328,9 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
>>  
>> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>> -			       struct rpmsg_channel_info chinfo)
>> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
>> +							 struct device *parent,
>> +							 struct rpmsg_channel_info chinfo)
>>  {
>>  	struct rpmsg_eptdev *eptdev;
>>  	struct device *dev;
>> @@ -337,7 +338,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  
>>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>>  	if (!eptdev)
>> -		return -ENOMEM;
>> +		return ERR_PTR(-ENOMEM);
>>  
>>  	dev = &eptdev->dev;
>>  	eptdev->rpdev = rpdev;
>> @@ -381,7 +382,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  		put_device(dev);
>>  	}
>>  
>> -	return ret;
>> +	return eptdev;
>>  
>>  free_ept_ida:
>>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
>> @@ -391,7 +392,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>>  	put_device(dev);
>>  	kfree(eptdev);
>>  
>> -	return ret;
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
>> +			       struct rpmsg_channel_info chinfo)
>> +{
>> +	struct rpmsg_eptdev *eptdev;
>> +
>> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
>> +	if (IS_ERR(eptdev))
>> +		return PTR_ERR(eptdev);
>> +
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>>  
>> -- 
>> 2.17.1
>>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F2F32C210
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbhCCVkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:40:25 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:47973 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351065AbhCCPAe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 10:00:34 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 123EvxNC032645;
        Wed, 3 Mar 2021 15:58:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vRm8bwSPJgkfRJocoNDq21I3g5Iz0nJ0Oe0Q61WfJaE=;
 b=Jz78D8JecEgrynfgvqJwgZDMncQ3IQHrqilHhKgppgkEMIS9nbQ+Q9kfz5XH3qSHZify
 e3jbIVkB5iAtMFDOA9IDjh8VBzQjpYKLJkDoRYPR8HvoJWzOdC9YZfxFqNDHmzwtfMLs
 iItOsRpTfQQv5FS7c/yuM230YiLWgb88Cnr8ZyddTOmqNks/arW7mDV4JjCIsS6RZ/8V
 Fv94O8VprG0ITZVq/G83RL+HlWwAtoc3+8r2XGa2Ra7WltIPSdnqTJ1bPGd87RPtEcyu
 R0Oth4y6gxSNenacFrkSBSQHMqpCme4YHzzxVkkeoT4+MKYvUZKY+L4WPCkVTAkfMoA9 HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36yfc41huy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 Mar 2021 15:58:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B12A2100038;
        Wed,  3 Mar 2021 15:58:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21FE025F403;
        Wed,  3 Mar 2021 15:58:58 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Mar
 2021 15:58:57 +0100
Subject: Re: [PATCH v5 05/16] rpmsg: char: dissociate the control device from
 the rpmsg class
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-6-arnaud.pouliquen@foss.st.com>
 <20210302180111.GB3791957@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <21d27324-3735-ee93-f3aa-813475b64b93@foss.st.com>
Date:   Wed, 3 Mar 2021 15:58:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302180111.GB3791957@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-03_04:2021-03-03,2021-03-03 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/2/21 7:01 PM, Mathieu Poirier wrote:
> On Fri, Feb 19, 2021 at 12:14:50PM +0100, Arnaud Pouliquen wrote:
>> The RPMsg control device is a RPMsg device, it is already
>> referenced in the RPMsg bus. There is only an interest to
>> reference the ept char devices in the rpmsg class.
>> This patch prepares the code split of the control and end point
>> devices in two separate files.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 78a6d19fdf82..23e369a00531 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -485,7 +485,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>  	dev = &ctrldev->dev;
>>  	device_initialize(dev);
>>  	dev->parent = &rpdev->dev;
>> -	dev->class = rpmsg_class;
> 
> This may break user space...  It has been around for so long that even if the
> information is redundant we have to keep it.

Yes, this point is part of the grey space of my series...
I did it on the assumption that the "rpmsg" class interface is not used for the
control part. Indeed, the group associated to the class provides information
about the name service, the source address and the destination address of the
endpoint.These group is not defined for the control device.

That said, to preserve the interface, I can move the class creation in rpmsg
control driver, to share it between the both drivers. As consequence I will need
to manage the probe ordering of the char and control modules to ensure that the
class is created before used. This should be solved by reintroducing patch[1]
with a fix for the compilation warning.

[1]https://lkml.org/lkml/2021/2/4/197

Thanks,
Arnaud

> 
>>  
>>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>>  	ctrldev->cdev.owner = THIS_MODULE;
>> -- 
>> 2.17.1
>>

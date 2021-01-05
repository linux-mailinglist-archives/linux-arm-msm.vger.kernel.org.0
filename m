Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3DB2EB0FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 18:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730236AbhAERF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 12:05:57 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:28368 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729837AbhAERF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 12:05:57 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105H3RpI002497;
        Tue, 5 Jan 2021 18:05:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AaKXXBBSLn/MwtIXJ9J+oqskFzFqwJhdPjJtMaNGd3w=;
 b=Ad8AgPEoHISNV4TWrfQYBnrfjVkgwDVMZHyEAVFsb5E8QGdk1kvCHlmXlxaDjnXgYHx8
 A31B3r8CRAHZAAbZUhO8cU0PaBkH/ApJHI+N1mD3VTsQY8maJkMy5WmSskxebWGUTyZA
 CP+bBtCQPaHUVwLaarCyD6TUqILKtFGSzOcxCDDNtzO2njGspREYkSALlOZcPAz57Tkt
 h2WQ0Apd0+8IyKBmbLxOOIc8V9JEa+LtaAqokAiat7YAL5t7AiYP9kid1EEw7dPTEkIe
 c37FjirimPzimaOARIEbnn0Mu85el3BENqkHQ3qJINnSLSeSVpI4r6sK/vknMFMxAHYy Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35tf66x668-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Jan 2021 18:05:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65E2610002A;
        Tue,  5 Jan 2021 18:05:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56A3723A239;
        Tue,  5 Jan 2021 18:05:09 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 18:05:08 +0100
Subject: Re: [PATCH v2 10/16] rpmsg: char: allow only one endpoint per device
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-11-arnaud.pouliquen@foss.st.com>
 <X/O6BvP+vqLvbi5f@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <9a75e5fa-ad09-0145-18f1-09738433bf88@foss.st.com>
Date:   Tue, 5 Jan 2021 18:05:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/O6BvP+vqLvbi5f@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-05_05:2021-01-05,2021-01-05 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/5/21 1:59 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
>> Only one endpoint can be created per device, prevent from multi open.
>>
> 
> Having multiple invocations of rpmsg_create_ept() with the same chinfo
> sounds like a bad idea. I think in the SMD and GLINK case the underlying
> transport would complain that the related chinfo is already "busy", but
> this seems like an appropriate fix regardless.
> 
> Please add a proper Fixes: tag and send this outside of this patch
> series.

I will send it in a separate patch.

Regards,
Arnaud

> 
> Thanks,
> Bjorn
> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 66e01b979e72..4b0674a2e3e9 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -122,6 +122,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>>  	struct device *dev = &eptdev->dev;
>>  
>> +	if (eptdev->ept)
>> +		return -EBUSY;
>> +
>>  	get_device(dev);
>>  
>>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
>> -- 
>> 2.17.1
>>

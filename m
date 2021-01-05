Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6AD2EB111
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 18:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbhAERI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 12:08:58 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25140 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729230AbhAERI6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 12:08:58 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105H2UiT010183;
        Tue, 5 Jan 2021 18:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7NJ8olbBLimAhQJ9f2wajbEciT5QawMFDsYtnEdlfgM=;
 b=txC8IkStyg1VJWP4IXXiopDRen2/QLsq9aCMIvm8tebrfSRt0FtQjERKQIb0adCkVu6y
 YMhiIKZCRstZfDJmioAVvZgLpJT4Tz4nay93I8FnSWCm2FTBAYhB1zA0cGpT8xp6BSar
 glSCrVKBXxQweSoL3pXWJkK1QpS4ZtMOWUh99aKSv+yPMafyGcmHkzJ/idB5pDn6gXSh
 +RUxL8VX/WEwCi8QeaLq4zejP6Gh7J0CosPiUQgAo633uxfcONsN5EoWSGShIHbyKn2G
 /2tAlfMQ2heAiEk9aYHYFBgSYKMMbI4CIBY6q7UuM3cQzq45d8icD/hG7lr2m8lKMT2z 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35teuv2fmx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Jan 2021 18:08:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2A2C100034;
        Tue,  5 Jan 2021 18:08:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9410F249E8C;
        Tue,  5 Jan 2021 18:08:10 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 18:08:09 +0100
Subject: Re: [PATCH v2 11/16] rpmsg: char: check destination address is not
 null
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-12-arnaud.pouliquen@foss.st.com>
 <X/O6z6ngPmML3nOD@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <4058e3b6-11b3-0938-e00d-673f0896692d@foss.st.com>
Date:   Tue, 5 Jan 2021 18:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/O6z6ngPmML3nOD@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-05_05:2021-01-05,2021-01-05 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/5/21 2:03 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
>> The name service announcement is not sent if no endpoint is created by
>> default. If the destination address is not precised by the
>> application when creating the device (thanks to the RPMsg CTRL interface),
>> it is not possible to have a valid RPMsg channel.
>>
> 
> In the Qualcomm transports, the chinfo.name is used to identify the
> channel, so there it's valid to create a endpoint without dst.

So to be move in rpmsg virtio...either reporting an error or generating a NS
announcement.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 4b0674a2e3e9..8b1928594d10 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -305,6 +305,16 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>  	struct device *dev;
>>  	int ret;
>>  
>> +	/* There is not ept created by default. As consequence there is not NS
>> +	 * announcement and the destination address has to be set.
>> +	 * this limitation could be solved in future by adding a helper in
>> +	 * rpmsg_ns.
>> +	 */
>> +	if (rpdev->dst == RPMSG_ADDR_ANY) {
>> +		dev_err(dev, "destination address invalid (%d)\n", rpdev->dst);
>> +		return -EINVAL;
>> +	}
>> +
>>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>>  	if (!eptdev)
>>  		return -ENOMEM;
>> -- 
>> 2.17.1
>>

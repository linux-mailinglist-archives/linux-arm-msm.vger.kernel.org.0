Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21102EB21A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 19:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbhAESIN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 13:08:13 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:53648 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730127AbhAESIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 13:08:12 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105I1dtg032746;
        Tue, 5 Jan 2021 19:07:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xjs7TXtSIpmQCK3mtFyCLlScE1Dl/kgczaX8fGtSkvI=;
 b=myZtcZd5vntD5e/elonPH84rISFr2yCwIDwSNc50XIsfkgVel3djAxB3yzywS58aktJv
 FCaa9y+uT1nvVKFS/+bJER04nt9Vz3CBJ3W7r1G/WPWGnqzLy9m2tARpXJPqZBuMKuYy
 4if6q69YGBrvcOfiel5qaf9jB4Mbv/b4KEcPh/eTyh+IDjddpmG9O1tqucUTIVw6Q635
 zdtFnp+Fx9NN7Bj+t7x/JwO4wWd1DY5LpFbtET5vhdgfkCJHvy2r/VaGHoLAOAxZrcVb
 BqHZQRhr202YFhl+hocj8H4Wy47DJ7eGVP7kVvnxZnKtJYj9DfLrNeUGOF+nFuOJXqq5 cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35tgkmtc7q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Jan 2021 19:07:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7BEF10002A;
        Tue,  5 Jan 2021 19:07:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEAEB237832;
        Tue,  5 Jan 2021 19:07:23 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 19:07:23 +0100
Subject: Re: [PATCH v2 04/16] rpmsg: ctrl: implement the ioctl function to
 create device
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-5-arnaud.pouliquen@foss.st.com>
 <X/PB3z4tMnfvzBnx@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <44e2459d-01c1-b86c-d0ad-b48bb1fe99e0@foss.st.com>
Date:   Tue, 5 Jan 2021 19:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/PB3z4tMnfvzBnx@builder.lan>
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



On 1/5/21 2:33 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
>> Implement the ioctl function that parses the list of
>> rpmsg drivers registered to create an associated device.
>> To be ISO user API, in a first step, the driver_override
>> is only allowed for the RPMsg raw service, supported by the
>> rpmsg_char driver.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/rpmsg_ctrl.c | 43 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
>> index 065e2e304019..8381b5b2b794 100644
>> --- a/drivers/rpmsg/rpmsg_ctrl.c
>> +++ b/drivers/rpmsg/rpmsg_ctrl.c
>> @@ -56,12 +56,51 @@ static int rpmsg_ctrl_dev_open(struct inode *inode, struct file *filp)
>>  	return 0;
>>  }
>>  
>> +static const char *rpmsg_ctrl_get_drv_name(u32 service)
>> +{
>> +	struct rpmsg_ctl_info *drv_info;
>> +
>> +	list_for_each_entry(drv_info, &rpmsg_drv_list, node) {
>> +		if (drv_info->ctrl->service == service)
>> +			return drv_info->ctrl->drv_name;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>>  static long rpmsg_ctrl_dev_ioctl(struct file *fp, unsigned int cmd,
>>  				 unsigned long arg)
>>  {
>>  	struct rpmsg_ctrl_dev *ctrldev = fp->private_data;
>> -
>> -	dev_info(&ctrldev->dev, "Control not yet implemented\n");
>> +	void __user *argp = (void __user *)arg;
>> +	struct rpmsg_channel_info chinfo;
>> +	struct rpmsg_endpoint_info eptinfo;
>> +	struct rpmsg_device *newch;
>> +
>> +	if (cmd != RPMSG_CREATE_EPT_IOCTL)
>> +		return -EINVAL;
>> +
>> +	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>> +		return -EFAULT;
>> +
>> +	/*
>> +	 * In a frst step only the rpmsg_raw service is supported.
>> +	 * The override is foorced to RPMSG_RAW_SERVICE
>> +	 */
>> +	chinfo.driver_override = rpmsg_ctrl_get_drv_name(RPMSG_RAW_SERVICE);
>> +	if (!chinfo.driver_override)
>> +		return -ENODEV;
>> +
>> +	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
>> +	chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
>> +	chinfo.src = eptinfo.src;
>> +	chinfo.dst = eptinfo.dst;
>> +
>> +	newch = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
> 
> Afaict this would create and announce and endpoint (or possibly find a
> endpoint announced by the other side of the link).

It depends on how rpdev is initialized[1].
 - For the rpmsg_char no default endpoint is created. The endpoint is created on
/dev/rpmsgX open. So the channel is created but not announced.
=> both sides have to know the the destination address for virtio implementation.

- For the rpmsg TTY the endpoint should be created by default by the RPMsg core
and associated to the rpdev. An announcement is sent to the remote side.

[1]https://elixir.bootlin.com/linux/latest/source/drivers/rpmsg/rpmsg_core.c#L445

> 
> In the case of the Qualcomm transports, and as been discussed to
> introduce for virtio in the past, the channel actually have a state. So
> opening/announcing it here means that we have no way to close and reopen
> this channel later?

In this first series I just focused to de-correlate the control part from the
rpmsg char. A main difference is that a channel is associated to a cdev.

But the ioctrl can be extended to close the cdev and the associated channel
(implemented in my V1).
else the rpmsg device is automatically remove by the rpmsg bus.
> 
> 
> It would also mean that we announce to the firmware that there's an
> application in Linux now ready to receive data on this channel - but
> that won't be the case until someone actually open the created cdev (or
> tty in your case) - which quite likely will result in data loss.

With the virtio implementation it is potentially already the case. When Linux
receive an NS announcement, there is no mechanism to inform the remote firmware
that Linux is ready to receive data. Some OpenAMP lib user already point out
this issue.
In glink driver seems that there is no such issue as
qcom_glink_send_open/close_req allow to provide information on endpoint state.

I would propose to address this in a next step.

> 
> I think instead of piggybacking on the rpmsg_device we should just carry
> these "raw exports to userspace" in some other construct - perhaps a
> auxiliary_bus, 

I'm not familiar with auxilary-bus but seems very similar to the rpmsg_bus...
I wonder if this could lead to code duplication in RPMsg service drivers to
support the control but also the NS announcement.

or if we still only care for char and tty, not split them
> up at all using the device model.

The initial requirement was to extend the control interface implemented in
rpmsg_char to other services before introducing new one.

So probably as a first step we have to clarify the requirements to determine the
solution to implement.

Here is my point of view on the induced requirements:
- Allow to create a service from Linux user application:
	- with a specific name
	- with or without name service announcement.
- Allow to probe the same service by receiving either a NS announcement from the
remote firmware or a Linux user application request.
- Use these services independently of the RPMsg transport implementation (e.g be
able to use RPMSg char with the RPMsg virtio bus).

This requirements explain my approach: associate a service to a RPMsg device in
order to be able to probe using the same driver either by the remote firmware NS
announcement or by a Linux user application.

Is the requirements I detailed match with what you had in mind?

Please, could you detail your views on the use of the auxilary bus in this context?

We can also think about an alternative to keep rpmsg_char unchanged for legacy
support.
 - only create a RPMsg ctrl for new RPMsg services
 - enable it for virtio_rpmsg_bus (In this case the rpmsg char cannot be probed
by remote firmware, but allows communication between fixed addresses)

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> +	if (!newch) {
>> +		dev_err(&ctrldev->dev, "rpmsg_create_channel failed\n");
>> +		return -ENXIO;
>> +	}
>>  
>>  	return 0;
>>  };
>> -- 
>> 2.17.1
>>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D414332CF87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 10:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbhCDJVe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 04:21:34 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:43945 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234366AbhCDJVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 04:21:22 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 124989gp016795;
        Thu, 4 Mar 2021 10:20:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ufFBj8FYALThKulsvG/aJJ0kKl5QfreUhFfw/k3Nj/0=;
 b=qAfWVJE8aQjvEo5S6/3Gz195dgge2AG3ks4nQBYL98Z8un7Y3CXcn6Gy7+rkf/Eqepls
 zilDWhydHtw8kAbVPxxjfwvANVyjNtT7vkCdebEM0q4bkAVgQdkXeJH1rLF9HMU+FKo1
 71+sE85oqMTcc0qUmb7PELPkONK6kWmEyBo+m4AtgNvo56e5O5vNx+f77ZQ2wXQxeJhi
 1HwnxxOTiH8L7ata/YjLAqYhxE63ASX9YzJBZ52vSGq2sNHIpXGFHa9yHRcnlcgz0w9n
 npCcLzj/xWNogSnuS4t6e5ElH4kf3EmMMwsHQFHSTcVcRS7d0EwC0ZtYP3uYzqtolwJ1 cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36yfc46age-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Mar 2021 10:20:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83C4410002A;
        Thu,  4 Mar 2021 10:20:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AF5C231675;
        Thu,  4 Mar 2021 10:20:35 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar
 2021 10:20:34 +0100
Subject: Re: [PATCH v5 11/16] rpmsg: virtio: register the rpmsg_ctrl device
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-12-arnaud.pouliquen@foss.st.com>
 <20210303184345.GD3817330@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <4325c9ef-86fe-d124-0144-1c010782c73d@foss.st.com>
Date:   Thu, 4 Mar 2021 10:20:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210303184345.GD3817330@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-04_03:2021-03-03,2021-03-04 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/3/21 7:43 PM, Mathieu Poirier wrote:
> On Fri, Feb 19, 2021 at 12:14:56PM +0100, Arnaud Pouliquen wrote:
>> Instantiate the rpmsg_ioctl device on virtio RPMsg bus creation.
> 
> s/rpmsg_ioctl/rpmsg_ctrl
> 
> Now I understand what you meant in patch 05.
> 
>> This provides the possibility to expose the RPMSG_CREATE_EPT_IOCTL
>> to create RPMsg chdev endpoints.
> 
> You mean RPMSG device endpoints, i.e rpmsg_eptdev?  If so I think it should be
> added to the changelog.  Otherwiser someone could be tempted to look for "chdev"
> and find anything but a rpmsg_eptdev.

In fact it is RPMsg char device endpoints, I will add more explicit details in
the changelog.

> 
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>
>> ---
>> V5:
>> Fix compilation issue
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 57 +++++++++++++++++++++++++++++---
>>  1 file changed, 52 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index e87d4cf926eb..2e6b34084012 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -813,14 +813,52 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
>>  	wake_up_interruptible(&vrp->sendq);
>>  }
>>  
>> +static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev)
>> +{
>> +	struct virtproc_info *vrp = vdev->priv;
>> +	struct virtio_rpmsg_channel *vch;
>> +	struct rpmsg_device *rpdev_ctrl;
>> +	int err = 0;
>> +
>> +	vch = kzalloc(sizeof(*vch), GFP_KERNEL);
>> +	if (!vch)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	/* Link the channel to the vrp */
>> +	vch->vrp = vrp;
>> +
>> +	/* Assign public information to the rpmsg_device */
>> +	rpdev_ctrl = &vch->rpdev;
>> +	rpdev_ctrl->ops = &virtio_rpmsg_ops;
>> +
>> +	rpdev_ctrl->dev.parent = &vrp->vdev->dev;
>> +	rpdev_ctrl->dev.release = virtio_rpmsg_release_device;
>> +	rpdev_ctrl->little_endian = virtio_is_little_endian(vrp->vdev);
>> +
>> +	err = rpmsg_ctrl_register_device(rpdev_ctrl);
>> +	if (err) {
>> +		kfree(vch);
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return rpdev_ctrl;
>> +}
>> +
>> +static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
>> +{
>> +	if (!rpdev_ctrl)
>> +		return;
>> +	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
>> +}
>> +
>>  static int rpmsg_probe(struct virtio_device *vdev)
>>  {
>>  	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
>>  	static const char * const names[] = { "input", "output" };
>>  	struct virtqueue *vqs[2];
>>  	struct virtproc_info *vrp;
>> -	struct virtio_rpmsg_channel *vch;
>> -	struct rpmsg_device *rpdev_ns;
>> +	struct virtio_rpmsg_channel *vch = NULL;
>> +	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl;
> 
> As far as I can tell @rpdev_ns doesn't have to be initialized.

You are right,no more needed in V5 with the error cases restructuring.

Thanks,
Arnaud

> 
>>  	void *bufs_va;
>>  	int err = 0, i;
>>  	size_t total_buf_space;
>> @@ -894,12 +932,18 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>  
>>  	vdev->priv = vrp;
>>  
>> +	rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
>> +	if (IS_ERR(rpdev_ctrl)) {
>> +		err = PTR_ERR(rpdev_ctrl);
>> +		goto free_coherent;
>> +	}
>> +
>>  	/* if supported by the remote processor, enable the name service */
>>  	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
>>  		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
>>  		if (!vch) {
>>  			err = -ENOMEM;
>> -			goto free_coherent;
>> +			goto free_ctrldev;
>>  		}
>>  
>>  		/* Link the channel to our vrp */
>> @@ -915,7 +959,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>  
>>  		err = rpmsg_ns_register_device(rpdev_ns);
>>  		if (err)
>> -			goto free_coherent;
>> +			goto free_vch;
>>  	}
>>  
>>  	/*
>> @@ -939,8 +983,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>  
>>  	return 0;
>>  
>> -free_coherent:
>> +free_vch:
>>  	kfree(vch);
>> +free_ctrldev:
>> +	rpmsg_virtio_del_ctrl_dev(rpdev_ctrl);
>> +free_coherent:
>>  	dma_free_coherent(vdev->dev.parent, total_buf_space,
>>  			  bufs_va, vrp->bufs_dma);
>>  vqs_del:
>> -- 
>> 2.17.1
>>

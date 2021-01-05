Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2FEA2EB16A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 18:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbhAERam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 12:30:42 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:48210 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729852AbhAERam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 12:30:42 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 105HR6Wa003376;
        Tue, 5 Jan 2021 18:29:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XxJ4tcrOqw2tQ6cGm87BWxIq75W6xiExwShxwxetxdE=;
 b=l7qDSHTQ3v7OKRHoviw5REILRzMDfCUf0IhDdYzXDNA8jTNuJSSP9kw5SCsIgfnedsoD
 nAl1RI5zTVl7VGfXjq/lLuJSACiU5Mf1HfZkNc7NOryCMswLnIM9i13NMqwz1pN5ujaX
 whLh+E5bcsZkjjl6F7K3uXo0g0cS/UdDV4Pa+oAEJBJuuE5Z5Qc3Gqghd1CAP7beLK6d
 F81CGJNXpeHz8hlVTRg8pmYpQE5rHwFN3TEWEs12cOIhzFRDPES2Pgr/buc1HV6hU/kZ
 Q6QNXE/0XcpnHeMO98XNf7gAiBGqZy+N6IkAtTPbMwyigJDyLVPlD8yI39SIDDjRXW6Q 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35th25p1dx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Jan 2021 18:29:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5B77100034;
        Tue,  5 Jan 2021 18:29:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9146525D03F;
        Tue,  5 Jan 2021 18:29:54 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan
 2021 18:29:53 +0100
Subject: Re: [PATCH v2 14/16] rpmsg: glink: add create and release rpmsg
 channel ops
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-15-arnaud.pouliquen@foss.st.com>
 <X/O8EdzYBPXRel8d@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b9edcad2-100d-c62f-6821-58628061d4d4@foss.st.com>
Date:   Tue, 5 Jan 2021 18:29:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/O8EdzYBPXRel8d@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-05_05:2021-01-05,2021-01-05 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/5/21 2:08 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:
> 
>> Add the new ops introduced by the rpmsg_ns series and used
>> by the rpmsg_ctrl driver to instantiate a new rpmsg channel.
>>
> 
> This is nice for completeness sake, but I don't think it makes sense for
> transports that has the nameserver "builtin" to the transport itself.
> 
> I.e. if we have the NS sitting on top of GLINK and the remote firmware
> sends a "create channel" message, then this code would cause Linux to
> send a in-transport "create channel" message back to the remote side in
> hope that it would be willing to talk on that channel - but that would
> imply that the remote side needs to have registered a rpmsg device
> related to that service name - in which case it already sent a
> in-transport "create channel" message.

That was one of my main concerns about this series. I'm not familiar enough with
these drivers to make sure my proposal was 100% compatible...
How is the mapping between between the local and remote endpoints when the DST
address is not specified by the Linux application?

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/qcom_glink_native.c | 94 ++++++++++++++++++++++++-------
>>  1 file changed, 75 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
>> index 27a05167c18c..d74c338de077 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -205,6 +205,9 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops;
>>  #define GLINK_FEATURE_INTENTLESS	BIT(1)
>>  
>>  static void qcom_glink_rx_done_work(struct work_struct *work);
>> +static struct rpmsg_device *
>> +qcom_glink_create_rpdev(struct qcom_glink *glink,
>> +			struct rpmsg_channel_info *chinfo);
>>  
>>  static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
>>  						      const char *name)
>> @@ -1203,6 +1206,37 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
>>  	return 0;
>>  }
>>  
>> +static struct rpmsg_device *
>> +qcom_glink_create_channel(struct rpmsg_device *rp_parent,
>> +			  struct rpmsg_channel_info *chinfo)
>> +{
>> +	struct glink_channel *channel = to_glink_channel(rp_parent->ept);
>> +	struct qcom_glink *glink = channel->glink;
>> +	struct rpmsg_device *rpdev;
>> +	const char *name = chinfo->name;
>> +
>> +	channel = qcom_glink_alloc_channel(glink, name);
>> +	if (IS_ERR(channel))
>> +		return ERR_PTR(PTR_ERR(channel));
>> +
>> +	rpdev = qcom_glink_create_rpdev(glink, chinfo);
>> +	if (!IS_ERR(rpdev)) {
>> +		rpdev->ept = &channel->ept;
>> +		channel->rpdev = rpdev;
>> +	}
>> +
>> +	return rpdev;
>> +}
>> +
>> +static int qcom_glink_release_channel(struct rpmsg_device *rpdev,
>> +				      struct rpmsg_channel_info *chinfo)
>> +{
>> +	struct glink_channel *channel = to_glink_channel(rpdev->ept);
>> +	struct qcom_glink *glink = channel->glink;
>> +
>> +	return rpmsg_unregister_device(glink->dev, chinfo);
>> +}
>> +
>>  static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>>  {
>>  	struct glink_channel *channel = to_glink_channel(ept);
>> @@ -1359,6 +1393,8 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
>>  static const struct rpmsg_device_ops glink_device_ops = {
>>  	.create_ept = qcom_glink_create_ept,
>>  	.announce_create = qcom_glink_announce_create,
>> +	.create_channel = qcom_glink_create_channel,
>> +	.release_channel = qcom_glink_release_channel,
>>  };
>>  
>>  static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
>> @@ -1376,13 +1412,45 @@ static void qcom_glink_rpdev_release(struct device *dev)
>>  	kfree(rpdev);
>>  }
>>  
>> +static struct rpmsg_device *
>> +qcom_glink_create_rpdev(struct qcom_glink *glink,
>> +			struct rpmsg_channel_info *chinfo)
>> +{
>> +	struct rpmsg_device *rpdev;
>> +	struct device_node *node;
>> +	int ret;
>> +
>> +	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
>> +	if (!rpdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
>> +	rpdev->src = chinfo->src;
>> +	rpdev->dst = chinfo->dst;
>> +	rpdev->ops = &glink_device_ops;
>> +
>> +	node = qcom_glink_match_channel(glink->dev->of_node, chinfo->name);
>> +	rpdev->dev.of_node = node;
>> +	rpdev->dev.parent = glink->dev;
>> +	rpdev->dev.release = qcom_glink_rpdev_release;
>> +	rpdev->driver_override = (char *)chinfo->driver_override;
>> +
>> +	ret = rpmsg_register_device(rpdev);
>> +	if (ret) {
>> +		kfree(rpdev);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return rpdev;
>> +}
>> +
>>  static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>>  			      char *name)
>>  {
>>  	struct glink_channel *channel;
>>  	struct rpmsg_device *rpdev;
>>  	bool create_device = false;
>> -	struct device_node *node;
>> +	struct rpmsg_channel_info chinfo;
>>  	int lcid;
>>  	int ret;
>>  	unsigned long flags;
>> @@ -1416,27 +1484,15 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>>  	complete_all(&channel->open_req);
>>  
>>  	if (create_device) {
>> -		rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
>> -		if (!rpdev) {
>> -			ret = -ENOMEM;
>> +		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
>> +		chinfo.src = RPMSG_ADDR_ANY;
>> +		chinfo.dst = RPMSG_ADDR_ANY;
>> +		rpdev = qcom_glink_create_rpdev(glink, &chinfo);
>> +		if (IS_ERR(rpdev)) {
>> +			ret = PTR_ERR(rpdev);
>>  			goto rcid_remove;
>>  		}
>> -
>>  		rpdev->ept = &channel->ept;
>> -		strncpy(rpdev->id.name, name, RPMSG_NAME_SIZE);
>> -		rpdev->src = RPMSG_ADDR_ANY;
>> -		rpdev->dst = RPMSG_ADDR_ANY;
>> -		rpdev->ops = &glink_device_ops;
>> -
>> -		node = qcom_glink_match_channel(glink->dev->of_node, name);
>> -		rpdev->dev.of_node = node;
>> -		rpdev->dev.parent = glink->dev;
>> -		rpdev->dev.release = qcom_glink_rpdev_release;
>> -
>> -		ret = rpmsg_register_device(rpdev);
>> -		if (ret)
>> -			goto rcid_remove;
>> -
>>  		channel->rpdev = rpdev;
>>  	}
>>  
>> -- 
>> 2.17.1
>>

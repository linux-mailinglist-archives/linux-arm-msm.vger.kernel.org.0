Return-Path: <linux-arm-msm+bounces-21679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A633C8FBE8A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 00:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ED27283F01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 22:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04442143754;
	Tue,  4 Jun 2024 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YaHYyOuq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B081143744;
	Tue,  4 Jun 2024 22:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717539173; cv=none; b=YpbHscg05TW7iSGuCrw98XIqOyMWldhPCdbusE3uNyZvpCmvJDveJFpOFSOT+FSh21HBhtPgXdQKRI2RTbqJEqkAvmOx2OjYyV8YG/zhlK9LgdDISk/r0/Kgdre9xj2ppaBnSVp/SwvfzrqFDtmegRMf0M2+u0QxyYVxqDUPpKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717539173; c=relaxed/simple;
	bh=0CGf52J6wqg2rHnHzyeVZToNAn6a/5leV2ds3euk2eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ws2FsTe/+NS7lNWoBUxPrMsT60Y6iiNqNC2AzUYnHvg7iw3+Ipcc27EVfDgJh+LS+GVHnNSjOLiuJaXcoaPWcemu/NVh9jwaVbpWw9vh5OkE7tszUA4gzVOLqtlC3gXdPndAX2+eALb0svivtPNkDESSymfjgvDQkXtsJRwTw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YaHYyOuq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454HHleZ003537;
	Tue, 4 Jun 2024 22:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7EOe9ICjeZr31Ifq5ILUU15LEV5uAZYJEGQW6l5SOo=; b=YaHYyOuq3xZAj4NL
	nClaNKJzDbMVUO/3VLHccju/AOcQGAlOhxNyxA6fo7DcQBshy4BJIBIJ5MyWmR7J
	Nwy5xeY/LcfcCwpVCwjVs4+85tL5lVCYoKBy1nja0zn6CEuBHbYHGbB5DVIAbx24
	MoVPzrPy3yo1LD1wqI/BBzw9bd4v3ExECpaN1H+jWd0iyUb5+mLV0aB3ce4iO1XR
	HzuqgvLuJnPWZ82eOY8YY/BWOicLL9LjUFYq7Xu1nDp8AjbldvoarwxH3LAEH0xw
	rqB4FAB6M0FyinDBvcOsOexx5JBgEoFJWKbeLEwpeEVAOybm/Nky+GNJzVOXipc5
	mJj/oQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj76wgjtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 22:12:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454MClSw019533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 22:12:47 GMT
Received: from [10.110.67.122] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 15:12:47 -0700
Message-ID: <abaefa57-b387-44ad-97bc-548da80f36ba@quicinc.com>
Date: Tue, 4 Jun 2024 15:12:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] rpmsg: glink: Make glink smem interrupt wakeup capable
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Deepak Kumar Singh
	<quic_deesin@quicinc.com>,
        <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_sarannya@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20240603073648.3475123-1-quic_deesin@quicinc.com>
 <8d10fbbb-471e-4960-a52a-1658df9fbc0c@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <8d10fbbb-471e-4960-a52a-1658df9fbc0c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OX-JpblHBItWdJDV8jx4GR8OpvTne9uI
X-Proofpoint-ORIG-GUID: OX-JpblHBItWdJDV8jx4GR8OpvTne9uI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040179



On 6/3/2024 2:37 AM, Caleb Connolly wrote:
> Hi Deepak,
> 
> On 03/06/2024 09:36, Deepak Kumar Singh wrote:
>> There are certain usecases which require glink interrupt to be
>> wakeup capable. For example if handset is in sleep state and
>> usb charger is plugged in, dsp wakes up and sends glink interrupt
>> to host for glink pmic channel communication. Glink is suppose to
>> wakeup host processor completely for further glink data handling.
>> IRQF_NO_SUSPEND does not gurantee complete wakeup, system may again
>> enter sleep after interrupt handling and glink data may not be
>> handled by pmic client driver.
>>
>> To ensure data handling by client configure glink smem device as
>> wakeup source and attach glink interrupt as wakeup irq. Remove
>> IRQF_NO_SUSPEND flag as it is no longer required.
> 
> I'm not sure I agree with this approach, glink is used for lots of 
> things -- like QRTR, where the sensor DSP and modem may also need to 
> wake the system up (e.g. for "wake on pickup" on mobile, or for incoming 
> calls/sms).
> 
> Configuring this to always wake up the system fully will result in a lot 
> of spurious wakeups for arbitrary modem notifications (e.g. signal 
> strength changes) if userspace hasn't properly configured these 
> (something ModemManager currently lacks support for).
> 
> IRQF_NO_SUSPEND is presumably necessary to keep the DSPs happy? iirc 
> downstream Qualcomm kernels have historically taken this approach to 
> avoid spurious wakeups.
> 

To give some more context, until recently the GLINK interrupt was 
managed and requested in the GLINK native layer. Any type of interrupt 
configuration would affect all of the links. The interrupt is now being 
requested at the transport layer (smem/rpm), so it has a little more 
fine grain control.

In downstream, we had switched to IRQF_NO_SUSPEND because there were a 
couple of cases where glink communication with rpm was needed during the 
suspend path. Having the interrupt configured as wake capable conflicted 
with the use case.

The general expectation from the DSPs is that if it is important enough 
to send, then it should be important enough to wake the APPS subsystem. 
We've always had to work around the fact we were using IRQF_NO_SUSPEND 
in downstream.

> I proposed an alternative approach some time back that would allow the 
> wakeup to be configured on a per-channel basis.
> 
> https://lore.kernel.org/linux-arm-msm/20230117142414.983946-1-caleb.connolly@linaro.org/
> > Back then Bjorn proposed using some socket specific mechanism to handle
> this for QRTR, but given this is now a common issue for multiple glink 
> channels, maybe it's something we could revisit.
> 
> Requiring the wakeup be enabled by userspace clearly doesn't make sense 
> for your proposed usecase, perhaps there's a way to configure this on a 
> per-channel basis in-kernel (maybe as the rpmsg API?).
> 

This alternative approach seems reasonable to me as well. I think the 
only drawback I see with this approach is non-data traffic may stall. 
The glink protocol traffic not tied to a TX_DATA command, such as intent 
requests, wouldn't wake the system even if the channel is configured to 
be wake capable.

Thanks,
Chris

> Thanks and regards,
>>
>> Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
>> ---
>>   drivers/rpmsg/qcom_glink_smem.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_smem.c 
>> b/drivers/rpmsg/qcom_glink_smem.c
>> index 7a982c60a8dd..f1b553efab13 100644
>> --- a/drivers/rpmsg/qcom_glink_smem.c
>> +++ b/drivers/rpmsg/qcom_glink_smem.c
>> @@ -22,6 +22,7 @@
>>   #include <linux/regmap.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/list.h>
>> +#include <linux/pm_wakeirq.h>
>>   #include <linux/rpmsg/qcom_glink.h>
>> @@ -306,8 +307,7 @@ struct qcom_glink_smem 
>> *qcom_glink_smem_register(struct device *parent,
>>       smem->irq = of_irq_get(smem->dev.of_node, 0);
>>       ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
>> -                   IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
>> -                   "glink-smem", smem);
>> +                   IRQF_NO_AUTOEN, "glink-smem", smem);
>>       if (ret) {
>>           dev_err(&smem->dev, "failed to request IRQ\n");
>>           goto err_put_dev;
>> @@ -346,6 +346,8 @@ struct qcom_glink_smem 
>> *qcom_glink_smem_register(struct device *parent,
>>       smem->glink = glink;
>> +    device_init_wakeup(dev, true);
>> +    dev_pm_set_wake_irq(dev, smem->irq);
>>       enable_irq(smem->irq);
>>       return smem;
>> @@ -365,6 +367,8 @@ void qcom_glink_smem_unregister(struct 
>> qcom_glink_smem *smem)
>>       struct qcom_glink *glink = smem->glink;
>>       disable_irq(smem->irq);
>> +    dev_pm_clear_wake_irq(&smem->dev);
>> +    device_init_wakeup(&smem->dev, false);
>>       qcom_glink_native_remove(glink);
> 


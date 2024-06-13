Return-Path: <linux-arm-msm+bounces-22571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2214906A18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E20F31C21B5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AF513E036;
	Thu, 13 Jun 2024 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PRwBQ+Z7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA5213D60A;
	Thu, 13 Jun 2024 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718274936; cv=none; b=p7dIKjrAMHOIsSxmElP6nV/Gq0lfknuUAkgARvGmSryTsKDsPtzk4WMoHYpvn8HgbetHSqaTHrNx2S5b5Cx5s4F6JdSIH7tWYxAEjOIGz2N5FQTJqev0Lqaxr9yVdpxEYNYddg3YIMDvxGdmuslSgxo09IOQDeUpzDMNpkT3/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718274936; c=relaxed/simple;
	bh=C+qf5rjgWLdEaQaJSm45myQqiK85mNlatx2p23x3Pu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nxtdDLrR0b7jSn1oJI+WkcseWioL5CdBuT8YAKPa9kdp5NqCQb+FN2fE//YqQqs7LU7EzALKEoZCVnULG0FybzX/J+ffEvAGXbTt6DegVLoIRbNzmMxSrNrDYeYLafcrpbYbya07C3fR3+kqKAmcHzY+GYxJk0boiRWoLjfg9Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PRwBQ+Z7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D8ckTZ023709;
	Thu, 13 Jun 2024 10:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XFOYjzhzVrVvkzd1b9OyHEmzOD4uZ1J77WF+qZAOHY=; b=PRwBQ+Z7R/ZUfuDX
	1PWE7jO/VnAOVWugM2C1QfZbwZ9/79JK/k/bz/RceJEh+vdUcH56UF58bJuwJOoe
	edYMeRXtswRG8F5yg1gqUFUZ52g9pHyyqyYPR+7EKmVnDiuQH7Q57FOqxfpYbi0u
	kNp/qY7RT+BVTgniKbBH18gQbPg6w7hLCBBYGghB4t0QWtZhRNlkaNgVqazqtMSZ
	ABOndztMhiaoWRoJMw46egmuBwdovPPZ7qMzMr9/EPBs8C8dgMoxLZux1Mex2Rnx
	Mu7Ms7W2XNFV/8Org5J/ZpgaTB2A5cpU8rpSiEzV0sGUW75Au5kZP6SHO9Lq3Eps
	XNFv4Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqcxtjr3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 10:35:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DAZUUv003871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 10:35:30 GMT
Received: from [10.217.239.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 03:35:27 -0700
Message-ID: <275417c5-223a-436b-8405-ba3571e19ced@quicinc.com>
Date: Thu, 13 Jun 2024 16:05:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] rpmsg: glink: Make glink smem interrupt wakeup capable
To: Caleb Connolly <caleb.connolly@linaro.org>, <quic_bjorande@quicinc.com>,
        <andersson@kernel.org>, <quic_clew@quicinc.com>,
        <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_sarannya@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20240603073648.3475123-1-quic_deesin@quicinc.com>
 <8d10fbbb-471e-4960-a52a-1658df9fbc0c@linaro.org>
Content-Language: en-US
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
In-Reply-To: <8d10fbbb-471e-4960-a52a-1658df9fbc0c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RY5pgN22D8oJsnP-hz6NAxSB9YZ415N8
X-Proofpoint-GUID: RY5pgN22D8oJsnP-hz6NAxSB9YZ415N8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_02,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130076



On 6/3/2024 3:07 PM, Caleb Connolly wrote:
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

In internal testing at least we don't see such issues, may be downstream 
modem manager is configuring things properly. Also with devices having 
proper auto suspend feature this change may not be affecting power 
numbers significantly.

Additionally my understanding is by definition glink interrupt should be 
wakeup capable. May be Bjorn can comment more on this.

Thanks,
Deepak
> 
> IRQF_NO_SUSPEND is presumably necessary to keep the DSPs happy? iirc 
> downstream Qualcomm kernels have historically taken this approach to 
> avoid spurious wakeups.
> 
> I proposed an alternative approach some time back that would allow the 
> wakeup to be configured on a per-channel basis.
> 
> https://lore.kernel.org/linux-arm-msm/20230117142414.983946-1-caleb.connolly@linaro.org/
> 
> Back then Bjorn proposed using some socket specific mechanism to handle 
> this for QRTR, but given this is now a common issue for multiple glink 
> channels, maybe it's something we could revisit.
> 
> Requiring the wakeup be enabled by userspace clearly doesn't make sense 
> for your proposed usecase, perhaps there's a way to configure this on a 
> per-channel basis in-kernel (maybe as the rpmsg API?).
> 
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


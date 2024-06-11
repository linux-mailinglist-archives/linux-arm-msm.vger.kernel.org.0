Return-Path: <linux-arm-msm+bounces-22331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249A9042D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 19:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4F74B232DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 17:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A4C482ED;
	Tue, 11 Jun 2024 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZXA7uw1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F1054F8C;
	Tue, 11 Jun 2024 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128389; cv=none; b=W2qg9/Z2hqyHfX45okUXZ1axSYeI5F0WQfUl4Oh2Jbp9EkToaFe/gO5khH+8+5dvlQh1TJikpSB9FUvjmn+n+m7EyKL6bz29r6FBDRLs9mMlBnjGKlTKkfiS3qNEK8niVg+3YzjT4lz6aBqZOK8wkz8EFH5DIOCKJZ9m+7JIBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128389; c=relaxed/simple;
	bh=A3MItnpx3sdQ1F4LuKmFkV+1dL1cv2FwLCG1C8QeaB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GLqWk009KQxGB9YUiOxhItUt8t9lILzVIa2bbZGkhEFJHL8KYRe3KfdfqCdKdk9x93PmOfPwYPgaTx3oqtKV7kRI6vFQBVj9NJqJ8+mUBSlJ49tZnvkDfdm+5FWAORSsHF6LhPccWgKH7YlTm/WSfIcLSQZt12teTmbPb3P6e/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZXA7uw1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9bSqO012356;
	Tue, 11 Jun 2024 17:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vw11Un4tGorD5Fs4RPiskAvmnBAJQlwh7D3YdXpCMXM=; b=ZXA7uw1chZE+9Tbd
	b9oa77k68VjIINOpUJ8QmyPQ7en+MOmMqRgUUaZz4nQElX9TDAvG3nI3EM/mPVJV
	GAV/duRD73EkUi0oWrhyD+rgXy/dUC9UuWamwExsr5TH4rmbHDEa+wpzeJDaO/P4
	3FLYOi/JhlS+oLMzjzvdZG3yVRS+FJSvsQxRLBerTmRFyBIZfs9xkp7STumJ9PRi
	EI4BHtoQqCn0QShcpZQfMEcPjUhA/L8lYI/U9ta8IPpaW2Sxec0tk0+zVSKFnRLw
	3KY2cnVuPTD2WcBHNeIrKh0YhCab79jGkleAZ2x0dgMb5jGQzyZaH9WXDhCoH5md
	BjbmtA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm45991a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 17:53:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BHr2dl002513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 17:53:02 GMT
Received: from [10.71.115.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 10:53:01 -0700
Message-ID: <85187e9d-4806-4871-9a06-ab860ddd726e@quicinc.com>
Date: Tue, 11 Jun 2024 10:53:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] soc: qcom: smp2p: Add remote name into smp2p irq
 devname
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
        Sudeepgoud Patil
	<quic_sudeepgo@quicinc.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-kernel@vger.kernel.org>, <quic_deesin@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
References: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
 <20240611123351.3813190-2-quic_sudeepgo@quicinc.com>
 <Zmh2CzGpJrmzs+6K@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <Zmh2CzGpJrmzs+6K@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PLs33kDuacwS5RC5aIDI-PKZQPQN-4_N
X-Proofpoint-ORIG-GUID: PLs33kDuacwS5RC5aIDI-PKZQPQN-4_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110123



On 6/11/2024 9:06 AM, Bjorn Andersson wrote:
> On Tue, Jun 11, 2024 at 06:03:50PM +0530, Sudeepgoud Patil wrote:
>> Add smp2p irq devname which fetches remote name from respective
>> smp2p dtsi node, which makes the wakeup source distinguishable
>> in irq wakeup prints.
>>
>> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
>> ---
>>   drivers/soc/qcom/smp2p.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> index a21241cbeec7..a77fee048b38 100644
>> --- a/drivers/soc/qcom/smp2p.c
>> +++ b/drivers/soc/qcom/smp2p.c
>> @@ -122,6 +122,7 @@ struct smp2p_entry {
>>    * @ssr_ack_enabled: SMP2P_FEATURE_SSR_ACK feature is supported and was enabled
>>    * @ssr_ack: current cached state of the local ack bit
>>    * @negotiation_done: whether negotiating finished
>> + * @irq_devname: poniter to the smp2p irq devname
>>    * @local_pid:	processor id of the inbound edge
>>    * @remote_pid:	processor id of the outbound edge
>>    * @ipc_regmap:	regmap for the outbound ipc
>> @@ -146,6 +147,7 @@ struct qcom_smp2p {
>>   	bool ssr_ack;
>>   	bool negotiation_done;
>>   
>> +	char *irq_devname;
>>   	unsigned local_pid;
>>   	unsigned remote_pid;
>>   
>> @@ -614,10 +616,16 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>>   	/* Kick the outgoing edge after allocating entries */
>>   	qcom_smp2p_kick(smp2p);
>>   
>> +	smp2p->irq_devname = kasprintf(GFP_KERNEL, "%s", pdev->dev.of_node->name);
> 
> That's a lot of extra instructions for copying a string, which doesn't
> need to be copied because of_node->name is const char and the argument
> to devm_request_threaded_irq() is const char.
> 
> So, kstrdup_const() is what you're looking for.
> 
> You can then go devm_kstrdup_const() and avoid the kfree() (then
> kfree_const()) below.
> 
> 
> That said, looking at /proc/interrupts, I think it would make sense to
> make this devm_kasprintf(..., "smp2p-%s", name);
> 

Is it ok to rely on the "of_node->name"? I think device tree tends to 
always have the node name as "smp2p-%s" already, so ("smp2p-%s", name) 
would result in "smp2p-smp2p-adsp".

Also Sudeepgoud, I think this will update the irqname in 
/proc/interrupts for the ipcc irqchip entry. It would also be helpful if 
we could differentiate the instances of smp2p irqchips as well. That way 
we can see what processors the 'ready' and 'fatal' interrupts apply to 
in /proc/interrupts.

Can you refer to my internal patch that adds .irq_print_chip() and 
incorporate those changes here?

> Regards,
> Bjorn
> 
>> +	if (!smp2p->irq_devname) {
>> +		ret = -ENOMEM;
>> +		goto unwind_interfaces;
>> +	}
>> +
>>   	ret = devm_request_threaded_irq(&pdev->dev, irq,
>>   					NULL, qcom_smp2p_intr,
>>   					IRQF_ONESHOT,
>> -					"smp2p", (void *)smp2p);
>> +					smp2p->irq_devname, (void *)smp2p);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "failed to request interrupt\n");
>>   		goto unwind_interfaces;
>> @@ -650,6 +658,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>>   	list_for_each_entry(entry, &smp2p->outbound, node)
>>   		qcom_smem_state_unregister(entry->state);
>>   
>> +	kfree(smp2p->irq_devname);
>> +
>>   	smp2p->out->valid_entries = 0;
>>   
>>   release_mbox:
>> @@ -677,6 +687,8 @@ static void qcom_smp2p_remove(struct platform_device *pdev)
>>   
>>   	mbox_free_channel(smp2p->mbox_chan);
>>   
>> +	kfree(smp2p->irq_devname);
>> +
>>   	smp2p->out->valid_entries = 0;
>>   }
>>   
>> -- 
>>


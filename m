Return-Path: <linux-arm-msm+bounces-37285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAD49C0F7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 20:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46B731F21CA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 19:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2E0217F32;
	Thu,  7 Nov 2024 19:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I0i3ZjBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B76E185B56;
	Thu,  7 Nov 2024 19:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731009576; cv=none; b=WVNx48IIT014VPXASGvyG/8wrHyilsTX0URRMdVVMB2JOQHhaISe8zvdnvoZp1rrYa0eOlp8nvRxjzEno2ymMsdiNeXVgoxcfMl4Cgk8OO+ulpjRuxtMAuEncdMy1aOoY+I2jmRH0Nx4jTtuMRVPyF9+WTFhcSUxpsz28zf6FSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731009576; c=relaxed/simple;
	bh=rijvYVmFp7ynL2m4/4rsZld4yyWRMNxMrbcGtzDTqgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dByNdBrFDyn+lCFEo27Bbz5NSfASq0CrS8FjrOpEMfERwRcZ6fnxqb4IocZSUgIWppILNswFSTgQIu4Drl9rBN2N3HbDAg8ZVcfcJ/UvS1moM7uBsT8mnakPVR1ZE2CsvMoLVbUny20rWI93n0SujUWx9cdQMRYgHnmLOpHKkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I0i3ZjBA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7HLZ1E002419;
	Thu, 7 Nov 2024 19:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3QZKuqF/aG6/NjKxZLSKoy5isRvzlW/MuReXxPZweKY=; b=I0i3ZjBAW38wBua+
	PxKmEfSvnqcSt7Xc8+cc2VXXirbftuMMNV+QNYWZezzm6IJi8LOPnrrlr/33qnhH
	Cd+rm+7JqzIPKvckDtr+SyfBnfyof2r4flxB5pSbEd6uP1xlgCx5xgntAd/CFJOk
	0Hr0pniozWvczjdvZbmZBwz6QcICYg68W5LfRAIlrcKXwkbvG9DljPXL2blkwElX
	EBc3twYma/z5oz7KqPkF90WQogpeVTP0RMLt70SJPQ2fKJLms2Jvocku8CH3EoI/
	gjDJu0Y0zPbCTETFQJ+NzyzxPxVKzH8HB062giw5dOMmg8mqlpA/QgnHzoD25iWv
	wRUA7Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r07hp0e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 19:58:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7JwwJR020827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 19:58:58 GMT
Received: from [10.110.42.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 11:58:57 -0800
Message-ID: <51fbe076-fb80-4162-ab76-e2f8b31696ae@quicinc.com>
Date: Thu, 7 Nov 2024 11:58:56 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Hemant Kumar
	<quic_hemantk@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        "Maxim
 Kochetkov" <fido_max@inbox.ru>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bhaumik Bhatt <bbhatt@codeaurora.org>,
        "Johan
 Hovold" <johan@kernel.org>
References: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
 <20241107112734.v2ik6ipnebetjene@thinkpad>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241107112734.v2ik6ipnebetjene@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5iAnTAfCUqr8tjwAZlwDrPoggZfeUV_2
X-Proofpoint-ORIG-GUID: 5iAnTAfCUqr8tjwAZlwDrPoggZfeUV_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070157



On 11/7/2024 3:27 AM, Manivannan Sadhasivam wrote:
> On Mon, Nov 04, 2024 at 05:29:37PM -0800, Chris Lew wrote:
>> From: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>
>> The call to qrtr_endpoint_register() was moved before
>> mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
>> callback can occur before the qrtr endpoint is registered.
>>
>> Now the reverse can happen where qrtr will try to send a packet
>> before the channels are prepared. Add a wait in the sending path to
>> ensure the channels are prepared before trying to do a ul transfer.
>>
>> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
>> Reported-by: Johan Hovold <johan@kernel.org>
>> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> 
> I think we need to have the check in 'mhi_queue()' instead of waiting for the
> channels in client drivers. Would it be a problem if qrtr returns -EAGAIN from
> qcom_mhi_qrtr_send() instead of waiting for the channel?
> 

The packet would get dropped which usually ends up causing some 
functional problem down the line.

I can add retry handling for EAGAIN in qcom_mhi_qrtr_send().

Downstream we had also seen some issue where we received EAGAIN because 
the ring buffer was full. I think we saw issues doing a dumb retry so we 
triggered the retry on getting a ul_callback().

We would need to differentiate between this kind of EAGAIN from a 
ringbuf full EAGAIN.

> - Mani
> 
>> ---
>>   net/qrtr/mhi.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>> index 69f53625a049..5b7268868bbd 100644
>> --- a/net/qrtr/mhi.c
>> +++ b/net/qrtr/mhi.c
>> @@ -15,6 +15,7 @@ struct qrtr_mhi_dev {
>>   	struct qrtr_endpoint ep;
>>   	struct mhi_device *mhi_dev;
>>   	struct device *dev;
>> +	struct completion prepared;
>>   };
>>   
>>   /* From MHI to QRTR */
>> @@ -53,6 +54,10 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
>>   	if (skb->sk)
>>   		sock_hold(skb->sk);
>>   
>> +	rc = wait_for_completion_interruptible(&qdev->prepared);
>> +	if (rc)
>> +		goto free_skb;
>> +
>>   	rc = skb_linearize(skb);
>>   	if (rc)
>>   		goto free_skb;
>> @@ -85,6 +90,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>>   	qdev->mhi_dev = mhi_dev;
>>   	qdev->dev = &mhi_dev->dev;
>>   	qdev->ep.xmit = qcom_mhi_qrtr_send;
>> +	init_completion(&qdev->prepared);
>>   
>>   	dev_set_drvdata(&mhi_dev->dev, qdev);
>>   	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
>> @@ -97,6 +103,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>>   		qrtr_endpoint_unregister(&qdev->ep);
>>   		return rc;
>>   	}
>> +	complete_all(&qdev->prepared);
>>   
>>   	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
>>   
>>
>> ---
>> base-commit: 1ffec08567f426a1c593e038cadc61bdc38cb467
>> change-id: 20241104-qrtr_mhi-dfec353030af
>>
>> Best regards,
>> -- 
>> Chris Lew <quic_clew@quicinc.com>
>>
> 


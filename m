Return-Path: <linux-arm-msm+bounces-39135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558409D8C97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 20:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EDB9B254B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 19:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE93185B6B;
	Mon, 25 Nov 2024 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="agnqXj8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2140C03;
	Mon, 25 Nov 2024 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732561548; cv=none; b=gNYXEo1DHS5DYj60mabgbaZlb3c1s4s9KWK/DzVjS2ykOHbluRNXullUU4503UeVdfr8YFg3acDkVDJOoNv+Inn2TyUW8bMwQKyQLIX690gMW99bZNqUYvq2S8PXf9TwLVkql5dRKPfYRni5QdDcsi7fbwTQzoKaqwNjHfduJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732561548; c=relaxed/simple;
	bh=1QotW/D5kZ6RmMyScVquWXbHGf7CejY2ly9OXOESfYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M+NFIYNYGqbW7xCvHAmhcdD1u2GKMnHrdIly4FnJrF20w/C2NSBF9ozhmckPuhVRSTqEHZjBudHbxlnK2hk+ML1axJwYfjUl+6btT2Z9PRYHdvdtsIBsZ3o62PACK/eaSyilxn4A1LWRRSlLBtGRVm1HV7lsy+4hmb0izX9tZ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=agnqXj8/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APBI4lO006014;
	Mon, 25 Nov 2024 19:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/Y4PPIbRV/797ioNzyA/Ue8IasVTf7fgTftYMfyKMk=; b=agnqXj8/JsmXTyWM
	b+IKMD1rL8DF7F4OMd+DgCeeAX7S4W+Ccfb3668U8yNRUnOyG4Pqw718NnzOrA8k
	+NwlASu+WhE1Ax6sbtDkklcTekEXahRuUaz0i/5Ua+9zyXHWRsZMJup2i/d+/UDz
	KVclM+irW5Ew6/W3RoNHmVwvrPChMKy+Iyq4aDAVNSPdcetdv0lfH5icY/d0QYRT
	PO+Jask7TzPaCojn8tYGxPMBXRG9w/iAvi+YY3O0r1Enpcg7ak/tgXqmE61Glp8n
	0zi+O+um5PrLdxElg/ymVcSLRzcrIMvBwRNCuRInsdHxyZ7p1JYyClB224Ka72lw
	wsWyVg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336cfnuqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 19:05:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APJ577n017585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 19:05:07 GMT
Received: from [10.110.76.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 11:05:07 -0800
Message-ID: <c6567708-00d3-4d06-8e90-4e7b858a9030@quicinc.com>
Date: Mon, 25 Nov 2024 11:05:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Hemant Kumar
	<quic_hemantk@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        "Maxim
 Kochetkov" <fido_max@inbox.ru>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bhaumik Bhatt <bbhatt@codeaurora.org>
References: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
 <Zy3oyGLdsnDY9C0p@hovoldconsulting.com>
 <b1e22673-2768-445c-8c67-eae93206cca5@quicinc.com>
 <20241124150422.nt67aonfknfhz3sc@thinkpad>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241124150422.nt67aonfknfhz3sc@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sIeqTHs9bRc-q9GURkIZdyXRkY57ovrm
X-Proofpoint-ORIG-GUID: sIeqTHs9bRc-q9GURkIZdyXRkY57ovrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=748 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250158



On 11/24/2024 7:04 AM, Manivannan Sadhasivam wrote:
> On Thu, Nov 21, 2024 at 04:28:41PM -0800, Chris Lew wrote:
>>
>>
>> On 11/8/2024 2:32 AM, Johan Hovold wrote:
>>> On Mon, Nov 04, 2024 at 05:29:37PM -0800, Chris Lew wrote:
>>>> From: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>>>
>>>> The call to qrtr_endpoint_register() was moved before
>>>> mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
>>>> callback can occur before the qrtr endpoint is registered.
>>>>
>>>> Now the reverse can happen where qrtr will try to send a packet
>>>> before the channels are prepared. Add a wait in the sending path to
>>>> ensure the channels are prepared before trying to do a ul transfer.
>>>>
>>>> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
>>>> Reported-by: Johan Hovold <johan@kernel.org>
>>>> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
>>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>>> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
>>>
>>>> @@ -53,6 +54,10 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
>>>>    	if (skb->sk)
>>>>    		sock_hold(skb->sk);
>>>> +	rc = wait_for_completion_interruptible(&qdev->prepared);
>>>> +	if (rc)
>>>> +		goto free_skb;
>>>> +
>>>>    	rc = skb_linearize(skb);
>>>>    	if (rc)
>>>>    		goto free_skb;
>>>> @@ -85,6 +90,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>>>>    	qdev->mhi_dev = mhi_dev;
>>>>    	qdev->dev = &mhi_dev->dev;
>>>>    	qdev->ep.xmit = qcom_mhi_qrtr_send;
>>>> +	init_completion(&qdev->prepared);
>>>>    	dev_set_drvdata(&mhi_dev->dev, qdev);
>>>>    	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
>>>> @@ -97,6 +103,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>>>>    		qrtr_endpoint_unregister(&qdev->ep);
>>>>    		return rc;
>>>>    	}
>>>> +	complete_all(&qdev->prepared);
>>>>    	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
>>>
>>> While this probably works, it still looks like a bit of a hack.
>>>
>>> Why can't you restructure the code so that the channels are fully
>>> initialised before you register or enable them instead?
>>>
>>
>> Ok, I think we will have to stop using the autoqueue feature of MHI and
>> change the flow to be mhi_prepare_for_transfer() -->
>> qrtr_endpoint_register() --> mhi_queue_buf(DMA_FROM_DEVICE). This would make
>> it so ul_transfers only happen after mhi_prepare_for_transfer() and
>> dl_transfers happen after qrtr_endpoint_register().
>>
>> I'll take a stab at implementing this.
>>
> 
> Hmm, I thought 'autoqueue' was used for a specific reason. So it is not valid
> now?
> 

I think when MHI was being developed, I asked for an interface similar 
to rpmsg. The team came up with the autoqueue feature which made the 
qrtr mhi transport simpler and closer to the smd transport. I can't 
think of a specific reason that QRTR needs autoqueue, but maybe ill find 
it when I start poking at it.

> - Mani
> 


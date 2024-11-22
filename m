Return-Path: <linux-arm-msm+bounces-38730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1279D56B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 01:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF8B32832B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 00:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDA22309AE;
	Fri, 22 Nov 2024 00:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QKnYPWfn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2311853;
	Fri, 22 Nov 2024 00:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732235361; cv=none; b=hyyeFg8sKZvPV8DWPWkzPmPQKxA+3E1c0Hk//5/eypqa8QZKBxbjlkj/+Vi7qWCOqg1MS6VSNU5L7svRGuJ6/HFXOXCAm/gjJ4U/i/qYDFrw9Pm0DCkncPqzyCR3pZ/pJdGhmePoGCZ/ZQ1D+CzOUHF+n/wIXN8/261WKy7/p+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732235361; c=relaxed/simple;
	bh=uk+pH/rz2AQ9v7cxqSTdM222f4jWZAPRrTaqZZuR2d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LC31YyMXeqRqz366zLEA8JmJxpK4WAR4QdfdyAhCwZeAP0pKGNC72k3X3ouJk6/xQqzGIUltx2nNrJpxcdKI3ZwQD/NFj8cYnpXyBUGPlH0whNplDuGZSdaFI7lEFUSftd1bkhfs4Ev+2mx3gJdKHYMalndKS+l4vF8sq/EoL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QKnYPWfn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALIw43C019536;
	Fri, 22 Nov 2024 00:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W04J+mMnkofmPEjfpvH8rTRYkq6LkLstGJFNeRVvoUs=; b=QKnYPWfnIQsu04/f
	nUrB8AoWmZ2dB20jfM6BoYm+8vHk1R6jnN+kQgLfkoJMK1qljSPNLEH+gxA0o/sd
	NRIWpo11VydTUPHFgGRQpEbLMk2YLj55AZwL//XMq4lk9NmU72DSGit0FBhl18qr
	gjaOMhB4OzgxXZLqqff3jvgnX83YxjaFYNTDL1Lv+/ASdnEP551/qm9+d6TO/1Be
	88Fe2M/D4dFh8Sm691Fb0uKeFEBaJYx4G+eR7w7eqbV47a+kCYKwIwNIDc5Drp+d
	+83k1qlGtqTKGU9MHVjiDoDXuD9Xn1EIa6YaXU/TBiwNZNLXn8QXzGF/ezMgx6GB
	LtK5ng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hnrw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 00:28:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM0SgwI009655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 00:28:42 GMT
Received: from [10.71.115.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 16:28:42 -0800
Message-ID: <b1e22673-2768-445c-8c67-eae93206cca5@quicinc.com>
Date: Thu, 21 Nov 2024 16:28:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
To: Johan Hovold <johan@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman
	<horms@kernel.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        Loic Poulain
	<loic.poulain@linaro.org>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        "Manivannan
 Sadhasivam" <mani@kernel.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bhaumik Bhatt
	<bbhatt@codeaurora.org>
References: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
 <Zy3oyGLdsnDY9C0p@hovoldconsulting.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <Zy3oyGLdsnDY9C0p@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VpfRLjXQYTbh7pNEPPqQNJK-Ojdpkn3j
X-Proofpoint-GUID: VpfRLjXQYTbh7pNEPPqQNJK-Ojdpkn3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=734 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220002



On 11/8/2024 2:32 AM, Johan Hovold wrote:
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
> 
> While this probably works, it still looks like a bit of a hack.
> 
> Why can't you restructure the code so that the channels are fully
> initialised before you register or enable them instead?
> 

Ok, I think we will have to stop using the autoqueue feature of MHI and 
change the flow to be mhi_prepare_for_transfer() --> 
qrtr_endpoint_register() --> mhi_queue_buf(DMA_FROM_DEVICE). This would 
make it so ul_transfers only happen after mhi_prepare_for_transfer() and 
dl_transfers happen after qrtr_endpoint_register().

I'll take a stab at implementing this.

> Johan


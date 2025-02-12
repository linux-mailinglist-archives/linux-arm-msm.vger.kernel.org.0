Return-Path: <linux-arm-msm+bounces-47809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB14A32FAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CF27188B4F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 19:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74891FBEA5;
	Wed, 12 Feb 2025 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bruTrFcu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2EE1E7C32;
	Wed, 12 Feb 2025 19:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739388614; cv=none; b=XIV9C82ZVJMCqPPtH7y10pEI8a7ITz4ri4qcPd6fvSkjntv2jY+fKmvMANwZ6lH/Ag9kIWFU0pCanr0YSaSGxmZRUe198HppubY7JH3Z6ZMlu9a+dJZuseq+9ZVWyHIGB1yRHCWs4JSfUUOGOSJ6KBSSKOAmWMdpILZ0UIp0t+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739388614; c=relaxed/simple;
	bh=3HXpiEReneTHl7ZV/Gv++IhPpNQMfRCiX1QcVCM8U30=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UdkP2SUHqmqCUaaQPVwNNmt6ieykhxeN7OWzpBCtelzGBw42uvwnD5uLRyAWxT2Cd0uCJY9IxWf9DsbLnddqry23Rogu6skHpwKFLBr6GrVbKUgjfymHnwZgr53hQEQ5xotl2yf+xc5E4lE8aYI+70QtjbTcilSdUWx+9j/DV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bruTrFcu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CHmXuQ008940;
	Wed, 12 Feb 2025 19:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbViyHr4HUyzndKcRL6rVCmA2akW3awY7n9ZNgIvpW8=; b=bruTrFcuVh26B5BS
	GeK4MkItxtAAFHZhmEaxqGyx/7J/cdldB0Hc61SRLlhzlq9vi4GMEbPiwOoX9twx
	nQv7IFOKHFA3SSdnc8WJRI0S4RJ+SiGRGszQQzgwi14Gq7B6309wTx83SatRzbkP
	+otGKYS2padPwNVUWfjBZ7TrTQvLt+nRgo07o/5b6m/KRzOIufbPa1t+H/70O893
	IHY4xZmSV96jFqwXY9p9eOodqaWbcqh2PwRlvQV9+AuTTVEgBjnyx7Vdu3bFM0Li
	YJ+JfwWyBKyZl9C7/ocbOVuCyRLeQ4BVrI/RRRiA3VvRo6WvlHbWGBistrLDo6s9
	7QpQcw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qsq97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 19:30:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CJU4w0011168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 19:30:04 GMT
Received: from [10.216.10.30] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 11:30:00 -0800
Message-ID: <b873c744-6b38-4ea0-a5de-2cc7dd0e4501@quicinc.com>
Date: Thu, 13 Feb 2025 00:59:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
 <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
 <20250211214128.GB1215572-robh@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250211214128.GB1215572-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YpFZhfbwHAwty72EciwSvKZwnmzTcl6W
X-Proofpoint-ORIG-GUID: YpFZhfbwHAwty72EciwSvKZwnmzTcl6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120140

Thanks a lot Rob ! sorry, i was late to respond on this while waiting 
for other comments agreements.

On 2/12/2025 3:11 AM, Rob Herring wrote:
> On Mon, Feb 10, 2025 at 09:41:28PM +0530, Mukesh Kumar Savaliya wrote:
>> Thanks Krzysztof !
>>
>> On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
>>> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>>>>>> +	if (IS_ERR(gi3c->se.clk)) {
>>>>>> +		ret = PTR_ERR(gi3c->se.clk);
>>>>>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
>>>>>
>>>>> You never tested your DTS or this code... Drop
>>>>>
>>>> I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
>>>
>>>
>>> And how is it supposed to work? Are you going to send us your local
>>> internal DTSI? Is it going to pass any checks?
>> was saying about code was testing with MTP. DTS was tested using dt-bindings
>> check.
> 
> make dtbs_check is how you test.
Sure, we are running "make dt_binding_check 
DT_SCHEMA_FILES=qcom,i3c-master.yaml"
> 
>> I should add "se-clock-frequency" and "dfs-index"
> 
> No. We already have standard clock properties and we don't put indexes
> into DT.
> 
Okay, sure Rob. I shall remove both of these and set internally within 
driver as they can be set to default.
> Rob



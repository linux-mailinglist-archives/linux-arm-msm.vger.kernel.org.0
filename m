Return-Path: <linux-arm-msm+bounces-38645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7A89D4A6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 11:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9044AB214A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681491AE014;
	Thu, 21 Nov 2024 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I0ROKMk+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95995695;
	Thu, 21 Nov 2024 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732183604; cv=none; b=aKB2svU4363RZ1CzkzWmHrtUaU1VSKBONzZsIlDxLkQzgWyK0u/Z/czjPK3ZdqrZzdJVQ9eB6k5Ht4hKk+4NT8r2VgcKwLPTAW+G2Xqcu1D2wxnOVwk8TGLKmKQ7fAXPCy47s1P2zg3baGSdKE5/bu94Mz+LZrQKhU6ttnjQGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732183604; c=relaxed/simple;
	bh=7xRvPQKJiZNj/fVy05mARJFhRfsgg/u+JUF75eGx79g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GkSVwXdYmGO23jSzv+hOGFvBZfv7KareOqAZEhe/dsHPDjl7UIL2YVWiRIUorcie+LGNvLYEQC7SB/eYJSQTtL430LQIEBGR4llvIOq8T5drbMSEA8mgyaGLih4+Fs7NRAwjdDZJjum8ggkUstiaK1EA20Ql+Rg+imPvV1CNxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I0ROKMk+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKNoJAx004593;
	Thu, 21 Nov 2024 10:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I7eWYK4VpUeRAISJcRupsnAVr6kAA451IJVT2RVjCwU=; b=I0ROKMk+7u1ACLrJ
	WZGQfakpiUM8kxg8myfKG1LMURm0cF/77VUNdfB8HwIlSBLtI8KDHdP9OU8Bvuoy
	4b+ybErvLQhGnifoN5oAi04LTeQ1EPmIlFkfi7S0BUdz7Ty2jhctH6TuwhykzSfr
	zp4uNf3Hcvw0xeSqHU97Phwqk+QfCiM6tFkhejyDgrGQDoA7974DU54d06/EYP1m
	rtTUwLOIfEdvWy9rCqQ26uDAhrIbBCQ7Umr4NB2Dluzm+2aj3QQApB019I3q7MDV
	x67AqdRRcGj1gRB8gLq52iZ8gI5NHTl4w/5LvpNOxJiLRFWRLzhcGqPXF6WyyJXO
	iUErfw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea739ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 10:06:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALA6G1t016773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 10:06:16 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 02:06:09 -0800
Message-ID: <e3bbd5de-af15-4b23-b956-8c69243b4955@quicinc.com>
Date: Thu, 21 Nov 2024 18:06:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: ufs: qcom: Add UFS Host Controller
 for QCS615
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>
References: <20241119022050.2995511-1-quic_liuxin@quicinc.com>
 <20241119022050.2995511-2-quic_liuxin@quicinc.com>
 <d9c3dc82-24e5-465d-bd1c-7a7c97e17136@kernel.org>
 <eae9d141-9c88-4856-9287-2ba6ea6f4a06@kernel.org>
 <242451d6-2b77-417c-bd98-4455f739dc0d@quicinc.com>
 <26392a7f-82c6-4b7b-829e-76f3d78115d1@linaro.org>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <26392a7f-82c6-4b7b-829e-76f3d78115d1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j-5MxRfCbNe_sa-ky-Vi8gcR8UQvWs7Y
X-Proofpoint-ORIG-GUID: j-5MxRfCbNe_sa-ky-Vi8gcR8UQvWs7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=889
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210079



在 2024/11/21 18:01, Krzysztof Kozlowski 写道:
> On 21/11/2024 09:37, Xin Liu wrote:
>>
>>
>> 在 2024/11/21 15:40, Krzysztof Kozlowski 写道:
>>> On 20/11/2024 17:57, Krzysztof Kozlowski wrote:
>>>> On 19/11/2024 03:20, Xin Liu wrote:
>>>>> From: Sayali Lokhande <quic_sayalil@quicinc.com>
>>>>>
>>>>> Document the Universal Flash Storage(UFS) Host Controller on the Qualcomm
>>>>> QCS615 Platform.
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>>>>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>>>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>>> That's a bit odd SoB chain. First, these are just one-liners. Second,
>>>> who authored the patches?
>>> To be clear: SoB regarding authorship is correct, but regarding Acks and
>>> Reviews is not. Savali did not receive these tags. If so, please point
>>> to lore discussion with it.
>>>
>>> All this needs fixing.
>> Thank you for your comments. These are the two reviews I received. One
>> is your reviewd-by, and the other is Manivannan's acked-by.I have also
>> cc Sayali on the email.
>>
>> https://lore.kernel.org/linux-arm-msm/rv3ukz6rhgp3x32s74nbftmoqmdxjxmoii3zsd4wipmhudyq7q@ha4l2svl5lim/
>>
>> https://lore.kernel.org/linux-arm-msm/20241112075619.2ilsccnnk4leqmdy@thinkpad/
> 
> I meant order of tags. Who received them? You, not Sayali. Then they
> cannot be before Sayali SoB.
> 
Thank you for your comments. I will fix it next version.
> 
> Best regards,
> Krzysztof



Return-Path: <linux-arm-msm+bounces-38660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627959D4C69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 12:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF9B5B23A99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 11:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB20E1D3585;
	Thu, 21 Nov 2024 11:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z/+zDL76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209EA1CD1EE;
	Thu, 21 Nov 2024 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732190324; cv=none; b=b3ZE13mBO4JfN4+3ojnocjaeVlYaGrWXpeP2a01xMTMPCDH13biiQGdjLT2RFwhj3DFHDT6CD27jVFdGUDCdsydY9mG5Ela63Otzaq0J02st/Ed8eRtlwg7/uyMoPpnYTLGL9onaP8zxh7HYs6dy9cZl9/VPdtfl+xSnVqyuong=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732190324; c=relaxed/simple;
	bh=f75J4Z01SgbdmT+hfVnffrS67T2lmrDvQ6sXIzT0TxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GwY+/TW+aUjsR46mFXgprPd1ffII8VmGbuuHftFBjo6z+nhe2tAxBT9YrNyxj8sxbKoGOo+NbGBRdokBVVGV1fEOtfrLybqphVoh4eQuHJOU+t8b201ozla9s7CzL/o0rUUEdXEUNxZqVCYPMmrQDTtNZ+Fd+vwK6+c9I1/f6WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z/+zDL76; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL8txNq025887;
	Thu, 21 Nov 2024 11:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgsWpf6+Sd43Rc5sq6mSIoTvfA0falFXbwKIv24/NX4=; b=Z/+zDL76duqckeND
	Y0q0cBB3sXB8jS3VhGxO0nO1zmUdapuwSECImjvA85nRiUqmTc2LktH4lTuvjYEy
	P65LE7qAIR+Cbe12+FMR/iyZVHpF0yCVGu/AYHYkwrFSupD+j4rzWNFvkLVFZuA8
	Wvd79J6YA9vFfRzbTdwLR3YpHqTXi1lNVQX/1+WGd/GUl6w6lyr2i0WFV0M7eUru
	gLuv3sNse3fHdR6VkZ/9JuwsuoMWu5p1ssd9GfrrJN3aqe3gOd2pD196D1ya7DqK
	omFSA7hZfea50Z44b4vEBWOkDhsiUnzMvB+4yjiJ0F9FyFl7oK1Nb+PiW5xqVtiv
	M3hWUg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431byjm0v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 11:58:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALBwciu029380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 11:58:38 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 03:58:31 -0800
Message-ID: <b16bb82c-a14a-4bc1-997b-97e709d3a462@quicinc.com>
Date: Thu, 21 Nov 2024 19:58:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs8300-ride: Add watchdog node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>
References: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
 <20241119102315.3167607-4-quic_liuxin@quicinc.com>
 <5d670f55-1ebe-4034-a6a5-e68417c6e486@kernel.org>
 <64ec97a7-8e91-44d7-85ff-8b00304214fc@quicinc.com>
 <a1dde768-aeb8-4777-b4f9-d3c52b046fbd@kernel.org>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <a1dde768-aeb8-4777-b4f9-d3c52b046fbd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: U3Ej_iqsDzgJZoFxZUnlZFh9bI6zgAS8
X-Proofpoint-ORIG-GUID: U3Ej_iqsDzgJZoFxZUnlZFh9bI6zgAS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210094



在 2024/11/21 18:19, Krzysztof Kozlowski 写道:
> On 21/11/2024 10:44, Xin Liu wrote:
>>
>>
>> 在 2024/11/21 0:59, Krzysztof Kozlowski 写道:
>>> On 19/11/2024 11:23, Xin Liu wrote:
>>>> Add watchdog clock on the Qualcomm QCS8300 Ride platform.
>>>>
>>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>> index 7eed19a694c3..3024338bcfbc 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>> @@ -265,3 +265,7 @@ &ufs_mem_phy {
>>>>    	vdda-pll-supply = <&vreg_l5a>;
>>>>    	status = "okay";
>>>>    };
>>>> +
>>>> +&watchdog {
>>>> +    clocks = <&sleep_clk>;
>>>> +};
>>>> \ No newline at end of file
>>>
>>> Look, your patches have errors...
>>>
>> This is the information when I apply my patch.
>> ../linux-next$ git am ./wdt/test.patch
>> Applying: arm64: dts: qcom: qcs8300-ride: Add watchdog node
>> ../linux-next$
>>
>> There are no error messages here.
> 
> So I made up that above error message? You sent patch with an error
> message. I responded directly under it, so what can I say more?
> 
> You refuse to fix this, so I NAK this patch.
Sorry, that's not what I meant. I realize my mistake and I will fix this 
issue in the next version. Thank you for your comments.
> Best regards,
> Krzysztof



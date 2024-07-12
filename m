Return-Path: <linux-arm-msm+bounces-26019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4766192F80E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 11:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2296283DE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 09:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC042143C51;
	Fri, 12 Jul 2024 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SVgVS8Sk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933313D51E;
	Fri, 12 Jul 2024 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720776741; cv=none; b=mvIYC5l4JI86Jytn5HwzqAD8Fqf7GOyutF1oqJFLk7Hp8DHtB785ZO9cghN9LtmAcWNy8HPx+vrEkAotiyV+9jT3tSy7Cne8kj7KtAcNQK51qEproaY9983UICEIfTDsvIuIWzkp5UanVMAdJWoC8DzJYiBEAx+DcbcgE8Z7RUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720776741; c=relaxed/simple;
	bh=8iefBGM96ctsdDGFRvk1ahWXyNMMiTzENkPqMtJu2Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ia/4vOWEz2TJl5uMdRg+0cu9yXKATGK03Y+T4bBdWDK+UumJRENEVwsshFX4f/3GZW8jv4/8b+PWSUKh6pgwdW5nOqTU0rcApI+DQe7hU0S/etjTd0QBJpSn6kEbT6KJxd78PE6zv1Es2qmzetTpqG2OA3Ce+medDDyrr8Kq/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SVgVS8Sk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46C3VjwE018024;
	Fri, 12 Jul 2024 09:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnXnSVS56ZktY58WGte3gtVrfnzt9eLfrLksiWv/ZuM=; b=SVgVS8Skzg/nuXFF
	GSumgnfNAygUZ3cHsjoMOCcsSBz5aMt8SMMglI4mMrrFT5jqNpXU/AxEOBMljGjF
	q6pddO038tFD6yXwTiR8E+mmhVHr/jLVPx3xHd+FSm0srBGLRebBpHIOZEP+1dHK
	X+61FBPPY4Ni2vvuQf2H5KTfkdBbIMx8UXAwn2NbBTdv7dFBAkR4MsLDQ0xPJU1m
	ArMVQvaLrf3AGHTSnHYhtaI+lcUTt05xmzBtCpi3vXNMcqwk6o4M7R23cTf/K2PA
	6tKZHUFQOfeS3C2VIlx0paRJ2Ig0YB6hQE2i6hJIaDIWrJ7z7jteKGtsKlL5ocWK
	rcuhKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40a8uhugfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 09:32:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46C9W8WA011454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 09:32:08 GMT
Received: from [10.216.3.84] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 02:32:04 -0700
Message-ID: <045d7a80-378d-4622-b2e1-01665f627818@quicinc.com>
Date: Fri, 12 Jul 2024 15:02:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Add UART node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20240710094149.13299-1-quic_vdadhani@quicinc.com>
 <2e309d52-8180-4922-9a5a-022fc8bf8ef5@kernel.org>
 <f5ed3285-82da-4ba8-9b4d-a0cc7323fde4@linaro.org>
 <fa189b4c-d407-4d48-9677-528f07f81efa@quicinc.com>
 <b2c88f85-eefb-411c-bfe0-6a476b449753@kernel.org>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <b2c88f85-eefb-411c-bfe0-6a476b449753@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Us_qZCvzH_D9x-ifSAJBkoxV1wIB4bmp
X-Proofpoint-ORIG-GUID: Us_qZCvzH_D9x-ifSAJBkoxV1wIB4bmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_07,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120067



On 7/11/2024 11:47 AM, Krzysztof Kozlowski wrote:
> On 11/07/2024 07:04, Viken Dadhaniya wrote:
>>>>> +				clock-names = "se";
>>>>> +				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
>>>>> +						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
>>>>> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>>>> +						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
>>>>> +				interconnect-names = "qup-core", "qup-config";
>>>>> +				power-domains = <&rpmhpd SA8775P_CX>;
>>>>
>>>> All the clocks, interconenct and power domains look to me questionable.
>>>> AFAIK, most of it (if not all) is going to be removed.
>>>
>>> Yeah.. I'm lukewarm on accepting any sa8775p changes until that qcs9100(?)
>>> situation is squared out first
>>>
>>> Konrad
>>
>> Thanks for clarification. Please help to sign-off or let me know in case
>> of any concern.
> 
> I think I was quite explicit, so I feel above suggestion as still
> pushing your choice even though to reviewers gave you their opinion.
> 
> In such case:
> 
> No, NAK, for the reasons stated above.
> 
> Best regards,
> Krzysztof
> 

Sure, taken the notes from both of you.
Shall we wait for the shifting of DTSI file from sc8775p to qcs9100 ?
OR is there any other way to move ahead ?
Please suggest, we shall do whatever guidance from you both.



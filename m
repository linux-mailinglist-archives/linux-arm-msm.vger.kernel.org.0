Return-Path: <linux-arm-msm+bounces-37450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB179C39FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3A91C2121C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 08:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6CB154BE0;
	Mon, 11 Nov 2024 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OercpXh1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880393A8F7;
	Mon, 11 Nov 2024 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731314933; cv=none; b=b86OJUarkCAKGF8LnEQawl7NK3D9BWPQWhM/5SQsODTeGJH91ty1ICPmorVGS7AVc/H3kUy+aCGHZqraLh6WBMxDHkjVh68EkhztGaI7nJPCg6E13TUVq2y99TWo6nI7cj6OvMkX93SJixSaLxcAVxxad3MWMkZCYMSIpC8zr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731314933; c=relaxed/simple;
	bh=xQKt1lK8GwBq77cZBspA/bVJgEyRoTR8hrlSr+xVmeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A9lF0ShmwubBijCmtq5ZvVZRs+y822HTAjmSQEOMWAjdD7Ex3oQzxQ6G1AOorjB5bhalltOVBNJ0Bms25ym46sFnLu4l6z1xq8fL5aQvhEoPQYaDCmwMSQizpn8fsmoViRwSRsWGyorBG+w5DD5lrIIqfL6JlP9wX6mflhAteSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OercpXh1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AALwQNO015580;
	Mon, 11 Nov 2024 08:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUkaK4V+txW5YUCCJsunixq9avxafCIj+kEcUtZK9ac=; b=OercpXh1ciL4fEwO
	dVG4DuKhUkW8aG6/XMJ/JdPVMvPBhxjRI/qyzLa0USFjdn6o6BfmFAlQJBLETlni
	Bbq8qaISA2azbSxtXLXpg9kFR4xD6UNABsIY9Fo8PU9nhyPEwsuTXXYW1qTchP6s
	Ivk5xjVnZy8eI+q+J9jtgdYvGWhcaxyAbQEYZRNSHGWqcDU9d05xvWxFShN2ff3Z
	OwAd3WqCCrMebdsVTiNxdmf0rK6ThcXkfn5jnA7Fff2b/7ovyCu6zvRraiLDiLC8
	zR9ZDiJcyLGu3urRTcTKclmjJg/H7OHEpDg2mOinJAZ7hcHBE/zj4a659csQGiu2
	9pFrVg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxr5usb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:48:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AB8mgrL006646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:48:42 GMT
Received: from [10.216.36.177] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 00:48:39 -0800
Message-ID: <f3e49c6f-891d-4421-851a-25efa1d5b80c@quicinc.com>
Date: Mon, 11 Nov 2024 14:18:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs615: Add QUPv3 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20241011103346.22925-1-quic_vdadhani@quicinc.com>
 <15238992-4ede-4b85-9947-391baaa4c8a9@oss.qualcomm.com>
 <332f7a0a-d9df-49bd-81d5-cc04c50183b9@quicinc.com>
 <my3im4zjjozoze4s5vkwlraailrd6njbof75acn7lqt5oxzgor@eu6aq2754uqf>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <my3im4zjjozoze4s5vkwlraailrd6njbof75acn7lqt5oxzgor@eu6aq2754uqf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1bzX2aRKXUXs8H0bbYWwgP9E5q8Z-z1c
X-Proofpoint-GUID: 1bzX2aRKXUXs8H0bbYWwgP9E5q8Z-z1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411110074



On 10/28/2024 5:58 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 04:49:43PM +0530, Viken Dadhaniya wrote:
>>
>>
>> On 10/26/2024 1:10 AM, Konrad Dybcio wrote:
>>> On 11.10.2024 12:33 PM, Viken Dadhaniya wrote:
>>>> Add DT support for QUPv3 Serial Engines.
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> @@ -392,6 +427,24 @@
>>>>    			#size-cells = <1>;
>>>>    		};
>>>> +		gpi_dma0: qcom,gpi-dma@800000  {
>>>> +			compatible = "qcom,sdm845-gpi-dma";
>>>
>>> You must define a new compatible for qcs615, sdm845 is used as a fallback
>>> (so that we don't have to add new driver entries). You will however need
>>> to submit a separate dt-bindings change.
>>
>> We have added sdm845 in compatible due to below comment in driver file
>>
>> File: https://github.com/torvalds/linux/blob/81983758430957d9a5cb3333fe324fd70cf63e7e/drivers/dma/qcom/gpi.c#L2284
>>
>>    /*
>>     * Do not grow the list for compatible devices. Instead use
>>     * qcom,sdm845-gpi-dma (for ee_offset = 0x0) or qcom,sm6350-gpi-dma
>>     * (for ee_offset = 0x10000).
>>     */
>>
>> Do we still require new compatible for qcs615 ?
> 
> You are not living in the void space. `git grep qcom,sdm845-gpi-dma`
> immediately shows what is being expected. Please don't ignore existing
> work.

Thanks, Pushed separate patch for GPI documentation patch.
https://lore.kernel.org/all/w66ki7lwrqol24iptikn7ccna25ujqoywjena5ulekf6vynxny@dylbj2r34h7l/T/

> 
>>
>>>
> 


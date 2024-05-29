Return-Path: <linux-arm-msm+bounces-20938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 672EA8D38DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9884D1C22311
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D39D14B972;
	Wed, 29 May 2024 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YzVSqhMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34914B97D;
	Wed, 29 May 2024 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716991958; cv=none; b=BHHlxSMr0x0f0EFkx39TC8kYGNkTAKtVEoMjMhciSZjRF5HzOa+DjGid449gt8lMZ6584RZxautTRYXAu4wllj2Btl/kjZV2fuP2DyYUSxRE0i3CYqs5Gq3aFz6uQlFkVWl6teXC95hQMtaN7q6QK1CoK5bEThGwHFDbQpaNrf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716991958; c=relaxed/simple;
	bh=7NWEr5StuLmVJzguniP2zwAbQK9RarAUtHZ7MlPcfRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iDS3PigHnqhnKp6VDFgvItCeKo6f8MSx0ReYxCRhVWRA6H0ab3syzT7D9I1E/RK5iEGswhVnBh59E0v2CrRjFZxCQTZxGgKco5QS9Udrdk07/73sQ7hJRh2eP4uEHMlDvlw5dL5SIpT8M2L+IGuliQTQKAJyWpXlBud8TnLLhqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YzVSqhMM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TB3von022257;
	Wed, 29 May 2024 14:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPvIvJ2IIY00uJkZe6YmwHumkZ4S2a0l8w41fyVrgOo=; b=YzVSqhMMQ53xi4bQ
	u+oJUcItr1I6YcJ5EjeFoyX5a+7/VrXzy26M0I4Gws3/3iLPg/QnTxQfP+atfsYG
	WN0zfFre/vIby8h0XBV4Z9yd/4PQYLuDXraoKby86MGJYCX90ymaka8qir98X6b+
	mJVNjIPo/fC+EUpYym36jRJPLTykPe0l5vASDhx7mEEOpbMuw2wGzJULeUWkjhbq
	XK54octCXJni229tVuAwnTuw9LaYklGHu9XlFPO3uHdr8weKOKtOlRtvopztJvAP
	xlemZfjWJjxsro6yfqhYTu7P5vyqnYsZP2MP/vY0f+NWQIpx0SnrYaxK+imvbmqE
	TqxJSQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba1k9553-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 14:12:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TECVfB004147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 14:12:31 GMT
Received: from [10.216.41.231] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 07:12:23 -0700
Message-ID: <43068207-ed07-f616-9ecc-77372d9d4704@quicinc.com>
Date: Wed, 29 May 2024 19:42:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add qfprom node
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1709727995-19821-1-git-send-email-quic_mojha@quicinc.com>
 <1709727995-19821-2-git-send-email-quic_mojha@quicinc.com>
 <45fcf8fb-9d9b-4e6a-a7c5-9bfb96875e64@linaro.org>
 <69a8c14c-109a-103a-b8dc-d8e303c0f0d5@quicinc.com>
 <gxi4klvxzwwyrwb2b4h7kmii5dx5mxdypxowwz3kyllvq6grss@6lahaospwtsh>
 <4jopw7qv2jlq7b5ljkxfhjjjdlqclruouentrvbjt43yybxyf6@qzsk4imnmq5m>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <4jopw7qv2jlq7b5ljkxfhjjjdlqclruouentrvbjt43yybxyf6@qzsk4imnmq5m>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mGKwbwYvWS1ArAylhw4vIuIJcXnOKCgc
X-Proofpoint-GUID: mGKwbwYvWS1ArAylhw4vIuIJcXnOKCgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290097



On 5/28/2024 9:07 PM, Bjorn Andersson wrote:
> On Sun, Mar 17, 2024 at 08:21:58PM GMT, Bjorn Andersson wrote:
>> On Thu, Mar 14, 2024 at 10:13:59PM +0530, Mukesh Ojha wrote:
>>> Sorry for the late reply, was on vacation.
>>>
>>> On 3/6/2024 9:24 PM, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 3/6/24 13:26, Mukesh Ojha wrote:
>>>>> Add the qfprom node for sm8450 SoC.
>>>>>
>>>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sm8450.dtsi | 7 +++++++
>>>>>    1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> index b86be34a912b..02089a388d03 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> @@ -4575,6 +4575,13 @@
>>>>>                };
>>>>>            };
>>>>> +        qfprom: efuse@221c8000 {
>>>>> +            compatible = "qcom,sm8450-qfprom", "qcom,qfprom";
>>>>> +            reg = <0 0x221c8000 0 0x1000>;
>>>>
>>>> Is is really only 0x1000-long? Also, is the base you put
>>>> here the ECC-corrected part (if that still exists)?
>>>
>>> No, its not.
>>>
>>> Entire fuse space is this.
>>> 0x221C0000-0x221Cbfff
>>>
>>> ECC corrected range is this 0x221C2000-0x221C3fff and High level OS
>>
>> That's 0x2000. Does this then also imply that the ECC-corrected values
>> are no longer mapped 1:1 with non-corrected, or why do they differ in
>> size?
>>
>>> does have a access to ECC range however, they are not recommended for
>>> SW usage.
>>>
>>> Above mentioned SW range(4) in the patch is  one and only accessible range
>>> available out of 0-7 SW ranges(0x221C4000-0x221Cbfff with each
>>> size 0x1000) and does not have ECC fuses.
>>>
>>
>> So you're saying that in contrast to other platforms, the 4th software
>> range, dedicated for HLOS, does not have a matching ECC-corrected
>> shadow? If that's the case, then "not recommended for SW usage" sounds
>> wrong.
>>
>>> All the downstream use cases are getting fulfilled with this.
>>>
>>
>> You only need ECC if you're unlucky...
>>
> 
> The patch is either incorrect or the commit message is lacking answers
> to the questions from Konrad and myself.
> 
> Would have appreciated a reply here, but either way I'm marking this as
> "changes requested" and dropping it from the queue.

Apology for coming late on this., it just skipped from my tracking.. 
Frankly, I don't have convincing answer apart from what reason are 
exposed to kernel to read for SoCs like sm8[456]0 , will try to get
the answer soon.

-Mukesh


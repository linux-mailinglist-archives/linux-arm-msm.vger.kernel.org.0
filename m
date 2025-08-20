Return-Path: <linux-arm-msm+bounces-69877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B03B2D4BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 049F63AC8BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 07:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3122D3EC2;
	Wed, 20 Aug 2025 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hk3lms1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563C419258E;
	Wed, 20 Aug 2025 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755674404; cv=none; b=CJidN8DI9rGKcJhtYJ5ruzkj76Z48YZXOATqEHNZcgW9dcxWum1S0K14pywkUeok9fJaQqCtNwVXJcDtRx7lL3IV1b03oDHjjqDZfgTg8O6R9EaymYTO7MDUTgBlXjN+NxpNniJVxkg0r5dJfsmt7EzPxd49PjpJVGJYVnZMXZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755674404; c=relaxed/simple;
	bh=32xCHnNnem5BD5OsWkgZ3cstrS/qgPJdiiZB3UXndjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JtVGyHg6Z//RgRJkGSst6fVGFabNdCnu01+EB9RGtbogEXjr+w6hePMY41g+kKQAcsrFCGNCb/HAD+kklzmbO1J2t59TwFmbLogzZ+gdaBKD9H5KQWiVB4DF8nM2pgQZ3oAaIFlkJOVUfYXPOzwpQg2vS+DORJr+XT3XqPxXDzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hk3lms1V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pDoM011480;
	Wed, 20 Aug 2025 07:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R36951E5bXwxhf0whoyxbWPcOJ612cTFYjtpSUf4t3Q=; b=hk3lms1VmxrNJq9/
	7QSU2TdAiMi5YgXCqw5vZ+Eb4QNV82/7VrX8iisMFqF+uNwa1wbmyyRLlBTKmkZO
	SBuaDa6acypcLco42w51YgNZ+iieOgcYHmgeN21XldrfYNm3+rALvkX+yWiB5LP2
	NAR52It6oSpQBxR8XGYS80f2fhDBBGkkyoe9KqfQIRg+qyGf2TVWCSgRYQI4HN9s
	/topwR938pTElhfhZosB4mYiC0EM/4X16ziJGgM+9ZKg1kEZyKkYNQGUS2CmpkCk
	54wyERcEYEwuFoZCVaCwUB+MiVkbWuHTU6Lf58xqPTvFg1+a3pKiML6QER+o+ng1
	qbnwpA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bgsg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 07:19:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K7Jvnn008494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 07:19:57 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 20 Aug
 2025 00:19:51 -0700
Message-ID: <a1252539-d35f-443b-9e0a-3316f9ff932a@quicinc.com>
Date: Wed, 20 Aug 2025 12:49:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Ulf
 Hansson" <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
 <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
 <8b023e56-435b-43df-8b15-c562a494e06f@kernel.org>
 <ab5d3811-9fbf-4749-9463-4457fbf50023@quicinc.com>
 <4091c488-996c-4318-82ad-c054a9ef5a22@oss.qualcomm.com>
 <a93fb5bf-1fd5-4e00-8338-b8608a9ba8fa@kernel.org>
 <f2f13082-20d6-4f22-8dfb-f11b01cd6706@oss.qualcomm.com>
 <dda9a2ef-5b86-4883-8347-b5ccf25e8d5d@quicinc.com>
 <0257f893-fed8-4ee9-ad4e-cdcdad8b5c85@linaro.org>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <0257f893-fed8-4ee9-ad4e-cdcdad8b5c85@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/SSfp9ufxGMc
 S3WSNGZXCY//MHpOW8vXZfRcuPbh9Hn4Poh3uWWT2GDDiBuhr4BYUNItFTMBfDPilx17MDSayki
 m0OFYyHBsFnCVY0ptlWn/Lh7cddp1ebUHWNypyNm3x3+1C0YevD84+L9zKpgcSvgktAsvvbj6ni
 Xwl8gc9lIRT4UDo/Fp/7qsRuixBq/48NttlCHMUQ0Rubs/l/hIL8QLX49SAtn5m1Rt9Y46fjY5I
 qWL/UcZZXOuncwsmPE6JIaZdbtfFJ/ZA3y9pV185KqfJlR6PEDndsOvogoZ/GAvyq+mXnM7asrH
 8GyO21Dfu5/pfoxypzVQd3rtKkpaiBcu3yuE6EE5T56Lq97ayYw9LHcYjnGlSRO6hyr7rsNoF9D
 Qfq6L1GU/A5I4BWeOtPN1sCpnM+dAw==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5771d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=6UoUdjYcmRBRTNJ1P8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: _pIDF-p2Y2SePbethL3iG5U3Dkskyj5X
X-Proofpoint-ORIG-GUID: _pIDF-p2Y2SePbethL3iG5U3Dkskyj5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/19/2025 7:00 PM, Neil Armstrong wrote:
> On 14/08/2025 09:15, Sarthak Garg wrote:
>>
>>
>> On 8/13/2025 5:37 PM, Konrad Dybcio wrote:
>>> On 8/13/25 1:56 PM, Krzysztof Kozlowski wrote:
>>>> On 13/08/2025 13:21, Konrad Dybcio wrote:
>>>>> On 8/13/25 1:08 PM, Sarthak Garg wrote:
>>>>>>
>>>>>>
>>>>>> On 8/5/2025 2:55 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 05/08/2025 11:19, Sarthak Garg wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 01/08/2025 10:45, Sarthak Garg wrote:
>>>>>>>>>> The kernel now handles level shifter limitations affecting SD 
>>>>>>>>>> card
>>>>>>>>>> modes, making it unnecessary to explicitly disable SDR104 and 
>>>>>>>>>> SDR50
>>>>>>>>>> capabilities in the device tree.
>>>>>>>>>>
>>>>>>>>>> However, due to board-specific hardware constraints 
>>>>>>>>>> particularly related
>>>>>>>>>> to level shifter in this case the maximum frequency for SD 
>>>>>>>>>> High-Speed
>>>>>>>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable 
>>>>>>>>>> operation of SD
>>>>>>>>>> card in HS mode. This is achieved using the 
>>>>>>>>>> max-sd-hs-frequency property
>>>>>>>>>> in the board DTS.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>     
>>>>>>>>>> arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
>>>>>>>>>>     
>>>>>>>>>> arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
>>>>>>>>>>     
>>>>>>>>>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
>>>>>>>>>>     
>>>>>>>>>> arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 
>>>>>>>>>> 3 ---
>>>>>>>>>>     4 files changed, 3 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This will break MMC for all of the users and nothing in commit 
>>>>>>>>> msg or
>>>>>>>>> cover letter explains that or mentions merging strategy.
>>>>>>>>>
>>>>>>>>> Exactly this case is covered by your internal guideline, no? 
>>>>>>>>> Please read it.
>>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>> Krzysztof
>>>>>>>>
>>>>>>>> Just to make sure I’m addressing the right concern — are you 
>>>>>>>> primarily
>>>>>>>> worried about the introduction of the max-sd-hs-frequency 
>>>>>>>> property in
>>>>>>>> the board DTS files, or about the removal of the sdhci-caps-mask
>>>>>>>> from the common sm8550.dtsi?
>>>>>>>
>>>>>>>
>>>>>>> Apply this patch and test MMC. Does it work? No. Was it working? 
>>>>>>> Yes.
>>>>>>>
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>>
>>>>>>
>>>>>> You're absolutely right to raise the concern about potential 
>>>>>> breakage.
>>>>>> After conducting additional testing across multiple boards, I’ve 
>>>>>> confirmed that the removal of SDR104/SDR50 broken capabilities 
>>>>>> does indeed affect V1 SM8550 devices.
>>>>>
>>>>> v1 is a prototype revision, please forget it exists, we most 
>>>>> definitely
>>>>> do not support it upstream
>>>>
>>>>
>>>> You should double check. SM8450 (not v1!) needed it, so either it was
>>>> copied to SM8550 (v2!) by mistake or was also needed.
>>>
>>> I believe that the speed capabilities are indeed restricted on 
>>> 8550-final
>>> and that's why this patchset exists in the first place
>>>
>>> Konrad
>>
>> Hi Krzysztof, Konrad,
>>
>> Konrad is right — this patch series addresses limitations seen on
>> SM8550-final silicon.
>>
>> SDR50 mode: The tuning support introduced in this series helps ensure
>> reliable operation.
>> SDR104 mode: limitations are resolved in SM8550 v2.
> 
> I guess the state is the same for SM8650, it also requires the 
> max-sd-hs-frequency.
> 
> I guess all boards with a level-shifter on board would need such 
> limitation,
> including most of the HDK boards (SM8450 included)
> 
> Neil
>

Yes, that makes sense Neil — all boards with a level-shifter on board
would likely need this limitation, including SM8450, SM8550, and SM8650.

>>
>> But still to avoid regressions, *I’ll like to retain sdhci-caps-mask in
>> sm8550.dtsi for now and revisit its removal for future targets after
>> thorough validation and testing from the beginning.*
>>
>> Konrad suggested placing max-sd-hs-frequency in the SoC dtsi.
>> Krzysztof, could you please share your thoughts on this approach?
>>
>> Best regards,
>> Sarthak Garg
> 


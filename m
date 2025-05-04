Return-Path: <linux-arm-msm+bounces-56671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 798EFAA836B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 02:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A726188E8B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 00:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08274748F;
	Sun,  4 May 2025 00:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PlP960UK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012A63214;
	Sun,  4 May 2025 00:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746319052; cv=none; b=RziZN1IPYmhQnv5IWFsmjaFN9a60rd2Qv451xFbvW0OTqFUpSW7IAvRfHSQh8ejxtA+hAOvAG1l9DkWWsLXPlZytLVxZVzLCZoEsnNDjf6ELonSB2eiYTutEsyyjXKe0ykkCW6c2L30tDZWlNaXaFB1IG8mMMNWYAYxiVboD+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746319052; c=relaxed/simple;
	bh=EL3+72zffD6QTSBze3yQK86pfEwdpGoCegXiDSL+c/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yn/mfN8QwqItYVPAim7AqTOB1rlGnum77BWvYaScYbFgdi1oJJHKfi4VtkXtm+j1vkI+nYcmLT9SCQiD6bVoIotMfOXazCiXK9hAM4tthONdi6YBs1/Bp+Y1syiQb84gsS1qvWoZrKpD9w30zAc3aata1oA3tPiMYmeDFmwcGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PlP960UK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543NDdDC022786;
	Sun, 4 May 2025 00:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2MYthm9y7b8NS+74WF6knydS+GBYhU1zVV++F0zTOo=; b=PlP960UKCXO+YQfE
	Wlk6XDHYD7A0mI+PcRbC73CTrF5Fy+QVVTWQc+u6bWDQZI2hQQDhMDHPDKAAWQDA
	s/iiqS25BGF6mit5tW/T49nRAhHuxn9jMgh1rXr5+5TU5vb00yPkgJdH6/mPeNXu
	CmJAs3HBXZ8y11uQZ7DAeuxmE11xBfjtaD3RnN9+cCG+XbHRp0kqr5sp+zykf6f0
	6sdvhqy4c5jjqg8ctX5NaNlTznRjnPz6+DesvtkAiYWKqVEHwLEQQWJSQ3LBNRRS
	ezwWp3m4QlMiDJqu1jTx2paX+kdKZCzwjNqFbD3DSzY9P4SEV2A4LIzG4fXZM2Rr
	u0g98A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55saf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 00:37:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5440bP0J016770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 4 May 2025 00:37:25 GMT
Received: from [10.110.124.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 17:37:23 -0700
Message-ID: <9e4ba93a-d299-4813-ba18-d60563a6ce9b@quicinc.com>
Date: Sat, 3 May 2025 17:37:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
 <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
 <dc64ygn6pt5bvdgizc2qk2qnxn3on5nv7hes3hhc6qqmiumdfd@nxpfis6disof>
 <858be1b7-0183-47b3-97b5-7d162b5748d3@quicinc.com>
 <CAO9ioeV0H9OnmHke2prWSqB8+oD4PRfD0ph7qPahwKJHOPpOzg@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAO9ioeV0H9OnmHke2prWSqB8+oD4PRfD0ph7qPahwKJHOPpOzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAwMyBTYWx0ZWRfX2QqENVxXVY8Y
 xofxU3GCig/OxZhrP5kEAOlobSOmrFM1uOqueMLwyNBHp2e0ObpYnHeLiZJelbWQqzqN3qZVH2U
 Mr21RsBgsZxcxY5L+VaPHM1+jhAxWy/fDdFIqmAKo+4HD6x2L0vCBiYD1QfIhLICfdr0sOSCUs7
 361Sfq65ZwY3QbhA57lSXoPTJs8m/fX6D2ZLYS47PD+8fE+i8ySHiO5a4cPtm98hmR3atf5Z4O8
 vMzrBVcdjkSOdOxLA4/Pbu5IE4PVkkij6nWC9vPw2htcOvkqXrzDdB0/BQvhjxM2DsNZ1ko2RQd
 RuaWtN5tlBjX/weXS1x/A1fQIDY57WlUD6yQjb0TwDGS8UU4j5aL+lLqyIFwwiiLIwgqjeb8E3F
 OP6OZWDMlNxb9VYwN1gFbLoRigG6r5b5n0rPI0/7QSr/oL3SLTxZvFH4UFAlZ8SbWhLsFJb8
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6816b6c6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=ENaD-0hYGYNJixl3NCgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Xm58xjD98MWuIwqUsWivEq2EQKakgct7
X-Proofpoint-ORIG-GUID: Xm58xjD98MWuIwqUsWivEq2EQKakgct7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_10,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040003



On 5/3/2025 2:01 PM, Dmitry Baryshkov wrote:
> On Sat, 3 May 2025 at 22:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/2/2025 10:51 PM, Dmitry Baryshkov wrote:
>>> On Tue, Apr 29, 2025 at 04:07:24PM -0700, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
>>>>> On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
>>>>>> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
>>>>>> DisplayPort and Display Clock Controller.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +                          mdp_opp_table: opp-table {
>>>>>> +                                  compatible = "operating-points-v2";
>>>>>> +
>>>>>
>>>>> The computer tells me there's also a 156 MHz rate @ SVS_D1
>>>>>
>>>>> Maybe Abhinav could chime in whether we should add it or not
>>>>>
>>>>
>>>> Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even for
>>>> sm8650 and did not publish it in the dt.
>>>>
>>>> It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though
>>>> LOW_SVS_D1 is present even on those.
>>>>
>>>> I think the reason could be that the displays being used on the reference
>>>> boards will need a pixel clock of atleast >= low_svs and the MDP clock
>>>> usually depends on the value of the DSI pixel clock (which has a fixed
>>>> relationship to the byte clock) to maintain the data rate. So as a result
>>>> perhaps even if we add it, for most displays this level will be unused.
>>>>
>>>> If we end up using displays which are so small that the pixel clock
>>>> requirement will be even lower than low_svs, we can add those.
>>>>
>>>> OR as an alternative, we can leave this patch as it is and add the
>>>> low_svs_d1 for all chipsets which support it together in another series that
>>>> way it will have the full context of why we are adding it otherwise it will
>>>> look odd again of why sm8550/sm8650 was left out but added in sm8750.
>>>
>>> I think it's better to describe hardware accurately, even if the
>>> particular entry ends up being unused. I'd vote for this option.
>>>
>>>>> [...]
>>>>>
>>>>>> +                          mdss_dsi_opp_table: opp-table {
>>>>>> +                                  compatible = "operating-points-v2";
>>>>>> +
>>>>>
>>>>> Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
>>>>> with the decimals
>>>>
>>>> For this one, yes its true that LOW_SVS_D1 is 140.63Mhz for sm8750 but this
>>>> voltage corner was somehow never used for DSI byte clock again I am thinking
>>>> this is because for the display resolutions we use, we will always be >=
>>>> low_svs so the low_svs_d1 will never hit even if we add it.
>>>
>>> Please add all voltage/frequency corners. Think about low-res DP or
>>> low-res, low-rate WB.
>>>
>>
>> Sounds good, lets go ahead and add all the voltage/freq corners.
>>
>> Like I noted, even for sm8550/sm8650 the low_svs_d1 was missed out, so
>> if we are adding it for sm8750 now in this series, a follow up patch
>> should also be sent to add them for sm8550/sm8650 as well. That way we
>> will fix them all up together and this does not come across as a
>> discrepancy.
> 
> Abhinav, if you know a missing piece, please send a patch, fixing it.
> 

Sure, I will send something next week to fix up the sm8550/sm8650 dtsi 
to add the missing opp tables unless someone beats me to it.



Return-Path: <linux-arm-msm+bounces-56669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CBFAA8268
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 21:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E66A15A420C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 19:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB6827B50B;
	Sat,  3 May 2025 19:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gKrDuvBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C36012FF69;
	Sat,  3 May 2025 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746302371; cv=none; b=uIiOdmPj/xsjBww0r8vYRD6HJIGllz4bYiVQ356fJPh/9U7VniUWP6bwl5M6WMUXd3c+kdWGL7+R2TPBH9H6YzxGguokRzSMTpwAa761w4V10CzGQJtPV9ORyl7YHlDG1ADfh8djKByNGH/aqX8+ofGdByWfmaNcRloldIDYiRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746302371; c=relaxed/simple;
	bh=RhWXks4It/d1y3CV6Qkw2FkraI+EvWEqiPDwkgFOnLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CbCFcrZ3gYwKn6yC8Sdh247jrc4qhPO9pz1ZnxNUBLpWq/t2CuPqua8F/gHJA2OwhgHPYpJuXAzAFjSOcmRQmTPFer7IfTRxdjLkI0MZXZeX1/rb7DEOmjoY+92gB2ISsRelz7br94+Jh4KIcgAKk9sS43v446aqOJ1fiRH5zBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gKrDuvBZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543Iw3iT021176;
	Sat, 3 May 2025 19:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKuc4j/QfJqpXxDOWjJeZDi7Y0r1Rf90lkMU3xbFGr0=; b=gKrDuvBZ6Pz5N5Sj
	sE+rSUe88oB81p4oy3FAQoOsOUxJG3Fn+QHxfn7GtrwbBP7KSqFTmFEaEtuf7cQ9
	b49TiOr5Ya03vbl1dbAcaYT9rr74gKd9iXYPk+uNLUE5xQ/zJ1oV55CVVwqnQWef
	8bBbkN46ZyblOlJ3ojT5pTd8eq8b7ijW4ZXcOGQuuFXukz5kisuHoLKYuYEAqnZW
	gyCa07woVEj3o2oIqPhNUPl8tMkJIhhjMZVKl9Ryv66izv5weAwk27eqBm9th9lJ
	OkiR3487L3QHb7TGfJKgOZMwupxstFXFFm2zy605hDMK+HIa8dqYbSlg/WYRVJOf
	EK5W2g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46daqxh2d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 19:59:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 543JxN26011254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 3 May 2025 19:59:23 GMT
Received: from [10.110.124.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 12:59:22 -0700
Message-ID: <858be1b7-0183-47b3-97b5-7d162b5748d3@quicinc.com>
Date: Sat, 3 May 2025 12:59:21 -0700
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
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <dc64ygn6pt5bvdgizc2qk2qnxn3on5nv7hes3hhc6qqmiumdfd@nxpfis6disof>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EU6cvjXVlfm9R-JQxbk96ugi01DbXM0w
X-Proofpoint-ORIG-GUID: EU6cvjXVlfm9R-JQxbk96ugi01DbXM0w
X-Authority-Analysis: v=2.4 cv=baZrUPPB c=1 sm=1 tr=0 ts=6816759c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=eIBSfAiRY9SfulBmUi8A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE4NSBTYWx0ZWRfX/9Go+m0Qt8aB
 YKLhSZf6U9cZW2e+mngmivFMeBpfPzUpyX3eCfnviFZayr3tqp2PdjtuCQSZNAHKdSdPSuA7zrq
 fik1odFVWXdpIabVakYZPhswmT6a7A2HuQKO50l/5d18sZRwCrp3kNDh7LNdKNGXfdtTogKjN6s
 So9dm6mxhWAA5lUhuU15lJMVSqNJ4nHPoldlKlRuQqIb2VWqpOHkO9SDP8tNUde9ika714AKKYd
 73W4nONCzcILLnHcCAx8DnuhMgcrxuISwiCu7OW6j3AByx32tITH+LK7f2by5MOERBg3j8Y/2Az
 iUWq6GJC1OdMtZdmeyXRPkYXyKZJ+A4FTFcmDCOxfzqhU7YVEk/hROcmGC+q54oQNXhH7b/D7aj
 KqkYe90cZVT6Sg23mjDwflXZ82eWFovEC1PZ2qx8zfdCtCdAMkFj5jPqxZ+PNCE8wbGhYPbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_08,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=977 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030185



On 5/2/2025 10:51 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 29, 2025 at 04:07:24PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
>>> On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
>>>> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
>>>> DisplayPort and Display Clock Controller.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> ---
>>>
>>> [...]
>>>
>>>> +				mdp_opp_table: opp-table {
>>>> +					compatible = "operating-points-v2";
>>>> +
>>>
>>> The computer tells me there's also a 156 MHz rate @ SVS_D1
>>>
>>> Maybe Abhinav could chime in whether we should add it or not
>>>
>>
>> Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even for
>> sm8650 and did not publish it in the dt.
>>
>> It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though
>> LOW_SVS_D1 is present even on those.
>>
>> I think the reason could be that the displays being used on the reference
>> boards will need a pixel clock of atleast >= low_svs and the MDP clock
>> usually depends on the value of the DSI pixel clock (which has a fixed
>> relationship to the byte clock) to maintain the data rate. So as a result
>> perhaps even if we add it, for most displays this level will be unused.
>>
>> If we end up using displays which are so small that the pixel clock
>> requirement will be even lower than low_svs, we can add those.
>>
>> OR as an alternative, we can leave this patch as it is and add the
>> low_svs_d1 for all chipsets which support it together in another series that
>> way it will have the full context of why we are adding it otherwise it will
>> look odd again of why sm8550/sm8650 was left out but added in sm8750.
> 
> I think it's better to describe hardware accurately, even if the
> particular entry ends up being unused. I'd vote for this option.
> 
>>> [...]
>>>
>>>> +				mdss_dsi_opp_table: opp-table {
>>>> +					compatible = "operating-points-v2";
>>>> +
>>>
>>> Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
>>> with the decimals
>>
>> For this one, yes its true that LOW_SVS_D1 is 140.63Mhz for sm8750 but this
>> voltage corner was somehow never used for DSI byte clock again I am thinking
>> this is because for the display resolutions we use, we will always be >=
>> low_svs so the low_svs_d1 will never hit even if we add it.
> 
> Please add all voltage/frequency corners. Think about low-res DP or
> low-res, low-rate WB.
> 

Sounds good, lets go ahead and add all the voltage/freq corners.

Like I noted, even for sm8550/sm8650 the low_svs_d1 was missed out, so 
if we are adding it for sm8750 now in this series, a follow up patch 
should also be sent to add them for sm8550/sm8650 as well. That way we 
will fix them all up together and this does not come across as a 
discrepancy.


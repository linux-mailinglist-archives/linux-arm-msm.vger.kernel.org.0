Return-Path: <linux-arm-msm+bounces-56174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B657AA3BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 01:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE4E91B65FF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 23:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A062777FC;
	Tue, 29 Apr 2025 23:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SQ7xDq8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0645F13A3F7;
	Tue, 29 Apr 2025 23:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968054; cv=none; b=HdMhTa/giI9bOaofnfVKSuNAbB6Zz+cWkaDh3XOtvPWg6yv3J8kc7b2YPQZkr0VvTZuEqmbYMTV0j0vKeuOuQmoo9G+MCVrWdT9AzjEegCzDH1c39JZE8IqStwoo7ST5t+0YeOmvKxGSFO33NrNSTU3iVQIItpt2CeM9NJX0lvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968054; c=relaxed/simple;
	bh=sQyQcn/NJDF0PMJuRn0HWiah8ew+Af20fUs0fgdqzX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BlnuFlnE4X6eQXLH/4FeTLLjGcMDgi5p2d7YFwTtGzPa9oS4bfhSYTj9AZB2APBxbop+vHDqio5lZDUevUcAfoUxYQV2Ie/D5cqMBzL6ohLxNCZuUwx9KOR9B2oTVvls25M7/J5DLfb4L/Hx3bCEm7nGKdaHRrEtrtRrXIlvUAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SQ7xDq8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaR2B012228;
	Tue, 29 Apr 2025 23:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jaV5N0qvUnZDuYjp+FnsHmSl9vOLniX82vpDUzJOuwg=; b=SQ7xDq8lBCSmkhnJ
	yoAbUB8+VWn9ubzIbLGhJSZe12NttIZ6+uD938zydWrVcbHn9BrhzxsxbxG++eh9
	G27+8p5Hf0idbKSexEoS6x/zmDMlCzl7tQtPr2kLWcnrvIJVZnrruTC5uX1SEgEs
	Vq2IwboEYg9N3Sy/I7LH7YvjeHVQaN2qHpjMaq62Ey5DrZlL0uoao80ea8XMlpXB
	RGRhxEp0qhdNdPP7CbSA3VAwDIYepY+O98MXevAF7XC7MtimmEsDRKCHt+4nibM5
	LvliQV5c8C+B8uiiNQDhnMDhFI1pVsElX2n1x82/pM0/u1DRKvJsEPquW0bTD6Kr
	DJz/2g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3r5bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 23:07:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TN7QBj031444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 23:07:26 GMT
Received: from [10.110.114.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 16:07:25 -0700
Message-ID: <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
Date: Tue, 29 Apr 2025 16:07:24 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar
	<abhinavk@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=68115baf cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aYvukNd2sAEyGAm9ZjkA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2VlkCAuuU0yLdCc2gPV0we-DqBowCEBd
X-Proofpoint-ORIG-GUID: 2VlkCAuuU0yLdCc2gPV0we-DqBowCEBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE3MSBTYWx0ZWRfXz25DB8MGcPw6 gadCEwiVhQKt2VrWI+WhSHF69+XkqswHIz3O1Xcn3MKVWn006slBll8NSqEN9LlgIV+g/SPbyGU 3Nr0efmC3pRbuuoQODOk7R6oMIg09/0EJPFXCzrDzYISS7wLvHgLPD/I3F4eIQlmT4ku5jnSbLz
 LPObPTHakgzmkynJIvPHFa/fTvjlQPM0ZSCF0ZYtDT8ULdUl0RHodKn4SjTU84vRgVkgwWQgKyX KtT73ny/qzTsLlRQaewkPFlQoOOcRRNERCACvFErLyq+xfhIw7IS1inmKSTXxzMb9kTX5q5rW3R HRiulJth3ESdTwJgUDkIneV+sKx2xXS5i+aVeISDImy1Lprk3ZgvL/kYds/jRfVGs13M7lqVV0C
 +qHhbmeDsQehKNS163Mk+EDvqA8TxCFLTZqpeZqWa7OQZ67zHekrW/pkWe5wGl0p2Hol7dPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=702 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290171



On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
> On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
>> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
>> DisplayPort and Display Clock Controller.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
> 
> [...]
> 
>> +				mdp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
> 
> The computer tells me there's also a 156 MHz rate @ SVS_D1
> 
> Maybe Abhinav could chime in whether we should add it or not
> 

Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even 
for sm8650 and did not publish it in the dt.

It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though 
LOW_SVS_D1 is present even on those.

I think the reason could be that the displays being used on the 
reference boards will need a pixel clock of atleast >= low_svs and the 
MDP clock usually depends on the value of the DSI pixel clock (which has 
a fixed relationship to the byte clock) to maintain the data rate. So as 
a result perhaps even if we add it, for most displays this level will be 
unused.

If we end up using displays which are so small that the pixel clock 
requirement will be even lower than low_svs, we can add those.

OR as an alternative, we can leave this patch as it is and add the 
low_svs_d1 for all chipsets which support it together in another series 
that way it will have the full context of why we are adding it otherwise 
it will look odd again of why sm8550/sm8650 was left out but added in 
sm8750.

> [...]
> 
>> +				mdss_dsi_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
> 
> Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
> with the decimals

For this one, yes its true that LOW_SVS_D1 is 140.63Mhz for sm8750 but 
this voltage corner was somehow never used for DSI byte clock again I am 
thinking this is because for the display resolutions we use, we will 
always be >= low_svs so the low_svs_d1 will never hit even if we add it.


> 
> Konrad
> 



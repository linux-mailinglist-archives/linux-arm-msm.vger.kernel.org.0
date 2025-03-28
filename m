Return-Path: <linux-arm-msm+bounces-52752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B2A74880
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 071811B60B49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9851621ABAD;
	Fri, 28 Mar 2025 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OMEuak1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEB21C174E;
	Fri, 28 Mar 2025 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158479; cv=none; b=utNgFuEtolfb18Tgzsj+HHEiYllWf2hI2jgW0JHaNHMxilp8geWtki9QsUXVHpBac2Jjaxn06uk4ePrwJkUIo9Ray3Rw2ldKYeuHjUQMKm4PtPLjseQIxJSSpKVanj9vUI3NttlSToQ1cggpd9vLSQSl9fVXuHhl8tLP1RCidGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158479; c=relaxed/simple;
	bh=a0xMJF3+ZMDeFSGHb4h0fH+kVmYY1epYV8+wpMeNxiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NahSwRfad/B2spQ4lFxEZhvWBz06/dfG9izPsz73ygYn1yKcBm2h1MfC4wcZH0srlP1cphTq9qvobseWDTSBgMsUiJh6pAppWKi9k8QOyQY/aDqsfAnyBe7Cs/OliTLgB+p+Q4I2x6uT7RODWaZJern0Mf3uI1uTS9kGt4h6H0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OMEuak1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S6tbEI026218;
	Fri, 28 Mar 2025 10:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+1f4QwiPhupdT2rk4T6Y/Qc7xJYnuWRew6/lbYbgtw=; b=OMEuak1PNkjjfyJV
	Y6Qx50ktuPYtUwbQJNraH3q66qtS1bAMw3tETW23mQZXmwSnjQrgoyWdimXfP40Y
	UxoHnBntWE1KGgXCEZD9NnDExMMW2R7XHC/mJpmT+j7f2SR+3Oyz8A/kaE4HbzZc
	XgzNiCJgRBremAlfx12Zt5+UJNtxHZAB8DnmxoqTYhXm2tricq/vMkop4uj058ZI
	ng2sGZZBuoU/J7PgluXfbDp5JCTu71iCxqvb+FSPZNzwmYolg6A7XH9J0fSQQSI+
	SDEwdWQxuerRro5cXrHn6Si1K5zkIt9FvttyaMBFMBzkS7ZYiskmXPlYLevWmkKQ
	Hlrx3A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nat0te99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 10:41:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52SAfDW9022216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 10:41:13 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 03:41:07 -0700
Message-ID: <7d4fe55f-e763-467b-a759-e5999f8307d9@quicinc.com>
Date: Fri, 28 Mar 2025 16:09:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
 <20250328-nifty-oriole-of-admiration-d20b05@krzk-bin>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <20250328-nifty-oriole-of-admiration-d20b05@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PPkP+eqC c=1 sm=1 tr=0 ts=67e67cca cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=aG_hZNWt8IHe8E-Te-AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7q6dLK0wkYxlKIGeYSuccLMSQ0K_hO-X
X-Proofpoint-ORIG-GUID: 7q6dLK0wkYxlKIGeYSuccLMSQ0K_hO-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=995 lowpriorityscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280073



On 3/28/2025 1:37 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 27, 2025 at 03:22:22PM +0530, Jagadeesh Kona wrote:
>> Move SC8280XP camcc bindings from SM8450 to SA8775P camcc.
>> SC8280XP camcc only requires the MMCX power domain, unlike
>> SM8450 camcc which will now support both MMCX and MXC power
>> domains.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml | 2 ++
>>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml  | 2 --
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>> index 81623f59d11d73839e5c551411a52427e2f28415..127c369dd452608e5e7a52c7297b6b343d1c1bf8 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>> @@ -17,12 +17,14 @@ description: |
>>    See also:
>>      include/dt-bindings/clock/qcom,qcs8300-camcc.h
>>      include/dt-bindings/clock/qcom,sa8775p-camcc.h
>> +    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>>  
>>  properties:
>>    compatible:
>>      enum:
>>        - qcom,qcs8300-camcc
>>        - qcom,sa8775p-camcc
>> +      - qcom,sc8280xp-camcc
> 
> That's not equivalent. You miss required-opps.
> 

Yes, I will check and fix it in the next series.

Thanks,
Jagadeesh

> Best regards,
> Krzysztof
> 


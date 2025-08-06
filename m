Return-Path: <linux-arm-msm+bounces-67841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E047B1BF7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 06:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 450E37AE307
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 04:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF9E1A239A;
	Wed,  6 Aug 2025 04:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b3FCZtiZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CC015624D;
	Wed,  6 Aug 2025 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754453309; cv=none; b=KFpoxlpN+Kvj9IICPMmsnz5TpEe3A5bug6qZmXI9a3VK4jZGXlRunW/aKJdg5Gcgjoe3uotDY7PjBIbBIF5IkOzXUE8Bp4JH63XRSuP2frDxeEUHxCAcwZ1Kqt0uL2pCBvg9EXY8sdqgZe2GYdCpBixQ1IjizUKJzQpM5+CwgHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754453309; c=relaxed/simple;
	bh=vLKrGJMluRiPfozLXti15Dj3lNH849FQCyAgklrVvcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QAyAD8dlJWqnJkoSmHIGy2S+qNWSWcLaRhfsjYn4vzK0Av+/yTvkV7cWwXFBgv5ZaaCq/l/g5Vux1GVhKH7mtTBltkY+z40qHjHx/Ak3bsRtMXqRIO2/+jlnNL1byxffFyUaWtwxXUNBggpkfavPghd9p0RTVfvq3Ih6CHiT3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b3FCZtiZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761f8mS028507;
	Wed, 6 Aug 2025 04:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53+b4CXMniRrYsrmsIvoBPINsBu94m+zX7UjiFralyQ=; b=b3FCZtiZx44SimVn
	p9wjH6ro2+Qo/gfDXjGutM+Lt5bJ59x7IX9DQkEQdSdE6WhnQOvdN1kRDw4CVQxx
	DwR/g+zXKVDdnNlaESk11xydaYxEeVCyAQJr5/n4HcARjWO3sJ9BJ0Jl9h2CFXKH
	UGfSODQdcu3IMGPg28Hpjq6LsI7tppJChg75sy8F0nOWGHpiexdtNlccVuDBAZNv
	trSHEUtmBMF+oyM8wn41AHWOQ8n6XehIcO9qzD2jRR7vEyuaHKJkFE9FvUfUajaD
	YPxRwe57U+rl/rePzoTo0fRqDlaQ0FOKeN1pFrGjLUcfUlCO2eQoKv4MAt2AYKcn
	vTpI7w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7sch7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 04:08:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576485Kf021695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 04:08:05 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 5 Aug
 2025 21:07:58 -0700
Message-ID: <179982fe-ff3f-4d57-9ac9-15f0512facb3@quicinc.com>
Date: Wed, 6 Aug 2025 12:07:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
 <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=6892d525 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=-ocwHwE4qgHzvDXnxf8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xtJhhKhe_EGWwTr4DmzL74IVV86J5FL1
X-Proofpoint-GUID: xtJhhKhe_EGWwTr4DmzL74IVV86J5FL1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX3ys30domU3sl
 FdPnQNFu+I74ty7hQ1xNKhS5A1HzqjBsyXxIEhksB2J8kVg7lWigtJZDDuddglAimzfsD2aDTWP
 iYF3ZEJyodelZmCySw1g3d1iE/Tt2CmrpHbsYJgfTI1t/D5tgXFLqAEtsKN216CEKwARKZQi2nV
 IdAwqi53VTIvVlgP+t+Z6qbQLz0pU4YzqL8ZBEvU94PbNZ944aVyklMF/J1cg7N+Mx8hlKjawat
 d/lURXBswwW0RBEBJOUZMXjWUIsPnqOE935fJCW0WOf9i9H+ofp8hyqIKed7WhtJ1L8MXgU0gJ5
 bxY5yRkZsLzRwHBJj5neJ/CamqgejKioPyd9x8mhNG+/MrB7Anj0AyMV0X+rseG6d7xDeNQ1WmF
 dbfHn9WC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 2025/8/6 11:46, Dmitry Baryshkov wrote:
> On Wed, Aug 06, 2025 at 11:16:46AM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
> 
> 
> Typical comment: you've missed the explanation, why it can not use
> fallback.
> 
Hi, Dmitry, we move this explanation to DP controller patch (patch 6). 
There we provide a detailed explanation of the DP controller,why we need 
this compatible, and why not use fallback. Thanks.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 2893f097df826a5f941fbb754fb4a96a1e410a70..f5930f29c91ec95e9182c7b8ee83c0549c6657cc 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -18,6 +18,7 @@ properties:
>>     compatible:
>>       oneOf:
>>         - enum:
>> +          - qcom,qcs8300-dp
>>             - qcom,sa8775p-dp
>>             - qcom,sc7180-dp
>>             - qcom,sc7280-dp
>> @@ -186,6 +187,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,qcs8300-dp
>>                 - qcom,sa8775p-dp
>>                 - qcom,sc7280-dp
>>                 - qcom,sc8180x-dp
>>
>> -- 
>> 2.34.1
>>
> 



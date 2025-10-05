Return-Path: <linux-arm-msm+bounces-75982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671FBB9991
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Oct 2025 18:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 114054E17F9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 16:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386EA1D618A;
	Sun,  5 Oct 2025 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ji9l96Hk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB5C125A0;
	Sun,  5 Oct 2025 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759682977; cv=none; b=csNIGAmm25eeBgq2l/3fN9/8DSpVdxBXWCzVXo5heGPqA4MNltsxU0CoZrYKxecadGm+1pAL2vHC+SSJK6JoXR4ubnwYOETazOzEvfH25l4ZU4dmvwmZuJaOVuC2BqWkjZQs4dkRYVTJiHBzcN7teLAmaPHmvHlKYa1zdlMpj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759682977; c=relaxed/simple;
	bh=KiYfCwIAWqD++5dx0H2RThew17t6gVaxUjFb/lSrwjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BtarBpoMlukVACoj9iAUV/nDHUfvgjFNyUAn4tx7ycF/A8n/OY6WxnYInLTVliCUUMJWzpMoBcUZEFNbdZLFNaCTy0/fy8myOK3RQqmBFiZYSBAAVWu4QpRebQUB59h+Gqh5JN0OsWFvwdS5G+OBc3wLcNHxqNONKqrj+ZoxgrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ji9l96Hk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595FQfrG015449;
	Sun, 5 Oct 2025 16:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPVF23H4KRbb2lLHjXqxQetrDyeJXYe4YGDhrbuxxfw=; b=Ji9l96HkCxSgUIRo
	Y4H3b49AlWqVFukZUcrIhURWV3ZKKqaWHnj2UlyIFactFAZN2BzFnq1FMHkJ8qKX
	3eI9tr/ViSlNEqikKSYNh+7BkJiI9IQPm4XxFaGckq96cFuoNAETKXqewO/RRrFD
	ust67IL75S9UKglKXWhCDJo2cSK5EvmD2C7azY0EF/o80R21bVNwgXLZpoE5foW+
	uXZlelVqPm6kfWw8XBvmJ2iKv0N9WB5W39HOEtXTttD3Yt443Y3kX99Lu7BQ30Uh
	iTPpqRh7jSLTLpum8Ecu9YUJqH3Oz+2CVDrALqLTMTsh0sVbqkv5IwpePG4UHQ7G
	lIsodA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6tbfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Oct 2025 16:49:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 595GmjqR008864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 5 Oct 2025 16:48:45 GMT
Received: from [10.216.28.59] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Sun, 5 Oct
 2025 09:48:37 -0700
Message-ID: <aaa9f760-70aa-4bee-b6ab-d6fb02ea3c78@quicinc.com>
Date: Sun, 5 Oct 2025 22:18:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_jesszhan@quicinc.com>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX+DkfXmBAkhpH
 myN+9dwxaBBu7CPbtCbo1FxSkCNQlSQ8Ou+5aEDrqHY4zUg3SbBMxKZ2juSw+nqSJMPBoLOPCwZ
 DbR5otC0a1TaDQdOZ503CccFz32crxJZDhaHhr0vvGZwLo+u+XNYgZpfItu7LQR545dl4Ai8E5I
 96enqek60e3aCplEyzd3wAvqIomGrkCoE4c7/1y0YJ7HZStuaVLMeKyZBO5dPJGowtBDzk2kBIg
 3XwmUPpYTQhiS2b0Ch2D4xcna98Xvo0iEuKq99wOu+Zyykf04Davcd3h+1rrpTvBQsbfwbfX+Rn
 0aAnCtOz9wuEznVuz1vtZGDMPt/ak2mEle1Clny3M7Z0NmF5mTgZJcYTQTDFW+VgH2S2xebbCiC
 dWAWioXzOD1VbYo0RMp8jtNEyZP1GA==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e2a183 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=EZMjUrQSJwNfLy8y1NAA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: 26OMeIVJV4_zqYUtWX-tpwwtUNTJXif_
X-Proofpoint-ORIG-GUID: 26OMeIVJV4_zqYUtWX-tpwwtUNTJXif_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
>> Add device tree nodes for the DSI0 controller with their corresponding
>> PHY found on Qualcomm QCS8300 SoC.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
>>  1 file changed, 94 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index e0e1f63fc45b..834ae0522f2f 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> @@ -4854,6 +4855,13 @@ dpu_intf0_out: endpoint {
>>  							remote-endpoint = <&mdss_dp0_in>;
>>  						};
>>  					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						dpu_intf1_out: endpoint {
>> +							remote-endpoint = <&mdss_dsi0_in>;
>> +						};
>> +					};
>>  				};
>>  
>>  				mdp_opp_table: opp-table {
>> @@ -4881,6 +4889,89 @@ opp-650000000 {
>>  				};
>>  			};
>>  
>> +			mdss_dsi0: dsi@ae94000 {
>> +				compatible =  "qcom,sa8775p-dsi-ctrl","qcom,mdss-dsi-ctrl";
> 
> qcom,qcs8300-dsi-ctrl. You might use three compatibles (qcs8300, sa8775p
> and the generic one), but there should be qcs8300 one.
> 

Hi Dmitry, 

If I am adding three compatible string for ctrl,

compatible = "qcom,qcs8300-dsi-ctrl",
             "qcom,sa8775p-dsi-ctrl",
             "qcom,mdss-dsi-ctrl";

while validating dt-binding and dtsi against dt-schema. I am getting below errors


/local/mnt/workspace/amakhija/linux_next/linux/arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
        ['qcom,qcs8300-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
        'qcom,qcs8300-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
        'qcom,mdss-dsi-ctrl' was expected
        from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#

According to the dsi-controller-main.yaml schema only two strings are allowed one is the SOC specific and other one is generic "qcom,mdss-dsi-ctrl".

Shall I keep only two strings qcom,qcs8300-mdss.yaml and the generic one "qcom,mdss-dsi-ctrl" or if we want to support 3 strings in compatible sting we need to modify the dsi-controller-main.yaml ?

Similarly, I am getting error for dsi_phy compatible string only one SOC specific compatible string is allow.

Thanks,
Ayushi



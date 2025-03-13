Return-Path: <linux-arm-msm+bounces-51258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3406A5EEE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 10:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53C653A8F8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD302620F3;
	Thu, 13 Mar 2025 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oi5dNurE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CC61FA14E;
	Thu, 13 Mar 2025 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856700; cv=none; b=Aa0wgFNouf648G72bYkdGArPCwvtt8LwJjsKUvmPWNV4Wj9v79wNMFXzKkrc/fe6X7dIfVj3OeSb1KY3JUo63fH5cbmmSlQNj1PWVHjHEddHNU8AbodWTvB+l1j228yeJv+GHnmbZlhfhsZpCijDDb5Sd2bj9+mE0G9zgwUItHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856700; c=relaxed/simple;
	bh=IQTJYZcVw5+7o+VKKXg4/rKyXDfRtDS5b8VRdnjkb0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fikGbXLQAQ6Jq4e1qUfQiURztZ5QZQrDnKZ3ZORNu2E15OMe6XeNH+2ymyoKI43tP9iF6I0OmAzdEhbdJVNXlCadI832XN/DqEmSFd/wLMHIKggb+wxInD/GYSCWubyEQ/Nnqu04sm2xgd4oyCVQNMkAfv0OVwUAieCBpIsuN+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oi5dNurE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D7RYbJ022547;
	Thu, 13 Mar 2025 09:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JCsnxEwcfRn2/0Gy0Ea9NtUv3ocEWEmPn1CYcxAIdIs=; b=Oi5dNurEtu3IK7y6
	psHdi7b1YnybXOy75O5farQ/HgL4jaehdala+gbblA+IWl4srqn/gxkWWaE4Qtsj
	ZARYCqngj/eUpCcIEDk8bO10ffM3Xo54mimD1nLk+3PcYnhzNH44YAj9yoKHyCb6
	Q2HNX8dxH8+VzvyBRnV1B1SDrUwZ7cFKeavrwaodODyEJWejwog/D+l3K4WGahJb
	X16oEg/RMIhh4dVzp0lcz94vKmQCVCUtXY7ULYW+uI9msIwm4P2rJxEEvwcJ3jN3
	B+CigHWDjQnvZE8c5h75oJh3Xyj5gjWaQbAIxdlDHELnBJ9tJ6dFAtolqs4fQUM1
	D5ixTg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07g8pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 09:04:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D94UvU015982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 09:04:30 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 02:04:23 -0700
Message-ID: <80439584-c39d-46f7-a62a-82514aa756a8@quicinc.com>
Date: Thu, 13 Mar 2025 14:34:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
        <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SPoiqIhZt7yk4fFulWD81Vhsz2vC7X2t
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d29fa0 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=jBDEQfmX5vGpiVlta2QA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SPoiqIhZt7yk4fFulWD81Vhsz2vC7X2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130071



On 3/12/2025 5:15 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 11, 2025 at 05:54:38PM +0530, Ayushi Makhija wrote:
>> Document DSI controller and phy on SA8775P platform.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  .../display/msm/qcom,sa8775p-mdss.yaml        | 188 ++++++++++++++++++
>>  1 file changed, 188 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>> index a90a8b3f1a9e..628ca68871f4 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>> @@ -52,6 +52,26 @@ patternProperties:
>>          items:
>>            - const: qcom,sa8775p-dp
>>  
>> +  "^dsi@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
> 
> Drop blank line
> 
>> +    properties:
>> +      compatible:
>> +        items:
> 
> contains
> 
>> +          - const: qcom,sa8775p-dsi-ctrl
>> +          - const: qcom,mdss-dsi-ctrl
> 
> Drop fallback
> 
> Same comments further
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thanks, for the review.

Will address the above comments in the next patch.

+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          enum:
+            - qcom,sa8775p-dsi-ctrl
+            - qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          enum:
+            - qcom,sa8775p-dsi-phy-5nm
+            - qcom,sa8775p-edp-phy

Thanks,
Ayushi



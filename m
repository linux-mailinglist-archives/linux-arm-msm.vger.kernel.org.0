Return-Path: <linux-arm-msm+bounces-51262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C56A5EFE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 10:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F026C3A25F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13870262D0F;
	Thu, 13 Mar 2025 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q4GgRiU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4291FBCAE;
	Thu, 13 Mar 2025 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741859344; cv=none; b=CNdV0nSv/DynGxaLWPTZplj1lIwyVUMpj6sgICkZqE/OHynoOleFqstjqvZ7EzAaEQqOie39X7SwwC25p7FNnMuXQaQ87GO+VSDdXWI+2shtdeHml/kmxq3nPMQBqNJ9W811TWMTNP1vjCe8wM1JXtVF1BHgjWHRAZn30ttcBvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741859344; c=relaxed/simple;
	bh=2mwOsBgHwVZsH4BlvuNy5aRO2iLfNreiH0VhMivhBOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S062x4yb4iSH7mkexfCOdorN5OyPW/K177bCFDpoe5KZyNJG1mhx4aOTE44I8c2KA/84W2gVkgGvvhpj9SFAOrV40RuY3/x8WRkLkFNVUQzl8gBNVXWlxgudnOV31nMucN1DgYB69kBAocg3uZt2aGATdxk//HWZuli6cV5KH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q4GgRiU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D0m9jE003543;
	Thu, 13 Mar 2025 09:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGP/KB4+n9JDWeVs1CYtyV9lE8klH1kKAMutxhxApOg=; b=Q4GgRiU+chBTmf4L
	em1koVP0cFXxgZSUaqTBvyAWROIBRZ9T0ye/0jXXVL8jeLBBJP5m3+ZgusQ6v85F
	pfr5M+nVhBQDAjGLcaNKB0S5CgbqIhZzImbVZNJgVswWA3motA40VJQ5Ml/pVoIM
	E5VRjbw9S0YjhVs7omP5kl7e7Outm+UK1Au16O4339CpPoYItzTQUz9G3ubs63TV
	LwGIzgaD4kbuV/4AoasliuoDdjWxQx4HDPSipErmkfgmeesZAKRuBuhD12wFw1Qz
	dRFn/hKkOkrmtybWYt7O8jvr8fHpwzvjqedGP1nAA0fmRm6CVFfG8KflAT6i2mFc
	0ocoMw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96yb8vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 09:48:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D9mcO7022527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 09:48:38 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 02:48:31 -0700
Message-ID: <c1e554f3-cf4f-42ba-aa75-94c8b0a13ff3@quicinc.com>
Date: Thu, 13 Mar 2025 15:18:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] dt-bindings: msm: dsi-controller-main: document
 the SA8775P DSI CTRL
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
 <20250311122445.3597100-3-quic_amakhija@quicinc.com>
 <20250312-fine-vermilion-grebe-bdd5c9@krzk-bin>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250312-fine-vermilion-grebe-bdd5c9@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QBVGklf5M8TFsG4hVHR9MLeJ8aXV5AWU
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d2a9f7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EkG_hp2kC7S3OihkgwwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: QBVGklf5M8TFsG4hVHR9MLeJ8aXV5AWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130077



On 3/12/2025 5:14 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 11, 2025 at 05:54:37PM +0530, Ayushi Makhija wrote:
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index ffbd1dc9470e..3621e3f12b65 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -23,6 +23,7 @@ properties:
>>                - qcom,msm8996-dsi-ctrl
>>                - qcom,msm8998-dsi-ctrl
>>                - qcom,qcm2290-dsi-ctrl
>> +              - qcom,sa8775p-dsi-ctrl
> 
> That's incomplete, where is the rest of updates in the file? Not
> needed?
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thanks, for the review.

Each compatible string has a different set of clocks which are associated with it.

Sorry, I forget to add qcom,sa8775p-dsi-ctrl compatible based on the set of clocks which are associated with it.
Will add it in next patch.

--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -349,6 +349,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sa8775p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sm6150-dsi-ctrl

The remaining content in the file will stay the same, no other changes are needed.

Thanks,
Ayushi




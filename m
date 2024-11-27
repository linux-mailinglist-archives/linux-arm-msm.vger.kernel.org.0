Return-Path: <linux-arm-msm+bounces-39298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B02549DA69D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1657EB28965
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4381EC011;
	Wed, 27 Nov 2024 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LwvgfM4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B01EBA0D;
	Wed, 27 Nov 2024 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705389; cv=none; b=HfBB2gHeUGXMveY/XeEfQVAXcagMwyQlEl9ktEAUvobpF7cIY7jB5hIT67c0EWo2H1uAqRu5+xwW7n9aKpUp5m77Gnbg81kryCniV5auRPw8YpxAuKzP3r8m7MVMkBpccAzfLGHBExkF8j9c4qjtO/OPUWshMUESQi26ULAZiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705389; c=relaxed/simple;
	bh=zfB/B7j33O0/ulmzReco0gyH/xx2bX4xd7XmtrWGZoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iHLUtbuKUSkv5tWw3GPPqh9R3OBG/8YWvvlxXelL8huJ5KLMtifKE3g2GiKiznDg75TvGrB/qxMAUgY6dxa09ILDbFW3mK85eLn6BSX3sExo/eef4q35Zt5HTw9XEwuhx9wF5FTbIWi5f8/20FmXe0zFoSIySDkW+aDu7pWa9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LwvgfM4Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR8VR3L014036;
	Wed, 27 Nov 2024 11:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxTVMs7EiXRpQddOUj2sdWVYYc7JjTdN36bHFOB8yKs=; b=LwvgfM4Q3GBPUUVx
	VmLI7+nb/xywNu4cBojhxosuivySKcfG7uEMuEef71TbaRu9csFd6mG9M9cedqzO
	1LoXLTfc6IYes9G4OvW+zwU5RNrfOXmYq8W1orzauNmLvjVpvLtKTQOEyN4Qjn2l
	gUAEMu2OsQ9FJxUe0uduB4ilGk0ssKcyPPSqVEa459eNYxE7E0zCB+/Q/oqkowJA
	whbTXvFPPh1+xhgvL+I4lD+FMmZBiTfU2xpJiIp7MJDYWRn7/yrzssJPQE33hkfL
	tM08M0UeCLuNTBzRIQ5/ZCwrzwSHgiJRqOVzY4wBpEK6yX5pbuL+LUzt8DnRAlC0
	WUHeSw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435epqb8tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 11:02:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARB2s8Z030733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 11:02:54 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 03:02:48 -0800
Message-ID: <f433283d-e203-41f7-acc6-59fe606722a5@quicinc.com>
Date: Wed, 27 Nov 2024 19:02:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Maxime Ripard <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob
 Clark" <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, <freedreno@lists.freedesktop.org>,
        "Simona
 Vetter" <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, <devicetree@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
 <173269567235.2233485.7286772244329561840.robh@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <173269567235.2233485.7286772244329561840.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: asWNzpC9PAqHrSdI-5PoY-sJBBxeMZ-4
X-Proofpoint-ORIG-GUID: asWNzpC9PAqHrSdI-5PoY-sJBBxeMZ-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270089



On 2024/11/27 16:21, Rob Herring (Arm) wrote:
> 
> On Wed, 27 Nov 2024 15:05:01 +0800, Yongxing Mou wrote:
>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 239 +++++++++++++++++++++
>>   1 file changed, 239 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dts:26:18: fatal error: dt-bindings/clock/qcom,qcs8300-gcc.h: No such file or directory
>     26 |         #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
Thank you for your checking. I rechecked this file and indeed found some 
issues. I will fix them in the next patchset. But i did not see issues 
related to this header file in local. Maybe it is dependency or tool 
issues. I will and update tool and recheck this issue and fix it in the 
next patchset.



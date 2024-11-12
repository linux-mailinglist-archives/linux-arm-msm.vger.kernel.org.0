Return-Path: <linux-arm-msm+bounces-37691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D49C63E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 22:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE432B27405
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 19:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E04218585;
	Tue, 12 Nov 2024 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QZAZCy3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786D20409F;
	Tue, 12 Nov 2024 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731439011; cv=none; b=RVxn+U+um5V6KWcGAUJDNgLc8HIZD8v/OuQWtp3WCL/hY5gZcfPTrFaFNc8UlhL3sZ/yQ1ChhVK/ubGaWkjR6X3xyWagnZ6laa8mdWJgZXhCgYZn/SX7pCm99VBKt0EEkkKVzFNtNB2+TaakCMuSSy93JUKdoJmRE4phO4GtZzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731439011; c=relaxed/simple;
	bh=OLc/nSa6YIDdjEk5/DIbJm0BBTtyrdmn6WYb8Pv9U2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H+7i8lWj5Dp3MFcpBbVJe2xCJ0QhBFYYjPQwm0HtN8GCFFAwpAD3Yj614cypoDWzNCy78QJOFX5CnOzMoKGh6iReuMecBHu81e8ezvItUc5985k5cJUA0mfYp7u+Z8ZkmQq3aqXLqMUKGJBkQtsrV4dAhS4OTiGacBpnIxng9hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QZAZCy3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACC5fFT024633;
	Tue, 12 Nov 2024 19:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZC9KTm2BsJZJT6pKbnh61I8TZQkEIC6w9jxpnI/HUDo=; b=QZAZCy3ddScm8E6V
	zGxY2vxQ0PeKr9MVUgRp8c2L1qq29ioIiAUIro4R6tABUR3rNikKnjoMLLlSDD6c
	CIi5zuNQXr1CdpvJnO8G+7vrZkbdG0edo7tkrgpQ6acimKsdnPPh8ARKEYWUMfWY
	PZy45FYezBlPuGxRvU20ui3oMoHxUzD07ciVp0oOBca97GXaYt9kn0uKuFKDsZDN
	95gFgj1FIjoz4Ed0+cG+tvXmvh7u6v9LRsj9X7FbcOoPWwYMV7aVapttVRyWcWUq
	5s6XLIHC+PzuqVncA7HEF4cVEmz9aPqLjNxtdcwjIfJd0NsdPsraZwXGtI9iW6JJ
	gDPiKg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gm0brv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 19:16:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACJGakf025857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 19:16:36 GMT
Received: from [10.71.110.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 11:16:32 -0800
Message-ID: <ba5d51f4-edfc-4bc5-a3d2-1a2d24ae4403@quicinc.com>
Date: Tue, 12 Nov 2024 11:16:30 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom, sa8775p-mdss: fix the
 example
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org>
 <643d2935-65ce-4d86-9be6-c2faa1956365@quicinc.com>
 <CAA8EJpqBouv-f-QMpZ+hrA-vF4ojhUWBn5yMqYYB9LpW0TACdg@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqBouv-f-QMpZ+hrA-vF4ojhUWBn5yMqYYB9LpW0TACdg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3_7bhItpYW0Ha-wzOcNwjJBAxiRO798S
X-Proofpoint-GUID: 3_7bhItpYW0Ha-wzOcNwjJBAxiRO798S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120154



On 11/12/2024 5:15 AM, Dmitry Baryshkov wrote:
> On Tue, 12 Nov 2024 at 05:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 11/11/2024 7:21 PM, Dmitry Baryshkov wrote:
>>> Add p1 region to the list of DP registers in the SA8775p example. This
>>> fixes the following warning:
>>>
>>> Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short
>>>
>>> Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
>>> Reported-by: Rob Herring <robh@kernel.org>
>>> Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
>>
>> Thanks for the patch.
>>
>> I think this link has an extra 'c' at the end.
> 
> Oh.. Can you fix that when picking it up for -fixes or would you
> prefer to have a clean version in patchwork?
> 

Yes, I can fix it up while applying.

Thanks

Abhinav
>>
>> With that fixed,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Changes in v2:
>>> - EDITME: describe what is new in this series revision.
>>> - EDITME: use bulletpoints and terse descriptions.
>>> - Link to v1: https://lore.kernel.org/r/20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org
>>> ---
>>>    Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>> index 58f8a01f29c7aaa9dc943c232363075686c06a7c..4536bb2f971f3b7173b8807f90c9af3e460bb01c 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>> @@ -168,7 +168,8 @@ examples:
>>>                reg = <0xaf54000 0x104>,
>>>                      <0xaf54200 0x0c0>,
>>>                      <0xaf55000 0x770>,
>>> -                  <0xaf56000 0x09c>;
>>> +                  <0xaf56000 0x09c>,
>>> +                  <0xaf57000 0x09c>;
>>>
>>>                interrupt-parent = <&mdss0>;
>>>                interrupts = <12>;
>>>
>>> ---
>>> base-commit: ff2ce06d5e28be5ee399a2ff894d6a551c70a318
>>> change-id: 20241112-fd-dp-fux-warning-c8764c93f787
>>>
>>> Best regards,
> 
> 
> 


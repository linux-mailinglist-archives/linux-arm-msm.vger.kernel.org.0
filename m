Return-Path: <linux-arm-msm+bounces-39304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1235A9DA70E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBDD0282D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02001F9A9C;
	Wed, 27 Nov 2024 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MydWR7uE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152881F756D;
	Wed, 27 Nov 2024 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732707998; cv=none; b=Fa4ginQzbcXn1QzFMzeu7z9iXFBhuUaLvPnWdFFjoFfsXEnhWz517oyp1LmcRx8jL2Cdv9BgS4G0ar5O5RKumJ+/2dAHU+s5JQGlJgl+82fG6KL2Z6gIf3uJYTTaWC8NfDbomoKBilGPggXmKHB+XwLVSLfaegQ2d4YmDynWkwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732707998; c=relaxed/simple;
	bh=vlL19C/qQVIzaDwmXl2UumgSU4dKfAIK+3KBrEf4c5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S7DV6fs3eRjQLT/Dw8N8U8ALNFUC4Un3gOToGE580r1X0dxceJphi1xGocosDusbkCW/ysRRt+irfOZtQxtLZrLQwUymAt1gXeN5rJ69qU/YvDTaC1LQJ4O14o8uQk3LLyskKAUKAeLH14dnv8yt9Zn3TTtmlHcCE9WCi1qF6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MydWR7uE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR8rnPA007930;
	Wed, 27 Nov 2024 11:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkf0l9uy+eIhnpqzixpH1Jsqb75R/Ft64j6jabRq2is=; b=MydWR7uEDuNr5YLO
	1CxlLzeXHy9qvmL/Kl8axlLpl4v0R5venl42r6/2ZCvjQ1kxYdcowSKSTp8DDJBn
	Xh0D6/s9Sqc9HPXPH2aIOuxUYXC7WLejshm5IVIXVfRQFmX7EiodHFuejExMo/q9
	ukbv4nKc7NXwRa0+giJIuz571g0WToy1sAvYL4KkZqyAHJLKX0KUblX7pZIe6lLO
	RjrVJIkMfuOqlCI+kp0GEbliEGeGB0BMtfYKkT2FVgzrMsWuwrd4P9+clDGvtSZo
	o6L06JsvyJdxFzEIGVOWVjpzlV9zU7VLSYaB7Zo5BJIMY9ZkBL8FN2OO9a76uRtm
	u3ypzA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435ffyu8ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 11:46:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARBkFnj008885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 11:46:15 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 03:46:08 -0800
Message-ID: <d170e2d7-eb7b-4141-8516-2a3cea429b67@quicinc.com>
Date: Wed, 27 Nov 2024 19:46:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Display enablement changes for Qualcomm QCS8300
 platform
To: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <675c41cb-afa8-4386-8dc9-026a36bc1152@kernel.org>
 <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
 <42a8565a-6dd9-4cb6-a83b-22e779b5f31b@quicinc.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <42a8565a-6dd9-4cb6-a83b-22e779b5f31b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _oJ1GmAeXHuiqQybL3IZZlaOfJFMmfZT
X-Proofpoint-ORIG-GUID: _oJ1GmAeXHuiqQybL3IZZlaOfJFMmfZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=937 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270096



On 2024/11/27 19:06, Tingwei Zhang wrote:
> On 11/27/2024 6:54 PM, Yongxing Mou wrote:
>>
>>
>> On 2024/11/27 15:13, Krzysztof Kozlowski wrote:
>>> On 27/11/2024 08:05, Yongxing Mou wrote:
>>>> This series introduces support to enable the Mobile Display 
>>>> Subsystem (MDSS)
>>>> and Display Processing Unit (DPU) for the Qualcomm QCS8300 target. It
>>>> includes the addition of the hardware catalog, compatible string,
>>>> relevant device tree changes, and their YAML bindings.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>> This series depends on following series:
>>>> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch- 
>>>> v1-1-7a974508c736@quicinc.com/
>>>> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi- 
>>>> v2-0-494c40fa2a42@quicinc.com/
>>> Above was not part of this merge window, so nothing from your patchset
>>> can be merged for this v6.14.
>>>
>>> If you want things to get merged, I suggest decoupling dependencies.
>>>
>> Thanks for reviewing.Can we keep the dependency on above changes and 
>> merge our changes after the dependent changes are merged?
> 
> You can move device tree changes which have dependency to a separate 
> series and keep binding/driver changes here. They don't have dependency.
> 
Got it.we can move this dtsi to the DP enablement DTSI change series in 
next patchset.
>>> Best regards, 
>>> Krzysztof
>>
>>
> 
> 



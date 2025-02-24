Return-Path: <linux-arm-msm+bounces-49193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBADAA42C33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 20:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407C23A92DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 18:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD55266EE8;
	Mon, 24 Feb 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HkfYIwBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC69B266B77;
	Mon, 24 Feb 2025 18:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740423574; cv=none; b=LSQrcV5q5ynX7EERCB+MY0mA7H2T52P+Q09R3AyI7233F7+cMsh3Qf1zv8Sw+a6n2ByWOZ7xuNK7dKcJ/poxzWnnsckq0XXLNAnsVzRXBO9RkiwNW4EuscYrPdmoljSiC97+DSjVzGykdL31nVw225iYvDcVFj/iZAa0w30op8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740423574; c=relaxed/simple;
	bh=AwdzRDLRxrAa+DwJG43Ykw1x+ugkSQyavOnKvWa1C38=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GNqqG39VkzC908ck1MmsYAJvypXSCSGb2RWznGPh/5qCzEDTzROT1p23U4M1VLwaFJFqyNuSJgiSJ26kOM0FpK+8RQD2DakdP0TM+weN5VvwBrsbxu1+j7cek8gHlNLsWPQuPxSv6a8iXtFRovZgr3Axh0O8bJI806GdW3lGT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HkfYIwBX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ODDTv8012179;
	Mon, 24 Feb 2025 18:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iB0zlCvg2FIP9w2eDttuFf7K9oZ36VP0mfOhuZax8HM=; b=HkfYIwBXEayVKY4J
	2GZR5DFPbd41G1OPmUnkjFv+oZ5zNYBzt+Ei5l7+XIWpFJJerfXCHRzeENlw2573
	0sC95EqVa8j0M+2iLbz2++lYwl9dTfPOVkCqyi8YQBmlx2jI375wsTKM1QehsCqH
	Olg1Xalpab8P8i5VW3poSh+iir0DCGIRyYFurcZ5sHktuDpKouu2cb1dCSz102Ix
	SoAzhOdfFiApkAArJlovBnBpzWDauCba3sORRUvtZA8ROU7DQvmFWdTFC6ykE2RO
	AI6FIJNwoc/7OsHvjpBMAKIKGG4hNKHEq5Qnkm3UcOYu+3GvJe26BkcHrUKWq/sr
	iXoaTA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 450kqg2ekc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 18:59:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51OIx8uR017973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 18:59:08 GMT
Received: from [10.110.85.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 10:59:06 -0800
Message-ID: <4e82404a-0ea5-4641-829a-bba666edd352@quicinc.com>
Date: Mon, 24 Feb 2025 10:59:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek
	<jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Srini
 Kandagatla" <srinivas.kandagatla@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
 <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
 <2dfe466c-ad94-4683-a2e9-a49e77a61f4f@linaro.org>
 <h2shpen65r7v4in54avsez7qtlwojbt2cthyomqrsgs5ewprwb@bn53suqrzkac>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <h2shpen65r7v4in54avsez7qtlwojbt2cthyomqrsgs5ewprwb@bn53suqrzkac>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vYKClvgaWABcBprHm3ba0mVLaY9iAKAI
X-Proofpoint-ORIG-GUID: vYKClvgaWABcBprHm3ba0mVLaY9iAKAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_09,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1011 mlxlogscore=894
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240123



On 2/19/2025 9:08 AM, Dmitry Baryshkov wrote:
> On Wed, Feb 19, 2025 at 06:02:20PM +0100, Krzysztof Kozlowski wrote:
>> On 17/02/2025 19:58, Dmitry Baryshkov wrote:
>>> On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
>>>> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
>>>> fully compatible with earlier SM8650 variant.
>>>
>>> As that became a question for QCS8300, does SM8750 also support exactly
>>> two MST streams?
>>
>> v1.5 of DP (starting from SA8775p , then SM8650 and SM8750) support 4x
>> MST for DPTX0 and 2x MST for DPTX1.
>>
>> The DP in SM8650 and SM8750 are identical, according to datasheet (v1.5.1).
> 
> Hmm. This also means that QCS8300 is compatible with SM8650. I'll let
> Abhinav comment here.
> 

DP version by itself is not a good measure of whether the controller can 
support 4 streams or not.

Firstly, sm8650/sm8750 do not have a DPTX1 so we are only discussing 
about DP TX0.

Coming to the QCS8300 Vs sm8650/sm8750, even though the DP controller 
version is the same, there is no HW support for more than 2 streams on 
sm8650/sm8750 because there are no INTF blocks to drive 4 streams.

On sm8650/sm8750, only INTF_0 and INTF_3 can be used for DP. Hence 2 
streams.

Whereas on Monaco, we have INTF_0, INTF_3, INTF_6 and INTF_7 capable of 
driving DP. Hence 4 streams.

Let me know if there are more questions.

Thanks

Abhinav




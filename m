Return-Path: <linux-arm-msm+bounces-47929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C94A34B1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D687162C68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CC728A2B9;
	Thu, 13 Feb 2025 16:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qpg8VJKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5628A2AE;
	Thu, 13 Feb 2025 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739465784; cv=none; b=D8c8ZZ3h6dedjuarF+Cc15YkzrbWsiOpTPO4CTRmgQZKzDQ3/cMkLr6kVPSG6nEIlm2KdnJX5slZ6BEVmL0gElhpI8tUu3wGQq4SKo62FIAp4YIAPa9t3V+T4CBZdSuQePRTOI1QSaWaikAov3gYxYnHxueInd3DUA3jtqrPIbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739465784; c=relaxed/simple;
	bh=8zma9Zybu/PvfJSuoKw81ZyPwYxJFHyoN7r5Gbuegck=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WP8D+1rveNYaUgyp1eQMF/X+/t1EhXZk/3fJegLwD3OtlzyPxeAoCxF9SJj1JYZqxGIGepotSx7Rae4Y3VcvLs16IOBlhAeZSHrkj2MLPgnfIOatJRy7mnLfy5BQ4b0ksQmCTxuBO8LKMV2MrcoFqB/ANIbEr9PrFBhq51eWID4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qpg8VJKQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DFh5kN008240;
	Thu, 13 Feb 2025 16:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RH5qFipI0PyKgFuJFOKA5p2Yz9Uz3CCq5uaTJ1aCaw=; b=Qpg8VJKQMRLS1MPx
	A2JWu12E77G2IunafuvtAC5HCSLio7G1x4lvGdWeddXl3CXmaHp3B933FTYwz8Kp
	QmBu3FcgFlk0GtfXgarZnMUQHH1zHRG/c2lrOlzXvKJyymvZQG4/ACxYys8EmCwB
	yuvJsSZGwMhoZkqVbRTdGIAHA4vHLo7Yblh3hoIp1Ckg+FOdbV6DfHRvZyV+FkVe
	YZD+YWPEbZONgHLFXJxHaJtFUTvsuvCq5+Oksfg38d2MWNDPAPzRr1bSDY3wnWC6
	O+lLuNurutR0jICRr+IY2VXMCOCoNJrI46LiM/B0N8tLIxCMzWsASSVoS7pfSJj1
	Ua3hPw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewhbj6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 16:56:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DGuAVb001258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 16:56:10 GMT
Received: from [10.216.44.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 08:56:04 -0800
Message-ID: <60cc3e46-575d-4a79-a081-f98f4d86a67d@quicinc.com>
Date: Thu, 13 Feb 2025 22:26:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] EDITME: Support for Adreno 623 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang
	<quic_jiezh@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <wdeqpz7ckpzw5sx7pigcp7fjx7nf4irz23kvj6xwamv34vfyba@rwzavxd5o6o3>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <wdeqpz7ckpzw5sx7pigcp7fjx7nf4irz23kvj6xwamv34vfyba@rwzavxd5o6o3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T9pvpV5GpHJ9GlmYMvSln40Y1D-vfS2K
X-Proofpoint-GUID: T9pvpV5GpHJ9GlmYMvSln40Y1D-vfS2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130122

On 2/13/2025 10:12 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 13, 2025 at 09:40:05PM +0530, Akhil P Oommen wrote:
> 
> Nit: subject needs to be fixed

That escaped my eyes. Will fix in the next rev.

-Akhil

> 
>> This series adds support for A623 GPU found in QCS8300 chipsets. This
>> GPU IP is very similar to A621 GPU, except for the UBWC configuration
>> and the GMU firmware.
>>
>> Both DT patches are for Bjorn and rest of the patches for Rob Clark to
>> pick up.
>>
>> ---
>> Jie Zhang (5):
>>       drm/msm/a6xx: Fix gpucc register block for A621
>>       drm/msm/a6xx: Add support for Adreno 623
>>       dt-bindings: display/msm/gmu: Add Adreno 623 GMU
>>       arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
>>       arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
>>
>>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>>  8 files changed, 171 insertions(+), 3 deletions(-)
>> ---
>> base-commit: 6a25088d268ce4c2163142ead7fe1975bb687cb7
>> change-id: 20250213-a623-gpu-support-f6698603fb85
>> prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
>> prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
>> prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d
>>
>> Best regards,
>> -- 
>> Akhil P Oommen <quic_akhilpo@quicinc.com>
>>
> 



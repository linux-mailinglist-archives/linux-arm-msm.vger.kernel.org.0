Return-Path: <linux-arm-msm+bounces-49221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52CA4357A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 07:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF193A3496
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 06:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920782566D1;
	Tue, 25 Feb 2025 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H7Jep5N7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893A254AE0;
	Tue, 25 Feb 2025 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740465427; cv=none; b=ZfMccuDRT7L2fqoDaTWEB+6RA0w/NsPzb+GfzxTC+IL8a1OQsa1SVv2h4J9CjaFdeCjr0qTiy3gq3iW+vB+elxNz+gl8LcF1HXnRa09gP/xldzqL7x94eT6V4GpX7nREKex6SDx2H4VmckkFMWk6kLsURuczdzhWe2saAZme/cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740465427; c=relaxed/simple;
	bh=CygHYav3x+5x5+yb+++lfNtySbmnAkHqeVWsdn8wP/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cte9tD9wVi/VJiNOn/5C3Qfab+S0IWWawm6QWHYyNoUWrj99q21XK+74ED2FNE6/V0kLaSAqRTxB2eN1wyBps34QRyDHELsHN0szFEJIIFCg1l5LOHqFqPEVo+3KTdJzgrXt0Ayb5bX/BmkTHk0gpj4+2k33Fx00rLtFrp0HZMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H7Jep5N7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OKONt9020059;
	Tue, 25 Feb 2025 06:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFTr1omY/36Zc/A0Hj9WYT9KmGBOYpdjr/SrE1PVDp4=; b=H7Jep5N7z00MHWXJ
	sKfHIuUlL9kj2oZV2V4Izh/6gU4JPgB4+Wl9tgWJKGw0XFsLBB28ST8667de3c2B
	/jcM5a86eYj/9IBqA7E+7eUkVTYPJ0Qjj1IwWv9fPxF2t/ErVBODZRhDjZWEe63r
	HSyD6IbfSOys0F+rbk5Ng60jJf/ejZ6olQ3WLC1PACzuz1fem6gPIQySZ/hZV0bQ
	onh3Up/nKRUheGY8h/EN5ZLFEkRCocsdPkBFqEoHM8lchfmUwIflrKhC1zswu7OB
	XMOXf0iVFnu+BIqrBRaQiIDcNA4gUD6TBf7s5waEeFpIsjJZibg4vD+pcV0BG4oX
	tdI5jA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6t2qnwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 06:36:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51P6arZm031164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 06:36:53 GMT
Received: from [10.216.12.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 22:36:46 -0800
Message-ID: <ae1cc6be-4834-4266-bc77-54d25f72fc96@quicinc.com>
Date: Tue, 25 Feb 2025 12:06:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/a6xx: Add support for Adreno 623
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
 <4a3eec8a-4f71-4ac7-a6e6-0e8490c020bc@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <4a3eec8a-4f71-4ac7-a6e6-0e8490c020bc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2yiweo9wjLZDJMIeMdho8gTahRfJ1uGH
X-Proofpoint-GUID: 2yiweo9wjLZDJMIeMdho8gTahRfJ1uGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_02,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250041

On 2/13/2025 10:51 PM, Konrad Dybcio wrote:
> On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add support for Adreno 623 GPU found in QCS8300 chipsets.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>>  4 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index edffb7737a97..ac156c8b5af9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
>>  			{ 0, 0 },
>>  			{ 137, 1 },
>>  		),
>> +	}, {
>> +		.chip_ids = ADRENO_CHIP_IDS(0x06020300),
>> +		.family = ADRENO_6XX_GEN3,
>> +		.fw = {
>> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
>> +			[ADRENO_FW_GMU] = "a623_gmu.bin",
>> +		},
>> +		.gmem = SZ_512K,
>> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> +			ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.init = a6xx_gpu_init,
>> +		.a6xx = &(const struct a6xx_info) {
>> +			.hwcg = a620_hwcg,
> 
> On downstream a663 hwcg table is used, with the following differences:
> 
> < A620
>> A663
> 
> < {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
>> {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
> 
> < {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000777},
>> {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000}

Thanks. We ended up reviewing this with HW folks and found that the
downstream code is incorrect too. Will send another revision.

-Akhil.

> 
> Konrad



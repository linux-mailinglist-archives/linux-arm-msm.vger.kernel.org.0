Return-Path: <linux-arm-msm+bounces-44200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BEDA049AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 19:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 117BD7A103F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 18:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B01E1F3D5D;
	Tue,  7 Jan 2025 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OgspwuQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41A1F4289;
	Tue,  7 Jan 2025 18:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736276052; cv=none; b=e3DXL9dBj/A2vslVVVHg8X+tQy2lpScOVp61mKNours1ADHuxhYuZSOzf4AN+MuZx4PjQbikWGrqdn2tbd6JwftJYM82oRRpGdH98J6h1E3oJ3ONLBUIJfkFSeNXoRe0NRRP8tnN9XnUlmd1sqmZspTV1JPmQf6zRKkylTowmho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736276052; c=relaxed/simple;
	bh=85vqaYa13ZD5pJOaqDqP9O5GkQEhOW1xNrLfQEd6ckQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L+UXdRHPxVCVlVfGH0KXii0jNbCI3FDIirTVSKfojUKCwnTN/hsyq47us9T6HZTCpupIra8YYRY70eHZdU8mCEDoiJ7hULsRXV+59sHHq9fLZ3zwCaQkBCZFG2HJ2R5v1C/xzbc9kvfLczTEnxgICTRvMHp6IRmTmDEcU54+86M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OgspwuQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507GrmBN032013;
	Tue, 7 Jan 2025 18:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEFvEbFGKcXaomdgv2ruDFQjFc2SeWNC5S+Y1l15Zbc=; b=OgspwuQ2dP7ogGAC
	j7Ds19q29ykYQZ7i51XeBrS709gVty60hOiyaTn3Z2JifYRwRgr3W8ujCHJHh28c
	FYZPRSdmfZQc9jFyWGr8Bzo8Xk5ppcKSbTj2XDOpYp/xUo+grq6sG6ZZSAjmcRrc
	yB7Y9P6Ot2nRd12dsRKJijCgedOgXr95zk3nNJNgFQIFS3u0AuHQ6haCcZa0W+v8
	F1D9MgO1oxQwj3s+VjQh6c9lNv1P0HUT9bVTl3wci+DYwgFewpzQIqW3Mgx0QYT6
	vvXITlakYtCKwqx6R+npmxAjWum8EVROdYygwHQMBAJv2XnNUAMIOGYnTklAVn28
	EEQBBA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44186ng994-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 18:54:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507Is06U000535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 18:54:00 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 10:54:00 -0800
Message-ID: <317ba70f-2cb3-4fe1-893f-5cab1e24faf1@quicinc.com>
Date: Tue, 7 Jan 2025 10:53:59 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
 <6etymzv5vziexe6kcgzas6pr2qgxbgsw3weobydwst7np77col@jszgjhnvcsy7>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <6etymzv5vziexe6kcgzas6pr2qgxbgsw3weobydwst7np77col@jszgjhnvcsy7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MWt8NvbFwRDODilkBrcxc145wQkoh7fP
X-Proofpoint-GUID: MWt8NvbFwRDODilkBrcxc145wQkoh7fP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=944 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070155



On 1/7/2025 3:46 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 07, 2025 at 09:16:21AM +0100, neil.armstrong@linaro.org wrote:
>> On 24/12/2024 05:25, Dmitry Baryshkov wrote:
>>> Enable CDM block on all the platforms where it is supposed to be
>>> present. Notably, from the platforms being supported by the DPU driver
>>> it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
>>> (DPU 6.9)
>>
>>
>> Can you specify how to validate this ?
> 
> Use YUV for Writeback or DP output.
> 

I think writeback is easier, finding a DP sink which supports YUV has 
been hard even for me.

>>
>> Thanks,
>> Neil
>>
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Dmitry Baryshkov (4):
>>>         drm/msm/dpu: rename CDM block definition
>>>         drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
>>>         drm/msm/dpu: enable CDM_0 for SC8280XP platform
>>>         drm/msm/dpu: enable CDM_0 for X Elite platform
>>>
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>>>    26 files changed, 26 insertions(+), 4 deletions(-)
>>> ---
>>> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>>> change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
>>>
>>> Best regards,
>>
> 


Return-Path: <linux-arm-msm+bounces-53667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC4DA82A3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62C819E3AC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29812676DC;
	Wed,  9 Apr 2025 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWte/KnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED582676E0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212161; cv=none; b=DQbXtvtdf+S3y5CGPEX0pj1/hcXBJemGKVU0jgT8Sm25BYImwg3fz6mA9ZyaCXl9DD/UoBthSrur+u3aAyvjAHVJwolwh7GtMFGVuJCoCR+xaGH6gxTN3HndYj/Fwi1AFJi8P9FXh/NH941m56iXtPYEDnOuLd+//Z2PHtLN0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212161; c=relaxed/simple;
	bh=WLwrJq8MGT0Fpx4qdvhmpxgsjJjSZssAnDvzvvE/6wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlZjuf2i6jRq6aSsUHbVhi1mao1p4TlcYgfQnbKQBPSAiseVkrmHpT+1xYndnN++1v7mgCQt4EptORAQfMuYdMP4gr78ISm7ztV/Q5dITClFxWECwwvJ+TMGpevfJKRptS6Fp5KYTQRM/l/EYA+yjL/042xrvYxfPtPwSTRYH2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWte/KnC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53981KmA027508
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 15:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCuvAY1136gR39qITiq/pHL207Ayurzq2f2+DfiLkY8=; b=FWte/KnCblohf2nC
	y2Vv4N1lU7dFggpsR0imf8eDB8KJptYiL0xhNftuZaEItLjxG8ewnvVIFZ2Iy0Op
	AGeezaP9MxthirZHk7Lp2E+dmRvWXBcS39QJ+7bQ0iDPphp0gdbg1lG7sm3ows6p
	qEVqF26UgPbhX7OCFdYoHoEPlUtLufIkEykMeK7FKXk31hd8xwg80S7K4p1DTcFa
	7/lRpO4eYLmsN7PQyOF52HmMvt54VjTYp4LRVsafx8fSAiBqE1vq1OoZxuODsRzG
	/eJaGSqaqN6Zec4tGCm/ywAskOF08oom6xvINDw12St3Cw3hkuzZvhBPA5HGzP7f
	0lrrLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrkx7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 15:22:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5530c2e01so66124585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 08:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744212152; x=1744816952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iCuvAY1136gR39qITiq/pHL207Ayurzq2f2+DfiLkY8=;
        b=ppvjByv1+DxQoM1Xo0hUOYvwnTfteaKFE+TS+mgEBzsASAtF59Idlhsf9PgcODHqKV
         uGXbjISS8J/ZPVFkrxdTvgx4+mOp9AWw0dvAbufJbxLECQsBArtzaP0VD92Z7SWNXAlV
         qN0j0dnxr919TyAeeejfSlMUbjNWTwvWHez5c9H+VFY+Rg5ikHLsUPTvbbAcYvApHLf7
         5OwqXxXZPAPwOjBBR0d6cJ4I5nyltGJANtLjzxd/MnLrTvkamPSyLMP83PPZNpX+NPwQ
         Re28OXskg+2EnrskShx2jc5LKJP3pxbdVk5pT1fkQ6Z/0FDmyAjwp6Y+Ydgr4q+9QZmL
         bOLg==
X-Forwarded-Encrypted: i=1; AJvYcCWorDHsLP1P2VI+xORBThbprU7F+br6D+QIMpDWIwpXDtFuvBoJBMfPGMSlzoOJ3yQap/PuLf+YAmbktzSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzce1Msx072JPxDL6h0cAUxQB6k3aD/fK1Fx9jVXSPBJh4B39Ci
	g43Jh5uo+cAkScYgkLdmN1z+G4s8ryQSywbtxhb26qGtjiUtXEssBM8gEX8ZbVWBR6TYI38Tm9F
	ObjCZv0fAg7y+KO1DcH3eoTZ9Ba4RyaP/8a9KsDqtfxM57NIWqzprRS5OgVEeiJV5
X-Gm-Gg: ASbGncsg9simtryvtBYlOYbqKgBNkPTt3O7EdKUGCaeyDJHsETV1ayugqHUaUUt/FUN
	Kjv9zV8L2eGnboPGxCPbp3Jb8TnrPEGPXHf0RMy+t89Y4lT5YMd9Q2FC3NIfDNYIVX96mGp/1Bg
	LCX1dvwypI1NYrNYyBbbOXGAAHs+wgE0/wmwO4nhaKwcA8dfSyTty20kPhDdgieef6f5NmAGSwR
	GeHYEvSDbFXqX0eFaQXIcBPrI5j8wNG8gxkJy59ZGyA3WgSXLnN1G4o6roV7EasqeNkSEhMhkb4
	Or4e9zv4og4+os/eadEoNNUWS88UXb4RT8pb/p4SortJDu5gZ6MPEo65kQCqZ9BGGA==
X-Received: by 2002:a05:620a:2616:b0:7c0:add8:1736 with SMTP id af79cd13be357-7c79cc4b3f1mr182217885a.13.1744212152379;
        Wed, 09 Apr 2025 08:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu16PD6OWFhO9+2EVDMjvLbDZARn5f6zRS1+14nIt+zna7yAHulu/WcriBf7XUUO62wWUHLA==
X-Received: by 2002:a05:620a:2616:b0:7c0:add8:1736 with SMTP id af79cd13be357-7c79cc4b3f1mr182216085a.13.1744212152091;
        Wed, 09 Apr 2025 08:22:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb414dsm109595366b.121.2025.04.09.08.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:22:31 -0700 (PDT)
Message-ID: <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:22:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SNZT5rxgPslniR2laRUcaVb__0ZtfgJ-
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f690b9 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z2wkywZrCN8y_YYJSgYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SNZT5rxgPslniR2laRUcaVb__0ZtfgJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090097

On 4/9/25 5:12 PM, Connor Abbott wrote:
> On Wed, Apr 9, 2025 at 10:48 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Highest Bank address Bit value can change based on memory type used.
>>
>> Attempt to retrieve it dynamically, and fall back to a reasonable
>> default (the one used prior to this change) on error.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d0265ad9223e8b55c7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <linux/pm_domain.h>
>>  #include <linux/soc/qcom/llcc-qcom.h>
>> +#include <linux/soc/qcom/smem.h>
>>
>>  #define GPU_PAS_ID 13
>>
>> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>  {
>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +       u32 hbb = qcom_smem_dram_get_hbb();
>> +       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>> +       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>> +       u32 hbb_hi, hbb_lo;
>> +
>>         /*
>>          * We subtract 13 from the highest bank bit (13 is the minimum value
>>          * allowed by hw) and write the lowest two bits of the remaining value
>>          * as hbb_lo and the one above it as hbb_hi to the hardware.
>>          */
>> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>> -       u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>> -       u32 hbb_hi = hbb >> 2;
>> -       u32 hbb_lo = hbb & 3;
>> -       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>> -       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>> +       if (hbb < 0)
>> +               hbb = adreno_gpu->ubwc_config.highest_bank_bit;
> 
> No. The value we expose to userspace must match what we program.
> You'll break VK_EXT_host_image_copy otherwise.

I didn't know that was exposed to userspace.

The value must be altered either way - ultimately, the hardware must
receive the correct information. ubwc_config doesn't seem to be const,
so I can edit it there if you like it better.

Konrad


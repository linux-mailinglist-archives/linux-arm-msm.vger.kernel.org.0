Return-Path: <linux-arm-msm+bounces-81440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6A9C5313B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 16:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C021540D84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD8834AB1C;
	Wed, 12 Nov 2025 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmUxz52/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdMIYlkj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A7E33E354
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958478; cv=none; b=Zn8RuB214o2KS3vYxMSb2ehKcmBSEQS6H262lgXWSCpjqMhbKzgea9KJ0c3IBGeGfe1+X3Zur5TP2GnSAL8YApjUdZhQPXNI/lSHznJh0jgIzY2uNQhAFCI6utlHDSzzmvj+VqS0msKCqVub39156Kb+ISBqP4+wfhCfgtKSZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958478; c=relaxed/simple;
	bh=9JqFN+lUh03KH6OhyiZLi7QPccTtindegh7DAZCJnH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2hLFsLtKbSnp4cX9IN99vDM0Gwk2m+TcuNRPtKDHMt+vd99khtDmLNgecxzFHvf1UaKeixHOVnKFGFCBCFXi4sUhUZYM+EvBOedjd57E1oC3E8saTSfFhib5ZHgfd1S7VHdN0gPBn6qhZxsggfxC9IRuxEiP+NqU4e5ervyIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmUxz52/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdMIYlkj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9gLfp960185
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UD4Gbr1H+DyzPCYqHbTvNAKVexCnZ/nezzgxwkeMezY=; b=bmUxz52/Iw9SLV8Q
	cDUdlkCUELernVB3ZD4vXVxAzAyfyjHPRV4xCAJlngjnNUtOc6Byq2KNxi/tStqf
	CUjtiJ4fgX8eoTQr8IhP2KGRNEbmNq9E0TB84wQeSeq/XADx+e2QFXlfG84dcuKP
	S59yKXRaZnAY8alRrsu5X6zO7UPeoknhBNj1DtSAvUVoynzuEYF1Uho/cnPF5fpr
	8g9KVjP22Xq1igkVAhGzApngqZH3YVbgg743xPFI5G9v4SD0h47Xd6ujpigal5he
	jsAHEPMCgLDJXPhTBBNZvtId/HyXLidtmdlWv/KeeBvaA2aD2zBv3FQT65VSG2Nz
	My7pdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acquerv3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:41:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso3211291cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762958473; x=1763563273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UD4Gbr1H+DyzPCYqHbTvNAKVexCnZ/nezzgxwkeMezY=;
        b=ZdMIYlkjxosvHDoispMYNUUaiIwR2/aovpIyTiMl4u1oPcemCAyT/wA0HSl/kxAulZ
         u88JUHx/ZSmuJ+StsNxJs4eDtLfDYMPT4+SietAWcehT4FEaD4rL9qo/+0+9xBc2xOw5
         +IJmDc5llW4xsoDWS87LrI07CAK5XZ3H8Fg6fOBNvMXZ0mgeunfkeL5aViQ0kc86QrtH
         GGE998O5ctgICLLTyikWwNG26c9qmNMAYKDXYkirRb9ckj5XqHAe9SRpHmHFXpXjnCK0
         yesglqAl4/oqw56oNMQfFfsIVW7qy8EIK2mPkYVLWkcmNjgXwZhOKoQ/oXKPoXWDmGLB
         PlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958473; x=1763563273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UD4Gbr1H+DyzPCYqHbTvNAKVexCnZ/nezzgxwkeMezY=;
        b=dEvBUHVBZTivao365G+p9wDTjA2WSFL4p8gvY9Jp7DSNVK387iFSOHIy8Ua9VbWwxL
         gSzz+OlCgTa3QYH2BW7A6Qth2s422kC687icvoOqShsaLN8v31o0QFmefwZIcWowdecL
         3KVZOWGFzkZDfb3AZiw3kDeXGDfI/ZMGhi+tWVGx/Z1NT5Wk2hA8VGal8p3sLyRdM9vj
         kWVAs1uFRh4iicQ6Tqky5vdpc3QMdTMgj3sUyTIKTgcTTc9aI6bLkRJxOEuYTZKB2EBg
         QMAqbn30P1jBskvjF4+Ofd04Y9mBZyHcKavx6f8avIUnTkTfaCxT4F08FysE0DnocMp2
         YlGA==
X-Gm-Message-State: AOJu0YzMKdTrVKuTIqkf0BYCkS+VOc/ZejUvFVY1ey4EcfQKCdAE0zmb
	YMCFP/VmQ27vCQsin3I/vwnlN8+K/IYPAW33xKheq9UJHdv58wduGyG24pZc1GkgbcDZ19oxE8w
	F+gyVp/FEQ9BBGr2Ew1kqwEz2D26s6LSLttdhO4WObG+rFZaj0/hO6J5/6Ko2XYwUZxlW
X-Gm-Gg: ASbGncsCa9teBGm25DLe3CDdFVwOJMRttmjm4WyRaN3BFDevWCvKRy/sZfcu+uyEdXT
	p2NlFb8tsJgIPB2oCBDu+JebFbMPsC/ccxY+8ryOaOVZOlKSaIgpvKpzgLMiWzQx67DSHZvfdae
	zVpKXDiLtoo24rwddx3UhOPQucDi9Da8zib8CTq60weHxmc+dpxgdGdWUtDSUrU2blzahyfcvUj
	qw5OfAQFryGxPGbyExnUJqTmrXKbGerkWDFS4tHaOX+9RcJ362JT3OxhwkM/1rxKqY9Grq+5zm0
	STIGFWAI30bn1vqdUALYy02f3FdGOdXO0zjE7ld55rJxEnYBZba/XEzK466sD7EJ4RnZx8L9I/C
	OoqWjU2Aa2N+X2nsaK35WjtvbKm30+Qz39+aQxQxkBKd5PiO7YbnsHPO/
X-Received: by 2002:a05:622a:728c:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ede2dceb1emr8250641cf.0.1762958473413;
        Wed, 12 Nov 2025 06:41:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXNVu4MbvjBQmXxL3FDdcuNjCm2cJCAQ1jZODPaFYu8y34KljTh9u/VDha9brFuHl1b+1Ffg==
X-Received: by 2002:a05:622a:728c:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ede2dceb1emr8250331cf.0.1762958472880;
        Wed, 12 Nov 2025 06:41:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64169852018sm9952464a12.16.2025.11.12.06.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:41:12 -0800 (PST)
Message-ID: <f9aafd73-fe4a-4399-a0c8-0da1c109283a@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 15:41:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] drm/msm/a8xx: Add support for Adreno X2-85 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-17-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-17-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExOSBTYWx0ZWRfX1bd+9OkNcBUF
 knl/AxekhZ2fhlpDsChZxqxzoK5BrPEYTezt3Kg6RVsUr0lZcpKVKmrS5HV2BYclpgMub4B014E
 h/+BFhnce/HFD2+LcI9HuC8UFhiI3oZEBjiHYTuc0cvv5uq/dBzPXnsDmzSkCw9VFdOBWQDi+Ex
 F9ftuX1Fk3OiZDyKnQvmp5QPdZp4mJKrLP1RrB+hzQ7wOLH9ocJHMWmShwHHHZhtbpfDiX1plWM
 eTMDXMn3nd21z/LwSUwffhIf9+UcbOgfAWZGOMTo2bCdoVbF9Q+3VVZajKLodg9bGiPEJXfndRb
 M4bbo5Vpyjbhp+01clu7n3nLkdnbU7nMwH29YHMLNOM1uV2GLX4c6qZNDYYcfuq6NCnFtL3jPEi
 QxnGnBqcFCOhDApdDqLGsxQDfttgcw==
X-Proofpoint-ORIG-GUID: 5pUcVv9tUVafURK3tJpPwW_Ev3kLUNC7
X-Authority-Analysis: v=2.4 cv=cPztc1eN c=1 sm=1 tr=0 ts=69149c8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BrXyDZ9iCYK2Fy0JuVIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5pUcVv9tUVafURK3tJpPwW_Ev3kLUNC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120119

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
> series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
> on the new A8x slice architecture and features up to 4 slices. Due to
> the wider 12 channel DDR support, there is higher DDR bandwidth available
> than previous generation to improve performance.
> 
> Add a new entry in the catalog along with the necessary register
> configurations to enable support for it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 131 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   3 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 ++
>  3 files changed, 139 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index fa3ae725f389..2e5b0573c212 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1625,6 +1625,108 @@ static const struct adreno_info a7xx_gpus[] = {
>  };
>  DECLARE_ADRENO_GPULIST(a7xx);
>  
> +static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {

It's certainly not the same silicon, but a830 sets a bunch more regs
here and has a lot more comments in kgsl. Could you check if any of
these settings are required/beneficial?


> +static const u32 x285_protect_regs[] = {
> +	A6XX_PROTECT_RDONLY(0x00008, 0x039b),

In case anyone asks, there are simply no registers before 0x8<<2

> +	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> +	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> +	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> +	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> +	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> +	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> +	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> +	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> +	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> +	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> +	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> +	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> +	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> +	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> +	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),

830 has start=0x03cc6 len=0x1fff but that must be a bug unless a lot of
registers have shifted from there.. I see there's perf counters so perhaps
perfetto-proofing?

> +	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> +	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> +	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> +	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> +	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),

830 has len=4 here, with len=6 you can't write to GEN8_SP_NC_MODE_CNTL_2
which I think may be useful for UMD

> +	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> +	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
> +	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
> +	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
> +	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),

This carveout differs slightly vs 830 but I think that's mandated

> +	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> +	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> +	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> +	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),

This differs vs a830 but it's kgsl that has a harmless? logic bug:

{ GEN8_CP_PROTECT_REG_GLOBAL + 40, 0x1f400, 0x1f877, 1 },
{ GEN8_CP_PROTECT_REG_GLOBAL + 41, 0x1f878, 0x1ffff, 0 },
{ GEN8_CP_PROTECT_REG_GLOBAL + 42, 0x1f930, 0x1fc59, 1 },

(0x1f930 is overwritten)

> +	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> +	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> +	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
> +	A6XX_PROTECT_NORDWR(0x27882, 0x000a),

These 2 seem to have been changed vs 830 for counters (all good)

> +	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
> +};
> +
> +DECLARE_ADRENO_PROTECT(x285_protect, 64);
> +
>  static const uint32_t a840_pwrup_reglist_regs[] = {
>  	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
>  	REG_A7XX_SP_READ_SEL,
> @@ -1809,6 +1911,35 @@ static const struct adreno_reglist a840_gbif[] = {
>  
>  static const struct adreno_info a8xx_gpus[] = {
>  	{
> +		.chip_ids = ADRENO_CHIP_IDS(0x44070041),
> +		.family = ADRENO_8XX_GEN1,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
> +		},
> +		.gmem = 21 * SZ_1M,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			  ADRENO_QUIRK_HAS_HW_APRIV,

No preemption and IFPC - I supopose the smart thing to do before we
know things are stable

> +		.funcs = &a8xx_gpu_funcs,
> +		.a6xx = &(const struct a6xx_info) {
> +			.protect = &x285_protect,
> +			.nonctxt_reglist = x285_nonctxt_regs,
> +			.gbif_cx = a840_gbif,
> +			.gmu_chipid = 0x8010100,

Is this the chip id for the final revision silicon?

[...]

> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index ad140b0d641d..d283d0b55623 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -175,6 +175,9 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	u32 val;
>  
> +	if (adreno_is_x285(adreno_gpu))
> +		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);

kgsl sets this only when turning on hwcg (bool state in this func) and
on a830 family - should we turn this into an A8XX_GEN1 check?

Konrad


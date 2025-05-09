Return-Path: <linux-arm-msm+bounces-57478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23848AB1B27
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 19:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099415080E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A47B18DB01;
	Fri,  9 May 2025 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XY/8Tn/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE39238174
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810052; cv=none; b=pZ0yoZAabWP8+kHACtgzNbiC3qR3Z5mmArIgHwFsFfM0F4Y/6Z5wiZ+/mNis/vLLy8cl5zE7Lq3p0QtLOb0Zl0+BG6ZUKnLc6qcRRkuf1kGb6rSjzYTwKo0gtVn970pt9fGlwPy8P9w0QCsgZbduJkTRj1nbCc8AzmWUcnKqA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810052; c=relaxed/simple;
	bh=cOz0ydPeVV9Iq39xgSPb8X7nqzHTwH5x1vS4FU4qOjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTb9eBNpxel8RC44ZpKrI3a6o2GXBtiNSStCHABnZzYHD3krTS+cWvL03CQ7Ay8H+3yss1+8UK9uj8JFLb/k3Oiutk4bRrFZy0sTI15EUeDFUCTiyYfnwh7suA6u58tYKJOw079gVXSajU8kKoUgZsT1AaPqQ4IWdnMdjNqw8Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XY/8Tn/a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C6BQg022773
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 17:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZCclbDtuXk9uHIUI669lCG2hQrQh9WYUvwIrH+clp8=; b=XY/8Tn/aYV3Ofq9X
	WU3p+L4S1yA/xRIs9s4IGEGI1zc2TqjVJklhJVqHWjz90ZD0pMoaMJ/AuMpSlHC1
	t7fiLaM/ROGzxy1Kub/YFNvAQu8hNrBsP0rWud4eTvd98K/zllLMeuG1tb8c/jz+
	5f0zJOUBlSgp4AnKtK0JefzmrFZqmqd64dBEu0Lo1gHLOWiLgxClV3ZteRS7zlMm
	qedj9JXW2FFrfcq4OIM9N17NT3N6YQJXf/qAxeycLGTfcYbwP9KvBxk6yH9Xk6fc
	cF758Lbgyohafe3vhgaYCEaUuPSAtpbA+YdVOH0syJ6p97ZBoGojP0CuNBMFQ48y
	wJ1QoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp85cga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 17:00:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so60394985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 10:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810043; x=1747414843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZCclbDtuXk9uHIUI669lCG2hQrQh9WYUvwIrH+clp8=;
        b=KRbdUS7WHda2Hg0IHMWbfHSShqo+5gk2wwBdat0LIRACzW74MVoM11OUXSHAaW5Ttg
         tEB7DLNjTiSRC4PhoXt3M7RRz+lW/sMCpg/6IXlYt0UgVtZIyk1BaFb9FWT8ZsFx+ds1
         IfFK62BxRirRFvXmgiykTujFIf34C2xS+E3MjNX+X7uRcLOq3/7ZfhfHRgXYSzY9bW7/
         ulNVrJxnyUmRfVqlOdn6R/6X42/xyLE9cXannpbM+xKLN2NeKLJRlY8+ma7WqTOES+YG
         h0OwkZ4K4Spa8dvkIiFK8x9jSBK7ksp4k6KXjKBvr+H4Ku/O3zdC9CSooaRwutZ5mIHQ
         lnBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlDvVLqz89Cik8gmr5Z6zR9icSvFv+lZkY9vETFDNc0JBoG5O7Qz+Z5qzSgBZD7IdCbzGCP79uAFYm5Wjt@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPINZo5xTwkUTUPhe7KmuwQCLBit91+mGdj1s6ve1GkQ1hNQF
	Sb3k0UaXH/6Ch5zVRUXOHR1mHQsDY1oXDjZwlbaxqDli1tME0lHbfs7KXdPAig9VpvNnMR2hptw
	UgFUhkkZhphA6E1xiMvxUweg2H03f5GJ8MMwrX1N4PfAVYKNGqC1tGKxbud4oj2qG
X-Gm-Gg: ASbGncv6MOX44ZGxNX6fA5VltNn6Pnn8Z1DYxt7T7LxpLtPRI/H4GQkzhQ3BlDLEIUM
	vw6VntVECYcm0gJSouhdweEYT/7uk3ZtWC8kAYXI7D6m2cKDZS6CFUOrUDVrAqJXZFkqvDCZNi2
	pMQ1s9I+bU5KKK/6qrcX3yuytPpEKXMITp5/cYOjtKDgg8z6/qCzyNrIGoEGvp9JypkphHWlxMd
	7OidyaHi+CBKF9AIZ8xPjMj3OOoEKaIBRV/6LVcaPIVv+GHHAY7dQlBrL1TX4N/ns2L+sgnXkyU
	yZi/n1XbIhPePAKxzdCXIE/JYTYc4KVeJ51DIny9cn4BlTiSNV55zfi4qP4rQ2rnJZA=
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd01284a67mr256687885a.10.1746810043209;
        Fri, 09 May 2025 10:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsdbLUhxiiEOyjW3uhYLvePup2YHDZuESeQh4lqLxFOX19Wsqo/GBeavRtbTUa5Ayco/hoSg==
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd01284a67mr256684485a.10.1746810042578;
        Fri, 09 May 2025 10:00:42 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8b8asm177791466b.5.2025.05.09.10.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:00:42 -0700 (PDT)
Message-ID: <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:00:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
 <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
 <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e34c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Z4pxUwbP9fZFGfhsnTMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8_EjShoVsSwq0DC2971qu9lLtGjeEcoG
X-Proofpoint-GUID: 8_EjShoVsSwq0DC2971qu9lLtGjeEcoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE2NyBTYWx0ZWRfX9JjRj5z2680q
 jaE1oDsIZ7RSAxCCLg2A1p8EF0Sg0P9JBvmkW7qx4q+aZZE2l+MgUekJKZwokNSSiPjsZP7hNmY
 qyMqDqmNCjzM4JstSvNy6hlkWYYD5ZcBI+byaaqDzRxfOYPGrqveOihX+j5PgXs9BN2CMF7PLq/
 0aJyhAagzlVpADOd8IottHd0n56fxWKgJ3Z7DfrNxT5DlUqjXNCtiy8pYrF1KcAH9iR4In3/t2+
 azLCn4HUCwdrTPGvBGeqp6k4+/Ba24y92zfNVE8JFiin5F6YX7nvV7TZBVceYU8hmxa65c+gjZc
 bBGIYMfBlIobb7zLXxKUPJG1zrGdI+z4gxx2QVWVYKQUCOZbimWJu9u+1/x5MqE91W6BNKTWS24
 NSan6WNKRRlpbsWd/bYj5W/h9vrwqsZNZjNvzNKjl55z3fd3qpjnXtt4K8t5pGCmFK8ICdmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090167

On 5/9/25 3:52 PM, Rob Clark wrote:
> On Fri, May 9, 2025 at 5:31 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/8/25 8:41 PM, Rob Clark wrote:
>>> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Start the great despaghettification by getting a pointer to the common
>>>> UBWC configuration, which houses e.g. UBWC versions that we need to
>>>> make decisions.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>>>  }
>>>>
>>>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>  {
>>>> +       /* Inherit the common config and make some necessary fixups */
>>>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>>>
>>> This does look a bit funny given the devm_kzalloc() below.. I guess
>>> just so that the ptr is never NULL?
>>
>> Yeah, would you prefer this is changed?
> 
> I think having an all zeros ubwc cfg isn't really going to work
> anyways, so probably drop the kzalloc().  Or if there is a case that
> I'm not thinking of offhand where it makes sense to have an all 0's
> cfg, then add a comment to avoid future head scratching, since
> otherwise it looks like a bug to be fixed.

So my own lack of comments bit me.

Without the allocation this will fall apart badly..
I added this hunk:

---------------------
/* Inherit the common config and make some necessary fixups */
common_cfg = if (IS_ERR(common_cfg))
	return ERR_PTR(-EINVAL);

*adreno_gpu->ubwc_config = *common_cfg;
---------------------

to get the common data but take away the const qualifier.. because
we still override some HBB values and we can't yet fully trust the
common config, as the smem getter is not yet plumbed up.

I can add a commit discarding all the HBB overrides (matching or not)
or we can keep the zeroalloc around for some time (i'd rather keep
the function returning const so that when things are ready nobody gets
to poke at the source of *truth*)

Konrad


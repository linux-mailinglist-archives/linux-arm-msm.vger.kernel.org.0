Return-Path: <linux-arm-msm+bounces-61294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFCAD9F19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 20:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76F5C18988D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 18:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDF32E62D3;
	Sat, 14 Jun 2025 18:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4BOk5zd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB14E2E6100
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749926581; cv=none; b=jELnjY3c8S2QLgyKLE+Jjp4C+ERfAvxcn4klIpRbwnCJY+38jxPL1WYNzADjcMQUDzgRBrLP/4CtW/f26EF51iHfRPHwkabav/8YJD7tXKgW0Nm5T5VlZzXl5eamzhMjcU6p4hQ0G7FlaX1X57KA3bGB3E1L7g4eOdjXCfqljDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749926581; c=relaxed/simple;
	bh=s6E01uA7mvRz1DP/q5h1Kgs+cAsIQRRJGrCjFTML+PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YauQbRbyzPGxj3VNUbRsfv7UQwOVuNE18HyyIK4ZeDyV2PDvxbeI42vWVsmaS1R8KVvh87fnuG2dpUK5jJyUWTGkvXvt49jcHQN5KosV0oB2sr47dxFKjThkk1fvCEsGj6EG3HCn4P/u4Htle/I7khkHnhXin3szHTOVF8Wsae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4BOk5zd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EHfr4e019661
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iLwHJ8QhRIGYKyF4YaLlo9Wwe+HrqcTZDg4UUvCSfuU=; b=E4BOk5zds0DrD8NF
	shEEzA0umYdl0+l2QQoDtHcBw3muKjC9CdF0eGWK2JNLFxH+WubblyadPNBhyJDt
	pdj9Gee4bbCTyNCIlObEgpXkd7ae/0BTqpnVCZO3Lfg+SK3uhS8vvoWziYgusxa+
	AuIiZnsYaItRG+Bt+CubgkgVNA5IuJUqElDU9TdWnFjjt3Ay5s+kVdp3iQefFfX4
	NqnCqEKE6ZAA6hwZMQRhN948mAJzLL9KTH6DGyLD3iCANdTsO0kLGUGTATNwArcs
	AuVbw/3v8ac2hLPzkgBQSO6Z3HDhsqFdkZOOOmUYkmgR13zR9ZbL9JPWArBm5Qjs
	vN4WOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9rtwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:42:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5aeebad31so8131531cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 11:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749926577; x=1750531377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLwHJ8QhRIGYKyF4YaLlo9Wwe+HrqcTZDg4UUvCSfuU=;
        b=Gp8wl0wYBxqo7d8DMYAzJ0oimZwsavl6h1nb+fz9CEobEoSQLC+5eEwD1Qv9ogEYcH
         JqwkzgzIjQNZB4dAg6E6sXRF0jkJzKRZukmGvly434KRSi8F16uj7CAHlADDZBebkE9A
         q48PjdFkWj/pJ0jc+8HbK9trvWj7mtxhpwsTf36GhHQQM6ul1aIh3/FNdLNjzGJPnkBM
         1K9jRe2UMzWZAySooEg0LKhU/iXePPo/APLzsVdobMpsMc8IZ/i1aYCEaI7V7Fb1Q/bL
         Dl6RnWzUTkssiDFXE3SmE3DOCBS74Zh7iGzP1f+tOb8Z+AX9vM8buzAp7QWQpgI7Cx3d
         JxPw==
X-Forwarded-Encrypted: i=1; AJvYcCWiPaASePJugZLpIg2ZyHq0PrW6/lr+ODAGd1+BqvwGP4vDl3aPbFK1iRVm9MnGw7Um2d2AuYhnAGGiMmIW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ljIRDsI/NZSEL5p4liNju5ksrocroR/FH3Xqk7hCtynibPHI
	Ope5sPQWX+puZTzdrjSdHzP/xH9K1A2luXS+yTBl5d1N+5Sc5ZUrwy4iBIhNgeVLfkLSRR/YqaU
	RmYfpDMJK+K56e3q1OPyWdIFVWHlbzaFP5P7C46e++mxnqszUWnH+WE7QjSV1H8KQeQamGDvWKu
	k+
X-Gm-Gg: ASbGncvU332ZPbiQdpWRM+ROVMd7OjQ0cwf0cJOikfqJzrQq6zUGhrenQy3z7jv6eq7
	v1hg4GFeRhFwXYerfOODuDB8SXTvG0VbaS3K1zE90FhVuciKz3O48NtZ7ug+vAVexlDl2lLp6yY
	9PScigtNAARaFYpsQUPUI9TwV8FC2ulZHdg0olcxOtECChLfihmNmO2x5etyFFP1/IjpgfmYmCP
	Lc0MR9g8LN1rOfAmjN5A3gyaK1avUNVR4vCsa3QKMwHAxUSuAdIaCcMcNCchPDRloZqESKvjbK3
	N1DShtJ2ygISlqkeiEe7n7azd+w/1lZ3rM2w5vka5cUnIeZBol5S5zb21/vEmkeEUMlOzZo0sfu
	8v74=
X-Received: by 2002:ac8:5d0f:0:b0:4a6:f809:85d6 with SMTP id d75a77b69052e-4a73c568fd6mr22438931cf.4.1749926577331;
        Sat, 14 Jun 2025 11:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkYi18BH9yEJbdfQSZZnPYYS236AqGcoTRf5C7tWQLhoDTwPCEtKNQkvCzqxnaF0WVubY/jQ==
X-Received: by 2002:ac8:5d0f:0:b0:4a6:f809:85d6 with SMTP id d75a77b69052e-4a73c568fd6mr22438731cf.4.1749926576868;
        Sat, 14 Jun 2025 11:42:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6090063ff9asm293673a12.21.2025.06.14.11.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:42:56 -0700 (PDT)
Message-ID: <29f1de05-0e55-42b2-9bf3-894bf4f07808@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
 <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Tz1uab4OnxJyMCVxLI2kVqIC1e2k2s_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NiBTYWx0ZWRfX3mzDwSGO1Te1
 44oHy256sig5IyU0uAPJ+fMlpuZpiPFysfU4KrDfwal2pHmz1mQ4OI8kISxgcBF52+7jSPlq0Qh
 gYA9djkK8C0fJCP+CJKnemDODTUbF8olRbbSMLtq8Cpzuyo69IB4JOfxz5EhBwdYqaIdBXb7Aih
 jIWmG3qlaVSAHXCYoo21AWyDKxtXEJpnn0/Wig17pK5/LnNSneze/5TPetkcv9rf9Jp07BUvBX/
 zR5NXoQlSVGdccGJK2FLH5iZgCL78JHz7Z/bZ5Gc7vZEIKOjmlWWBrMOSfJfZHNFUmJBkiG33eo
 zEj5WQ8OEkIWJwcqT8JX/y0uLI9Ksx+TQSe4PzjIzd4cKrm814Z1LOZM7PW5kOdVpmLeZGlT4fN
 YWbp2TdW6d4bG6hUbRIND48a1ujaLXuxlzT7mfyvSVKTMSNhzM86P7xkJFklUxuc7SqGyFQl
X-Proofpoint-ORIG-GUID: Tz1uab4OnxJyMCVxLI2kVqIC1e2k2s_g
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=684dc2b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=phG8Y4mLfM-ETw-KuG4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140156

On 6/12/25 11:19 PM, Akhil P Oommen wrote:
> On 6/12/2025 5:32 PM, Jens Glathe wrote:
>> On 6/11/25 13:15, Akhil P Oommen wrote:
>>
>>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>>> version). X1-45 is a smaller version of X1-85 with lower core count and
>>> smaller memories. From UMD perspective, this is similar to "FD735"
>>> present in Mesa.
>>>
>> Hi Akhil,
>>
>> when loading the driver (still without firmware files) I'm getting a
>> speedbin warning:
>>
>> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
>> missing support for speed-bin: 233. Some OPPs may not be supported by
>> hardware
>>
>> I've seen that there is a table for speed bins, this one is not there.
>> Tested on a Lenovo ThinkBook 16 G7 QOY.
> 
> Hi Jens,
> 
> Could you please try the below patch?
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 2db748ce7df5..7748f92919b8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
>                         { 0,   0 },
>                         { 294, 1 },
>                         { 263, 2 },
> -                       { 141, 3 },
> +                       { 233, 3 },
> +                       { 141, 4 },
>                 ),
>         }
>  };
> 
> With this, you should see 1107Mhz as the GPU Fmax.

I see your dt entry takes care of bins 0..=4.. this oversight worries
me a bit - are these values above (post change) all in sync with what
you entered into DT?

I'm not saying they necessarily aren't, but I want to avoid
inconsistencies

Konrad


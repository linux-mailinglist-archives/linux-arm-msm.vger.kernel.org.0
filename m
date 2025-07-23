Return-Path: <linux-arm-msm+bounces-66223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EFBB0EF84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D753A8042
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8105D276036;
	Wed, 23 Jul 2025 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBbMXJPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29A528C2B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265634; cv=none; b=BrmOJvXCsWMygwUGDOKRu5Fbh3emyhaeL3wXTYXmPES9TyruXE4bx37jsIbDemlU+Pb0XnBkC7uUCuWSK6ehi/rWDpPJiyFu8QvXXxUW0kOddbDCXnGDGyl5F1j1/l2EJ5NKrzlDPLo+XYIhNKh14ioB+aMXCicrm2WEQNUkxOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265634; c=relaxed/simple;
	bh=4CWH2IkKNZr6mIG/SESwyL6j4iF5W70knw1kd4FBpoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuXavtui9DWaFsrru4FpThcZhXYG0sobUVY/pMccJQ4yj0GmWHe04E4xyb4IhAcCFzuJVp64mkOSNFwclqgmOf4nonoRYeZGfrdRsJgNrr1o3Q6LtmNJuMqTl+3eYiTvp0D+vTP+xwS4TObuFI+j6apG3ipB1TKFkxYLq0VHWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBbMXJPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9UGP1007900
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1Fp0VrKpCniXZvPKeA5q3E1PK5THOcusTjUp11AbC8=; b=IBbMXJPlWbhzanWP
	XHSwCHLB+a3ijQ/iwEMi9BNvVwvjFRrt0AYV5+kaD4xenJ8MrjCAj7aL4bhrECfF
	tzkTgkiWNn7/wqt/2E2Ip0oCqZgjRLOZfotcswi8JLB6fXlm5heivGKezvzLxmEx
	msw2ProNf7Yg6hO1eFoeWXTP0TOtClm5ucQ4wJ57SzmjhPWDuKAzhBFFZ0hm38WC
	mzYoUHE0eEZj8j83zO41NBWHDcIKNb4cyMb5KL5n620gafyb9tXN1O/UghBFSUYZ
	0Of7YxeJG3+IG3q4K6bL8/MUg07olclUdKE/oRg4a7aumM+1m4H+vIRZbE5dSTDX
	xAQlvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htsmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:13:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2ced79f97so85072885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265631; x=1753870431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1Fp0VrKpCniXZvPKeA5q3E1PK5THOcusTjUp11AbC8=;
        b=FdGMbalZWzIdJRrLJOZp+lzqQbQBfl1zlaChpuCSUtREs+K/0JAWT9B7WVpgAqGvTD
         ooU7F89S4YemKSU3kfP0BqyIdf+IEIv/C/nQ/ZMXWGVs1/kjBl4JOzUR/CdUA0GfjOaG
         KW+VvgkDB04K6OqDkxOqK7MrmdOy9+EWvIL5IinwQ7+eX9aHizWkwXuHCJUppIhOlVC3
         vSXy8ulXV8rhq/sPvwRGVrTX3SapWJ2jbQdsJmPw+gr+gz8tuSQbSbV0pw35NSilJlXk
         O590PpwyCutN277ZvbaZPAJ6kNPCZtOBLQsB/4KAYhZ76QjI6FbHynQ7sh8WadUv8VsN
         QLbA==
X-Gm-Message-State: AOJu0YxkyDT27XT24CqwD9zgetMQ50h+Gic54bPc0/v2Lnp1HDBRI8c+
	JdD91Y50P28HWVRvIrBDHC/FBrCrM90eCPQaRjUgXANQ5xVWI3Qm8dMybRkMbAIH4OYHxfMlZo2
	SnMUDtcrDcvUNXJ4+rBXRUM8FsHBuNr6zYb2q2yfip6TKC7r9KWwBqoyhEiSU+B9sUdC7
X-Gm-Gg: ASbGncufgrjfoNsOIopH/B6FSGyeJ9SrRzFcENaN+8hky6s5yOM53xbANkCGrmg0rOh
	Z/0grpgeBcJ/nVqowio8l0K3e0Dy3UEuhu0fnyqvh1nnmZux+U3YadcRgAZapoGKEC6PIJ0BABq
	6Pmz/9IRKsyNe8BQMx/Lz4vtxB38AjB74gT/tZcZ7MiR+jaMlcuATVPnFAt0j6xFUBz+2y1LniW
	NqWWtb4Q6YliOTe3qn+tuNcmJNEZX6TO1A2AACkSXxo4kFFuDmuId+NxeaA9W1Qtp7rzJxpHs9O
	4PgctBa3W1XTCXo2bpHVVIsUCbTKBXps7CRUnVdng/J4vYgSO9L9ExnOE5jIwWGoRnZ9C5FqmtZ
	HRHuZWUD3K1AI3T8eUQ==
X-Received: by 2002:a05:620a:318a:b0:7df:d668:22ff with SMTP id af79cd13be357-7e62a0c1347mr135521985a.4.1753265630582;
        Wed, 23 Jul 2025 03:13:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj3f1wr8H3E8T0jx6NxR/LC1BEZKnxCKVi6DM0FYNiWA0IcAlD7hCgXo8SM37cDFvPxE/gAg==
X-Received: by 2002:a05:620a:318a:b0:7df:d668:22ff with SMTP id af79cd13be357-7e62a0c1347mr135518985a.4.1753265629973;
        Wed, 23 Jul 2025 03:13:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f543ddsm8186317a12.30.2025.07.23.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:13:49 -0700 (PDT)
Message-ID: <02b9de9b-36c8-4db8-a1dd-65a82aee0eaf@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:13:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
 <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
 <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880b5df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=3Acu8AJWO6yBlTze4eEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NSBTYWx0ZWRfX0ViKdjpc+ggp
 ciY1+tX0NaetN0RNcR7nMe9W2ehYdIQNrQN0UMc5AiiT+HjSb0DixmavXvScOQn+SftIGW2b1xr
 9bFL6/TgZ60+jo4WqFTEUFnvTJjF+13LyborGBdeVAu3+NUYnxcWo7s3Vs/t2Yyi+yMyuQvlZGW
 7GDjgZEO/qVKppzOrERFYlQTt7qcCL/9NDgmGToGtMF764I0exUWWxU2WslP5osw4Sg3xGFXDUI
 iEn819Nd39pX8DUBARtxRemS0uZ7cyeeCcuSfriZ7TLr3xxDwbvVdqsV3ZksJrVUOB150gppNVN
 wDRtAz59mZlAbZdq9niV1TtRnO+aODpCrCj/3OOT/qmfGO6FoXytVaxI5RcQl+aNWidlopjlXJj
 w8mOBL5voJXAuR921VJ1HVwDIP5ajiIi6s4Ttmy0SAJf5rJW+kbkMfQudtFqdGmnk7Z5TF/q
X-Proofpoint-GUID: 3k0w_h18RXKShrc6RQwLQCD11Afz4oNf
X-Proofpoint-ORIG-GUID: 3k0w_h18RXKShrc6RQwLQCD11Afz4oNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=964 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230085

On 7/22/25 9:47 PM, Akhil P Oommen wrote:
> On 7/22/2025 8:00 PM, Konrad Dybcio wrote:
>> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>>> A minor refactor to combine the subroutines for legacy a6xx GMUs under
>>> a single check. This helps to avoid an unnecessary check and return
>>> early from the subroutine for majority of a6xx gpus.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>>>  	int ret;
>>>  	u32 val;
>>>  
>>> -	if (!gmu->legacy)
>>> +	WARN_ON(!gmu->legacy);
>>> +
>>> +	/* Nothing to do if GMU does the power management */
>>> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
>>
>> This isn't quite a no-op, but I can't seem to find what the '1' value
>> would map to, even in 845 kernel sources. Do we have to worry about it?
> 
> This is fine. '1' seems to be a low power state that was removed very
> early in the gmu firmware development stage. We can ignore that.

Ok, good - could you also add a define for it, perhaps something like:

#define GMU_IDLE_STATE_RESERVED 1 /* Cancelled feature, never exposed by fw */

Konrad


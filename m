Return-Path: <linux-arm-msm+bounces-76809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6380BCE3E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 20:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35C47402F6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 18:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145752FF662;
	Fri, 10 Oct 2025 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EixBlhDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3D2FF166
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760120835; cv=none; b=tOOARh5DFFI8D3YEfy4Lvleg4b5uyyrQH4J+06V5nzn6GUS5Km/oDF2KxYgIpybWn9d/ueV0R4jjy6VTkdFkbdr68vezQ7r1EJ/z5VG47wQraEZK9r3Tbj/jyryV9n1J0K65iiNCxC4QdFvMWjcpskTiKNmZ/TLy14ptky6a8o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760120835; c=relaxed/simple;
	bh=r32NymUtrf4fMzYCtgBys+4011+Zu1yQaln2k311rMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QOQxihMzocrrLUV3Km7kXI93mBlR0OzdNjCkPSI6v1+PTzQToKuIDwgitOB4+w71Hx+guVdg4+4IVQgN+omlA/ZsAG+vl1UakmspFebD+uOp/fmobfJLDrMjKZCHdqOq0/LL55L7dqf0FrR/4s3ATtd967aVy8SFOY92ezFS4Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EixBlhDP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ABQ7id016556
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wux/efAeHzCjaBAhhspzOVq9mish0P7Dal7te3lz2Gw=; b=EixBlhDP/KgaxFaK
	wMFeMm1eHoIcmfag8ZS2MDWMvrIqIP+jR9UrlHyAQdju5mX0uR0ri0sRtqDTdD0d
	Tir++onkLRBk9Jd0WgwH2mWpHxsXm2n1jk/ukicezla1H1rMpPT3QT5FHFCKrIXe
	REQbAaw1Crwpe0rlQrGngL1wfhf5K7TXD/zFAQXVcHiIjint0eZR5cCf/qEDFWkM
	lZWCDDoRPOQJ6mdSGKI/ZIMh9PdArZeZmcCBDb0ecBms1qufA5gCnS4fAqGDZ6ne
	cPZoXWWSdhB3Q4A68Frgia6uqrPohyc/TnRauHcHGeh7rr0k+9oMdzv2L5qEbU3G
	f+OSoA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49q18y95ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:26:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-798447d6dd6so8534226d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760120817; x=1760725617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wux/efAeHzCjaBAhhspzOVq9mish0P7Dal7te3lz2Gw=;
        b=akiv9wM4ArUDbj3rOS1Ty6beWlN3Tz6sboGukJePVvqe/GcwSALGkCmuOadf8zsEq2
         /1R5lCSALIWoes0/zjX+XIVm60wLWkM0Mz1E+lJrSWwU6mZciqAJkxjeIFZfCmTNQqZa
         38IAlyvHHzgfPvTNmieSfxBnKAPPsw5HuxkNbYhf8mvJXsjz34m3i0zyp9LzaWVuE1VZ
         6D6uGeWp2D52ruYjPOy7sO9BNo46ElloxypIb6SaddJrZdaRgi11cNw3E5WvKEG+WfW/
         qvBd+wYR6JCiMChCHJeZLBivCIC2q6sHYIhm1PfLcl983MASccP2wkCbFskUVAqfJEjR
         tMiw==
X-Gm-Message-State: AOJu0YxteVp5qpR20PPGgHLNSsV5xFfkCfaKaIf7pQB1ZX8T+/8pUGR3
	rpY704i8U4q/MCrUKHAynY98HzRxSHcRdKOFVfB2fOvup2TPJoVNFWe4CGy+9RZBduYVBnhVl3a
	owV5BjRYab5SxL1v/MWLETOztcUFpTVE5ber2NhFbLpmtRS8p5GnA/GrVZV/IPvzgmt+t
X-Gm-Gg: ASbGnctQlLdSSKWoMQRdQ7+2XuXkjcPWuyDar0n+64gh63yOx+ePdbXWgEBfpxC4RSC
	8lCEiDpuneIGquzm3kD+E0KEmzZdjtVuU1o7jC+1SJmzxGjHWIUHjhRmOb3wUdBnDQysXfmLFV6
	wqZ5fGWDROtNx7pvXM0o/tmPPvEydww33CA+8rXOwEKSK7DHYK7dUthoG4IEwkndS2I+W162Ygt
	tJ/CslK26lCbXFAZVXNZ2H09LaOh6FnhnqjtAa+DNB1cB1uyQDF0oFj1Fb24RfM/QlKdZjDwv4v
	Pa3+lZrRZwrqSW0Gk/MXrXrC+XpcMcBUDJSJMbminruYQXaYy5qNdkLVWMPmGLb9Nr+CHtW+ORG
	la931ApQm5cu7oLPfqQ1rNQ==
X-Received: by 2002:a05:6214:4102:b0:773:84c1:396 with SMTP id 6a1803df08f44-87b20ff9b56mr118583336d6.1.1760120816753;
        Fri, 10 Oct 2025 11:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbv3DZ79BE34Kn/wUGZkuQspPjyI7j0FCaMJKAoltlhtem37CFBxGiGcrS2O8G/hsHNEwilQ==
X-Received: by 2002:a05:6214:4102:b0:773:84c1:396 with SMTP id 6a1803df08f44-87b20ff9b56mr118582886d6.1.1760120816054;
        Fri, 10 Oct 2025 11:26:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235dccfsm2882274a12.9.2025.10.10.11.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 11:26:54 -0700 (PDT)
Message-ID: <3e098e06-0ee6-477b-8a52-7370ed37b36e@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 20:26:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm: Workaround IFPC counters bug
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZULtI2MGeBaetPZqsqIZpzNfZCKgtLBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA2NSBTYWx0ZWRfXzOcvnSoj+AVK
 xdrsLIJyAE4egwmz3XPfrnHp/cO0Hagzgx8xiQQPksd6fmzMDg2L6/s+8zjx+KoZLySFFhG8C5N
 ZK7e5a9mXyAb0EZz1QBQTIvh2pE2WLkB7W8D6j/aoJ3Xsg73AsLrVUSuiEzoQXiQsFmE6Hq0nWn
 Du43bNL4Mlh36dntv4d4CTh6GtF696pRyj0uIgYiAQ06qh3coEMk1xI/6EUs07AHmZEnPkYSr5f
 fgW7aE5PMNAiEmNAAxc5AJ12Kn6f4OtXFAwfKb+X3d13LAMhGH6TdW0NTpbWL03E+6qfwj3rEJn
 f7nnTp1mSpmdC2Ti30zx/uAIxOcA1ojNeNh1G50tfuiha5UO08QfgIKWm0sdSYY7iPeZKBX+GP0
 rFf5K5/Q9NOj0+k0IjuqprCXuUsFKw==
X-Proofpoint-ORIG-GUID: ZULtI2MGeBaetPZqsqIZpzNfZCKgtLBL
X-Authority-Analysis: v=2.4 cv=LJZrgZW9 c=1 sm=1 tr=0 ts=68e94ff1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=3vACEWP1_XwkJBBmlSAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510100065

On 10/10/25 7:49 PM, Anna Maniscalco wrote:
> When keepalive vote is set to false IFPC will be re-enabled even if the
> perfcounter oob vote is set.
> 
> Workaround this by not setting keepalive vote when sysprof is active.
> 
> ---
> I have little confidence that this is the proper solution hence why
> this is an RFC.
> 
> Hopefully something better can be found.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index afc5f4aa3b17334027f3c20072cc3f059a9733b7..975b91e2c439f659b7f716cff87f73d389641d91 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -191,7 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> -	a6xx_preempt_keepalive_vote(gpu, false);
> +	if (refcount_read(&a6xx_gpu->base.base.sysprof_active) <= 0)

This returns an unsigned type, so you can just do:

if (!refcount_read(..))

Konrad

> +		a6xx_preempt_keepalive_vote(gpu, false);
>  
>  	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>  
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251010-ifpc_counters_fix-8bd4470e6351
> 
> Best regards,


Return-Path: <linux-arm-msm+bounces-66124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B955BB0DFC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 628A91885CF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71FD28C5B4;
	Tue, 22 Jul 2025 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcfPf5cg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5DB28B7C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753196157; cv=none; b=XLJ7E+9OGjZo6uE8+Z0kWpWgQ5tM4iR7W13QcRyglizfw6qHllivtGnd//W+tr3OFYeKUUtDr5uKqCclB/0V/l20s0KN20Rv9AzUk44uFF4lj7HOFFr0w6hMMPqb81FPTzauhHTPHXGiEMfIvessOrC0Bu3Tr13uy48Qwgxgiek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753196157; c=relaxed/simple;
	bh=UAK5VSHn3YTUfIZVUDIaLTsAANEcnDyMXuOk5OsDE6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBpRk2PC71yd/tBAidk2bcX6wUxSU4q9pTZAN8kPkcjbwiR8kqYsKFfoe2p/8VbdB9q4/XZYa4CL/vKI4wGhyksyNm2QqwADkAIOyFbETdSyEJ4NJGG/vqsGQ6ElUG3KqyofTLg0ePFnEdBKZm4eZ7ZmYaiPsR+rI5koL74g1Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcfPf5cg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MC5DsI000902
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C0hlxJyA1IJ9h6I+V+ie87W0rqn0HSylQG7JgAg/IlM=; b=QcfPf5cgQ5enNMgB
	P5Jir3+SM7xsRHoRsYLCP7SeEg5OUvk46GS/jNhYJaMwxPIbzcmzPYlmdkyUm2FM
	Mq14j5LID/7xsk7g5zwP2V6WkEy4P8EWYDhJMRRL5OZrV1TUrhwbOdR7ZYPOvG6t
	5fw3TVNOGOpQXCgBl9glQoQNcvlQii3bWU7l40PkDXN6HVaQztBM4dtimAryAWwo
	ObNfrd944+6O64maA1Ss8cjyPjXoIXRyfVzEA4cyWVln6L6xElKxBQ7/pOcskAnp
	dZWUa5gBjqDn4sHGavri3Mz5+t6bJb6Pebraf+x1n7P89eOdwIfZ0l0cLGlCZdq2
	IFoluQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dhq5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:55:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabe7822e3so4910486d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196154; x=1753800954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0hlxJyA1IJ9h6I+V+ie87W0rqn0HSylQG7JgAg/IlM=;
        b=penRPuDUxq/KT+IvwsXJ4Jk6VZb3jIltLeRUf0PhzKsE38AQZZDm0G/IrQAoIqDNqL
         xmmTnrFRMsNwJHa4gBdnHzx9ka6VByv2PV5zd1K9truurTf59zYH3KCPEEsUCxQkb6sr
         dd03E+C9uBpnMFZn9gtERJeGkP3rNZZ7vNyz+DuG0Ml4GPJ791RZLaETjIg7SXVMrnVP
         zGcXlmpwRS+CJVSs11V6J/UEqIczAhYEKBGypplpe8mFpmOw4t60ksIx0x9hAw33Fuok
         aACBrJrlSWajaM2sSk9sy3n646gwWgL61l2UurZpI0TA+prhDhdW2YQg3TmjQzCoPSs6
         Ly1w==
X-Gm-Message-State: AOJu0YwsHNuEqyOkNYq0LZZGLTp8rMQb8H0fF3Q5W28uiFaKsic8TvrU
	xoDr32C0VlA+J7I174BR9nHI6x+Q4TQGRtjktHqT058nUNj5VE13m4za5hWE973QT4t+qiq84uT
	YEgBH47tsoGy43W1ZIYQE1IE5OOny4XTmqndnevqdJY2HeWDT8QtqpiImyWK0ns/m/qjk
X-Gm-Gg: ASbGncuGNvLHKt4UcOGJJrTUV9D0JmOankYZ5ywYj0DNZjIZRQuj1Lo/dzDGcCIv2M3
	3uVwMH+z3Pc7FYsYj2hEVWS4QMwycmRD892D9WRwskWD46iHcPPW+P+0n1fwVeDWNvoFkhVsF2M
	LgQzmizgTTsuwYNjBxHzEnHORy3t7u2icSA3z2vCotA+N5tnToYlpYbtyuunxW3H4nlQ3UWlK0U
	nJXzjWMpWEILUTXTw60rEPio5o3DaH91ZSxjd3b8KO6bkWql4nelFpXJFbPE6yaXTpVwM11aigy
	zsWVzYhtfJz/PdIAta7aDVhFuxe3pjwrKGgwLFr+eIkxnasPJcPvdi0f7f3NQ7W8nkzeJp/MECg
	Bijs1dOmNwyJA+7c1ZhwL
X-Received: by 2002:a05:620a:4586:b0:7e1:79eb:18a3 with SMTP id af79cd13be357-7e342b3fcbemr1355051685a.10.1753196153058;
        Tue, 22 Jul 2025 07:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnVBwZCXiywWrdb3FDM9RN4tirxT5EabZ2Ai1SNmjP7E/TXKdb3AzhUWjSu0iEK7NCe3JGkg==
X-Received: by 2002:a05:620a:4586:b0:7e1:79eb:18a3 with SMTP id af79cd13be357-7e342b3fcbemr1355047085a.10.1753196151593;
        Tue, 22 Jul 2025 07:55:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af22f6fa6afsm73454166b.120.2025.07.22.07.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:55:51 -0700 (PDT)
Message-ID: <38100984-df2c-4a15-a192-7f38b8671145@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:55:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
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
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687fa67a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eUh3tnNZifY16eYFU8cA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 6o8Q9uF3l6HX-fjWsNbMT0Li9Cbkwi7t
X-Proofpoint-ORIG-GUID: 6o8Q9uF3l6HX-fjWsNbMT0Li9Cbkwi7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyNCBTYWx0ZWRfX2ImNNnkYTqFE
 FSX5ujJRYuHHlKsy4N5plrzCQpvlPlxsccCXXRGQzwyK8EWRukarDjxTEc42dPTSwmfb9awzuSN
 rMAgXrlxzgCymSyUvJvdewwzW8sBR54m5di9g6BuwrXuvAYujP5T83G/Mj/H6ZSGp1+mdFNwOMA
 asM91cswUe8svQ0RWLuMX8VhqnG5xz+M5DOzV6Q5bS7G0kL7QLqMpF8+okm23igPt1Ac3LZw+GO
 HC50ehLtABWYiThvvoh7VRywsoOkD1eQGn1IxDUi8Jh+UbTJ/XJIbzP9TXUM78ixsYUlrplNdMx
 BQzcsTNKyG/cTEwkEgRxwWjtLstdxIZLIgdGcSHRoCLBoW+9CoeLNJANmWcxtd4op8Zni6R9abj
 pCA3fuJULNhZjSzcendvUYwsCAjNtz6YWCxSDqjH/9Qq/vP1S1z0fzgBr2Cn7eRx2OvAHmA+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=652 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220124

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>  
> +/* Applicable for X185, A750 */
> +static const u32 a750_ifpc_reglist_regs[] = {
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +	REG_A6XX_TPL1_NC_MODE_CNTL,
> +	REG_A6XX_SP_NC_MODE_CNTL,
> +	REG_A6XX_CP_DBG_ECO_CNTL,
> +	REG_A6XX_CP_PROTECT_CNTL,
> +	REG_A6XX_CP_PROTECT(0),
> +	REG_A6XX_CP_PROTECT(1),

Is it fair to assume that we'd like to saverestore all CP_PROT
registers on all SKUs, always? We can save some space in .rodata
this way..

Konrad


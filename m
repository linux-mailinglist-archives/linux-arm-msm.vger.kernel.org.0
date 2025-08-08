Return-Path: <linux-arm-msm+bounces-68133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E753B1EDC8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 19:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05ACC3BB496
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 17:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A37E1C84A0;
	Fri,  8 Aug 2025 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SENV1KcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898DC18871F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 17:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754673749; cv=none; b=geLeUscgn/Ugi7e0y4JyfOlgiIVplLn3VtQqdChwvzVoKMbrfwCjVE6pfXtEFOChqG6uk3IyZ7NKjfw0HqEN6+OK1sGCj/qqKBdvOAKqfSy+YB9FbOtXnB9DNSEOtAitBJgLt3hWaBNIjajvDwZRynfbavZqr+Ix986Xj5ulRe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754673749; c=relaxed/simple;
	bh=3WAdGz/hYjVsYN/qu58ud+DcdAdBOjsHo8ffxFaZN5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGczK9S/LJfg6R+af9yY6TcRlaa/c0JQ17HQwxQWhkyVLXKayCGtYfPmkP1K8ehi1nkxBrfgMMZMFe+qg4Bbz5CBLIPnkcxP/bG37oVYcNlqWcfw2N1nduF+mny9ldL7KoYpusM/wU+Qolvs8lpQl4uFXx95VzA12imD4k/V/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SENV1KcE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EidlQ003895
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 17:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyBcXhZj2R8UGlkk97Lt6qighcQ9HpYxu7rqj/QliiY=; b=SENV1KcELHeGZRqf
	IjVMPy8ZWUeiLQ9+XVXT2Zp/RN2dvaXHHww0ldnOYODlJn+b1e4NdpvZ8Ey2bKZB
	2Lpvvn7SkQs1xRzHkfMY8AujzQ256aLJEb/fu09g77Xg/7znQPZw3y7Roa2v166I
	kVdyoDW6bRGVl1mRIV5tYIXvGqG/InfGDP3sKL9AXYFjpMHnM2B2f4m4ctKPJiDm
	mMySRYZvJoslz8SBkVrZ0U9fQ6HpgiPBI7/0OWBmts9g1wVsxCJoebg9WVMrXbBn
	4iODIWDyfbeLZaNPu9OuzRbzcUPr8BRHFzFy62/v2/TpvLSFvMdsf0nn9MOa1V1A
	VmuGhg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyajs8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:22:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31ca4b6a8eso1793393a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 10:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754673746; x=1755278546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyBcXhZj2R8UGlkk97Lt6qighcQ9HpYxu7rqj/QliiY=;
        b=G3youVlOu1ZvHB1bYx4+id78yjUId4zcrjrrBHmF0XDzVX6yRByhTthpdAR1QiRUQP
         FXzgVq8TSrCUfVIZswWdcS1PF6xIMSeQePGLoLiRAmQywcaRHPV62wTGIfXYouVZba3H
         C6Nt1BPnmv6CLmXL8fCTUu5sFcak2KFUL+efSy77B8pjhQRDkBDnOiekC6+KpjIflNKf
         u5S9855DeDBtRrP3kHX/uEISjBClP6QzWnPHF1Fu/YiexvfomtleQnIpy3edfJxJY9u0
         aTxCJcBULGG1GZhlBqUN2n+8tJRSEwooBdIEKlCjLaZtHqeHCumB9VjrJ6vzljIho5mg
         8V4w==
X-Gm-Message-State: AOJu0YwEraM6oUIht6MVrE6CM97CymzZg319p3J74GvHhIP2ZW3R3IBp
	SNRt1mrM5B8FLR2efgXb+8BMt93skWqOmP3iUzXitGE1EJTQytRKIVpEeP+XDm8dESivZB5saKE
	ESEE4sj6mrGoqbTHL2hd5kChGLnJrVTn0td9pV8Y9G3KZe9nc7N73bI+c38mGDzU1AVbx
X-Gm-Gg: ASbGncsJkCwFxyWiqgmpQytjRjIorFFwWesuQ6ltM4S13/VcXTngce3MKvNSfab2RzJ
	iW8wT8AIcwfCPXYOeIQHF1RWw90CVDqm94TopJvTFGNhQ8ffQCQGCuKPIV6zB2UEFcf3z6hUWaI
	g0nMj+dzvhx0IgrOSUGVi+MSoBKvNuE5NyEtnTu93HZX5X0IpZuGMoqDpD4bxzWBuFyebgVaBrs
	fs7/oh4toEtiO4IKU1mF14Sk9qe41uT5pPKnnl2TKysJHwb7cp+M9Dbmz9j8uMVfGYKvX+7pklu
	VD+7vpBi4Bg0bjK+ndOAtka3eeCYCz2zutf8G92iHQjLFyECCKmh5ZNaj5jJM9yW
X-Received: by 2002:a05:6a20:7d9f:b0:240:1132:6f0 with SMTP id adf61e73a8af0-240551eeac0mr6475866637.43.1754673745697;
        Fri, 08 Aug 2025 10:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi0ezLAvd5RkULpFWK7WLTaadsd+/Ps2gsqlHJKq3156s96y5T3Pq4HOvg12o43Wrff+vHAA==
X-Received: by 2002:a05:6a20:7d9f:b0:240:1132:6f0 with SMTP id adf61e73a8af0-240551eeac0mr6475822637.43.1754673745264;
        Fri, 08 Aug 2025 10:22:25 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.234.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0d14sm18058211a12.41.2025.08.08.10.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 10:22:24 -0700 (PDT)
Message-ID: <ba1d97d0-3420-4cca-8823-4d27cbe7bae6@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 22:52:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <937197e9-09dd-4f3c-bdb4-4001f5217c07@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <937197e9-09dd-4f3c-bdb4-4001f5217c07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HesQra03iRMX6GscMRAlUFQwVu5Wb0m5
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68963252 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=YZlS21pjlsXJIaRBoB+Oqw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=g_v6zqOf2VaQD3ULXM8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzCldlsfvSCew
 3YJmT+RtacDhQ+fnG1wHs1W1U0+n9dRvrqh4e9TNr1FmZHXwXumUYlaH5glf+i7q68i1Dg/ANQA
 U/ndi1OC4tVaSuRIWcF1eF0+YjEaml04LpyQW2DeReg8DmuTmPb3DnjN6qg77AClEUZ8Z8G2QyX
 qXJroSvkUj0jPVCqy1eOOru7f9+nFsHyir4CHnrQraL5kKIr6zVxxIzMxxQBCghOQ7kUAt+VCbN
 SE8tDZYYyTfNUIBLT7M3PtN0NXAdkuQYhv6CSdMS1WxqF+AGFoeGQkLCsbk3VJ+mdmoaGPY7e/Q
 VZ89oFk0BBfaaA2kE4mv4J3Xn44Dfv8Ix+/JGDEZpC/zvly2qhV256nJN4TQd4qGamB4Lp1LYiv
 LXhVbHVr
X-Proofpoint-GUID: HesQra03iRMX6GscMRAlUFQwVu5Wb0m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/2025 7:21 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Since the PDC resides out of the GPU subsystem and cannot be reset in
>> case it enters bad state, utmost care must be taken to trigger the PDC
>> wake/sleep routines in the correct order.
>>
>> The PDC wake sequence can be exercised only after a PDC sleep sequence.
>> Additionally, GMU firmware should initialize a few registers before the
>> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
>> GMU firmware has not initialized. Track these dependencies using a new
>> status variable and trigger PDC sleep/wake sequences appropriately.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> FWIW some time ago I made this patch, which tackles a similar issue,
> perhaps it's a good idea to merge both:
> 
> From 7d6441fc6ec5ee7fe723e1ad86d11fdd17bee922 Mon Sep 17 00:00:00 2001
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Date: Thu, 20 Feb 2025 10:28:51 +0100
> Subject: [PATCH] drm/msm/adreno: Delay the Adreno RPMh startup to HFI init
> 
> There's no use in trying to power up the GX logic before we're almost
> ready to fire up the GPU. In fact, with A8xx the PDC and RSC uCode are
> loaded by the GMU firmware, so we *must* wait for the GMU to fully
> initialize before trying to do so.
> 

iirc, this wake up sequence should be done before fw start. That aligns
with downstream sequence order too.

-Akhil

> Move it to right before HFI init.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++----------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  2 +-
>  3 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 28e6705c6da6..3335583ada45 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -513,7 +513,7 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
>  	return ret;
>  }
>  
> -static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> +int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>  {
>  	int ret;
>  	u32 val;
> @@ -842,19 +842,11 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  	else
>  		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
>  
> -	if (state == GMU_WARM_BOOT) {
> -		ret = a6xx_rpmh_start(gmu);
> -		if (ret)
> -			return ret;
> -	} else {
> +	if (state == GMU_COLD_BOOT) {
>  		if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
>  			"GMU firmware is not loaded\n"))
>  			return -ENOENT;
>  
> -		ret = a6xx_rpmh_start(gmu);
> -		if (ret)
> -			return ret;
> -
>  		ret = a6xx_gmu_fw_load(gmu);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index d1ce11131ba6..309305298a45 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -216,5 +216,6 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
>  bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
>  void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
>  int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
> +int a6xx_rpmh_start(struct a6xx_gmu *gmu);
>  
>  #endif
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 8e69b1e84657..9ea01daf2995 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -910,7 +910,7 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>  	if (ret)
>  		return ret;
>  
> -	return 0;
> +	return a6xx_rpmh_start(gmu);
>  }
>  
>  void a6xx_hfi_stop(struct a6xx_gmu *gmu)



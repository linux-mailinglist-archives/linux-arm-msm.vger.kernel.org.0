Return-Path: <linux-arm-msm+bounces-83612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB1BC8EBD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 15:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 881FF4E52DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C761FE46D;
	Thu, 27 Nov 2025 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+ED2TXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXtp1l1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D921D5B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764253535; cv=none; b=kQsssZWLcXCrsDQqu1KOROHpfj8vA9xMjBVIdrsQHXqWB9dbysLOKYSlvbRw1syKxJs4MGtYPF0mHfjgsX5OGAhLmkGf99NFPgh0uIDpPIujyXenBk8Cd+Vdx783Kn7VtsfivqeKhGENddn0ENZY3Py3CdqeODoLVzwW0tqQNhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764253535; c=relaxed/simple;
	bh=+qcBtseFiA92n5m2T1naWIfaTbnYB+iuqMe5ly6ejWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iu0Q8JewhdXbpJUd2IACUcZ+GXQAgY++Js93tD7UTeqj8Q4R49aidnBUrifDVbd93pRM4QdEV4V68W94UIzTBuatWmi3lyEMXnUOK9QwCmK7lde4wCRwL9fFQCUcTJMyoAsSA4t4psH80vD0FMPT+j3HnghTDS1XMLOezP2Dwj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+ED2TXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXtp1l1F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9xQ103840054
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 14:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=; b=O+ED2TXuJmVoFhaU
	km8EVBUOCpZ3HTYumGT5retiXw2EepI2LX/yrhNaaVRUxY69I9/mOjjmUJNXx1I5
	DmxxdYG6q9vWFmPJDM1tNUecRRbYBVY69r5kdRvtMfUzovwJp9WUHLR4V+XVHsdO
	hMxiwJErYI1jtUjj5UGAwUgau62nLd9l8nINhPmpOTLRXeXHOKrhrGNWNoTZJgOr
	ZZQUFzJLnLANgZL1XAfrloxZfRe/TkX078X766fGui+6m8P0+IzmxXJbareqdHP6
	m9wPqr1LgNAstcsOKZS5oFwCNH6nMyWawvheH3KT+3FVg+L/gVZYFyyrELZDRbfI
	/HpfkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj09wbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 14:25:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6a906c52so1536341cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764253531; x=1764858331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=;
        b=IXtp1l1Fdpo4WDrmbmYJdN2abbTB29B88mwrWpUjqUJqeXibiOK7BAF5KyqyzkCCUU
         TsjkNOpBNOfD8bDFAiBOOzb55EPuqqD5BxDJgcqhrmDXco7EKw0hVWzT/MWmDdzGG6kY
         RuoKvAYNbQ70S/azvHtg/GSOBJnN2vNMfpsRoq93Z7UB5f41lZaMyLEMJGqGpcorRc8X
         yDUZZatxQ4x/MBuJSuujV23H41GWdcrkbwuv3osUkqDZRrDZpUKbgYJZ+JNU7t1wZO2d
         D6RNInALkGSMxmX/+36o5QwiN8birRek5UdpwbjOJS//8yGzjt0q0neTEoPbkTkdANZp
         RcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764253531; x=1764858331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=;
        b=a9uzxFPMWjYnyk7Dy6nRGnmXnsuCiRyaR1QaBwkTzOf34uDDvMA5vC8IdfMua88Lg6
         rS9KJEoFxkbriE2DkhNXzaSFnoVWbKK+h4R1Qtycw7QltlYETzE+43DPx7CgezJiu6d6
         OS6tjWUVIxFXS6gl+0GbHY7du06QlHkU9jupLZcekWxC5NJGiHjTCLGl7F1eipjY4y3q
         00Kb1dLlWp78ABA5/OG9wo2DORE47NcCuXJMhiwpJ9AJIc53x7DoRU+drKbJ4xLVw0Et
         Kqk9W7VklSSTa9M9un4jmUG7yokoHFyMg0nznUXrge9k4V+pBEiFKUtG9npzY7/W15Gq
         oXAg==
X-Gm-Message-State: AOJu0YwnB/E+1Yj1EDJAGpvty4gYwP+TqXzXKYOTi7DyARQ6vaWE8Rsw
	8Kn855BiPZeIKJtGOuJIlGcBiqPdPBLhGSc+iStz2f9L8KVBwsEDywFlvB+YxjNGvTYmYN3p4px
	c9C8Y7+KoD5UFuKid7k4Mmz0AmDs8LA6CrlDfM0dqfOwcxybe2FDYO25jzCRQdANZHObS
X-Gm-Gg: ASbGncshiJNb/gGWl4j5x38MGgXqmAbWy4bh0u/ZiwXzX2+0VF6m1aNiA0/BoDd44Sx
	+icaY2oWMHopWH0Tp95WiFo4DcVPaefqC6t/NH1ccvy0llADTeoVAQTrj+VGtD3451owCYxByy5
	BgoT4Pet9uQtTdrG0GMler+O+czWLuWC0AHtE37crLR/vKAQinqvaD2FUkWLFlEaX9xIjViU27N
	luLzDDr03otXJaLUhrEk10vm499XYPkdhDxgun66/NoodDE6a9P6OjLTtt6J84AbLK65yIZjMpm
	fp9Ig63UkTMmG6lYu8roU1moRPTD9mSIjp/9bWNroyy3fhWcwuG+rUD0yIqF1e7lw/8hZZGfvjh
	9HJAcBNdmrVNXkMHiQoFM4fgLiPugJjThh3Oq+WhAb03tfngATibWbk3FdfLlCIF1b+Q=
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee5b6fad57mr245601271cf.5.1764253530898;
        Thu, 27 Nov 2025 06:25:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1PEAD2AIQg2biuCDwbY2+IKiEBg3avLNdeTwyi+/WMXHOuqe/1V83hpMDDO6bHfXgntzNkw==
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee5b6fad57mr245600931cf.5.1764253530457;
        Thu, 27 Nov 2025 06:25:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a6a67sm172720266b.34.2025.11.27.06.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 06:25:29 -0800 (PST)
Message-ID: <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:25:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwNyBTYWx0ZWRfX6c2kje2faTQ8
 E+rdFQ0GlGxtNTGEMa/HG5jD1GY77BlyfgwuzfH5PGVejlfxuvCfGaz0zWnej61cTOjlpS3JaAB
 gPXOEQj5VlZXS+Lx6rp1a2pUJy/ohZPGjCp4hzlda1nMQzlE0DUb95FtvJEGl9tJjSHc7SQQ7u1
 yi1ltYG9Yto36F7FfrFPb/Y3BtLdvwfdjnmFdIXV3T7r/Gi/CDBfYikj8r8EXw9l2pfJESS/wIT
 MszyaNSKbStnytt/YWZPO+eGVVcSTA2uiBr5ubKYxcUwBSIJZv2T6pis31v3b9MHLoocQNVvmQG
 coNldIpsaGNaqObT3Qhc+ZZVia54lKRyde0a7oyXIp9duhU+Hin51O35dKb+pDliCZJEN5t3zC8
 v0ytfHU5jLFIE3JMKyDz27nBhqCVOA==
X-Proofpoint-GUID: 7RLDI3WwsegUXLWGG8vYjVIos2SUDCx-
X-Proofpoint-ORIG-GUID: 7RLDI3WwsegUXLWGG8vYjVIos2SUDCx-
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=69285f5c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=51bRkEKeLUuq6sK2_JkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270107

On 11/27/25 12:46 AM, Anna Maniscalco wrote:
> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
> but it needs to be programmed for both.
> 
> Program both pipes in hw_init and introducea separate reglist for it in
> order to add this register to the dynamic reglist which supports
> restoring registers per pipe.
> 
> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>  4 files changed, 109 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..c8d0b1d59b68 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>  	REG_A6XX_UCHE_MODE_CNTL,
>  	REG_A6XX_RB_NC_MODE_CNTL,
>  	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> -	REG_A7XX_GRAS_NC_MODE_CNTL,
>  	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>  	REG_A6XX_UCHE_GBIF_GX_CONFIG,
>  	REG_A6XX_UCHE_CLIENT_PF,
> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>  
> +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
> +	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },

At a glance at kgsl, all gen7 GPUs that support concurrent binning (i.e.
not gen7_3_0/a710? and gen7_14_0/whatever that translates to) need this

Konrad


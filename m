Return-Path: <linux-arm-msm+bounces-88376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A5D0E09A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 03:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABD963002BA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 02:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCAF1662E7;
	Sun, 11 Jan 2026 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYpJW09A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jB2pX7uS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2924A29A2
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768097847; cv=none; b=i1hFXTffvAqqxTqX2+xhOt5qiNd2aphHNX+lVd+6trjoL3a1eHWYrObgw9xYEp3QbgP2FMLqPQHDUPLDu0s34Cj38a9IaryDWS7Ume06pb1bcOHCM5AniWNxV+R23UuPkNXUPocDe3KLO3cCSH02WY4IO0mJ2XRhMHF0O02iZro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768097847; c=relaxed/simple;
	bh=nh/mlhxjcskjxQlrWMT9NQOGZJYt8jrUXeFhgdCwzhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6Zq5ifYYwd7qlK9HO6mu0hJAaw4O0iccX6IakrJkn8ZHJJJ2CVXMMUYBVSJJ4s0b0xBK+8hWJaoulmtqdeM2nTNqOQp/vOVU+8AZt+6L9JLVFjshLp8M7OFgSOeG1pHcpzFDtupHPbfOOblunvESVUU0Wrty3JqkvLvrFVRius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYpJW09A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jB2pX7uS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B0e1qV1299301
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qLoao6kS2SqJEVQ2hvvi+uaT
	Ze5ArxvcEk7/jP14InM=; b=ZYpJW09Ao/OvSGFe4c93Mkqb34mydm0Cmim9QU+m
	pq2jkDJmcqeaiKk5n09hXAK1o46PQ1tNXnX1D+uB0LlGr9y0JRawMUc5A8zgJ930
	Fs0kf2WuqELAS7kxSlZElpgs1XOohIKOKvxsXNti4It41Zuo988alyYuii9pYHO5
	vnIAAIeMFOkSDHobM3c8dvDtx1YKMwIgawu+JPqSqarOaHqwlr7EyDMzRQGOrRTY
	Vkqt8TFvJJNfh3DGq4FAeth3/iYaQoBg3q2dm8kd+hcgCHwLBJUozyWkPLrsl4Jn
	vnjOKrCIs7KePzCMOZqK5vzF4HuaLzgbXl51vOHEhfCLJQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqqsnwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:17:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so137911306d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 18:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768097844; x=1768702644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLoao6kS2SqJEVQ2hvvi+uaTZe5ArxvcEk7/jP14InM=;
        b=jB2pX7uSh6FzymwkEKlTukPoOutAD5yU1KH083gb2NyBAIwG6BPcy/wK+NjsERVDrA
         QDLrncSmb93tI6f9papydGYyKfhcwTph0XLg/DJsNXvjq9KTe2ZY5xB5wrQroJiqaluP
         lpW3vkpv9l2wb+95orS3j7WJCx265IT6bLRCXC8gO4PGrUkpisUy6+dCN0Wpwf/xhEWx
         ZQ3mTw3zhFg3MBZ8X17umzDf3AqDbAJYwg4N23hg/jypAQeMFaTnuTjVT0Hvg3Ztj7oI
         R5hv2tmDymFAPsglIlEEfXeWb6we4qTPa39PYFUw9pxsDJQPg7be/RoqDtqX1IIW+yDm
         cdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768097844; x=1768702644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLoao6kS2SqJEVQ2hvvi+uaTZe5ArxvcEk7/jP14InM=;
        b=T6TjFI4UR/ycxfSW0i3f6FbL5hl4Bz7Uq7i02yz5uPx8n3aB8FAIGtMVa+EVNA1YIR
         lKDBJJGKE+MUaUENctjNpqRTW4kvGvOVPhNQiZec3sP7i2nhMeUMq/nmMXzNoItcMItg
         V2KPgm8SR9sQCV+QwncuAGisst60U+uTvn5FTlvMF9XiPMJ72SqOnXXIOVSywZzoExqB
         7kBi4XFPYaRdIx0SM86WfOPD5wNDP0Pm4IqS0K/9+OxEviWwvyvmlaE99LWXiCV2KksK
         NWa7zie8C5l8YJRoPZnHzTw4/0tHh+OV9rFwxgplVjuxjn2LfRJSGTjl83VlE/1xTDAt
         WPIw==
X-Forwarded-Encrypted: i=1; AJvYcCXcGDyLPvdjTCceSwh4bjyCSJCsrGns/lzj5ZZF3aJGwASUIKsEzxVahvMPOcy5Y/ucLXCPxpVGzpRw5jtD@vger.kernel.org
X-Gm-Message-State: AOJu0YzgHlIEYQV6LPoMI6D4OPNtYh77AcvplaW4xCarSbpacdJ1YEJy
	UBekEnVrAz3GOd7CryQPp/a10PQaKIRhCjXVAR7l0XJlMKyXZ2AmKUbfHTfjlxAXRnG0D8clGmf
	kbeKaoVPukwoYB5md/yLhk6/c+yVqElPOOI19/jWjAnUNEblvkbO8uLVUf2E/DDzCtAyy
X-Gm-Gg: AY/fxX7VbnOHBZfyBX6XZD7us54Y+zJj4W/OPyMWIFINuF/K+A3rGsZRDH1irGHX5qg
	dFN/eBrKns7O6psjtOsp/RjITBLAiJvaeYWZB0KkTssM16BuY9nBDuwUlPB50nCtPyvLSnudWnz
	7whUKnZnDEBp4k1ASRcVAvNQuMQnh4j13Y3BmH9oqMlO/u30AkDMMMgIUGV37JCitdG1c1YIneH
	1kdeJax8hJA1TPJAlRFkpVAFOEytJN072Mk6fH1dKjm/PnYQaSCJpru4044A7/vRWrJo+Cuew7n
	knaPrX/FsUeJ4HaLvT4l95XmDOeydmLVVPmouMnfIbgq+1/R/B7KYAG1LX4/VguOtTUGSu+dpRz
	9VueeWfMVQiSvrn/vfpn3IcdFkQrKAQYUvxUJt5wuu6V8c6f96BslWOQjxqmg4RLyix76PuN/74
	/CNq+GUzm5+83NK+gFpe9FE2o=
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id 6a1803df08f44-890842aafeemr218055006d6.56.1768097844361;
        Sat, 10 Jan 2026 18:17:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqQA5LZXpRDzF7mZkW5SnWzW2XokQ4Pumny/S0ypla4mR+vkow1xMAbJvOV3UwuvqWPLqhGw==
X-Received: by 2002:a05:6214:234b:b0:88a:34dc:9933 with SMTP id 6a1803df08f44-890842aafeemr218054676d6.56.1768097843881;
        Sat, 10 Jan 2026 18:17:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b71b7eb22sm2756548e87.41.2026.01.10.18.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 18:17:22 -0800 (PST)
Date: Sun, 11 Jan 2026 04:17:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
Message-ID: <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 639jaIs8qdO9_krXORJGP9yvTHLryzTx
X-Proofpoint-GUID: 639jaIs8qdO9_krXORJGP9yvTHLryzTx
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=69630835 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7AxDZKSYRuUxSVEY4VYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOCBTYWx0ZWRfX6Ww/L06K/5No
 xNUxbuD0HlTofKj3CyHKMSMqYD1o9o/laEoahX/BUNtslLl+HGLXJI95lHjMOnI3b/EqawFRoT6
 jZz3ItajNG+ZxoAO9lLgG47h6p2OSS+BLEgPCyWwxfva7PtI3qtA7O1XRVg7Hzip70rfhFUTsSN
 LkIt7Cu2qa0ZwR0Y17N/xCdskkOCrchMBeyYuZlFgdtSaOtyw3cL5aZc5e3+/0DPq+I6k6WN+pi
 S2YDzTZyX+JRASLW5C/VsY4rqkzSKBKAmLge0LjZocQ9ZbVj+0BeuPY05c5YPY27/AeJwOVplBW
 nnhJmtLqw70xAF8o4BNa4aZZUVm0nYQe9FCcxYb3fT3yZiFJrEy2kH9C4TTmvtx3ALl6614Me+c
 0CMuz1lJ5PnQkuVJ65xRaK5hC0xeywhe8hoPQAjH7lJRFXSY4wruqDMyMqtXdAhoja0d4olZVjl
 WQP7x5cs4ygeC+MEaPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110018

On Fri, Jan 09, 2026 at 07:37:29AM -0800, Rob Clark wrote:
> This should also be zero for gen8.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1c80909e63ca..d5fe6f6f0dec 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = adreno_gpu->info->gmem;
>  		return 0;
>  	case MSM_PARAM_GMEM_BASE:
> -		if (adreno_is_a650_family(adreno_gpu) ||
> -		    adreno_is_a740_family(adreno_gpu))
> +		if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)

What about a7xx gen1? should it also be 0?

>  			*value = 0;
>  		else
>  			*value = 0x100000;
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry


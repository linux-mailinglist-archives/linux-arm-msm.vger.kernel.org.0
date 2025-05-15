Return-Path: <linux-arm-msm+bounces-58023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C2AB7A9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F32727B29EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 00:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745DB1CAA4;
	Thu, 15 May 2025 00:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mykXdNsl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21E34C6E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747269152; cv=none; b=gAAGdc9IP1CPo1x28xLfweVGA15y9HvCSAsRlNFtj6Otbu+c91pqLjvc823PLxOKCnF99XjYfDNDERRSixoEVv6SIb2v7xpQsU1mlqhicen1Q6+ZiHp0j1FCJo/H7isMIooQMxKb9UYZ5PfCoCxFvL4GChl/9hJGzJ0S8PnQ33Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747269152; c=relaxed/simple;
	bh=NqfXuxll00nvn2wxG+WlLr4Air09LSBeueadi9GjzwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYT7QM0s3fklG1VXrpoy+aIFM4xKDr/yWxHZRXkbAIqSuQTUwd+OHdxqM7/fLAic5qdJ5bujdndCQU/FxDop5wtasaGzVvGrXmddVKI4gTqccs5guesX0zx5x1oUHyI/6uLPptYtUvbYbPkKNgpcVCvtfGH5ZYOX+wM8Fv8qlCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mykXdNsl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKF3aE013189
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7wCujduK3vbMXq78OiNobIBg
	xC9SjRSYXxxSDTrP8aQ=; b=mykXdNsli6DB1Z/HAfYnvDzduCMYjw0RYMQ96WUm
	fCqJQFsoEqTBOkSeT+gyw4xS13xzuEhXgKTyIJvcwG31dtwfKIf+fNfplr53o7fP
	Z0U69kpxlca7C4UB6uTmryTmvXIfMjt8oKV2CPvMKbQWfs8iKjf+fnK/atbixxAA
	V2zbvYjW0fjx4PCMowInXehOQrIPbRVGy7lKgxRW1o5WCUKLfwXAA7SjlqVlsFSZ
	7wK+VoE1rdCMI3E3lb7j/pVNNRWpuy390U/TQTij6ghjGBA7DSmywWIV5/dK/hZ6
	X/bz+0clRAHqgRTfbrY7n0RnhaMSgCDCMjW1KDa/q1djkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmmgf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:32:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee988153so65109885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 17:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747269148; x=1747873948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wCujduK3vbMXq78OiNobIBgxC9SjRSYXxxSDTrP8aQ=;
        b=L0h9y5/7kAGDXxU0ozdt4gDJpevobcDAzx3GvZaSn2mzYrM/d4jJump+5dJf26DGbN
         3e7p6w2dhTaGHzfCxs0zHOGRXhxE0PtINuTTLyuaQwraI5L4YaRRCjoDlbkENvJHsVk8
         XOZXiVFcjORLlAR33mySHbI4+zxQAE6RwUQal3T3ifCOpogPzQS+HOEmje/KB913JsAS
         +Kdr1OqKLSWNe6wGoPcbxJXP2ECPgdtJnbwUl5LWzwbvejtAhw2iNIJP2UczN1N8OkAL
         V7YbyZLNMNaRj8wdhOOwEX60xB6jCWo8C/9WTN6c43LDh3aXBY7k+31pvAhzkRBRQkp/
         g18A==
X-Forwarded-Encrypted: i=1; AJvYcCWvmf2sl14VKoI7OKwwOR10xCNE+B/pUSGaLUfZXT2Ad2o5ZYrapMxUzXsjQeQT25TM8pEHEf6Dclmn7/IG@vger.kernel.org
X-Gm-Message-State: AOJu0YynDsrZ0wcwgjHLGgzaG4pJTPkuYzS0dXNcr19UnppXOTFDMkrL
	OCv4m5k+m2Rd0BZz6QxKVhqQVPdO/P547K85vlsXMWVnMTyXNquBvH/ax57FfrBTazt+n5dQIFD
	NNUx9YX+Qaz3krTtcy8uChKy7E8Ld3JOAMgTEcSNLKM75z7+/Hb+aY3i7LmeIZMDs
X-Gm-Gg: ASbGncvcy/tJy6VOfX67OIFkDvu2YhQLzXwkfJwI+5AjP1aXF09lo2N7n6Tm5tqsEGK
	P9O2YCZ4/jdkoFlal1b0ZYsXnAIgfyqwVWDwT0nkYFHFi1yqGMvJ0qy/MGh7FG94SvXBVeaeDZ5
	yYxQlBMJpCvhswWpDD44f5AEnUDYK1yFXyst5EkcXvbtDU5iB3pAAcfpae2UtcDIcA1m9swenkG
	+6p5PkpQgJb5ypjW99Kk1FNRayk0wVCHv8rg3fs5CKPnriqczJwV2x9JeXfLHSm3asL87cHYaDg
	aXuXeKLERREAcfoB7bIBv7GLedoZHLR22RGlADeur60WUX1gvyYVmhzfqefEzmTk4ySMSL8OBMY
	=
X-Received: by 2002:a05:620a:468e:b0:7c7:a5e1:f204 with SMTP id af79cd13be357-7cd2885d1camr804937085a.56.1747269148588;
        Wed, 14 May 2025 17:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFLy/qxzAK6/2dzjOlUxFMW7+rsjpErZR6f687TEG75VgVdyNraMDrOlRULwKla6JyuE365g==
X-Received: by 2002:a05:620a:468e:b0:7c7:a5e1:f204 with SMTP id af79cd13be357-7cd2885d1camr804933585a.56.1747269148227;
        Wed, 14 May 2025 17:32:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cdb5sm2435228e87.57.2025.05.14.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:32:27 -0700 (PDT)
Date: Thu, 15 May 2025 03:32:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/dpu: Remove max_mixer_width from catalog
Message-ID: <zymzf7cfy22kdlh7iyirzfrcmovaogkjtfatzt7lcaldymm7za@ppde2klezccn>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-5-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-5-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMyBTYWx0ZWRfX/MkWAtIhi2e+
 AFgsmlsOAqQTk1UkiJaKUG2lvik7PjRllsghvO2SDUWbQFqRVs77rEclH+oBWeJVFREX2TsPdzE
 VQ48G+jEizpqpL9Ap1LN1GYdUtc+jNh/EwLpX6lJMqszor3Gqi5up94huA+BI+SqgBHhJcF30rW
 TR0eFR4i5I2KBv1e21L9Wj2D5Wx3xZjpSRIpEp8H29KQgsPjVbyuUuoNc6Pt7nCcYjSgw0vK7BK
 V8kPRriGsPFFwYBUq+yP3ztv3h4iS+Ox033Cl18nw4PhnYiM7X8fCwTJeZSZaV8y2jZJB3dK19T
 fWaTEh+tOilJxUOrV5Xtt951QVj0OdWJ3w2aCU6Gm34lpWsYs4iBO0W47ij8dQFz2LobcjZN7uw
 mbsuxEoHtdDmjOZZvppRxrzFIVx+4SP1n4ErFm/GqLj11328jnbwMofD+sUzWaFF0EovdY9Q
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6825361d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=uPaXGRBW1wo5ZQqY0uYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: q5Bof3lFvNX2rhtRgzE7Eaa1l9JQeq0N
X-Proofpoint-ORIG-GUID: q5Bof3lFvNX2rhtRgzE7Eaa1l9JQeq0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=848 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150003

On Wed, May 14, 2025 at 04:52:33PM -0700, Jessica Zhang wrote:
> Remove the now-unused max_mixer_width field from the HW catalog
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
>  28 files changed, 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


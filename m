Return-Path: <linux-arm-msm+bounces-72141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B13B44A18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C3FB4E19EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 23:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEDC2EBDC8;
	Thu,  4 Sep 2025 23:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndKRIeWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837E2E3B07
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 23:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027081; cv=none; b=AmGfa4sFnoe4WtVhP+ZkmFBY/gpGUl5RpT3Qk8gGScO75uPBco3rOHLhSU/57bjSP/0Q+5aZSQ9vET8CnFqz+Q2cIMl8ebUUAKHbpvZHi8U98i94aXpJ6PElt5isrT+pfkmsnrPT6YiogGSvwEIuYkDtV2Xoh49Vv/esJOqZDhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027081; c=relaxed/simple;
	bh=CaZoi7xlGTITN03Rjj7zYchtrmw8+uuybVBMH6eekaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yi95kqEZmHQfDNNTm7r59aZA8OqMWRI0m6wIf+Yr7YivLvTN78oU5ckqRMMbPNvCaozeRcVjw9tRQT6jZGSTSJ32a/20NoXGNfJsFe+8LRj+8Hy0G75vSblq+ZYzHL3jHOS/tzG3ePk+bVvpcY3HhoA07xdmMmkoclR4lIux4yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndKRIeWU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584I3JEh008120
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 23:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTGAHvO3dzWq+EoS5uNJA1yAwMH+0tq3Qa7fTg/qeOs=; b=ndKRIeWUxsKm4r9B
	fkR9Vy4opdUjNOAoEUZCVRmZlDZuAKklzixJtOmrH8fKyqYbXmyPWsPHQTY4SUu8
	MT+ksulpUrWVX40qXOYEKmL8Uw65PveiomSAnElpPjGbMaIfpwYpkEQpNB/6usos
	Z5G7xCR+qq/3q4LOhnUrSWMzF2GX8243GvuRAQaRe+UTYI/JohHQaXBWOw92Fazw
	YyeTL8VcvQnIPFKZoNSd8lAw3mJ3sS475UXikkpgQGiiExFkGvH99JKsOCwrdDMF
	ktZxVHPlcAl96ALRYvdQ78+GwROlQzZlxiCbmFg6dM376m/I/KTwlsk7IMzEqw8T
	u0UWyw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjs3ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 23:04:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-772642f9fa3so2479346b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027078; x=1757631878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTGAHvO3dzWq+EoS5uNJA1yAwMH+0tq3Qa7fTg/qeOs=;
        b=cvwjgP4/nH3PZjUy2cJTwGYKIzyxwwhApGvtcF01FrBVqRDp+X9/t58fjyHSybAzN9
         g7eZJMrI8k9o7f1eDjJmfB0e82pBLSuoDT2jd/7SuzF+jFwve36x9jCthwLeyWku6T4u
         VebynY3UlZiE/gyT+TWWe19rWPUwkefnkfUUxEsK+95t4t95mrLVTMnW6ev+35mEK4Lo
         K9eZhvU2MOY+oHcSyCwvERbyByiyZaUYqfgr4aMhb0ftLMXAA2od9eVDX6+9i9uhT/ue
         cxUP2cDRg+2to/NiLdApwyR/qPdjWvm0neKEw+ZVHqWIeDhKL/fYqcZsHVbUcLdBZBz8
         UkRA==
X-Gm-Message-State: AOJu0Yz3URt5Hf/BgxR5wd9O2u1xMa1CIKwDFnbkcrYLd5XBHXz1kSjR
	cwO/fsLZe8nKvP5yPyYrMcm+Q9r3y7H5mM5BPRHNOSmB1w/+pe6KNxiG0Gpuxa8tSeQNfsg/y/+
	CVtmbTRLGeDb9+xtPfy+euZMftY20oNmVXV4PnwzVyjQzUdLqP0Z3IlwdmstLhy6DFPim
X-Gm-Gg: ASbGnctFmB/FqTt/z0zXVaukbgI4Uieb7g8qD8j1ZnjIDrMKF+LBI/FBZvdx13SL1wQ
	ebLRLV4VhWmcsZbZz6pw6Z0CVFbgxjoLs2aVzJdnmJFEYOw7/5LRICI/SKCA647V3/th8s+CfvO
	frltDOhsoqkU8ShcbnCmzu9yMRagrvMvvwYyO7/m7LW2kO+87jB8uCZa/dzCkzHoM7ym8zU9V6Y
	xdRCDBJl89gfz8pZSDcfAywQx2sjYbZlk7slMgafSmoskq1YQdKScQxxQLQETdBaDGQ4zAIgLEx
	jggX9u5xXV1qi+fCl8Z2mQKjtygr03uPfEglE0FzoXAsmg+eE+5S5/jwKF5ugEtOPBWHJ1t65iT
	7JqXBQ8lC7TLxLezaDSyDDA==
X-Received: by 2002:a05:6a20:2585:b0:24e:3021:dbca with SMTP id adf61e73a8af0-24e7cc21f79mr1728270637.4.1757027077748;
        Thu, 04 Sep 2025 16:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+iA5dJCDJ6EKl6d9KKQ/arjY5Bfhgn5AoMxnI2wmHjrjJTPiDNbZX78JO/uNCpw5DqrwAAA==
X-Received: by 2002:a05:6a20:2585:b0:24e:3021:dbca with SMTP id adf61e73a8af0-24e7cc21f79mr1728238637.4.1757027077247;
        Thu, 04 Sep 2025 16:04:37 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4edf7ed519sm14309145a12.28.2025.09.04.16.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:04:36 -0700 (PDT)
Message-ID: <7ac0c9f2-754c-4ba3-bde1-fbde9f3aab33@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:04:36 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68ba1b07 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=djW4e6U6kngvZURYzKAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: pl_derGW5KWyXMnIfcgakP4HbHj1Qifw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXznV8AeAkgGPw
 zZVSl3Pc/mFTLzzBLQ7O14ZsaV97j2/E58uSnTH8PKj/4NUoAAcMN6Wp1eqvgE9iybnXj+enU35
 WYhxcZgdBM2vY62iy4dCyr5firVjZoMA0riCFsJilBf0Qh3zDkQgSjEd7l6axDzOEDEnSZTYG7X
 ZV79Q31mza15snK2c/6kxVlBsrogHWDsBbOBQcskushJVC1vT+sW6h8ijYh+wCy5mouqGMUvTLS
 bC1sQHpfSiiV6tRBnsQjaXp6leN6Bk+kWGJBZ98BeHRcyg5XPTjrIgONFqCpJpsbS4RRToHN1Qp
 v7L/PyBJtFAmEncR0LC9WoYqVkvaDNnDkPllvrnGDA9ypuIiUI4tD5OhpHT2UHFAwQRQqjGzV94
 GMxtR+Hi
X-Proofpoint-ORIG-GUID: pl_derGW5KWyXMnIfcgakP4HbHj1Qifw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 6f5af26d4e2d43414281197bf541e1ea3fe211f5..f949810567d83c5924f9dd127261e7d523921724 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> -#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
> -flg, fm, np, th)                                                          \
> -{                                                                         \
> -	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> -	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> -	.alpha_enable = 0,                                                \
> -	.element = { (e0), (e1), 0, 0 },                                  \
> -	.bpc_g_y = g,                                                     \
> -	.bpc_b_cb = b,                                                    \
> -	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> -	.chroma_sample = chroma,                                          \
> -	.unpack_count = 2,                                                \
> -	.bpp = 2,                                                         \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
> -	.num_planes = np,                                                 \
> -	.tile_height = th                                                 \
> -}
> -
>   #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> 



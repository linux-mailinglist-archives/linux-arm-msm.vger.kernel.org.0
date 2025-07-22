Return-Path: <linux-arm-msm+bounces-66088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C61B0DAE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A15F43B41A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207DE288CA7;
	Tue, 22 Jul 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRZG5+pM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12A19C546
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191116; cv=none; b=rsGyT1WRHfcM+aklldULQ9FGFq0bAuZGh4/QuyH9bYtIkulDsKstEdlLuquWxwV5peTPp7kN8wAWH7r7LeoLN6ASQdCnW3U+TgPIKwB9XQfUgkKV9N03ERt7PU21J5Fpzl8bMkBjgqrTSOgfcDcC1vJUl/eXA6K0dC6BKSbgMwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191116; c=relaxed/simple;
	bh=VAsfLGbYMl2R6CWTaL7KdBFdZDn8/uNx3iewAiXRI/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bn0OuWHWmkDP55L/pXYr6yAsPraZbs1YjSHxdTjimjHns8ZoYaQMzW3hMmzTVgOg0GaT8qEoWVE1i3DHYV6jbiDSmcNpBXC27MRKG63mLQN2El3exwqfXq1qOvhvm4Cmw/yyk06eV626OxPFh6f333P4HO9D0L9Dt8hOFtYX7QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRZG5+pM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCSoMO001178
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/WYV/IpwzlIixikGjcsvi3zZ
	74GtvTpP8nq9H/FHkKg=; b=ZRZG5+pMMQG/exv5HIGHcksPfdI/QuZuiTPG+cMR
	J3hUMfyzApODyi3KcmexgOhbubANojyyjkN/710U2+G8jNJMfa8AW3iZ1p/Sobnn
	ew1D1iNMwdnlCDFEBJXUewe9wg0xci7RkWO2S97OacM/4q2SGF6BA5ixcDhtH0ES
	y1nctE46QRqHDTMLeHyKjkZr1NT5RwGIE3vaY0yzevjwOh3AHCf7gSCx5zSn4EVM
	eazoA+n/AoM+Zw0iMKj5ATVq02Q32o/xvtz5Y3tOcKsW3abkqpvjQqKezNlX0G6F
	DRWSwRMYr8IJV3y9OTdJdZTRv7MRVrLt54VKKuG/JLApjQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dhe3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:31:52 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-40ab2c50f7cso3967048b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753191112; x=1753795912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WYV/IpwzlIixikGjcsvi3zZ74GtvTpP8nq9H/FHkKg=;
        b=bPcd6N+bITICE5gSRMMFpX3PoXZEUPEoDxF5298jmKcFOrTKiOM+IthM0ViIMJteLl
         ZMaSy1MGffwbec2STvbIdfZuFuk57opKbK3IUKf2f5Uf4YP4rwjrg+QessyXUVw43PEd
         K7xXCk0FWF8nhOiOpCQP1tssV0bCN+xncgx/CdhGCPqXXKlGO9Ss6Ah+fq24KY8AMxUo
         2AN4HnZVNpZ77rErAax4jjZ2aN5sChw3voF56UVx5DeTE3FYcNyhrbc89sbqyVOvx9ZI
         22rvc2aLDCHWjZeZGl84S0mHRuBe2ozypnK9ZzYQDJXhmwPMNLpl/q0DIOOtiP5Z1aN/
         GUzw==
X-Forwarded-Encrypted: i=1; AJvYcCXXbM7YuVdF/X4uaNNiIg1/3gRTWdSy1QBeJcuM+KQB9kizCs3DcmeF9Yj+5uuARrsqYQdXspnhevQs5eOE@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPgdSiuzmwGAiiL08NZqzeqa+v/O8j+or5CxF4BvkZbe5EyP3
	LnFGHjE8udilw38SZ1xrKj8fCoSbCjZ+jXXq9cC8sSYLLoEwEPYDFqrw0/n54md7D6IeXhzcIxy
	/UmYM3XGpwVzKjAGVhn+6tXr05//SKmYP116n5FJurLUeI73I7oMQn8hNN+2bnWmdRaNt
X-Gm-Gg: ASbGncvFxxtHYmi8Y+pXNHwzVoqWXBDdc0IeH101jgG8HU4ZDqQRopBDgpSiBIGU7fD
	zOXv/YE0OxGUWX+vjufX0nhyYE5oOMWHQNdnx30XOH1Fd+SU86jWX4pKFprXkxk0/YDb5a8hEu+
	1oF9evOkQida9yMCQF7mvsG3pKZ3yVO5agUs3TLS5zE4Q9JP/czew2clIDB/ys2XD/ZrctS7Hip
	ozpRmIihklrHO1eoVoynAaqnpEzSbuST/9+POc9ko94jjf41azfOqX+EO23/DNHMkZhvq26c062
	RD9lq7JQxvzpeBrjLelY+eDF/0mWOoc/7WWE5zJW+nIzytm0O+6/I63SyDGuvEu+XB26QmREitj
	8OSmQcj6UScpnj3KL0EWOZrtcII6B8xucnZ387qrTI6F+gG1Un3E+
X-Received: by 2002:a05:6808:2f06:b0:40b:6531:a43d with SMTP id 5614622812f47-424a564a74emr2971614b6e.2.1753191111436;
        Tue, 22 Jul 2025 06:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXXNKpQVAK8wSW1rOSvcuIJ90cBPFt5dTO9JhQF8U4J1q+bkg1PNkAQobLqYbFNvBZLVqrjQ==
X-Received: by 2002:a05:6808:2f06:b0:40b:6531:a43d with SMTP id 5614622812f47-424a564a74emr2971571b6e.2.1753191111029;
        Tue, 22 Jul 2025 06:31:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31da2b3dsm1952626e87.183.2025.07.22.06.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:31:50 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
Message-ID: <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f92c8 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=c4-AqNUvOhhRGI8Ju6QA:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: hZwRREbN-yRCyBw_UzaiJ7VVFmFEwtLY
X-Proofpoint-ORIG-GUID: hZwRREbN-yRCyBw_UzaiJ7VVFmFEwtLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMCBTYWx0ZWRfX7nsNaWyZuPBG
 cuRjXwLDd9ksHxJXVlZYra3pTb3OaFVvh91Gy2IEeMc9SDRLhZQS2mFrLYVXokKWP/NJ1e8/UML
 KpLD0SFXeSAS1IwHX0jmlIvy4btnefOU6I0x2vkbl9FXfTPA15EY7vLKz1r8o5riNkv7o+LaZzw
 CtE+2vf6JEdqUNaHVhNHbOJYhamL+a/JOE+Yfe7nMQNT8jqnJDARmUyJWUH0BiEVN+nfD1l1f6q
 HO5ImbES9j7B+fNlQA+9JZPfSmEoJtZwq162aOi2n/agEkgeXBWODqX1oxgbnXCGdDR3PMw8Trm
 Y0rSyMEXmsWQexY/CaQL1VOWAYbAw3m1fuvoiaRdo6Wwafr9lyTE1cbP14qb8JYbRUpYW7xr2Is
 AAYghXq93bQKk0SRhysQb1oBr1hUzGCbb7nZFwpIMHVe2FL0y1nl1oqPZ0NN/Ajrgj9uyCX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=972 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220110

On Sun, Jul 20, 2025 at 05:46:05PM +0530, Akhil P Oommen wrote:
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 

Fixes?

> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		val, (val & 1), 100, 10000);
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
> +
> +	if (!adreno_is_a740_family(adreno_gpu))
> +		return;
> +
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
>  }
>  
>  /* Force the GMU off in case it isn't responsive */
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry


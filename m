Return-Path: <linux-arm-msm+bounces-82114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5BC6470E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6FC23AA7A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FAD32D0FF;
	Mon, 17 Nov 2025 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkHdYpKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MF1D3kGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAF5271476
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386908; cv=none; b=QigUpszPvkmTb+vn54GSubdFFX3QafW1fqxM99jhtgvGvSAnBwlj4eD4xK8ttP8gu8UY64kKRSPyD+gmTYex0ku78hBPPtfojNG/qwI1yyJ+f7TSIOSVmNGCTJnNUEntFIcLJPBfDS4CgNV8fNCZvCgGAK8jdMXIWX87eeDaGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386908; c=relaxed/simple;
	bh=8a84pViuexKT6/4bFK0urRx6KpydDYtLrYiRSoDiGZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FY3+/seweVHDTEfLpmd/mKwNmvihVYawlr/0fdU1MUlPb46O562OrgGBZ8etOt9l84XD4LJ9i7oZvsPnpm+vayvfnug9/ELhc0j7YPWKcrrY+yqXtNS7X9/WVGWKBFakJV3VXd9m2j+sYe23Q32GXdSiJ418hveLrISvnF6HZko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkHdYpKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MF1D3kGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAKbJ43933109
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=; b=NkHdYpKySJIqD62B
	iLM+aTqSWr/EqWltK4xwbCyZRhPw79ywpwhzIYfQUQOVrggF6baAGuIz2nuKN4Al
	ElZ5P9UDAuMxgiLjfCZN1Bha9R7xshmZvHhdG6jRngHrtmjnarTjgAn5BGJPHurq
	uXGRvhAw/ceWxizANbFEQ/SZxs629YCGC2lPy3KUxEGQa02XFtEsyxn8PdQBc6cz
	4Be6WFPzuAeDt7BeEGsYkiibpbAZ/no1LZUlTZsqq4EdPNQnvoGpv8EDdYNE9nRt
	xi3YNM1zxuxUsL7eU6tsw+EcCc/447db+NioZVYy1rs/EzX7NA5qW1XQMvvxvfhk
	749AIg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v90hjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:41:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8800460ca8dso18828326d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763386905; x=1763991705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=;
        b=MF1D3kGqPm6Yi6I8pdsicTXRq+hn4Ql8uugwNtKAJmP+1FKRe1mmak0iYaEn6t0BTJ
         QVw/Kfe2czPGoZp4M30HS34WnEKBd01PCwXR7oZ2h7CKsVRUCmedlHkpIYwK7eU735lt
         /KDHo1HVhvSO89Ld9T0jlzTe9/Ltq7HgVxhqglZKVyY+l8lkxLbqIZNhjxuZcrRyN1zL
         Yzu2oBOjJbe3xEZXPyRBjW3iSEGFwFkKsfLMkuHk8gH3QiXPmrjG+nQRKIIqViQUGskY
         sjsSUAdbUbFITK6vblprT91H8p9Iwq7knyA+V3h4JrKfqiJl60kkTgg8dRXgxNGEfAr6
         SHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386905; x=1763991705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klK61PXSjd0hNV0oaWV/P29BTB/za3rlPJ5baCM50Ys=;
        b=kVLFpJOkVChYK6VFEGgSv+xVCZGQE00q3lYIfz8V5ztFRwmUBfSJUgHyxI66htukqi
         OB3UXmHGLNfIR2aWlJVK8oALKni6pZAcXHapBSYshJTeWvoudintv3tYu5eNGlUdjwsC
         YiWAINTsjwqv0ZKKLJXf8rG8gQv7B1uj00f2Mj1HThDTSEQjImuQKMKizBX1xsU18z/P
         38mynfkxNki92aDFdr+WmmBf1H3Z5+noB5EqV8IZV/F+16iycHah3KlqgpKUxyntD3q2
         a2h5Qm2vU2k18WwZfk+hUmQu56V5GxRJJmMTgR8wNwseHL55nrfyB+tgHaEyKC2fBgif
         hUFg==
X-Forwarded-Encrypted: i=1; AJvYcCW6m/pMj097hp9KhE9ECQkn+XLnNq+6PIXAQ431cBlqLzLo9WdONvibR03j0IQxASKwuR43N1jn61r6K0Z2@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ40zmMGxqoT5Rl3WiBiwkv/VVTGHIwFgO1xs26GNsqQOfCUEU
	aYRLZ+4H99ZWitMQhaanU4dV/dD4L+nZDYyfvcPvCqrtsypB5i46ZgHVLofZup38FaJPBhDDl4P
	DpQTE5A1pIv6DOjCyRiyPJ1M6S+1/icRsdOMKMLPLcav3tghfvj/9G7VD43uhbdFLqKmCvDuKDj
	d6
X-Gm-Gg: ASbGncuR3hBhU8DBCs6mmNWUtKdqqWQ88jCG+l1cEWOLMyluRT6GG/1c8oBV44l+SG9
	Z6/5JpDh2lHCoB+S68lN9mDKTCfRSFCbn6f5nJFmNWJyV4G2jhRTX537aEHY1Dghz8GInkn3WoF
	qWJJqG/OE/+fgd7ZpfcRnIFySm9kjCMsU+OIklZFRCVbaooojMcbYdfuUYR3xlDjzF+JfScbfBt
	rxGVC+8AXG0FlhYJ/HS3ZKMhZ/Nm2owR+JpUkWR83lY6H/XxqNH3HwKu4Afi2iosorxM2ztMRs2
	BCTvCatHw4tbTYG9s5FioWD8IWdb2nRlJZ1QboRqYbjeK6Ws+hcsesNHwcBDsdvieMVNX7+WkPC
	B79CtK6eP0FGhsYuB89J5v+roogrjHwSIVBcYTgNm4RF9QJ78s5ohWHJ1
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee1588686emr42334611cf.11.1763386904698;
        Mon, 17 Nov 2025 05:41:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXjeOnWOqKRzGv7+Ux5gt6tTZvyWI1wBlvFc4rLJ5C0QkL7YdbAjBn/AYTf8fPgd9jvCo6gw==
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee1588686emr42334251cf.11.1763386904241;
        Mon, 17 Nov 2025 05:41:44 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81296sm1103136466b.6.2025.11.17.05.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:41:41 -0800 (PST)
Message-ID: <d7bcc255-b922-4ae9-af70-5757f17100c2@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:41:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: Alok Tiwari <alok.a.tiwari@oracle.com>, jordan@cosmicpenguin.net,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
        marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
Cc: alok.a.tiwarilinux@gmail.com
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DMwS67SYU1pJZm3j9iQPdkSAneXBLk0W
X-Proofpoint-GUID: DMwS67SYU1pJZm3j9iQPdkSAneXBLk0W
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691b2619 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=73rUxmhrSfcUVL-5kvkA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExNiBTYWx0ZWRfXy/M/NVJTyBK+
 sCEa6JpKIIMfmKkrOv+QByE9AIjBtMhdH731ojiNOAl+VsWBHnPN1OErbZx+K64ZSW9Mi8AcJhw
 HyMao8wvDOuh+dZq7GH9uZgQ7Aau7YUCxi/PvxyCMBwnsUaobFgDSY4aMUWKa367NieB+JOhEjw
 MPgKWakIqECdgijqjlpt5dXPNRI6W02uNmbbwcq7mo0tcD0kkz2ha/ebQtbD8dJxrMwCEGkR917
 EFXFs84GnaO4WYvJxWwkmJ/qCadHqTKBmsIqbpMtQR48B/jwo4PAlmHA6EAjY7f0rmQ3s70B9Yz
 hc2UTB1kMY5H42fNhegpWvxvx8laz4ZdNF3thdpT5GE0Qb6deKAsV0pXBrFzhq29DzoDJvAkUCN
 lU8q7ja3h1ZaQTYwHwYQUocAehokEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170116

On 11/17/25 2:25 PM, Alok Tiwari wrote:
> Currently, a6xx_show() dereferences state before checking whether it is
> NULL or an error pointer.This can lead to invalid memory access if state
> is invalid.
> 
> Move the IS_ERR_OR_NULL(state) check to the top of the function before
> any use of state.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

container_of doesn't do any dereferencing of the pointer, it only does
ptr arithmetic which is ""fine"" with a random/null value

Konrad

>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 4c7f3c642f6a..e408e1d84ade 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_state *a6xx_state,
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  		struct drm_printer *p)
>  {
> +	if (IS_ERR_OR_NULL(state))
> +		return;
> +
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu_state *a6xx_state = container_of(state,
>  			struct a6xx_gpu_state, base);
>  	int i;
>  
> -	if (IS_ERR_OR_NULL(state))
> -		return;
> -
>  	drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
>  
>  	adreno_show(gpu, state, p);


Return-Path: <linux-arm-msm+bounces-57976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847DAB75DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25871BA4EAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2984A28DB63;
	Wed, 14 May 2025 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCUubKSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86928DB69
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250726; cv=none; b=thHmBAPIfzB0aV5p35d2Uv4iOZAvwREJUGdnx6XUc/xoDeG0kFKy6XjRqgFamlvzZlAPPDRKJqE4np5HsWaczpHxQb2UFPtjxZPZpsZJw2nhj8nnT69hXslfYCbVsYJn2kbbjANnHwLjc+TFWxlu5WI+a+ks9O4oVv9uaKqnVcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250726; c=relaxed/simple;
	bh=a6pXWAw3qSn8K0MGI01Y9Wef/OeVTiOkuPEXmvMQ45A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKaVFQqxa2xr4Z0lwb8Iy2snpRfLJwOKf6CUnDzcfNUnRF0myH29ll8ruUt5oqCgLTj5k0v0plhuHG29tiFaVdCu7E/WhEWBl2Q8MBstukT/CXB+swST0gOKm/HmYfFc50MvupZcBq5Hdl2EK3n54j4F7Teu/302D2mPOMdTbfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCUubKSw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIqsO8007031
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=guHnDjTo7eaE/yughOao688D
	Svp7ZoZj4rGyk6Vz4vg=; b=BCUubKSwIOu6HQnrADk5Mgq6zf5I997Ecg93/dmd
	xd1QBGAMiLWOXQ1bqg/HCb24sbvcH+e9XL7EU38I7WpU4Nir5OBKVfE4pOi3fY6d
	du7y5imUF/1Q/Q25GZt3Qr4hWnb9idQAu+vUT51+yoryQ8QAPxd8p4qX6iLnLNnI
	BbVc9HIiTqReQ/R0PfLN+0D8f8VSdfG579608VqC9EWvsUMFfQ2Qp/muTlahieWg
	nAoIbPnEGB5puSTqSF9xeiVrBQbuPUGVNUJ+nvyNBvhkpgKAlAfRtYub1ZS2T5Bi
	dGlKA20ShaX/St5TEZyci0yr4FyBD5YWDGITJdQA44ACdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnuudd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:25:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cabd21579eso13821285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250722; x=1747855522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guHnDjTo7eaE/yughOao688DSvp7ZoZj4rGyk6Vz4vg=;
        b=qh8DKCwDKFdjfwjbgtKC/UBZYr9pZbBrR/ndw2e7abcOv9/JxkcY+evGdS+Pm/ZQBQ
         Mre19xocdWii1ujKsNCPUvyzcf5vkA4hzpJGJWMPszvJFCrn6UttxSOo3HouezRUHby5
         1QGVsK2dF1ANd6JMDnaOUUqoZzVrB3wUXQ2/bKJRK5xklyR1AAiE6kHV18gfjxZoaISy
         rsk0siCFruNyIu37UZbxMflVymrX8uH6uVkW7vfkjJn/m10kCT0H4HoWcrEURBoT7LTy
         YOjRuENRXAKDjv89Jp+7qm21DARRxpnWxRG5PH9CFP/Lyq73R638moJFFVEwRayzKH0t
         f9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVVcMmgNqBC107GebOHTmqlyCON8aKEXjbsGezcoOayfuS0sk6VVuhpp3TsXja+Bl13KTVreitPmNEkBYKS@vger.kernel.org
X-Gm-Message-State: AOJu0YxRPQmMHcSd9Ld/YyUjVge0haJOHqDZEN4LgH8HR8OEBx4HY8Dv
	4200vhOLvcOlopOP9L1NVzeQSuMO1e8Wd5hNBWbcD7Ymd4+WQKjrx7PVf/mr71/ppjlpcHyRbcO
	nONQqhPWtleGRnqTJq8MESpwTo3oY2HxWT2ix7V72BmQgVyQ4brdISRECTfUxcH1M
X-Gm-Gg: ASbGncsrsywSAc5SVJgq5lq1H0I3VFN6PUnzBB+zTl0eiz8rKr2jn/iPWIvvbd0bviu
	7MF/aQCls3OB7vu6HN0N3o2cv9Brsw5XM+xh3clsJzppyWR9mQ3RaO4gtj5l2hg2yGniGOmrAon
	oCaoUQz/Y4gGDLCGMin86sdnGMiiqUFnw+Mcsigite3z7rdjKK9kutw/dTOX7CPHGlAkFWFBnRz
	Wu0WTiTrl4jidn5SvYNWca670MUKBWljraHTUrZvuxWG5zV+0tRAvJ86YW1PZjIZ1zUOULYa3+H
	giZ2a7VDOLsM9vf5FArfmQoxEanL35FClK5rR/TJdA9390hCGxQYprz+7/WPvi4XnaCM+kcRKCc
	=
X-Received: by 2002:a05:620a:1a8f:b0:7c5:a25a:f0f3 with SMTP id af79cd13be357-7cd287defa6mr638170685a.8.1747250722281;
        Wed, 14 May 2025 12:25:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqYspBX7D3lylLVnQVlBe+b6tLYtEGKb07awj3O663BvMry8yeZxkF53c9zpzvl/w4Clu/Ag==
X-Received: by 2002:a05:620a:1a8f:b0:7c5:a25a:f0f3 with SMTP id af79cd13be357-7cd287defa6mr638167385a.8.1747250721720;
        Wed, 14 May 2025 12:25:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cbf3fsm2333073e87.211.2025.05.14.12.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:25:19 -0700 (PDT)
Date: Wed, 14 May 2025 22:25:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC RFT v2 15/15] drm/msm/a6xx: Warn if the
 highest_bank_bit value is overwritten
Message-ID: <wb46vfuegw2d4mj6pqx6o5my7ii4fhkrzrgte4hvey5ywiszpt@oe3qsptmanuu>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: BONfvi8lbbDXlZiLwwN7DruxMq4m3NgJ
X-Proofpoint-ORIG-GUID: BONfvi8lbbDXlZiLwwN7DruxMq4m3NgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NiBTYWx0ZWRfX82tqxu3xVO4u
 aOXOkI6FsrFiJVl846W1y/7JVGTi9ALTsRJjjNVLc6kemkBSjR3q7O6mAK9B8ao3dqUTEqBG5G+
 f8iKXXNZ9uGkzKFfSe2vQiycMW8JzE4umtvnWcKXC0Z6AqRKdihF1VGz6sIGFW0v0pETX2Rt/Oe
 nt5GaH6tA9vYIGTge6Tn1l4sR/4ieyK/Yg7/lQafVTE4xpnAjqPjIU5MeQuF6G4lJtLtQCIjs/3
 6yI5qAx2BaFreRt4tP5CF+cYChWwKAujGZ1+/PoZCeQANA7hEiiygF4u3Fl153tkwKfcLqnIqGl
 4EsOo6nmoFKra3eG+ah5OZGjunjom7WtE4K9Qx7cDRKNNhyPnxNTFW9Nr+bOcQQ1jzxbeMsak+i
 5jIV2QRxQSwNriROCqmjQaEyvGY/KPn4t7BnKk0mHCGGuD8sO77b0/tlAmxM18Qjsmkp5Mgy
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6824ee23 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hUL5GJU7K_37AAI6negA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=960 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140176

On Wed, May 14, 2025 at 05:10:35PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation to resolve the issue of hardcoding HBB, throw a warning
> if the value is being overwritten in the GPU driver.
> 
> The HBB value is directly correlated with the memory configuration.
> On platforms where more than one is supported, the value must differ
> for proper functioning of the hardware, but it also must be consistent
> across all UBWC producers/consumers.
> 
> On platforms supporting only a single DRAM setup, the value may still
> be wrong, or at least inconsistent.
> 
> Print a warning to help catch such cases, until we declare full trust
> to the central database.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index eaf468b67f97ff153e92a73a45581228fcf75e46..ab812338739568d5908ca439e5c53e230a02de5d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -637,6 +637,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  	if (adreno_is_a702(gpu))
>  		cfg->highest_bank_bit = 14;
>  
> +	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
> +		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
> +			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
> +

This really should come in an earlier patch...

>  	gpu->ubwc_config = &gpu->_ubwc_config;
>  
>  	return 0;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry


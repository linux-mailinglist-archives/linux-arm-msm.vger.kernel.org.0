Return-Path: <linux-arm-msm+bounces-75574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 969D6BABE0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB16C189ED28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A0D29E11A;
	Tue, 30 Sep 2025 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npeydifp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84301BA3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218302; cv=none; b=JaeCXcOwieUMZdol5cRePXusm80NqrZVWImGAONXqc2jB0UdCNt3I3e1hUCBEAKe4X/Ry/rUVFwAE7lapmoqqdq4eXXqzKjDXCZOncmJRf1o/Fyqb/VWpwSBzEXXbyU8HLCbZFN6GVnYH+8ZtYoUSfgBvuy4JMsT29vlOc9uEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218302; c=relaxed/simple;
	bh=dBrWI4k7VRL8/7l5jenag5KT5vNfN1jL50PovXpn0o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMZA0Q81ezXtIvPB1C94oeE5Wx9VcljPyTuS526l5sYUm5/qSuQXuVrr9SB+HwGC29qmDi7LdlAHVfz4tIN6DS1l9eOnnwCuSCCC+TpthkYnhBmmiL0u2WAkcVNj7+4CjcC8idKgMSPO3E8OrHa6cuF5RfKBcMUgq/ZZRgJyKtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npeydifp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HVJx017574
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L0rL1K4stDTkbsmTd2WNaHVP
	qbXC20UcSps85wcP1FI=; b=npeydifp7VIkU6lLbvZb32s9chsDMJjdPZtsL3o7
	QrAhnfKnIFg3jjq45Hd3XCQ5EUARez5j/D3KDj50hbrX3lRMsRyQe520e3QJcd9c
	HDaESntqdBx6o7Tk60okP41spp6Eo+/VwKmuvyoUwJtn1r+xE3Y93LnAYHlqx3KC
	RYJbdHyDmLc6H24+PuRI5KeDj/lVicdmqaIhXJ/+h77PsxejQdfLRkQODBZiylyI
	6UYKy44Ucy3nmh4InwuEXe46qERdclUqxMv+Hx5Btjm6NfUOpd8VoHkrTguBxKlp
	69Vkxw06Lht5losu4EU/rhekJgAm/dsfrqdhS5zorsUNBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tr6dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:44:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df80d0d4aaso78191611cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218299; x=1759823099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0rL1K4stDTkbsmTd2WNaHVPqbXC20UcSps85wcP1FI=;
        b=AlNH94+DULoXBkbMlPF67AcgR5vM8cNiUCjvi35wcvFdchbfb7vGsuom6lAFii99Hn
         XYyymJU0Xd+GQIYZLVRp7Axp7VTbU6LVKnNAGS2+8jTQO+HeC5ChErW5mSOe2Zfj4m8N
         LYYjDPjUTCAopEoDLqUFkw7q53B7QFmBS5nW2XdNrgaywEhecPIHuNXpIoLK2Di5cT8L
         HJqsujxBiB5YtHjrqb584RVBSpFQTC8miJyEYdWDcxk9Njw86Pc52klqXqces0wU+9f+
         6TKw0SJHzZT5WIvAISMXQlFfoQ5rdKVI454FwCbTokxM18O3zkA6zm8eN1LAT6YPao8d
         dtaw==
X-Forwarded-Encrypted: i=1; AJvYcCW6lu+0/O9dEBHgAP+L3tmUMQZqLHit4zeAldqMqR/adgpgt2uDBeqbgn7a1S9FswBnifkV6B/PWBw/k2PT@vger.kernel.org
X-Gm-Message-State: AOJu0YydYdr4HnLkWWU42zvT1es49V//9tx5fKm17mB9SrRwJ7c+Mnt2
	H1B9VMH0bKO+GxssQS9aE0Dw8J2zb1QUQkn48pSTJaXYZxBVdcRvgTxsQR+VlQtW6EYI4LrbvD6
	JQug3qEEkElEqnSQbv79snkBz7pYbGKsswPDSwy8pbjJniR7jUAVuL/nWkegCPNtcfLjU
X-Gm-Gg: ASbGnctY3thS4uEQH1aQdw3kx5V2E4Fq9WHZnm/b9egKet9so6MBTnY6WM0sx8idBGE
	KSiwWx0EUl7CaGGl/p1B6e/kYMrCMVak38Uw0iSotbuO5o/2JRiRlBxFL/ID9aIV2BkizvC5ZSF
	Y453FjntGPQCgwTVfkbHKQpNW6yI16fvahknB5Y0REtu0qBJarQoxG+AEI/loIOZBcG9RnYGiEU
	rXK+3DcsOiB93Bph+NA1Co0ol+bFfNHlOli0ftd5njAG4ouqGSF9TK/tw4nHMUza1COMB2bif7i
	5501DuDSu1cG0v9KHRVYgN+wS5X2JRFUfgUAr/soptvwWMxKuhq5Ag6y626lT6Ayeh6dexCa2pa
	d8e+QHT9vjmiDCKU+FA27k55VjWMmRdX80ywL2XksdxXTo0meY80fMBDGXg==
X-Received: by 2002:ac8:5fd3:0:b0:4b5:dd8c:1d3 with SMTP id d75a77b69052e-4da4deafcbamr259011901cf.77.1759218298676;
        Tue, 30 Sep 2025 00:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMvWrBLJTnixQlCCVfJ6fxPCuqLo/1PDdaopR4B7IthrKclRoZlt9yFC/kXr5oTsXhYJdxcA==
X-Received: by 2002:ac8:5fd3:0:b0:4b5:dd8c:1d3 with SMTP id d75a77b69052e-4da4deafcbamr259011581cf.77.1759218298039;
        Tue, 30 Sep 2025 00:44:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f9915sm4641758e87.39.2025.09.30.00.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:44:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:44:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 13/17] drm/msm/adreno: Support AQE engine
Message-ID: <nn64mvneylqqpf4a6imkp5mzsw26ju7iuym26hgyrjoqc7v2cz@dtjmmj5w776k>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXz5CzKaSy2aEg
 vnLFKWnjgUy/eS9crSugoIWabDm8C9fUh35A48i4opxCzh1I0fVI6d/VE08oitxOlAcgGrFG4VG
 qUi3WrP7zmFW4xbvO4NBFDBCuZwdKecYsTc2vleZqPYBJtrx4tOz9K62dhFaJNUZaQKL+1cYalr
 GNY9B7SmvWtH/lHzsMorygRT5iOa2LMr6pwm42QmeDo6i20p7PvXG5LCPMC/QINK5wdJu3PdE4F
 xRw0tfxiqvJBXWlpdc74ELOWNx2UlcSkI8KmD/QowxbNw73dtARGt+D9NGS3SWZUYJkXWbIMjaE
 cr+o9McDhfZE0QuyKrXbY54fw8Ol4wLntRXjns7m+G99XWNJGsJoIumb4uUHDLSYihYRh/Io/OF
 C9WhF4tLngDMlG9ptxXYGbXXbZHWjw==
X-Proofpoint-GUID: Ow21myNTGAqdiU3yG74H5BE51eu3Z-q7
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db8a7b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Vi7wF31NLlcTFLqBoF4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Ow21myNTGAqdiU3yG74H5BE51eu3Z-q7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Tue, Sep 30, 2025 at 11:18:18AM +0530, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4aeeaceb1fb30a9d68ac636c14249e3853ef73ac..07ac5be9d0bccf4d2345eb76b08851a94187e861 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1093,6 +1093,30 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>  		}
>  	}
>  
> +	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
> +		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
> +			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
> +
> +		if (IS_ERR(a6xx_gpu->aqe_bo)) {
> +			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
> +
> +			a6xx_gpu->aqe_bo = NULL;
> +			DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Could not allocate AQE ucode: %d\n", ret);
> +
> +			return ret;
> +		}
> +
> +		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
> +		if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->aqe_bo)) {

Should this firmware be handled by a separate function?

> +			msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
> +			drm_gem_object_put(a6xx_gpu->aqe_bo);
> +
> +			a6xx_gpu->aqe_bo = NULL;
> +			return -EPERM;
> +		}
> +	}
> +
>  	/*
>  	 * Expanded APRIV and targets that support WHERE_AM_I both need a
>  	 * privileged buffer to store the RPTR shadow

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-86482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D7CDB7A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C19300CB9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF9B2ED86F;
	Wed, 24 Dec 2025 06:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjBmBae5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/DOZzmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CDF254849
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557539; cv=none; b=CpYzKl+yLeqTGK6UoHAj5x1JdPgkNgEIMwB05QYhZvNy6sd9tkD0jvqCcYuMvKXO80tHhURKuoGB1q9t0BjtgTFdmNj8O7/2nEG50ToJXeyvy9hGsjog5e+/Hp2hcRWURZ6+07WMiYlmXor04HISyiBhXz9MrO0AplYtV9xgd6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557539; c=relaxed/simple;
	bh=VWtL6HKc9sLgG9qUjSu8XX4C4QwRL+aOrhUouIGQ/b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mknmTe3WwKoL8EklGzfCr06SaoVe5AlbtaIwZYCv0qO5lF2q5UCJb1bjXkMpzuTMrWOBmLXm4BCKKSPJb3NnBWItN2bObnEjss+0MEiNlDac216nvJo1u3xBLqO5q2i4orJj0hte5nIsCl7GRMYPJmaJn5nxfaYxIFQ8aFGVsmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjBmBae5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/DOZzmy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3w5tE4134186
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ghYWCMfG/KWuBI2qNzjPlg1Z
	H5W1IZNuiMXZFg9Qm+Q=; b=CjBmBae5lDlFOeW4pSL2jmo8awamypI097MJI59s
	MWsJTMdmqzxuLuX0WvQ4muNPZBXqaTk8sM8odkwHRYQiYWBrBVFuQ9ciYUBfePhv
	a66Y1at4nXJwG/N6YvhkRG0F6qxUEg2pKHvPlEBxJ97PFzNEjUYmtLT2V7Y+BlKg
	SptNI6XF4WIXTYp0E9kRgeP0UDdAH3L8/qRxHgWRTi7Ov3NLUzd2qtrkYk1T8v5I
	u9pu/yTO/2avcuBC9+OJPh5mWIjMNW/rzp9cZ1vq5Zxa2PoGnqg4Xg8M5Fr1PkPu
	mzAA81dKL/Qcunu8XXjudyT+dZ7cGhWOOZn/hemIsqu2Og==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46t50q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:25:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so153952271cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557536; x=1767162336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ghYWCMfG/KWuBI2qNzjPlg1ZH5W1IZNuiMXZFg9Qm+Q=;
        b=j/DOZzmy6/BJ6/Z0VT6LMoKX2zTpEpPz48UgkHA9hB5O9ncVgxTsboBpTUiOEyXB7T
         V3uOxx51X/cVz1AoCFyrRsWJ1w8z0vWPDDnkSJnhTnZRO9TSTFKXFywu2OD1szbwneNf
         Ius/fNjQEBFCFow/cQYhtoL92mVDVXPx4rr/V7I/63rGzjaRmBI5Sb9xFdV/9twTkdxm
         AhKojaj93Skg0NYEVgkp8ubYxXTDqT48SHDMH50uATWCRxZTgD/IBN20FMPQ61bVziwv
         YfEic1XjW8wvJGlr++fRrNk0f+zKGli56GfkWhFcJYJN9pRnXlAvOZ4ViADkXB3VMeaJ
         oCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557536; x=1767162336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghYWCMfG/KWuBI2qNzjPlg1ZH5W1IZNuiMXZFg9Qm+Q=;
        b=GH7NI7sxr/VfN2r7jwhHSrKc0U70XwTS1D3jSY+iUg5Oz9ceuBD14g6ClcdM807D+g
         mi8z6IdwFm0tzLytRNlNy+bGTCdm03zyP9fZgM1AACGfT0hyLIUDi7nvFDuxCVKr4Ekz
         RUyjL+0T2kLCiAbXxllqd+dcJ5Lmz+ifLZTgOxRJJ31ls/WWQXvJG6/9iFArAnwzCbA3
         NC5aIT4R5V3uORLiEeBT2uSvtuikJFjVIRez31joOYV1j7X6mL+l45dlAm6w682J+MA3
         pkbmBbGijYmK4/32B+E6QjQq5xfxRlzvvjGnUMKUnMMEQUfd78ZtglxpFrrt04E4nkKJ
         ThZA==
X-Forwarded-Encrypted: i=1; AJvYcCXXrOa92Mj3DD85i1HhkLBmT5zJo8prL0bXfwSLoQBer+FnwznRvFvc5eb8LgtWvT6BTXQI7teQcsD9u8Fp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx7b4vZR7FOVXPofFaZoMW8UCGH8QTicdwwD/aBEZ0HPUYmn60
	SfhPqk1GkGVM1sBBp7+lYuRZrVLGkEXvIM2sRkCv7mq9oFsEX0iAnbaVwMfSTXmPpqC93Nm2wYh
	oBWH9dfo4sCI8JnOLa7BOg7AWR0XOwdxT4kuNnY5xSoFkaaJavGYuLGQwXdkIvM/gvdbr
X-Gm-Gg: AY/fxX7ALBprg+Q37NvTyYrJujU+ssRDmMceEhpbINZSxAmS7mulHz6MA8efJTW3J4s
	y47vKq7VJmdo7biKvgXc07KNrncajnp9240lPx1f7wViwBan0XFxCVVJSYozOurckrtPIwMF1R9
	qMe5kppBhBndahz5kDb5KxdrS/LWnSsOzcWs3d8PP+aAqzEitwFbV7Cw3q2VKoDY3gQgcq928fQ
	ArouzBNfefLhutKGccxgTPcVAGwrIS2mZUwJ08hV6uFZI1ESueKe/nqqJofRrAlmegXjXNdKSU5
	Jz7pJ12Xz4MAiS6CkSm3+TUC7S7BoHRLwo/FB79ZEPBZshedVmnQQOV928PEPtCusftYIqlQ9XT
	aEG91WZYTevU2G97OCNeuWyuxelt31ohsx3Nm68hJ0hJYNHFLmuzfK6Vqe9kc5XaTCX0nW3z+2T
	9MEEy4o7tTW+yLZKmVtMABhT8=
X-Received: by 2002:a05:622a:750b:b0:4f4:de1a:7a83 with SMTP id d75a77b69052e-4f4e8b40837mr5948951cf.1.1766557536354;
        Tue, 23 Dec 2025 22:25:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJqPf9GXMiANMcZKwm3J3PuX8Z30M1wdRc5+g6FOwva+Dn9Ih43nX9+5ZNHvKmSLwW0/PPNg==
X-Received: by 2002:a05:622a:750b:b0:4f4:de1a:7a83 with SMTP id d75a77b69052e-4f4e8b40837mr5948821cf.1.1766557535919;
        Tue, 23 Dec 2025 22:25:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f2e6sm4717823e87.69.2025.12.23.22.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:25:33 -0800 (PST)
Date: Wed, 24 Dec 2025 08:25:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
Message-ID: <vl22otxr5ks3lvqvmpfrsdfnv2wigzdguvf7qshjwgyimtlfxs@nbmrsqxpuiz6>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
X-Proofpoint-ORIG-GUID: 2K_I7_VNcCn9fVExnG_0C1eX7IDL_tMb
X-Proofpoint-GUID: 2K_I7_VNcCn9fVExnG_0C1eX7IDL_tMb
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694b8761 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8MGaVJJo3f9ymaU01ooA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX1q7v654Lix/r
 4nI/aXbg15N6yawgQgbutE5enHkyOL4jcRxYJTpK//WG2AHSmebQ2jBlSlnoyu907GTSPIiFdt+
 XCEdi3uV6f10Bu7QJK+ynCJUwrn2pVxDOJ70Yv5vS9Rj5AsfoOox9SZSVaBbuxmB3xavweD8+Z+
 15lp5Ngk7ZWpKsd+n5hGP0mrCuUJVVqaAWGUzHLx+rVNJXlR86mO1ReYnvHDyGIF9oAFccYJPAC
 wzcArQ53btR9n2sYEdmGO1t1tlNMjFCiM3/RKSFnTPNDkcJv4I4jy1ThRYtBU2c3ItFb89IFWui
 DtFNbCCr7SiOggS2Tc8N7Z10ZuAeQvTtbUUAn1fCHWsvgpTQjP4sHyiLT4ovVh+G2CKmKzrIDJN
 IDwY5kvxCJcpihtYSAvbGc0HOI2lXYh/4t3F40dtyKSYEVioVIX7WjtNb3+ncr7zkD/cXkCB2F4
 RF6O/E/pZ9RvSWdETUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053

On Fri, Dec 19, 2025 at 10:46:19AM -0800, Randy Dunlap wrote:
> Correct a bunch of kernel-doc comments in drm/msm/.
> 
> [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
> [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
> [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
> [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
> [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
> [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
> [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
> [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
> [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
> [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
> [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
> [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
> [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
> [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
> [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
> [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
> [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
> [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
> [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
> 
> 

For the series:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry


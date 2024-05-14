Return-Path: <linux-arm-msm+bounces-19852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9EA8C5B49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 20:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3FD61F2226E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 18:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93081181307;
	Tue, 14 May 2024 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jnStNrpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B70181303;
	Tue, 14 May 2024 18:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715712139; cv=none; b=sNV2/oxRoVXBYwVuvt7aO67gsfOiEz/ljeS4pUryjWHCeMqWrAE37OibBv5dLTuUwy2RUDa+bjVCoe7mT985VgVRGtu795NDbDDrrz3nterd7orl8rEP9l2ZL7Cisu8Oy4pZ+M8YOIeGG6/tBLYoDnPmu3h0luikFPpFKDrWKRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715712139; c=relaxed/simple;
	bh=0wNd6nOWp7TDgA5f8KCU5SkKx3B7tcndAHrRejtSNbM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJtww9zL78P3CStqvfxduyO736wsTvt93IJGkVILzsNBiDdhaChJxgNl+3AOQGdn2dTAzRsfgZlKk8d9RK9VaYquxrs0mlDYi1etI2dp3Uy2J4deYW1i5OwXcJ393izDT62BRTP/ngVuSkb2CB/Dgd5g179RPxGmBJY8lxd3UHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jnStNrpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EIHZlF010411;
	Tue, 14 May 2024 18:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=fqmbST24fPtvgiBuCK/vt
	w9KZSeJV3pS8ZQtIGx96Ds=; b=jnStNrpyLdapYPAS1whCEp3bsUiRQFnr/RgHX
	bH2CX+EVz6m1gNYT3m4gu0h9PyA4cgOHurrykpTNY2v4kUtmGR0txkZpyb7B6SJu
	JQboeVuJcPgcvI52D0UkezzusnS3me0tLUsybnZoUcRIVfr8JYJL779RD4IG0YX4
	wJn3yOE9I3vH/MOrSaGvkfl7cOYpBzH+XyDLIPiRfYDIods5wn4Yw2/kb80ZQsUV
	PQ/4DHLlmhszjWmTPE4biMTYb3NR/G1nqV8bIUHrbgGEormQj774TXtlmsuyNjPe
	YM0fSIsHoSkdrtH2x+LXVHQWDvx04q0xQYpHLGKlB3Nw8pDvQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21edf1hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 18:42:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EIg4Lw000804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 18:42:04 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 May 2024 11:41:59 -0700
Date: Wed, 15 May 2024 00:11:55 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bjorn
 Andersson" <quic_bjorande@quicinc.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Add obj flags to gpu devcoredump
Message-ID: <20240514184155.lt2stiohrh4sfsxy@hu-akhilpo-hyd.qualcomm.com>
References: <20240513155150.166924-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513155150.166924-1-robdclark@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cl505ZX_pPUkI21mYcHeK5e7l2VPlpXM
X-Proofpoint-ORIG-GUID: cl505ZX_pPUkI21mYcHeK5e7l2VPlpXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_11,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=898 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140132

On Mon, May 13, 2024 at 08:51:47AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When debugging faults, it is useful to know how the BO is mapped (cached
> vs WC, gpu readonly, etc).
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
>  drivers/gpu/drm/msm/msm_gpu.c           | 6 ++++--
>  drivers/gpu/drm/msm/msm_gpu.h           | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index b7bbef2eeff4..d9ea15994ae9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -887,6 +887,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  			drm_printf(p, "  - iova: 0x%016llx\n",
>  				state->bos[i].iova);
>  			drm_printf(p, "    size: %zd\n", state->bos[i].size);
> +			drm_printf(p, "    flags: 0x%x\n", state->bos[i].flags);
>  			drm_printf(p, "    name: %-32s\n", state->bos[i].name);
>  
>  			adreno_show_object(p, &state->bos[i].data,
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index d14ec058906f..ceaee23a4d22 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -222,14 +222,16 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
>  		struct drm_gem_object *obj, u64 iova, bool full)
>  {
>  	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
> +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>  
>  	/* Don't record write only objects */
>  	state_bo->size = obj->size;
> +	state_bo->flags = msm_obj->flags;
>  	state_bo->iova = iova;
>  
> -	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(to_msm_bo(obj)->name));
> +	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(msm_obj->name));
>  
> -	memcpy(state_bo->name, to_msm_bo(obj)->name, sizeof(state_bo->name));
> +	memcpy(state_bo->name, msm_obj->name, sizeof(state_bo->name));
>  
>  	if (full) {
>  		void *ptr;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 685470b84708..05bb247e7210 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -527,6 +527,7 @@ struct msm_gpu_submitqueue {
>  struct msm_gpu_state_bo {
>  	u64 iova;
>  	size_t size;
> +	u32 flags;
>  	void *data;
>  	bool encoded;
>  	char name[32];
> -- 
> 2.45.0
> 


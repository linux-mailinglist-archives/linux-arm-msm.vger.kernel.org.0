Return-Path: <linux-arm-msm+bounces-28295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C394E666
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 08:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB4AD2815D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 06:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045FB1487F9;
	Mon, 12 Aug 2024 06:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M0tFreGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB063715E
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 06:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723442952; cv=none; b=AOxDTw8mmJ87hMCka1+Ar/BSgSmJ4s+bSjCyXhnou6B4y4yx5oHrAZ3GbvxlAXh3TSdWUZm1x7PG52SNLetrF7SgIcEp1x66/kN3kRiFvD3sd3ZqvsXH7INmbEtEYAHnUbAFKwj2HuABT8+OAIiDAog/eyoeFuH5mMcLg8/WncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723442952; c=relaxed/simple;
	bh=opIaG9DTYwZsC4fVTmpJnOtjEjViHGcKbOM9Hrx++Nc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ba0kQJG0Xpv4OdLX14AUUBH3J2qecwTNakMB65DYOlvP24HJo7WJ/dGPB5PKHH5bcd+YFJMvhdUZKU29L8PWr+lXmATQ9+az5sSLODtkR75OzX7FptyP1oQtaWlwfBIfWaIYkauJ5bGp9HCoqIXCGUWHe4HIcShyd5q0yGpHawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M0tFreGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2ZGRw013780;
	Mon, 12 Aug 2024 06:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dtteEpJEDGH0Q97LQoxjDyzm
	fwvof0kl/MuHCdrFfzw=; b=M0tFreGmikrj2Zh2rU7k1VVvmf/sBBNJRbHTk0Ru
	e/ei1U/43mZA3rGYrVi7CPnCax3kDBBUCyXp7klVfr+LP/gY1xQIVdrb2+88tZIE
	5lHq0AcClLHLNkvQQ7TPAwlbOD26jYrCtRXKJEtdxmvqFvzgBeqjPauVx0HaWF+u
	CfS31MHhNacLWtoM0RQKIFAW4K71xaFTCll2MruOthmtO9T/tTkix7hsYOIN/3CX
	Kvj27ErQfcQ4cuIvO4JqArTdEUw25In4rnZCdomHMFDejSFprGTWKIptYRS0z7yc
	S/VLMJEsGTbam1lFoGXypY4vXTSuaH806hXyzxmqsYrEnw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18xu0qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 06:09:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C691f8005453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 06:09:01 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 Aug 2024 23:08:58 -0700
Date: Mon, 12 Aug 2024 11:38:54 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Connor Abbott <cwabbott0@gmail.com>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/msm: Use a7xx family directly in gpu_state
Message-ID: <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
 <20240807-a750-devcoredump-fixes-v2-1-d7483736d26d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807-a750-devcoredump-fixes-v2-1-d7483736d26d@gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G3X9JF9q3rEB7mLSGBNWm3TY3kTYDZjR
X-Proofpoint-ORIG-GUID: G3X9JF9q3rEB7mLSGBNWm3TY3kTYDZjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120045

On Wed, Aug 07, 2024 at 01:34:27PM +0100, Connor Abbott wrote:
> With a7xx, we need to import a new header for each new generation and
> switch to a different list of registers, instead of making
> backwards-compatible changes. Using the helpers inadvertently made a750
> use the a740 list of registers, instead use the family directly to fix
> this.

This won't scale. What about other gpus in the same generation but has a
different register list? You don't see that issue currently because
there are no support for lower tier a7x GPUs yet.

I think we should move to a "snapshot block list" like in the downstream
driver if you want to simplify the whole logic. Otherwise, we should
leave the chipid check as it is and just fix up a750 configurations.

-Akhil

> 
> Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 ++++++++++++++---------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 77146d30bcaa..c641ee7dec78 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -390,18 +390,18 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
>  	const u32 *debugbus_blocks, *gbif_debugbus_blocks;
>  	int i;
>  
> -	if (adreno_is_a730(adreno_gpu)) {
> +	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
>  		debugbus_blocks = gen7_0_0_debugbus_blocks;
>  		debugbus_blocks_count = ARRAY_SIZE(gen7_0_0_debugbus_blocks);
>  		gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
>  		gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
> -	} else if (adreno_is_a740_family(adreno_gpu)) {
> +	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
>  		debugbus_blocks = gen7_2_0_debugbus_blocks;
>  		debugbus_blocks_count = ARRAY_SIZE(gen7_2_0_debugbus_blocks);
>  		gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
>  		gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
>  	} else {
> -		BUG_ON(!adreno_is_a750(adreno_gpu));
> +		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
>  		debugbus_blocks = gen7_9_0_debugbus_blocks;
>  		debugbus_blocks_count = ARRAY_SIZE(gen7_9_0_debugbus_blocks);
>  		gbif_debugbus_blocks = gen7_9_0_gbif_debugbus_blocks;
> @@ -511,7 +511,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>  		const struct a6xx_debugbus_block *cx_debugbus_blocks;
>  
>  		if (adreno_is_a7xx(adreno_gpu)) {
> -			BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)));
> +			BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
>  			cx_debugbus_blocks = a7xx_cx_debugbus_blocks;
>  			nr_cx_debugbus_blocks = ARRAY_SIZE(a7xx_cx_debugbus_blocks);
>  		} else {
> @@ -662,11 +662,11 @@ static void a7xx_get_dbgahb_clusters(struct msm_gpu *gpu,
>  	const struct gen7_sptp_cluster_registers *dbgahb_clusters;
>  	unsigned dbgahb_clusters_size;
>  
> -	if (adreno_is_a730(adreno_gpu)) {
> +	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
>  		dbgahb_clusters = gen7_0_0_sptp_clusters;
>  		dbgahb_clusters_size = ARRAY_SIZE(gen7_0_0_sptp_clusters);
>  	} else {
> -		BUG_ON(!adreno_is_a740_family(adreno_gpu));
> +		BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
>  		dbgahb_clusters = gen7_2_0_sptp_clusters;
>  		dbgahb_clusters_size = ARRAY_SIZE(gen7_2_0_sptp_clusters);
>  	}
> @@ -820,14 +820,14 @@ static void a7xx_get_clusters(struct msm_gpu *gpu,
>  	const struct gen7_cluster_registers *clusters;
>  	unsigned clusters_size;
>  
> -	if (adreno_is_a730(adreno_gpu)) {
> +	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
>  		clusters = gen7_0_0_clusters;
>  		clusters_size = ARRAY_SIZE(gen7_0_0_clusters);
> -	} else if (adreno_is_a740_family(adreno_gpu)) {
> +	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
>  		clusters = gen7_2_0_clusters;
>  		clusters_size = ARRAY_SIZE(gen7_2_0_clusters);
>  	} else {
> -		BUG_ON(!adreno_is_a750(adreno_gpu));
> +		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
>  		clusters = gen7_9_0_clusters;
>  		clusters_size = ARRAY_SIZE(gen7_9_0_clusters);
>  	}
> @@ -895,7 +895,7 @@ static void a7xx_get_shader_block(struct msm_gpu *gpu,
>  	if (WARN_ON(datasize > A6XX_CD_DATA_SIZE))
>  		return;
>  
> -	if (adreno_is_a730(adreno_gpu)) {
> +	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
>  		gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 3);
>  	}
>  
> @@ -925,7 +925,7 @@ static void a7xx_get_shader_block(struct msm_gpu *gpu,
>  		datasize);
>  
>  out:
> -	if (adreno_is_a730(adreno_gpu)) {
> +	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
>  		gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 0);
>  	}
>  }
> @@ -958,14 +958,14 @@ static void a7xx_get_shaders(struct msm_gpu *gpu,
>  	unsigned num_shader_blocks;
>  	int i;
>  
> -	if (adreno_is_a730(adreno_gpu)) {
> +	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
>  		shader_blocks = gen7_0_0_shader_blocks;
>  		num_shader_blocks = ARRAY_SIZE(gen7_0_0_shader_blocks);
> -	} else if (adreno_is_a740_family(adreno_gpu)) {
> +	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
>  		shader_blocks = gen7_2_0_shader_blocks;
>  		num_shader_blocks = ARRAY_SIZE(gen7_2_0_shader_blocks);
>  	} else {
> -		BUG_ON(!adreno_is_a750(adreno_gpu));
> +		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
>  		shader_blocks = gen7_9_0_shader_blocks;
>  		num_shader_blocks = ARRAY_SIZE(gen7_9_0_shader_blocks);
>  	}
> @@ -1350,14 +1350,14 @@ static void a7xx_get_registers(struct msm_gpu *gpu,
>  	const u32 *pre_crashdumper_regs;
>  	const struct gen7_reg_list *reglist;
>  
> -	if (adreno_is_a730(adreno_gpu)) {
> +	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
>  		reglist = gen7_0_0_reg_list;
>  		pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
> -	} else if (adreno_is_a740_family(adreno_gpu)) {
> +	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
>  		reglist = gen7_2_0_reg_list;
>  		pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
>  	} else {
> -		BUG_ON(!adreno_is_a750(adreno_gpu));
> +		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
>  		reglist = gen7_9_0_reg_list;
>  		pre_crashdumper_regs = gen7_9_0_pre_crashdumper_gpu_registers;
>  	}
> @@ -1407,8 +1407,7 @@ static void a7xx_get_post_crashdumper_registers(struct msm_gpu *gpu,
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	const u32 *regs;
>  
> -	BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu) ||
> -		 adreno_is_a750(adreno_gpu)));
> +	BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
>  	regs = gen7_0_0_post_crashdumper_registers;
>  
>  	a7xx_get_ahb_gpu_registers(gpu,
> @@ -1514,11 +1513,11 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
>  	const struct a6xx_indexed_registers *indexed_regs;
>  	int i, indexed_count, mempool_count;
>  
> -	if (adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)) {
> +	if (adreno_gpu->info->family <= ADRENO_7XX_GEN2) {
>  		indexed_regs = a7xx_indexed_reglist;
>  		indexed_count = ARRAY_SIZE(a7xx_indexed_reglist);
>  	} else {
> -		BUG_ON(!adreno_is_a750(adreno_gpu));
> +		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
>  		indexed_regs = gen7_9_0_cp_indexed_reg_list;
>  		indexed_count = ARRAY_SIZE(gen7_9_0_cp_indexed_reg_list);
>  	}
> 
> -- 
> 2.31.1
> 


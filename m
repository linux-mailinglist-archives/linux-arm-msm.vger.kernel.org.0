Return-Path: <linux-arm-msm+bounces-11073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9DA85525F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8661D1F23E65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A634126F3E;
	Wed, 14 Feb 2024 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oni+oIuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D312CD95
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707936067; cv=none; b=iV15cPr4v8MNPMHmB90dKvHVDkyTT2/X5SezufpmlGrqReIItuzHp62NAlhy5kyHDHQ/ropP0sq8xB6uG4o3AdE6BO7vVrRT5rxNLWWixHWYkgFFqwFBhHHmFKBN/4g6nMQQ0YRTppdnJeGxZdv7lt/ZQbvv4s2dNe3sJIakJuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707936067; c=relaxed/simple;
	bh=iJRkEkyFljKXGFVBPv2jyewbySnkhksByjOTzVy0JiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=euLTZo7nr5WHCkNt+ZwlZo7HiJCvN4tUA9W3YAM5cZxcaLSOTu9dZdzh/EU02XsYaGG2DgtYoceRMLJVNfZ2mipMKS76e9/m7J9PvDYqwwN1vDsJlXYxMeXnCbhyiJ412b1L6HUfdZGQ7Z306/RxvJRlJuTLGktAZDBouqh4JoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oni+oIuN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EGuLEZ004598;
	Wed, 14 Feb 2024 18:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=c/cLrnLdZUrGF6n22LVuDughOu+ccdALAAFFIHa4NFw=; b=on
	i+oIuNBRFCcgegVXk6f2diLVYgITS0KRH1ka1b8/nM4hvitIeD8I1PfUyPmonjY6
	qL4Z53sm749dE/rDlH1brL0PJeal5sho4fWLI44bTee8Uwe6qCJNBu7FqoY7uIhM
	OE4o1ErpGX/LXX5urpDoemtRxwa+xgx2UMGGwX7a55E7WrBp2esasyK7o47TpC9w
	hxfsaDTQ7NuoEMIOZeOfgtGfMmfGyF0PgKIL4av0WTa/P+Zj8w0Lp79vtGNTo8bo
	LF7Gc4nNIPRGj0AePVV9v3707ikLkKF/OuKz4UgU3EjquHir9jmnJc+WBYi4vM2d
	gpuyuCF2Psgdzumyhm5A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8nt41rte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:40:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EIetkJ007247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:40:55 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 10:40:54 -0800
Message-ID: <311b5714-47a8-7170-5b14-cde3ac05a314@quicinc.com>
Date: Wed, 14 Feb 2024 10:40:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 02/12] drm/msm/dpu: add current resource allocation to
 dumped state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230914050706.1058620-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K1GRpiyUdFpedqfiLRLqMVRkON8aBo3j
X-Proofpoint-ORIG-GUID: K1GRpiyUdFpedqfiLRLqMVRkON8aBo3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_11,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140145



On 9/13/2023 10:06 PM, Dmitry Baryshkov wrote:
> Provide atomic_print_state callback to the DPU's private object. This
> way the debugfs/dri/0/state will also include RM's internal state.
> 

I like this idea !

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 48 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
>   4 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ee84160592ce..172b64dc60e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -362,6 +362,7 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
>   static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
>   	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
>   	.atomic_destroy_state = dpu_kms_global_destroy_state,
> +	.atomic_print_state = dpu_rm_print_state,
>   };
>   
>   static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> @@ -375,6 +376,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
>   	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
>   				    &state->base,
>   				    &dpu_kms_global_state_funcs);
> +
> +	state->rm = &dpu_kms->rm;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index ed549f0f7c65..dd2be279b366 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -130,6 +130,8 @@ struct vsync_info {
>   struct dpu_global_state {
>   	struct drm_private_state base;
>   
> +	struct dpu_rm *rm;
> +
>   	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
>   	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
>   	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9215643c71a..5e3442fb8678 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -652,3 +652,51 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   
>   	return num_blks;
>   }
> +
> +void dpu_rm_print_state(struct drm_printer *p,
> +			const struct drm_private_state *state)
> +{
> +	const struct dpu_global_state *global_state = to_dpu_global_state(state);
> +	const struct dpu_rm *rm = global_state->rm;
> +	int i;
> +
> +	drm_puts(p, "pingpong:");
> +	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
> +		if (rm->pingpong_blks[i])
> +			drm_printf(p, " %d,", global_state->pingpong_to_enc_id[i]);
> +		else
> +			drm_puts(p, " -,");
> +	drm_puts(p, "\n");
> +
> +	drm_puts(p, "mixer:");
> +	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
> +		if (rm->mixer_blks[i])
> +			drm_printf(p, " %d,", global_state->mixer_to_enc_id[i]);
> +		else
> +			drm_puts(p, " -,");
> +	drm_puts(p, "\n");
> +
> +	drm_puts(p, "ctl:");
> +	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
> +		if (rm->ctl_blks[i])
> +			drm_printf(p, " %d,", global_state->ctl_to_enc_id[i]);
> +		else
> +			drm_puts(p, " -,");
> +	drm_puts(p, "\n");
> +
> +	drm_puts(p, "dspp:");
> +	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
> +		if (rm->dspp_blks[i])
> +			drm_printf(p, " %d,", global_state->dspp_to_enc_id[i]);
> +		else
> +			drm_puts(p, " -,");
> +	drm_puts(p, "\n");
> +
> +	drm_puts(p, "dsc:");
> +	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
> +		if (rm->dsc_blks[i])
> +			drm_printf(p, " %d,", global_state->dsc_to_enc_id[i]);
> +		else
> +			drm_puts(p, " -,");
> +	drm_puts(p, "\n");
> +}

You also need to include cdm_to_enc_id now. But otherwise LGTM.

If you have run this before, do you have a sample output to share?


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 2b551566cbf4..913baca81a42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -92,6 +92,14 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   	struct dpu_global_state *global_state, uint32_t enc_id,
>   	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
>   
> +/**
> + * dpu_rm_print_state - output the RM private state
> + * @p: DRM printer
> + * @state: private object state
> + */
> +void dpu_rm_print_state(struct drm_printer *p,
> +			const struct drm_private_state *state);
> +
>   /**
>    * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
>    * @rm: DPU Resource Manager handle


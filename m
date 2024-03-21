Return-Path: <linux-arm-msm+bounces-14784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083FE886407
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 00:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DEF7B20F7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 23:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C151B263;
	Thu, 21 Mar 2024 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q3ALNyRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4407918E1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 23:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711064696; cv=none; b=aO/EJHGVeAq4OEyURV8WEVy0L1E0DWlValN3nh2k8qLQ6+tL4CmtAorQ7oDZP6afO6IbEWmC1ASwxcGm7iWsWlaFzDf9zhO4DBQK/kvkbPJQiFnVX/052RkjN1sswv4ofCzI0vUftV//Qs9yDLXGUoRE4WFsxjzSaLew6ZS5uS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711064696; c=relaxed/simple;
	bh=Oh5JbHLF6Hd2AaBdr8PFuefZtPW++LuucWPnvTTrrMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pu7o6Gf8/cdBBneSCMZj9lGURandxIqR7CZ84IjG8SIKVxpf45ElerByPTRO9aKsRNdaYU0Lw1uPSAoszlbvF3w4B+KsmUto/vRJJ5Jv9u8PVsLG2bkteuRdkpuXMbuRO4cvqGIFzUIV0x2uQELQdkDEcp4KFrHPmSGGYAXhl6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q3ALNyRO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LNUJSB000670;
	Thu, 21 Mar 2024 23:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GPamfiwLPD42n0M8kSWNVKN+69nBR+YeM/42SOu2HkE=; b=Q3
	ALNyROXQ+Px22ESw0thOBWMx5fpPYL7OV25Pi10wRYZwcTNxOeiJYzekmT78NENP
	AEHqTxMCZuMH8JneyBzzonB6JxKjSrG8XK4LuWiocGqsiDBSxRBh3vQlllq6+ZGn
	aoPSuz0JthXNfTAzTn9aBytWq8pYvakCiL8XVksAiaXMmAJmMfaAHQzwXhKxBKDp
	wKF1NC2PVmTj6SVKEktCbXqUWf6IwHgONQDs+CrQQ91Vt8rdRbJCu0L/4LEXOs1b
	5t4V7Q2z66gv86HpQEn5VpdLbOUf8GpIE1W3Mybn0jQXQQNSnZQw1BNea1DDtOBn
	p9VHHIX6NDypyjOyapmA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0wy9r2qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 23:44:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LNijT7003968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 23:44:45 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 16:44:42 -0700
Message-ID: <92fd3347-1bda-7fb2-f637-e151928d6772@quicinc.com>
Date: Thu, 21 Mar 2024 16:44:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/5] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-5-79fa4e065574@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314-dpu-perf-rework-v3-5-79fa4e065574@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5-w1-xDApu1cCUQaP9eLfMGDwRgxAz6l
X-Proofpoint-GUID: 5-w1-xDApu1cCUQaP9eLfMGDwRgxAz6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_13,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403210179



On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> The max_per_pipe_ib is a constant across all CRTCs and is read from the
> catalog. Drop corresponding calculations and read the value directly at
> icc_set_bw() time.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
>   3 files changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 2e78e57665fc..2fc05665dc7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -105,13 +105,12 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>   	}
>   
>   	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> -	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>   	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>   
>   	DRM_DEBUG_ATOMIC(
> -		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> +		"crtc=%d clk_rate=%llu core_ab=%llu\n",
>   			crtc->base.id, perf->core_clk_rate,
> -			perf->max_per_pipe_ib, perf->bw_ctl);
> +			perf->bw_ctl);
>   }
>   
>   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> @@ -190,9 +189,6 @@ static void dpu_core_perf_aggregate(struct drm_device *ddev,
>   		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
>   			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>   
> -			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
> -						    dpu_cstate->new_perf.max_per_pipe_ib);

during the override case

perf->max_per_pipe_ib = core_perf->fix_core_ib_vote

So this is one case where max_per_pipe_ib can actually be changed right?

Now, fix_core_ib_vote will not be used then?

> -
>   			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
>   
>   			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
> @@ -216,7 +212,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>   	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>   
>   	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> -	peak_bw = perf.max_per_pipe_ib;
> +	peak_bw = kms->catalog->perf->min_dram_ib;
>   
>   	if (kms->perf.fix_core_ab_vote)
>   		avg_bw = kms->perf.fix_core_ab_vote;
> @@ -321,15 +317,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>   		 * 2. new bandwidth vote - "ab or ib vote" is lower
>   		 *    than current vote at end of commit or stop.
>   		 */
> -		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
> -			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
> -			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
> -			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
> +		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
> +		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
>   			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
>   				crtc->base.id, params_changed,
>   				new->bw_ctl, old->bw_ctl);
>   			old->bw_ctl = new->bw_ctl;
> -			old->max_per_pipe_ib = new->max_per_pipe_ib;
>   			update_bus = true;
>   		}
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index 5a3d18ca9555..a5a9c3389718 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -14,12 +14,10 @@
>   
>   /**
>    * struct dpu_core_perf_params - definition of performance parameters
> - * @max_per_pipe_ib: maximum instantaneous bandwidth request
>    * @bw_ctl: arbitrated bandwidth request
>    * @core_clk_rate: core clock rate request
>    */
>   struct dpu_core_perf_params {
> -	u64 max_per_pipe_ib;
>   	u64 bw_ctl;
>   	u64 core_clk_rate;
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 88c2e51ab166..771c04c1a5ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1389,8 +1389,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
>   	seq_printf(s, "core_clk_rate: %llu\n",
>   			dpu_crtc->cur_perf.core_clk_rate);
>   	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
> -	seq_printf(s, "max_per_pipe_ib: %llu\n",
> -				dpu_crtc->cur_perf.max_per_pipe_ib);
>   
>   	return 0;
>   }
> 


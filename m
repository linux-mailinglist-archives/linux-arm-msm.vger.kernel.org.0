Return-Path: <linux-arm-msm+bounces-45058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B118DA11641
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 01:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24D4C7A00C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 00:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576303C0B;
	Wed, 15 Jan 2025 00:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="er66LOrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BF235945
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 00:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736902411; cv=none; b=pEUCS0LREagXyAXZ2OV3goQ8CIABEphT7YApI7hDpz5C5YQj+yf7nADwsuUbOyKuqcUxVAzuMtU41Ls6d0hM5rJdJn1scaA/7okufMmXH2CuBblfcOv0sVDHZxfXH4uuIjFR//GrDS3RKmO9/M7LmIeQmupxLURqKWMRUmbnLGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736902411; c=relaxed/simple;
	bh=5AT2it7CtmFzxzpGGUq94yBaExoNarx+4/2mMpoEK6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WoUaH+rdfGpBjzvMZK2BbxRI110dtPZXaiBn7Rmp4F/nrDfLMpQ96I6+PG48Zg7S4JdoDmQEJ5jeRBdMm79l0Ln0sa0N9yjQiyIx2LSS3WoMSD9eB9vDwxhtzMRA0lvCDV9tAn5w1NCFtNmDQ867GATtVbppATRi6Tk+yYJ9TW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=er66LOrt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EGjSCa027410;
	Wed, 15 Jan 2025 00:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q1aaMtfue3Erfim9hTrFJ3g3HIRgzpfT8EkW2qZOzt4=; b=er66LOrtVRh7cKJM
	wxzoKuBCQVe5rC2jFcurFOZCDN2sL4j8l6CnRZ42QGm4sVljOMdSYE6NTg9odlBp
	RT6qx81hGHLrasMaf66z+C+nVj+bWfsJnR0Enxcu6NdvK5Ytbzn/nWVrkoMEBiEW
	rw5wwGf+ATOdshWOIJ72CsZp+Xo1YtOYL6Mfv1TdD8Z3gWZwdfHCX1fVR/mwdgwt
	X7N6q4IZlUHpG/9VCyFRO8LEUwFgAwzIfl75a+TS/v/ylwZWDUCKRPbpN3ZSNF73
	pEePlPWk04hDd37GGZ7I+3RSa2e9H2be8Auq72jLvIptUj4gSHpkF1RXmE/Cxx50
	3ixhOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445uqsgyp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 00:53:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F0rBjU021808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 00:53:11 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 16:53:11 -0800
Message-ID: <0fcc05ba-a126-4214-8a3d-9586cd5e8d88@quicinc.com>
Date: Tue, 14 Jan 2025 16:53:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Stephen
 Boyd <swboyd@chromium.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-9-00b248349476@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-dpu-perf-rework-v4-9-00b248349476@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EnwGwqZyAl0pFTQde28354SdCY84uKpx
X-Proofpoint-ORIG-GUID: EnwGwqZyAl0pFTQde28354SdCY84uKpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150004



On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> The max_per_pipe_ib is a constant across all CRTCs and is read from the
> catalog. The override value is also applied at the
> _dpu_core_perf_crtc_update_bus() time. Drop corresponding calculations
> and read the value directly at icc_set_bw() time.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 16 ++++------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
>   3 files changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 913eb4c01abe10c1ed84215fbbee50abd69e9317..62dab5883513dc570076da5a64e32e502dd4320b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -105,12 +105,10 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>   	}
>   
>   	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> -	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>   	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>   	DRM_DEBUG_ATOMIC(
> -		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> +		"crtc=%d clk_rate=%llu core_ab=%u\n",
>   			crtc->base.id, perf->core_clk_rate,
> -			perf->max_per_pipe_ib,
>   			(u32)DIV_ROUND_UP_ULL(perf->bw_ctl, 1000));
>   }
>   
> @@ -126,9 +124,6 @@ static void dpu_core_perf_aggregate(struct drm_device *ddev,
>   		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
>   			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>   
> -			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
> -						    dpu_cstate->new_perf.max_per_pipe_ib);

During the enabled cases, this is fine since even if one crtc is 
enabled, its going to use the same value.

During disable to enable and enable to disable transitions, we do need 
to make it 0 right?

OR if its already being made 0, we need to make sure it gets updated by 
forcing update_bus to true?

Is this part being handled by this block dpu_core_perf_crtc_update()?

         } else {
                 DRM_DEBUG_ATOMIC("crtc=%d disable\n", crtc->base.id);
                 memset(old, 0, sizeof(*old));
                 update_bus = true;
                 update_clk = true;
         }

Please confirm this, I am fine with this change otherwise.

> -
>   			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
>   
>   			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
> @@ -204,7 +199,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>   	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>   
>   	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> -	peak_bw = perf.max_per_pipe_ib;
> +	peak_bw = kms->catalog->perf->min_dram_ib;
>   
>   	if (kms->perf.fix_core_ab_vote)
>   		avg_bw = kms->perf.fix_core_ab_vote;
> @@ -315,15 +310,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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
> index 9d8516ca32d162b1e277ec88067e5c21abeb2017..863a6fc1f30c21cf2030a30be5fe62b024b3b820 100644
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
> -	u32 max_per_pipe_ib;
>   	u64 bw_ctl;
>   	u64 core_clk_rate;
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index ac3c6c5ad1cec3856f0eff2ed71153d3c2dc279e..cc240d3c7faa89254a575237634d0d0fa8f04f73 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1488,8 +1488,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
>   			dpu_crtc->cur_perf.core_clk_rate);
>   	seq_printf(s, "bw_ctl: %uk\n",
>   		   (u32)DIV_ROUND_UP_ULL(dpu_crtc->cur_perf.bw_ctl, 1000));
> -	seq_printf(s, "max_per_pipe_ib: %u\n",
> -				dpu_crtc->cur_perf.max_per_pipe_ib);
>   
>   	return 0;
>   }
> 


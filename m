Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A037475BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjGDPzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjGDPzr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:55:47 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC97FB2
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:55:46 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 364Fp0AS015665;
        Tue, 4 Jul 2023 15:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YlZs5wx6b/8RPdyoF4wgr8BNbbLFPLlYYRbPcZsw+Hw=;
 b=R4RTcxuf77Sb0uVOFBHRy6GNSGUDy82+J59L1yo2R6p/SYS0azaiZ/bGbCMUynNEKsJm
 zBmdepAgdAYxhB5eWzKBsT9s80rZyy4aJkB7AO5KCUmx2qrp+JvoUNMr5Nrok4blB91S
 1cCjcLCKtnjUScRmuQisUelQpHNMI02GPcxInDdFoWxd6qaYQTnxc17jNQB06mWQtFiC
 HBIrdD4KLmS1dg/uk+fjqq9MQ4DIoH71d2kaNbJ8DnCE/XXPx6/rdA6TeCW4Js9HkLvp
 IPgivYW/dt6DvyG7jHzYNrjRptl/4Nf4dsORhg0qvKYSv6sZo2S/obB/fSGGDsA4oCiq Fg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rm14jjryv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Jul 2023 15:55:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 364FtYqY017591
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 4 Jul 2023 15:55:34 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Tue, 4 Jul 2023
 08:55:32 -0700
Message-ID: <3e31a735-a4d1-c8d4-6a83-53e2687c2f18@quicinc.com>
Date:   Tue, 4 Jul 2023 08:55:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/14] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
 <20230704150354.159882-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230704150354.159882-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M0L8G7LYjlO7CF4e8Q6fIz-VwlS2pN22
X-Proofpoint-ORIG-GUID: M0L8G7LYjlO7CF4e8Q6fIz-VwlS2pN22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_10,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307040138
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/4/2023 8:03 AM, Dmitry Baryshkov wrote:
> Move perf mode handling for the bandwidth to
> _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> and then aggregating known values.
> 
> Note, this changes the fix_core_ab_vote. Previously it would be
> multiplied per the CRTC number, now it will be used directly for
> interconnect voting.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Break this out into a separate series. This rework doesnt need to be 
part of this cleanup series.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 37 +++++++++----------
>   1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 348550ac7e51..42c03a5f1f3e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -116,21 +116,9 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
>   		return;
>   	}
>   
> -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> -
> -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> -		perf->bw_ctl = 0;
> -		perf->max_per_pipe_ib = 0;
> -		perf->core_clk_rate = 0;
> -	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> -		perf->bw_ctl = kms->perf.fix_core_ab_vote;
> -		perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
> -		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
> -	} else {
> -		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> -		perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
> -		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
> -	}
> +	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> +	perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
> +	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
>   
>   	DRM_DEBUG_ATOMIC(
>   		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> @@ -236,17 +224,28 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>   	struct dpu_core_perf_params perf = { 0 };
>   	int i, ret = 0;
>   	u32 avg_bw;
> +	u32 peak_bw;
>   
>   	if (!kms->num_paths)
>   		return 0;
>   
> -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> +		avg_bw = 0;
> +		peak_bw = 0;
> +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> +		avg_bw = kms->perf.fix_core_ab_vote;
> +		peak_bw = kms->perf.fix_core_ib_vote;
> +	} else {
> +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> +
> +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> +		peak_bw = perf.max_per_pipe_ib;
> +	}
>   
> -	avg_bw = perf.bw_ctl;
> -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> +	avg_bw /= kms->num_paths;
>   
>   	for (i = 0; i < kms->num_paths; i++)
> -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
>   
>   	return ret;
>   }

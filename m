Return-Path: <linux-arm-msm+bounces-12250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2866860530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 22:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622CF1F2586F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E1A12D1F1;
	Thu, 22 Feb 2024 21:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Stq/7Vd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37D173F20
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 21:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708638830; cv=none; b=CeyD343jLOQyD6R1AkMC867Aj1TwukW/WwkolfUbvwPmAtwG01vwmZ406QG8fVi3O6NL0aYg/ByXXCZXaUJOhLN4HkitiZ9H3wCe0mYAHlFjnz7G+BaEIfkhFmg+0glJpkBZEIohZBQJ6MZs/IEQx3IO/nI4WRF9+FQUhyfXPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708638830; c=relaxed/simple;
	bh=d0T8D4f7GNDshwfyUQ82AlxK7wULj2Q6ntU+g4wRCl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b5iw4Y44ccqDQOc+EEWWZD+Hg6C/cveNERn1ULVEZ4d1syTiLAt1Gdlvh5OhibqEEmUHttKDJvOzGgWowndNtVdmNWL0rkAs6iP2lB//8SJRNmJVdmcheLbAVVCqNrVTCCxHzwc7YNs8jGUnevYfqmgzVy4a5SmUahqJFckKthc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Stq/7Vd4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MEp3NL028257;
	Thu, 22 Feb 2024 21:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=4o2C6+HPQ2RNpQR9e3LklnITWKo/VIjT04NZmIa8xgM=; b=St
	q/7Vd4SB6duWLa+mmU2PjRhrTXcJ9/y77CYllUhuTnYNrDPgsgumC5IDzjQY9Px5
	5VqN4QwdD2awbRxGFs8aE53jox4JNjo3SZDtnKs8sVFoum7u+JEXzgEtyahrdAxW
	GaNlEfqgfPubPGSrqjVPORFTsIpscj+UdKjnxTIVKhDLBgSY+xZPrWabF7JkVk3e
	E2axUhYDuu2OCNXWRvNbRosLe8Rz1QkcbsSPePvHWjLrUQD03xeNDJGHez2a3V0E
	chsldyqs3sBwzvaXgooNGKW3ofSQq9dvIyxG72CaocHOhi+V6S4zc1gX+Vx6svwn
	ndhOwuorW9L8SSHUYpOQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdvwwbdax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 21:53:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MLrewb019888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 21:53:40 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 22 Feb
 2024 13:53:39 -0800
Message-ID: <318495d1-3366-1ca8-72a2-8927cb1b4835@quicinc.com>
Date: Thu, 22 Feb 2024 13:53:38 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5] drm/msm/dpu: add current resource allocation to dumped
 state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240222-fd-rm-state-v5-1-4a6c81e87f63@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240222-fd-rm-state-v5-1-4a6c81e87f63@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: trPWUK3uglcR-hMeS7LHhZswJpR20fif
X-Proofpoint-GUID: trPWUK3uglcR-hMeS7LHhZswJpR20fif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402220170



On 2/22/2024 1:47 PM, Dmitry Baryshkov wrote:
> Provide atomic_print_state callback to the DPU's private object. This
> way the debugfs/dri/0/state will also include RM's internal state.
> 
> Example output (RB5 board, HDMI and writeback encoder enabled)
> 
> resource mapping:
> 	pingpong=31 36 # # # # - - - - -
> 	mixer=31 36 # # # # -
> 	ctl=# # 31 36 # #
> 	dspp=# # # #
> 	dsc=# # # # - -
> 	cdm=#
> 

Thanks, this LGTM now, one nit below.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v5:
> - Extracted the common helper for printing RM state
> - Changed the code to print '#' for unused/unmapped blocks (Abhinav)
> - Link to v4: https://lore.kernel.org/r/20240219-fd-rm-state-v4-1-b47f14ef27c2@linaro.org
> 
> Changes in v4:
> - Split the patch from the virual wide planes series
> - Reworked the output format
> - Added the CDM block into the dump
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 56 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
>   4 files changed, 78 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 723cc1d82143..9f3697e1eacb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -353,9 +353,18 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
>   	kfree(dpu_state);
>   }
>   
> +static void dpu_kms_global_print_state(struct drm_printer *p,
> +				       const struct drm_private_state *state)
> +{
> +	const struct dpu_global_state *global_state = to_dpu_global_state(state);
> +
> +	dpu_rm_print_state(p, global_state);
> +}
> +
>   static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
>   	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
>   	.atomic_destroy_state = dpu_kms_global_destroy_state,
> +	.atomic_print_state = dpu_kms_global_print_state,
>   };
>   
>   static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> @@ -371,6 +380,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
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
> index d1207f4ec3ae..2512c9bd08df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -131,6 +131,8 @@ struct vsync_info {
>   struct dpu_global_state {
>   	struct drm_private_state base;
>   
> +	struct dpu_rm *rm;
> +
>   	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
>   	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
>   	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 724537ab776d..1a56ddca536d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -634,3 +634,59 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   
>   	return num_blks;
>   }
> +
> +static void dpu_rm_print_state_helper(struct drm_printer *p,
> +					    struct dpu_hw_blk *blk,
> +					    uint32_t mapping)

Not sure if its the mail client, but is this aligned with the opening brace?

Please double check once. Rest LGTM.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


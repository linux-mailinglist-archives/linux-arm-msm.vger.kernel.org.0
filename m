Return-Path: <linux-arm-msm+bounces-12481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B4862CA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 20:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 575DE1C20FF2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 19:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7241B810;
	Sun, 25 Feb 2024 19:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZlYV8w1O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A917D18EAB;
	Sun, 25 Feb 2024 19:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708890577; cv=none; b=ZP/Hxc7qv8/NptvhnzIUltJLjwrccjMXF5zS9LkQOYHc95tqXRAxF+JzIA8yKrh1T3A4xHVbvrEPizLZL7F/DdlByxi4hhrCtqmK7Xu6j7kgbC5uQabVIcs1OfTTha+DgoMGjwDcafvuRJ4GRIItRXIQvn12qBpzwSquyRNWHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708890577; c=relaxed/simple;
	bh=kpYYY4MQ3v81I6ozx/aAHnYwBT1Ss0YzuqS5QWQIrrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MA87dEoUtccAunPAzSS/mYH7o4NsaoIkOZfxMrcRSG76GdphH74SAPVai44njSmuCbVqBaduHfKaHef2FiotgQXulFvvFNz83N5WnyhZbid7zGgtmJ5on3JwZ3edMTtT16y5y2qw3vIRx308eS535ACDpI6L2Kqv/GC/Z3HjhfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZlYV8w1O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41PJU7st017438;
	Sun, 25 Feb 2024 19:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=OU8yJpmXc7FZKGcFXSsGUdcHVMdCkb6v1aSV7j/HeSI=; b=Zl
	YV8w1OGo9gPcVFDZQHRLzG//4r0F86ldWK80Rb2gqZvDua8FkBEXhbHJqolCpy9j
	5mxMUJhIfITYOdQiOGVL7wbAxCz7gE8vuoj2nlyKY29YARHa6dxJ0lZURenvhQqY
	wSANpmAlPPM/UhdGyD0JTh1aK/W7Y9Xf/EGtS9YF0815T8fB6XeZPkjT4AAYZDFH
	VbMEPrKKaDpiAwRqtPINV9zTCLPZIcSuxUhB7q1pCasz3Izw1Qq+LtIOFUKl/Erj
	o0dyGyVdZttTFhX1aAITeSa2/u16ouNHfe41VPdegz+jeucoyfofUsLdDlKlljXH
	hy2gohfm+KqNRHfBPkNQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wf7snjbkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Feb 2024 19:49:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41PJnKww028178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Feb 2024 19:49:20 GMT
Received: from [10.110.76.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 25 Feb
 2024 11:49:19 -0800
Message-ID: <f3c304b3-7cd3-6f90-c438-8c2c0ded8bd2@quicinc.com>
Date: Sun, 25 Feb 2024 11:49:18 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: split dpu_encoder_wait_for_event into
 two functions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Steev Klimaszewski <steev@kali.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
 <20240225-fd-dpu-debug-timeout-v3-2-252f2b21cdcc@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240225-fd-dpu-debug-timeout-v3-2-252f2b21cdcc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GOwrAsvLiKHd2JdNy3QCrDnsvIF0v4-s
X-Proofpoint-GUID: GOwrAsvLiKHd2JdNy3QCrDnsvIF0v4-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-25_22,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402250157



On 2/25/2024 6:12 AM, Dmitry Baryshkov wrote:
> Stop multiplexing several events via the dpu_encoder_wait_for_event()
> function. Split it into two distinct functions two allow separate
> handling of those events.
> 

I understand the idea but would handling of those events be really distinct?

Like if wait_for_commit_done timedout or wait_for_tx_complete timedout, 
the handling will be similar from my PoV.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 74 +++++++++++++++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 ++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>   drivers/gpu/drm/msm/msm_drv.h               | 10 ----
>   4 files changed, 59 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 194dbb08331d..30f349c8a1e5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1282,7 +1282,7 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>   	trace_dpu_enc_disable(DRMID(drm_enc));
>   
>   	/* wait for idle */
> -	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
> +	dpu_encoder_wait_for_tx_complete(drm_enc);
>   
>   	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
>   
> @@ -2402,10 +2402,23 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   	return &dpu_enc->base;
>   }
>   
> -int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
> -	enum msm_event_wait event)
> +/**
> + * dpu_encoder_wait_for_commit_done() - Wait for encoder to flush pending state
> + * @drm_enc:	encoder pointer
> + *
> + * Wait for hardware to have flushed the current pending frames to hardware at
> + * a vblank or ctl_start Encoders will map this differently depending on the
> + * panel type.
> + *

Missing a '.' between ctl_start and Encoder?

> + * MSM_ENC_TX_COMPLETE -  Wait for the hardware to transfer all the pixels to
> + *                        the panel. Encoders will map this differently
> + *                        depending on the panel type.
> + *                        vid mode -> vsync_irq
> + *                        cmd mode -> pp_done
> + * Return: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
> + */
> +int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_enc)
>   {
> -	int (*fn_wait)(struct dpu_encoder_phys *phys_enc) = NULL;
>   	struct dpu_encoder_virt *dpu_enc = NULL;
>   	int i, ret = 0;
>   
> @@ -2419,23 +2432,46 @@ int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
>   	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   
> -		switch (event) {
> -		case MSM_ENC_COMMIT_DONE:
> -			fn_wait = phys->ops.wait_for_commit_done;
> -			break;
> -		case MSM_ENC_TX_COMPLETE:
> -			fn_wait = phys->ops.wait_for_tx_complete;
> -			break;
> -		default:
> -			DPU_ERROR_ENC(dpu_enc, "unknown wait event %d\n",
> -					event);
> -			return -EINVAL;
> +		if (phys->ops.wait_for_commit_done) {
> +			DPU_ATRACE_BEGIN("wait_for_commit_done");
> +			ret = phys->ops.wait_for_commit_done(phys);
> +			DPU_ATRACE_END("wait_for_commit_done");
> +			if (ret)
> +				return ret;
>   		}
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * dpu_encoder_wait_for_tx_complete() - Wait for encoder to transfer pixels to panel
> + * @drm_enc:	encoder pointer
> + *
> + * Wait for the hardware to transfer all the pixels to the panel. Encoders will
> + * map this differently depending on the panel type.
> + *
> + * Return: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
> + */
> +int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc = NULL;
> +	int i, ret = 0;
> +
> +	if (!drm_enc) {
> +		DPU_ERROR("invalid encoder\n");
> +		return -EINVAL;
> +	}
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	DPU_DEBUG_ENC(dpu_enc, "\n");
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   
> -		if (fn_wait) {
> -			DPU_ATRACE_BEGIN("wait_for_completion_event");
> -			ret = fn_wait(phys);
> -			DPU_ATRACE_END("wait_for_completion_event");
> +		if (phys->ops.wait_for_tx_complete) {
> +			DPU_ATRACE_BEGIN("wait_for_tx_complete");
> +			ret = phys->ops.wait_for_tx_complete(phys);
> +			DPU_ATRACE_END("wait_for_tx_complete");
>   			if (ret)
>   				return ret;
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index fe6b1d312a74..0c928d1876e4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -93,25 +93,9 @@ void dpu_encoder_kickoff(struct drm_encoder *encoder);
>    */
>   int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time);
>   
> -/**
> - * dpu_encoder_wait_for_event - Waits for encoder events
> - * @encoder:	encoder pointer
> - * @event:      event to wait for
> - * MSM_ENC_COMMIT_DONE -  Wait for hardware to have flushed the current pending
> - *                        frames to hardware at a vblank or ctl_start
> - *                        Encoders will map this differently depending on the
> - *                        panel type.
> - *	                  vid mode -> vsync_irq
> - *                        cmd mode -> ctl_start
> - * MSM_ENC_TX_COMPLETE -  Wait for the hardware to transfer all the pixels to
> - *                        the panel. Encoders will map this differently
> - *                        depending on the panel type.
> - *                        vid mode -> vsync_irq
> - *                        cmd mode -> pp_done
> - * Returns: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
> - */
> -int dpu_encoder_wait_for_event(struct drm_encoder *drm_encoder,
> -						enum msm_event_wait event);
> +int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_encoder);
> +
> +int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_encoder);
>   
>   /*
>    * dpu_encoder_get_intf_mode - get interface mode of the given encoder
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d6412395bacc..26b5e54031d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -476,7 +476,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
>   		 * mode panels. This may be a no-op for command mode panels.
>   		 */
>   		trace_dpu_kms_wait_for_commit_done(DRMID(crtc));
> -		ret = dpu_encoder_wait_for_event(encoder, MSM_ENC_COMMIT_DONE);
> +		ret = dpu_encoder_wait_for_commit_done(encoder);
>   		if (ret && ret != -EWOULDBLOCK) {
>   			DPU_ERROR("wait for commit done returned %d\n", ret);
>   			break;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 762e13e2df74..91cf57f72321 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -74,16 +74,6 @@ enum msm_dsi_controller {
>   #define MSM_GPU_MAX_RINGS 4
>   #define MAX_H_TILES_PER_DISPLAY 2
>   
> -/**
> - * enum msm_event_wait - type of HW events to wait for
> - * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
> - * @MSM_ENC_TX_COMPLETE - wait for the HW to transfer the frame to panel
> - */
> -enum msm_event_wait {
> -	MSM_ENC_COMMIT_DONE = 0,
> -	MSM_ENC_TX_COMPLETE,
> -};
> -
>   /**
>    * struct msm_display_topology - defines a display topology pipeline
>    * @num_lm:       number of layer mixers used
> 


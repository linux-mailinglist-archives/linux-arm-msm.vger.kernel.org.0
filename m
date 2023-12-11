Return-Path: <linux-arm-msm+bounces-4280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E180DE02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 23:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4042824EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 22:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EEB55776;
	Mon, 11 Dec 2023 22:09:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10101F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 14:09:52 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 360E4201B2;
	Mon, 11 Dec 2023 23:09:49 +0100 (CET)
Date: Mon, 11 Dec 2023 23:09:46 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Polimera <quic_vpolimer@quicinc.com>, 
	Kalyan Thota <quic_kalyant@quicinc.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: Ratelimit framedone timeout msgs
Message-ID: <lcsqjcqwvmhys3tzrznyqhlmk3p4wbv2rcu77tecbsioscxbal@3s4qeztkktx5>
References: <20231211182000.218088-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211182000.218088-1-robdclark@gmail.com>

On 2023-12-11 10:19:55, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When we start getting these, we get a *lot*.  So ratelimit it to not
> flood dmesg.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> 
> dpu should probably stop rolling it's own trace macros, but that would
> be a larger cleanup.

That would be lovely, use is currently all over the place.

Should this patch also ratelimit the corresponding:

	[drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:31 ret:-110 pp:0

On CMD-mode panels?

Note that this is a prime example of using DRM_ERROR over DPU_ERROR*, resulting
in unnecessary divergence (and un-readability) between error messages and the
code (DPU_DEBUG_CMDENC, which has a corresponding DPU_ERROR variant, is also
used within that function...)

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 82538844614b..7c22235d0eba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -39,6 +39,9 @@
>  #define DPU_ERROR_ENC(e, fmt, ...) DPU_ERROR("enc%d " fmt,\
>  		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
>  
> +#define DPU_ERROR_ENC_RATELIMITED(e, fmt, ...) DPU_ERROR_RATELIMITED("enc%d " fmt,\
> +		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
> +
>  /*
>   * Two to anticipate panels that can do cmd/vid dynamic switching
>   * plan is to create all possible physical encoder types, and switch between
> @@ -2339,7 +2342,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>  		return;
>  	}
>  
> -	DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
> +	DPU_ERROR_ENC_RATELIMITED(dpu_enc, "frame done timeout\n");
>  
>  	event = DPU_ENCODER_FRAME_EVENT_ERROR;
>  	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index b6f53ca6e962..f5473d4dea92 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -51,6 +51,7 @@
>  	} while (0)
>  
>  #define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
> +#define DPU_ERROR_RATELIMITED(fmt, ...) pr_err_ratelimited("[dpu error]" fmt, ##__VA_ARGS__)
>  
>  /**
>   * ktime_compare_safe - compare two ktime structures
> -- 
> 2.43.0
> 


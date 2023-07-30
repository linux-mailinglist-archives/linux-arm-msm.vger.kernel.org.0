Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06585768782
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 21:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjG3Tjr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 15:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjG3Tjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 15:39:46 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78D810CE
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 12:39:44 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8D3C5201D9;
        Sun, 30 Jul 2023 21:39:42 +0200 (CEST)
Date:   Sun, 30 Jul 2023 21:39:41 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 6/7] drm/msm/dpu: stop using raw IRQ indices in the
 kernel traces
Message-ID: <sa6htfdgpht34fz72l2jkrtho6gbcdrxzfeuoi4hgcd5slleik@u4hpd7h42ogk>
References: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
 <20230729222708.329265-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230729222708.329265-7-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-30 01:27:07, Dmitry Baryshkov wrote:
> In preparation to reworking IRQ indcies, stop using raw indices in
> kernel traces. Instead use a pair of register index and bit. This
> corresponds closer to the values in HW catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  8 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 72 +++++++++++--------
>  3 files changed, 49 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b81daa415efb..126ad2707dba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -413,7 +413,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>  	} else {
>  		ret = 0;
>  		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
> -			func, irq_idx,
> +			func, DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
>  			phys_enc->hw_pp->idx - PINGPONG_0,
>  			atomic_read(wait_info->atomic_cnt));
>  	}
> @@ -1554,7 +1554,9 @@ static int dpu_encoder_helper_wait_event_timeout(
>  				atomic_read(info->atomic_cnt) == 0, jiffies);
>  		time = ktime_to_ms(ktime_get());
>  
> -		trace_dpu_enc_wait_event_timeout(drm_id, irq_idx, rc, time,
> +		trace_dpu_enc_wait_event_timeout(drm_id,
> +						 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
> +						 rc, time,
>  						 expected_time,
>  						 atomic_read(info->atomic_cnt));
>  	/* If we timed out, counter is valid and time is less, wait again */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index b1592d73470d..04e5b889c6d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -546,7 +546,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  		return -EBUSY;
>  	}
>  
> -	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
> +	trace_dpu_core_irq_register_callback(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
>  	irq_entry->arg = irq_arg;
>  	irq_entry->cb = irq_cb;
>  
> @@ -558,7 +558,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
> -	trace_dpu_irq_register_success(irq_idx);
> +	trace_dpu_irq_register_success(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	return 0;
>  }
> @@ -579,7 +579,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> -	trace_dpu_core_irq_unregister_callback(irq_idx);
> +	trace_dpu_core_irq_unregister_callback(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
>  	if (ret)
> @@ -592,7 +592,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>  
> -	trace_dpu_irq_unregister_success(irq_idx);
> +	trace_dpu_irq_unregister_success(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 1a92d21094f4..b64bd8eba26c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -168,46 +168,50 @@ TRACE_EVENT(dpu_perf_crtc_update,
>  );
>  
>  DECLARE_EVENT_CLASS(dpu_irq_template,
> -	TP_PROTO(int irq_idx),
> -	TP_ARGS(irq_idx),
> +	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
> +	TP_ARGS(irq_reg, irq_bit),
>  	TP_STRUCT__entry(
> -		__field(	int,			irq_idx		)
> +		__field(	unsigned int,		irq_reg		)
> +		__field(	unsigned int,		irq_bit		)
>  	),
>  	TP_fast_assign(
> -		__entry->irq_idx = irq_idx;
> +		__entry->irq_reg = irq_reg;
> +		__entry->irq_bit = irq_bit;
>  	),
> -	TP_printk("irq=%d", __entry->irq_idx)
> +	TP_printk("IRQ=[%d, %d]", __entry->irq_reg, __entry->irq_bit)

Regarding the other patch: IRQ=[...] works for me too, as long as it's
consistent.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

>  );
>  DEFINE_EVENT(dpu_irq_template, dpu_irq_register_success,
> -	TP_PROTO(int irq_idx),
> -	TP_ARGS(irq_idx)
> +	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
> +	TP_ARGS(irq_reg, irq_bit)
>  );
>  DEFINE_EVENT(dpu_irq_template, dpu_irq_unregister_success,
> -	TP_PROTO(int irq_idx),
> -	TP_ARGS(irq_idx)
> +	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
> +	TP_ARGS(irq_reg, irq_bit)
>  );
>  
>  TRACE_EVENT(dpu_enc_irq_wait_success,
>  	TP_PROTO(uint32_t drm_id, void *func,
> -		 int irq_idx, enum dpu_pingpong pp_idx, int atomic_cnt),
> -	TP_ARGS(drm_id, func, irq_idx, pp_idx, atomic_cnt),
> +		 unsigned int irq_reg, unsigned int irq_bit, enum dpu_pingpong pp_idx, int atomic_cnt),
> +	TP_ARGS(drm_id, func, irq_reg, irq_bit, pp_idx, atomic_cnt),
>  	TP_STRUCT__entry(
>  		__field(	uint32_t,		drm_id		)
>  		__field(	void *,			func		)
> -		__field(	int,			irq_idx		)
> +		__field(	unsigned int,		irq_reg		)
> +		__field(	unsigned int,		irq_bit		)
>  		__field(	enum dpu_pingpong,	pp_idx		)
>  		__field(	int,			atomic_cnt	)
>  	),
>  	TP_fast_assign(
>  		__entry->drm_id = drm_id;
>  		__entry->func = func;
> -		__entry->irq_idx = irq_idx;
> +		__entry->irq_reg = irq_reg;
> +		__entry->irq_bit = irq_bit;
>  		__entry->pp_idx = pp_idx;
>  		__entry->atomic_cnt = atomic_cnt;
>  	),
> -	TP_printk("id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d",
> +	TP_printk("id=%u, callback=%ps, IRQ=[%d, %d], pp=%d, atomic_cnt=%d",
>  		  __entry->drm_id, __entry->func,
> -		  __entry->irq_idx, __entry->pp_idx, __entry->atomic_cnt)
> +		  __entry->irq_reg, __entry->irq_bit, __entry->pp_idx, __entry->atomic_cnt)
>  );
>  
>  DECLARE_EVENT_CLASS(dpu_drm_obj_template,
> @@ -507,12 +511,13 @@ DEFINE_EVENT(dpu_id_event_template, dpu_crtc_frame_event_more_pending,
>  );
>  
>  TRACE_EVENT(dpu_enc_wait_event_timeout,
> -	TP_PROTO(uint32_t drm_id, int irq_idx, int rc, s64 time,
> +	TP_PROTO(uint32_t drm_id, unsigned int irq_reg, unsigned int irq_bit, int rc, s64 time,
>  		 s64 expected_time, int atomic_cnt),
> -	TP_ARGS(drm_id, irq_idx, rc, time, expected_time, atomic_cnt),
> +	TP_ARGS(drm_id, irq_reg, irq_bit, rc, time, expected_time, atomic_cnt),
>  	TP_STRUCT__entry(
>  		__field(	uint32_t,	drm_id		)
> -		__field(	int,		irq_idx		)
> +		__field(	unsigned int,	irq_reg		)
> +		__field(	unsigned int,	irq_bit		)
>  		__field(	int,		rc		)
>  		__field(	s64,		time		)
>  		__field(	s64,		expected_time	)
> @@ -520,14 +525,15 @@ TRACE_EVENT(dpu_enc_wait_event_timeout,
>  	),
>  	TP_fast_assign(
>  		__entry->drm_id = drm_id;
> -		__entry->irq_idx = irq_idx;
> +		__entry->irq_reg = irq_reg;
> +		__entry->irq_bit = irq_bit;
>  		__entry->rc = rc;
>  		__entry->time = time;
>  		__entry->expected_time = expected_time;
>  		__entry->atomic_cnt = atomic_cnt;
>  	),
> -	TP_printk("id=%u, irq_idx=%d, rc=%d, time=%lld, expected=%lld cnt=%d",
> -		  __entry->drm_id, __entry->irq_idx, __entry->rc, __entry->time,
> +	TP_printk("id=%u, IRQ=[%d, %d], rc=%d, time=%lld, expected=%lld cnt=%d",
> +		  __entry->drm_id, __entry->irq_reg, __entry->irq_bit, __entry->rc, __entry->time,
>  		  __entry->expected_time, __entry->atomic_cnt)
>  );
>  
> @@ -886,30 +892,34 @@ TRACE_EVENT(dpu_intf_connect_ext_te,
>  );
>  
>  TRACE_EVENT(dpu_core_irq_register_callback,
> -	TP_PROTO(int irq_idx, void *callback),
> -	TP_ARGS(irq_idx, callback),
> +	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit, void *callback),
> +	TP_ARGS(irq_reg, irq_bit, callback),
>  	TP_STRUCT__entry(
> -		__field(	int,				irq_idx	)
> +		__field(	unsigned int,			irq_reg	)
> +		__field(	unsigned int,			irq_bit	)
>  		__field(	void *,				callback)
>  	),
>  	TP_fast_assign(
> -		__entry->irq_idx = irq_idx;
> +		__entry->irq_reg = irq_reg;
> +		__entry->irq_bit = irq_bit;
>  		__entry->callback = callback;
>  	),
> -	TP_printk("irq_idx:%d callback:%ps", __entry->irq_idx,
> +	TP_printk("IRQ=[%d, %d] callback:%ps", __entry->irq_reg, __entry->irq_bit,
>  		  __entry->callback)
>  );
>  
>  TRACE_EVENT(dpu_core_irq_unregister_callback,
> -	TP_PROTO(int irq_idx),
> -	TP_ARGS(irq_idx),
> +	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
> +	TP_ARGS(irq_reg, irq_bit),
>  	TP_STRUCT__entry(
> -		__field(	int,				irq_idx	)
> +		__field(	unsigned int,			irq_reg	)
> +		__field(	unsigned int,			irq_bit	)
>  	),
>  	TP_fast_assign(
> -		__entry->irq_idx = irq_idx;
> +		__entry->irq_reg = irq_reg;
> +		__entry->irq_bit = irq_bit;
>  	),
> -	TP_printk("irq_idx:%d", __entry->irq_idx)
> +	TP_printk("IRQ=[%d, %d]", __entry->irq_reg, __entry->irq_bit)
>  );
>  
>  TRACE_EVENT(dpu_core_perf_update_clk,
> -- 
> 2.39.2
> 

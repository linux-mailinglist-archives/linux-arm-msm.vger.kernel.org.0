Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C281E76810F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 20:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjG2Sn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 14:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjG2Sn7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 14:43:59 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026C210DE
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 11:43:57 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BA3B83F297;
        Sat, 29 Jul 2023 20:43:55 +0200 (CEST)
Date:   Sat, 29 Jul 2023 20:43:54 +0200
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
Subject: Re: [PATCH v3 2/6] drm/msm/dpu: extract dpu_core_irq_is_valid()
 helper
Message-ID: <wmuv2uq3c5tocnjaedohzixoirii5pgr4bvkjwlciuxbopnob7@na6jn26majn4>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
 <20230728233200.151735-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728233200.151735-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-29 02:31:56, Dmitry Baryshkov wrote:
> In preparation to reworking the IRQ indices, move irq_idx validation to
> the separate helper.

Nit: "the" sounds as if "separate helper" is a thing that already
exists, where you just moved it to.  Instead, you created a new helper
that now contains the validation that was open-coded before.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

For the contents though:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 01a9ccfcd54b..81d03b6c67d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -200,6 +200,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
>  #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
>  
> +static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
> +					 int irq_idx)
> +{
> +	return irq_idx >= 0 && irq_idx < intr->total_irqs;
> +}
> +
>  /**
>   * dpu_core_irq_callback_handler - dispatch core interrupts
>   * @dpu_kms:		Pointer to DPU's KMS structure
> @@ -291,7 +297,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  	if (!intr)
>  		return -EINVAL;
>  
> -	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -344,7 +350,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>  	if (!intr)
>  		return -EINVAL;
>  
> -	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -429,13 +435,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>  	if (!intr)
>  		return 0;
>  
> -	if (irq_idx < 0) {
> -		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
> -				__builtin_return_address(0), irq_idx);
> -		return 0;
> -	}
> -
> -	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
>  		pr_err("invalid IRQ index: [%d]\n", irq_idx);
>  		return 0;
>  	}
> @@ -518,7 +518,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>  		return -EINVAL;
>  	}
>  
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
>  		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> @@ -555,7 +555,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>  	unsigned long irq_flags;
>  	int ret;
>  
> -	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> +	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
>  		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
>  		return -EINVAL;
>  	}
> -- 
> 2.39.2
> 

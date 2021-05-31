Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B96B396A38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 01:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbhFAABT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 20:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhFAABT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 20:01:19 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85BCC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 16:59:37 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso12469801otl.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 16:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=glM+C18tv5YQVj5/3djZjAFcNCXaUEK5klQIVDIAczU=;
        b=FMuyAcYFLSWB3uOIDEXlTXhvyUTXUn1bWKFbWiA9bMxsneSTUIiZhdH4xiLRE66ZGF
         bQdN9UnqSysCily13bWLbN1brLzfam78aahwvSkG5vu0XEI8QLH1jk74UwuLfkaA4HE/
         Bk2/wykbjD+1mWEUGUQjBpkq68m6Qns5yKA6uPfAIeS01OIcySV8ThmHWeg21pzGkzI/
         3qSNLYjd+NDFzstSMQGSoUuwbRkLyPyamKTKutFvNS4kAZoDhBcDokkC7Y5Kuu8+963t
         i7bGgTj2PokolR3bR01Eq9CQCydrq22gJHAYgdXp/LX0zxYU8gI6Glxygj+SztbjO1NS
         RVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=glM+C18tv5YQVj5/3djZjAFcNCXaUEK5klQIVDIAczU=;
        b=GLKWHXTOC7PtV07b8KUxijKTsccTjazOa1KTrHYFS2Lz/tBbSf0yfT1sZI19RwWf/s
         dcEFcJB65wYW7BjpTN3H1iR/fO0BiSNBdj6MTT/MHLfssTkWTolnkJxCdDFgtjoWOtY1
         Ky9bVsqQ2kCfIFMGV/Wjvz/55vo4puQYHYi/hMEE7HtHSge8bOxsUkHpm/5AIvTl++nS
         A40YzyoijRX9UfRLCT3YKCgM6H7Dim6acuRsu+eCRjv3iwWd/hC0kl9lI5oIMCt7qzHj
         Bgi7SDtLyVf+mzq7o6NI6y/QEG8T03/ThJO8P95GkAECR1sCcwZ3AaAnCiuJqZ+9mYU3
         wn8w==
X-Gm-Message-State: AOAM532LxskRXDILtDl12bGWrTO8VV2SxzqN+054d1ASobD38HLt+74D
        r8IoG2b43eIp0OBZgnRi4D1wEg==
X-Google-Smtp-Source: ABdhPJztsKdq6JSZNHeszl+Q7oCjj5gIbagpseiWKtvrPIEIGLWjKmMd9DYYeJyc6j0J7bUepY+lZA==
X-Received: by 2002:a9d:63cc:: with SMTP id e12mr3725492otl.89.1622505576869;
        Mon, 31 May 2021 16:59:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y14sm3333029otq.4.2021.05.31.16.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 16:59:36 -0700 (PDT)
Date:   Mon, 31 May 2021 18:59:34 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v5 1/3] soc: qcom: Add support for Core Power Reduction
 v3, v4 and Hardened
Message-ID: <YLV4ZnJ8SUbwpatl@builder.lan>
References: <20210121194051.484209-1-angelogioacchino.delregno@somainline.org>
 <20210121194051.484209-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121194051.484209-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Jan 13:40 CST 2021, AngeloGioacchino Del Regno wrote:

> This commit introduces a new driver, based on the one for cpr v1,
> to enable support for the newer Qualcomm Core Power Reduction
> hardware, known downstream as CPR3, CPR4 and CPRh, and support
> for MSM8998 and SDM630 CPU power reduction.
> 
> In these new versions of the hardware, support for various new
> features was introduced, including voltage reduction for the GPU,
> security hardening and a new way of controlling CPU DVFS,
> consisting in internal communication between microcontrollers,
> specifically the CPR-Hardened and the Operating State Manager.
> 
> The CPR v3, v4 and CPRh are present in a broad range of SoCs,
> from the mid-range to the high end ones including, but not limited
> to, MSM8953/8996/8998, SDM630/636/660/845.

Why is 845 in this list? I was under the impression that CPR was dealt
with entirely by firmware starting in 845.


Also, you don't happen to have the 8996 data laying around somewhere?

> diff --git a/drivers/soc/qcom/cpr3.c b/drivers/soc/qcom/cpr3.c
[..]
> +/*
> + * cpr_get_ring_osc_factor - Get fuse corner ring oscillator factor
> + *
> + * Not all threads have different scaling factors for each
> + * Fuse Corner: if the RO factors are the same for all corners,
> + * then only one is specified, instead of uselessly repeating
> + * the same array for FC-times.
> + * This function checks for the same and gives back the right
> + * factor for the requested ring oscillator.
> + *
> + * Returns: Ring oscillator factor

This is almost kerneldoc, how about adding another '*', some parenthesis
on the function name, short description of the parameters and dropping
the 's' on Return?

> + */
> +static int cpr_get_ro_factor(const struct cpr_thread_desc *tdesc,
> +			     int fnum, int ro_idx)
> +{
> +	int ro_fnum;
> +
> +	if (tdesc->ro_avail_corners == tdesc->num_fuse_corners)
> +		ro_fnum = fnum;
> +	else
> +		ro_fnum = 0;
> +
> +	return tdesc->ro_scaling_factor[ro_fnum][ro_idx];
> +}
> +
> +static void cpr_write(struct cpr_thread *thread, u32 offset, u32 value)
> +{
> +	writel_relaxed(value, thread->base + offset);

I dislike the fact that we default to the _relaxed() version of
readl/writel. Can we please switch them for non-relaxed versions, or
document why they all need to be _relaxed?

> +}
> +
> +static u32 cpr_read(struct cpr_thread *thread, u32 offset)
> +{
> +	return readl_relaxed(thread->base + offset);
> +}
> +
> +static void
> +cpr_masked_write(struct cpr_thread *thread, u32 offset, u32 mask, u32 value)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(thread->base + offset);
> +	val &= ~mask;
> +	val |= value & mask;
> +	writel_relaxed(val, thread->base + offset);
> +}
> +
> +static void cpr_irq_clr(struct cpr_thread *thread)
> +{
> +	cpr_write(thread, CPR3_REG_IRQ_CLEAR, CPR3_IRQ_ALL);
> +}
> +
> +static void cpr_irq_clr_nack(struct cpr_thread *thread)
> +{
> +	cpr_irq_clr(thread);
> +	cpr_write(thread, CPR3_REG_CONT_CMD, CPR3_CONT_CMD_NACK);
> +}
> +
> +static void cpr_irq_clr_ack(struct cpr_thread *thread)
> +{
> +	cpr_irq_clr(thread);
> +	cpr_write(thread, CPR3_REG_CONT_CMD, CPR3_CONT_CMD_ACK);
> +}
> +
> +static void cpr_irq_set(struct cpr_thread *thread, u32 int_bits)
> +{
> +	/* On CPR-hardened, interrupts are managed by and on firmware */
> +	if (thread->drv->desc->cpr_type == CTRL_TYPE_CPRH)
> +		return;
> +
> +	cpr_write(thread, CPR3_REG_IRQ_EN, int_bits);
> +}
> +
> +/**
> + * cpr_ctl_enable - Enable CPR thread

() after the function name, here an in all kerneldoc comments below.

> + * @thread:     Structure holding CPR thread-specific parameters
> + */
> +static void cpr_ctl_enable(struct cpr_thread *thread)
> +{
> +	if (thread->drv->enabled && !thread->restarting)
> +		cpr_masked_write(thread, CPR3_REG_CPR_CTL,
> +				CPR3_CPR_CTL_LOOP_EN_MASK,
> +				CPR3_CPR_CTL_LOOP_EN_MASK);

Please wrap this "block" in {}

> +}
> +
> +/**
> + * cpr_ctl_disable - Disable CPR thread
> + * @thread:     Structure holding CPR thread-specific parameters
> + */
> +static void cpr_ctl_disable(struct cpr_thread *thread)
> +{
> +	const struct cpr_desc *desc = thread->drv->desc;
> +
> +	if (desc->cpr_type != CTRL_TYPE_CPRH) {
> +		cpr_irq_set(thread, 0);
> +		cpr_irq_clr(thread);
> +	}
> +
> +	cpr_masked_write(thread, CPR3_REG_CPR_CTL,
> +			 CPR3_CPR_CTL_LOOP_EN_MASK, 0);
> +}
> +
> +/**
> + * cpr_ctl_is_enabled - Check if thread is enabled
> + * @thread:     Structure holding CPR thread-specific parameters
> + *
> + * Returns: true if the CPR is enabled, false if it is disabled.

It's supposed to be "Return:"

> + */
> +static bool cpr_ctl_is_enabled(struct cpr_thread *thread)
> +{
> +	u32 reg_val;
> +
> +	reg_val = cpr_read(thread, CPR3_REG_CPR_CTL);
> +	return reg_val & CPR3_CPR_CTL_LOOP_EN_MASK;
> +}
> +
[..]
> +/**
> + * cpr_configure - Configure main HW parameters
> + * @thread: Structure holding CPR thread-specific parameters
> + *
> + * This function configures the main CPR hardware parameters, such as
> + * internal timers (and delays), sensor ownerships, activates and/or
> + * deactivates cpr-threads and others, as one sequence for all of the
> + * versions supported in this driver. By design, the function may
> + * return a success earlier if the sequence for "a previous version"
> + * has ended.
> + *
> + * NOTE: The CPR must be clocked before calling this function!

I think "Context: " is suitable for this type of comments.

> + *
> + * Returns: Zero for success or negative number on errors.
> + */
> +static int cpr_configure(struct cpr_thread *thread)
> +{
> +	struct cpr_drv *drv = thread->drv;
> +	const struct cpr_desc *desc = drv->desc;
> +	const struct cpr_thread_desc *tdesc = thread->desc;
> +	u32 val;
> +	int i;
> +
> +	/* Disable interrupt and CPR */
> +	cpr_irq_set(thread, 0);
> +	cpr_write(thread, CPR3_REG_CPR_CTL, 0);
> +
> +	/* Init and save gcnt */
> +	drv->gcnt = drv->ref_clk_khz * desc->gcnt_us;
> +	do_div(drv->gcnt, 1000);
> +
> +	/* Program the delay count for the timer */
> +	val = drv->ref_clk_khz * desc->timer_delay_us;
> +	do_div(val, 1000);
> +	if (desc->cpr_type == CTRL_TYPE_CPR3) {
> +		cpr_write(thread, CPR3_REG_CPR_TIMER_MID_CONT, val);
> +
> +		val = drv->ref_clk_khz * desc->timer_updn_delay_us;
> +		do_div(val, 1000);
> +		cpr_write(thread, CPR3_REG_CPR_TIMER_UP_DN_CONT, val);
> +	} else {
> +		cpr_write(thread, CPR3_REG_CPR_TIMER_AUTO_CONT, val);
> +	}
> +	dev_dbg(drv->dev, "Timer count: %#0x (for %d us)\n", val,
> +		desc->timer_delay_us);
> +
> +	/* Program the control register */
> +	val = desc->idle_clocks << CPR3_CPR_CTL_IDLE_CLOCKS_SHIFT
> +	    | desc->count_mode << CPR3_CPR_CTL_COUNT_MODE_SHIFT
> +	    | desc->count_repeat << CPR3_CPR_CTL_COUNT_REPEAT_SHIFT;

I think it's idiomatic to have the | at the end of the previous line,
rather than start with it. And below you repeat val |=, pick one style
and stick with that.

> +	cpr_write(thread, CPR3_REG_CPR_CTL, val);
> +
> +	/* Configure CPR default step quotients */
> +	val = tdesc->step_quot_init_min << CPR3_CPR_STEP_QUOT_MIN_SHIFT
> +	    | tdesc->step_quot_init_max << CPR3_CPR_STEP_QUOT_MAX_SHIFT;
> +
> +	cpr_write(thread, CPR3_REG_CPR_STEP_QUOT, val);
> +
> +	/*
> +	 * Configure the CPR sensor ownership always on thread 0
> +	 * TODO: SDM845 has different ownership for sensors!!
> +	 */
> +	for (i = tdesc->sensor_range_start; i < tdesc->sensor_range_end; i++)
> +		cpr_write(thread, CPR3_REG_SENSOR_OWNER(i), 0);
> +
> +	/* Program Consecutive Up & Down */
> +	val = desc->timer_cons_up << CPR3_THRESH_CONS_UP_SHIFT;
> +	val |= desc->timer_cons_down << CPR3_THRESH_CONS_DOWN_SHIFT;
> +	val |= desc->up_threshold << CPR3_THRESH_UP_THRESH_SHIFT;
> +	val |= desc->down_threshold << CPR3_THRESH_DOWN_THRESH_SHIFT;
> +	cpr_write(thread, CPR3_REG_THRESH(tdesc->hw_tid), val);
> +
> +	/* Mask all ring oscillators for all threads initially */
> +	cpr_write(thread, CPR3_REG_RO_MASK(tdesc->hw_tid), CPR3_RO_MASK);
> +
> +	/* HW Closed-loop control */
> +	if (desc->cpr_type == CTRL_TYPE_CPR3)

Some {} here and in various places below, please

> +		cpr_write(thread, CPR3_REG_HW_CLOSED_LOOP_DISABLED,
> +			  !desc->hw_closed_loop_en);
> +	else
> +		cpr_masked_write(thread, CPR4_REG_MARGIN_ADJ_CTL,
> +				CPR4_MARGIN_ADJ_HW_CLOSED_LOOP_EN,
> +				desc->hw_closed_loop_en ?
> +				CPR4_MARGIN_ADJ_HW_CLOSED_LOOP_EN : 0);

Regards,
Bjorn

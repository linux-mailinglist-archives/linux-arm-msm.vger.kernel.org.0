Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F143E3AD9F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 14:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbhFSMVj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Jun 2021 08:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhFSMVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Jun 2021 08:21:37 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DBAC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jun 2021 05:19:26 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3BC303F347;
        Sat, 19 Jun 2021 14:19:22 +0200 (CEST)
Subject: Re: [PATCH v5 1/3] soc: qcom: Add support for Core Power Reduction
 v3, v4 and Hardened
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jeffrey.l.hugo@gmail.com
References: <20210121194051.484209-1-angelogioacchino.delregno@somainline.org>
 <20210121194051.484209-2-angelogioacchino.delregno@somainline.org>
 <YLV4ZnJ8SUbwpatl@builder.lan>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <25dfad85-dbdf-2f33-53b0-2e43d4b59e51@somainline.org>
Date:   Sat, 19 Jun 2021 14:19:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YLV4ZnJ8SUbwpatl@builder.lan>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 01/06/21 01:59, Bjorn Andersson ha scritto:
> On Thu 21 Jan 13:40 CST 2021, AngeloGioacchino Del Regno wrote:
> 
>> This commit introduces a new driver, based on the one for cpr v1,
>> to enable support for the newer Qualcomm Core Power Reduction
>> hardware, known downstream as CPR3, CPR4 and CPRh, and support
>> for MSM8998 and SDM630 CPU power reduction.
>>
>> In these new versions of the hardware, support for various new
>> features was introduced, including voltage reduction for the GPU,
>> security hardening and a new way of controlling CPU DVFS,
>> consisting in internal communication between microcontrollers,
>> specifically the CPR-Hardened and the Operating State Manager.
>>
>> The CPR v3, v4 and CPRh are present in a broad range of SoCs,
>> from the mid-range to the high end ones including, but not limited
>> to, MSM8953/8996/8998, SDM630/636/660/845.
> 

Hi Bjorn,
sorry for the very late reply... I've been really too busy lately.

> Why is 845 in this list? I was under the impression that CPR was dealt
> with entirely by firmware starting in 845.
> 
> 

Unless I got something wrong, yes it's true that CPR-Hardened setup is
done in FW on 845, but the GPU CPR is not... and that's why it's in the
list :))

Future plans are to extend this driver to deal with GPU related CPR as
well as the CPU one.

> Also, you don't happen to have the 8996 data laying around somewhere?
> 

Yes, I do. Though, my intention here is to not throw too many things
into the game in this version of a very complicated driver... besides,
I currently can't test 8996 efficiently but maybe later!

Since it is our (SoMainline) intention to also get all (or most of) our
MSM8996 devices kicking on upstream, I'm sure that we'll throw that data
in the CPR mix as soon as possible.

Eventually, I can also send the 8996 data addition separately even if
untested and clearly specifying so, even though I don't like sending
untested things.

>> diff --git a/drivers/soc/qcom/cpr3.c b/drivers/soc/qcom/cpr3.c
> [..]
>> +/*
>> + * cpr_get_ring_osc_factor - Get fuse corner ring oscillator factor
>> + *
>> + * Not all threads have different scaling factors for each
>> + * Fuse Corner: if the RO factors are the same for all corners,
>> + * then only one is specified, instead of uselessly repeating
>> + * the same array for FC-times.
>> + * This function checks for the same and gives back the right
>> + * factor for the requested ring oscillator.
>> + *
>> + * Returns: Ring oscillator factor
> 
> This is almost kerneldoc, how about adding another '*', some parenthesis
> on the function name, short description of the parameters and dropping
> the 's' on Return?
> 

Yep, my bad, totally.

>> + */
>> +static int cpr_get_ro_factor(const struct cpr_thread_desc *tdesc,
>> +			     int fnum, int ro_idx)
>> +{
>> +	int ro_fnum;
>> +
>> +	if (tdesc->ro_avail_corners == tdesc->num_fuse_corners)
>> +		ro_fnum = fnum;
>> +	else
>> +		ro_fnum = 0;
>> +
>> +	return tdesc->ro_scaling_factor[ro_fnum][ro_idx];
>> +}
>> +
>> +static void cpr_write(struct cpr_thread *thread, u32 offset, u32 value)
>> +{
>> +	writel_relaxed(value, thread->base + offset);
> 
> I dislike the fact that we default to the _relaxed() version of
> readl/writel. Can we please switch them for non-relaxed versions, or
> document why they all need to be _relaxed?
> 

There is little reason, looking at the code size, but here's the deal:

On CPRv3/v4 (non-hardened), you do an initial programming sequence,
then for each frequency step you assign a corner (in software) and
whenever your driver requests a OPP change, the CPR driver will write
a corner level (also managing ACC and other stuff "manually") to the
hardware, which will then behave (blahblah); in this case, we are also
managing the CPR interrupts (as they are necessary to "play" with the
states).

On CPR-Hardened (or CPRv4-Hardened if you like), you still do an initial
programming sequence, but then you do nothing else. Literally.
CPR-Hardened is not made to be managed from the HLOS - that's made to be
managed "internally" by the Operating State Manager (OSM) which, after
getting programmed with matching values from CPR-Hardened, will request
corners to the CPR (and also manage ACC).

So, in short, the difference between CPR v3/v4 and CPR Hardened is:
- CPRv3/v4 is programmed by HLOS and managed by HLOS
- CPRh is programmed by HLOS and managed by OSM.


Now, the reason why I had defaulted this to relaxed accessors was that
in the CPRv3/v4 case we're setting the corners from HLOS, so I wanted to
get the best performance out of that operation.

Though, looking back at it, that's not a very safe thing to do, it is
indeed prone to mistakes, and if some of the writes won't go through, we
will end up with an undervolted CPU, which may be "catastrophic";

Re-analyzing the situation, I would have to put some more wmb() around
to make sure that this doesn't happen, but then the added overhead of
having all the registers R/W with non-relaxed accessors happens to be
very, very minimal.


Which means that, in the end, you're right - I've switched them to their
non-relaxed counterparts and biting the truly minimal and completely
unnoticeable overhead.

>> +}
>> +
>> +static u32 cpr_read(struct cpr_thread *thread, u32 offset)
>> +{
>> +	return readl_relaxed(thread->base + offset);
>> +}
>> +
>> +static void
>> +cpr_masked_write(struct cpr_thread *thread, u32 offset, u32 mask, u32 value)
>> +{
>> +	u32 val;
>> +
>> +	val = readl_relaxed(thread->base + offset);
>> +	val &= ~mask;
>> +	val |= value & mask;
>> +	writel_relaxed(val, thread->base + offset);
>> +}
>> +
>> +static void cpr_irq_clr(struct cpr_thread *thread)
>> +{
>> +	cpr_write(thread, CPR3_REG_IRQ_CLEAR, CPR3_IRQ_ALL);
>> +}
>> +
>> +static void cpr_irq_clr_nack(struct cpr_thread *thread)
>> +{
>> +	cpr_irq_clr(thread);
>> +	cpr_write(thread, CPR3_REG_CONT_CMD, CPR3_CONT_CMD_NACK);
>> +}
>> +
>> +static void cpr_irq_clr_ack(struct cpr_thread *thread)
>> +{
>> +	cpr_irq_clr(thread);
>> +	cpr_write(thread, CPR3_REG_CONT_CMD, CPR3_CONT_CMD_ACK);
>> +}
>> +
>> +static void cpr_irq_set(struct cpr_thread *thread, u32 int_bits)
>> +{
>> +	/* On CPR-hardened, interrupts are managed by and on firmware */
>> +	if (thread->drv->desc->cpr_type == CTRL_TYPE_CPRH)
>> +		return;
>> +
>> +	cpr_write(thread, CPR3_REG_IRQ_EN, int_bits);
>> +}
>> +
>> +/**
>> + * cpr_ctl_enable - Enable CPR thread
> 
> () after the function name, here an in all kerneldoc comments below.
> 

I am sort of ashamed for this kerneldoc thing.. on the other hand, I
remember I've went literally crazy with this driver.. hahaha

No, obviously that's not an excuse :))

>> + * @thread:     Structure holding CPR thread-specific parameters
>> + */
>> +static void cpr_ctl_enable(struct cpr_thread *thread)
>> +{
>> +	if (thread->drv->enabled && !thread->restarting)
>> +		cpr_masked_write(thread, CPR3_REG_CPR_CTL,
>> +				CPR3_CPR_CTL_LOOP_EN_MASK,
>> +				CPR3_CPR_CTL_LOOP_EN_MASK);
> 
> Please wrap this "block" in {}
> 

Ack.

>> +}
>> +
>> +/**
>> + * cpr_ctl_disable - Disable CPR thread
>> + * @thread:     Structure holding CPR thread-specific parameters
>> + */
>> +static void cpr_ctl_disable(struct cpr_thread *thread)
>> +{
>> +	const struct cpr_desc *desc = thread->drv->desc;
>> +
>> +	if (desc->cpr_type != CTRL_TYPE_CPRH) {
>> +		cpr_irq_set(thread, 0);
>> +		cpr_irq_clr(thread);
>> +	}
>> +
>> +	cpr_masked_write(thread, CPR3_REG_CPR_CTL,
>> +			 CPR3_CPR_CTL_LOOP_EN_MASK, 0);
>> +}
>> +
>> +/**
>> + * cpr_ctl_is_enabled - Check if thread is enabled
>> + * @thread:     Structure holding CPR thread-specific parameters
>> + *
>> + * Returns: true if the CPR is enabled, false if it is disabled.
> 
> It's supposed to be "Return:"
> 

Totally.

>> + */
>> +static bool cpr_ctl_is_enabled(struct cpr_thread *thread)
>> +{
>> +	u32 reg_val;
>> +
>> +	reg_val = cpr_read(thread, CPR3_REG_CPR_CTL);
>> +	return reg_val & CPR3_CPR_CTL_LOOP_EN_MASK;
>> +}
>> +
> [..]
>> +/**
>> + * cpr_configure - Configure main HW parameters
>> + * @thread: Structure holding CPR thread-specific parameters
>> + *
>> + * This function configures the main CPR hardware parameters, such as
>> + * internal timers (and delays), sensor ownerships, activates and/or
>> + * deactivates cpr-threads and others, as one sequence for all of the
>> + * versions supported in this driver. By design, the function may
>> + * return a success earlier if the sequence for "a previous version"
>> + * has ended.
>> + *
>> + * NOTE: The CPR must be clocked before calling this function!
> 
> I think "Context: " is suitable for this type of comments.
> 

Agreed.

>> + *
>> + * Returns: Zero for success or negative number on errors.
>> + */
>> +static int cpr_configure(struct cpr_thread *thread)
>> +{
>> +	struct cpr_drv *drv = thread->drv;
>> +	const struct cpr_desc *desc = drv->desc;
>> +	const struct cpr_thread_desc *tdesc = thread->desc;
>> +	u32 val;
>> +	int i;
>> +
>> +	/* Disable interrupt and CPR */
>> +	cpr_irq_set(thread, 0);
>> +	cpr_write(thread, CPR3_REG_CPR_CTL, 0);
>> +
>> +	/* Init and save gcnt */
>> +	drv->gcnt = drv->ref_clk_khz * desc->gcnt_us;
>> +	do_div(drv->gcnt, 1000);
>> +
>> +	/* Program the delay count for the timer */
>> +	val = drv->ref_clk_khz * desc->timer_delay_us;
>> +	do_div(val, 1000);
>> +	if (desc->cpr_type == CTRL_TYPE_CPR3) {
>> +		cpr_write(thread, CPR3_REG_CPR_TIMER_MID_CONT, val);
>> +
>> +		val = drv->ref_clk_khz * desc->timer_updn_delay_us;
>> +		do_div(val, 1000);
>> +		cpr_write(thread, CPR3_REG_CPR_TIMER_UP_DN_CONT, val);
>> +	} else {
>> +		cpr_write(thread, CPR3_REG_CPR_TIMER_AUTO_CONT, val);
>> +	}
>> +	dev_dbg(drv->dev, "Timer count: %#0x (for %d us)\n", val,
>> +		desc->timer_delay_us);
>> +
>> +	/* Program the control register */
>> +	val = desc->idle_clocks << CPR3_CPR_CTL_IDLE_CLOCKS_SHIFT
>> +	    | desc->count_mode << CPR3_CPR_CTL_COUNT_MODE_SHIFT
>> +	    | desc->count_repeat << CPR3_CPR_CTL_COUNT_REPEAT_SHIFT;
> 
> I think it's idiomatic to have the | at the end of the previous line,
> rather than start with it. And below you repeat val |=, pick one style
> and stick with that.
> 

This is the perfect example of a developer going *nuts*.. hehehe
Fixed :))

>> +	cpr_write(thread, CPR3_REG_CPR_CTL, val);
>> +
>> +	/* Configure CPR default step quotients */
>> +	val = tdesc->step_quot_init_min << CPR3_CPR_STEP_QUOT_MIN_SHIFT
>> +	    | tdesc->step_quot_init_max << CPR3_CPR_STEP_QUOT_MAX_SHIFT;
>> +
>> +	cpr_write(thread, CPR3_REG_CPR_STEP_QUOT, val);
>> +
>> +	/*
>> +	 * Configure the CPR sensor ownership always on thread 0
>> +	 * TODO: SDM845 has different ownership for sensors!!
>> +	 */
>> +	for (i = tdesc->sensor_range_start; i < tdesc->sensor_range_end; i++)
>> +		cpr_write(thread, CPR3_REG_SENSOR_OWNER(i), 0);
>> +
>> +	/* Program Consecutive Up & Down */
>> +	val = desc->timer_cons_up << CPR3_THRESH_CONS_UP_SHIFT;
>> +	val |= desc->timer_cons_down << CPR3_THRESH_CONS_DOWN_SHIFT;
>> +	val |= desc->up_threshold << CPR3_THRESH_UP_THRESH_SHIFT;
>> +	val |= desc->down_threshold << CPR3_THRESH_DOWN_THRESH_SHIFT;
>> +	cpr_write(thread, CPR3_REG_THRESH(tdesc->hw_tid), val);
>> +
>> +	/* Mask all ring oscillators for all threads initially */
>> +	cpr_write(thread, CPR3_REG_RO_MASK(tdesc->hw_tid), CPR3_RO_MASK);
>> +
>> +	/* HW Closed-loop control */
>> +	if (desc->cpr_type == CTRL_TYPE_CPR3)
> 
> Some {} here and in various places below, please
> 

Ack.

>> +		cpr_write(thread, CPR3_REG_HW_CLOSED_LOOP_DISABLED,
>> +			  !desc->hw_closed_loop_en);
>> +	else
>> +		cpr_masked_write(thread, CPR4_REG_MARGIN_ADJ_CTL,
>> +				CPR4_MARGIN_ADJ_HW_CLOSED_LOOP_EN,
>> +				desc->hw_closed_loop_en ?
>> +				CPR4_MARGIN_ADJ_HW_CLOSED_LOOP_EN : 0);
> 
> Regards,
> Bjorn
> 

Thank you for the review, Bjorn. Totally appreciated.
You will see a new version around soon.

Yours,
- Angelo


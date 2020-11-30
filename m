Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8952C8241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 11:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgK3Kdt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 05:33:49 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:48443 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgK3Kds (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 05:33:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606732407; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=XbIyuWKjkQT21NxnwRPJYNCZaS+TXn0voo9kNlwTpuU=; b=uzidtyyMJIbAhUlJR5B61ExUYFJqtVAKv3ujRKECdb84x6b0vF162chU5wAQMLUrJzUireYV
 mDR2D5hB7Ou2QfyTOdzAVZQRGPsKEmCd870YKZwGZTzRfgLTtZ/HmJH+W4KgNNaqYOcgtsi4
 N8b/HVhxVC42tXo9YbEw6eYos5o=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fc4ca75e9b7088622edbd30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 10:33:25
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F367C43461; Mon, 30 Nov 2020 10:33:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.71.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4579FC433C6;
        Mon, 30 Nov 2020 10:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4579FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: Clear possible pending irq when
 remuxing GPIOs
To:     Douglas Anderson <dianders@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <d6c5dba9-bcc7-fac9-dd41-c989509c822b@codeaurora.org>
Date:   Mon, 30 Nov 2020 16:03:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124094636.v2.3.I771b6594b2a4d5b7fe7e12a991a6640f46386e8d@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 11/24/2020 11:17 PM, Douglas Anderson wrote:
> Conceptually, we can envision the input on Qualcomm SoCs to pass
> through a bunch of blocks between coming into the chip and becoming a
> GPIO interrupt.  From guessing and running a handful of tests, I
> believe that we can represent the state of the world with a drawing
> that looks something like this:
>
>   +-----------------+       +-----------------+       +-----------------+
>   |      INPUT      |  -->  |      PINMUX     |       |    IS_INPUT     |
>   +-----------------+       |                 |  -->  |                 |
>                             | output bogus (?)|       | output bogus (?)|
>                             | if not muxed    |       | if input disab. |
>                             +-----------------+       +-----------------+
>                                                                |
>            +---------------------------------------------------+--> to PDC
>            |
>            V
>   +-----------------+       +-----------------+       +-----------------+
>   | INTR RAW ENABLE |       | DETECTION LOGIC |       | STATUS REGISTER |
>   |                 |       |                 |       |                 |
>   | output bogus (?)|  -->  | maybe handles   |       | latches inputs  |
>   | if disabled     |       | polarity diffs  |  -->  | that are high   |
>   +-----------------+       |                 |       |                 |
>                             | maybe debounces |       | write 1 to clr  |
>                             | level irqs      |       +-----------------+
>                             +-----------------+                |
>                                                                |
>            +---------------------------------------------------+
>            |
>            V
>   +-----------------+
>   |      ENABLE     |
>   |                 |       +-----------------+
>   | nothing passes  |  -->  |   SUMMARY IRQ   |
>   | through if      |       +-----------------+
>   | disabled        |
>   +-----------------+
>
> The above might not be 100% exact, but for the purpose of this
> discussion, the point is that there are a whole bunch of gates and
> transformations on the input before it gets to the circuitry that
> generates interrupts.
>
> As you might guess, if you reconfigure one of the gates in the above
> diagram while the system is configured to detect interrupts things get
> a little wacky.  Specifically it appears that if you gate the input at
> any step it can cause various glitches in the later steps because they
> are still paying attention to their input but their input isn't really
> sane anymore.
>
> I did some poking and I found that I could generate bogus interrupts
> in the system both when muxing away from GPIO mode and also when
> muxing back to GPIO mode.  When configured to use the PDC path for
> generating interrupts I found that if the external input on the GPIO
> was low that I'd get what looked like a rising edge when unmuxing and
> a falling edge when muxing.  When configured away from the PDC path I
> got slightly different glitch interrupts when changing muxing.
>
> These glitches when remuxing matter in reality, not just in theory.
> To be concrete, let's take the special "wakeup_irq" in
> qcom_geni_serial.c as an example.  In sc7180-trogdor.dtsi we configure
> the uart3 to have two pinctrl states, sleep and default, and mux
> between the two during runtime PM and system suspend (see
> geni_se_resources_{on,off}() for more details).  The difference
> between the sleep and default state is that the RX pin is muxed to a
> GPIO during sleep and muxed to the UART otherwise.  When we switch
> between these two states we can generate the glitches talked about
> above because we're configured to look for edges but the transition
> from the gated input (which is bogus) to the real input can look like
> an edge.
>
> Historically the UART case above was handled by the fact that the
> "enable" function in the MSM GPIO driver did an "unmask and clear".
> This relied on the fact that the system happens to have the interrupt
> disabled until suspend time and that it would enable it after the
> pinmux change happened, thus clearing the interrupt.
>
> The historical solution, however, had a few problems.  The first
> problem (that nobody seemed to have tripped) is that we can still get
> bogus interrupts if we remux when the interrupt isn't disabled during
> the muxing and re-enabled after.  The second problem is that it
> violates how I believe that the interrupt enable path is supposed to
> work.
>
> In Linux, if a driver does disable_irq() and later does enable_irq()
> on its interrupt, I believe it's expecting these properties:
> * If an interrupt was pending when the driver disabled then it will
>    still be pending after the driver re-enables.
> * If an edge-triggered interrupt comes in while an interrupt is
>    disabled it should assert when the interrupt is re-enabled.
>
> If you think that the above sounds a lot like the disable_irq() and
> enable_irq() are supposed to be masking/unmasking the interrupt
> instead of disabling/enabling it then you've made an astute
> observation.  Specifically when talking about interrupts, "mask"
> usually means to stop posting interrupts but keep tracking them and
> "disable" means to fully shut off interrupt detection.  It's
> unfortunate that this is so confusing, but presumably this is all the
> way it is for historical reasons.
>
> Perhaps more confusing than the above is that, even though clients of
> IRQs themselves don't have a way to request mask/unmask
> vs. disable/enable calls, IRQ chips themselves can implement both.
> ...and yet more confusing is that if an IRQ chip implements
> disable/enable then they will be called when a client driver calls
> disable_irq() / enable_irq().
>
> It does feel like some of the above could be cleared up.  However,
> without any other core interrupt changes it should be clear that when
> an IRQ chip gets a request to "disable" an IRQ that it has to treat it
> like a mask of that IRQ.
>
> In any case, after that long interlude you can see that the "unmask
> and clear" can break things.  Maulik tried to fix it so that we no
> longer did "unmask and clear" in commit 71266d9d3936 ("pinctrl: qcom:
> Move clearing pending IRQ to .irq_request_resources callback"), but it
> didn't work for two reasons:
> * It only tried to address the problem for interrupts that had parents
>    (like the PDC).
> * It regressed the problem that the original clearing was trying to
>    solve.
>
> I think we can safely assume that if someone muxes a pin to be
> something other than a GPIO and then muxes it back that we can clear
> any interrupts that were pending on it without violating any
> assumptions that client drivers are making.  Presumably the client
> drivers are intentionally remuxing the pin away from a dedicated
> purpose to be a plain GPIO so they don't care what the pin state was
> before the mux switch and they don't expect to see the pin change
> level during this switch.  Let's move the clearing of the IRQ to the
> pin muxing routine so that we'll clear a pending IRQ if we're muxing
> from some non-GPIO mode to a GPIO mode.
>
> Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch depends on #2 in the series, but not #1.  #1 can land on
> its own and then #2/#3 can land together even without #1.  The only
> reason patch #1 and #2/#3 are together in one series is because they
> address similar issues.
>
> IMPORTANT NOTE: Maulik has requested to wait for his Ack on patch #3
> before landing [1].  As per above, this need not stop patch #1 from
> landing.
>
> I have done most of this patch testing on the Chrome OS 5.4 kernel
> tree (with many backports) but have sanity checked it on mainline.
>
> [1] https://lore.kernel.org/r/603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org
Please wait to land [1] before i confirm with HW team if this is indeed 
valid case.
>
> Changes in v2:
> - 0 => false
> - If skip_wake_irqs, don't need to clear normal intr.
> - Add comment about glitches in both output and input.
>
>   drivers/pinctrl/qcom/pinctrl-msm.c | 114 +++++++++++++++++++----------
>   1 file changed, 74 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 588df91274e2..89e9579d076d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -166,14 +166,44 @@ static int msm_get_function_groups(struct pinctrl_dev *pctldev,
>   	return 0;
>   }
>   
> +static void msm_pinctrl_clear_pending_irq(struct msm_pinctrl *pctrl,
> +					  unsigned int group,
> +					  unsigned int irq)
> +{
> +	struct irq_data *d = irq_get_irq_data(irq);
> +	const struct msm_pingroup *g;
> +	unsigned long flags;
> +	u32 val;
> +
> +	if (!d)
> +		return;
> +
> +	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
> +		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
> +		return;
> +	}
> +
> +	g = &pctrl->soc->groups[group];
> +
> +	raw_spin_lock_irqsave(&pctrl->lock, flags);
> +	val = msm_readl_intr_status(pctrl, g);
> +	val &= ~BIT(g->intr_status_bit);
> +	msm_writel_intr_status(val, pctrl, g);
> +	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +}
> +
>   static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   			      unsigned function,
>   			      unsigned group)
>   {
>   	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	struct gpio_chip *gc = &pctrl->chip;
> +	unsigned int irq = irq_find_mapping(gc->irq.domain, group);
>   	const struct msm_pingroup *g;
>   	unsigned long flags;
>   	u32 val, mask;
> +	u32 oldval;
> +	u32 old_i;
>   	int i;
>   
>   	g = &pctrl->soc->groups[group];
> @@ -187,15 +217,26 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   	if (WARN_ON(i == g->nfuncs))
>   		return -EINVAL;
>   
> -	raw_spin_lock_irqsave(&pctrl->lock, flags);
> +	disable_irq(irq);
>   
> -	val = msm_readl_ctl(pctrl, g);
> +	raw_spin_lock_irqsave(&pctrl->lock, flags);
> +	oldval = val = msm_readl_ctl(pctrl, g);
>   	val &= ~mask;
>   	val |= i << g->mux_bit;
>   	msm_writel_ctl(val, pctrl, g);
> -
>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   
> +	/*
> +	 * Clear IRQs if switching to/from GPIO mode since muxing to/from
> +	 * the GPIO path can cause phantom edges.
> +	 */
> +	old_i = (oldval & mask) >> g->mux_bit;
> +	if (old_i != i &&
> +	    (i == pctrl->soc->gpio_func || old_i == pctrl->soc->gpio_func))
> +		msm_pinctrl_clear_pending_irq(pctrl, group, irq);
> +

The phantom irq can come when switching to GPIO irq mode. so may be only 
check if (i == pctrl->soc->gpio_func) {

even better if you can clear this unconditionally.

> +	enable_irq(irq);
> +
>   	return 0;
>   }
>   
> @@ -456,32 +497,49 @@ static const struct pinconf_ops msm_pinconf_ops = {
>   static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>   {
>   	const struct msm_pingroup *g;
> +	unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
>   	unsigned long flags;
> +	u32 oldval;
>   	u32 val;
>   
>   	g = &pctrl->soc->groups[offset];
>   
> +	disable_irq(irq);
> +
>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>   
> -	val = msm_readl_ctl(pctrl, g);
> +	oldval = val = msm_readl_ctl(pctrl, g);
>   	val &= ~BIT(g->oe_bit);
>   	msm_writel_ctl(val, pctrl, g);
>   
>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   
> +	/*
> +	 * Clear IRQs if switching to/from input mode since that can use
> +	 * a phantom edge.
> +	 */
> +	if (oldval != val)
> +		msm_pinctrl_clear_pending_irq(pctrl, offset, irq);
same as above, can you clear this unconditionally.
> +
> +	enable_irq(irq);
> +
>   	return 0;
>   }
>   
>   static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, int value)
>   {
>   	const struct msm_pingroup *g;
> +	unsigned int irq = irq_find_mapping(chip->irq.domain, offset);
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
>   	unsigned long flags;
> +	u32 oldval;
>   	u32 val;
>   
>   	g = &pctrl->soc->groups[offset];
>   
> +	disable_irq(irq);
> +
>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>   
>   	val = msm_readl_io(pctrl, g);
> @@ -491,12 +549,21 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
>   		val &= ~BIT(g->out_bit);
>   	msm_writel_io(val, pctrl, g);
>   
> -	val = msm_readl_ctl(pctrl, g);
> +	oldval = msm_readl_ctl(pctrl, g);

should be, oldval = val = msm_readl_ctl(pctrl, g);

otherwise val will carry invalid value.

>   	val |= BIT(g->oe_bit);
>   	msm_writel_ctl(val, pctrl, g);
>   
>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   
> +	/*
> +	 * Clear IRQs if switching to/from input mode since that can use
> +	 * a phantom edge.
> +	 */
> +	if (oldval != val)
> +		msm_pinctrl_clear_pending_irq(pctrl, offset, irq);

i don't see a reason to clear the edges when switching to output mode.

can you remove the changes from .direction_output callback?

> +
> +	enable_irq(irq);
> +
>   	return 0;
>   }
>   
> @@ -774,7 +841,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   }
>   
> -static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
> +static void msm_gpio_irq_unmask(struct irq_data *d)
>   {
>   	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> @@ -792,17 +859,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>   
>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>   
> -	if (status_clear) {
> -		/*
> -		 * clear the interrupt status bit before unmask to avoid
> -		 * any erroneous interrupts that would have got latched
> -		 * when the interrupt is not in use.
> -		 */
> -		val = msm_readl_intr_status(pctrl, g);
> -		val &= ~BIT(g->intr_status_bit);
> -		msm_writel_intr_status(val, pctrl, g);
> -	}
> -
Above change was clearing irq in .irq_enable callback which will do 
clear + unmask from irq_startup() at the very end.
With your change, The problem is we have cleared the phantom irq much 
earlier in __setup_irq() phase and in below case its still latched as 
pending.

1. The client driver calls request_irq() => __setup_irq()
2. __setup_irq() then first invokes irq_request_resources() => 
msm_gpio_irq_reqres() => msm_pinmux_set_mux() => 
msm_pinctrl_clear_pending_irq()
3. __setup_irq() goes ahead and invokes __irq_set_trigger() => 
msm_gpio_irq_set_type()
4. __setup_irq() then invokes irq_startup() => gpiochip_irq_enable() => 
msm_gpio_irq_enable()

The phantom irq gets cleared in step (2) here, but with step (3) it gets 
latched again and at the end of step (4) still get phantom irq.
This seems because as per below comment in driver, pasting the part 
which has info,
/*
  * The edge detection logic seems to have a problem where toggling the 
RAW_STATUS_EN bit may
  * cause the status bit to latch spuriously when there isn't any edge
  */
In step (3) msm_gpio_irq_set_type() touches the RAW_STATUS_EN making the 
phantom irq pending again.
To resolve this, you will need to invoke msm_pinctrl_clear_pending_irq() 
at the end of the msm_gpio_irq_set_type().

I would like Rajendra's (already in cc) review as well on above part.

>   	val = msm_readl_intr_cfg(pctrl, g);
>   	val |= BIT(g->intr_raw_status_bit);
>   	val |= BIT(g->intr_enable_bit);
> @@ -815,14 +871,10 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>   
>   static void msm_gpio_irq_enable(struct irq_data *d)
>   {
> -	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> -	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> -
>   	if (d->parent_data)
>   		irq_chip_enable_parent(d);
>   
> -	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
> -		msm_gpio_irq_clear_unmask(d, true);
> +	msm_gpio_irq_unmask(d);

Still need the above if condition, the previous call 
irq_chip_enable_parent() already enabled the IRQ at PDC and GIC, so only 
go ahead to enable it at TLMM if there wasn't any parent.

if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
         msm_gpio_irq_unmask(d);

Thanks,
Maulik

>   }
>   
>   static void msm_gpio_irq_disable(struct irq_data *d)
> @@ -837,11 +889,6 @@ static void msm_gpio_irq_disable(struct irq_data *d)
>   		msm_gpio_irq_mask(d);
>   }
>   
> -static void msm_gpio_irq_unmask(struct irq_data *d)
> -{
> -	msm_gpio_irq_clear_unmask(d, false);
> -}
> -
>   /**
>    * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs handled by parent.
>    * @d: The irq dta.
> @@ -1097,19 +1144,6 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
>   		ret = -EINVAL;
>   		goto out;
>   	}
> -
> -	/*
> -	 * Clear the interrupt that may be pending before we enable
> -	 * the line.
> -	 * This is especially a problem with the GPIOs routed to the
> -	 * PDC. These GPIOs are direct-connect interrupts to the GIC.
> -	 * Disabling the interrupt line at the PDC does not prevent
> -	 * the interrupt from being latched at the GIC. The state at
> -	 * GIC needs to be cleared before enabling.
> -	 */
> -	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> -		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
> -
>   	return 0;
>   out:
>   	module_put(gc->owner);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECDB22B517
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 19:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbgGWRnI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 13:43:08 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46887 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726717AbgGWRnI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 13:43:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595526187; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=0kMEmXK3s9WAXn9Oo5JXf+tpYAov4SIj74pHnkssqZQ=; b=AAMKsIV9ks8Wh+2Y05ZxpTv0sgKjq7h25tO+IuSVhJxlyQVM0Yvb9g7widcTSrvcFOoLGo2H
 q3wuRmaRvwiAE83bXsQsZx9LqgUjtLeKDK3n+zATVA96SytnmtSgxAv20/9fNA3FHH4a4ude
 3z+BdOrKc/A7OWpA69+l6x5T9Pw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f19cc215912b3a405739024 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 17:42:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CCE86C433CB; Thu, 23 Jul 2020 17:42:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D7ECC433CA;
        Thu, 23 Jul 2020 17:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D7ECC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Thu, 23 Jul 2020 11:42:54 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be
 free
Message-ID: <20200723174254.GF9185@codeaurora.org>
References: <20200723010137.3127584-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200723010137.3127584-1-swboyd@chromium.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22 2020 at 19:01 -0600, Stephen Boyd wrote:
>The busy loop in rpmh_rsc_send_data() is written with the assumption
>that the udelay will be preempted by the tcs_tx_done() irq handler when
>the TCS slots are all full. This doesn't hold true when the calling
>thread is an irqthread and the tcs_tx_done() irq is also an irqthread.
>That's because kernel irqthreads are SCHED_FIFO and thus need to
>voluntarily give up priority by calling into the scheduler so that other
>threads can run.
>
>I see RCU stalls when I boot with irqthreads on the kernel commandline
>because the modem remoteproc driver is trying to send an rpmh async
>message from an irqthread that needs to give up the CPU for the rpmh
>irqthread to run and clear out tcs slots.
>
Would this be not better, if we we use a threaded IRQ handler or offload
tx_done to another waitqueue instead of handling it in IRQ handler?

-- Lina

> rcu: INFO: rcu_preempt self-detected stall on CPU
> rcu:     0-....: (1 GPs behind) idle=402/1/0x4000000000000002 softirq=2108/2109 fqs=4920
>  (t=21016 jiffies g=2933 q=590)
> Task dump for CPU 0:
> irq/11-smp2p    R  running task        0   148      2 0x00000028
> Call trace:
>  dump_backtrace+0x0/0x154
>  show_stack+0x20/0x2c
>  sched_show_task+0xfc/0x108
>  dump_cpu_task+0x44/0x50
>  rcu_dump_cpu_stacks+0xa4/0xf8
>  rcu_sched_clock_irq+0x7dc/0xaa8
>  update_process_times+0x30/0x54
>  tick_sched_handle+0x50/0x64
>  tick_sched_timer+0x4c/0x8c
>  __hrtimer_run_queues+0x21c/0x36c
>  hrtimer_interrupt+0xf0/0x22c
>  arch_timer_handler_phys+0x40/0x50
>  handle_percpu_devid_irq+0x114/0x25c
>  __handle_domain_irq+0x84/0xc4
>  gic_handle_irq+0xd0/0x178
>  el1_irq+0xbc/0x180
>  save_return_addr+0x18/0x28
>  return_address+0x54/0x88
>  preempt_count_sub+0x40/0x88
>  _raw_spin_unlock_irqrestore+0x4c/0x6c
>  ___ratelimit+0xd0/0x128
>  rpmh_rsc_send_data+0x24c/0x378
>  __rpmh_write+0x1b0/0x208
>  rpmh_write_async+0x90/0xbc
>  rpmhpd_send_corner+0x60/0x8c
>  rpmhpd_aggregate_corner+0x8c/0x124
>  rpmhpd_set_performance_state+0x8c/0xbc
>  _genpd_set_performance_state+0xdc/0x1b8
>  dev_pm_genpd_set_performance_state+0xb8/0xf8
>  q6v5_pds_disable+0x34/0x60 [qcom_q6v5_mss]
>  qcom_msa_handover+0x38/0x44 [qcom_q6v5_mss]
>  q6v5_handover_interrupt+0x24/0x3c [qcom_q6v5]
>  handle_nested_irq+0xd0/0x138
>  qcom_smp2p_intr+0x188/0x200
>  irq_thread_fn+0x2c/0x70
>  irq_thread+0xfc/0x14c
>  kthread+0x11c/0x12c
>  ret_from_fork+0x10/0x18
>
>This busy loop naturally lends itself to using a wait queue so that each
>thread that tries to send a message will sleep waiting on the waitqueue
>and only be woken up when a free slot is available. This should make
>things more predictable too because the scheduler will be able to sleep
>tasks that are waiting on a free tcs instead of the busy loop we
>currently have today.
>
>Cc: Douglas Anderson <dianders@chromium.org>
>Cc: Maulik Shah <mkshah@codeaurora.org>
>Cc: Lina Iyer <ilina@codeaurora.org>
>Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>---
> drivers/soc/qcom/rpmh-internal.h |   2 +
> drivers/soc/qcom/rpmh-rsc.c      | 101 ++++++++++++-------------------
> 2 files changed, 41 insertions(+), 62 deletions(-)
>
>diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
>index ef60e790a750..9a325bac58fe 100644
>--- a/drivers/soc/qcom/rpmh-internal.h
>+++ b/drivers/soc/qcom/rpmh-internal.h
>@@ -8,6 +8,7 @@
> #define __RPM_INTERNAL_H__
>
> #include <linux/bitmap.h>
>+#include <linux/wait.h>
> #include <soc/qcom/tcs.h>
>
> #define TCS_TYPE_NR			4
>@@ -118,6 +119,7 @@ struct rsc_drv {
> 	struct tcs_group tcs[TCS_TYPE_NR];
> 	DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
> 	spinlock_t lock;
>+	wait_queue_head_t tcs_wait;
> 	struct rpmh_ctrlr client;
> };
>
>diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>index 076fd27f3081..6c758b052c95 100644
>--- a/drivers/soc/qcom/rpmh-rsc.c
>+++ b/drivers/soc/qcom/rpmh-rsc.c
>@@ -19,6 +19,7 @@
> #include <linux/platform_device.h>
> #include <linux/slab.h>
> #include <linux/spinlock.h>
>+#include <linux/wait.h>
>
> #include <soc/qcom/cmd-db.h>
> #include <soc/qcom/tcs.h>
>@@ -444,6 +445,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
> 		 */
> 		if (!drv->tcs[ACTIVE_TCS].num_tcs)
> 			enable_tcs_irq(drv, i, false);
>+		wake_up(&drv->tcs_wait);
> 		spin_unlock(&drv->lock);
> 		if (req)
> 			rpmh_tx_done(req, err);
>@@ -562,44 +564,59 @@ static int find_free_tcs(struct tcs_group *tcs)
> 	return -EBUSY;
> }
>
>+static int claim_tcs_for_req(struct rsc_drv *drv, struct tcs_group *tcs,
>+			     const struct tcs_request *msg)
>+{
>+	int ret;
>+
>+	/*
>+	 * The h/w does not like if we send a request to the same address,
>+	 * when one is already in-flight or being processed.
>+	 */
>+	ret = check_for_req_inflight(drv, tcs, msg);
>+	if (ret)
>+		return ret;
>+
>+	return find_free_tcs(tcs);
>+}
>+
> /**
>- * tcs_write() - Store messages into a TCS right now, or return -EBUSY.
>+ * rpmh_rsc_send_data() - Write / trigger active-only message.
>  * @drv: The controller.
>  * @msg: The data to be sent.
>  *
>- * Grabs a TCS for ACTIVE_ONLY transfers and writes the messages to it.
>- *
>- * If there are no free TCSes for ACTIVE_ONLY transfers or if a command for
>- * the same address is already transferring returns -EBUSY which means the
>- * client should retry shortly.
>+ * NOTES:
>+ * - This is only used for "ACTIVE_ONLY" since the limitations of this
>+ *   function don't make sense for sleep/wake cases.
>+ * - To do the transfer, we will grab a whole TCS for ourselves--we don't
>+ *   try to share. If there are none available we'll wait indefinitely
>+ *   for a free one.
>+ * - This function will not wait for the commands to be finished, only for
>+ *   data to be programmed into the RPMh. See rpmh_tx_done() which will
>+ *   be called when the transfer is fully complete.
>+ * - This function must be called with interrupts enabled. If the hardware
>+ *   is busy doing someone else's transfer we need that transfer to fully
>+ *   finish so that we can have the hardware, and to fully finish it needs
>+ *   the interrupt handler to run. If the interrupts is set to run on the
>+ *   active CPU this can never happen if interrupts are disabled.
>  *
>- * Return: 0 on success, -EBUSY if client should retry, or an error.
>- *         Client should have interrupts enabled for a bit before retrying.
>+ * Return: 0 on success, -EINVAL on error.
>  */
>-static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>+int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
> {
> 	struct tcs_group *tcs;
> 	int tcs_id;
> 	unsigned long flags;
>-	int ret;
>
> 	tcs = get_tcs_for_msg(drv, msg);
> 	if (IS_ERR(tcs))
> 		return PTR_ERR(tcs);
>
> 	spin_lock_irqsave(&drv->lock, flags);
>-	/*
>-	 * The h/w does not like if we send a request to the same address,
>-	 * when one is already in-flight or being processed.
>-	 */
>-	ret = check_for_req_inflight(drv, tcs, msg);
>-	if (ret)
>-		goto unlock;
>
>-	ret = find_free_tcs(tcs);
>-	if (ret < 0)
>-		goto unlock;
>-	tcs_id = ret;
>+	wait_event_lock_irq(drv->tcs_wait,
>+			    (tcs_id = claim_tcs_for_req(drv, tcs, msg)) >= 0,
>+			    drv->lock);
>
> 	tcs->req[tcs_id - tcs->offset] = msg;
> 	set_bit(tcs_id, drv->tcs_in_use);
>@@ -627,47 +644,6 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
> 	__tcs_set_trigger(drv, tcs_id, true);
>
> 	return 0;
>-unlock:
>-	spin_unlock_irqrestore(&drv->lock, flags);
>-	return ret;
>-}
>-
>-/**
>- * rpmh_rsc_send_data() - Write / trigger active-only message.
>- * @drv: The controller.
>- * @msg: The data to be sent.
>- *
>- * NOTES:
>- * - This is only used for "ACTIVE_ONLY" since the limitations of this
>- *   function don't make sense for sleep/wake cases.
>- * - To do the transfer, we will grab a whole TCS for ourselves--we don't
>- *   try to share. If there are none available we'll wait indefinitely
>- *   for a free one.
>- * - This function will not wait for the commands to be finished, only for
>- *   data to be programmed into the RPMh. See rpmh_tx_done() which will
>- *   be called when the transfer is fully complete.
>- * - This function must be called with interrupts enabled. If the hardware
>- *   is busy doing someone else's transfer we need that transfer to fully
>- *   finish so that we can have the hardware, and to fully finish it needs
>- *   the interrupt handler to run. If the interrupts is set to run on the
>- *   active CPU this can never happen if interrupts are disabled.
>- *
>- * Return: 0 on success, -EINVAL on error.
>- */
>-int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>-{
>-	int ret;
>-
>-	do {
>-		ret = tcs_write(drv, msg);
>-		if (ret == -EBUSY) {
>-			pr_info_ratelimited("TCS Busy, retrying RPMH message send: addr=%#x\n",
>-					    msg->cmds[0].addr);
>-			udelay(10);
>-		}
>-	} while (ret == -EBUSY);
>-
>-	return ret;
> }
>
> /**
>@@ -975,6 +951,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
> 		return ret;
>
> 	spin_lock_init(&drv->lock);
>+	init_waitqueue_head(&drv->tcs_wait);
> 	bitmap_zero(drv->tcs_in_use, MAX_TCS_NR);
>
> 	irq = platform_get_irq(pdev, drv->id);
>
>base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
>-- 
>Sent by a computer, using git, on the internet
>

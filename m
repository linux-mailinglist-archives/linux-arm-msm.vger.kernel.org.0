Return-Path: <linux-arm-msm+bounces-80006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2933C28575
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 19:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B223AE83C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 18:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F42527144A;
	Sat,  1 Nov 2025 18:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKOGXujQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0D8248F66;
	Sat,  1 Nov 2025 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762021898; cv=none; b=aMan/JKAfOxfD9cugkhsEcHN2tiTUPn6E/gvwQGrAnSg7OhZNfxITq4S/2vfHjq6T8kPrRn3wKy9rfImzy/iSdhwczbLCxhl6WGw83nA6vlkFSPikZTnCkSpV1oDkwm1t4HW70GHYYVIbZ6Nq8QYdZC41mttyv59KwoyuRcXWWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762021898; c=relaxed/simple;
	bh=EFgABRO8KaGc/QXjGGJ5u7eNMgLakdjZ5WI+UwYzbeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khcSKsoHNwEKS3zcX482QTpzF2Ro98yjbz7rwDpYIZW3GC/qIYZPiMA1ylqdoBo4tjM9XjaJbUhl9vOC2QmYeHsa5qxF7p6DPk3BDZrDEMosDO1wq2JOqD1Hg/7UT4//GtPxlVwnqtU2vi116CqxcXze+qPOt1GFLDxm9P+jdBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKOGXujQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81953C4CEF1;
	Sat,  1 Nov 2025 18:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762021897;
	bh=EFgABRO8KaGc/QXjGGJ5u7eNMgLakdjZ5WI+UwYzbeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKOGXujQaO5QnGJ4s1hV3x4NGE7onOXNQaW/fj98pA7z4r6crCwXpToZ9HGb+3VBT
	 T2+7hC2Lx9TtWomij1s53daKKZ92t5nNr50mZH+Li7KgIM7GIrmcFl6569TEjotfQE
	 NPzE6GTchkIrh/v31K/DZ1/++GCs59JFzBE92uEvX1yQRPkldOWCIyTloCtZkcvK+d
	 /ERmTznf002CUxX3k2RxsatRRCgc7EHwjvbMNL46hMwV3TvqdpYlXOXRpI9LHya4vN
	 t9PASjy1v1FsfsPUoac6SpCoeK3uNic8Z/yhN6oeRFfNZVhEafSFbmZa7OHwkew+4E
	 16JIQqLpXgnDg==
Date: Sat, 1 Nov 2025 13:34:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
Subject: Re: [PATCH v2 4/7] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-4-6c81993b52ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-remoteproc-v2-4-6c81993b52ea@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 01:05:42AM -0700, Jingyi Wang wrote:
> From: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
> 
> Subsystems can be brought out of reset by entities such as
> bootloaders.

Good start of the commit message.

> Before attaching such subsystems, it is important to
> check the state of the subsystem.

Why?

I see three possible outcomes:
1) The subsystem was booted and is still running just fine.
2) The subsystem hit fatal error and flagged this in smp2p
3) The subsystem hit a wdog and I presume there would be a interrupt
   waiting for us as soon as we register a handler?

Perhaps I'm wrong about the semantics of #3? If so this should be
clearly documented in the commit message.


Also, at this point in the commit message you've established the
problem, the remainder is a description of how you're addressing the
problem. A paragraph break would be suitable.

> This patch adds support to attach
> to a subsystem by ensuring that the subsystem is in a sane state by
> reading SMP2P bits and pinging the subsystem.
> 
> Signed-off-by: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>

I would prefer email addresses to be all lowercase, but more
importantly, you lost the tail end of that address (same with author).

> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c      | 89 ++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5.h      | 14 +++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 63 +++++++++++++++++++++++++-
>  5 files changed, 165 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 58d5b85e58cd..4ce9e43fc5c7 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -94,6 +94,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>  	size_t len;
>  	char *msg;
>  
> +	if (q6v5->early_boot)
> +		complete(&q6v5->subsys_booted);
> +
>  	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
>  	if (!q6v5->running) {
>  		complete(&q6v5->stop_done);
> @@ -118,6 +121,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>  	size_t len;
>  	char *msg;
>  
> +	if (q6v5->early_boot)
> +		complete(&q6v5->subsys_booted);
> +
>  	if (!q6v5->running)
>  		return IRQ_HANDLED;
>  
> @@ -139,6 +145,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
>  
>  	complete(&q6v5->start_done);
>  
> +	if (q6v5->early_boot)
> +		complete(&q6v5->subsys_booted);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -172,6 +181,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
>  	if (q6v5->handover)
>  		q6v5->handover(q6v5);
>  
> +	if (q6v5->early_boot)
> +		complete(&q6v5->subsys_booted);
> +
>  	icc_set_bw(q6v5->path, 0, 0);
>  
>  	q6v5->handover_issued = true;
> @@ -234,6 +246,77 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>  }
>  EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>  
> +static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
> +{
> +	struct qcom_q6v5 *q6v5 = data;
> +
> +	complete(&q6v5->ping_done);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
> +{
> +	int ret;
> +	int ping_failed = 0;
> +
> +	reinit_completion(&q6v5->ping_done);
> +
> +	/* Set master kernel Ping bit */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state,
> +					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
> +	if (ret) {
> +		dev_err(q6v5->dev, "Failed to update ping bits\n");
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(PING_TIMEOUT));
> +	if (!ret) {
> +		ping_failed = -ETIMEDOUT;
> +		dev_err(q6v5->dev, "Failed to get back pong\n");
> +	}
> +
> +	/* Clear ping bit master kernel */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
> +	if (ret) {
> +		pr_err("Failed to clear master kernel bits\n");

Two dev_err and one pr_err?

> +		return ret;
> +	}
> +
> +	if (ping_failed)
> +		return ping_failed;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
> +
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
> +{
> +	int ret = -ENODEV;
> +
> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
> +	if (IS_ERR(q6v5->ping_state)) {
> +		dev_err(&pdev->dev, "failed to acquire smem state %ld\n",
> +			PTR_ERR(q6v5->ping_state));
> +		return ret;
> +	}
> +
> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
> +	if (q6v5->pong_irq < 0)
> +		return q6v5->pong_irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"q6v5 pong", q6v5);
> +	if (ret)
> +		dev_err(&pdev->dev, "failed to acquire pong IRQ\n");
> +
> +	init_completion(&q6v5->ping_done);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
> +
>  /**
>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>   * @q6v5:	handle to be initialized
> @@ -247,7 +330,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   */
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  		   struct rproc *rproc, int crash_reason, const char *load_state,
> -		   void (*handover)(struct qcom_q6v5 *q6v5))
> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
>  {
>  	int ret;
>  
> @@ -255,10 +338,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  	q6v5->dev = &pdev->dev;
>  	q6v5->crash_reason = crash_reason;
>  	q6v5->handover = handover;
> +	q6v5->early_boot = early_boot;
>  
>  	init_completion(&q6v5->start_done);
>  	init_completion(&q6v5->stop_done);
>  
> +	if (early_boot)
> +		init_completion(&q6v5->subsys_booted);
> +
>  	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
>  	if (q6v5->wdog_irq < 0)
>  		return q6v5->wdog_irq;
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 5a859c41896e..8a227bf70d7e 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -12,27 +12,35 @@ struct rproc;
>  struct qcom_smem_state;
>  struct qcom_sysmon;
>  
> +#define PING_TIMEOUT 500 /* in milliseconds */
> +#define PING_TEST_WAIT 500 /* in milliseconds */
> +
>  struct qcom_q6v5 {
>  	struct device *dev;
>  	struct rproc *rproc;
>  
>  	struct qcom_smem_state *state;
> +	struct qcom_smem_state *ping_state;
>  	struct qmp *qmp;
>  
>  	struct icc_path *path;
>  
>  	unsigned stop_bit;
> +	unsigned int ping_bit;
>  
>  	int wdog_irq;
>  	int fatal_irq;
>  	int ready_irq;
>  	int handover_irq;
>  	int stop_irq;
> +	int pong_irq;
>  
>  	bool handover_issued;
>  
>  	struct completion start_done;
>  	struct completion stop_done;
> +	struct completion subsys_booted;
> +	struct completion ping_done;
>  
>  	int crash_reason;
>  
> @@ -40,11 +48,13 @@ struct qcom_q6v5 {
>  
>  	const char *load_state;
>  	void (*handover)(struct qcom_q6v5 *q6v5);
> +
> +	bool early_boot;
>  };
>  
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  		   struct rproc *rproc, int crash_reason, const char *load_state,
> -		   void (*handover)(struct qcom_q6v5 *q6v5));
> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5));
>  void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
>  
>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
> @@ -52,5 +62,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>  
>  #endif
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index e98b7e03162c..1576b435b921 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -717,7 +717,7 @@ static int adsp_probe(struct platform_device *pdev)
>  		goto disable_pm;
>  
>  	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
> -			     desc->load_state, qcom_adsp_pil_handover);
> +			     desc->load_state, false, qcom_adsp_pil_handover);
>  	if (ret)
>  		goto disable_pm;
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 3087d895b87f..ee9bf048820a 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2165,7 +2165,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	qproc->has_mba_logs = desc->has_mba_logs;
>  
>  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
> -			     qcom_msa_handover);
> +			     false, qcom_msa_handover);
>  	if (ret)
>  		goto detach_proxy_pds;
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 158bcd6cc85c..b667c11aadb5 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -35,6 +35,8 @@
>  
>  #define MAX_ASSIGN_COUNT 3
>  
> +#define EARLY_BOOT_RETRY_INTERVAL_MS 5000

"retry" makes it sounds like we're doing something in a loop, but as far
as I can tell this is the "attach timeout".

> +
>  struct qcom_pas_data {
>  	int crash_reason_smem;
>  	const char *firmware_name;
> @@ -59,6 +61,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -409,6 +412,8 @@ static int qcom_pas_stop(struct rproc *rproc)
>  	if (pas->smem_host_id)
>  		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
>  
> +	pas->q6v5.early_boot = false;



> +
>  	return ret;
>  }
>  
> @@ -434,6 +439,51 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *adsp = rproc->priv;

Why is this variable named "adsp"?

> +	bool ready_state;
> +	bool crash_state;
> +
> +	if (!adsp->q6v5.early_boot)

This would imply that rproc->state == RPROC_DETACHED for a subsystem
with !early_boot. That shouldn't be possible, I think you should be more
vocal about this. E.g. by making this:
	if (WARN_ON(!adsp->q6v5.early_boot))

Or just decide that it's too defensive and drop the check.

> +		return -EINVAL;
> +
> +	ret = irq_get_irqchip_state(adsp->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (crash_state) {
> +		dev_err(adsp->dev, "Sub system has crashed before driver probe\n");
> +		adsp->rproc->state = RPROC_CRASHED;

We're attaching to a running subsystem, we conclude that it has crashed,
and we're doing nothing?

Why don't we call rproc_report_crash() here?

> +		return -EINVAL;
> +	}
> +
> +	ret = irq_get_irqchip_state(adsp->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +	if (ready_state) {
> +		dev_info(adsp->dev, "Sub system has boot-up before driver probe\n");

What does this mean? Success?

> +		adsp->rproc->state = RPROC_DETACHED;

Why do we just put it back in RPROC_DETACHED? What will happen now?
Isn't this the point where we should mark it as RPROC_RUNNING?

> +	} else {

/*
 * The early-boot subsystem has not crashed, nor signalled that it's
 * ready, wait for 5 more seconds in case it's late.
 */

That said, this begs the questions: can this really happen and why 5
seconds?

> +		ret = wait_for_completion_timeout(&adsp->q6v5.subsys_booted,
> +						  msecs_to_jiffies(EARLY_BOOT_RETRY_INTERVAL_MS));
> +		if (!ret) {
> +			dev_err(adsp->dev, "Timeout on waiting for subsystem interrupt\n");

So, we gave the subsystem timeof(kernel-boot) + 5 seconds to show sign
of life, and it didn't show up.

To me there are two possible reasons:
1) The bootloader never started the subsystem
2) The bootloader started it, it somehow ended up in a faulty scenario
   and we're failing to detect that.

#1 seems like a perfectly reasonable scenario e.g. during bringup and/or
development, and the path out of it seems to be to start the subsystem.

#2 would be a faulty scenario that we want to debug, but the user
probably want their subsystem (re)booted in the meantime.

> +			return -ETIMEDOUT;
> +		}

We didn't time out, the subsystem did tell us something happen. There
are four sources of this event, one of those correspond to our
"start_done" state during normal startup. Should we really treat all
four sources the same way here?

For two of the events, we can immediately attempt a recovery, no need to
ping the subsystem and wait for the timeout.

> +	}
> +
> +	ret = qcom_q6v5_ping_subsystem(&adsp->q6v5);
> +	if (ret) {
> +		dev_err(adsp->dev, "Failed to ping subsystem, assuming device crashed\n");
> +		rproc->state = RPROC_CRASHED;

As above, you mark it as crashed...and then what?

> +		return ret;
> +	}
> +
> +	adsp->q6v5.running = true;
> +	return ret;
> +}
> +
>  static const struct rproc_ops qcom_pas_ops = {
>  	.unprepare = qcom_pas_unprepare,
>  	.start = qcom_pas_start,
> @@ -442,6 +492,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.parse_fw = qcom_register_dump_segments,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -765,7 +816,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	pas->proxy_pd_count = ret;
>  
>  	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
> -			     desc->load_state, qcom_pas_handover);
> +			     desc->load_state, desc->early_boot, qcom_pas_handover);
>  	if (ret)
>  		goto detach_proxy_pds;
>  
> @@ -779,6 +830,16 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	}
>  
>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> +
> +	if (pas->q6v5.early_boot) {
> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
> +		if (ret)
> +			dev_err(&pdev->dev,
> +				"Unable to find ping/pong bits, falling back to firmware load\n");

You already printed more specific errors in
qcom_q6v5_ping_subsystem_init(), no need to print once more here.

Regards,
Bjorn

> +		else
> +			pas->rproc->state = RPROC_DETACHED;
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> 
> -- 
> 2.25.1
> 


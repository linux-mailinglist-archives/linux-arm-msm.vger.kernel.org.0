Return-Path: <linux-arm-msm+bounces-102757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M7PiLie52WkNsggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 04:59:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D43DE27B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 04:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE3543020D6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 02:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954E42C0294;
	Sat, 11 Apr 2026 02:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZkfz4dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB382264D3;
	Sat, 11 Apr 2026 02:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775876388; cv=none; b=Cl23kuE6vYLoEUIa2mRTx4xHNKiRxLh4RFUylRbID60uSDkr2oEvKS8AA5B4Iyc6ALU8Selsf/mTYpn5P3/t7giZ+eFPMT/WTgwXiOiqo//b0OlvNn+bZN8dKTrzQEWi9+iYj5OqFtY/byotNshPKH+8MZ+BucusFWhrJVLa5Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775876388; c=relaxed/simple;
	bh=mKa/7xqUoXqFSBxtgyn3RcyK5fmKhKgp08NgzWv5ehw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3JiBkkUND56/qEbJsmYTasgmpMRiJJosN0f122eAIial0uw2aAYOl8ak/uNh+4MuO7i+HpeQ61OGvBRfL78Z+mbqG1TSEAN85uaQD0Q7iPJiUMN6PHDe7wNyeP0ZqFi7WviendYM1qB3Gct5fzabcZBl9HP2GW6f2X35c6IgJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZkfz4dz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6745EC19421;
	Sat, 11 Apr 2026 02:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775876387;
	bh=mKa/7xqUoXqFSBxtgyn3RcyK5fmKhKgp08NgzWv5ehw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZkfz4dzsnKb4ymdtYLRzSivElOzUshNEXwqX0/TKZbctjUUrHCYh2xVeVGqIN1B2
	 fyjLxdu3CBF+QxKdaWrLc3+xq53jGZxa4uzBV8JWBjpFLN8ahuxKUwI64iOcJ1ZkV9
	 KTg0+9lQ3emLtWYacZRcbcPlcLLCYTf84G1ztaPp4+OInX5iecS9hMsgqtNfBrfZWe
	 +kCnzPtcec5swiSLZ7+tyPGv0PyKWG/Gq0PNkJ5qCKb2Jr5yf+9nixCDAKOLldmam4
	 tJpbZ8uLS4OnWAQp45R6A/BR6GsC5xIQgJbFQ+F5n/fYSsgEYBSV8LALWyyRO8ML5B
	 7+8VNdRfHtl5Q==
Date: Fri, 10 Apr 2026 21:59:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <adm37MruBfXAjLpZ@baldur>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102757-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 320D43DE27B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits and performing ping
> test.
> 

I still don't understand.

Are you saying that devm_request_threaded_irq() will succeed and then
calling irq_get_irqchip_state() will not work? Or are you saying that
SMP2P driver isn't reliable and we're loosing the ready or fatal bits?


In the reply to v4 you replied to me with "it's a downstream feature".
That isn't a reason for performing this extra dance, either downstream
or upstream.

> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the
> subsystem is ready and the ping is successful, it will be marked as
> "attached". If ready irq is not received, it could be the early boot
> feature is not supported by other entities. In this case, the state will
> be marked as RPROC_OFFLINE so that the PAS driver can load the firmware
> and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c     | 69 ++++++++++++++++++++++++++++++++
>  drivers/remoteproc/qcom_q6v5.h     |  6 +++
>  drivers/remoteproc/qcom_q6v5_pas.c | 80 ++++++++++++++++++++++++++++++++++++--
>  3 files changed, 152 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 58d5b85e58cd..52247c17c38a 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -20,6 +20,7 @@
>  
>  #define Q6V5_LOAD_STATE_MSG_LEN	64
>  #define Q6V5_PANIC_DELAY_MS	200
> +#define Q6V5_PING_TIMEOUT_MS	500

Changelog says you removed 5 second timeout, but you only removed 4.5
seconds.

Regards,
Bjorn

>  
>  static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
>  {
> @@ -234,6 +235,74 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
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
> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(Q6V5_PING_TIMEOUT_MS));
> +	if (!ret) {
> +		ping_failed = -ETIMEDOUT;
> +		dev_err(q6v5->dev, "Failed to get back pong\n");
> +	}
> +
> +	/* Clear ping bit master kernel */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
> +	if (ret) {
> +		dev_err(q6v5->dev, "Failed to clear master kernel bits\n");
> +		return ret;
> +	}
> +
> +	return ping_failed;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
> +
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
> +{
> +	int ret = -ENODEV;
> +
> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
> +	if (IS_ERR(q6v5->ping_state)) {
> +		dev_err(&pdev->dev, "Failed to acquire smem state %ld\n",
> +			PTR_ERR(q6v5->ping_state));
> +		return PTR_ERR(q6v5->ping_state);
> +	}
> +
> +	init_completion(&q6v5->ping_done);
> +
> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
> +	if (q6v5->pong_irq < 0)
> +		return q6v5->pong_irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"q6v5 pong", q6v5);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to acquire pong IRQ\n");
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
> +
>  /**
>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>   * @q6v5:	handle to be initialized
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 5a859c41896e..5025ffc4dbe8 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -17,22 +17,26 @@ struct qcom_q6v5 {
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
> +	struct completion ping_done;
>  
>  	int crash_reason;
>  
> @@ -52,5 +56,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>  
>  #endif
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..34b54cf832d0 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>  	int region_assign_count;
>  	bool region_assign_shared;
>  	int region_assign_vmid;
> +	bool early_boot;
>  };
>  
>  struct qcom_pas {
> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>  
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  
> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
> -	if (handover)
> -		qcom_pas_handover(&pas->q6v5);
> +	/*
> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
> +	 * avoid mismatch.
> +	 */
> +	if (pas->rproc->state != RPROC_ATTACHED) {
> +		handover = qcom_q6v5_unprepare(&pas->q6v5);
> +		if (handover)
> +			qcom_pas_handover(&pas->q6v5);
> +	}
>  
>  	if (pas->smem_host_id)
>  		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
> @@ -510,6 +517,63 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  	return qcom_q6v5_panic(&pas->q6v5);
>  }
>  
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +	if (ret)
> +		goto disable_running;
> +
> +	if (unlikely(!ready_state)) {
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> +		pas->rproc->state = RPROC_OFFLINE;
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
> +
> +	if (ret) {
> +		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		goto disable_running;
> +	}
> +
> +	pas->q6v5.handover_issued = true;
> +
> +	return 0;
> +
> +disable_running:
> +	pas->q6v5.running = false;
> +
> +	return ret;
> +}
> +
>  static const struct rproc_ops qcom_pas_ops = {
>  	.unprepare = qcom_pas_unprepare,
>  	.start = qcom_pas_start,
> @@ -518,6 +582,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,
>  };
>  
>  static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -855,6 +920,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
> +	if (desc->early_boot) {
> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
> +		if (ret)
> +			dev_warn(&pdev->dev, "Falling back to firmware load\n");
> +		else
> +			pas->rproc->state = RPROC_DETACHED;
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> 
> -- 
> 2.34.1
> 


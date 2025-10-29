Return-Path: <linux-arm-msm+bounces-79410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A2C1990A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4EE440542E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F542E1F1F;
	Wed, 29 Oct 2025 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UbxMR4RC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85F32E0418
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732212; cv=none; b=HJUklyNu4g684ySBLulv2KOIlB8GH2+VOHf/rWOvh7A+Cb7XcJ7uWYGrRyHU46zwI/YxzjnIVQr4R7QtUXTF0cxQh9RdrCHrEJu0QQC41ZgdYqJkJKuSOknsIh4viXj9nT4TBCrjrNdZ+z9uGRQ7poB0ItuP/VU2xlYk9N31HSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732212; c=relaxed/simple;
	bh=UVRDOeQgKcr9b6LJu4VzYAD/JqJBw03qzojZxXH3Ihw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZ3Oq3cs90llqojIL6C5ZiRVycbKDwkk84plSPDuK/ifImyQVe0UzCUpUZu09LiBxUy1dIWmzE1bpCEaObrFx2WaiCI5K7Xlogi5QO+7LLxEn5kPs6tXJyZ3jR7snoXOnDmpugPl9yNOcm4rwwmgjU5aJuOVZxwahw5+7vuKIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UbxMR4RC; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b6d5e04e0d3so400985666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 03:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761732208; x=1762337008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cEGv0RnIftICWm/FSKpecjERqPae7dLf0QdnQJ2BYw=;
        b=UbxMR4RCngewqdBm7kTFKVbYiMyu5/4jwikGpVpZnXcFMpoO2WubKwCIqq4RmfThpq
         O0t/zcWKy/1H4nAuQjEFCRen5oA7h1geYZzsD9ROzj4VNF41Xth7x9qKUXejl0Hg4zlD
         qNNtu9owxust/zeiHlO0HMsUtf411gmZyhDnWzxTfFbD5ZhSr+1B4xN50mX18OonYeD6
         8AbLANjwhCxhAMz2amoaESJktBJGMHlbdXeEgX9hwnomdl/CDaHgflBBfpxbYNddi7qP
         b2JQGu2RS0q/n+9pQS3m1YbsG6Nf0EcGApN3ndnVp7TaVO+6jpqWezyu2Ug6XYUA1qwK
         AKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761732208; x=1762337008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cEGv0RnIftICWm/FSKpecjERqPae7dLf0QdnQJ2BYw=;
        b=R9lLqSuUJDtvF75wwni7SRlxWepu08JHK8AobHXtgrntbb8gDwGgNZyNGi2cCO+gGK
         /YHMclBVpIdK1mgB1uWLcLEZRiGZtdfS5JEgyRdUAe3AYhVtlwW5xDwL/gZP1JsmkKqA
         h3X+cC1qLErpsCoqNtOo6CygivFP8jG65gU5/fhf9kLciArNJRLHQo+CHBWpA4CKpDOB
         E9nH6kvYJhtOyjG+x4XqJFJ3ZhQm5PK5de172zKw3tkN4EKzbBm5VTMAypdYHQZjmZHG
         lb1xw2dI9u1Jlga9AlEaEe4beHzBjhPNeRurr/vywLxbx3oy3fQOLzvIZuQAPX2KWn6j
         Hjzw==
X-Forwarded-Encrypted: i=1; AJvYcCVppYXXVFLa//t/MVosgf0oMJfZGQ+olHJ3rRgbNtFKdjxIAG69sUx97EKTkjLqhkDnTEUJE+1a915zih9c@vger.kernel.org
X-Gm-Message-State: AOJu0YyvVv0IIt9zuaf2+Cp013XOoQ1zLvAFotbP0u1ONxp1GI0+nVYx
	3oVEPSGc/rLiGhN9/yBtD3hYA+vAjG9dllZjcrAUJruQjqM28z+CaDWfA2eUVfqWjOs=
X-Gm-Gg: ASbGnctO9YhwuAee7Hso6fiB92cJfaJXCIoMeD/gTyB5NcAPD/oQz6YoZKKINXPXwjs
	+I2BJj6fVmhi6BI+gb/uF50Y1MENNhaAxte26PuOWUaW8iR8OlsQgHpZbPdsr3WOdQ6YcuqAEqc
	C0Mh9pFsSAwNsKRyKDC03I3BVhIrYa5u5lRHdmnb3gbjzyqOYVVKkRzhPoIR37GU9JBr6Kglyjo
	aA3ftW743vu46IbvHQe9IZq0io4APkUJiXkTbSK43u1aJ6jYiN3Su8V5ky4dYhVKSTgykDij/om
	O0FYjdSv2wtBmSEtzFXAcinRA40DuGDvNnb0aCDmiU5x8ih8zo05kg4U2f1Z6V9IKpGNnLhqF/7
	HfIfEWYFodRa2Y59JtN4d5ZL5NBJi/iIndBPzEsT8+tLfCISCI6F0f12zTfCcVj3n50A8MngPZi
	dlY5zQKrVUsg==
X-Google-Smtp-Source: AGHT+IHFzLwaqOnyJGkhp/psGz8VH0+Q6czWdoBVT9wpWu1bvQewMlpduy1cao9apOJESZ1xcdQ4WA==
X-Received: by 2002:a17:907:d7cb:b0:b46:8bad:6981 with SMTP id a640c23a62f3a-b703d311dcemr216583666b.20.1761732207912;
        Wed, 29 Oct 2025 03:03:27 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:a2ca:bc3c:840b:5ffd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85398444sm1361336566b.35.2025.10.29.03.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:03:27 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:03:22 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
Subject: Re: [PATCH v2 4/7] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <aQHmanEiWmEac7aV@linaro.org>
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
> bootloaders. Before attaching such subsystems, it is important to
> check the state of the subsystem. This patch adds support to attach
> to a subsystem by ensuring that the subsystem is in a sane state by
> reading SMP2P bits and pinging the subsystem.
> 
> Signed-off-by: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
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
> [...]
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

dev_err()?

> +		return ret;
> +	}
> +
> +	if (ping_failed)
> +		return ping_failed;

Could just "return ping_failed;" directly.

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

return PTR_ERR(q6v5->ping_state)?

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

It would be better to have init_completion() before requesting the
interrupt, to guarantee that complete(&q6v5->ping_done); cannot happen
before the completion struct is initialized.

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

Why is this defined in the shared header rather than the C file that
uses this?

PING_TEST_WAIT looks unused.

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
> [...]
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 158bcd6cc85c..b667c11aadb5 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -35,6 +35,8 @@
>  
>  #define MAX_ASSIGN_COUNT 3
>  
> +#define EARLY_BOOT_RETRY_INTERVAL_MS 5000
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
> +	bool ready_state;
> +	bool crash_state;
> +
> +	if (!adsp->q6v5.early_boot)
> +		return -EINVAL;
> +
> +	ret = irq_get_irqchip_state(adsp->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (crash_state) {

crash_state will be uninitialized if irq_get_irqchip_state() returns an
error.

> +		dev_err(adsp->dev, "Sub system has crashed before driver probe\n");
> +		adsp->rproc->state = RPROC_CRASHED;
> +		return -EINVAL;

Ok, so the subsystem has crashed. Now what? We probably want to restart
it, but I don't think anyone will handle the RPROC_CRASHED state you are
setting here.

I think it would make more sense to call rproc_report_crash() here. This
will set RPROC_CRASHED for you and trigger recovery. I'm not sure if
this works properly in RPROC_DETACHED state, please test to make sure
that works as intended.

> +	}
> +
> +	ret = irq_get_irqchip_state(adsp->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +	if (ready_state) {
> +		dev_info(adsp->dev, "Sub system has boot-up before driver probe\n");

This message feels redundant, dmesg already shows a different message
for "attaching" vs "booting" a remoteproc.

> +		adsp->rproc->state = RPROC_DETACHED;

What is the point of this assignment? You have already set this state
inside qcom_pas_probe().

> +	} else {
> +		ret = wait_for_completion_timeout(&adsp->q6v5.subsys_booted,
> +						  msecs_to_jiffies(EARLY_BOOT_RETRY_INTERVAL_MS));
> +		if (!ret) {
> +			dev_err(adsp->dev, "Timeout on waiting for subsystem interrupt\n");
> +			return -ETIMEDOUT;
> +		}

This looks like you want to handle the case where the remoteproc is
still booting while this code is running (i.e. it has not finished
booting yet by signaling the ready state). Is this situation actually
possible with the current firmware design?

I don't see how this would reliably work in practice. If firmware boots
a remoteproc early it should wait until:

 - Handover is signaled, to ensure the proxy votes are kept
 - Ready is signaled, to ensure the metadata region remains reserved

None of this is guaranteed if the firmware gives up control to Linux
before waiting for the signals.

I would suggest dropping all the code related to handling the late
"subsys_booted" completion. If this is needed, can you explain when
exactly this situation happens and how you guarantee reliable startup of
the remoteproc?

> +	}
> +
> +	ret = qcom_q6v5_ping_subsystem(&adsp->q6v5);
> +	if (ret) {
> +		dev_err(adsp->dev, "Failed to ping subsystem, assuming device crashed\n");
> +		rproc->state = RPROC_CRASHED;
> +		return ret;
> +	}
> +
> +	adsp->q6v5.running = true;

You should probably also set q6v5->handover_issued = true;, otherwise
qcom_pas_stop() will later drop all the handover votes that you have
never made. This will break all the reference counting.

Overall, this patch feels quite fragile in the current state. Please
make sure you carefully consider all side effects and new edge cases
introduced by your changes.

Thanks,
Stephan


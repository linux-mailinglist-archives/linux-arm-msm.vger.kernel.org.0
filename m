Return-Path: <linux-arm-msm+bounces-86434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39503CDABEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 23:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A7A4302B760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 22:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1BD2D3A75;
	Tue, 23 Dec 2025 22:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jp9sk05v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50C5227EB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766528170; cv=none; b=I5MVzRtjFGSBmjQRWjR0dNQ6sQu8SscRzFRh3d/qmI3VxV+h30jsNnWGF6NJ2CfEUKCbTS0jTp1+QqBxifOq+ELgHXeMH6ams1elNcXfcQkCuOguJzgRIvGoQC9V73a/sytpQLWg4KP2OD8g6ASyQP1xCLJ6vXdLuYgfiy4p6g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766528170; c=relaxed/simple;
	bh=yzbHwEjuUh5QG9F4g4O/Qg7p+yrh30QLZ0ZwvpnIAUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rc4UG9GnoksZ9GlGEbAvzFS4RHXVaVWmcRGe5n2rvb/GhOxTfKBgjnTnrE/ufD2tbU7mDlUC3mJPtzALMPn0sIE1B0/oCTtcKND/jwB+NZQfxUGzmUj6VwA6+AlTqp6NR9kxNoDlt3sXYNtI1AmeEtTpEh1CKWpcvTk5IZ+5yxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jp9sk05v; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so5255734a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 14:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766528167; x=1767132967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5UyYhutUWgIRgYB1MC5/PxDmOAUg51biGCRnLKpp0Ys=;
        b=Jp9sk05vgYeIga/DrZdJy/LczFORJYcFwM6vmYh/9mPk0Khw95Euo4sXNRVQ2M6XeM
         KB3H7M3JQbo0jhbENex6wmW3Z+J0FJvvvDKAbYjQUB9UHSKFRGRrpHO+BabqUjM6ypj2
         /N+7nix1CMLsaKizKx3L7v2maKTAm0QoXYROALfr2ISPZOy3LHZ5icpfAiqQlbtlXtkY
         Fpm+hZV/4PpgOn55XcDp3xf7BFGX9W32ykmBb1hczp+YjKEk/tR610ci6rJXCiJdo+yp
         WtG61qomilXkBFdQPBYiDeHUtRgGS6FF67pdpMkCvGi+PUYN8xp8eSqMr1X9xGyW+cvM
         BPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766528167; x=1767132967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UyYhutUWgIRgYB1MC5/PxDmOAUg51biGCRnLKpp0Ys=;
        b=RvmOj5F13zjPrFvxl4YvBSU1yrL1oMqyTsyyodcPnCyWlDG+o/ha2pB3fBf5ZyJfUA
         VUNKCQnTuWLZzsPOKtLo7fn2SKoeut8m50bZZQXdHW+TQ2IhLbovOI7fdjiIv5r/lduK
         A8025wz1Y4+sUg0PoEpVq35vFKRM5IsX+dfMDWAHU2gw4KxkgGlq1HifJZykq2l2IB2A
         wPvOJH3uOZObz1gI8DRXNPYbetmkGXKTWNw9yn2lQLcvGAzd1/GKiAqSF8K6189mcrqj
         uV5xcI5H+ooLkIe1RGrPKpMJ1Zuskm7KkDHvemfkuJRgV24EA7z1efhlLr4N8ijtrZR/
         udFg==
X-Forwarded-Encrypted: i=1; AJvYcCUlBpKcTnpZkCbS+pw/f8ndrtDAR45QNkutge/ZMDKshHFwsEcekeCm8hmw/cXoOf8VmdpJolCf5NT50QTs@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjeZk8pvLt3+Lkrmes46qIzfhmCfwOUl321Li9rf+H7Ge9aYY
	NCnRs0eM2Qj8ve8Yd/kZd7hoEUo7gxrkvxOosM32P3KuAoDi/xcTo1rbwlTlkceEDiU=
X-Gm-Gg: AY/fxX4cImNO0RpCrxNHr/ngJEJwReUtNecTzLbOBBsG56OriaXn1klnzingK8X/rOX
	o0WAYsOybeYuTIIRDxfz6/ZfzAzPooIbqiAgmGCb5MPJOI2jF72902fWWHlvvx7dUO/UURo7gcf
	Z7FQPlBPMiWP3l7/obfJDjc6mfBW+0ra0KocOuFWR+po57jdy3/OKTPU7QLo9y2Pb+/CxVKEATp
	8sK25jdekHkDPU/GLGKAa1PUw/ZcKTezux4nzIqkct9LX0QHHwgyyxo9NsEoyR4hB+NXbfrUqKK
	9XUOCug/Rp8qoKOBjYTFM3oDcNy3LIiTiDYlJ9qXNtlKxBTGD0HY0SBXSlbKmgcpQGycNNAYc/q
	1WMcIc5ZkqwpemJpfPNsBWcqFIquws53Dydv38gtRaX5r3VhMKtniMzqDjrRAxQQDZg776KRA1z
	eOwygqOwakKdhsyFgY
X-Google-Smtp-Source: AGHT+IGq+sIPac4pUDc5c2NSoUMS1PyA5G2WwEI/2p2f6em7Z3AmU60xOTfzeGCKspp1fvzaaAIBYw==
X-Received: by 2002:a17:907:6ea4:b0:b80:f2e:6e1 with SMTP id a640c23a62f3a-b803722a7demr1668448866b.43.1766528167036;
        Tue, 23 Dec 2025 14:16:07 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm1556445466b.64.2025.12.23.14.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 14:16:06 -0800 (PST)
Date: Tue, 23 Dec 2025 23:15:33 +0100
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
	Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <aUsUhX8Km275qonq@linaro.org>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 01:13:50AM -0800, Jingyi Wang wrote:
> From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> 
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits and performing ping
> test.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the
> subsystem is ready either at the first check or within a 5-second timeout
> and the ping is successful, it will be marked as "attached". The ready
> state could be set by either ready interrupt or handover interrupt.
> 
> If "early_boot" is set by kernel but "subsys_booted" is not completed
> within the timeout, It could be the early boot feature is not supported
> by other entities. In this case, the state will be marked as RPROC_OFFLINE
> so that the PAS driver can load the firmware and start the remoteproc. As
> the running state is set once attach function is called, the watchdog or
> fatal interrupt received can be handled correctly.
> 
> Signed-off-by: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c      | 87 ++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5.h      | 11 ++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 97 ++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5_wcss.c |  2 +-
>  6 files changed, 195 insertions(+), 6 deletions(-)
> 
> [...]
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 52680ac99589..7e890e18dd82 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> [...]
> @@ -434,6 +440,85 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
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
> +		dev_err(pas->dev, "Sub system has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);

Have you tested this case? From quick review of the code in
remoteproc_core.c I'm skeptical if this will work correctly:

 1. Remoteproc is in RPROC_DETACHED state during auto boot
 2. qcom_pas_attach() runs and calls rproc_report_crash(), then fails so
    RPROC_DETACHED state remains
 3. rproc_crash_handler_work() sets RPROC_CRASHED and starts recovery
 4. rproc_boot_recovery() calls rproc_stop()
 5. rproc_stop() calls rproc_stop_subdevices(), but because the
    remoteproc was never attached, the subdevices were never started.

In this situation, rproc_stop_subdevices() should not be called. I would
expect you will need to make some minor changes to the remoteproc_core
to support handling crashes during RPROC_DETACHED state.

I might be reading the code wrong, but please make sure that you
simulate this case at runtime and check that it works correctly.

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
> +	enable_irq(pas->q6v5.handover_irq);
> +
> +	if (unlikely(!ready_state)) {
> +		/* Set a 5 seconds timeout in case the early boot is delayed */
> +		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
> +						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
> +

Again, have you tested this case?

As I already wrote in v2, I don't see how this case will work reliably
in practice. How do you ensure that the handover resources will be kept
on during the Linux boot process until the remoteproc has completed
booting?

Also, above you enable the handover_irq. Let's assume a handover IRQ
does come in while you are waiting here. Then q6v5_handover_interrupt()
will call q6v5->handover(q6v5); to disable the handover resources
(clocks, power domains), but you never enabled those. I would expect
that you get some bad reference count warnings in the kernel log.

I would still suggest dropping this code entirely. As far as I
understand the response from Aiqun(Maria) Yu [1], there is no real use
case for this on current platforms. If you want to keep this, you would
need to vote for the handover resources during probe() (and perhaps
more, this case is quite tricky).

Please test all your changes carefully in v4.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/c15f083d-a2c1-462a-aad4-a72b36fbe1ac@oss.qualcomm.com/


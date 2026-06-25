Return-Path: <linux-arm-msm+bounces-114497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5QnsHKP9PGrFvQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:06:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE036C47AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:06:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=T3O+SePl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114497-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114497-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1FC33014BD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD85C3CEBB1;
	Thu, 25 Jun 2026 10:06:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757BC3CF05E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:06:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381973; cv=none; b=UR5pd/n+MkbhMXt09mWxtsGMglfoyN0zkMv/RqjipifTwerw2C+Q+mHpUYt1a9321QDmzjL7ND2bljZpkmD65xxk3LmJLGZfL7vZAbe42vWOfAfbCSboj3w+4s2kekzwPv3bcuGPPmdYzzKL41bZLz5voBwyjwx8QPNAHjNWrak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381973; c=relaxed/simple;
	bh=3gItwumcVebYiZDuLDV00e4sP/vE+Y6uXcOL0xEpEU8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUXZB2s9jKqjg7bfD3K8iZmydcXuUYdoBT7Ghmz9PK+qR24LfDEi1RUyxORt5WPVY3cQmQOzzO+y+UR9ceUwIrYud+gQ6dfW0U2uzP1e3ANO1Q9VdEgTdMw4b3eCTMfDBnSWiaPfOvU1E5TXnglgtc0F8VF47scbQEAJIIyuYRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3O+SePl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB701F000E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782381971;
	bh=B2fQu9a/v1zAxluxfufb1xViPasErLpgh2IzZZiO3Ak=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=T3O+SePlFv3FlEeSDMzRKwUL4xnTYELLJEJKl423Cr9TjjKm009yD8zFmKf37nRv0
	 5TnXkOhAkIsBkgbPecHl+aNqDMXAqVsNU2lj7Lm3q+Nrk6zK3K39QnqU7cDFVxxEQZ
	 zJK75YOEXltJT8I9cv/LvWc3WZQdEIT6Tk7Lw8p0hhm3UR9aCDrBW0rmLcLcqBKKRE
	 cY7GloeRjoHYkuBOn9argDXwKNDTPU/2XYqBBfltgLn5DXPykhnLMtooRupDV+snh6
	 7jjsa2xPe4nOxo9eNAKLY6YfXaAu5dkfjjOPc11QacTKiHSapAmqfO8HPVfpoREQ1G
	 Hcp4lGImtDJnA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3965adfd75fso17582241fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:06:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YxC50qcsd0gFg7S6FfzRDiKC+z3ypdCAccJCyKpLyVBkYSAdLSv
	o/+1BG8alUb68a6kO755FMYm3mLXSu7Gpj0e1TJ7OU1cO3lG328OSdpuPuAuu5hC88hfqLiVpTN
	NUdHBaUl1nYkP83f1t8h64jDfWh1ugUAdpE4rKQGX3Q==
X-Received: by 2002:a05:651c:1a0f:b0:393:8ad4:4bc0 with SMTP id
 38308e7fff4ca-39acb6b9721mr4329001fa.21.1782381969499; Thu, 25 Jun 2026
 03:06:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jun 2026 03:06:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Jun 2026 03:06:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 03:06:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeBi1osB24xTLOjuBYKfrb3a+OCcW5XSkcDkUavU+x63g@mail.gmail.com>
X-Gm-Features: AVVi8CcFNTTRvNc5XdrzOI0ZImJP3BTUTxBJrMgB9mzDN8f4-hSFFmh3wHY0YkE
Message-ID: <CAMRc=MeBi1osB24xTLOjuBYKfrb3a+OCcW5XSkcDkUavU+x63g@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: Fix resource cleanup on probe failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Andrew Halaney <ahalaney@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114497-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBE036C47AA

On Thu, 25 Jun 2026 11:36:44 +0200, Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> said:
> qcom_scm_probe() acquires two non-devres resources that are never
> released if probe fails or defers after them. of_reserved_mem_device_init()
> adds an entry to a global list with no devres counterpart, so a retry
> would add a duplicate entry and leak the original. qcom_tzmem_enable()
> sets a static qcom_tzmem_dev pointer and may set qcom_tzmem_using_shm_bridge;
> without cleanup a probe retry finds qcom_tzmem_dev already set and
> returns -EBUSY, permanently preventing the driver from probing.
>
> Introduce err_tzmem and err_rmem goto labels at the end of probe to
> call qcom_tzmem_disable() and of_reserved_mem_device_release() in the
> right order, route all subsequent error paths through them, and add
> qcom_tzmem_disable() to qcom_tzmem.c to clear the static state.
>
> Fixes: a33b2579c8d3 ("firmware: qcom: scm: add support for SHM bridge memory carveout")
> Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Hi!

These are two separate issues, I think you should split the change into two
patches.

> This is reported on sasiko review as existing issue here
>  https://lore.kernel.org/all/20260624192213.C82691F000E9@smtp.kernel.org/
> and it can go independently.
>
>  drivers/firmware/qcom/qcom_scm.c   | 42 +++++++++++++++++++++---------
>  drivers/firmware/qcom/qcom_tzmem.c |  7 +++++
>  drivers/firmware/qcom/qcom_tzmem.h |  1 +
>  3 files changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index ba5cdeed8a04..cb3d776fa645 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2883,9 +2883,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  				     "Failed to setup the reserved memory region for TZ mem\n");
>
>  	ret = qcom_tzmem_enable(scm->dev);
> -	if (ret)
> -		return dev_err_probe(scm->dev, ret,
> -				     "Failed to enable the TrustZone memory allocator\n");
> +	if (ret) {
> +		ret = dev_err_probe(scm->dev, ret,
> +				    "Failed to enable the TrustZone memory allocator\n");
> +		goto err_rmem;
> +	}
>
>  	memset(&pool_config, 0, sizeof(pool_config));
>  	pool_config.initial_size = 0;
> @@ -2893,16 +2895,20 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	pool_config.max_size = SZ_256K;
>
>  	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
> -	if (IS_ERR(scm->mempool))
> -		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
> -				     "Failed to create the SCM memory pool\n");
> +	if (IS_ERR(scm->mempool)) {
> +		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
> +				    "Failed to create the SCM memory pool\n");
> +		goto err_tzmem;
> +	}
>
>  	ret = qcom_scm_query_waitq_count(scm);
>  	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
>  	scm->waitq_comps = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq_comps),
>  					GFP_KERNEL);
> -	if (!scm->waitq_comps)
> -		return -ENOMEM;
> +	if (!scm->waitq_comps) {
> +		ret = -ENOMEM;
> +		goto err_tzmem;
> +	}
>
>  	for (i = 0; i < scm->wq_cnt; i++)
>  		init_completion(&scm->waitq_comps[i]);
> @@ -2912,14 +2918,18 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  		irq = platform_get_irq_optional(pdev, 0);
>
>  	if (irq < 0) {
> -		if (irq != -ENXIO)
> -			return irq;
> +		if (irq != -ENXIO) {
> +			ret = irq;
> +			goto err_tzmem;
> +		}
>  	} else {
>  		ret = devm_request_threaded_irq(scm->dev, irq, NULL, qcom_scm_irq_handler,
>  						IRQF_ONESHOT, "qcom-scm", scm);
> -		if (ret < 0)
> -			return dev_err_probe(scm->dev, ret,
> -					     "Failed to request qcom-scm irq\n");
> +		if (ret < 0) {
> +			ret = dev_err_probe(scm->dev, ret,
> +					    "Failed to request qcom-scm irq\n");
> +			goto err_tzmem;
> +		}
>  	}
>
>  	/*
> @@ -2966,6 +2976,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	qcom_scm_gunyah_wdt_init(scm);
>
>  	return 0;
> +
> +err_tzmem:
> +	qcom_tzmem_disable(scm->dev);
> +err_rmem:
> +	of_reserved_mem_device_release(scm->dev);
> +	return ret;
>  }
>
>  static void qcom_scm_shutdown(struct platform_device *pdev)
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 0635cbeacfc8..3f2b782f4a94 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -518,6 +518,13 @@ int qcom_tzmem_enable(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
>
> +void qcom_tzmem_disable(struct device *dev)
> +{
> +	qcom_tzmem_using_shm_bridge = false;
> +	qcom_tzmem_dev = NULL;
> +}
> +EXPORT_SYMBOL_GPL(qcom_tzmem_disable);

That being said, I think we should just modify qcom_tzmem_enable() to silently
ignore subsequent calls. It's meant to be called once and stay enabled so I
suggest just removing the check returning -EBUSY.

Bart

> +
>  MODULE_DESCRIPTION("TrustZone memory allocator for Qualcomm firmware drivers");
>  MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/firmware/qcom/qcom_tzmem.h b/drivers/firmware/qcom/qcom_tzmem.h
> index 8fa8a3eb940e..0b0f26d4e22e 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.h
> +++ b/drivers/firmware/qcom/qcom_tzmem.h
> @@ -9,5 +9,6 @@
>  struct device;
>
>  int qcom_tzmem_enable(struct device *dev);
> +void qcom_tzmem_disable(struct device *dev);
>
>  #endif /* __QCOM_TZMEM_PRIV_H */
> --
> 2.53.0
>
>


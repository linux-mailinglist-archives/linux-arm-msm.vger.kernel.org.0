Return-Path: <linux-arm-msm+bounces-30810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4396C9D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 23:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB8F01F282ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835A3156F42;
	Wed,  4 Sep 2024 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ska2CK/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98782863;
	Wed,  4 Sep 2024 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486894; cv=none; b=OatadehvficW8BvzQo7/IW7MifxmNeDCb6siJYgHUzgDcmHj9NhernjQH6bz3FPxkWxb9Zn1W4L5rI5G572Aa3bIL9kjbJxuOb0S9Vydq3ijP2c1a0Xinzh+z+nzlDVYeHnuLM0x2KsHhU7+AtuF7IxpTM7mdeP7XqoTOFRHeLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486894; c=relaxed/simple;
	bh=VxPe27RSd26fm9OuwbdXrxO+eIcIyrprtpUvZvG9iq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpYF1gMMOIHwsv9N+Dza8zkPhwvF/AIw2oTGddrXvczR0ZK41ivGYz7yQmtO2SNt+5iN4dYqfc8MkCvqJ6mpnaUAuxKDHERu4lnhFkdmXl5G2VSHJu2ESiz/lRG68KMlkXLMTCeVMlVL3qmA4Oj1cFMZQ9FDH97woip8s2fIsZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ska2CK/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55615C4CEC2;
	Wed,  4 Sep 2024 21:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725486893;
	bh=VxPe27RSd26fm9OuwbdXrxO+eIcIyrprtpUvZvG9iq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ska2CK/ZQe+VyglKVGF1mW6767oOoifcveyKygOW+UYKF36tSTEXiKwZxLUmaQeAe
	 KyzpTne4BcDkcvqoAOMTtxp4qTakBJOmUa7wyMq2fFmlBV+coS6PsHQo5/lsOFRMJU
	 8+6GovFtO8r0qsbqpXt9SwTYwzTWxDjj/5xAQ6DSSaruV4EGJYFerl5ZkvBmyytGiX
	 VWhZ55JybXH0QEz9/wIrpfrfXgGCYHNzMomdWIRTeK3mRk8yclpUdfvuKpBgVGwtCk
	 kOYB89GtOYIntmq/TtXt6r19wtONuFlJoZZGSxHfXZ+tYZgeQ0UNRpHtYLy6z0i7Ml
	 Q8YRDexyIVK5Q==
Date: Wed, 4 Sep 2024 16:54:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v2 2/2] firmware: qcom_scm: Support multiple waitq
 contexts
Message-ID: <q4tb7muqjef2hc2laodybghxesriaq5oxca45xmaqpxv3xnmav@eolhk75eolkt>
References: <cover.1724968351.git.quic_uchalich@quicinc.com>
 <b736ba58b4a4164f7232de7e075102cd2818b1e7.1724968351.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b736ba58b4a4164f7232de7e075102cd2818b1e7.1724968351.git.quic_uchalich@quicinc.com>

On Thu, Aug 29, 2024 at 03:15:55PM GMT, Unnathi Chalicheemala wrote:
> Currently, only a single waitqueue context exists, with waitqueue id zero.
> Multi-waitqueue mechanism is added in firmware to support the case when
> multiple VMs make SMC calls or single VM making multiple calls on same CPU.
> 
> When VMs make SMC call, firmware will allocate waitqueue context assuming
> the SMC call to be a blocking call. SMC calls that cannot acquire resources
> are returned to sleep in the calling VM. When resource is available, VM
> will be notified to wake sleeping thread and resume SMC call.
> SM8650 firmware can allocate two such waitq contexts so create these two
> waitqueue contexts.
> 
> Unique waitqueue contexts are supported by a dynamically sized array where
> each unique wq_ctx is associated with a struct completion variable for easy
> lookup. To get the number of waitqueue contexts directly from firmware,
> qcom_scm_query_waitq_cnt() is introduced. On older targets which support
> only a single waitqueue, wq_cnt is set to 1 as SCM call for
> query_waitq_cnt() is not implemented for single waitqueue case.
> 
> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 82 +++++++++++++++++++++++---------
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index ed51fbb1c065..b2c5505de681 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -44,12 +44,13 @@ static bool download_mode = IS_ENABLED(CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT);
>  module_param(download_mode, bool, 0);
>  
>  struct qcom_scm {
> +	int wq_cnt;

Does it make sense for this to be negative? Please make it unsigned.

Also, might not be the most significant member of this struct, so
perhaps you can move it further down?

>  	struct device *dev;
>  	struct clk *core_clk;
>  	struct clk *iface_clk;
>  	struct clk *bus_clk;
>  	struct icc_path *path;
> -	struct completion waitq_comp;
> +	struct completion *waitq;
>  	struct reset_controller_dev reset;
>  
>  	/* control access to the interconnect path */
> @@ -1850,6 +1851,31 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
>  	return 0;
>  }
>  
> +static int qcom_scm_query_waitq_count(void)
> +{
> +	bool avail;
> +	int count;
> +	int ret;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct qcom_scm_res res;
> +
> +	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO);
> +	if (!avail) {
> +		count = 1;
> +		return count;

count is a local variable, so just return count; and drop the {} please.


Perhaps even drop the local boolean variable:

	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO))
		return 1;

> +	}
> +
> +	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
> +	if (ret)

(Keep this local variable, as that's in line with the style...)

> +		return ret;
> +	count = res.result[0] & 0xff;
> +	return count;

Again, return res.result[0] & 0xff; should be sufficient, no need for a
local variable immediately followed by a return statement.

> +}
> +
>  static int qcom_scm_get_waitq_irq(void)
>  {
>  	int ret;
> @@ -1876,42 +1902,40 @@ static int qcom_scm_get_waitq_irq(void)
>  	return ret;
>  }
>  
> -static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
> +static struct completion *qcom_scm_get_completion(u32 wq_ctx)
>  {
> -	/* FW currently only supports a single wq_ctx (zero).
> -	 * TODO: Update this logic to include dynamic allocation and lookup of
> -	 * completion structs when FW supports more wq_ctx values.
> -	 */
> -	if (wq_ctx != 0) {
> -		dev_err(__scm->dev, "Firmware unexpectedly passed non-zero wq_ctx\n");
> -		return -EINVAL;
> -	}
> +	struct completion *wq;
>  
> -	return 0;
> +	if (wq_ctx >= __scm->wq_cnt)

I'm guessing that we're not expecting to ever hit this, but if we do, we
will fail a qcom_scm_call() or qcom_scm_call_atomic() call, giving
someone down the road a bad week of debugging...

How about wrapping the conditional in a WARN_ON_ONCE()?

> +		return ERR_PTR(-EINVAL);
> +
> +	wq = &__scm->waitq[wq_ctx];
> +
> +	return wq;
>  }
>  
>  int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
>  {
> -	int ret;
> +	struct completion *wq;
>  
> -	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
> -	if (ret)
> -		return ret;
> +	wq = qcom_scm_get_completion(wq_ctx);
> +	if (IS_ERR(wq))
> +		return PTR_ERR(wq);
>  
> -	wait_for_completion(&__scm->waitq_comp);
> +	wait_for_completion(wq);
>  
>  	return 0;
>  }
>  
>  static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
>  {
> -	int ret;
> +	struct completion *wq;
>  
> -	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
> -	if (ret)
> -		return ret;
> +	wq = qcom_scm_get_completion(wq_ctx);
> +	if (IS_ERR(wq))
> +		return PTR_ERR(wq);
>  
> -	complete(&__scm->waitq_comp);
> +	complete(wq);
>  
>  	return 0;
>  }
> @@ -1948,6 +1972,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	struct qcom_tzmem_pool_config pool_config;
>  	struct qcom_scm *scm;
>  	int irq, ret;
> +	int i;
>  
>  	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
>  	if (!scm)
> @@ -1958,7 +1983,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	init_completion(&scm->waitq_comp);
>  	mutex_init(&scm->scm_bw_lock);
>  
>  	scm->path = devm_of_icc_get(&pdev->dev, NULL);
> @@ -1993,6 +2017,20 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	/* Let all above stores be available after this */
>  	smp_store_release(&__scm, scm);

Should have spotted this earlier... But if any code below this point
takes an error path (i.e. we return non-0 from hereon) devres will free
__scm and anyone calling the qcom_scm API will hit a use-after-free.

Add to that it doesn't seem like a good idea to have
qcom_scm_is_available() return true until we have setup the wait queue
count or setup tzmem at least.

>  
> +	platform_set_drvdata(pdev, scm);

I believe this is a leftover from previous versions of this patch?

Regards,
Bjorn

> +	ret = qcom_scm_query_waitq_count();
> +	if (ret < 0)
> +		return ret;
> +
> +	scm->wq_cnt = ret;
> +
> +	scm->waitq = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq), GFP_KERNEL);
> +	if (!scm->waitq)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < scm->wq_cnt; i++)
> +		init_completion(&scm->waitq[i]);
> +
>  	irq = qcom_scm_get_waitq_irq();
>  	if (irq < 0) {
>  		if (irq != -ENXIO)
> -- 
> 2.34.1
> 


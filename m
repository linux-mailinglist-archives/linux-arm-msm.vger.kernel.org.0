Return-Path: <linux-arm-msm+bounces-46993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C92A29EFC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 03:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0507D3A6D5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 02:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE3E13B5B6;
	Thu,  6 Feb 2025 02:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlKKBkfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE03C13AD18;
	Thu,  6 Feb 2025 02:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810498; cv=none; b=qIIer0VqLa5/XgWgZVDGj9MvxDeKBG7W8gt5+6uDBlmEQn6gHdCs+KNs+xRQEct48d91ezhpAZNCKj0UxL5Q5eZFUym7evMwPszI7TBgsOiDIIPzmDSZpsWgXUAJGoi+z1fa0dFAK4QaBzhBBS/mMfxFAFUNPXNzXEu8BG0wwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810498; c=relaxed/simple;
	bh=cuh23/guRoIQwP/CHmkEvoRkDVmV3WnIEIa0dzmdwUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWTf09p2q2kO4HowkV6r+4psqA+ePzoXb15fnCLNDHvpwxvmJxTpBlr7zoylghTFM1xLMdH3AuHSLsrWIybS63ERAgDkfFzvz0YZwKR9kwL/kvXZmRAbs+jFlczgYr5AiaX4jcPO4IBD780z4RM8YuNK3jM8FxLuQOXbdVfwC9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlKKBkfT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D14CC4CED1;
	Thu,  6 Feb 2025 02:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738810498;
	bh=cuh23/guRoIQwP/CHmkEvoRkDVmV3WnIEIa0dzmdwUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlKKBkfTGx3Fn0IbDHUyaN4fArX/tyiUHwKQZz3b78jJ8TUS8K2LEBCOdaQYfAFLK
	 gv0Cxf/nYR1kfDKzl4Y11b+YngVUi+iuqYQLZzxgNgXNJ4YIsxGjh8Fhjk9Jsnc9gK
	 Up7G7+VW3cxVjDcXUfxw+3AzFgUG82r4KdXSVgSRXPjrAi9twIs4B3CAQ5O4hYcZTS
	 JUk4fitEAxHoQ8rkmmrrpquDq2QCM3teo9LvBr3DGqwYz8/D3xBxIwAmLI1e3MjY87
	 pXQkyvZ0rx727utPnrUIAeeF8oJwP9phKJkGljMLw3fnQHjwhLAX9tKYLSgIOLHwLL
	 OJdgt/AB+D5Jg==
Date: Wed, 5 Feb 2025 20:54:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Chris Lew <quic_clew@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	Joel Selvaraj <joelselvaraj.oss@gmail.com>, Alexey Minnekhanov <alexeymin@postmarketos.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
Message-ID: <2vfwtuiorefq64ood4k7y7ukt34ubdomyezfebkeu2wu5omvkb@c5h2sbqs47ya>
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>

On Wed, Feb 05, 2025 at 10:57:11PM +0100, Frank Oltmanns wrote:
> On xiaomi-beryllium and oneplus-enchilada audio does not work reliably
> with the in-kernel pd-mapper. Deferring the probe solves these issues.
> Specifically, audio only works reliably with the in-kernel pd-mapper, if
> the probe succeeds when remoteproc3 triggers the first successful probe.
> I.e., probes from remoteproc0, 1, and 2 need to be deferred until
> remoteproc3 has been probed.
> 
> Introduce a device specific quirk that lists the first auxdev for which
> the probe must be executed. Until then, defer probes from other auxdevs.
> 
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
> The in-kernel pd-mapper has been causing audio issues on sdm845
> devices (specifically, xiaomi-beryllium and oneplus-enchilada). I
> observed that Stephan’s approach [1] - which defers module probing by
> blocklisting the module and triggering a later probe - works reliably.
> 
> Inspired by this, I experimented with delaying the probe within the
> module itself by returning -EPROBE_DEFER in qcom_pdm_probe() until a
> certain time (13.9 seconds after boot, based on ktime_get()) had
> elapsed. This method also restored audio functionality.
> 
> Further logging of auxdev->id in qcom_pdm_probe() led to an interesting
> discovery: audio only works reliably with the in-kernel pd-mapper when
> the first successful probe is triggered by remoteproc3. In other words,
> probes from remoteproc0, 1, and 2 must be deferred until remoteproc3 has
> been probed.
> 

The remoteproc numbering is assigned at the time of registering each
remoteproc driver, and does not necessarily relate to the order in which
they are launched. That said, it sounds like what you're saying is that
is that audio only works if we launch the pd-mapper after the
remoteprocs has started?

Can you please confirm which remoteproc is which in your numbering? (In
particular, which remoteproc instance is the audio DSP?)

> To address this, I propose introducing a quirk table (which currently
> only contains sdm845) to defer probing until the correct auxiliary
> device (remoteproc3) initiates the probe.
> 
> I look forward to your feedback.
> 

I don't think the proposed workaround is our path forward, but I very
much appreciate your initiative and the insights it provides! Seems to
me that we have a race-condition in the pdr helper.

Regards,
Bjorn

> Thanks,
>   Frank
> 
> [1]: https://lore.kernel.org/linux-arm-msm/Zwj3jDhc9fRoCCn6@linaro.org/
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 43 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 154ca5beb47160cc404a46a27840818fe3187420..34b26df665a888ac4872f56e948e73b561ae3b6b 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -46,6 +46,11 @@ struct qcom_pdm_data {
>  	struct list_head services;
>  };
>  
> +struct qcom_pdm_probe_first_dev_quirk {
> +	const char *name;
> +	u32 id;
> +};
> +
>  static DEFINE_MUTEX(qcom_pdm_mutex); /* protects __qcom_pdm_data */
>  static struct qcom_pdm_data *__qcom_pdm_data;
>  
> @@ -526,6 +531,11 @@ static const struct qcom_pdm_domain_data *x1e80100_domains[] = {
>  	NULL,
>  };
>  
> +static const struct qcom_pdm_probe_first_dev_quirk first_dev_remoteproc3 = {
> +	.id = 3,
> +	.name = "pd-mapper"
> +};
> +
>  static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8016", .data = NULL, },
>  	{ .compatible = "qcom,apq8064", .data = NULL, },
> @@ -566,6 +576,10 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{},
>  };
>  
> +static const struct of_device_id qcom_pdm_defer[] __maybe_unused = {
> +	{ .compatible = "qcom,sdm845", .data = &first_dev_remoteproc3, },
> +	{},
> +};
>  static void qcom_pdm_stop(struct qcom_pdm_data *data)
>  {
>  	qcom_pdm_free_domains(data);
> @@ -637,6 +651,25 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
>  	return ERR_PTR(ret);
>  }
>  
> +static bool qcom_pdm_ready(struct auxiliary_device *auxdev)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *root;
> +	struct qcom_pdm_probe_first_dev_quirk *first_dev;
> +
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return true;
> +
> +	match = of_match_node(qcom_pdm_defer, root);
> +	of_node_put(root);
> +	if (!match)
> +		return true;
> +
> +	first_dev = (struct qcom_pdm_probe_first_dev_quirk *) match->data;
> +	return (auxdev->id == first_dev->id) && !strcmp(auxdev->name, first_dev->name);
> +}
> +
>  static int qcom_pdm_probe(struct auxiliary_device *auxdev,
>  			  const struct auxiliary_device_id *id)
>  
> @@ -647,6 +680,15 @@ static int qcom_pdm_probe(struct auxiliary_device *auxdev,
>  	mutex_lock(&qcom_pdm_mutex);
>  
>  	if (!__qcom_pdm_data) {
> +		if (!qcom_pdm_ready(auxdev)) {
> +			pr_debug("%s: Deferring probe for device %s (id: %u)\n",
> +				__func__, auxdev->name, auxdev->id);
> +			ret = -EPROBE_DEFER;
> +			goto probe_stop;
> +		}
> +		pr_debug("%s: Probing for device %s (id: %u), starting pdm\n",
> +			__func__, auxdev->name, auxdev->id);
> +
>  		data = qcom_pdm_start();
>  
>  		if (IS_ERR(data))
> @@ -659,6 +701,7 @@ static int qcom_pdm_probe(struct auxiliary_device *auxdev,
>  
>  	auxiliary_set_drvdata(auxdev, __qcom_pdm_data);
>  
> +probe_stop:
>  	mutex_unlock(&qcom_pdm_mutex);
>  
>  	return ret;
> 
> ---
> base-commit: 7f048b202333b967782a98aa21bb3354dc379bbf
> change-id: 20250205-qcom_pdm_defer-3dc1271d74d9
> 
> Best regards,
> -- 
> Frank Oltmanns <frank@oltmanns.dev>
> 


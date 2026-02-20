Return-Path: <linux-arm-msm+bounces-93537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBBDF8/wmGl1OQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 00:39:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B953016B6B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 00:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF92D3032F75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 23:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2DE31282A;
	Fri, 20 Feb 2026 23:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z99cy/Vg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4892D6407;
	Fri, 20 Feb 2026 23:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771630795; cv=none; b=SY77RMqM7IqP3GVXbdeDMa/kKVj/4pQmZ9UpRvPyLP+ESOhsHZLnBTbdVFBKl1ykbi3qYPX84sH9wrCL2S7Pj/CvlSCgsnwImucL/4gKuy7xdH9BxywB3fhhueOd8qMzjdnljNwvsMrOZLn27pwOdCFSWrUIqHdHF1vWMZyowZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771630795; c=relaxed/simple;
	bh=azZwRItiqBuEwOJjXEmInSNN6hMAbyaoUqAhQdkhtME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVmibP6khtg9Gaf0capsr7DEzPRB8uFo0EtR9jRVAUaVX5708bcwJU/pUkOaFf0OsmqHo8DhTFMzkPN0ZQ9y7x3svWnGUcIhCWglGUs91DXK4dA/pAQn/cVxVnUit/1gdb3QuKP7WbvTFHWw6lmnSwaM4fkn2+89HQ767KnujHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z99cy/Vg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A59C116C6;
	Fri, 20 Feb 2026 23:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771630794;
	bh=azZwRItiqBuEwOJjXEmInSNN6hMAbyaoUqAhQdkhtME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z99cy/Vgl53gCB1sjIvn22NqPUXOjaKDb8AcyYiytn/X7CbsFdT847O7QxVlP/tMg
	 d2Tckw7O8t2j5guSq5nQdoxjNsB+cZSbd01+7O73E93MWlXt++K3B7z4JVZKsCfOKx
	 A19qXscYC2M0oqgvfqxEhbavxfllhktm0kOo2GaUmRzkxTJNEMzMdYabBSq4HhAeHc
	 zZs61AmrATpSJTklSes5+1xmwa9gT+UmDqkOKlDD+ec3WnIbFuq4q6J8qY4MJoZouj
	 HMyLaEN5MeZaKBp91welW6ZkUy/C70dTDE/OMby4AS/cJQGgE4CCoiROBlaEimuWcA
	 AvQoA3Dyfsa3g==
Date: Fri, 20 Feb 2026 17:39:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: quic_utiwari@quicinc.com
Cc: konrad.dybcio@oss.qualcomm.com, herbert@gondor.apana.org.au, 
	thara.gopinath@gmail.com, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, quic_neersoni@quicinc.com
Subject: Re: [PATCH v7] crypto: qce - Add runtime PM and interconnect
 bandwidth scaling support
Message-ID: <gtqvktl4wmtetth7qz3zl4osnd4yebhjwjxw6nroelzflk55u2@xmamdznupxfa>
References: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220072818.2921517-1-quic_utiwari@quicinc.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gondor.apana.org.au,gmail.com,davemloft.net,vger.kernel.org,quicinc.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93537-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:url,quicinc.com:email]
X-Rspamd-Queue-Id: B953016B6B2
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 12:58:18PM +0530, quic_utiwari@quicinc.com wrote:
> From: Udit Tiwari <quic_utiwari@quicinc.com>
> 
> The Qualcomm Crypto Engine (QCE) driver currently lacks support for
> runtime power management (PM) and interconnect bandwidth control.
> As a result, the hardware remains fully powered and clocks stay
> enabled even when the device is idle. Additionally, static
> interconnect bandwidth votes are held indefinitely, preventing the
> system from reclaiming unused bandwidth.
> 
> Address this by enabling runtime PM and dynamic interconnect
> bandwidth scaling to allow the system to suspend the device when idle
> and scale interconnect usage based on actual demand. Improve overall
> system efficiency by reducing power usage and optimizing interconnect
> resource allocation.
> 
> Make the following changes as part of this integration:

"this integration" is internal lingo. In fact I think you can omit this
whole paragraph, because the bullets here are expected.

> 
> - Add support for pm_runtime APIs to manage device power state
>   transitions.
> - Implement runtime_suspend() and runtime_resume() callbacks to gate
>   clocks and vote for interconnect bandwidth only when needed.
> - Replace devm_clk_get_optional_enabled() with devm_pm_clk_create() +
>   pm_clk_add() and let the PM core manage device clocks during runtime
>   PM and system sleep.
> - Register dev_pm_ops with the platform driver to hook into the PM
>   framework.
> 
> Tested:

This isn't very useful to carry in the git history, please move this
down below '---'.

> 
> - Verify that ICC votes drop to zero after probe and upon request
>   completion.
> - Confirm that runtime PM usage count increments during active
>   requests and decrements afterward.
> - Observe that the device correctly enters the suspended state when
>   idle.
> 
> Signed-off-by: Udit Tiwari <quic_utiwari@quicinc.com>

Please switch to oss.qualcomm.com 

> ---
> Changes in v7:
> - Use ACQUIRE guard in probe to simplify runtime PM management and error paths.
> - Drop redundant icc_enable() call in runtime resume path.
> - Explicitly call pm_clk_suspend(dev) and pm_clk_resume(dev) within the 
>   custom runtime PM callbacks. Since custom callbacks are provided to handle 
>   interconnect scaling, the standard PM clock helpers must be invoked manually 
>   to ensure clocks are gated/ungated.
> 
> Changes in v6:
> - Adopt ACQUIRE(pm_runtime_active_try, ...) for scoped runtime PM management
>   in qce_handle_queue(). This removes the need for manual put calls and
>   goto labels in the error paths, as suggested by Konrad.
> - Link to v6: https://lore.kernel.org/lkml/20260210061437.2293654-1-quic_utiwari@quicinc.com/
> 
> Changes in v5:
> - Drop Reported-by and Closes tags for kernel test robot W=1 warnings, as
>   the issue was fixed within the same patch series.
> - Fix a minor comment indentation/style issue.
> - Link to v5: https://lore.kernel.org/lkml/20251120062443.2016084-1-quic_utiwari@quicinc.com/
> 
> Changes in v4:
> - Annotate runtime PM callbacks with __maybe_unused to silence W=1 warnings.
> - Add Reported-by and Closes tags for kernel test robot warning.
> - Link to v4: https://lore.kernel.org/lkml/20251117062737.3946074-1-quic_utiwari@quicinc.com/
> 
> Changes in v3:
> - Switch from manual clock management to PM clock helpers
>   (devm_pm_clk_create() + pm_clk_add()); no direct clk_* enable/disable
>   in runtime callbacks.
> - Replace pm_runtime_get_sync() with pm_runtime_resume_and_get(); remove
>   pm_runtime_put_noidle() on error.
> - Define PM ops using helper macros and reuse runtime callbacks for system
>   sleep via pm_runtime_force_suspend()/pm_runtime_force_resume().
> - Link to v2: https://lore.kernel.org/lkml/20250826110917.3383061-1-quic_utiwari@quicinc.com/
> 
> Changes in v2:
> - Extend suspend/resume support to include runtime PM and ICC scaling.
> - Register dev_pm_ops and implement runtime_suspend/resume callbacks.
> - Link to v1: https://lore.kernel.org/lkml/20250606105808.2119280-1-quic_utiwari@quicinc.com/
> ---
>  drivers/crypto/qce/core.c | 87 +++++++++++++++++++++++++++++++++------
>  1 file changed, 75 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index b966f3365b7d..776a08340b08 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -12,6 +12,9 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_clock.h>
>  #include <linux/types.h>
>  #include <crypto/algapi.h>
>  #include <crypto/internal/hash.h>
> @@ -90,6 +93,11 @@ static int qce_handle_queue(struct qce_device *qce,
>  	struct crypto_async_request *async_req, *backlog;
>  	int ret = 0, err;

First use of ret is now an assignment, so please drop the unnecessary
zero-initialization.

>  
> +	ACQUIRE(pm_runtime_active_try, pm)(qce->dev);
> +	ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm);

Luckily, this - to me - incomprehensible construct got some useful
wrappers in ef8057b07c72 ("PM: runtime: Wrapper macros for
ACQUIRE()/ACQUIRE_ERR()"), merged back in November. So, you should
instead use the form:

	PM_RUNTIME_ACQUIRE(qce->dev, pm);
	if ((ret = PM_RUNTIME_ACQUIRE_ERR(&pm)))
		return ret;
	
or (I don't think we really care about the specific error returned):

	PM_RUNTIME_ACQUIRE(qce->dev, pm);
	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
		return -Esome_specific_error;


Although I presume that's PM_RUNTIME_ACQUIRE_AUTOSUSPEND() in your case.

> +	if (ret)
> +		return ret;
> +
>  	scoped_guard(mutex, &qce->lock) {
>  		if (req)
>  			ret = crypto_enqueue_request(&qce->queue, req);
> @@ -207,23 +215,34 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	qce->core = devm_clk_get_optional_enabled(qce->dev, "core");
> -	if (IS_ERR(qce->core))
> -		return PTR_ERR(qce->core);
> +	/* PM clock helpers: register device clocks */
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
>  
> -	qce->iface = devm_clk_get_optional_enabled(qce->dev, "iface");
> -	if (IS_ERR(qce->iface))
> -		return PTR_ERR(qce->iface);
> +	ret = pm_clk_add(dev, "core");
> +	if (ret)
> +		return ret;
>  
> -	qce->bus = devm_clk_get_optional_enabled(qce->dev, "bus");
> -	if (IS_ERR(qce->bus))
> -		return PTR_ERR(qce->bus);
> +	ret = pm_clk_add(dev, "iface");
> +	if (ret)
> +		return ret;
>  
> -	qce->mem_path = devm_of_icc_get(qce->dev, "memory");
> +	ret = pm_clk_add(dev, "bus");
> +	if (ret)
> +		return ret;
> +
> +	qce->mem_path = devm_of_icc_get(dev, "memory");
>  	if (IS_ERR(qce->mem_path))
>  		return PTR_ERR(qce->mem_path);
>  
> -	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
> +	/* Enable runtime PM after clocks and ICC are acquired */

It wouldn't hurt to continue this sentence to include that you're doing
it like that so that clocks and interconnect votes are applied by the
resume callback (I assume that's your reason for the ordering at least).

> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	ACQUIRE(pm_runtime_active_try, pm)(dev);
> +	ret = ACQUIRE_ERR(pm_runtime_active_auto_try, &pm);

As above.

>  	if (ret)
>  		return ret;
>  
> @@ -245,9 +264,52 @@ static int qce_crypto_probe(struct platform_device *pdev)
>  	qce->async_req_enqueue = qce_async_request_enqueue;
>  	qce->async_req_done = qce_async_request_done;
>  
> -	return devm_qce_register_algs(qce);
> +	ret = devm_qce_register_algs(qce);
> +	if (ret)
> +		return ret;
> +
> +	/* Configure autosuspend after successful init */
> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +
> +	return 0;
>  }
>  
> +static int __maybe_unused qce_runtime_suspend(struct device *dev)
> +{
> +	struct qce_device *qce = dev_get_drvdata(dev);
> +
> +	icc_disable(qce->mem_path);
> +
> +	return pm_clk_suspend(dev);
> +}
> +
> +static int __maybe_unused qce_runtime_resume(struct device *dev)
> +{
> +	struct qce_device *qce = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	ret = pm_clk_resume(dev);

What is the reason to use pm_clk_add() if you need to manually
enable/disable them anyways?

> +	if (ret)
> +		return ret;
> +
> +	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);

icc_disable() will set the "enabled" flag on the internal interconnect
data structures, which causes the vote to be skipped in aggregation.

So, not only does it look unbalanced with icc_disable() vs icc_set_bw()
in suspend/resume, I don't think you have a bandwidth vote after the
first suspend, unless you call icc_enable() here.

> +	if (ret)

Just put pm_clk_suspend(dev) here and return ret; below. Skip the goto.

Regards,
Bjorn

> +		goto err_icc;
> +
> +	return 0;
> +
> +err_icc:
> +	pm_clk_suspend(dev);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops qce_crypto_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qce_runtime_suspend, qce_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
>  static const struct of_device_id qce_crypto_of_match[] = {
>  	{ .compatible = "qcom,crypto-v5.1", },
>  	{ .compatible = "qcom,crypto-v5.4", },
> @@ -261,6 +323,7 @@ static struct platform_driver qce_crypto_driver = {
>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.of_match_table = qce_crypto_of_match,
> +		.pm = &qce_crypto_pm_ops,
>  	},
>  };
>  module_platform_driver(qce_crypto_driver);
> -- 
> 2.34.1
> 
> 


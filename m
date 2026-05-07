Return-Path: <linux-arm-msm+bounces-106538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xpAkL/oB/WlaWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 23:19:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 211604EF2EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 23:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1358302F72B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 21:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A88B3191BD;
	Thu,  7 May 2026 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmI2o3/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB816239E9B;
	Thu,  7 May 2026 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188791; cv=none; b=JtpUtedjBTYFE9+8kGHBiNEH0mrDCi8R8sk+H78Xc9ZkxMxB5bDzanMkV17N/5xlND+JAXJIFdr5LAwkeUYxQQ8ZQjTJJqm+n+oFyv257iYtT2QWrZLvxEzdrkhSQvYONsExrMZqCf3bXg6nyyQQ3jIQsrZ6fQw60/RCuJIk5tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188791; c=relaxed/simple;
	bh=4nJP9B73+zzB2luc+TI1Zp9k8AoToZSXRB3EttFBbls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3k0L/El50/ltDhc4h6XwyLa0J0A1TzSTkmxZI9qzL/SmVGVMS38UwgTsOJO0nwCaUXFViN/pbF9uIxsqtFgeaSjTzrkzGW4YOdkiiWF1giFXWo148wsIWq851L1LoK/TYRNi6YnuJ5flGAQ1KebLZ07zzadiRaDVKquVJAiMmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmI2o3/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE4AC2BCB2;
	Thu,  7 May 2026 21:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778188791;
	bh=4nJP9B73+zzB2luc+TI1Zp9k8AoToZSXRB3EttFBbls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WmI2o3/XKFfxnN4QPm2f8eYljEND+p6u0lfyPdvFI8RUHZyKJMXcxlVj7oI/jBkRE
	 5b7IOhBsPVltC03Zb6wpuVJkNv6obv9FSrCvvhIl8GJaR1FZ7rZZf10+kiR/SMqpzp
	 L0iB70VBzALfOenzvghkPRKVcNZSFKLqtCcbSv1yunA4wAOxJG3qG/Wi0Z2LIPAJ05
	 e8OF1I91kZq33Jc0Lf2sjHltwaoxL8zLmsbyOxQgQN7mBT2cfTuJFCEnB7jh6sMciG
	 euhbEzkeVCduJnGD54+5O6kv/QS/yo5D/lpeYpD2lM7KjG3fBTk0tQECbEDsSMngyv
	 Xj66Id4eqq94Q==
Date: Thu, 7 May 2026 16:19:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neeraj Soni <neeraj.soni@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
Message-ID: <af0Bsv-OFs3rmbQS@baldur>
References: <20260507112626.2527413-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507112626.2527413-1-linlin.zhang@oss.qualcomm.com>
X-Rspamd-Queue-Id: 211604EF2EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106538-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 04:26:24AM -0700, Linlin Zhang wrote:

I only got 2 of the 3 patches, and no cover letter. I can see in the
mail headers that you have:

 X-Mailer: git-send-email 2.25.1

Use b4 to avoid this kind of mistakes.

Regards,
Bjorn

> The QCOM ICE driver manages the ICE core clock through direct calls to
> clk_prepare_enable() and clk_disable_unprepare(), which limits integration
> with platforms that rely on firmware-managed resources or platform-specific
> power management mechanisms.
> 
> Replace direct clock management with runtime PM support by moving clock
> enable and disable into runtime PM callbacks. Use
> pm_runtime_resume_and_get() and pm_runtime_put_sync() in qcom_ice_resume()
> and qcom_ice_suspend() to drive power state transitions, and enable runtime
> PM in qcom_ice_probe().
> 
> Reviewed-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> Reviewed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 58 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..6f9d679b530c 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <linux/firmware/qcom/qcom_scm.h>
>  
> @@ -310,8 +311,8 @@ int qcom_ice_resume(struct qcom_ice *ice)
>  	struct device *dev = ice->dev;
>  	int err;
>  
> -	err = clk_prepare_enable(ice->core_clk);
> -	if (err) {
> +	err = pm_runtime_resume_and_get(dev);
> +	if (err < 0) {
>  		dev_err(dev, "failed to enable core clock (%d)\n",
>  			err);
>  		return err;
> @@ -323,7 +324,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>  
>  int qcom_ice_suspend(struct qcom_ice *ice)
>  {
> -	clk_disable_unprepare(ice->core_clk);
> +	pm_runtime_put_sync(ice->dev);
>  	ice->hwkm_init_complete = false;
>  
>  	return 0;
> @@ -716,24 +717,69 @@ EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
>  
>  static int qcom_ice_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct qcom_ice *engine;
>  	void __iomem *base;
> +	int ret;
>  
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
> -		dev_warn(&pdev->dev, "ICE registers not found\n");
> +		dev_warn(dev, "ICE registers not found\n");
>  		return PTR_ERR(base);
>  	}
>  
> -	engine = qcom_ice_create(&pdev->dev, base);
> +	engine = qcom_ice_create(dev, base);
>  	if (IS_ERR(engine))
>  		return PTR_ERR(engine);
>  
>  	platform_set_drvdata(pdev, engine);
>  
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		dev_warn(dev, "Enable runtime PM failed, ret: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		dev_warn(dev, "Runtime PM fails to resume, ret: %d\n", ret);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> +static void qcom_ice_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_put_sync(&pdev->dev);
> +}
> +
> +static int ice_runtime_resume(struct device *dev)
> +{
> +	struct qcom_ice *ice = dev_get_drvdata(dev);
> +	int err = 0;
> +
> +	err = clk_prepare_enable(ice->core_clk);
> +	if (err) {
> +		dev_err(dev, "failed to enable core clock (%d)\n",
> +			err);
> +	}
> +
> +	return err;
> +}
> +
> +static int ice_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_ice *ice = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(ice->core_clk);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ice_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ice_runtime_suspend, ice_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id qcom_ice_of_match_table[] = {
>  	{ .compatible = "qcom,inline-crypto-engine" },
>  	{ },
> @@ -742,8 +788,10 @@ MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
>  
>  static struct platform_driver qcom_ice_driver = {
>  	.probe	= qcom_ice_probe,
> +	.remove = qcom_ice_remove,
>  	.driver = {
>  		.name = "qcom-ice",
> +		.pm = &ice_pm_ops,
>  		.of_match_table = qcom_ice_of_match_table,
>  	},
>  };
> -- 
> 2.34.1
> 


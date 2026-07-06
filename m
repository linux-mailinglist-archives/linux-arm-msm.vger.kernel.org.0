Return-Path: <linux-arm-msm+bounces-116907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3GYoFznfS2o9bwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:00:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B083D7139F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:00:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jnPIcqg6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116907-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116907-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0CAD3668164
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F8637E302;
	Mon,  6 Jul 2026 14:45:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A8730D401;
	Mon,  6 Jul 2026 14:45:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349137; cv=none; b=RVGBcKVYBycfI+JGhKd5NjjFpjb2nzqQNDoWXiGwYiYywKS9oc/BneJ8BJ9nh1meruJ0BncTBeIbFL55k4lN59vGjV4deWw+rh+0cAFQdjIgAfSDYC0p8HzIYo2Ulhnad4YLgAPu+wlnZ+GjV0lH6El1QDLnCOI14XMgFzM8hxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349137; c=relaxed/simple;
	bh=exXCNn/YAUFZbvKztOYWREtRr5De83KDg/9ANsgiatI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQzIA1IV5nA86GLzzOqUsJZnZjQE5R7N/GjKOiK6T9qgLFH6HDtb1bjCvFdiGV3RITUIWQU0oRDOydi+5uXLSc/tXbYOqUVRic+xKSEy+Is9nZDKswFqVxh7ykVhS6gzAHWq0bFLB3YTLqDP5bPhFZ/VDePRl3uYnDdcK29MkcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnPIcqg6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE1B1F000E9;
	Mon,  6 Jul 2026 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783349136;
	bh=6ayWcXwml0nfX7A42DCmTXUSehwpYZ9RGLuO9V1EY3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jnPIcqg6e1uiSQ42BqdEnWme9Jc44eCR31WxCfftlQ4nwKt1pFXXKw4+gJqQZaWXz
	 Coq+TyKZ2tBCTs7rPrLGdJUyR0XWB/i3yOfppsiCex0m1ZnsIgAxNe7SYMaSuDZiz9
	 QkP5hpY/dzKLa+J6YfpdZ8pYOU8aEZNtMM9tuPqQV3CTj6v7Sy0pGaxo5mEg1nGMcn
	 MnI2X/HzZkY9OMizemxdkin0sO+NapPqXMTbrGL4B5ba04HYWYkrB/l6BmUh9xvtP7
	 k3jxJkc1ekfU+PKuqJuWtr2Y1yQwvG6uZj6o58f5EqgjkmhjA2hGLzcJmjUG/Os6Lu
	 FlMC0eoNRtleQ==
Date: Mon, 6 Jul 2026 16:45:28 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] PCI: qcom-ep: Fix runtime PM reference leak in probe
 error paths
Message-ID: <e5mh6jy5tc3orhcjumwcipxonbxoibvg3psxzr4ekelat32iim@too7vazfi2aa>
References: <20260624134932.44357-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624134932.44357-1-vulab@iscas.ac.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116907-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,too7vazfi2aa:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B083D7139F7

On Wed, Jun 24, 2026 at 09:49:32PM +0800, Wentao Liang wrote:
> The qcom_pcie_ep_probe() function obtains a runtime PM reference via
> pm_runtime_get_noresume() at the beginning of the probe, but this
> reference is only released on the successful completion path using
> pm_runtime_put_sync().
> 
> However, the error paths fail to release this reference. The devres
> cleanup registered by devm_pm_runtime_enable() only calls
> pm_runtime_disable() and does not decrement the usage_count. As a
> result, if any error occurs during probe (e.g., resource acquisition
> failure or endpoint initialization failure), the reference is leaked,
> permanently elevating the device's usage_count. This prevents proper
> runtime suspend and clean device removal.
> 
> Fix this by properly distinguishing error paths that occur before and
> after devm_pm_runtime_enable() succeeds:
> 
> - For errors before devm_pm_runtime_enable() succeeds: call
>   pm_runtime_put_noidle() and pm_runtime_disable() manually to clean
>   up the initial reference and disable runtime PM.
> 
> - For errors after devm_pm_runtime_enable() succeeds: only call
>   pm_runtime_put_sync() to drop the initial reference. The
>   pm_runtime_disable() is left to the devres cleanup handler,
>   avoiding a double-disable.
> 
> - On the successful probe path: call pm_runtime_put_sync() to drop
>   the initial reference. The return value is not checked because
>   -EAGAIN/-EBUSY only indicate that the device cannot be suspended
>   at this moment and do not represent a probe failure. Checking
>   the return value would cause a double-put if it fails.
> 
> This ensures the runtime PM reference is correctly released on all
> error paths without introducing double-disables or double-puts.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5b026a9e714d ("PCI: qcom-ep: Add support for firmware-managed PCIe Endpoint")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/pci/controller/dwc/pcie-qcom-ep.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 257c2bcb5f76..4fb21ef50cd0 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -892,16 +892,16 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
>  	pm_runtime_set_active(dev);
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret)
> -		return ret;
> +		goto err_manual_cleanup;
>  
>  	ret = qcom_pcie_ep_get_resources(pdev, pcie_ep);
>  	if (ret)
> -		return ret;
> +		goto err_put_ref;
>  
>  	ret = dw_pcie_ep_init(&pcie_ep->pci.ep);
>  	if (ret) {
>  		dev_err(dev, "Failed to initialize endpoint: %d\n", ret);
> -		return ret;
> +		goto err_put_ref;
>  	}
>  
>  	ret = qcom_pcie_ep_enable_irq_resources(pdev, pcie_ep);
> @@ -914,11 +914,7 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
>  		goto err_disable_irqs;
>  	}
>  
> -	ret = pm_runtime_put_sync(dev);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to suspend device: %d\n", ret);
> -		goto err_disable_irqs;
> -	}
> +	pm_runtime_put_sync(dev);
>  
>  	pcie_ep->debugfs = debugfs_create_dir(name, NULL);
>  	qcom_pcie_ep_init_debugfs(pcie_ep);
> @@ -932,6 +928,13 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
>  err_ep_deinit:
>  	dw_pcie_ep_deinit(&pcie_ep->pci.ep);
>  
> +err_put_ref:
> +	pm_runtime_put_sync(dev);
> +	return ret;

Returning from 2 different error labels is not a standard pattern in kernel.

> +
> +err_manual_cleanup:

Weird error label name.

> +	pm_runtime_put_noidle(dev);

Why pm_runtime_put_noidle() and not pm_runtime_put_sync()?

> +	pm_runtime_disable(dev);

If devm_pm_runtime_enable() fails, pm_runtime_disable() will be called in the
error path as well. So this pm_runtime_disable() will decrement the disable
counter twice.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


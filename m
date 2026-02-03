Return-Path: <linux-arm-msm+bounces-91620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K0bM5OtgWn0IQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:10:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F81D60A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 09:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C89CF30175E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 08:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA72392C55;
	Tue,  3 Feb 2026 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqQEtxHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9563921F3;
	Tue,  3 Feb 2026 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106257; cv=none; b=Nr1qiL1PaHujBENeRGPD6UJb3D8AAUILR20UC1HXnS92WMdflpWgmce0Ji/xt+2KL3wPGDHdoK4co1ZisBlGAAS9dJwUdzws/jQA0i35Pa2oEyi+EONquI+ETSjrt4djFcS4PGklFZ1C1Sx8RQut6vhhIA7fYzASyljWHD+2oUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106257; c=relaxed/simple;
	bh=z5sIgTxT6RjyvzaDQY+mY2brRvOarJDI5OqjPljLyZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5nWt77ohmShdg9GCNV+dkourrbJmC/XMt641rWlq/+IZSNBqjx/D8Iy/ezDuKMy8cCqidbPSBJz+SMRCG1zepFw78tn1Oxtu+O8zVQnvixKKK/zuv+IS52gDQMcnnZii606bkjoWgZThUs5j7htEE1URxS2oa13yqPN6GmPNZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqQEtxHZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B29FC116D0;
	Tue,  3 Feb 2026 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770106257;
	bh=z5sIgTxT6RjyvzaDQY+mY2brRvOarJDI5OqjPljLyZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqQEtxHZLBj2AUgmtt8jioGrlWZQeeeqdZ02mq2AJ0GH23hhlcZGDz14GS2GzhwmO
	 k7jCmcCM5cwxMFMkw3XqPTwP3u9yqXJkPgrkT7WdxpiP8EjLMagq2WAlv8n/b7oDNK
	 EDKPX/P7pn2BljwjPWhBKXqJAGZpPqUyrplFIi82qstHRKITS/Ebfy46vJxDVXVtjZ
	 zw8KAUbw5hj5NcTfZL2+hkmT25/DpT9tAeRCAotQcLTzkV6bk/lUmumHmQQVfQiVm9
	 uhZTOL0I5YRLcDXninDU5DSATKVB5SpCoztBNC8jjpQFFaRbjQ4lCdspA9tEI7jiFP
	 F8aVHTQP3yujg==
Date: Tue, 3 Feb 2026 13:40:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ice: Remove platform_driver support and
 expose as a pure library
Message-ID: <spejairpdsb5sa3jwuogkl3edkglqoxa4eqz6zriq5w53ic4a6@4gyymeidqy5d>
References: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91620-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74F81D60A2
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 01:37:12PM +0530, Manivannan Sadhasivam wrote:
> The current platform driver design causes probe ordering races with clients
> (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE probe
> fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops with
> -EPROBE_DEFER, leaving clients non-functional even when ICE should be
> gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE driver
> probe has failed due to above reasons or it is waiting for the SCM driver.
> 
> Moreover, there is no devlink dependency between ICE and client drivers
> as 'qcom,ice' is not considered as a DT 'supplier'. So the client drivers
> have no idea of when the ICE driver is going to probe.
> 
> To avoid all this hassle, remove the platform driver support altogether and
> just expose the ICE driver as a pure library to client drivers. With this
> design, when devm_of_qcom_ice_get() is called, it will check if the ICE
> instance is available or not. If not, it will create one based on the ICE
> DT node, increase the refcount and return the handle. When the next client
> calls the API again, the ICE instance would be available. So this function
> will just increment the refcount and return the instance.
> 
> Finally, when the client devices get destroyed, refcount will be
> decremented and finally the cleanup will happen once all clients are
> destroyed.
> 
> For the clients using the old DT binding of providing the separate 'ice'
> register range in their node, this change has no impact.
> 
> Cc: stable@vger.kernel.org
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ice.c | 100 ++++++++++++++++-------------------------
>  1 file changed, 39 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..b5a9cf8de6e4 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -107,12 +107,16 @@ struct qcom_ice {
>  	struct device *dev;
>  	void __iomem *base;
>  
> +	struct kref refcount;
>  	struct clk *core_clk;
>  	bool use_hwkm;
>  	bool hwkm_init_complete;
>  	u8 hwkm_version;
>  };
>  
> +static DEFINE_MUTEX(ice_mutex);
> +struct qcom_ice *ice_handle;
> +
>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
>  {
>  	u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> @@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>   * This function will provide an ICE instance either by creating one for the
>   * consumer device if its DT node provides the 'ice' reg range and the 'ice'
>   * clock (for legacy DT style). On the other hand, if consumer provides a
> - * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
> - * be created and so this function will return that instead.
> + * phandle via 'qcom,ice' property to an ICE DT node, then the ICE instance will
> + * be created if not already done and will be returned.
>   *
>   * Return: ICE pointer on success, NULL if there is no ICE data provided by the
>   * consumer or ERR_PTR() on error.
> @@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  	struct qcom_ice *ice;
>  	struct resource *res;
>  	void __iomem *base;
> -	struct device_link *link;
>  
>  	if (!dev || !dev->of_node)
>  		return ERR_PTR(-ENODEV);
>  
> +	guard(mutex)(&ice_mutex);
> +
>  	/*
>  	 * In order to support legacy style devicetree bindings, we need
>  	 * to create the ICE instance using the consumer device and the reg
> @@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  		return qcom_ice_create(&pdev->dev, base);
>  	}
>  
> +	/*
> +	 * If the ICE node has been initialized already, just increase the
> +	 * refcount and return the handle.
> +	 */
> +	if (ice_handle) {
> +		kref_get(&ice_handle->refcount);
> +
> +		return ice_handle;
> +	}
> +
>  	/*
>  	 * If the consumer node does not provider an 'ice' reg range
>  	 * (legacy DT binding), then it must at least provide a phandle
> @@ -643,41 +658,43 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  
>  	pdev = of_find_device_by_node(node);
>  	if (!pdev) {
> -		dev_err(dev, "Cannot find device node %s\n", node->name);
> +		dev_err(dev, "Cannot find ICE platform device\n");
> +		platform_device_put(pdev);

This somehow slipped in...

- Mani

>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
> -	ice = platform_get_drvdata(pdev);
> -	if (!ice) {
> -		dev_err(dev, "Cannot get ice instance from %s\n",
> -			dev_name(&pdev->dev));
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base)) {
> +		dev_warn(&pdev->dev, "ICE registers not found\n");
>  		platform_device_put(pdev);
> -		return ERR_PTR(-EPROBE_DEFER);
> +		return base;
>  	}
>  
> -	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> -	if (!link) {
> -		dev_err(&pdev->dev,
> -			"Failed to create device link to consumer %s\n",
> -			dev_name(dev));
> +	ice = qcom_ice_create(&pdev->dev, base);
> +	if (IS_ERR(ice)) {
>  		platform_device_put(pdev);
> -		ice = ERR_PTR(-EINVAL);
> +		return ice_handle;
>  	}
>  
> -	return ice;
> +	ice_handle = ice;
> +	kref_init(&ice_handle->refcount);
> +
> +	return ice_handle;
>  }
>  
> -static void qcom_ice_put(const struct qcom_ice *ice)
> +static void qcom_ice_put(struct kref *kref)
>  {
> -	struct platform_device *pdev = to_platform_device(ice->dev);
> -
> -	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> -		platform_device_put(pdev);
> +	platform_device_put(to_platform_device(ice_handle->dev));
> +	ice_handle = NULL;
>  }
>  
>  static void devm_of_qcom_ice_put(struct device *dev, void *res)
>  {
> -	qcom_ice_put(*(struct qcom_ice **)res);
> +	const struct qcom_ice *ice = *(struct qcom_ice **)res;
> +	struct platform_device *pdev = to_platform_device(ice->dev);
> +
> +	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> +		kref_put(&ice_handle->refcount, qcom_ice_put);
>  }
>  
>  /**
> @@ -713,42 +730,3 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
>  	return ice;
>  }
>  EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
> -
> -static int qcom_ice_probe(struct platform_device *pdev)
> -{
> -	struct qcom_ice *engine;
> -	void __iomem *base;
> -
> -	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base)) {
> -		dev_warn(&pdev->dev, "ICE registers not found\n");
> -		return PTR_ERR(base);
> -	}
> -
> -	engine = qcom_ice_create(&pdev->dev, base);
> -	if (IS_ERR(engine))
> -		return PTR_ERR(engine);
> -
> -	platform_set_drvdata(pdev, engine);
> -
> -	return 0;
> -}
> -
> -static const struct of_device_id qcom_ice_of_match_table[] = {
> -	{ .compatible = "qcom,inline-crypto-engine" },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
> -
> -static struct platform_driver qcom_ice_driver = {
> -	.probe	= qcom_ice_probe,
> -	.driver = {
> -		.name = "qcom-ice",
> -		.of_match_table = qcom_ice_of_match_table,
> -	},
> -};
> -
> -module_platform_driver(qcom_ice_driver);
> -
> -MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
> -MODULE_LICENSE("GPL");
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்


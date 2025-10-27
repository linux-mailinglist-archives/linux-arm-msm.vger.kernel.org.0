Return-Path: <linux-arm-msm+bounces-79008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D2C0FEAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 19:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07E54406B0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFD12D877D;
	Mon, 27 Oct 2025 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0qcJcvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39C92D839A;
	Mon, 27 Oct 2025 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589428; cv=none; b=kGOPDrUG+hw843mPDNzN7yCKVACuUS1WoJ3/SyW3lTx82fs5RfdV08WWUlM8ilg/AH7gMcqhCYkTKFDnbzXoeW2Uk/wlkwy8O434YOULj4CwI4m12vSZlnPURspbyj15KTOijwxa6w/K6LIkmMxCn3BJh8plCVXAPZ2CFSu7c48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589428; c=relaxed/simple;
	bh=PL3w+WGmuVS2bXhutlLJ33oASDlezmteONTXwG2x2Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boPCrZqRBU2QfjcQ0h95B87XDLeWji9d7mssW8u/3Sbq8bIQcHcDibxvh4BGdylOmGt8nYS5r8zGbA7onRenPzEAbuLwAPYH+bVbZ2gBYzUXcqR8JZwLKpuUHrtUCIokTFYuXNjzTZQ6MY+nwcNNu1LvgWDkd9KmsxZ4WIAF0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0qcJcvJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7C7C4CEF1;
	Mon, 27 Oct 2025 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761589428;
	bh=PL3w+WGmuVS2bXhutlLJ33oASDlezmteONTXwG2x2Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0qcJcvJ1IsQLFmsSxpFzH6aIEgetR5i3lABrlyTYan5jDRH2pvRiTFWf5o0IMR8e
	 X7RHoYsiIpryeW6t2JHICGzGmJxH7y6ILth4ArJuLum2O7ThqlNbJbTiid/wa9+Q1l
	 0OYtgwDxCcO1ZwHLyCH+V5nG/qpox9wGXqUpEOIg6Y6hLVPeq20TAWTUYooZWiCdkF
	 Th1LhVndJkhdLHY5PD3FyjkVnJZcU77Qdhogf8PjBFEdDqwJfmcKLtHlCw3b5g3oIU
	 vYhwrFVXozOsav4L7NC6kCW6riBRvJeslokRJv3me3FyMV2SDhHCvqPAy5OAX46vIX
	 RvTnLJWOFSMUA==
Date: Mon, 27 Oct 2025 13:26:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Cc: quic_neersoni@quicinc.com, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] qcom: ice: Prevent client probe failures on unsupported
 ICE
Message-ID: <s26gqvmc6wsifibgepaesaveyztnqp2s4ra4cbfmpv5s4sx674@nxxko33urctv>
References: <20251021040337.787980-1-quic_dmukhopa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021040337.787980-1-quic_dmukhopa@quicinc.com>

On Tue, Oct 21, 2025 at 09:33:37AM +0530, Debraj Mukhopadhyay wrote:
> Storage clients (ex. UFS and MMC) invoke of_qcom_ice_get() to obtain the
> handle from ICE (Inline Crypto Engine) driver. Currently if ICE is
> unsupported, the return code from probe could prevent the client

In light of Konrad's questions about this, I think you should rework
this sentence to make it clear that you're referring to a platform where
TZ doesn't implement ICE. I don't think "which is a bug" accurately
reflect the outcome, it's not a bug, it just sounds like you changed the
rules - and need to update the logic as such.

> initialization which is a bug. To fix this a new flag
> qcom_ice_create_error is introduced which caches the error encountered
> during ICE probe.
> 
> The qcom_ice_create() and of_qcom_ice_get() functions are updated to
> return -EOPNOTSUPP when ICE is unsupported, allowing clients to proceed
> without ICE.
> 
> For other failures, such as ICE not yet initialized, the existing
> behavior (e.g., -EPROBE_DEFER) is retained to ensure proper error
> handling.
> 
> This improves error signaling and ensures that client initialization is
> not blocked unnecessarily.
> 
> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>

Please use oss.qualcomm.com

> ---
>  drivers/soc/qcom/ice.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index c467b55b4174..5460436d9158 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -85,6 +85,8 @@ union crypto_cfg {
>  #define qcom_ice_readl(engine, reg)	\
>  	readl((engine)->base + (reg))
>  
> +static bool qcom_ice_create_error;

What happens the day the HW guys put two of these in a chip?

> +
>  static bool qcom_ice_use_wrapped_keys;
>  module_param_named(use_wrapped_keys, qcom_ice_use_wrapped_keys, bool, 0660);
>  MODULE_PARM_DESC(use_wrapped_keys,
> @@ -524,7 +526,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  
>  	if (!qcom_scm_ice_available()) {
>  		dev_warn(dev, "ICE SCM interface not found\n");
> -		return NULL;
> +		return ERR_PTR(-EOPNOTSUPP);

I think this is supported by your commit message - i.e. tz doesn't
provide ICE, but it's documented in the DT, so we should return
EOPNOTSUPP and get that warning from the UFS code.

>  	}
>  
>  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> @@ -604,7 +606,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
>  									"qcom,ice", 0);
>  	if (!node)
> -		return NULL;
> +		return ERR_PTR(-EOPNOTSUPP);

But this falls in the category "the DeviceTree doesn't claim we have ICE
support", so here I think the NULL makes sense. At least, there
shouldn't be a warning during boot, because the hardware description
says there's no ICE, so how can we disable it...

>  
>  	pdev = of_find_device_by_node(node);
>  	if (!pdev) {
> @@ -617,7 +619,10 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  		dev_err(dev, "Cannot get ice instance from %s\n",
>  			dev_name(&pdev->dev));
>  		platform_device_put(pdev);
> -		return ERR_PTR(-EPROBE_DEFER);
> +		if (qcom_ice_create_error)
> +			return ERR_PTR(-EOPNOTSUPP);
> +		else
> +			return ERR_PTR(-EPROBE_DEFER);

There's the theoretical chance that qcom_ice_create() will return
ERR_PTR(EPROBE_DEFER) in which case you will set qcom_ice_create_error
and then return EOPNOTSUPP here.



PS. The definition of "Return:" doesn't adequately capture what the
client should expect from this function; but that would probably be
better served by a patch of its own.

Regards,
Bjorn

>  	}
>  
>  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> @@ -691,8 +696,10 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  	}
>  
>  	engine = qcom_ice_create(&pdev->dev, base);
> -	if (IS_ERR(engine))
> +	if (IS_ERR(engine)) {
> +		qcom_ice_create_error = true;
>  		return PTR_ERR(engine);
> +	}
>  
>  	platform_set_drvdata(pdev, engine);
>  
> -- 
> 2.34.1
> 


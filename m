Return-Path: <linux-arm-msm+bounces-32830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AFB98B2C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 05:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09C051C218E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 03:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488761A38C8;
	Tue,  1 Oct 2024 03:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/3SCVJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2115688E;
	Tue,  1 Oct 2024 03:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727754002; cv=none; b=L/xdHFFdhhuHZeD2w+V+sQWOTIhRjTemmw4goPhmi/86YNFZZFYEqYBfqC0X2LIfT/VAHLa+7mAAITJMbecKUlAfgKYw3Ok6HV8lcxAycuLTRNTF/Od1jZrToPVy1DzHf0AJ3XIb2v8eIkiPoFa89Ty/hGIhoCNYbRp4/ekMGDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727754002; c=relaxed/simple;
	bh=emRqEkNvnSOpIL29BJgsLsQ/aGYnW4dS0Y+sE7ar8Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5WztQ/htUl6+A7K9RGcEXNdRXt0gdgx0cfeldx2SZnI/vHThMfr9FRJdEFxG4rSc5IEHtr12MU2D8+ZmwDGqiGmFqubUUyLc0I4iWgAV52EWprgaMR3arEvEmuOOl8dkvsmDmAgvc9rsviP2GY3yoDNFOqu/Fzvx2GspVFKnMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/3SCVJI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C70C4CEC7;
	Tue,  1 Oct 2024 03:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727754002;
	bh=emRqEkNvnSOpIL29BJgsLsQ/aGYnW4dS0Y+sE7ar8Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/3SCVJIMbzHcuRLLqpMnE6IgiBvCiKNjQHNaMf4tN5wyvvppqmRgewU9Vw6JuJXf
	 c4mSNT+s6Uz/0aIGidUVZm6LdaXjqb0+6iNuX5qdbsKR6RsQIIFlr8wB8WkUTWt5xw
	 3iTZ0u1cq2TruSBAoHU6KMG+LBVlutDPzhu+xqcQggrdE2B0dwYtXouMw2zVFpRWWm
	 Wa7mEKCZfoJcmpRlNwh6QN58qCoiDNuztwTNNIB/KAs+CERtouzsqtAZvrNs2oH9YV
	 o4UAMKbR5QCydWTJabg1cqBdiy9dxyCNUR/6o96Nr1a9ZbcSTWtrlXdIOa1XzFHZBv
	 dX3U5NQULBX6Q==
Date: Mon, 30 Sep 2024 22:39:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, quic_rampraka@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, quic_neersoni@quicinc.com, 
	quic_gaurkash@quicinc.com
Subject: Re: [PATCH] qcom: ice: Remove ice probe
Message-ID: <jkbrt5wmrr6ey4icfj3xyuvmhxm34gmratofnia7bp4vxgu3pz@sk2fadbarix3>
References: <20240928050456.27577-1-quic_spuppala@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928050456.27577-1-quic_spuppala@quicinc.com>

On Sat, Sep 28, 2024 at 10:34:56AM GMT, Seshu Madhavi Puppala wrote:
> Under JEDEC specification ICE IP is tightly
> coupled with Storage. Qualcomm vendor HW
> implementation also ties the clock and power
> supply for ICE to corresponding storage clock and
> supplies. For a SoC supporting multiple storage
> types like UFS and eMMC the ICE physical address
> space is not shared and is always part of
> corresponding storage physical address space
> hence there is no need to independently probe ICE.
> 

So, you're effectively saying that commit 2afbf43a4aec got system design
wrong, and it should never have been a dedicated device?

I presume this would be easy to spot, as there would be platforms with
multiple ICE device nodes...


If so, write that clearly and make sure you make sure that the author of
that change is among the addressed people in your patch.

> Cleanup commit 2afbf43a4aec ("soc: qcom: Make
> the Qualcomm UFS/SDCC ICE a dedicated driver")
> to remove dedicated ICE probe since there is no
> dedicated ICE IP block shared between UFS and
> SDCC as mentioned in 2afbf43a4aec.
> 
> Storage probe will check for the corresponding
> ICE node by using of_qcom_ice_get to get ICE
> instance. Additional support added to
> of_qcom_ice_get to support ICE instance creation
> with new approach. Backward compatibility with
> old style device tree approach is untouched.
> 

Add () suffix to function names, to make it clear that they are
functions.


Also, please read and follow:
https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format

> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> ---
>  drivers/soc/qcom/ice.c | 44 +++++++-----------------------------------
>  1 file changed, 7 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index fbab7fe5c652..47f1b668dc86 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -303,7 +303,13 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  		goto out;
>  	}
>  
> -	ice = platform_get_drvdata(pdev);
> +	base = devm_platform_ioremap_resource(pdev, 0);

So pdev here is the returned value of of_find_device_by_node() which
refers to a platform_device which now will never find a matching driver.
So no one will ever free this...

> +	if (IS_ERR(base)) {
> +		dev_warn(&pdev->dev, "ICE registers not found\n");

That's just one of the possible error cases. And iirc
devm_platform_ioremap_resource() already did print. Please double check
and update this accordingly.

> +		return PTR_ERR(base);
> +	}
> +
> +	ice = qcom_ice_create(&pdev->dev, base);

This too will now allocate resources on a struct device that doesn't
have a driver and hence will never materialize - or clean up the devres
resources.

Regards,
Bjorn

>  	if (!ice) {
>  		dev_err(dev, "Cannot get ice instance from %s\n",
>  			dev_name(&pdev->dev));
> @@ -328,41 +334,5 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(of_qcom_ice_get);
>  
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
>  MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
>  MODULE_LICENSE("GPL");
> -- 
> 2.17.1
> 


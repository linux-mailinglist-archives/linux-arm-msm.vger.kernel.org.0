Return-Path: <linux-arm-msm+bounces-43423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C6F9FCE0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1356F188266A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 21:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822581494A9;
	Thu, 26 Dec 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sy3uroIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591F518E1F;
	Thu, 26 Dec 2024 21:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735249163; cv=none; b=ItwmzJzxvUJm2NOrQtTi9ubBufQT3Qmm791BPmyc7UUIURjXIOTjEA9sMYgCI8UE1O4QjwkgqA8yQrkzULT3BUes2Nzo4/5VZRq6kLdOmq4rF5Z0KNXDB68syFE/xYOXUzgsvd9SCLzqhSwqMbnHgK9gdH8THsKElf7FanIPsls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735249163; c=relaxed/simple;
	bh=CNy5ihTVtcZcwz1ErODiQjWRxuF3ECT+h7XydFJ2r/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8irA+kFwYyndy/KxBDOLW+UZi+kRkhKwNDPpgpdT/rYwjUP1wj2cb7vVz27M8oXFcJJ2TBzBRhhh4IcIzDMo8vkqA+B+U2iMCs1eXnGzVvF/0qb6GBHW0ikn7zfVGBJWQIvpV1mGcIH/YqopNM92LgkW3hkqdPuukTBZEL/YLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sy3uroIY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741F4C4CED1;
	Thu, 26 Dec 2024 21:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735249162;
	bh=CNy5ihTVtcZcwz1ErODiQjWRxuF3ECT+h7XydFJ2r/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sy3uroIYFBE7NhzQux52EIkxPPyx/owTCTPHx0QqvPJeMChumrdoQCapmMWQVa+Rp
	 V4MnqoT5Ibh2oA9X/MCXhlu2e1IkWtIj2equz12rQxVvCzmNwvU8u+g5U0xd9OJMr8
	 Snx/KxHgvdL19/lznlVKkQlIbZihEraloKA7tseLWHgN9VoXepjtNW5yfCLZE9eKd4
	 yEUiWyN2hT/m4wzzdjHR0FhIei+0l/2CMRUdOgvqodHFyFLyWZFwXN5N4FOLglZHTn
	 6mZ1NMu9ZHHEFTlcqEQs4XDSkqGWTmZMQsuK1HjNdYmpl9ZFzRldQZsbsAIQXjiJIH
	 GzYsqOTcpr+MA==
Date: Thu, 26 Dec 2024 15:39:20 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: qcom: ice: Prevent UFS probe deferral on ICE
 probe failure
Message-ID: <iwsckx6e7gmi6rd3f2k4rimtpwohs5fihidqpwkf6rlf6qui2l@tjmixqkjcdlj>
References: <20241203024005.391654-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203024005.391654-1-quic_yrangana@quicinc.com>

On Tue, Dec 03, 2024 at 08:10:05AM +0530, Yuvaraj Ranganathan wrote:
> When the ICE key programming interface is unavailable, the ice create
> function fails, causing the probe to set NULL as the driver data. As a 
> result, when the UFS driver reads the ICE driver data and encounters a 
> NULL, leading to the deferral of the UFS probe and preventing the device
> from booting to the shell.
> 
> To address this issue, modify the behavior to return an "operation not
> supported" error when the ICE key programming interface is unavailable.
> Additionally, mark this error in a global variable. When the UFS driver
> attempts to read the ICE driver data, it will check for this error and
> return it, rather than deferring the probe.
> 

I'm guessing that the actual test case here is that DeviceTree defines
that UFS should use the ICE, but the trusted firmware doesn't implement
the ICE API.

Your commit message is pretty good, but I would like to see the commit
message clarify which case this (DT says there's ICE, but firmware says
no) is a valid case.

> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  drivers/soc/qcom/ice.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 393d2d1d275f..160916cb8fb0 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -41,6 +41,8 @@
>  #define qcom_ice_readl(engine, reg)	\
>  	readl((engine)->base + (reg))
>  
> +static bool qcom_ice_create_error;
> +
>  struct qcom_ice {
>  	struct device *dev;
>  	void __iomem *base;
> @@ -215,7 +217,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  
>  	if (!qcom_scm_ice_available()) {
>  		dev_warn(dev, "ICE SCM interface not found\n");
> -		return NULL;
> +		return ERR_PTR(-EOPNOTSUPP);
>  	}
>  
>  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> @@ -303,6 +305,9 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
> +	if (qcom_ice_create_error)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
>  	ice = platform_get_drvdata(pdev);
>  	if (!ice) {
>  		dev_err(dev, "Cannot get ice instance from %s\n",
> @@ -336,8 +341,10 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  	}
>  
>  	engine = qcom_ice_create(&pdev->dev, base);
> -	if (IS_ERR(engine))
> +	if (IS_ERR(engine)) {
> +		qcom_ice_create_error = true;

This would also handle the existing qcom_ice_check_supported() failure
better, allowing the UFS device to probe - which may or may not be good,
please use the commit message to document what the expected behavior is
in these casees.


That said, this will do the same for the core_clk = -EPROBE_DEFER, which
is not correct - that should remain a EPROBE_DEFER.

Regards,
Bjorn

>  		return PTR_ERR(engine);
> +	}
>  
>  	platform_set_drvdata(pdev, engine);
>  
> -- 
> 2.34.1
> 


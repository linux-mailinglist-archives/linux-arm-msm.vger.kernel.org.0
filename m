Return-Path: <linux-arm-msm+bounces-55128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E550A989EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45035440749
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 12:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B80264638;
	Wed, 23 Apr 2025 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDH4MpuZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2419AD8B;
	Wed, 23 Apr 2025 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745412073; cv=none; b=REwxqBWcyayAsimcgGxXdw3JVW9fXAcuQqMzTmDNaDZQrx/JXdkd/4aUJzT/AAf3MgYdg/rG5qfpm6fUbsOpSw637s8tSbYB7TJeFLqKbB4e/tP+/nLcmYrx7vxy9JGyZ06DPj1W8rKHeBd8iiE4JO1XMnud2i4rdPo6Ce+RndQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745412073; c=relaxed/simple;
	bh=vuPHSXDYGJIDkCqEVb7xzubmHAFjmIAu6deVCTDXe5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt/mBxGeStUmVYx1lXlNMam3e6mjsqs7n1w2wOm/ZYaJ2HE4dNBk8hsaBSvzgAJOP0RuswKuniRsaHLL9iXpVOs1nbjLXnyBiy5Z1X6uPzZr4t6C9LjCvX8jdAdT/p19OzcFLRsvHmrcDDmS7Ek4QDOZ17WwFbPfrIXT6UdkCs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDH4MpuZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FC1C4CEE2;
	Wed, 23 Apr 2025 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745412072;
	bh=vuPHSXDYGJIDkCqEVb7xzubmHAFjmIAu6deVCTDXe5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDH4MpuZmgQybX1eY37H/yKYnZhDg6DAis3McprvezR9yjHdpSgM2sn1I2aE9x1AB
	 xIGpL0+YBtK5II54K4yMp6WWpNcX7HxtM0+FHw4xhtzqVF22nFmM0ZOCQffQ9ZvIIW
	 zlrtKxncSH83B/Y3id0o3PCZ7zXwDPhkv7LnjhtVfncL3y1c3h/j6rCosB5gqlu2Au
	 Jpxy+N29g3AE6P+Sl9Nh6Sohr9boBRizf1CkAHWtFKCe+hiBmTV/vlTn3iZhmWyusC
	 Sa4RlgUGvnkE/aLBq2ArHOWsV8fYIV6i1BWi5hQeY2olu0dwCtQLZ07TgMimOk7SJr
	 72ekoDy3dr1Bw==
Date: Wed, 23 Apr 2025 07:41:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] usb: dwc3: qcom: Fix error handling in probe
Message-ID: <al4hz5pukil2mc263cyzq5atm4gdjn6v2kdanayhd7edfueidu@obr7h7365w2w>
References: <aAijmfAph0FlTqg6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAijmfAph0FlTqg6@stanley.mountain>

On Wed, Apr 23, 2025 at 11:23:53AM +0300, Dan Carpenter wrote:
> There are two issues:
> 1) Return -EINVAL if platform_get_resource() fails.  Don't return
>    success.
> 2) The devm_ioremap() function doesn't return error pointers, it returns
>    NULL.  Update the check.
> 
> Fixes: 1881a32fe14d ("usb: dwc3: qcom: Transition to flattened model")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d512002e1e88..b63fcaf823aa 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -740,15 +740,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	}
>  
>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!r)
> +	if (!r) {
> +		ret = -EINVAL;
>  		goto clk_disable;
> +	}
>  	res = *r;
>  	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
>  
>  	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
> -	if (IS_ERR(qcom->qscratch_base)) {
> -		dev_err(dev, "failed to map qscratch region: %pe\n", qcom->qscratch_base);
> -		ret = PTR_ERR(qcom->qscratch_base);
> +	if (!qcom->qscratch_base) {
> +		dev_err(dev, "failed to map qscratch region\n");
> +		ret = -ENOMEM;
>  		goto clk_disable;
>  	}
>  
> -- 
> 2.47.2
> 
> 


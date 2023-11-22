Return-Path: <linux-arm-msm+bounces-1500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AC07F4539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 12:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31A7E1C2082A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A57054273;
	Wed, 22 Nov 2023 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0oGwxCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723ADC13F;
	Wed, 22 Nov 2023 11:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5C1C433C8;
	Wed, 22 Nov 2023 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700654243;
	bh=dhMFJjDMdHJmWFuL/Wz6Hy55a2bliAN+jn2DVLtt1l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0oGwxCjLnODyhXiJsAd0pJ2Q3TpcD6IBQBoAwHKPP5g+eJZ09t6EC0LqE77xOwAf
	 +64jj7gRMSYoTpdX0U0u3VFzdxFNYCifKB7ndtf9EBCHabveyDebo/9ITRbI3sXr/J
	 VLV+Lq6LDBMOezWNmYXqVdZz3f4wfoY3d+GWLPOHWIWYNmXuOLFvn92pafASWgLWP2
	 S8leQr7Mz7N3pFu8qI22CGtN1ODlhndDfPy2Trb3sFccW6FCjdV0BBae2ykfGQh0kX
	 wPn1W/zXlvWfUAs5hMGSJWHPjlfNtfZid3T2NsvAiC9z6F33jtseZOX+YwD4gDBPUI
	 I4MMpAxs/0aRg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5lrN-00005t-0A;
	Wed, 22 Nov 2023 12:57:37 +0100
Date: Wed, 22 Nov 2023 12:57:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [PATCH 04/12] usb: dwc3: Expose core driver as library
Message-ID: <ZV3ssSP5dTwAs-e3@hovoldconsulting.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-4-ab4a84165470@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dwc3-refactor-v1-4-ab4a84165470@quicinc.com>

On Mon, Oct 16, 2023 at 08:11:12PM -0700, Bjorn Andersson wrote:
> The DWC3 IP block is handled by three distinct device drivers: XHCI,
> DWC3 core and a platform specific (optional) DWC3 glue driver.
> 
> This has resulted in, at least in the case of the Qualcomm glue, the
> presence of a number of layering violations, where the glue code either
> can't handle, or has to work around, the fact that core might not probe
> deterministically.
> 
> An example of this is that the suspend path should operate slightly
> different depending on the device operating in host or peripheral mode,
> and the only way to determine the operating state is to peek into the
> core's drvdata.
> 
> The Qualcomm glue driver is expected to make updates in the qscratch
> register region (the "glue" region) during role switch events, but with
> the glue and core split using the driver model, there is no reasonable
> way to introduce listeners for mode changes.
> 
> Split the dwc3 core platfrom_driver callbacks and their implementation
> and export the implementation, to make it possible to deterministically
> instantiate the dwc3 core as part of the dwc3 glue drivers and to
> allow flattening of the DeviceTree representation.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 134 ++++++++++++++++++++++++++++++++----------------
>  drivers/usb/dwc3/core.h |  10 ++++
>  2 files changed, 100 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index d25490965b27..71e376bebb16 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1876,7 +1876,7 @@ static int dwc3_get_clocks(struct dwc3 *dwc)
>  	return 0;
>  }
>  
> -static int dwc3_probe(struct platform_device *pdev)
> +struct dwc3 *dwc3_probe(struct platform_device *pdev)

Perhaps you should move allocation of struct dwc3 to the caller as well
as you are going to need some way to pass in callback to core which need
to be set before you register the xhci platform device.

There could be other ways, like passing in a struct of callbacks, which
can be added incrementally but it may be good think this through from
the start.

>  {
>  	struct device		*dev = &pdev->dev;
>  	struct resource		*res, dwc_res;
> @@ -1886,14 +1886,14 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
>  	if (!dwc)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dwc->dev = dev;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
>  		dev_err(dev, "missing memory resource\n");
> -		return -ENODEV;
> +		return ERR_PTR(-ENODEV);
>  	}
>  
>  	dwc->xhci_resources[0].start = res->start;
> @@ -1922,7 +1922,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	regs = devm_ioremap_resource(dev, &dwc_res);
>  	if (IS_ERR(regs))
> -		return PTR_ERR(regs);
> +		return ERR_CAST(regs);
>  
>  	dwc->regs	= regs;
>  	dwc->regs_size	= resource_size(&dwc_res);
> @@ -1953,7 +1953,6 @@ static int dwc3_probe(struct platform_device *pdev)
>  		goto err_disable_clks;
>  	}
>  
> -	platform_set_drvdata(pdev, dwc);

This is broken however as the pm ops access the data driver data and can
be called as soon as you call pm_runtime_put() below.

>  	dwc3_cache_hwparams(dwc);
>  
>  	if (!dwc->sysdev_is_parent &&
> @@ -2006,7 +2005,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	pm_runtime_put(dev);

That is here.

> -	return 0;
> +	return dwc;
 
> -static void dwc3_remove(struct platform_device *pdev)
> +static int dwc3_plat_probe(struct platform_device *pdev)
>  {
> -	struct dwc3	*dwc = platform_get_drvdata(pdev);
> +	struct dwc3 *dwc;
> +
> +	dwc = dwc3_probe(pdev);
> +	if (IS_ERR(dwc))
> +		return PTR_ERR(dwc);

And that leaves a window, for example, here where you can hit a NULL
pointer dereference.

> +	platform_set_drvdata(pdev, dwc);
> +
> +	return 0;
> +}

Johan


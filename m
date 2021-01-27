Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B916305265
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 06:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhA0Frr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 00:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbhA0Fe1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 00:34:27 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E7B8C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 21:33:42 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id i20so599238otl.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 21:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UXTjp2O+kLbB9CTCJxJt0SD+zZK5wsiYg7svDRD619A=;
        b=dOn1TON+07GhKGJIoyayMjmuy9BWh8V5ii5n4VTX82icYwL/TZwbySdeoTGe3zAzC7
         oSuVT+QQQ33v+XleMivKtoG2pI8n2OuZ9WN0bVODaUZ1UVzMKaFDoNYW6SEGK0pCKGKQ
         oWxYyv3zdNrU3Ep7X6AREUC29Rlo8lcyt4qvfUGVJ+VMNTx5UuJgcjV0rAxgRI/6Bk/K
         0i+FrH5GAbdXLc9mePC17FZ9ip41xi53D0APB/iDZlFNapeDRcpz5BD2WXJpdKPZBOIJ
         MnfwfXayWeimpxJ4hLheuNTqOC1Bq0ahgp4WJngILzzvK0tC/Jj3ClVY+bA4mPvdkw79
         6Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UXTjp2O+kLbB9CTCJxJt0SD+zZK5wsiYg7svDRD619A=;
        b=r4HihVPjSxucD4g2i7WAchQ+rau5a/ES4x4kM04ZyLUGSphfNOGOkGWMa5Dt/CsYQ5
         J5uEqwPxbTafOsj76Is8LCcM1Yv0pxEPnmuaX+VM3UfbuhzEwbwdvocpaJxXfect9eP4
         UmNpkOC5HNWElnaZMiUat6poLJKmF6cX379KMFGElcGArjQDqdeToDCwAzr/AMp8wBrp
         TCI+KcJnC834LtNn5/AGfpATRSyfDU7KPndjPtnKSY4unZ9io8Jj937X5SYsq4oW0VjH
         JgFroMMEObfghmdiHJ97sOiF8/Skr8qZ3Jd22c61l8HVHcGHNd2caPcU7ycdh462pJl6
         VDUw==
X-Gm-Message-State: AOAM532srQFleA18XUVNlMjIAMO6KLe6RyDYCxIB+9jDHxYINVRme4LS
        UzM7puwRXzhHF+7EUllc+V4JNw==
X-Google-Smtp-Source: ABdhPJw+Yk3fYOO7ud+1dReFka/e+p0BzGgE33P9Oxdtl8BwVzczBeoJnHajCPDXBfylS3T2qXrRLA==
X-Received: by 2002:a9d:37a6:: with SMTP id x35mr6665900otb.275.1611725621367;
        Tue, 26 Jan 2021 21:33:41 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y66sm260747oia.20.2021.01.26.21.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 21:33:40 -0800 (PST)
Date:   Tue, 26 Jan 2021 23:33:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, dan.j.williams@intel.com, vkoul@kernel.org,
        shawn.guo@linaro.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dma: qcom: bam_dma: Manage clocks when
 controlled_remotely is set
Message-ID: <YBD7Mhh1MowRDMBF@builder.lan>
References: <20210126211859.790892-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126211859.790892-1-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 26 Jan 15:18 CST 2021, Thara Gopinath wrote:

> When bam dma is "controlled remotely", thus far clocks were not controlled
> from the Linux. In this scenario, Linux was disabling runtime pm in bam dma
> driver and not doing any clock management in suspend/resume hooks.
> 
> With introduction of crypto engine bam dma, the clock is a rpmh resource
> that can be controlled from both Linux and TZ/remote side.  Now bam dma
> clock is getting enabled during probe even though the bam dma can be
> "controlled remotely". But due to clocks not being handled properly,
> bam_suspend generates a unbalanced clk_unprepare warning during system
> suspend.
> 
> To fix the above issue and to enable proper clock-management, this patch
> enables runtim-pm and handles bam dma clocks in suspend/resume hooks if
> the clock node is present irrespective of controlled_remotely property.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


And from John on IRC:

Tested-by: John Stultz <john.stultz@linaro.org>

Regards,
Bjorn

> ---
> 
> v1->v2:
> 	- As per Shawn's suggestion, use devm_clk_get_optional to get the
> 	  bam clock if the "controlled_remotely" property is set so that
> 	  the clock code takes care of setting the bam clock to NULL if
> 	  not specified by dt. 
> 	- Remove the check for "controlled_remotely" property in
> 	  bam_dma_resume now that clock enable / disable is based on
> 	  whether bamclk is NULL or not.
> 	- Rebased to v5.11-rc5
> 
>  drivers/dma/qcom/bam_dma.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 88579857ca1d..c8a77b428b52 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1270,13 +1270,13 @@ static int bam_dma_probe(struct platform_device *pdev)
>  			dev_err(bdev->dev, "num-ees unspecified in dt\n");
>  	}
>  
> -	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
> -	if (IS_ERR(bdev->bamclk)) {
> -		if (!bdev->controlled_remotely)
> -			return PTR_ERR(bdev->bamclk);
> +	if (bdev->controlled_remotely)
> +		bdev->bamclk = devm_clk_get_optional(bdev->dev, "bam_clk");
> +	else
> +		bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
>  
> -		bdev->bamclk = NULL;
> -	}
> +	if (IS_ERR(bdev->bamclk))
> +		return PTR_ERR(bdev->bamclk);
>  
>  	ret = clk_prepare_enable(bdev->bamclk);
>  	if (ret) {
> @@ -1350,7 +1350,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unregister_dma;
>  
> -	if (bdev->controlled_remotely) {
> +	if (!bdev->bamclk) {
>  		pm_runtime_disable(&pdev->dev);
>  		return 0;
>  	}
> @@ -1438,10 +1438,10 @@ static int __maybe_unused bam_dma_suspend(struct device *dev)
>  {
>  	struct bam_device *bdev = dev_get_drvdata(dev);
>  
> -	if (!bdev->controlled_remotely)
> +	if (bdev->bamclk) {
>  		pm_runtime_force_suspend(dev);
> -
> -	clk_unprepare(bdev->bamclk);
> +		clk_unprepare(bdev->bamclk);
> +	}
>  
>  	return 0;
>  }
> @@ -1451,12 +1451,13 @@ static int __maybe_unused bam_dma_resume(struct device *dev)
>  	struct bam_device *bdev = dev_get_drvdata(dev);
>  	int ret;
>  
> -	ret = clk_prepare(bdev->bamclk);
> -	if (ret)
> -		return ret;
> +	if (bdev->bamclk) {
> +		ret = clk_prepare(bdev->bamclk);
> +		if (ret)
> +			return ret;
>  
> -	if (!bdev->controlled_remotely)
>  		pm_runtime_force_resume(dev);
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 

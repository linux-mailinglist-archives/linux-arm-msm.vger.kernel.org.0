Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594FD4523D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 02:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349575AbhKPBbS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 20:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243166AbhKOSze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 13:55:34 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1853BC014CCE
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 09:54:04 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so28759327otk.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mhDcbvt6bY3rEXESOl/FhsOyEe367fZY3QXfGILaNvI=;
        b=Z6rmlDsOcxgFoRoNBMeZ1HvqRdRwQM4Bm/MYZgzcMWEO4K0eqqceVPHOnYvzXQMmR4
         GQYfVOnwUZJk9CS384upCeRFikNOPefummYl2/nBlQKBNO2tzllRLlCiVyPR0yPwJOVp
         riAJnBmCW6k8lil79FwE3zGJzKdvCpJ1xLX46sgHOBiaSemOWTPySQC6xPH+7fp6OcoC
         aSG3bcrrlD+ltFKOf3CoWEwy9w4ODPlVT4U02nSHTCt+DxvxaaeFKhSrjwcNkRWZ0OHC
         MOa0yUH8IIzWEGkepaCf7JtTSdi81y2lhrgFiQNnNd7OItCMvA7M28kQ66l3aYfQYZof
         e/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mhDcbvt6bY3rEXESOl/FhsOyEe367fZY3QXfGILaNvI=;
        b=ICuif34aXOYALzaEpEBgwGatvl/573qthOHhDUvnJRpJFXA/+y1GjaoSeNRrfRcw44
         /lZ8iDG9HGid4LGtrVqR8gstT6kH1rwjMWoYle2YR8HwzEGr8xrNKBZMUJKbiP092Hfd
         8dgFW3XGGJKX2i2sqoEDHVURtmAeFKurfYTl/QMPEYAoN0/2zC26NuHwSbUiV1tVB9Pl
         qw1IAdcm/587hEuXNZqx36u6y6AZqjh56v/2jXt0JKMSCh30lEw2JJ20E2WdoPfz3/Ni
         BlZI0/Cs7Xi4nUq2HpIxhlcmRdqP+TIY0lEVbSnlvDxUgjCqH/8jkfs/EJ2CaAvyBXZV
         3mag==
X-Gm-Message-State: AOAM531cRLIhVlYrRCcDa+Kiwzhxabb5RAPJXTZNp5QHbPh2ezfk+tOG
        7jFWDMAKdIs5ehBE4ZKdwmu6wA==
X-Google-Smtp-Source: ABdhPJyBiYyqVKBocj5pSTyvXKNUgMK9jjO8jLchf1Sn2nZmxsbyAHbhkeaE2XGmykvafJ1IbuTjbg==
X-Received: by 2002:a05:6830:1ad2:: with SMTP id r18mr696349otc.308.1636998843371;
        Mon, 15 Nov 2021 09:54:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q6sm3250411oig.14.2021.11.15.09.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 09:54:03 -0800 (PST)
Date:   Mon, 15 Nov 2021 11:53:58 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH v5 13/22] dma: qcom: bam_dma: Add support to initialize
 interconnect path
Message-ID: <YZKetkkXYR5Vdz1w@builder.lan>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-14-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110105922.217895-14-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Nov 04:59 CST 2021, Bhupesh Sharma wrote:

> From: Thara Gopinath <thara.gopinath@linaro.org>
> 
> BAM dma engine associated with certain hardware blocks could require
> relevant interconnect pieces be initialized prior to the dma engine
> initialization. For e.g. crypto bam dma engine on sm8250. Such requirement
> is passed on to the bam dma driver from dt via the "interconnects"
> property.  Add support in bam_dma driver to check whether the interconnect
> path is accessible/enabled prior to attempting driver intializations.
> 

This patch acquires the path, presumably between BAM and DDR, but I
don't see that it actually do anything with it.

So if this makes sm8250 work I presume it's because you'll get probe
deferred until the interconnect provider is in place and it will hold
buses at max speed until sync_state - and then in runtime perhaps the
crypto driver hides the fact that BAM doesn't vote for its bandwidth?

I'm sceptical about hiding behind such circumstances, but at least the
commit message should be clear on what's going on - or you need cast
some bandwidth votes when the block is expected to transfer data.

> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> [Make header file inclusion alphabetical and use 'devm_of_icc_get()']
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

As Vladimir pointed out, the S-o-b of a patch should be read in
chronological order.

Please read the section about Developer's Certificate of Origin (link
below), it should make it clear why the specific order is important.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#developer-s-certificate-of-origin-1-1

> ---
>  drivers/dma/qcom/bam_dma.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c8a77b428b52..19fb17db467f 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -26,6 +26,7 @@
>  #include <linux/kernel.h>
>  #include <linux/io.h>
>  #include <linux/init.h>
> +#include <linux/interconnect.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
> @@ -392,6 +393,7 @@ struct bam_device {
>  	const struct reg_offset_data *layout;
>  
>  	struct clk *bamclk;
> +	struct icc_path *mem_path;
>  	int irq;
>  
>  	/* dma start transaction tasklet */
> @@ -1284,6 +1286,15 @@ static int bam_dma_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	/* Ensure that interconnects are initialized */
> +	bdev->mem_path = devm_of_icc_get(bdev->dev, "memory");
> +

Please drop this empty line.

> +	if (IS_ERR(bdev->mem_path)) {
> +		ret = PTR_ERR(bdev->mem_path);
> +		dev_err(bdev->dev, "failed to acquire icc path %d\n", ret);

We typically want to avoid printing error messages when ret is
-EPROBE_DEFER. The best way around this is to utilize the
dev_err_probe() helper function.

Replace the two lines above with:

		ret = dev_err_probe(bdev->dev, PTR_ERR(bdev->mem_path),
				    "failed to acquire icc path\n")

> +		goto err_disable_clk;

If you move the devm_of_icc_get() right before clk_prepare_enable()
(still after devm_clk_get*()) you can simply return dev_err_probe() -
and will avoid toggling the CE clock unnecessarily on EPROBE_DEFER.

Regards,
Bjorn

> +	}
> +
>  	ret = bam_init(bdev);
>  	if (ret)
>  		goto err_disable_clk;
> -- 
> 2.31.1
> 

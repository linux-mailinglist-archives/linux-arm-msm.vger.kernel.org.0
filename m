Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5734CA7936
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 05:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfIDDT3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 23:19:29 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34053 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfIDDT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 23:19:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so10409393pgc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2019 20:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=02+eBEQJWm6NHimkROpVhmoHyIo4/pLc4YR1Y2rVwOA=;
        b=CztmP3VrmOz2/mU3Ni+FHnjEZCeJ2OyXfo8+ajDcZ79r5MxkWd3rA4/inLzPD+RhqT
         G65tPOsl5mK/jUAMnnKUdXSuWwlD0EwrbbcevxYgEMrozddxtZpG38f2rD/pBHqu7oXj
         c4SIl4FK3haHY+7szeZAjmoG5DCsVHlOwdGVnBAAYn85mmhN35dlKeUKlU0V0uY2+4Gy
         sz80PAgfCcGbm83OjFv88AIjBatvvSx2zv+3Wzo62LaTgEwZKc9aDH+PM+luetMoRCpZ
         qMeyqHf2BuUAkkFuqNrWDU2PpD0b/cvL4gy5vXGj5BnyTLSLC7A6gWk8AevGxappaTEB
         vA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=02+eBEQJWm6NHimkROpVhmoHyIo4/pLc4YR1Y2rVwOA=;
        b=tDzbOpUZqFrL5mbIB5lUWgJ6FLSs3im7Y3YPQ3kd+mdgTWwoOiD6dgiUKMtCl2DRPs
         /mjxQ1YjGW5/WswGF9TgxW9jOKNTzWGRBfDxCbbWM9kzI4M/7E9h02SVN/eosvaNvULg
         jaxfYVVaAuJhA7KLOmvX1ibkgd2zdNy+r3N+fAU+cjeA4CCoUP5xNYj5F6MrCF39JqzI
         Q6Iw4Tt+Bae1mef0nPVqYTdH5y5XX3W2gDqme0asibQoHCVpWrZDT+O1kF0MtC2bckPb
         Zz3PZF8FG3jps+b4+W6chSuOLTQqQW+8DCVWZ79b69VZl8j+MX7o/WcJdWH0jdseZhBu
         ti+Q==
X-Gm-Message-State: APjAAAWDg8BonG5PvtUjRJBiCAzLyhkUaoMTrEZRGduDn1kEsADnsriw
        G3mzCO1k4Gw00tRBoApKy4uGEg==
X-Google-Smtp-Source: APXvYqxYWfllLFvx+G/2hfqNwK0phBdw0yYAbUV1JDKDDrpF5Cmiadx1YRaxQl3l2TCyAI6O/wjG9Q==
X-Received: by 2002:aa7:84d2:: with SMTP id x18mr5859554pfn.250.1567567165787;
        Tue, 03 Sep 2019 20:19:25 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 185sm21836340pfd.125.2019.09.03.20.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 20:19:25 -0700 (PDT)
Date:   Tue, 3 Sep 2019 20:19:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
Message-ID: <20190904031922.GC574@tuxbook-pro>
References: <20190903135052.13827-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903135052.13827-1-lee.jones@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 03 Sep 06:50 PDT 2019, Lee Jones wrote:

> When booting with ACPI, the Geni Serial Engine is not set as the I2C/SPI
> parent and thus, the wrapper (parent device) is unassigned.  This causes
> the kernel to crash with a null dereference error.
> 

Now I see what you did in 8bc529b25354; i.e. stubbed all the other calls
between the SE and wrapper.

Do you think it would be possible to resolve the _DEP link to QGP[01]
somehow? For the clocks workarounds this could be resolved by us
representing that relationship using device_link and just rely on
pm_runtime to propagate the clock state.

For the DMA operation, iiuc it's the wrapper that implements the DMA
engine involved, but I'm guessing the main reason for mapping buffers on
the wrapper is so that it ends up being associated with the iommu
context of the wrapper.

Are the SMMU contexts at all represented in the ACPI world and if so do
you know how the wrapper vs SEs are bound to contexts? Can we map on
se->dev when wrapper is NULL (or perhaps always?)?

Regards,
Bjorn

> Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
> Since we are already at -rc7 this patch should be processed ASAP - thank you.
> 
> drivers/soc/qcom/qcom-geni-se.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index d5cf953b4337..7d622ea1274e 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -630,6 +630,9 @@ int geni_se_tx_dma_prep(struct geni_se *se, void *buf, size_t len,
>  	struct geni_wrapper *wrapper = se->wrapper;
>  	u32 val;
>  
> +	if (!wrapper)
> +		return -EINVAL;
> +
>  	*iova = dma_map_single(wrapper->dev, buf, len, DMA_TO_DEVICE);
>  	if (dma_mapping_error(wrapper->dev, *iova))
>  		return -EIO;
> @@ -663,6 +666,9 @@ int geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len,
>  	struct geni_wrapper *wrapper = se->wrapper;
>  	u32 val;
>  
> +	if (!wrapper)
> +		return -EINVAL;
> +
>  	*iova = dma_map_single(wrapper->dev, buf, len, DMA_FROM_DEVICE);
>  	if (dma_mapping_error(wrapper->dev, *iova))
>  		return -EIO;
> -- 
> 2.17.1
> 

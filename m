Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFA1186F27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732013AbgCPPui (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:50:38 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46722 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731976AbgCPPui (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:50:38 -0400
Received: by mail-wr1-f67.google.com with SMTP id w16so5443048wrv.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ppucAR3jBSlUx3f6FMEJLnESjyE6tqFd9bVOCG9Ch70=;
        b=KWi+mz5Ml7txmdoZr19aVQmfuq4pxYfgRps9r2wW5ZsBdqZUhieYBFFgGOjP2Y6bx4
         Wyhz0sJVzU+ttJVQaciTpiR1C0VRxuyTIVO+dc22nAk47TiATbV0DDmHWZKNHrvm2d4C
         vUaa0hW1YGFbvsd4Uq2C+TXdm+UshPrNCJCR7kDzhdknhAK2c/faq2qcpOcTCILD4e73
         SanxGSnN9MZ59DsdmAjiBTz1XxdiLtNTzfhIHxG2HnSi1v3DnTsQ2LGv/Q8k3NkWXNkz
         QoSGyKn9pcROOSXjXbika5mVnv89BwzwPk4bOrNqAP29KhbsRRP7ajNL8l0XJVmaY1q3
         +MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ppucAR3jBSlUx3f6FMEJLnESjyE6tqFd9bVOCG9Ch70=;
        b=ijtAHZTjwoP5DojhnhUP6ZD57VjQm+FNEoCtc+qdSiF1kn7iy+J9a3csvFLJEeuwVC
         vTV1rEMyt13W8CJkHkEdf31jxq8MT+qt5WnRG24cu2VySDE42X1GVOa5ufcsaF071AEU
         fIS4SV9WCSk0yLFnWFFvHSjnBRXMh3rjPAWmOAIzkV8NHqvwBGThdiMU/yEp6LqVlMA0
         ZzT3UE8Azyz3ZTRxkUHFg8rQMrk3R/+VedcxOEEQY94afmvkl5KaFPhf6XJJotSYDgiz
         z+tekrVcwiTxIYhIkqxuiPXP29hQcLBPbjDAcomMqUXT5XiTa5l9VO6VxTvNqPpcsktM
         k3OA==
X-Gm-Message-State: ANhLgQ30npmeczPA9E9ul1Ho+MSepUy6r+kN3iTRslevubuBUg+OXrhn
        7r65aNz/wsmjhHyg1JTMHR6qbQ==
X-Google-Smtp-Source: ADFU+vvMLgpIudyWQDIKiFCwE2bd5t8QaZ3ZQI2eMwU4VsE9JIaD98F8TicbYAXHc+pSTvK+AYpoyA==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr43953wrn.62.1584373836280;
        Mon, 16 Mar 2020 08:50:36 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id p16sm147962wmg.22.2020.03.16.08.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:50:35 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:50:28 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH 11/15] iommu/renesas: Use accessor functions for iommu
 private data
Message-ID: <20200316155028.GK304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-12-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-12-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:25AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index ecb3f9464dd5..310cf09feea3 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -89,9 +89,7 @@ static struct ipmmu_vmsa_domain *to_vmsa_domain(struct iommu_domain *dom)
>  
>  static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -
> -	return fwspec ? fwspec->iommu_priv : NULL;
> +	return dev_iommu_priv_get(dev);

The removal of the fwspec NULL check was worrying me a little. Now any
user of to_ipmmu() directly dereferences dev->iommu->priv where they
previously tested first whether dev->fwspec was set. But I didn't find
anything that could go wrong, and the resulting code looks better.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  }
>  
>  #define TLB_LOOP_TIMEOUT		100	/* 100us */
> @@ -727,14 +725,13 @@ static phys_addr_t ipmmu_iova_to_phys(struct iommu_domain *io_domain,
>  static int ipmmu_init_platform_device(struct device *dev,
>  				      struct of_phandle_args *args)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct platform_device *ipmmu_pdev;
>  
>  	ipmmu_pdev = of_find_device_by_node(args->np);
>  	if (!ipmmu_pdev)
>  		return -ENODEV;
>  
> -	fwspec->iommu_priv = platform_get_drvdata(ipmmu_pdev);
> +	dev_iommu_priv_set(dev, platform_get_drvdata(ipmmu_pdev));
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 

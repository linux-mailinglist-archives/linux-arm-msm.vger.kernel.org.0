Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA321B1EBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 08:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgDUG10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 02:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725902AbgDUG1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 02:27:24 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78758C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 23:27:24 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b8so6165340pfp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ItLAaZdoAzbCoICUWTP9TcNALvTc0h1pIV9P1xavhUA=;
        b=QAAPsgB6LGNfdJxsYgUw/r5C02aoGIW1d54kAilaLoqYc5p0OzaqKTClJcj0vXEZ+0
         Xv8nRG/YTWCW9me8SGEX6Qhfd0Z+voyvzg7N1pSNRnz912u6frRmkEb8+yeLsgfGLV3F
         ywDoqR7qg4tJBKNip4WWvpP+Q7a9riTa7WVGnKfzuwGpoLxRzeLSXcoCGJ7CLOCmHRC9
         Pu27qvzrzUMJIv+M0pnmWfjrEIh20zJrbpSH9/LkLxRJDn+bx+uVvNM/D383oRSNs/Ab
         PiI9L3yoviofLqbLTrFsxQhohP1Z/q4AnnH+mxRjHL1bDpOAbmHARoRUOP0qJ4RoKvNt
         boCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ItLAaZdoAzbCoICUWTP9TcNALvTc0h1pIV9P1xavhUA=;
        b=PXl6TQbdNoOW6gSBBuO9toWEpiVfwXTo/6ACjeKvu34wx5JOn5E/XUlKuBLXvU+HbO
         Y53K/YdVB0t/xquX7L/TpAe0NNlIr1ovRgSETtBCR4eago4PKmMkPXk2MT5Sc23fpB1a
         vDx3LUhyf7Tt8AdtZVbaKsuv330OLErT5GAFubL0TmNz27esLaYd/F+R3inOGhlm0rwh
         23MlBVFx4uHXV12icKGs5PcgzjqU9Zw5ge/kT0Dtfnd1xpZMalC1GwwV8QJa+M842Lcs
         SLl1LogQGSYdxvXOUUz2GZrVy5vs7xs7sjwyB3r6Q8IBj8d6omr8SfQhjOX+dwoftt5s
         DjPA==
X-Gm-Message-State: AGi0Pub+h1URp0ugQGXjd/Si+KRI+CuT+39jzDxlLHgJu92NXHp4IFTl
        548BWKyTBZ8cobqmaqtkUhp99w==
X-Google-Smtp-Source: APiQypLXy8wJC4EOMQyacziDOJqdQFE5vX07c9y+80D/pQiP3GeEE9SW37iHHaA2tCT2rIGIfXcM9A==
X-Received: by 2002:aa7:80d5:: with SMTP id a21mr19876930pfn.49.1587450443775;
        Mon, 20 Apr 2020 23:27:23 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o1sm1283323pjs.39.2020.04.20.23.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 23:27:23 -0700 (PDT)
Date:   Mon, 20 Apr 2020 23:27:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     agross@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom_scm: fix bogous abuse of dma-direct
 internals
Message-ID: <20200421062747.GU576963@builder.lan>
References: <20200414123136.441454-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414123136.441454-1-hch@lst.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Apr 05:31 PDT 2020, Christoph Hellwig wrote:

> As far as the device is concerned the dma address is the physical
> address.  There is no need to convert it to a physical address,
> especially not using dma-direct internals that are not available
> to drivers and which will interact badly with IOMMUs.  Last but not
> least the commit introducing it claimed to just fix a type issue,
> but actually changed behavior.
> 
> Fixes: 6e37ccf78a532 ("firmware: qcom_scm: Use proper types for dma mappings")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

and applied.

Thanks,
Bjorn

> ---
>  drivers/firmware/qcom_scm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 059bb0fbae9e..4701487573f7 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -6,7 +6,6 @@
>  #include <linux/init.h>
>  #include <linux/cpumask.h>
>  #include <linux/export.h>
> -#include <linux/dma-direct.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
> @@ -806,8 +805,7 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  	struct qcom_scm_mem_map_info *mem_to_map;
>  	phys_addr_t mem_to_map_phys;
>  	phys_addr_t dest_phys;
> -	phys_addr_t ptr_phys;
> -	dma_addr_t ptr_dma;
> +	dma_addr_t ptr_phys;
>  	size_t mem_to_map_sz;
>  	size_t dest_sz;
>  	size_t src_sz;
> @@ -824,10 +822,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
>  			ALIGN(dest_sz, SZ_64);
>  
> -	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_dma, GFP_KERNEL);
> +	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
>  	if (!ptr)
>  		return -ENOMEM;
> -	ptr_phys = dma_to_phys(__scm->dev, ptr_dma);
>  
>  	/* Fill source vmid detail */
>  	src = ptr;
> @@ -855,7 +852,7 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  
>  	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
>  				    ptr_phys, src_sz, dest_phys, dest_sz);
> -	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_dma);
> +	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_phys);
>  	if (ret) {
>  		dev_err(__scm->dev,
>  			"Assign memory protection call failed %d\n", ret);
> -- 
> 2.25.1
> 

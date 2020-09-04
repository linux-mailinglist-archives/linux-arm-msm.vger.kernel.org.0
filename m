Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9FC25DC82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 16:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730343AbgIDO4z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 10:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbgIDO4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 10:56:53 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773A4C061245
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 07:56:53 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x14so6752179oic.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 07:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0Mo/v5jxgawkurDBpjpN2qi+oLCVBtcMh+QdJRmGmC4=;
        b=WGIFCYDT8CRCtQ34wHex6hXCDluurGCJa3w4AkzyVk0GXJbLwESX/5XbuXcKjvT8N3
         av8bx1MeV/SaQN+ZOlb7qFWHSI0qxIXOkGH5oAomvp176LzBk8EwBco/K4xJ7N2CHPvR
         l78X98kfSWzS8Mb+xbWd6PX4EU1Ln8VoLwUxQRBOuoDb+KsPgPhaT2HK/0FXY5U770sS
         6GEYCWpoUOHwuTVuvcH4H889ef2zYwaFB7ECFgOsJyCSm11Y35uB+UuJxRvdPhqgY6aE
         h5yInJeIAddXfopuwpA+YFS/6Bw6EFCl03h80cqH+/6l3/v+4GBxY7Wtsa92V2R6ldDw
         KQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Mo/v5jxgawkurDBpjpN2qi+oLCVBtcMh+QdJRmGmC4=;
        b=dyl+nAVCeoj1J/YqSGQ+aaNsvtUdSySGt4C0+3xFY5JA3aQ+m452L6D11waC9r4hrn
         ndT/0W0W3a7Pf2QPkY/p3kL5A4Vw3t+I4Kmno4oCMsTI/vnixpj1nwq3bFM1u5T8az5J
         LCFPSjfjlyvH/qhGzN5loc2AMYIz8YMaTE2o5sNOh6cPCsaJ13tt1m54fQ3da4SAm8Wn
         Y6/ik3fQ41npMzFI0zF3e/r6XJwRWNXNqedAWKNX14/cSmkwSYQCnrtVLFZttjF826Xb
         eQnwG+sZ4ECFqFhU7Go96zCYZ8jilwyRrBuIiT2KW9AJgxo9XkpnVs6vjd+p9H+r3E4m
         YPmQ==
X-Gm-Message-State: AOAM531K4HIR0LafG6A3TVYXuBZWzB0q3QCxBciPHQczTQiHT6jAASBP
        qa5i2lVX8ZRrnqyi6XgbJEMBBw==
X-Google-Smtp-Source: ABdhPJw0xU7yFG+isOKSFALWMtnoTpyCMAhFMwZRM1IImZBhy97nf7rrjzCpAyMnItrX18B/OriewQ==
X-Received: by 2002:aca:1a02:: with SMTP id a2mr5751516oia.60.1599231412795;
        Fri, 04 Sep 2020 07:56:52 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id t7sm272863ooq.0.2020.09.04.07.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 07:56:52 -0700 (PDT)
Date:   Fri, 4 Sep 2020 09:56:49 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] iommu: intel: Drop kerneldoc marker from regular
 comment
Message-ID: <20200904145649.GF3715@yoga>
References: <20200728170859.28143-1-krzk@kernel.org>
 <20200728170859.28143-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728170859.28143-2-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Jul 12:08 CDT 2020, Krzysztof Kozlowski wrote:

> Fix W=1 compile warnings (invalid kerneldoc):
> 
>     drivers/iommu/intel/dmar.c:389: warning: Function parameter or member 'header' not described in 'dmar_parse_one_drhd'
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iommu/intel/dmar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index 93e6345f3414..ba47edf03941 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -380,7 +380,7 @@ dmar_find_dmaru(struct acpi_dmar_hardware_unit *drhd)
>  	return NULL;
>  }
>  
> -/**
> +/*
>   * dmar_parse_one_drhd - parses exactly one DMA remapping hardware definition
>   * structure which uniquely represent one DMA remapping hardware unit
>   * present in the platform
> -- 
> 2.17.1
> 

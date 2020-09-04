Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B03225DC89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 16:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbgIDO52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 10:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730220AbgIDO5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 10:57:21 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD41C061246
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 07:57:21 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id i17so6745745oig.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 07:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qwFik1VzdKihmwo9cBFiJu4/LHOZM7jcNFKIFxCkxKI=;
        b=Fztru+AcSdmnH4CC8rxLvREYY+3FnzSn/ADUlvE9QHLdsNufk+8airPBlRopYAXGZi
         WCWOp+fAniCaCE9hnf4aHgTv4nxT3TalwNn/was1jOdR4nMkqkj7JPDUw2oyjJVvVIZF
         OWez32qjH0GG49gsNb2e3JfUKu3s5t/t4LYTcdecijZ5TU/gEN/3Sl3LV7QRzlr+vUO6
         OEQ7lmcX2ZS8UR0zTom9PODEWA5BYGsdR0quvf6xHlRjQeRh0IH8Zv8Da2nW70zXxphz
         DSAnBe7FBH+aaAIXpSkGvQDzUh8cseeGaUhyo4fm0SkedJjh0eAgLE2XLKp3BTcbqdXW
         0tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qwFik1VzdKihmwo9cBFiJu4/LHOZM7jcNFKIFxCkxKI=;
        b=baH1lX79FhDWbulRsHP3a+kXrd6IljXUP2iJcJqw8aMNPwXYW4tcev1pe2w1qZcc5K
         QC9Bgc+RB69iTZdzf+PmT4Wv89WUtqcfAV7zzEDvoej00UFj60zVKVXs95jglLgia97i
         hP+Ny9QomyqYmFS7xO/fUJGC5eXcb8DLZcWpMNI+6hiSFPOnqxz8fGjMid0RGBFLAwaQ
         aUfztpSupVVOb6gBtPJ8m1KGyBCZ6+2p07FdMfCR8a3BG+N7YW8v0ZR4zi7tWd49587e
         XGyYEg1Fc9x4U7PXbgEkyvKNKSYl5Zb079Olm3bltlEMWadojNxz9lt4hJJKNAKjDWcM
         foFA==
X-Gm-Message-State: AOAM530SJ2lv+jr1cr58LCKKqRiBPDti6aaLfCAyiKvrMUEvy+8fyke7
        mGWV4M5gwxTuZr5q9rSbZD1Eiw==
X-Google-Smtp-Source: ABdhPJzzr7V6Q+NFlUzi14ObzhGd5ZRKlNLTeyLYhw4G1XLnZ9tYm6XUMbNPBt9t8yqwGyX7v7ttqQ==
X-Received: by 2002:aca:5e82:: with SMTP id s124mr5266539oib.168.1599231440721;
        Fri, 04 Sep 2020 07:57:20 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id n61sm1227108otn.34.2020.09.04.07.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 07:57:20 -0700 (PDT)
Date:   Fri, 4 Sep 2020 09:57:17 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] iommu: amd: Fix kerneldoc
Message-ID: <20200904145717.GG3715@yoga>
References: <20200728170859.28143-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728170859.28143-1-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Jul 12:08 CDT 2020, Krzysztof Kozlowski wrote:

> Fix W=1 compile warnings (invalid kerneldoc):
> 
>     drivers/iommu/amd/init.c:1586: warning: Function parameter or member 'ivrs' not described in 'get_highest_supported_ivhd_type'
>     drivers/iommu/amd/init.c:1938: warning: Function parameter or member 'iommu' not described in 'iommu_update_intcapxt'
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iommu/amd/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index 958050c213f9..4a37169b1b1b 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -1578,7 +1578,7 @@ static int __init init_iommu_one(struct amd_iommu *iommu, struct ivhd_header *h)
>  
>  /**
>   * get_highest_supported_ivhd_type - Look up the appropriate IVHD type
> - * @ivrs          Pointer to the IVRS header
> + * @ivrs: Pointer to the IVRS header
>   *
>   * This function search through all IVDB of the maximum supported IVHD
>   */
> @@ -1929,7 +1929,7 @@ static int iommu_setup_msi(struct amd_iommu *iommu)
>  #define XT_INT_VEC(x)		(((x) & 0xFFULL) << 32)
>  #define XT_INT_DEST_HI(x)	((((x) >> 24) & 0xFFULL) << 56)
>  
> -/**
> +/*
>   * Setup the IntCapXT registers with interrupt routing information
>   * based on the PCI MSI capability block registers, accessed via
>   * MMIO MSI address low/hi and MSI data registers.
> -- 
> 2.17.1
> 

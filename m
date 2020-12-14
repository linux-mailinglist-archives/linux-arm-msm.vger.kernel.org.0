Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873C22D9C7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 17:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440251AbgLNQWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 11:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440253AbgLNQW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 11:22:27 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661A5C0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 08:21:47 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id q25so19737681oij.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 08:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dypRW42Ag7SaNLUbf+uRP+IPcXW54P4LYSzuOs3g98U=;
        b=YUpN5dXm3OUT+XIzfFv0/IsmZDizXudCOrliTwPuAwdNhNisqhZHrinOtRIsBM+Pci
         KUd191tAFdQgNa8BuTyJdi89g2JmKTlm98C5axup3HYhao4ko9xKSrzDEOq3KwWNYnFq
         B3SWlKDwYV5QpeEqru6dF8bLBOgBpt6Of+DjlDnbbh/YaX3hNEQNRDL+3lCHSxHJwXcs
         vF//zSrAvlVhDG9jQX6RWMWQkceoV38s+amNbh7HMpqaUy/eENJ4yMEz5iMpQV6rnNQK
         y0DCREvCBXKnFwcFeuCFKfDC/zbnM3IOIy3heJeztRYf1vqdvhXZqms1or0xbJuhee1o
         Qs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dypRW42Ag7SaNLUbf+uRP+IPcXW54P4LYSzuOs3g98U=;
        b=PrFye7gLwd4A8VXgB2CJMH5Nhj/EDM01DanLnZGNOxcLCCXH1Z/447B1kOzqtTAcyr
         AtLGsDWVDWqgZo0z+7MKC9Qms0fOKJsdQqDyvmk6McubgoXn6F1F/Kty7rjoxftTOADY
         /klFzIxfSejgIVDIbqW4uo96ePH+pCCeCgwB0C14hqwE0nAJGNqiTnHD2WIi9zlWeL7o
         C18ym0/1vjsFrwgDlCTE+S9tHFRP+vponkw1kBPUeggeKiytnQ334L+TnUwGkjjGLgZd
         h5Siv1UVeDf/eZqnTT1vHWuT9fknFHwunQZWevT+sfyiqDLvcvA0z7eFe0UF+5n+xehL
         mNqQ==
X-Gm-Message-State: AOAM530PfcBkFfNpYEAWIFvdcWdVZgni/269MYcFsKJaS4UOCbVS2AbB
        3Hcup2aH8+2Qhk17AQrWP/o83TvrzEMA3w==
X-Google-Smtp-Source: ABdhPJytx4fAQVDhA0UmXOWYQZ4w31/WKetaPmA3PWn5pcAwVbQgOFRfKCsJK7iHTnq3U5Vymw2H7w==
X-Received: by 2002:aca:ed51:: with SMTP id l78mr2098851oih.144.1607962906753;
        Mon, 14 Dec 2020 08:21:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k71sm4180810otk.48.2020.12.14.08.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 08:21:45 -0800 (PST)
Date:   Mon, 14 Dec 2020 10:21:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     agross@kernel.org, joro@8bytes.org, will@kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] iommu: msm_iommu: Delete useless kfree code
Message-ID: <X9eRGFup8LqSejsp@builder.lan>
References: <20201214134746.5044-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214134746.5044-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 14 Dec 07:47 CST 2020, Zheng Yongjun wrote:

> The parameter of kfree function is NULL, so kfree code is useless, delete it.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/msm_iommu.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 3615cd6241c4..1286674a1322 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -319,7 +319,7 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
>  
>  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> -		goto fail_nomem;
> +		return NULL;
>  
>  	INIT_LIST_HEAD(&priv->list_attached);
>  
> @@ -328,10 +328,6 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
>  	priv->domain.geometry.force_aperture = true;
>  
>  	return &priv->domain;
> -
> -fail_nomem:
> -	kfree(priv);
> -	return NULL;
>  }
>  
>  static void msm_iommu_domain_free(struct iommu_domain *domain)
> -- 
> 2.22.0
> 

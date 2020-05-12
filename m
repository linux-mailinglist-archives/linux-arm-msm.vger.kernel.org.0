Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84E31CEC7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 07:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELFll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 01:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725933AbgELFlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 01:41:40 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5791C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 22:41:40 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j21so5642534pgb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 22:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d3pM/Dyxuk8f8jV5C8y4lxDkycZGVCo+a29+hT7GDn8=;
        b=Pwq8HShOoEzwpj3h4Z2GIyav26gGErQQ5WACO+rZuY1f7UHBsSeweImNHvFTmwUu+3
         RtPex/zc6nGXKFOSDhiPYBQvoO8wzf3lrrZ4Q0mekaNJs/8CR6xLPZh+wLHp0Gyd9Pvx
         QRQj8wnuoP0fKCg5vPmAFKsJIziKrif1enlKLHaH1vkudYaKCzVmNlgcree26/ynY7d7
         rWZG0Fp9p2lsh3xcVB5/waAsty2XByE5+mW9SrW9SzIXcj10imYgrlhwXa4tJyFg0hh5
         rR3XtQtcDHcO+jVEbcqSUd0K55s74l1VokXaBhfFgthdrnHEqTRknjqB21L3NUEKk/vY
         hCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d3pM/Dyxuk8f8jV5C8y4lxDkycZGVCo+a29+hT7GDn8=;
        b=tOc6v6TzF2817Rqbqwgyf8CDAlERg60jtSpB2BkvWKvPOoIGvKcYKPl7nYnj27FjgU
         /KvnMCzKwZVmnC9hWgyOqg8CLdHyEjYVukQarg02I+G235gSWtO0xvb+oBwp3jDRdC7g
         g1shGJBzUgFVitVQohHW6H5CxgJdI8FNqJbkPKViYFhPAbQtR2psGimKSjqOF2Zp3Y9/
         3S3Wtn5F94bPD5dJHAbrjxJMB42JR3s6MHNh5kQHySMfeKSOkB5LEumpt2HXaFPZNmtr
         zgLNNFzumtN9Qainb+7Y1Q8G00v46dx0VTxdaCIv/RNp8QJw59viarCGfS0aSoWUjsdY
         ut/Q==
X-Gm-Message-State: AGi0PuapXNlJjLPCdrwoHmP08Wmgwl9U79k4RBUldgvUCrBomADB5+c3
        imA9efjROcimgmzt7aNiaI6BAA==
X-Google-Smtp-Source: APiQypJKtsy5n1xHuqBuAnAZAju4AgPcTdVCfwg0NsY3d395BxTqYBF2Ss/gmJPySFaJazTsGI45gA==
X-Received: by 2002:a62:808d:: with SMTP id j135mr18779432pfd.53.1589262099940;
        Mon, 11 May 2020 22:41:39 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h11sm10684616pfo.120.2020.05.11.22.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 22:41:39 -0700 (PDT)
Date:   Mon, 11 May 2020 22:41:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Samuel Zou <zou_wei@huawei.com>
Cc:     agross@kernel.org, joro@8bytes.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] iommu/msm: Make msm_iommu_lock static
Message-ID: <20200512054137.GI1302550@yoga>
References: <1589249839-105820-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589249839-105820-1-git-send-email-zou_wei@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 May 19:17 PDT 2020, Samuel Zou wrote:

> Fix the following sparse warning:
> 
> drivers/iommu/msm_iommu.c:37:1: warning: symbol 'msm_iommu_lock' was not declared.
> 
> The msm_iommu_lock has only call site within msm_iommu.c
> It should be static
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: 0720d1f052dc ("msm: Add MSM IOMMU support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>
> ---
>  drivers/iommu/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 10cd4db..3d8a635 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -34,7 +34,7 @@ __asm__ __volatile__ (							\
>  /* bitmap of the page sizes currently supported */
>  #define MSM_IOMMU_PGSIZES	(SZ_4K | SZ_64K | SZ_1M | SZ_16M)
>  
> -DEFINE_SPINLOCK(msm_iommu_lock);
> +static DEFINE_SPINLOCK(msm_iommu_lock);
>  static LIST_HEAD(qcom_iommu_devices);
>  static struct iommu_ops msm_iommu_ops;
>  
> -- 
> 2.6.2
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E753D6D39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 06:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbhG0EX1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 00:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhG0EXZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 00:23:25 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549B7C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 21:23:25 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id l126so13736178oib.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 21:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3OGxreqSYiCQ6F45TDhW+5/bOakeByAhZId0DwbZLFY=;
        b=Cu9WE6gTgrDrbfG/7huXX4zjgVCFoaewK/ubY8YVbEw+pdV24B9VEEicGF6ietqskH
         XWPdtgUWeOqM+wJ91qrA6B1nG4G7Pas/YUs+K4xTb0Zywz3SBNkpU2wBa0dq0i4LB1a/
         kOJ+wlDN1TylVh5ikUMrkbPiOzrauHoteIQxult2xwMcBjdilMPBvB0MRL+Z+hVljwBP
         r+Jff4Ljim0wqvra97JE1B7cit4K1D89oUHgW9DNCl0Vd0ulCOGk/lenMktXPQF9E2qw
         3lP50zysI8+Qu6LC8SpJ2tQc69/ZcCWa/i843THRD+oJu8TnvgdDt3fjGzBNEET173yy
         SJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3OGxreqSYiCQ6F45TDhW+5/bOakeByAhZId0DwbZLFY=;
        b=nd9Jb8in+xEI9j6isTIZauQXo/QAioMb2Ao7+vmbDO2om8TQOmOE++0ffxw6uprT+j
         F0Hyy1dWhdL3ojnu9FL3joTHdTKne/YC5cjipQcprnF/n6hkcqWtdQhCV6oyqMlkT4Ze
         YTfE8TxYdhehpUl1ytgkb9GdtvrxcmAHJUW+NpoR5ZucZcSi2GA8t43YIkhUL/PZavlG
         zxNvsatbZiq6rVk98d+C5bYhK5ZNOOVBWjm53YDiHgTX2hUq1/WZU/FttJ65dasVEkC9
         5Xj3kbJkcCJu7Ozpem10cQDbq8b68NJ1ZHrdImNSWuzWSABT0LQo0FIcWrYezVQiUQ/v
         x6yg==
X-Gm-Message-State: AOAM530NB1H1wwbUiDoXC7ACQa5empjyN+awfN81AiV5U6+YCNweVaJ+
        welEFy5XR/DYuA7H/J7Y96+1Ng==
X-Google-Smtp-Source: ABdhPJxFkjDkkgtmxrW1rMQURoIsDurVgUwq+//KYrhZXH8xIW+9cCCtPKmg6OVUWFT2EiIxjzl/0w==
X-Received: by 2002:a05:6808:8cd:: with SMTP id k13mr1633129oij.42.1627359804717;
        Mon, 26 Jul 2021 21:23:24 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z6sm391592oiz.39.2021.07.26.21.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 21:23:24 -0700 (PDT)
Date:   Mon, 26 Jul 2021 21:21:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix display fault handling
Message-ID: <YP+JzyDwp4MpXdv4@ripper>
References: <20210707180113.840741-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707180113.840741-1-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Jul 11:01 PDT 2021, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> It turns out that when the display is enabled by the bootloader, we can
> get some transient iommu faults from the display.  Which doesn't go over
> too well when we install a fault handler that is gpu specific.  To avoid
> this, defer installing the fault handler until we get around to setting
> up per-process pgtables (which is adreno_smmu specific).  The arm-smmu
> fallback error reporting is sufficient for reporting display related
> faults (and in fact was all we had prior to f8f934c180f629bb927a04fd90d)
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Fixes: 2a574cc05d38 ("drm/msm: Improve the a6xx page fault handler")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: John Stultz <john.stultz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index eed2a762e9dd..bcaddbba564d 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -142,6 +142,9 @@ static const struct iommu_flush_ops null_tlb_ops = {
>  	.tlb_add_page = msm_iommu_tlb_add_page,
>  };
>  
> +static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> +		unsigned long iova, int flags, void *arg);
> +
>  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  {
>  	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
> @@ -157,6 +160,13 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>  	if (!ttbr1_cfg)
>  		return ERR_PTR(-ENODEV);
>  
> +	/*
> +	 * Defer setting the fault handler until we have a valid adreno_smmu
> +	 * to avoid accidentially installing a GPU specific fault handler for
> +	 * the display's iommu
> +	 */
> +	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
> +
>  	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
>  	if (!pagetable)
>  		return ERR_PTR(-ENOMEM);
> @@ -300,7 +310,6 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>  
>  	iommu->domain = domain;
>  	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
> -	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
>  
>  	atomic_set(&iommu->pagetables, 0);
>  
> -- 
> 2.31.1
> 

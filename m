Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF0B186ECC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731554AbgCPPmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:42:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46498 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731564AbgCPPmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:42:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id w16so5408176wrv.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EuH2JuinWmp99M5kgpRBVbGMWPMpSteTL2l8ALHXOxA=;
        b=SuBjR7SXVaKqCALkd1H8UtvNwExNZJ6zJgrMM6mOmR/V8duV2z/Ny/rgwl/ICWYmHv
         RWBK+M3PyiJlb3+IMItQHsDQF5jSLhvuAHwNcv6LMVHk4wOfYJKCJcuzotqrz3dAGYH1
         ZoMfxYPhj1aGisNVytbbz16FGd19F/GLWWKqmyz5QVUWCH852OZkHrnPPIWPrqC4neyS
         a7v3wobNSSlJVCWjnzCdEU/vJKwAqNo9QlJDdZZzhe6JJt9HI/Adz/aIlbUVRlVc5+r/
         Wh3K+T1U8mRgzEN73lsQyDrC/jgt58bTBPttxWkvcuF/uHNDyFjl6FzCmQvD6Dy4PO5f
         8Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EuH2JuinWmp99M5kgpRBVbGMWPMpSteTL2l8ALHXOxA=;
        b=MHJdq56pU1dT97Xc4dWf5a3BB6Yvk6rzlG0WIUAzuTZPTf7vWIEECs+Uc+mT36pYZk
         VavpHUduSVtCw/jKYZQ8knCb0vhHctztorGOjFACjetU15+oYKoqWkUPKoQ3XQfuqbfe
         LIVw3x8GobaL99n4Oo+QzQCW4KVQepOrHql+efhFNRUa69tjDO2r4EKaftboWtIih14N
         aqygrw8LEZV9ryMFSRj+lmcNE9yPSXl52MoLsgkwefnsughbuwVwSfrhJtzBPnlxrRtJ
         pYeg7Ffy6FRbJcN0rsfGsydHq5yCisLT+Fiv7XxQS0UCsnnQPxOOQUWt5AGR8uwTuagU
         kIWA==
X-Gm-Message-State: ANhLgQ2JltO/yDZ+8V6jNOSxljQInZsWTx+3+aboZrRDZBVzHOk+/GpJ
        78HIGvgYV5Z5Crg1oUtvJTBE8g==
X-Google-Smtp-Source: ADFU+vtvdsyytNA9HXn2kU8Gc/Wj/vUyTOW35SEjh5aHAlAPKupONXAmkHYxA+n8rH6jwZStjuAuGg==
X-Received: by 2002:adf:9e8b:: with SMTP id a11mr9088wrf.32.1584373337353;
        Mon, 16 Mar 2020 08:42:17 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id y80sm85174wmc.45.2020.03.16.08.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:42:16 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:42:09 +0100
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
Subject: Re: [PATCH 03/15] drm/msm/mdp5: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200316154209.GD304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-4-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-4-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:17AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index e43ecd4be10a..1252e1d76340 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -725,7 +725,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>  
>  	if (config->platform.iommu) {
>  		iommu_dev = &pdev->dev;
> -		if (!iommu_dev->iommu_fwspec)
> +		if (!dev_iommu_fwspec_get(iommu_dev))
>  			iommu_dev = iommu_dev->parent;
>  
>  		aspace = msm_gem_address_space_create(iommu_dev,
> -- 
> 2.17.1
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85010186F1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731555AbgCPPt7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:49:59 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37615 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731903AbgCPPt7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:49:59 -0400
Received: by mail-wm1-f67.google.com with SMTP id a141so18638864wme.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cOIEYtWNEzlYYthtD0spEjkukXqfmxlfoFYyEio2yD4=;
        b=bLP9tzXHgsnZOO+gQY30NTwMxHujM+PxDf2Pr2BsRs9UN3PNl67882FriKQhyCzQBr
         TQvoYRDzZIEuZjT7HWvj9ryRh0wafj4b7mSPg86iUfXDu3MNCvfAIbQ4I6SS/cLilfBh
         zMVdnQIcxINkndSo9MyT7JC/g4ws4131+16aS9y6jaXhUaO7tb8k1sGg+cmElZUSjHvf
         nKD3AWMMSBYWgumDkjJNP77sHEVHIJpLXozOmkpGlN6fzZlvjPS6WDKFGpj2t6vQjwFm
         6iyRvLJuu8HH4z1PQSOJsYFBsODpIu2hXolpCRed+/OXwkJGe0xQdQ4Mvpx9JFxwkUU9
         wcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cOIEYtWNEzlYYthtD0spEjkukXqfmxlfoFYyEio2yD4=;
        b=pV0qvLAiqDS45rq6+vsWQrPnqCvHZC1StuETqJlexLz6rYTZvu1iXMBWWtQDkftxhS
         9IeYD7gDxGIccRcTNRoUglJImmXZwtSDMq0hVmJaiIhhB1HyU//L+k7i+wPzNrNuPfta
         df/vOPEruxbbDAC9ie+sFPVz3JFEmTniEG3+VyvUPQP9NNizKmnrYq6Jad9p7tS3glyr
         /ZGE/pwb7No4WhGNoaPkx1qmNEQgFyCuN2DuDpN35HlEE7QCRiMWIY3YnNTrRRYFaifI
         HD/ov8GfjMzupqTLIxwdZiC0lcKW+Ty0+uIcnteDHU/nLwzJCaztrghSHktP8JoaV2m7
         1EDw==
X-Gm-Message-State: ANhLgQ3FCtKjb7OzxJy6SzJ/rbojJ8rhr3H/YGZ31unR6pKyF+1mBH0k
        Rhf2N6ne9Kt49gmHcHD4RklsSw==
X-Google-Smtp-Source: ADFU+vv4N7xQNm1wFNrIZmN2Kg+Ua4DIBj8t6C6sgaFA18dYvUkMu368tWpVIaA4w1ORNN6r5eo5hg==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr28123545wmc.67.1584373796917;
        Mon, 16 Mar 2020 08:49:56 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id 9sm127395wmx.32.2020.03.16.08.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:49:56 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:49:48 +0100
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
Subject: Re: [PATCH 09/15] iommu/arm-smmu-v3: Use accessor functions for
 iommu private data
Message-ID: <20200316154948.GJ304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-10-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-10-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:23AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions in the code.
> 
> Tested-by: Hanjun Guo <guohanjun@huawei.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/arm-smmu-v3.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index aa3ac2a03807..2b68498dfb66 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -2659,7 +2659,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  	if (!fwspec)
>  		return -ENOENT;
>  
> -	master = fwspec->iommu_priv;
> +	master = dev_iommu_priv_get(dev);
>  	smmu = master->smmu;
>  
>  	arm_smmu_detach_dev(master);
> @@ -2795,7 +2795,7 @@ static int arm_smmu_add_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &arm_smmu_ops)
>  		return -ENODEV;
>  
> -	if (WARN_ON_ONCE(fwspec->iommu_priv))
> +	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
>  		return -EBUSY;
>  
>  	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
> @@ -2810,7 +2810,7 @@ static int arm_smmu_add_device(struct device *dev)
>  	master->smmu = smmu;
>  	master->sids = fwspec->ids;
>  	master->num_sids = fwspec->num_ids;
> -	fwspec->iommu_priv = master;
> +	dev_iommu_priv_set(dev, master);
>  
>  	/* Check the SIDs are in range of the SMMU and our stream table */
>  	for (i = 0; i < master->num_sids; i++) {
> @@ -2852,7 +2852,7 @@ static int arm_smmu_add_device(struct device *dev)
>  	iommu_device_unlink(&smmu->iommu, dev);
>  err_free_master:
>  	kfree(master);
> -	fwspec->iommu_priv = NULL;
> +	dev_iommu_priv_set(dev, NULL);
>  	return ret;
>  }
>  
> @@ -2865,7 +2865,7 @@ static void arm_smmu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &arm_smmu_ops)
>  		return;
>  
> -	master = fwspec->iommu_priv;
> +	master = dev_iommu_priv_get(dev);
>  	smmu = master->smmu;
>  	arm_smmu_detach_dev(master);
>  	iommu_group_remove_device(dev);
> -- 
> 2.17.1
> 

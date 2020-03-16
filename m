Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0DB1186EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731860AbgCPPrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:47:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35377 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731796AbgCPPrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:47:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id m3so18638571wmi.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3QMtJyHMdj2d3NlJHtXdRPjzJsxucKLnz+qn2QRFOx0=;
        b=oh5r2acFcKirM1Z60N97UiPELuL4YbxB+3thPoKh00c2cXA7zBnMrcg9MocIgrcoCL
         U05LP/VCBy/GD0AL9aNluQa4QCsCZCtQYprWO7EIyPc9RAWGZvVCsle+UbSRXH9Gkm/0
         KZJWytpT98u58L3kNWY/rNnStqJF3aq2+Ox1CNzi2Q+F03eOgvegXRb9TavYC+TyVBSt
         M/gQ9g1WL/OSC5hfVtxCTgHT3DFmQq6BKeS3Jv0oNCkzSq7i3fPAW/GtZOnFeBw5AIHa
         v49KMqeOlQX7Wl2sfbU7w4LmNqG13XIFmu88aXgH/xPUBruIR9N3LVcA+UxWR9+MtlzO
         N1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3QMtJyHMdj2d3NlJHtXdRPjzJsxucKLnz+qn2QRFOx0=;
        b=U1epgpYeQNU/E4EjUdcWQstlh9AOD3JgwTEVW4uDORhTnlgdUoJ2ilwFRwBtjvdFiY
         Ug4C2MlsoeDtBo1/np8ODjOO/QeKEX8Y5N+02p4KCzdzgLmQmPP2klF0e1Hza/KCABtp
         9MMBV0bY7Ida38eh3K7iMip88yYWoBdHSztJwKKiGoifhVKgrkKr3AWlqLKdxSLOpxTQ
         pftzkckkTUzq43552usqHb7GjxUckiC+Lmrrxhnpmoc8lE+hCUk2c/yghwAtLTMbHUkV
         Oe5QAhsZUnnztgJh4NV6FUYfLD6t//cvV32MrGKeM0NIRV/Kt4HsrnXi0LIxTzdpM4U2
         n6zQ==
X-Gm-Message-State: ANhLgQ2qLNpDLOomlJZUDg9f5/xjkGR1125xNIpOp/hUzy+MWNzOUdDv
        7HFAVZMf6dKQsxTWrbtEr4Oyxw==
X-Google-Smtp-Source: ADFU+vubP0XZlLxNsPBJjbPqoRh9Fj10FSwYOvdazGAIlTLv21y5ghlreopBsVqOhrzi4VW31nde8w==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr28196696wmj.161.1584373650045;
        Mon, 16 Mar 2020 08:47:30 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id z4sm460593wrr.6.2020.03.16.08.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:47:29 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:47:22 +0100
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
Subject: Re: [PATCH 07/15] iommu/arm-smmu: Fix uninitilized variable warning
Message-ID: <20200316154722.GH304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-8-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-8-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:21AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Some unrelated changes in the iommu code caused a new warning to
> appear in the arm-smmu driver:
> 
>   CC      drivers/iommu/arm-smmu.o
> drivers/iommu/arm-smmu.c: In function 'arm_smmu_add_device':
> drivers/iommu/arm-smmu.c:1441:2: warning: 'smmu' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   arm_smmu_rpm_put(smmu);
>   ^~~~~~~~~~~~~~~~~~~~~~
> 
> The warning is a false positive, but initialize the variable to NULL
> to get rid of it.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/arm-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 16c4b87af42b..980aae73b45b 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1383,7 +1383,7 @@ struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
>  
>  static int arm_smmu_add_device(struct device *dev)
>  {
> -	struct arm_smmu_device *smmu;
> +	struct arm_smmu_device *smmu = NULL;
>  	struct arm_smmu_master_cfg *cfg;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	int i, ret;
> -- 
> 2.17.1
> 

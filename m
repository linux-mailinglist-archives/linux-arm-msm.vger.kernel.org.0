Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A54101871A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 18:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732230AbgCPRz0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 13:55:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35913 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731891AbgCPRz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 13:55:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id s5so22449552wrg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KZCpP6b3rcDrFb5nL77Llc1TqP6zJQRoyalcv/Uk/U4=;
        b=Y/R6qyTPo9TH/wBiHH7KTVuPGU3xiYNdjGryws2oZjJT4EdE1Ukovm/qw0EUnU24gU
         S55BE2BmG4HOCtOwEOXGyy7AXs7ku0tleXQgOw9PFvVcXjBuY7X76ik6J67WXOAkluwY
         N8AUX6GldQgLMC2mjOJDUYeeFD61OI8upFJvU0u4LMkkLTWuKAqoRyeRXtYobTQC3CM1
         DhcjEhjnIN+SU8WqnWGyVuamv6HlAzsykRt5ewg6nLfQTUffQQtYpl8UmUJbnXxtaH9t
         SxVsykhhy/G0nCc53h3pcXuufWOU2IhPvnEjecW1aIFH4e1Rdj9IpsbjZMLyQjBC3MnB
         v6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KZCpP6b3rcDrFb5nL77Llc1TqP6zJQRoyalcv/Uk/U4=;
        b=O5WoVhgPtx1ZN9Rkf/st8K3hfl+63N16UPZK9dMKZzwiLA85oUB/QnXw2plDiKc8k4
         /vLxDS9d5z/uW/7KUX6TcBkJyT6PINk8f8j0OYfm+Eb8UfnoiAQ7geW6fETwzOYJGFoK
         +y22ZbNYfPS9j3XavyR0pIC/buYcMjimwXOQyC2dy9YocE2F8RHFlVAPoFKY2KOZ3MS6
         oScI9ylmD12nlzNYmZF4gICCOzzsX8AlTGxkdJd8Qnx3tKjfVI37WM7wo80C2Ddsf2do
         yEDhBYq5JDUunItaYWbgeu1ElFYY31JDJioi0sK860kdQ92NphHonrbdwDsCsbDY7z0z
         Wckw==
X-Gm-Message-State: ANhLgQ0qPzg3/E67PNIW2nTXNMXg+J+ndjhJsRzOV7D+ey2E2ngD6Jdm
        stj6spCVBpUMX2I6ws/DaI1wpQ==
X-Google-Smtp-Source: ADFU+vuHWkRqgMn4prXCXTnSNDBAjWBUzoa8syi0tqbAh8eRnR4X3rD/HVE1PtCHryXLNIoYPL6aMQ==
X-Received: by 2002:adf:f14a:: with SMTP id y10mr485041wro.325.1584381324158;
        Mon, 16 Mar 2020 10:55:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id n10sm964333wro.14.2020.03.16.10.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 10:55:23 -0700 (PDT)
Date:   Mon, 16 Mar 2020 18:55:15 +0100
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
Subject: Re: [PATCH 10/15] iommu/arm-smmu: Use accessor functions for iommu
 private data
Message-ID: <20200316175515.GP304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-11-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-11-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:24AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions and simplify the code
> where possible with this change.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
[...]
> @@ -1467,7 +1470,7 @@ static void arm_smmu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &arm_smmu_ops)
>  		return;
>  
> -	cfg  = fwspec->iommu_priv;
> +	cfg  = dev_iommu_priv_get(dev);
>  	smmu = cfg->smmu;
>  
>  	ret = arm_smmu_rpm_get(smmu);
> @@ -1475,23 +1478,22 @@ static void arm_smmu_remove_device(struct device *dev)
>  		return;
>  
>  	iommu_device_unlink(&smmu->iommu, dev);
> -	arm_smmu_master_free_smes(fwspec);
> +	arm_smmu_master_free_smes(dev);
>  
>  	arm_smmu_rpm_put(smmu);
>  
>  	iommu_group_remove_device(dev);
> -	kfree(fwspec->iommu_priv);
>  	iommu_fwspec_free(dev);
> +	kfree(cfg);

nit: cfg is allocated after fwspec so it might be cleaner to free cfg
before fwspec.

But more importantly, should we clear the private data here and in the
other drivers, by calling dev_iommu_priv_set(dev, NULL) from
remove_device()?  We are leaving stale pointers in dev->iommu and I think
some of the drivers could end up reusing them.

Thanks,
Jean


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5285186EB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731783AbgCPPj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:39:27 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41846 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731692AbgCPPj0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:39:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id f11so5035588wrp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q0yzkSCm1Xcsm6hOYYsbTqS4amhDbi797Ag8RmkjurU=;
        b=VjUfHswCT1UKNAujAPhK8VCtliVrWtYIYyppBsAtlnbFCrxaad4Uc2A5soRvyi8Lz/
         SqPfxSFRDIQCzDyvLFNz52fC+JJkBauYJCclNDsvmtzidrUQROIsVQV6zcwzj00LmPWd
         He65rfdf7A/Oc+IFkmPIIFP2thDMmrP7w+MUVZbhd7yiRPnRF5U7lNWsW24hYJVoJYeR
         8wHBvHBpk9d8ZmoBo1s6yLkrnEqIRgPQmKuMyjkvlD33ynh0mEfoeYi9XfpNu36ky7nN
         jntyaqHoGFn/okVfozaKqLoYwnG4+U3ZIqhxZ9ETSHCiCMC6Iw7WS6sjUwRs0+vfP+X7
         +bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q0yzkSCm1Xcsm6hOYYsbTqS4amhDbi797Ag8RmkjurU=;
        b=IVQlheREeM0J7xnT/W1ekmfwfrcv6g9th1zyJwkpUy+EY6dYVRbJEa7RBs8dELq0z7
         R+30roGeFJneq5/doRiJaB1yGdw8FpNu1bgveGHrPwe+HmbvyMND7oLzrrv0kXWnf0j+
         5/J+xYfQ+9gSjHRN+SIHp4a2iYozN2MWFxXYHtLby+gF1It7YHrctHSc7FwqazO8AAYZ
         yA/5DYs8/f5GqVWNp9AQ3oWMepVA21FUL5+YaUSsSSvGmWJHXAYbT9A7By5/kv8V07+K
         ssygie7yj2rVEPc594GR4LQlY4IFo4ajzz9TBtJ8NZJOa5YeWUYMDhdSoqNFg8W9zL+t
         XA4Q==
X-Gm-Message-State: ANhLgQ1PwnKJ4bN+jwlv2L58cEsGDCbXkBnREaVA3gIv/9hiloUpSWzt
        9VyyNFOydX82c2Bkf2wTuaUZ0w==
X-Google-Smtp-Source: ADFU+vs0mvRenL1g+U69U0qbNtFq1SVNLFNkkOGefFPc2C+th0hGKZ/JyHhYDuRn/eeS5wXEeUsB/Q==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr26159791wrk.101.1584373164974;
        Mon, 16 Mar 2020 08:39:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id 19sm143446wma.3.2020.03.16.08.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:39:24 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:39:16 +0100
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
Subject: Re: [PATCH 01/15] iommu: Define dev_iommu_fwspec_get() for
 !CONFIG_IOMMU_API
Message-ID: <20200316153916.GB304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-2-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-2-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:15AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> There are users outside of the IOMMU code that need to call that
> function. Define it for !CONFIG_IOMMU_API too so that compilation does
> not break.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

As a result drivers/gpu/host1x/hw/channel_hw.c and
drivers/gpu/drm/tegra/vic.c can lose their #ifdef CONFIG_IOMMU_API

> ---
>  include/linux/iommu.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index d1b5f4d98569..3c4ca041d7a2 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1073,6 +1073,10 @@ static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>  	return -ENODEV;
>  }
>  
> +static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
> +{
> +	return NULL;
> +}
>  #endif /* CONFIG_IOMMU_API */
>  
>  #ifdef CONFIG_IOMMU_DEBUGFS
> -- 
> 2.17.1
> 

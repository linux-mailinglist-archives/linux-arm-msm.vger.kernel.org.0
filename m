Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155B9186F00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731894AbgCPPsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:48:01 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40498 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731902AbgCPPsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:48:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id f3so14871844wrw.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J+yCX5u1YDN6eK0N92vhv3vwdN0qX/QOnRznwSw/NEU=;
        b=wqEM+8T/4h/xHj/JCPK+rRTCXxcVR4eDf7FRmVy6tL77x3zHH/AiX26KSVcpaAUPYM
         H2E3TxgVcsUZps0ZwbKrOGHGA1w+q7Tk9JZyHOG4r0miXlsNK9DAr6ASz77gWGMYoThi
         aqIcdck8zrW9cmOsVNIVfmvriv2jyBKV2gCHKWxDzNBhDSaeuNibLyNo1rN/KPESbvGx
         bYFXAMI7K3kXwTe2xy6IA/A4hJbQRhpt2ZZKRbDn2/H/Lo/rmmzCexG9w/kcno6ZiI77
         ppej5XGet0RlmPFvfqjzVDbUXtrDAc80RMkysk6JhzvWsm3/Qn/rhmBAkBM9JFQCl/h+
         nSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J+yCX5u1YDN6eK0N92vhv3vwdN0qX/QOnRznwSw/NEU=;
        b=W2DvWD8yGqJm1kXY8QX1W7GgT8QjlXReMpuHjOHQKcU4ILqHBx+zYO2vkXJ3+IaqSl
         ZtJROAELBEAReszGgjPT0Wr/chtzbjNuS7LzU/PIKAmzKZasmYDAZQciTxVbj+PFTh9Y
         vtR0cBkTZ9EI/hFtp9rau6dZ8x4bpyHQoZfJO102Sjs75mPUUg0eKo+TEaoA+3+BCD0F
         JqzdQ+rtLHpaHglAq42GvJfAIPf4xB8CMYwSiALUWSFhcts3e2xmnkaNgR9BS0i+0Bbq
         8EO7wCU3HYtMEK1g2CIdSWqgvEhKYqGJPD98jcKQg9tY3uCOn+QBDzHHjXJzZsdVtG6j
         FWsA==
X-Gm-Message-State: ANhLgQ1ynbtlNotrUuOjCDoi+vsveGPZoWevjC3WYfC4qJrrbj0AtoiE
        yaWVwAyPPOrKWaK5MeVePiqHKg==
X-Google-Smtp-Source: ADFU+vu7BwV9+IRhzha1mvLv+qxjTZOswhDVu8mc2cK8kbLXKQAY/jWE86j0EqeFBPhJwYU3dCMzFg==
X-Received: by 2002:adf:f510:: with SMTP id q16mr6841064wro.43.1584373677809;
        Mon, 16 Mar 2020 08:47:57 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id l7sm488506wrw.33.2020.03.16.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:47:57 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:47:49 +0100
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
Subject: Re: [PATCH 08/15] iommu: Introduce accessors for iommu private data
Message-ID: <20200316154749.GI304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-9-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-9-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:22AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Add dev_iommu_priv_get/set() functions to access per-device iommu
> private data. This makes it easier to move the pointer to a different
> location.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  include/linux/iommu.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index f5edc21a644d..056900e75758 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -627,6 +627,16 @@ static inline void dev_iommu_fwspec_set(struct device *dev,
>  	dev->iommu->fwspec = fwspec;
>  }
>  
> +static inline void *dev_iommu_priv_get(struct device *dev)
> +{
> +	return dev->iommu->fwspec->iommu_priv;
> +}
> +
> +static inline void dev_iommu_priv_set(struct device *dev, void *priv)
> +{
> +	dev->iommu->fwspec->iommu_priv = priv;
> +}
> +
>  int iommu_probe_device(struct device *dev);
>  void iommu_release_device(struct device *dev);
>  
> -- 
> 2.17.1
> 

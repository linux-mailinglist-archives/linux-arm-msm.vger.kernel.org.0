Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C3A186EF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731930AbgCPPrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:47:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40009 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731796AbgCPPrF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:47:05 -0400
Received: by mail-wm1-f67.google.com with SMTP id z12so9451876wmf.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GYsjb8wyMpitfSH0f8PA0mHjVYM9QWEBO9gCjay1L20=;
        b=lWNxgXfim4KYtEIBQRfki0eiyE/BWsrHh3mBkMGppzItkVPtihwUMSFvFNJ8xZBe/a
         brVy81DoW/z2tKhjRZCiCm/G+1HhJ4ivW/m8mNYUQ+5UJU0ouy6jtCyhH/U78JntPD50
         wA8YP4LnsMZBrluKad4Gdo4I6gdkfckXd+n28BgxyvvOZK40MupWY1itrZtSmK4bF7X3
         Lf8kgqGrtsTg2Pm92hWC3TpUqUqzFNt3JRDsmfiXg94brnBo2XJWC7QC0YLSYk8SkyIu
         pOSYqrLqVT2tAJ803lgFos/Qzi2xRy+O8Q6vbrgrPbyuCSc1hNAso5Tb2xZB8RKLPxC4
         BJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GYsjb8wyMpitfSH0f8PA0mHjVYM9QWEBO9gCjay1L20=;
        b=ZTZK3PkxtzZMAWTq3WLEKc2kWQWgfatJu1Zd0ibRku+E4QLqSmN/TPkZsvWqELJy+l
         V5NU8959MfPlfoqTnuiidLQ6Bw+WVviGZfYAs2pCKOqchoiOJe9Gnx8tfOuHTlI4rqYo
         0Xa1wtS6ehcIYozzSxfWIEawTXZalUV3Xc2RMumM6ulFtAlvBupL1jqSTfWt2Jwvu7ng
         2b8GUNvz1miwfhZhaFWP1C9UsAV8JF6SkhBSHZBVJBeuXhNnlt5hTxz5SVoXfa4xuqD+
         SGe3MuCR43fOBR1mfdoBdgs1/PNNNRmV7oULuPZtaotUWZ1kKxOEhb1tp3dgchqTCnq/
         fD3g==
X-Gm-Message-State: ANhLgQ0RIrVIrht/mrWVKrZVbcyGdcX12sDD3rcpbYHVdvXU6/J31F1q
        JHB22oJYDa0Hb952akmcgzYMcg==
X-Google-Smtp-Source: ADFU+vug65fGoL5TKdymAh0vmL/kEClqE8KiEqVXS5gBbtx7HyWfeUkjQSmjqTq49k3w6tjjBOsBAA==
X-Received: by 2002:a7b:c019:: with SMTP id c25mr28919018wmb.126.1584373622085;
        Mon, 16 Mar 2020 08:47:02 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id l8sm164858wmj.2.2020.03.16.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:47:01 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:46:54 +0100
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
Subject: Re: [PATCH 06/15] iommu: Move iommu_fwspec to struct dev_iommu
Message-ID: <20200316154654.GG304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-7-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-7-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:20AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Move the iommu_fwspec pointer in struct device into struct dev_iommu.
> This is a step in the effort to reduce the iommu related pointers in
> struct device to one.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/iommu.c  |  3 +++
>  include/linux/device.h |  1 -
>  include/linux/iommu.h  | 12 ++++++++----
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index beac2ef063dd..826a67ba247f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2405,6 +2405,9 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
>  	if (fwspec)
>  		return ops == fwspec->ops ? 0 : -EINVAL;
>  
> +	if (!dev_iommu_get(dev))
> +		return -ENOMEM;
> +
>  	fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
>  	if (!fwspec)
>  		return -ENOMEM;
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 405a8f11bec1..ca29c39a6480 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -613,7 +613,6 @@ struct device {
>  
>  	void	(*release)(struct device *dev);
>  	struct iommu_group	*iommu_group;
> -	struct iommu_fwspec	*iommu_fwspec;
>  	struct dev_iommu	*iommu;
>  
>  	bool			offline_disabled:1;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 1c9fa5c1174b..f5edc21a644d 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -368,14 +368,15 @@ struct iommu_fault_param {
>   * struct dev_iommu - Collection of per-device IOMMU data
>   *
>   * @fault_param: IOMMU detected device fault reporting data
> + * @fwspec:	 IOMMU fwspec data
>   *
>   * TODO: migrate other per device data pointers under iommu_dev_data, e.g.
>   *	struct iommu_group	*iommu_group;
> - *	struct iommu_fwspec	*iommu_fwspec;
>   */
>  struct dev_iommu {
>  	struct mutex lock;
> -	struct iommu_fault_param *fault_param;
> +	struct iommu_fault_param	*fault_param;
> +	struct iommu_fwspec		*fwspec;
>  };
>  
>  int  iommu_device_register(struct iommu_device *iommu);
> @@ -614,13 +615,16 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode);
>  
>  static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
>  {
> -	return dev->iommu_fwspec;
> +	if (dev->iommu)
> +		return dev->iommu->fwspec;
> +	else
> +		return NULL;
>  }
>  
>  static inline void dev_iommu_fwspec_set(struct device *dev,
>  					struct iommu_fwspec *fwspec)
>  {
> -	dev->iommu_fwspec = fwspec;
> +	dev->iommu->fwspec = fwspec;

It may be worth moving the set() to iommu.c and prevent any misuse.
Regardless:

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  }
>  
>  int iommu_probe_device(struct device *dev);
> -- 
> 2.17.1
> 

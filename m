Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD49186F6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731798AbgCPP4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:56:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54095 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731672AbgCPP4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:56:53 -0400
Received: by mail-wm1-f65.google.com with SMTP id 25so18268700wmk.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xMvs0/HoidPNJcKREH4cxPQfySQhzOIJtF8I7+UM558=;
        b=uq3aC7rP8Gi0hWD2k9GTvb304Urdg7HWJq+1GajWwKZFGsN2rAJMGURBxedQKUW4jd
         asGhdTqUUsTBsHFqdt9E3rUbuOPH9LnplZyIROCXZts0Altk+BtOGfxVnQG2zCkEVKBq
         NAuI2JAjicGhKKjGeoT4CC5ZB2QqLarkq2Zu2k9kjsXdW+uN+BMXxoUU5u4N96yU44fx
         tCZDJoxX8PkOf/gkX0aCFzGDyygT+xsCtaCtEDXLQvT6XUdDgAn69Z6zXz1IbnDjfIOR
         mq+n2Ab7QrOC31UPcgX0gGxqUx4OOFYTI0TN6BbHpW3S45c2GIHm7KEYESWZoQ3DPMJV
         MY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xMvs0/HoidPNJcKREH4cxPQfySQhzOIJtF8I7+UM558=;
        b=KIiPRHyMe11UZ1mwrTh2TDjuWZdWdBD1z3Q8yV2BkzwIiDaMERt1723QZOuTUEnhBq
         SlWyW0t6Mq5bqQWvcpdwId+kX4fn3NA9yxyvC/LtdpEKOYJiVTK5gcvTDJeEC52qtraX
         OQ6LD11yzqFbGD+vf5BkGqVQgHnujf4YM8QWvFBmtRVPSi5wZZjeINZhwPCuo3QP4UyZ
         LiZKiaiu3nR80GeMEdope3wLRYhphf9AISo19cI7/v6AEcrnmefkS5w0Tfjqf6Yyq93/
         DYm7JJ3FI5u96jk5e6bEbOJKgxtdcRDHYUQrly4QkifMtQuQ+tUi+4e6Bu3kUU4KsQ51
         86Wg==
X-Gm-Message-State: ANhLgQ2bX8FmBvBlRACj7BeztS6rPSR2BkYS9GoV4Jc2FT90JsnavXmb
        j25SdQPkFqXeYMV8kaoh9mxZIg==
X-Google-Smtp-Source: ADFU+vtb9SuXzA1/Pyl3fT36qeOkgagpJNuCxgpPrVNo6inRK/YVmejfWVsaU34AB8eJFzzgsz2mCw==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr28587408wmh.186.1584374209825;
        Mon, 16 Mar 2020 08:56:49 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id w16sm531971wrp.8.2020.03.16.08.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:56:49 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:56:41 +0100
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
Subject: Re: [PATCH 14/15] iommu/virtio: Use accessor functions for iommu
 private data
Message-ID: <20200316155641.GN304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-15-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-15-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:28AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

And tested on QEMU

> ---
>  drivers/iommu/virtio-iommu.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index cce329d71fba..8ead57f031f5 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -466,7 +466,7 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
>  	struct virtio_iommu_req_probe *probe;
>  	struct virtio_iommu_probe_property *prop;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct viommu_endpoint *vdev = fwspec->iommu_priv;
> +	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
>  
>  	if (!fwspec->num_ids)
>  		return -EINVAL;
> @@ -648,7 +648,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  	int ret = 0;
>  	struct virtio_iommu_req_attach req;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct viommu_endpoint *vdev = fwspec->iommu_priv;
> +	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
>  	struct viommu_domain *vdomain = to_viommu_domain(domain);
>  
>  	mutex_lock(&vdomain->mutex);
> @@ -807,8 +807,7 @@ static void viommu_iotlb_sync(struct iommu_domain *domain,
>  static void viommu_get_resv_regions(struct device *dev, struct list_head *head)
>  {
>  	struct iommu_resv_region *entry, *new_entry, *msi = NULL;
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct viommu_endpoint *vdev = fwspec->iommu_priv;
> +	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
>  	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>  
>  	list_for_each_entry(entry, &vdev->resv_regions, list) {
> @@ -876,7 +875,7 @@ static int viommu_add_device(struct device *dev)
>  	vdev->dev = dev;
>  	vdev->viommu = viommu;
>  	INIT_LIST_HEAD(&vdev->resv_regions);
> -	fwspec->iommu_priv = vdev;
> +	dev_iommu_priv_set(dev, vdev);
>  
>  	if (viommu->probe_size) {
>  		/* Get additional information for this endpoint */
> @@ -920,7 +919,7 @@ static void viommu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &viommu_ops)
>  		return;
>  
> -	vdev = fwspec->iommu_priv;
> +	vdev = dev_iommu_priv_get(dev);
>  
>  	iommu_group_remove_device(dev);
>  	iommu_device_unlink(&vdev->viommu->iommu, dev);
> -- 
> 2.17.1
> 

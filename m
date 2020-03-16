Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5113186F47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732124AbgCPPv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:51:27 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51066 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731890AbgCPPv0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:51:26 -0400
Received: by mail-wm1-f65.google.com with SMTP id z13so2189088wml.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KkyluvbCo1smPziuTMI1rpctD2ZygqnkeyljtuoXeEw=;
        b=Ql9YUBVPAc49FI42xu2eB/uVJuxhsY9YoQnZ0XtFjXM6HeXXOBU835hweTKfAEM9zr
         ot/OVovpdvovqb2hWye7+Dj/qnKTGEkRPtuI0NO5twoZx0/MwgjkoH50sjShfw/4xGDj
         q1qnW1Z1JfMLv111SRHS2M4QOxcIoR8jkUpSGfneogiiGz5Pr0uTllS+/TIx635iELsG
         u6YJoIDM7d3hVfVFSBh5x6kT2cHR+EaZwyTgm6kbxv7LY9h4Q+f0ytoQ41X42SgS4HLo
         Rq7GsvA0EhReqsXX/ReWo+oazsMqbZTNhtJUGHfm5pRqt+vWwkp5C2wusM4Pinn9EBm/
         MsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KkyluvbCo1smPziuTMI1rpctD2ZygqnkeyljtuoXeEw=;
        b=ee2qM1AgQ8HnquAhlkNIqLlFvYRDN7aGzsQcPlbTK1xmm755ajrPqHBZ7tFt83fnds
         54GbnSolYpvLyr033ighLZbHp5DmwaWS7gwzUokE2Ejn4JmuXunwT8Quz7kUBjtdEll7
         6Sjhqaw9qdlc0K3RpRyfSxrplaFXexCE4NUoO73J0CRfDGEhnuD5uwvi4OomZ6Fm+LYT
         2Oqhj7whC6NGI7fkOdVQEO7wjo/43dDxlxBTA7Bz9iRwcJbOPlEknszJ1OqFbyXm00nm
         xY7KKQdiOLL0G+SPrqManC1zu6bP9vEhjFJFJqMqbfiwutdIDvIUJq28UWHEiM5eXhCO
         OL2g==
X-Gm-Message-State: ANhLgQ1Z+GnS7PESEURAuFknFK64OfASuzA6vpBHU5x8vXTd6powJafI
        v9K6sa2XOvUHlNX3pkOCRZl68Q==
X-Google-Smtp-Source: ADFU+vsOzPwdH8tCDCurHNefcxT+FZBJmWj2HiUatr8Ym5ck83x1h29ClX9491yXix2EVw/gHBFPRA==
X-Received: by 2002:a1c:ab04:: with SMTP id u4mr28315891wme.88.1584373884542;
        Mon, 16 Mar 2020 08:51:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id s22sm143823wmc.16.2020.03.16.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:51:23 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:51:16 +0100
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
Subject: Re: [PATCH 12/15] iommu/mediatek: Use accessor functions for iommu
 private data
Message-ID: <20200316155116.GL304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-13-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-13-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:26AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/mtk_iommu.c    | 13 ++++++-------
>  drivers/iommu/mtk_iommu_v1.c | 14 +++++++-------
>  2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 95945f467c03..5f4d6df59cf6 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -358,8 +358,8 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
>  static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  				   struct device *dev)
>  {
> +	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> -	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
>  
>  	if (!data)
>  		return -ENODEV;
> @@ -378,7 +378,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  static void mtk_iommu_detach_device(struct iommu_domain *domain,
>  				    struct device *dev)
>  {
> -	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
> +	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  
>  	if (!data)
>  		return;
> @@ -450,7 +450,7 @@ static int mtk_iommu_add_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>  		return -ENODEV; /* Not a iommu client device */
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev);
>  	iommu_device_link(&data->iommu, dev);
>  
>  	group = iommu_group_get_for_dev(dev);
> @@ -469,7 +469,7 @@ static void mtk_iommu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>  		return;
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev);
>  	iommu_device_unlink(&data->iommu, dev);
>  
>  	iommu_group_remove_device(dev);
> @@ -496,7 +496,6 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
>  
>  static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct platform_device *m4updev;
>  
>  	if (args->args_count != 1) {
> @@ -505,13 +504,13 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  		return -EINVAL;
>  	}
>  
> -	if (!fwspec->iommu_priv) {
> +	if (!dev_iommu_priv_get(dev)) {
>  		/* Get the m4u device */
>  		m4updev = of_find_device_by_node(args->np);
>  		if (WARN_ON(!m4updev))
>  			return -EINVAL;
>  
> -		fwspec->iommu_priv = platform_get_drvdata(m4updev);
> +		dev_iommu_priv_set(dev, platform_get_drvdata(m4updev));
>  	}
>  
>  	return iommu_fwspec_add_ids(dev, args->args, 1);
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index e93b94ecac45..9930ac7413cc 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -263,8 +263,8 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
>  static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  				   struct device *dev)
>  {
> +	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> -	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
>  	int ret;
>  
>  	if (!data)
> @@ -286,7 +286,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  static void mtk_iommu_detach_device(struct iommu_domain *domain,
>  				    struct device *dev)
>  {
> -	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
> +	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>  
>  	if (!data)
>  		return;
> @@ -387,20 +387,20 @@ static int mtk_iommu_create_mapping(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> -	if (!fwspec->iommu_priv) {
> +	if (!dev_iommu_priv_get(dev)) {
>  		/* Get the m4u device */
>  		m4updev = of_find_device_by_node(args->np);
>  		if (WARN_ON(!m4updev))
>  			return -EINVAL;
>  
> -		fwspec->iommu_priv = platform_get_drvdata(m4updev);
> +		dev_iommu_priv_set(dev, platform_get_drvdata(m4updev));
>  	}
>  
>  	ret = iommu_fwspec_add_ids(dev, args->args, 1);
>  	if (ret)
>  		return ret;
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev);
>  	m4udev = data->dev;
>  	mtk_mapping = m4udev->archdata.iommu;
>  	if (!mtk_mapping) {
> @@ -459,7 +459,7 @@ static int mtk_iommu_add_device(struct device *dev)
>  	if (err)
>  		return err;
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev)
>  	mtk_mapping = data->dev->archdata.iommu;
>  	err = arm_iommu_attach_device(dev, mtk_mapping);
>  	if (err) {
> @@ -478,7 +478,7 @@ static void mtk_iommu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
>  		return;
>  
> -	data = fwspec->iommu_priv;
> +	data = dev_iommu_priv_get(dev)
>  	iommu_device_unlink(&data->iommu, dev);
>  
>  	iommu_group_remove_device(dev);
> -- 
> 2.17.1
> 

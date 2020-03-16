Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D52A186F55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731876AbgCPPwd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:52:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45241 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731873AbgCPPwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:52:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id t2so11811928wrx.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CQWUEVlXfznSczAKyGpDi3T2t4zubClSxzSzuBgyOmY=;
        b=yl6bstE+aSegQ4PSIZwfpkI4xv5zEpFCHJTeJOmkwQSJ+I34mLp8AxYTWZ9rJT3sc2
         lfVn74R8N/A5/RlriKIwFzgnhIdRpYphZB/RGS2V7TiOu9jBnvyS/vVHkhpcG/UCkclI
         /Xe8pirR3stVSJMCZatixqgD5qeqsOrizxVPTp5NmPJGHiiNFTlr2SrOO2kgOC4/0W9m
         TaePqXQ0F0j8GjfwG6eC/pF625lANh0WVdHPpEVzOMwvBPZshj8wKu9LXxVj1/SPB9LL
         CEn13SHypRSkWd4ThtiGgPM4UZhcVfHP1IHQBtjQSqNt8bUgTV5XgO5/lnNRElqlP+4y
         Bdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CQWUEVlXfznSczAKyGpDi3T2t4zubClSxzSzuBgyOmY=;
        b=tgwf1P+6HW5xneN9MQAKQlBHeyAeCYyzlaytyZUdTZr0nPzbSO9R2ZiBj6Sgwwdsks
         LGyZM9a0lTjZU+81KWHAWloQjHbCnnSv5CD2ZzuOE9r9SsfemKG7GOib6B21nIDDQk7+
         kIoY4KttU4CvM+mjXHYXVzvo6t/MC5uAfb+eGgvbbyPyDRcYh0qRB33ZMhTRDk2Pywzk
         rxAoStxgjmWcPpfW2/pRav0notnf5VO5DAq1erXVRTyoOAtmpmBdyXLsYkOktkxT9LFR
         SnTGISLE0fVnMF1k6i/h82/d3thtFZ/zUwe0/w1h2md/wC7QKOwC1hdCGYtq7DgHTHi9
         6/7Q==
X-Gm-Message-State: ANhLgQ0TEczjOwvxhg9CLnTlw83rh2FZWXJGQRP3MCrQl2gRIqLRY+Y1
        eKzDmOO/56wz4bnOqh3PFN886g==
X-Google-Smtp-Source: ADFU+vttr8+4jXiTPQnlMs6N4KDj9oq3qIoO+BGp44KMN8sfSjRCTINbImPpFYK6LbM8TzaWqB/nSA==
X-Received: by 2002:adf:f289:: with SMTP id k9mr37838wro.220.1584373951194;
        Mon, 16 Mar 2020 08:52:31 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id t1sm509263wrq.36.2020.03.16.08.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:52:30 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:52:23 +0100
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
Subject: Re: [PATCH 13/15] iommu/qcom: Use accessor functions for iommu
 private data
Message-ID: <20200316155223.GM304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-14-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-14-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:27AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/qcom_iommu.c | 61 ++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0a9f..80147f82d427 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -74,16 +74,19 @@ static struct qcom_iommu_domain *to_qcom_iommu_domain(struct iommu_domain *dom)
>  
>  static const struct iommu_ops qcom_iommu_ops;
>  
> -static struct qcom_iommu_dev * to_iommu(struct iommu_fwspec *fwspec)
> +static struct qcom_iommu_dev * to_iommu(struct device *dev)
>  {
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
>  	if (!fwspec || fwspec->ops != &qcom_iommu_ops)
>  		return NULL;

Following other drivers, I think this test could move to add_device() (and
remove_device()?), but this is probably good enough for now.

> -	return fwspec->iommu_priv;
> +
> +	return dev_iommu_priv_get(dev);
>  }
[...]
>  static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct qcom_iommu_dev *qcom_iommu;
>  	struct platform_device *iommu_pdev;
>  	unsigned asid = args->args[0];
> @@ -583,14 +594,14 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  	    WARN_ON(asid > qcom_iommu->num_ctxs))
>  		return -EINVAL;
>  
> -	if (!fwspec->iommu_priv) {
> -		fwspec->iommu_priv = qcom_iommu;
> +	if (dev_iommu_priv_get(dev)) {

Should be:

	if (!dev_iommu_priv_set(dev))

Thanks,
Jean

> +		dev_iommu_priv_set(dev, qcom_iommu);
>  	} else {
>  		/* make sure devices iommus dt node isn't referring to
>  		 * multiple different iommu devices.  Multiple context
>  		 * banks are ok, but multiple devices are not:
>  		 */
> -		if (WARN_ON(qcom_iommu != fwspec->iommu_priv))
> +		if (WARN_ON(qcom_iommu != dev_iommu_priv_get(dev)))
>  			return -EINVAL;
>  	}
>  
> -- 
> 2.17.1
> 

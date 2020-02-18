Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F21162F66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 20:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgBRTI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 14:08:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:33355 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgBRTIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 14:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582052903;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5D52tt6mIQclXNRsDvAzprjKbRWFDl8iC2bcJ4uR/M8=;
        b=QeusGr3hyRAy+NNbAnV+yGPPsKnCbCapk9q1OP+/VfCPfkSZX1+ui9ECGjJn08jTim
        5784A21RoeK3uEz6njMV5XEhihCB4jpmQZKcK1K/WHTdIzijllnbLblhd3m3INrVd5cm
        b460hMGPjD9wZMEFxLPQrT3L48BDNoMMglIr9ftCenJFFBR5Ivk2T7zZ//Q7r4NTUASl
        1DynCkqQcUolZ+570uVY+vPSEy9CyHlIcqYIQTbHQdKBD9t1pCsOU39Ep3zNu4KKoJaj
        SwK2xBicQKLjEgjxV7Lfx3F+jI8EOFUQC02Howf8CjXJD1tMo1rpyAgjxC3hN+ENxbhP
        iNQw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8b7Ic/NaIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id a01fe9w1IJ5Mm3U
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 18 Feb 2020 20:05:22 +0100 (CET)
Date:   Tue, 18 Feb 2020 20:05:16 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     joro@8bytes.org, robdclark@gmail.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] iommu/qcom: Fix bogus detach logic
Message-ID: <20200218190516.GA19773@gerhold.net>
References: <be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 18, 2020 at 06:12:41PM +0000, Robin Murphy wrote:
> Currently, the implementation of qcom_iommu_domain_free() is guaranteed
> to do one of two things: WARN() and leak everything, or dereference NULL
> and crash. That alone is terrible, but in fact the whole idea of trying
> to track the liveness of a domain via the qcom_domain->iommu pointer as
> a sanity check is full of fundamentally flawed assumptions. Make things
> robust and actually functional by not trying to be quite so clever.
> 
> Reported-by: Brian Masney <masneyb@onstation.org>
> Tested-by: Brian Masney <masneyb@onstation.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

This fixes the warning reported by Naresh Kamboju [1] for me. Thank you!

Tested-by: Stephan Gerhold <stephan@gerhold.net>

[1]: https://lore.kernel.org/linux-arm-msm/CA+G9fYtScOpkLvx=__gP903uJ2v87RwZgkAuL6RpF9_DTDs9Zw@mail.gmail.com/

> ---
>  drivers/iommu/qcom_iommu.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 39759db4f003..4328da0b0a9f 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -344,21 +344,19 @@ static void qcom_iommu_domain_free(struct iommu_domain *domain)
>  {
>  	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
>  
> -	if (WARN_ON(qcom_domain->iommu))    /* forgot to detach? */
> -		return;
> -
>  	iommu_put_dma_cookie(domain);
>  
> -	/* NOTE: unmap can be called after client device is powered off,
> -	 * for example, with GPUs or anything involving dma-buf.  So we
> -	 * cannot rely on the device_link.  Make sure the IOMMU is on to
> -	 * avoid unclocked accesses in the TLB inv path:
> -	 */
> -	pm_runtime_get_sync(qcom_domain->iommu->dev);
> -
> -	free_io_pgtable_ops(qcom_domain->pgtbl_ops);
> -
> -	pm_runtime_put_sync(qcom_domain->iommu->dev);
> +	if (qcom_domain->iommu) {
> +		/*
> +		 * NOTE: unmap can be called after client device is powered
> +		 * off, for example, with GPUs or anything involving dma-buf.
> +		 * So we cannot rely on the device_link.  Make sure the IOMMU
> +		 * is on to avoid unclocked accesses in the TLB inv path:
> +		 */
> +		pm_runtime_get_sync(qcom_domain->iommu->dev);
> +		free_io_pgtable_ops(qcom_domain->pgtbl_ops);
> +		pm_runtime_put_sync(qcom_domain->iommu->dev);
> +	}
>  
>  	kfree(qcom_domain);
>  }
> @@ -404,7 +402,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
>  	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
>  	unsigned i;
>  
> -	if (!qcom_domain->iommu)
> +	if (WARN_ON(!qcom_domain->iommu))
>  		return;
>  
>  	pm_runtime_get_sync(qcom_iommu->dev);
> @@ -417,8 +415,6 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
>  		ctx->domain = NULL;
>  	}
>  	pm_runtime_put_sync(qcom_iommu->dev);
> -
> -	qcom_domain->iommu = NULL;
>  }
>  
>  static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
> -- 
> 2.23.0.dirty
> 

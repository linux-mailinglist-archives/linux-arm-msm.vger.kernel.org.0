Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A532E7E7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 07:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgLaGsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 01:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgLaGsy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 01:48:54 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE78C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 22:48:14 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id q22so10825166pfk.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 22:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3pSOoazkdWnac64m4qyGWl6qnqkGX2eN81drYC7+T9w=;
        b=nALCS3xfpAXFMm6zICJql2rGHdsSutJBzPYzkaxgyTIIpfLOWv4Fa2hUU38UADIYzE
         AkQC4TW1J2wLILE/Cz/Y+27422arhSvTd9c+/jG0aHUCl+yKNtUF3YUUBU4wv079zuVB
         /B8AeORiZLX4kFs6km1QabcemFq5rBONnwMsdRMsF47rYRVykPN2XMI6c2Q7EkZo7hTm
         LTxhE5mflFM/6bd50gCpV8rPpzJLm9zry9LFTJhmDUoNu1i9xSb/BByGj3Iu+W9yR2SM
         daMpVN+jZWUGNFkAU9m4YYsEnl/ABzgcOjP4rbXX+6yinpkapKIJFdx0GiTCxBGhfVZ6
         fkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3pSOoazkdWnac64m4qyGWl6qnqkGX2eN81drYC7+T9w=;
        b=lBul6dg+h3W7F3bgyZB7BU9kQNj9JkMFuAc8kqDBAcvIlF1Pxnj74k1lEh00/Q/lD5
         xYhFKfBxymLS883K8n+nP9I8XMY4vHvF4MB6AG0wa6R2MCv7cj24mSaimUBecgQ8TmVA
         oZCLlYxZM7KHY9F2GYrnBkMRBlDSGSor9yT4yc+c18th/5qJl8OoZ88UBunZpzSzfTSA
         fMR5rki2/o+uQRPWA226l60gqjQsrHHd0Tk6cw5XzXWg5uqXRQ3JWtE+v+Sr4kZOi3nO
         9ECxFa8sXYpqLH1LtH4qm7zTt0S3TdqMPF1h7hXMT3vcZUc2bPYPH/CQB7m/C4Ks9qSo
         iOzg==
X-Gm-Message-State: AOAM533JRxZUA2sFekgg7v6reIqx2UJ0kIHcH1cDXOkuyd/axPOJw/+s
        BpYMhbRlk6gxPLcqt53IX//I
X-Google-Smtp-Source: ABdhPJwK8nQFdrE7FATvAE5N0ASB+cmqME7rTCsP+K7xJcznXPi9SlR6c6IlWOAULPzCwsjqeV2pkQ==
X-Received: by 2002:a65:67cf:: with SMTP id b15mr55145723pgs.429.1609397293473;
        Wed, 30 Dec 2020 22:48:13 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
        by smtp.gmail.com with ESMTPSA id x23sm53673540pge.47.2020.12.30.22.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 22:48:12 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:18:05 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, ath11k@lists.infradead.org,
        kvalo@codeaurora.org
Subject: Re: [PATCH v6 01/10] mhi: Add mhi_controller_initialize helper
Message-ID: <20201231064805.GA4006@thinkpad>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609231431-10048-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

+ath11k, kalle

On Tue, Dec 29, 2020 at 09:43:42AM +0100, Loic Poulain wrote:
> This function allows to initialize a mhi_controller structure.
> Today, it only zeroing the structure.
> 
> Use this function from mhi_alloc_controller so that any further
> initialization can be factorized in initalize function.
> 

I know that this has been discussed in earlier revisions but I'm still not
convinced to have 2 APIs doing a similar job. Since we don't have any usecase
currently to initialize extra fields other than the struct, we should be using
the alloc_controller API.

If you want to have a devres managed allocation, then the API should be extended
as below:

struct mhi_controller *mhi_alloc_controller(struct device *dev)
{
	struct mhi_controller *mhi_cntrl;

	if (!dev)
		mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
	else
		mhi_cntrl = devm_kzalloc(dev, sizeof(*mhi_cntrl), GFP_KERNEL);

	return mhi_cntrl;		
}

In this case, the ath11k MHI controller also need to be adjusted but we can use
the same immutable branch way.

Thanks,
Mani

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 6 ++++++
>  include/linux/mhi.h         | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 96cde9c..a75ab8c 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1021,6 +1021,12 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_unregister_controller);
>  
> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
> +{
> +	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
> +}
> +EXPORT_SYMBOL_GPL(mhi_initialize_controller);
> +
>  struct mhi_controller *mhi_alloc_controller(void)
>  {
>  	struct mhi_controller *mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 04cf7f3..2754742 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -537,6 +537,12 @@ struct mhi_driver {
>  #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
>  
>  /**
> + * mhi_initialize_controller - Initialize MHI Controller structure
> + * @mhi_cntrl: MHI controller structure to initialize
> + */
> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
> +
> +/**
>   * mhi_alloc_controller - Allocate the MHI Controller structure
>   * Allocate the mhi_controller structure using zero initialized memory
>   */
> -- 
> 2.7.4
> 

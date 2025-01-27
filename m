Return-Path: <linux-arm-msm+bounces-46182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6F3A1D0A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 06:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 349B61885CC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 05:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4669F153803;
	Mon, 27 Jan 2025 05:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="McLM2ChS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3FE78F2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737955776; cv=none; b=uedY6OmsKuUv+mJut6Zs2sYDZMrojnrqxDu2yuscJwFLCr4bIxDxqbSt8B/qRjntblnvt2CToPB5XwRkmIn2BwJrTI1z9V69nhdOwUld+PmnEtqCV/HO9RiZIX+RQWZgiokFo+oZyjQ+V95wHJK3zGQirLv/j0osVXN9Um30MHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737955776; c=relaxed/simple;
	bh=F3sTReY6m3kvGuzQp7gRS1og/NFu2awRGtg5IERKlj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hrnevfi2VmGpYXs5IT6IyyRg7dYLp59bcne+eKdq+dANJ9EZElaMOZuoEOf+8heHddZ29G6O+DqosBy+WDL0SQNS+/OGzKhEpoWSb2WpPdnF7qIAEUJDIFijeLQV5Li/iN4K6mHtHvi7ctSpW7f8rZaT59IW3LYf8qRusLaHBLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=McLM2ChS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21631789fcdso65763345ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2025 21:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737955773; x=1738560573; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbpwGjRvSKm7OOEA02QMMzXw4gclV688EfXIr1lIj7Y=;
        b=McLM2ChSvHSfvcnjbXgVJ2fhNmMFxQo77RTTZkqEvaw1DC+VHjM+FDyARmcgDgkyEE
         mEL/YXvJkyzH1ecJ1+G6aT9x/PEWH3zrHmZMyhvIKb0OZJlYUOq+e32Rj9EWox0auRFj
         NZZbMT0Ml/C48ewMPb/a7rV2GTMls4xVYzFaaHKGPmL0Z7dJ4hE3+gFzbNOwrrDoy48o
         QxbCRHdjq79Gwz0sYzbxv29JhAF5y7m0AUWL+uhgkQn3rh1oZ9aktStETJ4Ml7Xnc4Me
         DVk82SYNcxKBkMN2CoAJXJueWTbxwXRffpqA9g2vIEySAyB1IVYuGq/ch3Mr02tEWjsR
         hhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737955773; x=1738560573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbpwGjRvSKm7OOEA02QMMzXw4gclV688EfXIr1lIj7Y=;
        b=ww0qTTlSzAWcCTihB6dbo1Vt5YAQW6o2/Mx7cVaiGfalkCFFVnJzksxRKB5zSuZ6iH
         +j/7akxU6mpvB/guiy0Rr2x97nsKjsZ5JIhz3hs4ppzE4/jo4rwka4W8oeARQipF6S3O
         Ja8bSpHaAiVgV8fuOUQQbsqtopoYX8JJPiweBuwK7HKWr0HRYIHItDZ+A3CdYN36h0wH
         wDA+DvvOWeIfo5kXjIe1XaGn5gTmG9wHP4lZjSIUsxWMFJMPpf4vskIOTbQoPzE76Khs
         l/M4n8pATYdaZzoVIs57cYmkpoJLUqyb0Qr759E45pHCIVcSS4SUCEZXMdzy6FSHmSl4
         NpEA==
X-Forwarded-Encrypted: i=1; AJvYcCUcqOt9ndCmKC1nL94z5mU1itrz+uaHzjZsY1XefCnFyY1q5i4y5zRcNE6kwrGUTfgHBehgEyf/G9cKn5Oj@vger.kernel.org
X-Gm-Message-State: AOJu0YxE1+YvMPG0OoKESHK3oXEoBgSDqlStZjBGvHi2Jm5q7uWehCMY
	c9zj+gLGDt0x9TmKtuhxoymnH/t0x8ncCB9VwNiDuprE/6cYCNP+o2v7KUzonw==
X-Gm-Gg: ASbGncvPdpNDjxCpp1p/dRR6LDnBYw9So8YGAdC0Cq9TvfDHEXwB2ccVaZspv7/z9hr
	d72JyLHrdn8DUQ0dqeiNgQGKWayFzPkJCQprayMPXjngpJr5RiVB07dvumNZEHwon4Z3P+wB0Qy
	wRElFyvxjFffZkuNFeE/VaR/ydtF3VgwqcEZN1mEt95ybfUW63Auk9pGVbmQ0pvpUArIxF3tVn9
	9c1spNio4AZG4q9X+RAs/UztVyU2+mLWXpsRMOu+S/nQJhJzMPrcU76X0i3DADybu2NLFDzohF9
	Pwps0JZZOUliULk=
X-Google-Smtp-Source: AGHT+IH5cyt33BRSgNah7zwHKJcgR39y5T6qnFhhcjWjaEzJr2vmBVaKLe1dN2yQKZ4MyPHMC1o4Rw==
X-Received: by 2002:a05:6a21:6d9f:b0:1e1:ad90:dda6 with SMTP id adf61e73a8af0-1eb697c1bb0mr27369444637.20.1737955772669;
        Sun, 26 Jan 2025 21:29:32 -0800 (PST)
Received: from thinkpad ([120.60.139.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a7614c4sm6185758b3a.120.2025.01.26.21.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 21:29:32 -0800 (PST)
Date: Mon, 27 Jan 2025 10:59:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Satya Tangirala <satyat@google.com>,
	Eric Biggers <ebiggers@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] scsi: ufs: fix use-after free in init error and
 remove paths
Message-ID: <20250127052921.7cld6rrb2fmr2srt@thinkpad>
References: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>

On Fri, Jan 24, 2025 at 03:09:00PM +0000, André Draszik wrote:
> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshcd and therefore Scsi_host
> allocation.
> 
> During driver release or during error handling in ufshcd_pltfrm_init(),
> this structure is released as part of ufshcd_dealloc_host() before the
> (platform-) device associated with the crypto call above is released.
> Once this device is released, the crypto cleanup code will run, using
> the just-released 'struct ufs_hba::crypto_profile'. This causes a
> use-after-free situation:
> 
>   Call trace:
>    kfree+0x60/0x2d8 (P)
>    kvfree+0x44/0x60
>    blk_crypto_profile_destroy_callback+0x28/0x70
>    devm_action_release+0x1c/0x30
>    release_nodes+0x6c/0x108
>    devres_release_all+0x98/0x100
>    device_unbind_cleanup+0x20/0x70
>    really_probe+0x218/0x2d0
> 
> In other words, the initialisation code flow is:
> 
>   platform-device probe
>     ufshcd_pltfrm_init()
>       ufshcd_alloc_host()
>         scsi_host_alloc()
>           allocation of struct ufs_hba
>           creation of scsi-host devices
>     devm_blk_crypto_profile_init()
>       devm registration of cleanup handler using platform-device
> 
> and during error handling of ufshcd_pltfrm_init() or during driver
> removal:
> 
>   ufshcd_dealloc_host()
>     scsi_host_put()
>       put_device(scsi-host)
>         release of struct ufs_hba
>   put_device(platform-device)
>     crypto cleanup handler
> 
> To fix this use-after free, change ufshcd_alloc_host() to register a
> devres action to automatically cleanup the underlying SCSI device on
> ufshcd destruction, without requiring explicit calls to
> ufshcd_dealloc_host(). This way:
> 
>     * the crypto profile and all other ufs_hba-owned resources are
>       destroyed before SCSI (as they've been registered after)
>     * a memleak is plugged in tc-dwc-g210-pci.c remove() as a
>       side-effect
>     * EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) can be removed fully as
>       it's not needed anymore
>     * no future drivers using ufshcd_alloc_host() could ever forget
>       adding the cleanup
> 
> Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to blk_crypto_profile")
> Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

LGTM!

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v4:
> - add a kdoc note to ufshcd_alloc_host() to state why there is no
>   ufshcd_dealloc_host() (Mani)
> - use return err, without goto (Mani)
> - drop register dump and abort info from commit message (Mani)
> - Link to v3: https://lore.kernel.org/r/20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org
> 
> Changes in v3:
> - rename devres action handler to ufshcd_devres_release() (Bart)
> - Link to v2: https://lore.kernel.org/r/20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org
> 
> Changes in v2:
> - completely new approach using devres action for Scsi_host cleanup, to
>   ensure ordering
> - add Fixes: and CC: stable tags (Eric)
> - Link to v1: https://lore.kernel.org/r/20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org
> ---
> In my case, as per above trace I initially encountered an error in
> ufshcd_verify_dev_init(), which made me notice this problem both during
> error handling and release. For reproducing, it'd be possible to change
> that function to just return an error, or rmmod the platform glue
> driver.
> 
> Other approaches for solving this issue I see are the following, but I
> believe this one here is the cleanest:
> 
> * turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
>   pointer, in which case it doesn't matter if cleanup runs after
>   scsi_host_put()
> * add an explicit devm_blk_crypto_profile_deinit() to be called by API
>   users when necessary, e.g. before ufshcd_dealloc_host() in this case
> * register the crypto cleanup handler against the scsi-host device
>   instead, like in v1 of this patch
> ---
>  drivers/ufs/core/ufshcd.c        | 31 +++++++++++++++++++++----------
>  drivers/ufs/host/ufshcd-pci.c    |  2 --
>  drivers/ufs/host/ufshcd-pltfrm.c | 28 +++++++++-------------------
>  include/ufs/ufshcd.h             |  1 -
>  4 files changed, 30 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 43ddae7318cb..4328f769a7c8 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -10279,16 +10279,6 @@ int ufshcd_system_thaw(struct device *dev)
>  EXPORT_SYMBOL_GPL(ufshcd_system_thaw);
>  #endif /* CONFIG_PM_SLEEP  */
>  
> -/**
> - * ufshcd_dealloc_host - deallocate Host Bus Adapter (HBA)
> - * @hba: pointer to Host Bus Adapter (HBA)
> - */
> -void ufshcd_dealloc_host(struct ufs_hba *hba)
> -{
> -	scsi_host_put(hba->host);
> -}
> -EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
> -
>  /**
>   * ufshcd_set_dma_mask - Set dma mask based on the controller
>   *			 addressing capability
> @@ -10307,12 +10297,26 @@ static int ufshcd_set_dma_mask(struct ufs_hba *hba)
>  	return dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(32));
>  }
>  
> +/**
> + * ufshcd_devres_release - devres cleanup handler, invoked during release of
> + *			   hba->dev
> + * @host: pointer to SCSI host
> + */
> +static void ufshcd_devres_release(void *host)
> +{
> +	scsi_host_put(host);
> +}
> +
>  /**
>   * ufshcd_alloc_host - allocate Host Bus Adapter (HBA)
>   * @dev: pointer to device handle
>   * @hba_handle: driver private handle
>   *
>   * Return: 0 on success, non-zero value on failure.
> + *
> + * NOTE: There is no corresponding ufshcd_dealloc_host() because this function
> + * keeps track of its allocations using devres and deallocates everything on
> + * device removal automatically.
>   */
>  int ufshcd_alloc_host(struct device *dev, struct ufs_hba **hba_handle)
>  {
> @@ -10334,6 +10338,13 @@ int ufshcd_alloc_host(struct device *dev, struct ufs_hba **hba_handle)
>  		err = -ENOMEM;
>  		goto out_error;
>  	}
> +
> +	err = devm_add_action_or_reset(dev, ufshcd_devres_release,
> +				       host);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "failed to add ufshcd dealloc action\n");
> +
>  	host->nr_maps = HCTX_TYPE_POLL + 1;
>  	hba = shost_priv(host);
>  	hba->host = host;
> diff --git a/drivers/ufs/host/ufshcd-pci.c b/drivers/ufs/host/ufshcd-pci.c
> index ea39c5d5b8cf..9cfcaad23cf9 100644
> --- a/drivers/ufs/host/ufshcd-pci.c
> +++ b/drivers/ufs/host/ufshcd-pci.c
> @@ -562,7 +562,6 @@ static void ufshcd_pci_remove(struct pci_dev *pdev)
>  	pm_runtime_forbid(&pdev->dev);
>  	pm_runtime_get_noresume(&pdev->dev);
>  	ufshcd_remove(hba);
> -	ufshcd_dealloc_host(hba);
>  }
>  
>  /**
> @@ -605,7 +604,6 @@ ufshcd_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	err = ufshcd_init(hba, mmio_base, pdev->irq);
>  	if (err) {
>  		dev_err(&pdev->dev, "Initialization failed\n");
> -		ufshcd_dealloc_host(hba);
>  		return err;
>  	}
>  
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index 505572d4fa87..ffe5d1d2b215 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -465,21 +465,17 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  
>  	mmio_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mmio_base)) {
> -		err = PTR_ERR(mmio_base);
> -		goto out;
> -	}
> +	if (IS_ERR(mmio_base))
> +		return PTR_ERR(mmio_base);
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		err = irq;
> -		goto out;
> -	}
> +	if (irq < 0)
> +		return irq;
>  
>  	err = ufshcd_alloc_host(dev, &hba);
>  	if (err) {
>  		dev_err(dev, "Allocation failed\n");
> -		goto out;
> +		return err;
>  	}
>  
>  	hba->vops = vops;
> @@ -488,13 +484,13 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
>  	if (err) {
>  		dev_err(dev, "%s: clock parse failed %d\n",
>  				__func__, err);
> -		goto dealloc_host;
> +		return err;
>  	}
>  	err = ufshcd_parse_regulator_info(hba);
>  	if (err) {
>  		dev_err(dev, "%s: regulator init failed %d\n",
>  				__func__, err);
> -		goto dealloc_host;
> +		return err;
>  	}
>  
>  	ufshcd_init_lanes_per_dir(hba);
> @@ -502,25 +498,20 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
>  	err = ufshcd_parse_operating_points(hba);
>  	if (err) {
>  		dev_err(dev, "%s: OPP parse failed %d\n", __func__, err);
> -		goto dealloc_host;
> +		return err;
>  	}
>  
>  	err = ufshcd_init(hba, mmio_base, irq);
>  	if (err) {
>  		dev_err_probe(dev, err, "Initialization failed with error %d\n",
>  			      err);
> -		goto dealloc_host;
> +		return err;
>  	}
>  
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -
> -dealloc_host:
> -	ufshcd_dealloc_host(hba);
> -out:
> -	return err;
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_pltfrm_init);
>  
> @@ -534,7 +525,6 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
>  
>  	pm_runtime_get_sync(&pdev->dev);
>  	ufshcd_remove(hba);
> -	ufshcd_dealloc_host(hba);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
>  }
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index da0fa5c65081..58eb6e897827 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -1311,7 +1311,6 @@ static inline void ufshcd_rmwl(struct ufs_hba *hba, u32 mask, u32 val, u32 reg)
>  void ufshcd_enable_irq(struct ufs_hba *hba);
>  void ufshcd_disable_irq(struct ufs_hba *hba);
>  int ufshcd_alloc_host(struct device *, struct ufs_hba **);
> -void ufshcd_dealloc_host(struct ufs_hba *);
>  int ufshcd_hba_enable(struct ufs_hba *hba);
>  int ufshcd_init(struct ufs_hba *, void __iomem *, unsigned int);
>  int ufshcd_link_recovery(struct ufs_hba *hba);
> 
> ---
> base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
> change-id: 20250113-ufshcd-fix-52409f2d32ff
> 
> Best regards,
> -- 
> André Draszik <andre.draszik@linaro.org>
> 

-- 
மணிவண்ணன் சதாசிவம்


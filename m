Return-Path: <linux-arm-msm+bounces-46049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE03A1B1A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 09:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E02E3AE5C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 08:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6585F218E9F;
	Fri, 24 Jan 2025 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwOU5Box"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A14A218AD7;
	Fri, 24 Jan 2025 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737707139; cv=none; b=t4nKwRIW+LB3vINVlJcQ5H9uPa5l/R9ie7Q/oJKEvPnWprcFiu/Z4RhZhWM1wU4KKI1M3V2TM1CsbdRk91p4QIz6rnlKcx9xphFsqOgHddTt40N8Cj3FSWTs32xLXjB3gsDyjkHgdp9i296zAGRrgQVJfaM0mwX00nno2TX9pJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737707139; c=relaxed/simple;
	bh=x26BlNIlodJcFOTbs1Ak7gzDS8ZSUxVog8qPx6PkJOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lt+kGb2lGefyh7wZ6463a1sjAVk+QqTDn6XKGQvlFHPFb9Yuy0JjPzcsy5gKoLP+/BtZZ5YWM7QF0nPgwZWenXDTp25CG7L5brnL4d0ualdm7nsQvKk4Cth+FFayKqqUOmqoREBoU3kL7M1LqGb5McGfqulWNA4E6vR7klbuqzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwOU5Box; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0817FC4CED2;
	Fri, 24 Jan 2025 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737707138;
	bh=x26BlNIlodJcFOTbs1Ak7gzDS8ZSUxVog8qPx6PkJOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwOU5BoxiuL2w9OJRXglPvu/vUssSQnDY50Nh85vPzUEtETR+jCiAlFLrGrfmEf8R
	 ZxdiEK7ElK/67c5nxrXZyhtQtdU3wkcSL6SmWNr8erMfladBbPs/3pkc7IZtZZMQMR
	 mfS97IxieYkbUx2H29Pgwr0hknhKwVJrj8xdK08WooqruWi0gtnVGFexMJGzdLUvRQ
	 9A1y+c4u7QduuPReR7lIWrplunI8THOGxR0cjwy8p3YT/FnKtsHtwsN+xGAIhyEjKK
	 7xmGpWxmk4ygoDE0wZ17XE5sBXOWQ8P7UsRQRdJu7dVrHyp8IPHi7hJOvRSHpfR+Yu
	 g163vCinRtfAg==
Date: Fri, 24 Jan 2025 13:55:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Subject: Re: [PATCH v3] scsi: ufs: fix use-after free in init error and
 remove paths
Message-ID: <20250124082525.ejkftp7vvrq6ua4x@thinkpad>
References: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>

On Thu, Jan 16, 2025 at 11:18:08AM +0000, André Draszik wrote:
> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshd allocation.
> 
> During driver release or during error handling in ufshcd_pltfrm_init(),
> this structure is released as part of ufshcd_dealloc_host() before the
> (platform-) device associated with the crypto call above is released.
> Once this device is released, the crypto cleanup code will run, using
> the just-released 'struct ufs_hba::crypto_profile'. This causes a
> use-after-free situation:
> 
>     exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() failed -11
>     exynos-ufshc 14700000.ufs: probe with driver exynos-ufshc failed with error -11
>     Unable to handle kernel paging request at virtual address 01adafad6dadad88
>     Mem abort info:
>       ESR = 0x0000000096000004
>       EC = 0x25: DABT (current EL), IL = 32 bits
>       SET = 0, FnV = 0
>       EA = 0, S1PTW = 0
>       FSC = 0x04: level 0 translation fault
>     Data abort info:
>       ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>       CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>       GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>     [01adafad6dadad88] address between user and kernel address ranges
>     Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>     Modules linked in:
>     CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.13.0-rc5-next-20250106+ #70
>     Tainted: [W]=WARN
>     Hardware name: Oriole (DT)
>     pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : kfree+0x60/0x2d8
>     lr : kvfree+0x44/0x60
>     sp : ffff80008009ba80
>     x29: ffff80008009ba90 x28: 0000000000000000 x27: ffffbcc6591e0130
>     x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: ffffbcc659539d80
>     x23: ffff22e000940040 x22: ffff22e001539010 x21: ffffbcc65714b22c
>     x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 0000000000000000
>     x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: ffffbcc657a027f4
>     x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: ffffbcc6579fb194
>     x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : ffffbcc65714b22c
>     x8 : ffff80008009b880 x7 : 0000000000000000 x6 : ffff80008009b940
>     x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : ffff22e006f54f40
>     x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : ffffc1ffc0000000

You can strip these register dump and abort info.

>     Call trace:
>      kfree+0x60/0x2d8 (P)
>      kvfree+0x44/0x60
>      blk_crypto_profile_destroy_callback+0x28/0x70
>      devm_action_release+0x1c/0x30
>      release_nodes+0x6c/0x108
>      devres_release_all+0x98/0x100
>      device_unbind_cleanup+0x20/0x70
>      really_probe+0x218/0x2d0
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
> ---
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
>  drivers/ufs/core/ufshcd.c        | 27 +++++++++++++++++----------
>  drivers/ufs/host/ufshcd-pci.c    |  2 --
>  drivers/ufs/host/ufshcd-pltfrm.c | 11 ++++-------
>  include/ufs/ufshcd.h             |  1 -
>  4 files changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 43ddae7318cb..8351795296bb 100644
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
> @@ -10307,6 +10297,16 @@ static int ufshcd_set_dma_mask(struct ufs_hba *hba)
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

Please update the kdoc too.

>   * @dev: pointer to device handle
> @@ -10334,6 +10334,13 @@ int ufshcd_alloc_host(struct device *dev, struct ufs_hba **hba_handle)
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
> index 505572d4fa87..adb0a65d9df5 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -488,13 +488,13 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
>  	if (err) {
>  		dev_err(dev, "%s: clock parse failed %d\n",
>  				__func__, err);
> -		goto dealloc_host;
> +		goto out;

This 'goto out' is pointless now. Please return the errno directly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


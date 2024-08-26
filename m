Return-Path: <linux-arm-msm+bounces-29488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3956395EFDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 13:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54FC280F6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 11:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29347155389;
	Mon, 26 Aug 2024 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BAXJr0Nn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5CF1547C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724672210; cv=none; b=ie0faVLy9OKr5zr+wUBrXZhvGMdg9cWSa7YKLSAHRbT6ps+FJYlfZiTCNci3lYhRQyE6FkNi59IaNtBkdUdXk1+ixZztt8H4ZgSX+QR5Sfxp3oAZhHY7UtLhdwyzuOl+RfHztJwmkuGWgS/m5+uSUtPxdnLBmYB4tv7xKY02UFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724672210; c=relaxed/simple;
	bh=viPyuROUTeekllWPMisGYV8X++jFkeZ4J5mNBK4kLyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCQrOSAJLu5cyN07LOFJcn3/7DDd9/rxV0voNtyGZkIkeuMMO0TOeEC72w57LD30XIUwadRtJMFw+WjMkw3dqiDQKw7HucHiq4sGF/J0bHGzpbsf5HOPqdEJkGa1SjrqLtgLAThi1Lk/PFKBvxDcqrrQVaugtGilaaw6XvK5LmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BAXJr0Nn; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso4361623276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724672206; x=1725277006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3WuBkNkQq7ncBHhLfidrPpVIWONY2++qBbCcAKeFG0A=;
        b=BAXJr0NnQt/nTG1VcshDZQi0Hq6UYXabOEZlYaIz4BmgmNdfocXBrVtcY8EzK8IxJ3
         rjSaTGd+9sbOcIwJIDR/sijgLDcyXL59mThzEyVP/LFtlOkehYA7+FxNoHPAIcJSmsea
         d1yrHnIBWvC3oU6QDaq8rc+cJFqpoZEKPCPSx79yX2cZsKR9ojsyXAuJhz149ekf8o7H
         UL6xsDPwOCXT36HSWGowg16VT/TIsFBeub28Aw5I4eailpHYFyBDMtW1qsYeuQWv5iaj
         5NqKXDRqU6vZU6ChIyG7r1POllhtJ6VtYqPSRMY7cJtwU4WI97e9pvh8HwWKAaDQ9wX4
         ufNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724672206; x=1725277006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WuBkNkQq7ncBHhLfidrPpVIWONY2++qBbCcAKeFG0A=;
        b=Bzv6mzTU5Y9w5UNico2IfIkc5LZT01XzkpZSlN0Nm4m1lANcI57xX81Nfb8mwbau3D
         beHRtoMgZOuAPANzNJ2lGpHikc5Y1+/aPaAm0TpjKRWolT4Yr6O/EqUA3uGABMxs0vmn
         M1qZCgi+2aijgBEu54u8usSw6zJOdbxz9wqwTbn/Bhn+tD14aPxVO018h1k9ZUpEjrPu
         +4zAsIGgTlcs5a8yYt6ckDVBddfdi/F+SVCSCBpY4OXXoYGii8Ra020M4e+svL+mBPLj
         1wv8B/WlnZWiFFAeuCcZ7PfSf2ne6HHGiSkxOhr8yrG8jkgMEVV3EGgwXAbGUskiH9q3
         EgUg==
X-Forwarded-Encrypted: i=1; AJvYcCXT49Ekwi4Xi65Y3sZWyaAQnTsIzoUy4WzL2+R4qGnHCo85dXrTbfBmuNu9LsVmv9FrxTqhRPcofzjEt8qA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ddDXM2DIRoyj8ZBjGaSVCEAFbG2FbozPb54VyyudWebI79YW
	9pU4l+4frJMf2JUyW7XW0IdSZZOombo3PJjX8Xw8BZhFeQQnCJbVmP4PRzAx6rpOQeccEp//kKr
	iLNk/31ecaHb+LRybCX3+h042n0lePIoCPc/yCg==
X-Google-Smtp-Source: AGHT+IFTmCOXbkWFVjFKxNQjfliOW8Z+x4s+zXNlqgxkRfvBAgPO0UAeheCBnSP89lF7epHbxvk3ur82nxWQLLc8Og4=
X-Received: by 2002:a05:6902:1a46:b0:e0b:4045:ada0 with SMTP id
 3f1490d57ef6-e17a83d45d4mr9340283276.23.1724672206061; Mon, 26 Aug 2024
 04:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824034925.1163244-1-hch@lst.de> <20240824034925.1163244-5-hch@lst.de>
In-Reply-To: <20240824034925.1163244-5-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 26 Aug 2024 13:36:09 +0200
Message-ID: <CAPDyKFrnP5uZ8H3CL5P7bwjRnPwNPDF-U7amm1fwGeob63GYmw@mail.gmail.com>
Subject: Re: [PATCH 4/4] dma-mapping: don't return errors from dma_set_max_seg_size
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-hyperv@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Aug 2024 at 05:51, Christoph Hellwig <hch@lst.de> wrote:
>
> A NULL dev->dma_parms indicates either a bus that is not DMA capable or
> grave bug in the implementation of the bus code.
>
> There isn't much the driver can do in terms of error handling for either
> case, so just warn and continue as DMA operations will fail anyway.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/accel/qaic/qaic_drv.c                         |  4 +---
>  drivers/dma/idma64.c                                  |  4 +---
>  drivers/dma/pl330.c                                   |  5 +----
>  drivers/dma/qcom/bam_dma.c                            |  6 +-----
>  drivers/dma/sh/rcar-dmac.c                            |  4 +---
>  drivers/dma/ste_dma40.c                               |  6 +-----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c                |  6 +-----
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c |  3 +--
>  drivers/media/pci/intel/ipu6/ipu6.c                   |  4 +---
>  drivers/mmc/host/mmci_stm32_sdmmc.c                   |  3 ++-
>  drivers/net/ethernet/microsoft/mana/gdma_main.c       |  6 +-----
>  drivers/scsi/lpfc/lpfc_init.c                         |  7 +------
>  include/linux/dma-mapping.h                           | 10 ++++------
>  13 files changed, 17 insertions(+), 51 deletions(-)

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe

>
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 580b29ed190217..bf10156c334e71 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -447,9 +447,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
>         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>         if (ret)
>                 return ret;
> -       ret = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> -       if (ret)
> -               return ret;
> +       dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>
>         qdev->bar_0 = devm_ioremap_resource(&pdev->dev, &pdev->resource[0]);
>         if (IS_ERR(qdev->bar_0))
> diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
> index e3505e56784b1a..1398814d8fbb63 100644
> --- a/drivers/dma/idma64.c
> +++ b/drivers/dma/idma64.c
> @@ -598,9 +598,7 @@ static int idma64_probe(struct idma64_chip *chip)
>
>         idma64->dma.dev = chip->sysdev;
>
> -       ret = dma_set_max_seg_size(idma64->dma.dev, IDMA64C_CTLH_BLOCK_TS_MASK);
> -       if (ret)
> -               return ret;
> +       dma_set_max_seg_size(idma64->dma.dev, IDMA64C_CTLH_BLOCK_TS_MASK);
>
>         ret = dma_async_device_register(&idma64->dma);
>         if (ret)
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 60c4de8dac1d2a..82a9fe88ad54c9 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -3163,10 +3163,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>          * This is the limit for transfers with a buswidth of 1, larger
>          * buswidths will have larger limits.
>          */
> -       ret = dma_set_max_seg_size(&adev->dev, 1900800);
> -       if (ret)
> -               dev_err(&adev->dev, "unable to set the seg size\n");
> -
> +       dma_set_max_seg_size(&adev->dev, 1900800);
>
>         init_pl330_debugfs(pl330);
>         dev_info(&adev->dev,
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 5e7d332731e0c1..368ffaa4003789 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1325,11 +1325,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>
>         /* set max dma segment size */
>         bdev->common.dev = bdev->dev;
> -       ret = dma_set_max_seg_size(bdev->common.dev, BAM_FIFO_SIZE);
> -       if (ret) {
> -               dev_err(bdev->dev, "cannot set maximum segment size\n");
> -               goto err_bam_channel_exit;
> -       }
> +       dma_set_max_seg_size(bdev->common.dev, BAM_FIFO_SIZE);
>
>         platform_set_drvdata(pdev, bdev);
>
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 40482cb73d798a..1094a2f821649c 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1868,9 +1868,7 @@ static int rcar_dmac_probe(struct platform_device *pdev)
>
>         dmac->dev = &pdev->dev;
>         platform_set_drvdata(pdev, dmac);
> -       ret = dma_set_max_seg_size(dmac->dev, RCAR_DMATCR_MASK);
> -       if (ret)
> -               return ret;
> +       dma_set_max_seg_size(dmac->dev, RCAR_DMATCR_MASK);
>
>         ret = dma_set_mask_and_coherent(dmac->dev, DMA_BIT_MASK(40));
>         if (ret)
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index 2c489299148eee..d52e1685aed53f 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -3632,11 +3632,7 @@ static int __init d40_probe(struct platform_device *pdev)
>         if (ret)
>                 goto destroy_cache;
>
> -       ret = dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
> -       if (ret) {
> -               d40_err(dev, "Failed to set dma max seg size\n");
> -               goto destroy_cache;
> -       }
> +       dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
>
>         d40_hw_init(base);
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 77b50c56c124ce..3e807195a0d03a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -559,11 +559,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>          * Configure the DMA segment size to make sure we get contiguous IOVA
>          * when importing PRIME buffers.
>          */
> -       ret = dma_set_max_seg_size(dma_dev, UINT_MAX);
> -       if (ret) {
> -               dev_err(dma_dev, "Failed to set DMA segment size\n");
> -               goto err_component_unbind;
> -       }
> +       dma_set_max_seg_size(dma_dev, UINT_MAX);
>
>         ret = drm_vblank_init(drm, MAX_CRTC);
>         if (ret < 0)
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef53107c..bb0b7fa67b539a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -854,8 +854,7 @@ int vb2_dma_contig_set_max_seg_size(struct device *dev, unsigned int size)
>                 return -ENODEV;
>         }
>         if (dma_get_max_seg_size(dev) < size)
> -               return dma_set_max_seg_size(dev, size);
> -
> +               dma_set_max_seg_size(dev, size);
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index bbd646378ab3ed..83e70c692d957f 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -576,9 +576,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
>
> -       ret = dma_set_max_seg_size(dev, UINT_MAX);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "Failed to set max_seg_size\n");
> +       dma_set_max_seg_size(dev, UINT_MAX);
>
>         ret = ipu6_pci_config_setup(pdev, isp->hw_ver);
>         if (ret)
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index f5da7f9baa52d4..9dc51859c2e51e 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -213,7 +213,8 @@ static int sdmmc_idma_setup(struct mmci_host *host)
>                 host->mmc->max_seg_size = host->mmc->max_req_size;
>         }
>
> -       return dma_set_max_seg_size(dev, host->mmc->max_seg_size);
> +       dma_set_max_seg_size(dev, host->mmc->max_seg_size);
> +       return 0;
>  }
>
>  static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
> diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> index ddb8f68d80a206..ca4ed58f1206dd 100644
> --- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
> +++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> @@ -1496,11 +1496,7 @@ static int mana_gd_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>         if (err)
>                 goto release_region;
>
> -       err = dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> -       if (err) {
> -               dev_err(&pdev->dev, "Failed to set dma device segment size\n");
> -               goto release_region;
> -       }
> +       dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>
>         err = -ENOMEM;
>         gc = vzalloc(sizeof(*gc));
> diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
> index e1dfa96c2a553a..50620918becd59 100644
> --- a/drivers/scsi/lpfc/lpfc_init.c
> +++ b/drivers/scsi/lpfc/lpfc_init.c
> @@ -13861,12 +13861,7 @@ lpfc_get_sli4_parameters(struct lpfc_hba *phba, LPFC_MBOXQ_t *mboxq)
>         if (sli4_params->sge_supp_len > LPFC_MAX_SGE_SIZE)
>                 sli4_params->sge_supp_len = LPFC_MAX_SGE_SIZE;
>
> -       rc = dma_set_max_seg_size(&phba->pcidev->dev, sli4_params->sge_supp_len);
> -       if (unlikely(rc)) {
> -               lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
> -                               "6400 Can't set dma maximum segment size\n");
> -               return rc;
> -       }
> +       dma_set_max_seg_size(&phba->pcidev->dev, sli4_params->sge_supp_len);
>
>         /*
>          * Check whether the adapter supports an embedded copy of the
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 6bd1333dbacb9b..1524da363734af 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -524,13 +524,11 @@ static inline unsigned int dma_get_max_seg_size(struct device *dev)
>         return SZ_64K;
>  }
>
> -static inline int dma_set_max_seg_size(struct device *dev, unsigned int size)
> +static inline void dma_set_max_seg_size(struct device *dev, unsigned int size)
>  {
> -       if (dev->dma_parms) {
> -               dev->dma_parms->max_segment_size = size;
> -               return 0;
> -       }
> -       return -EIO;
> +       if (WARN_ON_ONCE(!dev->dma_parms))
> +               return;
> +       dev->dma_parms->max_segment_size = size;
>  }
>
>  static inline unsigned long dma_get_seg_boundary(struct device *dev)
> --
> 2.43.0
>
>


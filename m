Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DD237123D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 10:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhECIEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 04:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhECIEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 04:04:31 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B602C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 01:03:37 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id e15so3582015pfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XcF0z2dFCCNyxn6iFGMBvrA0YUDhvYg4ndPStJNu9oo=;
        b=uqlZunP2PH/YsYZdokNFi9HNRbzIz2lY8LHWViRgCA1BEIh2Z36Mggs8YOn+qlLNP4
         8j6Tk0bRlb4mYMI9MXy3cDAbCroTnIepywmbmzfP6rbMjA0die1EawA6d8wMPeIOTVoB
         t40T+19r2xHia1LtKBD1Kvyu8pDUIDa0EpHmX5WeZOj/8orsyHv3+hkofXHVpEMpswWv
         wEsmSk3nDssJsW0BDY+oy9pOC8MjF/8v7CmbUPminCa4X+P2DVi8GWYR+oeLPwxyn76b
         fEkJv/86nnbY1j1plIKhVQ8xWttx0cHPIJPN5C1UL4a8+4Us3rMflK8y5ABOEXQlbjpM
         N+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XcF0z2dFCCNyxn6iFGMBvrA0YUDhvYg4ndPStJNu9oo=;
        b=XNFQkGsabYSOKLAETXYaA98rXLQ6bXcIMduUS4tZ1exL5X1amwlobN+iUa72z/75rf
         xNndXr/FpHgZWTATDScXWH473LFU9v7uS9aRgV36vck3rftF1QKf4BJxcsF+TVgx0n/4
         kBr8SrCFHQhUrPEFbS8eZDBy+rE78iW5O3357rz8kD5P40JitnlW3jqMJd2yPM49zpx2
         fpNS8ULHBxF8Wxtfd3/U6Dm17KK0ZnkkGJL7toSY8eG2Vd6cXcUE8rIzZVY4h5D3kGAu
         cAPOiS+ppIoDbltqDSxkVfhPkxcW+lA9NRlHWUYu45cbxMXB3lay/1g2gOA4rjTfbQ5F
         xxCw==
X-Gm-Message-State: AOAM531SMguf7GinigH8Jvi6YZcVO1KnIX4tTJjAkaDsov2pBcNV0ohE
        dVEWiABFjdrZxcTs7rlYFccbYHVEuD3JSB9N4tCh7nQKLN3dyw==
X-Google-Smtp-Source: ABdhPJy7Nve2nCn7K5Vo8dD2HCgpnvXx2ZYDCXMH3/f38eTojqb0gjGIxW6OJQwSCdf77uxkchybQ1qbfTA3xG4retI=
X-Received: by 2002:a63:9d4e:: with SMTP id i75mr16770187pgd.443.1620029016772;
 Mon, 03 May 2021 01:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <1617814235-25634-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1617814235-25634-1-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 3 May 2021 10:12:12 +0200
Message-ID: <CAMZdPi8-umnLjEjFOnQhSduW5+7d_eUtqAZyerMKaUTOntgaAw@mail.gmail.com>
Subject: Re: [RESEND PATCH] bus: mhi: Add inbound buffers allocation flag
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani, Hemant,

On Wed, 7 Apr 2021 at 18:41, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> Currently, the MHI controller driver defines which channels should
> have their inbound buffers allocated and queued. But ideally, this is
> something that should be decided by the MHI device driver instead,
> which actually deals with that buffers.
>
> Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> if buffers have to be allocated and queued by the MHI stack.
>
> Keep auto_queue flag for now, but should be removed at some point.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---

Would you consider this one for 5.13. Without it, MHI modems with IPCR
channel are not usable because of lacking of RX buffer allocation.

Thanks,
Loic


>  drivers/bus/mhi/core/internal.h |  2 +-
>  drivers/bus/mhi/core/main.c     | 11 ++++++++---
>  drivers/net/mhi/net.c           |  2 +-
>  include/linux/mhi.h             | 12 +++++++++++-
>  net/qrtr/mhi.c                  |  2 +-
>  5 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 5b9ea66..672052f 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -682,7 +682,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>                       struct image_info *img_info);
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
> -                       struct mhi_chan *mhi_chan);
> +                       struct mhi_chan *mhi_chan, enum mhi_chan_flags flags);
>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>                        struct mhi_chan *mhi_chan);
>  void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 0f1febf..432b53b 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1384,7 +1384,8 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
>  }
>
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
> -                       struct mhi_chan *mhi_chan)
> +                       struct mhi_chan *mhi_chan,
> +                       enum mhi_chan_flags flags)
>  {
>         int ret = 0;
>         struct device *dev = &mhi_chan->mhi_dev->dev;
> @@ -1409,6 +1410,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>         if (ret)
>                 goto error_pm_state;
>
> +       if (mhi_chan->dir == DMA_FROM_DEVICE)
> +               mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
> +
>         /* Pre-allocate buffer for xfer ring */
>         if (mhi_chan->pre_alloc) {
>                 int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
> @@ -1555,7 +1559,8 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
>  }
>
>  /* Move channel to start state */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
> +                            enum mhi_chan_flags flags)
>  {
>         int ret, dir;
>         struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -1566,7 +1571,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
>                 if (!mhi_chan)
>                         continue;
>
> -               ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
> +               ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
>                 if (ret)
>                         goto error_open_chan;
>         }
> diff --git a/drivers/net/mhi/net.c b/drivers/net/mhi/net.c
> index 5ec7a29..06e1455 100644
> --- a/drivers/net/mhi/net.c
> +++ b/drivers/net/mhi/net.c
> @@ -327,7 +327,7 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>         u64_stats_init(&mhi_netdev->stats.tx_syncp);
>
>         /* Start MHI channels */
> -       err = mhi_prepare_for_transfer(mhi_dev);
> +       err = mhi_prepare_for_transfer(mhi_dev, 0);
>         if (err)
>                 goto out_err;
>
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d095fba..9372acf 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -60,6 +60,14 @@ enum mhi_flags {
>  };
>
>  /**
> + * enum mhi_chan_flags - MHI channel flags
> + * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue inbound buffers
> + */
> +enum mhi_chan_flags {
> +       MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
> +};
> +
> +/**
>   * enum mhi_device_type - Device types
>   * @MHI_DEVICE_XFER: Handles data transfer
>   * @MHI_DEVICE_CONTROLLER: Control device
> @@ -719,8 +727,10 @@ void mhi_device_put(struct mhi_device *mhi_dev);
>   *                            host and device execution environments match and
>   *                            channels are in a DISABLED state.
>   * @mhi_dev: Device associated with the channels
> + * @flags: MHI channel flags
>   */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
> +                            enum mhi_chan_flags flags);
>
>  /**
>   * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 2bf2b19..47afded 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -77,7 +77,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>         int rc;
>
>         /* start channels */
> -       rc = mhi_prepare_for_transfer(mhi_dev);
> +       rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
>         if (rc)
>                 return rc;
>
> --
> 2.7.4
>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A64D4295D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 19:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233005AbhJKRjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 13:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbhJKRjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 13:39:48 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2513EC061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 10:37:47 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id u20-20020a9d7214000000b0054e170300adso22559685otj.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tj0ez8KOIN3iGavit2nL31CdJWBPsMoFo8+gcn8vAXw=;
        b=k5ipc3mQAiV0dS9BwOOkFinF90cqy17wrCoe1I1PNBdMpcHiQp6gvslxlfGPI70NxJ
         qUrKcIxLFNEE7qgg7R5jHasMtvpdAbp9sDtZF3pBN3gapqOkOydT0JE+c1F0di39XM2Z
         VbuNyetuNkmF8i7ee8VH6xYeUAT+tIhNUZQM76g+AD5BsQgirr2Le9dN7W1duKr7XE4T
         DxRSCgGT/7Hy9cBkMcr1d06r8QMvHBKPiMFigFg1H4QKX4EVCeJa4s5as5RgRtgNIfvA
         J9C9gPNCT2JaHhvi6dvm+Ykt3111sT6AnuSz5qrY99nMFAzBnc3J8CdaTzuFra230vzp
         T+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tj0ez8KOIN3iGavit2nL31CdJWBPsMoFo8+gcn8vAXw=;
        b=RY2TgF/SM/MDepHjBKZH4sI9xWnwYbAjEzIVIh1D3SwaPFIAQzOajjEbDjZUACfGo4
         hpCoVbDe0WedrrMWRUSvSobxqvvJa9cFkxcCxTUNL/IvxMjKRO0OawxEtIIUad0Lue/A
         FRh6JUXOD39Ias1nzOVDYGJcNm9uxuqx1JXtuOS0mBPr+TnUx0ghqx5frWxIEERbRx9E
         fu8M1lMAhfZV9Oe80ctK1IrGz5OEttTY3xaWSZGwnmdqMcWj0LgntbO1G7D+uKp/lspz
         TIYbRlJcrAr04bD6gczlbcitk4kujbe6WzfwvjIgOCGwjakuJcYXgTJhf9JsGQ+qs1Rt
         c4+g==
X-Gm-Message-State: AOAM530melNFbBW7HQXpkiMobO18dwLILFVJWlfOIeZAkj1bkfbz+SJR
        I/0z1c8bkMhIFn9oVk/VFa6aiQ==
X-Google-Smtp-Source: ABdhPJx84ZRrul5YadMUtFSkOfvABSC5HC18sJxJwkxN2sgpQFbW7cFm812AGdbEjSMEwU72VtM8vA==
X-Received: by 2002:a05:6830:17da:: with SMTP id p26mr22664423ota.116.1633973866343;
        Mon, 11 Oct 2021 10:37:46 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id s18sm1820955oij.3.2021.10.11.10.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 10:37:45 -0700 (PDT)
Date:   Mon, 11 Oct 2021 10:39:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH net-next v2 2/4] dmaengine: qcom: bam_dma: Add "powered
 remotely" mode
Message-ID: <YWR2yN3x3zroz1GX@ripper>
References: <20211011141733.3999-1-stephan@gerhold.net>
 <20211011141733.3999-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011141733.3999-3-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Oct 07:17 PDT 2021, Stephan Gerhold wrote:

> In some configurations, the BAM DMA controller is set up by a remote
> processor and the local processor can simply start making use of it
> without setting up the BAM. This is already supported using the
> "qcom,controlled-remotely" property.
> 
> However, for some reason another possible configuration is that the
> remote processor is responsible for powering up the BAM, but we are
> still responsible for initializing it (e.g. resetting it etc).
> 
> This configuration is quite challenging to handle properly because
> the power control is handled through separate channels
> (e.g. device-specific SMSM interrupts / smem-states). Great care
> must be taken to ensure the BAM registers are not accessed while
> the BAM is powered off since this results in a bus stall.
> 
> Attempt to support this configuration with minimal device-specific
> code in the bam_dma driver by tracking the number of requested
> channels. Consumers of DMA channels are responsible to only request
> DMA channels when the BAM was powered on by the remote processor,
> and to release them before the BAM is powered off.
> 
> When the first channel is requested the BAM is initialized (reset)
> and it is also put into reset when the last channel was released.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Changes since RFC:
>   - Drop qcom-specific terminology "power collapse", instead rename
>     "qcom,remote-power-collapse" -> "qcom,powered-remotely"
> 
> NOTE: This is *not* a compile-time requirement for the BAM-DMUX driver
>       so this could also go through the dmaengine tree.
> 
> See original RFC for a discussion of alternative approaches to handle
> this configuration:
>   https://lore.kernel.org/netdev/20210719145317.79692-3-stephan@gerhold.net/
> ---
>  drivers/dma/qcom/bam_dma.c | 88 ++++++++++++++++++++++++--------------
>  1 file changed, 56 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c8a77b428b52..1b33a3ebbfec 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -388,6 +388,8 @@ struct bam_device {
>  	/* execution environment ID, from DT */
>  	u32 ee;
>  	bool controlled_remotely;
> +	bool powered_remotely;
> +	u32 active_channels;
>  
>  	const struct reg_offset_data *layout;
>  
> @@ -415,6 +417,44 @@ static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
>  		r.ee_mult * bdev->ee;
>  }
>  
> +/**
> + * bam_reset - reset and initialize BAM registers

Please include a set of () after the function name.

> + * @bdev: bam device
> + */
> +static void bam_reset(struct bam_device *bdev)
> +{
> +	u32 val;
> +
> +	/* s/w reset bam */
> +	/* after reset all pipes are disabled and idle */
> +	val = readl_relaxed(bam_addr(bdev, 0, BAM_CTRL));
> +	val |= BAM_SW_RST;
> +	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
> +	val &= ~BAM_SW_RST;
> +	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));

Seems odd to me that we assert and deassert the reset in back-to-back
writes, without any delay etc. That said, this is unrelated to your
patch as you just moved this hunk from below.

> +
> +	/* make sure previous stores are visible before enabling BAM */
> +	wmb();
> +
> +	/* enable bam */
> +	val |= BAM_EN;
> +	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
> +
> +	/* set descriptor threshhold, start with 4 bytes */
> +	writel_relaxed(DEFAULT_CNT_THRSHLD,
> +			bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
> +
> +	/* Enable default set of h/w workarounds, ie all except BAM_FULL_PIPE */
> +	writel_relaxed(BAM_CNFG_BITS_DEFAULT, bam_addr(bdev, 0, BAM_CNFG_BITS));
> +
> +	/* enable irqs for errors */
> +	writel_relaxed(BAM_ERROR_EN | BAM_HRESP_ERR_EN,
> +			bam_addr(bdev, 0, BAM_IRQ_EN));
> +
> +	/* unmask global bam interrupt */
> +	writel_relaxed(BAM_IRQ_MSK, bam_addr(bdev, 0, BAM_IRQ_SRCS_MSK_EE));
> +}
> +
>  /**
>   * bam_reset_channel - Reset individual BAM DMA channel
>   * @bchan: bam channel
> @@ -512,6 +552,9 @@ static int bam_alloc_chan(struct dma_chan *chan)
>  		return -ENOMEM;
>  	}
>  
> +	if (bdev->active_channels++ == 0 && bdev->powered_remotely)
> +		bam_reset(bdev);
> +
>  	return 0;
>  }
>  
> @@ -565,6 +608,13 @@ static void bam_free_chan(struct dma_chan *chan)
>  	/* disable irq */
>  	writel_relaxed(0, bam_addr(bdev, bchan->id, BAM_P_IRQ_EN));
>  
> +	if (--bdev->active_channels == 0 && bdev->powered_remotely) {
> +		/* s/w reset bam */
> +		val = readl_relaxed(bam_addr(bdev, 0, BAM_CTRL));
> +		val |= BAM_SW_RST;
> +		writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
> +	}
> +
>  err:
>  	pm_runtime_mark_last_busy(bdev->dev);
>  	pm_runtime_put_autosuspend(bdev->dev);
> @@ -1164,38 +1214,10 @@ static int bam_init(struct bam_device *bdev)
>  		bdev->num_channels = val & BAM_NUM_PIPES_MASK;
>  	}
>  
> -	if (bdev->controlled_remotely)
> +	if (bdev->controlled_remotely || bdev->powered_remotely)
>  		return 0;

I think the resulting code would be cleaner if you flipped it around as:

	/* Reset BAM now if fully controlled locally */
	if (!bdev->controlled_remotely && !bdev->powered_remotely)
		bam_reset(bdev);

	return 0;

Regards,
Bjorn

>  
> -	/* s/w reset bam */
> -	/* after reset all pipes are disabled and idle */
> -	val = readl_relaxed(bam_addr(bdev, 0, BAM_CTRL));
> -	val |= BAM_SW_RST;
> -	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
> -	val &= ~BAM_SW_RST;
> -	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
> -
> -	/* make sure previous stores are visible before enabling BAM */
> -	wmb();
> -
> -	/* enable bam */
> -	val |= BAM_EN;
> -	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
> -
> -	/* set descriptor threshhold, start with 4 bytes */
> -	writel_relaxed(DEFAULT_CNT_THRSHLD,
> -			bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
> -
> -	/* Enable default set of h/w workarounds, ie all except BAM_FULL_PIPE */
> -	writel_relaxed(BAM_CNFG_BITS_DEFAULT, bam_addr(bdev, 0, BAM_CNFG_BITS));
> -
> -	/* enable irqs for errors */
> -	writel_relaxed(BAM_ERROR_EN | BAM_HRESP_ERR_EN,
> -			bam_addr(bdev, 0, BAM_IRQ_EN));
> -
> -	/* unmask global bam interrupt */
> -	writel_relaxed(BAM_IRQ_MSK, bam_addr(bdev, 0, BAM_IRQ_SRCS_MSK_EE));
> -
> +	bam_reset(bdev);
>  	return 0;
>  }

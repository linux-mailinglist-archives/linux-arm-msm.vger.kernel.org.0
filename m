Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6892A00B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 10:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgJ3JFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 05:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ3JFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 05:05:47 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACF8C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 02:05:46 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z1so2635261plo.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 02:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AbksnLfkcwG8yf5ykfRdvvZSe6AB/bMZVij8MToOslM=;
        b=eTrTkDr1kTichRbE8kLMaWmpVBJQBT451cQFCXJ00FJLPA2LdU61Ggv7JDofL5ZYGl
         xeVQTOu7vQOWCtVJmRHXDUqUNr1Sv1Zh2uxRd0BlEPm2STUYmoZXA9fi0WJ7PS0/QrOU
         NTMifAxSm7Zs6n8qfpum/IQroxNpaowCDbFkJSWGLDZYgNkiLZZXBQNrd7OJ8l1VBJ6x
         8Bwd2YxCcCVlAR9liPpuGjQ5xCMd4UsfXYR8zggwN+lkjVf8cIWqm7tBcC3UV7gChxdd
         uP4DIji4gcLby+WoEXynmF9HQB15qC87gu0o/kxfVKQWEbPCjDQfQ66/u4knA55aisxY
         06tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AbksnLfkcwG8yf5ykfRdvvZSe6AB/bMZVij8MToOslM=;
        b=syYxmyDZPqUlV4tk9ZKFNCGDewij9gc+phd4sfvMPnaF+CywDKV3tvSNL4FEEru9VB
         ltqIGoG/iS6ZSLB3JQZGN1FjOTgK2auZvC6TTXQ471qi+u3jFkuMUzdxJ4EzghjZjR6T
         FvBKyz4QaGHjw84pt5/YWxSxN1bCgihcRkpamZ5GCzogktbWIaONKClaqcXizUEewMde
         +nNy1i/WgmW4rRmlrjhw4zyLqOzIsHhyF0vLeZn76Uf8FZ932Lpp1EUf1pJAuP/YZ++4
         1CoMp35SFJ1g880EzqpgJOHCWqrQII2r4UMg9mrxNuSRMNUJ1vWGmi74obca841kPKaz
         3QuQ==
X-Gm-Message-State: AOAM532eKxBfTsLTTeaH9mL3l4gY15ZahT4VNOv7Q9zVnE4vnL9B5ZGs
        YQxNuJnmkeffscBGaxbIYGRH
X-Google-Smtp-Source: ABdhPJzjJmMH5o4TOknm1Yx6FpW1rWYEOX8i/P9gy5Ro28gLBp4dY7mMHKTT+yu3mSQX7f7FqP4ClQ==
X-Received: by 2002:a17:902:a609:b029:d5:dde6:f135 with SMTP id u9-20020a170902a609b02900d5dde6f135mr8264086plq.75.1604048746340;
        Fri, 30 Oct 2020 02:05:46 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id e5sm5421996pfl.216.2020.10.30.02.05.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 02:05:45 -0700 (PDT)
Date:   Fri, 30 Oct 2020 14:35:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     kuba@kernel.org, davem@davemloft.net, hemantk@codeaurora.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, willemdebruijn.kernel@gmail.com,
        jhugo@codeaurora.org
Subject: Re: [PATCH v8 1/2] bus: mhi: Add mhi_queue_is_full function
Message-ID: <20201030090539.GB3818@Mani-XPS-13-9360>
References: <1603902898-25233-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603902898-25233-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 28, 2020 at 05:34:57PM +0100, Loic Poulain wrote:
> This function can be used by client driver to determine whether it's
> possible to queue new elements in a channel ring.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v1->v5: not part of the series
>  v6: Add this commit, used for stopping TX queue
>  v7: no change
>  v8: remove static change (up to the compiler)
> 
>  drivers/bus/mhi/core/main.c | 11 +++++++++++
>  include/linux/mhi.h         |  7 +++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index a588eac..bab38d2 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1173,6 +1173,17 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_buf);
>  
> +bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir)
> +{
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ?
> +					mhi_dev->ul_chan : mhi_dev->dl_chan;
> +	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
> +
> +	return mhi_is_ring_full(mhi_cntrl, tre_ring);
> +}
> +EXPORT_SYMBOL_GPL(mhi_queue_is_full);
> +
>  int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
>  		 struct mhi_chan *mhi_chan,
>  		 enum mhi_cmd_type cmd)
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 9d67e75..f72c3a4 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -745,4 +745,11 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  		  struct sk_buff *skb, size_t len, enum mhi_flags mflags);
>  
> +/**
> + * mhi_queue_is_full - Determine whether queueing new elements is possible
> + * @mhi_dev: Device associated with the channels
> + * @dir: DMA direction for the channel
> + */
> +bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
> +
>  #endif /* _MHI_H_ */
> -- 
> 2.7.4
> 

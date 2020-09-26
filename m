Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD4B2797A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 09:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgIZHyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 03:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZHyf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 03:54:35 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDEBC0613CE
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:54:35 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s31so82463pga.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bavBCkou6QEjA6ugIaqsFkgJZAr2rrhhhGPIoX4YOB4=;
        b=rwm0rei1RJJW4cmD8xvL7UY5Hg2bA64Yhx929T1S8q5QPgNS7U51BGxhdahtXRRMM6
         /zUMaDcja7p2AGeXsMYhaECB1r5SWtkVRrHmtQTm47BlebYqXgTvA+ir01Rg4fD1uROy
         jFA1nQgzwqGKbVokO4k5KNlQ7MJiC4f/RAo8HK57DngiamyTItWiq/pE9yejaOK4jejX
         7EACn0csXnfygJA8F6SEUuIrQR/ANS/Nktog7D7CDTO6FGFU5SPxLLBOgmvTi1ehdhrP
         DY7YyyNU63b1l44xBPbkQn68KlIzuEc2wheEP6AmSxWwG7/JdOHw6JlDzvj0LTkl9pdz
         WzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bavBCkou6QEjA6ugIaqsFkgJZAr2rrhhhGPIoX4YOB4=;
        b=rfmZ+X9Bnu8taH+bqqz50pzcVDQ5FxybLbKrVPdAp51I+kyAbpWzxmXseBqOLdmMhz
         aftuLwTCuvXNCJY7pbCOpumLHFM6C8ipX4UEdgcWnlejJeudpW1JVrzezm7/YR8oZnVv
         V58DyPbOzPCwBnr2pRYOBrreBT/vNgJzAsv81AfRaDCYLIukqOKJLrYef/bc5+0GfPcU
         C6zNs9ObiKcQy393tv9x76wdNG0JHpsZvU3xMIZW9nhk1Dwpev1Ve95rE1f3933Jt49a
         ThKyrqDkqDYWj99/thypdLvt6E2rP/NjpYksSq6A/WYCIiKiOH4nC8Z+wyAid94iolc5
         D0RQ==
X-Gm-Message-State: AOAM530b9A/4oUYxO/8n/3Y6s00upV6lhDlKRcCUNMklYOPz4OftDIM7
        pK93sdqw/mlBKAdE/4zwb8X0GF4vmiQt+X4=
X-Google-Smtp-Source: ABdhPJzAhQWr2RppxEHSk+7vQCDc4RRRUqXQcpQy5ggYaLQ/StU2W9Xjjn2jxBBR7NfauGYVrUcLIg==
X-Received: by 2002:a05:6a00:887:b029:142:2501:396f with SMTP id q7-20020a056a000887b02901422501396fmr2778742pfj.52.1601106874654;
        Sat, 26 Sep 2020 00:54:34 -0700 (PDT)
Received: from linux ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id g24sm4758084pfk.65.2020.09.26.00.54.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 00:54:34 -0700 (PDT)
Date:   Sat, 26 Sep 2020 13:24:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH] bus: mhi: debugfs: Print channel context read-pointer
Message-ID: <20200926075428.GD9302@linux>
References: <1600867828-26881-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600867828-26881-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 23, 2020 at 03:30:28PM +0200, Loic Poulain wrote:
> This value was missing in the channel debugfs output.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/debugfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> index 53d05a8..2354c09 100644
> --- a/drivers/bus/mhi/core/debugfs.c
> +++ b/drivers/bus/mhi/core/debugfs.c
> @@ -115,8 +115,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
>  		seq_printf(m, " type: 0x%x event ring: %u", chan_ctxt->chtype,
>  			   chan_ctxt->erindex);
>  
> -		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
> -			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
> +		seq_printf(m, " base: 0x%llx len: 0x%llx rp: 0x%llx wp: 0x%llx",
> +			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->rp,
> +			   chan_ctxt->wp);
>  
>  		seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
>  			   (u64)ring->rp, (u64)ring->wp,
> -- 
> 2.7.4
> 

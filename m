Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80B32C7396
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgK1Vt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732383AbgK1TAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 14:00:14 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35137C061A48
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:46:07 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b63so6240376pfg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k+0QRR6JkQyzGJIm+BkB9vKXuXXV5lrUYepfqFIqExo=;
        b=ErcvlME2+sltW3gEzSLy9LFH8+mNNtTXLBFNEZQxHvqwov2ghEJLHFRGQ+eMJrYmKP
         0LVSxSx/P7a58nwHx3kaWmgve9D8OjItx3rfp6zrawUqymle+xdX+0dECcBSH9wAyRGv
         g8OLLF1NovKomgdLLA6UCN6F453CbfnIKBuilvpwS/dOpLb42PmUIzRYn0FPcgKGNEwN
         49032fByyW9rcSocXMnOE6dFJU13a0aoXBMTEfIsCWBK06PIy2g0v/pYZlyxRFpmCbYJ
         6RMoBpW0b4FffX27vy1Wq+KP0vcqG2juQJZgP4XBGZL+k59kjj5cz+kwdiiKjH954zUf
         LNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k+0QRR6JkQyzGJIm+BkB9vKXuXXV5lrUYepfqFIqExo=;
        b=GCXFsUmYiY1tAaIC+o16NnQbEqtX/y/v8SjhccGBfWfw5lXjZ4u/AaokbriYhZOwjo
         iNrH8djWp7eUvXZwXS3DOku4B8BLZIjxTfSg9QQcMzHsg4lkkkc+R1mtDry6qKqqHWul
         20rU+Ur4qxRoFA9lFiafDfna8P8YcaMnqxZrLFUGQ9kh1M3PSSGeFc3NBquhNZaviuMH
         5k0Ea42gMEuug+tHAqmpD/bQS2hiMXGg6Nsq2cBa7dAzjHz7kUjQoSAbzNuS+VV3Pg8I
         jpL9JHSW4F+1Xhc3YjbYHXmyhUEPa8dvcmP8WzyW49CfS7mMyKdeuZigSSsDp1VdCAy8
         YQSg==
X-Gm-Message-State: AOAM530Qa1rJKOzOtTlRRJXx2pjx01TZ1qAH9/JzO2Fh/PMPeq3/KD5c
        P87fYRQlAVE2CG7liRcCl1od
X-Google-Smtp-Source: ABdhPJwzAzZqO5SPs8fjjeZ+d97lhbpk8VboTzbR59U47i4NXg0/BNQl8LRsNLov0ZB2rvuxNc2S2g==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr9568922pgh.145.1606542366636;
        Fri, 27 Nov 2020 21:46:06 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id d19sm12828174pjs.0.2020.11.27.21.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 21:46:06 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:15:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v3 4/9] mhi: pci_generic: Enable burst mode for hardware
 channels
Message-ID: <20201128054559.GC3077@thinkpad>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-5-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606404547-10737-5-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 04:29:02PM +0100, Loic Poulain wrote:
> Hardware channels have a feature called burst mode that allows to
> queue transfer ring element(s) (TRE) to a channel without ringing
> the device doorbell. In that mode, the device is polling the channel
> context for new elements. This reduces the frequency of host initiated
> doorbells and increase throughput.
> 
> Create a new dedicated macro for hardware channels with burst enabled.
> 

We might need to move these macros to mhi.h at some point...

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 4363676..6b6e5bf 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -78,6 +78,36 @@ struct mhi_pci_dev_info {
>  		.offload_channel = false,	\
>  	}
>  
> +#define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_TO_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_AMSS),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_ENABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = true,		\
> +	}						\
> +
> +#define MHI_CHANNEL_CONFIG_HW_DL(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_FROM_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_AMSS),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_ENABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = true,		\
> +	}
> +
>  #define MHI_EVENT_CONFIG_DATA(ev_ring)		\
>  	{					\
>  		.num_elements = 128,		\
> @@ -112,8 +142,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
>  	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
>  	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
> -	MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
> -	MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
>  };
>  
>  static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> -- 
> 2.7.4
> 

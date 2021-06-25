Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F443B3C11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 07:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbhFYFVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 01:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhFYFVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 01:21:41 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CF8C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 22:19:20 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m15-20020a17090a5a4fb029016f385ffad0so4881890pji.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 22:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bqFBYc/xObbq483RY+fZ3Gnp/+Sv4viuXp+H41ftTX8=;
        b=pd9pN770pA8g/OrKrsUDVvoNaOrmOB6py/BKw9jw0kq98STnHWnTUgBv3NTLWLOMkr
         J0xvrCMgWyI3Lz1CdAm87lVWrTcPcVVbboQCrhKyK6gI/K5Q8grsCp6ME18n+3HakZrP
         pIQ4tahNn5/b+/UuJqYaDmAgSOsqY+cUiN8/dxN+KfVeE6BklQN6x8u0Pmj7AMLqZVb9
         QDLoBuf42LWcLM7RZxwIg7+MYwnXw67VIGXtH1pFhSNYu6EDOJpuy7/ehRRf87Kx58K/
         RHJlQGqJBhYO3+QWyEnxYNTLZOS5cwyzW8MjKtwTzkBXXHfg47Qg7gw8hBHGqD63vizY
         qa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bqFBYc/xObbq483RY+fZ3Gnp/+Sv4viuXp+H41ftTX8=;
        b=I++/T+guxipsvN5koAdQDvW+7gajTBXlLhlVBCXg15Nhb7BaPvGiKxBoh+jaP6JulH
         G6ISXoGDbisf4tO2Sfnz4mP3YLahr4az8JhV6DMKmtFUGbKCdAaLb6GFur++Lxoxxlva
         h0HswU6b0hWEA747xN6aaAxdRvMRm0OXqKaYZ3AUfUwKILLVjbYzFWqqzxxcwuqsl+JM
         ey5rfMDuOF4J1k7vb5Ycc0NGnkkmMMr8DY3lXSemiKL+0EohATa3i4LjsJxGFP7F5V1r
         KwmZ1L5UKGgAgRbjdaMw1aGxSmX7s0tYr6Yhl6767g/AUnZP1u/c6o2tc9imbUXEHo8j
         kTVg==
X-Gm-Message-State: AOAM530gK4/D6l/SeYHnin79FNCeZZj9YcGJzqaQ49i6QpV/xikeS/48
        aT5KYpMoteW+x6bGCD6HbunH
X-Google-Smtp-Source: ABdhPJyFHjg8jzG51xOwXgV9nNGrkGEUP/VUDPgDoPwoA4OBUXU9E/YVBcTRrGPfEVmkh+NyBs7FUA==
X-Received: by 2002:a17:90b:4905:: with SMTP id kr5mr9197852pjb.161.1624598360237;
        Thu, 24 Jun 2021 22:19:20 -0700 (PDT)
Received: from workstation ([120.138.13.204])
        by smtp.gmail.com with ESMTPSA id j16sm4246938pgh.69.2021.06.24.22.19.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jun 2021 22:19:19 -0700 (PDT)
Date:   Fri, 25 Jun 2021 10:49:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Apply no-op for wake using
 sideband wake boolean
Message-ID: <20210625051916.GD4974@workstation>
References: <1624560809-30610-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624560809-30610-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 11:53:29AM -0700, Bhaumik Bhatt wrote:
> Devices such as SDX24 do not have the provision for inband wake
> doorbell in the form of channel 127 and instead have a sideband
> GPIO for it. Newer devices such as SDX55 or SDX65 support inband
> wake method by default. Ensure the functionality is used based on
> this such that device wake stays held when a client driver uses
> mhi_device_get() API or the equivalent debugfs entry.
> 
> Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake operations")
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Link: https://lore.kernel.org/r/1624053302-22470-1-git-send-email-bbhatt@codeaurora.org

Removed "Link" and applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index d84b743..26a14b3 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -32,6 +32,8 @@
>   * @edl: emergency download mode firmware path (if any)
>   * @bar_num: PCI base address register to use for MHI MMIO register space
>   * @dma_data_width: DMA transfer word size (32 or 64 bits)
> + * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
> + * 		   of inband wake support (such as sdx24)
>   */
>  struct mhi_pci_dev_info {
>  	const struct mhi_controller_config *config;
> @@ -40,6 +42,7 @@ struct mhi_pci_dev_info {
>  	const char *edl;
>  	unsigned int bar_num;
>  	unsigned int dma_data_width;
> +	bool sideband_wake;
>  };
>  
>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -242,7 +245,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx65_info = {
>  	.edl = "qcom/sdx65m/edl.mbn",
>  	.config = &modem_qcom_v1_mhiv_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
>  };
>  
>  static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
> @@ -251,7 +255,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
>  	.edl = "qcom/sdx55m/edl.mbn",
>  	.config = &modem_qcom_v1_mhiv_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
>  };
>  
>  static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
> @@ -259,7 +264,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
>  	.edl = "qcom/prog_firehose_sdx24.mbn",
>  	.config = &modem_qcom_v1_mhiv_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = true,
>  };
>  
>  static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
> @@ -301,7 +307,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  	.edl = "qcom/prog_firehose_sdx24.mbn",
>  	.config = &modem_quectel_em1xx_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = true,
>  };
>  
>  static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> @@ -339,7 +346,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.edl = "qcom/sdx55m/edl.mbn",
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
>  };
>  
>  static const struct pci_device_id mhi_pci_id_table[] = {
> @@ -640,9 +648,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl->status_cb = mhi_pci_status_cb;
>  	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>  	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> -	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
> -	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
> -	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
> +
> +	if (info->sideband_wake) {
> +		mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
> +		mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
> +		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
> +	}
>  
>  	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
>  	if (err)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

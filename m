Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBCF3AD887
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 09:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhFSHvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Jun 2021 03:51:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:40140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhFSHvb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Jun 2021 03:51:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 041D460FEE;
        Sat, 19 Jun 2021 07:49:17 +0000 (UTC)
Date:   Sat, 19 Jun 2021 13:19:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v2] bus: mhi: pci_generic: Apply no-op for wake using
 sideband wake boolean
Message-ID: <20210619074914.GE4889@workstation>
References: <1624053302-22470-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624053302-22470-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 18, 2021 at 02:55:02PM -0700, Bhaumik Bhatt wrote:
> Devices such as SDX24 do not have the provision for inband wake
> doorbell in the form of channel 127 and instead have a sideband
> GPIO for it. Newer devices such as SDX55 or SDX65 support inband
> wake method by default. Ensure the functionality is used based on
> this such that device wake stays held when a client driver uses
> mhi_device_get() API or the equivalent debugfs entry.
> 
> Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake operations")
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Applied to mhi-next with the change to kdoc!

Thanks,
Mani

> ---
> v2: Use sideband instead of no_inband_wake and update description
> Tested on: X86_64 architecture with SDX65 device on Ubuntu 18.04
> 
>  drivers/bus/mhi/pci_generic.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index d84b743..56f7107 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -32,6 +32,7 @@
>   * @edl: emergency download mode firmware path (if any)
>   * @bar_num: PCI base address register to use for MHI MMIO register space
>   * @dma_data_width: DMA transfer word size (32 or 64 bits)
> + * @sideband_wake: Devices without inband wake support (such as sdx24)
>   */
>  struct mhi_pci_dev_info {
>  	const struct mhi_controller_config *config;
> @@ -40,6 +41,7 @@ struct mhi_pci_dev_info {
>  	const char *edl;
>  	unsigned int bar_num;
>  	unsigned int dma_data_width;
> +	bool sideband_wake;
>  };
>  
>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -242,7 +244,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx65_info = {
>  	.edl = "qcom/sdx65m/edl.mbn",
>  	.config = &modem_qcom_v1_mhiv_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = false
>  };
>  
>  static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
> @@ -251,7 +254,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
>  	.edl = "qcom/sdx55m/edl.mbn",
>  	.config = &modem_qcom_v1_mhiv_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = false
>  };
>  
>  static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
> @@ -259,7 +263,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
>  	.edl = "qcom/prog_firehose_sdx24.mbn",
>  	.config = &modem_qcom_v1_mhiv_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = true
>  };
>  
>  static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
> @@ -301,7 +306,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  	.edl = "qcom/prog_firehose_sdx24.mbn",
>  	.config = &modem_quectel_em1xx_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = true
>  };
>  
>  static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> @@ -339,7 +345,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.edl = "qcom/sdx55m/edl.mbn",
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -	.dma_data_width = 32
> +	.dma_data_width = 32,
> +	.sideband_wake = false
>  };
>  
>  static const struct pci_device_id mhi_pci_id_table[] = {
> @@ -640,9 +647,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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

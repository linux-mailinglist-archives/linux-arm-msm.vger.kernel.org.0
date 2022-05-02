Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1C6517145
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 16:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237344AbiEBONk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 10:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236886AbiEBONi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 10:13:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAF465E8
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 07:10:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3817A60C89
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 14:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BEEC385AC;
        Mon,  2 May 2022 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651500608;
        bh=lf2xnHxh+e52FZBcs8r543qEia7q1Rhuf0TMXHCW9mc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IS7x3hP3HbTQEDEcnbyRjVQyFl1AMFgLSZ13HXGAEQEIjRC0Ug6DinoRvisVVnGnc
         pbjDZwlnq23YEC69Ql6y/kEzhfvALP9BE3xbqnb9AiMcvYBVXtTTTJkeScGGaSB24E
         dECJexJmdOLMBulkQHjPWgkpG0beqc2EJJU0xmymrNmAxImSmECv87fLHyxpZmk/6A
         85vqMK6vzfuiMkHBRYtP5Tq9DFd14fKMROQ5p77por1E8gbwl8xGaZdtMgRYuO5yKD
         nITFbG+/9JVz2QpSaiWmGSs/COdpaxLdJiBAg3LV2OjR63P+nHuoHcLLeufYhjggcx
         GsiyzBCpRe+DQ==
Date:   Mon, 2 May 2022 19:40:02 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: pci_generic: add Telit FN990
Message-ID: <20220502141002.GB98313@thinkpad>
References: <20220502112036.443618-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502112036.443618-1-dnlplm@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 02, 2022 at 01:20:36PM +0200, Daniele Palmas wrote:
> Add Telit FN990:
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 0308
>         Subsystem: Device 1c5d:2010
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 41 ++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index d0a7b5d3c01e..24c94c23d78b 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -489,6 +489,44 @@ static const struct mhi_pci_dev_info mhi_telit_fn980_hw_v1_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_telit_fn990_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101)
> +};
> +
> +static const struct mhi_controller_config modem_telit_fn990_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_telit_fn990_channels),
> +	.ch_cfg = mhi_telit_fn990_channels,
> +	.num_events = ARRAY_SIZE(mhi_telit_fn990_events),
> +	.event_cfg = mhi_telit_fn990_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
> +	.name = "telit-fn990",
> +	.config = &modem_telit_fn990_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -501,6 +539,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> +	/* Telit FN990 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
> -- 
> 2.32.0
> 

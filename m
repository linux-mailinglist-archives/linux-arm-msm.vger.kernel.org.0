Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9206511378
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 10:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359392AbiD0IbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 04:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359384AbiD0IbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 04:31:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CCE37A95
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 01:27:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 36D1061C0D
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 08:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1483AC385A9;
        Wed, 27 Apr 2022 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651048073;
        bh=4HvRzWljFP0kZogLP59D2+mng84twQ8e2aB6BBENma4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hG5G933xReV0el3gbCHvr9lAIG5R3v8nSNFSijEWeWWBBIGxJ56rQizUPREhNMEwF
         1XmBNDLL1GhgdZ4Io5ZSxhhLnopbFCuzoG48qsBULbWLq11KTz8TJMljQzs9DjdO+0
         CLIFhMzreDhTCac5u1qhHOor0H/GUmmaGV+5Oj3cceOdebNudgRDHBezL54hizAOhW
         M+1LSvlpfBDnqxGWr5PT6Bcd8BDz1Gc4r8AfM51uwfbqOXEnEJMTMG6PcKGUVTL7sT
         GB09Fc3051p38GzOqlE5DDEz/37j5rY0SfjSkBj6us8nr0xIJdiaUpfpdoL6qdWMPl
         hpnkegzN4mJTA==
Date:   Wed, 27 Apr 2022 13:57:47 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/1] bus: mhi: pci_generic: add Telit FN980 v1
 hardware revision
Message-ID: <20220427082747.GB2536@thinkpad>
References: <20220427072648.17635-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427072648.17635-1-dnlplm@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 27, 2022 at 09:26:48AM +0200, Daniele Palmas wrote:
> Add Telit FN980 v1 hardware revision:
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device [17cb:0306]
>         Subsystem: Device [1c5d:2000]
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Applied to mhi-next!

Thanks,
Mani

> ---
> V2: rebased after mhi_pci_id_table reordering
> ---
>  drivers/bus/mhi/host/pci_generic.c | 38 ++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 8858f3bf4f04..8e453b74e6cd 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -446,6 +446,41 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 16, 0),
> +	MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(21, "IPCR", 16, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
> +};
> +
> +static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(1, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
> +};
> +
> +static struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_telit_fn980_hw_v1_channels),
> +	.ch_cfg = mhi_telit_fn980_hw_v1_channels,
> +	.num_events = ARRAY_SIZE(mhi_telit_fn980_hw_v1_events),
> +	.event_cfg = mhi_telit_fn980_hw_v1_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_telit_fn980_hw_v1_info = {
> +	.name = "telit-fn980-hwv1",
> +	.fw = "qcom/sdx55m/sbl1.mbn",
> +	.edl = "qcom/sdx55m/edl.mbn",
> +	.config = &modem_telit_fn980_hw_v1_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -453,6 +488,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
>  		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
> +	/* Telit FN980 hardware revision v1 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
> -- 
> 2.32.0
> 

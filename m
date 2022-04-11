Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B60F4FB356
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 07:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236704AbiDKFy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 01:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235110AbiDKFy2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 01:54:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CA8338BF
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 22:52:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EF308B810AC
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 05:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F34C385A4;
        Mon, 11 Apr 2022 05:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649656332;
        bh=jA5CbXjl3NJ1rxLQ/i7+8E65FWJfezry+gSvvDJTQwQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Eh9zglOZ7XS7OSZIguK2/fvNHQvFr98tTf/aHH4a4umvvDYxK6opPyKXAcnLIDDMO
         5BpEdkKeKmwIx0vfQXoB6pvM5SnHNMHHTj+aCnVDbvMkDSSDJVyKukrT0VEQMoIU6t
         8CT1fkMGHFRfrUQFPFQUubSFmNf/Z31qVgI3zJxYHhgb8hDJWEFLvT1X/hDywQTgu4
         mitSOqf9/0QPpZqZaYmELP/T+yw1rAYPy90pFGTzGLnNK3j9V49ifY++lzhCxPBfjj
         +dRFMoIGPDfRDHt9uEEBILSXs5QBMTR/3qPTPhbvbgLfO+h5dQqIZmHDEI94neS3du
         lL8OvMM4VyFow==
Date:   Mon, 11 Apr 2022 11:22:06 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH 1/1] bus: mhi: pci_generic: add Telit FN980 v1 hardware
 revision
Message-ID: <20220411055206.GA10274@thinkpad>
References: <20220408135924.3038485-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408135924.3038485-1-dnlplm@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 08, 2022 at 03:59:24PM +0200, Daniele Palmas wrote:
> Add Telit FN980 v1 hardware revision:
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device [17cb:0306]
>         Subsystem: Device [1c5d:2000]
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 38 ++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9527b7d63840..5e786f4a3bdf 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -446,7 +446,45 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
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
>  static const struct pci_device_id mhi_pci_id_table[] = {
> +	/* Telit FN980 hardware revision v1 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },

Please rebase this patch on top of my recent patch that sorts the table [1].

Thanks,
Mani

[1] https://lore.kernel.org/mhi/20220411054831.16344-1-manivannan.sadhasivam@linaro.org/T/#u

>  	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
>  		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
> -- 
> 2.32.0
> 
> 

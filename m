Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065EB7E19BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 06:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjKFFwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 00:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjKFFwp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 00:52:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38591CC
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Nov 2023 21:52:43 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A41C433C7;
        Mon,  6 Nov 2023 05:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699249962;
        bh=bl1xXo3C8POmSGtm+2MyE1x6MgOvRgRefsalPDO1lUA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QnM/5iJpCXjxP/HZLt1GvHSy8mxyeNZkdrSWkDIHYQldtSvcZDbCFu2sWcxUnxjlz
         u7dOj9C3WSY7k2qxQP2cKYzKMKzYnsl3BdM7g54Mq/aNDQbGjC0c5VMGSK1+vXdPqr
         RhlyPwhHV2fPHD01ppT7O/Sq+iffxkfOajjer/DXN6jktiexQcOmHg43geIzggvWNS
         M3asAjf8YoS9DYjS9ItPTMQJdnCZ7iFeOqebnmjg3DqUMcs9YjSk9ZQ0ovBGvIXfzY
         RfwvKKPbvbkfpi+2W/t21m4c4DM1KibmPESDvgdn2Pm5teFJJA0QSO0jIxQfwkbFNQ
         qNIOF1GloA6Kw==
Date:   Mon, 6 Nov 2023 11:22:38 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     "Tyler J. Stachecki" <stachecki.tyler@gmail.com>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Sierra
 Wireless EM9291
Message-ID: <20231106055238.GE2474@thinkpad>
References: <20231105150510.96136-1-stachecki.tyler@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231105150510.96136-1-stachecki.tyler@gmail.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 05, 2023 at 10:05:10AM -0500, Tyler J. Stachecki wrote:
> Add support for the Sierra Wireless EM9291 modem.
> Empirically, it seems to use the same configuration as
> EM9191.
> 
> $ lspci -vv
> 03:00.0 Unassigned class [ff00]: Qualcomm Device 0308
>         Subsystem: Device 18d7:0301
> 
> Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 08f3f039dbdd..a9ac49a94832 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -503,6 +503,14 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_sierra_em929x_info = {
> +	.name = "sierra-em929x",
> +	.config = &modem_sierra_em919x_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> @@ -587,6 +595,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
>  		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
> +	/* EM929x (sdx62), use the same vid:pid as qcom-sdx65m */

I'm confused about "sdx62" since the modem is using PID of SDX65. Typo?

> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x18d7, 0x0301),
> +		.driver_data = (kernel_ulong_t) &mhi_sierra_em929x_info },

Please sort the entry as per the note above mhi_pci_id_table[].

- Mani

>  	/* Telit FN980 hardware revision v1 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
> -- 
> 2.30.2
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

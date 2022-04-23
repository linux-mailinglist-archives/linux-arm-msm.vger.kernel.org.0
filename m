Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F3550CAAA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 15:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234947AbiDWNim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 09:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbiDWNim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 09:38:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE6613C3D4;
        Sat, 23 Apr 2022 06:35:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE36D611E1;
        Sat, 23 Apr 2022 13:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B1BC385A5;
        Sat, 23 Apr 2022 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650720944;
        bh=rcT0itwEuGIdSuVrugDjXf4ZJA/D1R/gAaME3DtkKWk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lJBGwmgGWcuQZTCWx60EhXQOGAcpLsgeKI6SZZy+WVgD2ZqnjpHxdv+hwwjxwB1L7
         jgMx4tUR5pfklwNpbU0kwRU30GyvsBQma/+o66/+hr4rmIlTeCdlQATNXbi6DRZdW1
         vxYYwMdyzuPfE4Kdd32A0NxQr6TTmDQh85fBf9NOEEwBWlj3K7HJ1KFOEAt1DBU0pU
         PPjZk44IfMPuPfqA6m4lHfCppQW1uacy9TiEvugKe+Vv//p7nz6W87cqJMwRfvRViF
         jBK0PSTe/uvmxVyz9cJXL9uO7SjvH2pEUr582v92h2nGIKtz23BHNMM4wB0csOLv+v
         0hmS6mUfjk2XA==
Date:   Sat, 23 Apr 2022 19:05:32 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     hemantk@codeaurora.org, gregkh@linuxfoundation.org,
        loic.poulain@linaro.org, bbhatt@codeaurora.org,
        christophe.jaillet@wanadoo.fr, thomas.ulrich@thalesgroup.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Cinterion
 MV32-WA/MV32-WB
Message-ID: <20220423133532.GP374560@thinkpad>
References: <20220421092141.3984-1-slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421092141.3984-1-slark_xiao@163.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 21, 2022 at 05:21:41PM +0800, Slark Xiao wrote:
> MV32-WA is designed based on Qualcomm SDX62, and
> MV32-WB is designed based on QUalcomm SDX65. Both
> products' enumeration would align with previous
> product MV31-W.So we merge MV31 and MV32 to MV3X
> for some common settings.
> 
> Fixes: 87693e092bd0 ("bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI")

As Loic noted, Fixes tag is not relevant here. I'll remove it while applying.

> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9527b7d63840..ef8c16746b76 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -371,7 +371,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.sideband_wake = false,
>  };
>  
> -static const struct mhi_channel_config mhi_mv31_channels[] = {
> +static const struct mhi_channel_config mhi_mv3x_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
>  	/* MBIM Control Channel */
> @@ -382,25 +382,33 @@ static const struct mhi_channel_config mhi_mv31_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
>  };
>  
> -static struct mhi_event_config mhi_mv31_events[] = {
> +static struct mhi_event_config mhi_mv3x_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 256),
>  	MHI_EVENT_CONFIG_DATA(1, 256),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
>  	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101),
>  };
>  
> -static const struct mhi_controller_config modem_mv31_config = {
> +static const struct mhi_controller_config modem_mv3x_config = {
>  	.max_channels = 128,
>  	.timeout_ms = 20000,
> -	.num_channels = ARRAY_SIZE(mhi_mv31_channels),
> -	.ch_cfg = mhi_mv31_channels,
> -	.num_events = ARRAY_SIZE(mhi_mv31_events),
> -	.event_cfg = mhi_mv31_events,
> +	.num_channels = ARRAY_SIZE(mhi_mv3x_channels),
> +	.ch_cfg = mhi_mv3x_channels,
> +	.num_events = ARRAY_SIZE(mhi_mv3x_events),
> +	.event_cfg = mhi_mv3x_events,
>  };
>  
>  static const struct mhi_pci_dev_info mhi_mv31_info = {
>  	.name = "cinterion-mv31",
> -	.config = &modem_mv31_config,
> +	.config = &modem_mv3x_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_mv32_info = {
> +	.name = "cinterion-mv32",
> +	.config = &modem_mv3x_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
>  	.mru_default = 32768,
> @@ -475,6 +483,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> +	/* MV32-WA (Cinterion) */
> +	{ PCI_DEVICE(0x1269, 0x00ba),
> +		.driver_data = (kernel_ulong_t) &mhi_mv32_info },
> +	/* MV32-WB (Cinterion) */
> +	{ PCI_DEVICE(0x1269, 0x00bb),
> +		.driver_data = (kernel_ulong_t) &mhi_mv32_info },
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.25.1
> 

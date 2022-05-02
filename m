Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25310516B07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 09:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358302AbiEBHG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 03:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383542AbiEBHGZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 03:06:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EFF64DA
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 00:02:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E65E0B80EAB
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 07:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9A7C385A4;
        Mon,  2 May 2022 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651474974;
        bh=eoOVYqPeWPBvkRpJO7aEAFxNbNRseBdwEZaMMY6k1bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SZmaMgVx2B6Sy2rrKKeqWBNCMFt6s73hDKQ298GjcC9VrROtNcIBtElWqmfhlmXHH
         tRXzVCN5jATegft2haKhC9CKnWMxnPGmisCgcF96xQiamNfxaGESLcdtAd3M1FWREr
         UX68yb5ki7U/8MVXJml45wvjzerv2c6SSI1qZuQgPsbV1kXhONg289I5QQTaotWxiT
         PoSepeyqOvDUv1uu7G3NLlMh4Rm//J+bUQpcecWbpT7RjVQCEv1/8yITjwiTCjimNw
         wdNE+yi11cYzecn7je+QV8eJVO2d/7X3nhpwCLwK9EJilvJnPbq7Pv75QW/o+OeU8C
         wfoRag6C6f2ag==
Date:   Mon, 2 May 2022 12:32:47 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        gregkh@linuxfoundation.org, loic.poulain@linaro.org,
        christophe.jaillet@wanadoo.fr, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, weiyongjun1@huawei.com
Subject: Re: [PATCH] bus: mhi: host: Add support for Foxconn T99W373 and
 T99W368
Message-ID: <20220502070247.GA5053@thinkpad>
References: <20220429104241.4074-1-slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429104241.4074-1-slark_xiao@163.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 29, 2022 at 06:42:41PM +0800, Slark Xiao wrote:
> Product's enumeration align with previous Foxconn
> SDX55, so T99W373(SDX62)/T99W368(SDX65) would use
>  the same config as Foxconn SDX55.
> Remove fw and edl for this new commit.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9527b7d63840..efc57cd75cec 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -371,6 +371,15 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
> +	.name = "foxconn-sdx65",
> +	.config = &modem_foxconn_sdx55_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config mhi_mv31_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> @@ -472,6 +481,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W175 (sdx55), Based on Qualcomm new baseline */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* T99W368 (sdx65) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d8),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
> +	/* T99W373 (sdx62) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0d9),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.25.1
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79364750816
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 14:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjGLMWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 08:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjGLMWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 08:22:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744F5A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:22:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 035DF6179D
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 12:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7281BC433CA;
        Wed, 12 Jul 2023 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689164549;
        bh=M+k8Zr2k/NhPdshPSoauj/mUaQGe/FLLsysdC5Ca1+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EMMVZn8P3U84YXLNOY5GPtApabRHvHEcTrREpLctt/4dSp8uUIBI1/CBCCqiw5jX6
         ZPdOlm6w1dJsYDHlvtx6TfFfqsCSaf/mRpMgYn2mnGUWYNot1uE3QHdTx4AHju32Ol
         2V8rh0VGyRMQftS3w2JYfQBHS9GN3SKMYn5Poum+E9z27tk3TYQgUORqh5T5moLcbr
         seM3KWgHm1nFJO9cqZDX1bZWAql4GP+kItjALRyZ/Wr18cEXJmhTREVIZzjZUOeYdr
         6s1K8uVCLbcwiJOPl0lJo5c9lI9CQg97Fl+04nJXn+U3n2ORNrX4ZKAbMgJGjglj3Z
         DZxmZceFgaWEw==
Date:   Wed, 12 Jul 2023 17:52:16 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc:     loic.poulain@linaro.org, slark_xiao@163.com,
        fabio.porcedda@gmail.com, koen.vandeputte@citymesh.com,
        song.fc@gmail.com, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com
Subject: Re: [PATCH v6] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
Message-ID: <20230712122216.GB102757@thinkpad>
References: <20230630062318.12114-1-duke_xinanwen@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230630062318.12114-1-duke_xinanwen@163.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 29, 2023 at 11:23:18PM -0700, Duke Xin(辛安文) wrote:
> Add MHI interface definition for RM520 product based on Qualcomm SDX6X chip
> 
> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>

Applied to mhi-next!

- Mani

> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
> Changelog
> 
> v5 -> v6
> 
> * Update commit message to include the changelog and reviewd tag.
> 
> v4 -> v5
> 
> * Add patch CC to mhi@lists.linux.dev.
> 
> v3 -> v4
> 
> * Limit character length to 75 characters and adjusted "project" description to "product".
> 
> v2 -> v3
> 
> * Sorted add rm520 id in mhi_pci_id_table and modify commit message.
> 
> v1 -> v2
> 
> * Use [modem_quectel_em1xx_config] compatible instead of duplicating the configuration.
> ---
>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 70e37c490150..1e7caa62f114 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -352,6 +352,16 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  	.sideband_wake = true,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info = {
> +	.name = "quectel-rm5xx",
> +	.edl = "qcom/prog_firehose_sdx6x.elf",
> +	.config = &modem_quectel_em1xx_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
>  static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> @@ -591,6 +601,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	/* RM520N-GL (sdx6x), eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

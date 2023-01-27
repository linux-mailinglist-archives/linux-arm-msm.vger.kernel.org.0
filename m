Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBB767DE08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 07:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbjA0G4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 01:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbjA0G4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 01:56:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263D330D0;
        Thu, 26 Jan 2023 22:56:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C6D1619EB;
        Fri, 27 Jan 2023 06:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B5AC4339C;
        Fri, 27 Jan 2023 06:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674802606;
        bh=hf+Fr2HXd5LDFnX9YYjSf1gQUvYtYsbVip82S9X+UZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iT5e5qdYnm1ZUHqslSZ/U3oGzrm/tCzryJN+oCOYM6g/zDDaxc/KkUOE6Z/AnPaK3
         fkTEXyzEkbEyF9PbXi0GzQIhz62tT3DDUBmZCK/3lYJ5oSw1ZG4dWzKrXdrTbORg+W
         C1bHaN6xyseJ3OYg8quN6mE5uTBypbCyy7709Is9oTXXZF/pPgZduyk/08krGxkSqX
         Xg/hbGkj6ubNUXnbZVlOhSUJ05OS/zucKAx/kSfNfxEy73g1qC38Z8aFOLvT2o4KFi
         y74ThTolIX73Jz+sl3uNf7mcB4LaJYMN097FCoAbSs7myHac1rUSMjO/+f3YxIqkJb
         o0HCXhJCsAk2A==
Date:   Fri, 27 Jan 2023 12:26:31 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc:     slark_xiao@163.com, loic.poulain@linaro.org,
        gregkh@linuxfoundation.org, dnlplm@gmail.com,
        yonglin.tan@outlook.com, fabio.porcedda@gmail.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        inux-kernel@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
Message-ID: <20230127065631.GE7809@thinkpad>
References: <20230118011230.25847-1-duke_xinanwen@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230118011230.25847-1-duke_xinanwen@163.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 17, 2023 at 05:12:30PM -0800, Duke Xin(辛安文) wrote:
> The project is based on Qualcomm's sdx6x chips for laptop,so the mhi interface definition and
> enumeration align with previous Quectel sdx24 configuration
> 

How about,

RM520N-GL modem is based on SDX6x chipsets from Qualcomm and they reuse
Quectel's em1xx MHI configuration.

> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index f39657f71483..e1d697839535 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -335,6 +335,16 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
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
> @@ -569,6 +579,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004), /* RM520N-GL (sdx6x) */
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },

Entry needs to be sorted. See the comment above mhi_pci_id_table definition.

Thanks,
Mani

>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

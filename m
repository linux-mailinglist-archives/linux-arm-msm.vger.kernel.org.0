Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6636176CB7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 13:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbjHBLID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 07:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjHBLHw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 07:07:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128AD1BF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 04:07:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 83BD86192D
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 11:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA3CC433C7;
        Wed,  2 Aug 2023 11:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690974469;
        bh=wrmaodfGzLPH3aCxqHaxRauSI3aslaJU0Se3l6Z1ikQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m19LYYgozctwtVrp5E/HMLDced/XRH5+2SKUT3GOwFeGdC1HOZbB5tdmDbYHSvQlB
         XMYQved5y0O1obGpOjD01f5ftDypuPIbRN7U2XnbA0WIMfAzhwU7MJ8cstJU5/cNIi
         avama0J0bsMBlkTgHb/UMZmT908LqFpqEeqGrMh15IiizkLJFbLV11mzTiUJZnJvGs
         cG/O7vbKGVxCg+f47qTq7N++u5422VwuCnn01QeUh3+RCSPASzP882Kkn58eK1k9Y6
         +5op32Ua3EsNdXZihAeZ5MT2X0ga2C7U1QPhPLbLUYgXZ5XTAlzayOucQtcbYYjGVo
         OqHsRZVfDRmVw==
Date:   Wed, 2 Aug 2023 16:37:36 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc:     mani@kernel.org, loic.poulain@linaro.org, slark_xiao@163.com,
        fabio.porcedda@gmail.com, koen.vandeputte@citymesh.com,
        bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Lenovo
 RM520N-GL
Message-ID: <20230802110736.GE57374@thinkpad>
References: <20230728014702.25775-1-duke_xinanwen@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230728014702.25775-1-duke_xinanwen@163.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 27, 2023 at 06:47:02PM -0700, Duke Xin(辛安文) wrote:

It is a Quectel modem, right? Then it should be mentioned as Quectel in subject.

> This modem is designed based on Qualcomm SDX6x and it will align with the quectel previous RM520N-GL modem settings.

s/it will align/works

s/quectel previous/Quectel's existing

> But this one is designed for lenovo laptop usecase, hence Quectel got a new PID.
> 

Also, wrap the commit message to 75 columns. And always run
./scripts/checkpatch.pl and fix warnings/errors before posting a patch.

- Mani

> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index fcd80bc92978..e4f2fb67dfaf 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -604,6 +604,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* RM520N-GL (sdx6x), eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
> +	/* RM520N-GL (sdx6x), Lenovo variant */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1007),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x100d), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

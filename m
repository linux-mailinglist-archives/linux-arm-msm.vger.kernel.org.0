Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5334B3AEC23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 17:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFUPSt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 11:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhFUPSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 11:18:48 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB09C061766
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 08:16:33 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id o10-20020a17090aac0ab029016e92770073so186658pjq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 08:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QdIEcecP8MgcC134NoXHjKf/BoPNuoUxbduClrOGatU=;
        b=O/OplEcbZxMFGnP0y4z2BOUwpnTc6uvaUDrLvM6tcX5+8dA0cTtAxNTjiwTJR9/94e
         FxDGM+mpRZ+XOd8HAaDKUDfq2vUGBz3QYZm5+Cs4Gt3AVEnaNdQKLRxhmLe+l0EF+6n9
         TL9bZQj+0Q9oGiYaVBG2+GRHRsiCLC3oLfp1uorkvrsc3+JgHw/pU8cuv7aCQCLFmtNr
         r0u9wMTtPqrFhpwuifXknF7W65wg6AI0CvQxoyEsTo6AikDogC8cITOACG7pd0Zzy/rJ
         h7tnbBdgfcy5hMG8cet13HYge1lzLB27NjZqXke6GfO6tmW1RMjGD1WYMfC2axgFh63V
         7Z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QdIEcecP8MgcC134NoXHjKf/BoPNuoUxbduClrOGatU=;
        b=HdNRwPWdRdaB6IDp1S7kygUTSLHeahqn1/5zUI5ZQb7PiQHe0HLXnT+ZB8tMiqk3X/
         bBwQn4athA+HmIdTQhrzv88Qeto2f7vNvmAkTZtm0mmZxXmG+buxsg+Wkp/Pnq1u0ar5
         TqB8OJa8IDs+HpZARDxyQkyKUM2zNecppbItJF+6m0JpmMhVEmJKn2s/4nZdYe7PC0g/
         /oOpLab09OwVpL88qhrohYw0Y5S05H3jk5uhApMJUvWMP9gkSi3prt8ZakXiNFN0Hyhb
         HNBP8aYtmJ0UUnUti74u3NhsAYmvuJ7ojadY5bUWbqT/LUlujLJ8BJeVMQUKr4Awl/rv
         /QSQ==
X-Gm-Message-State: AOAM533gOEjmjZX5HnKz57CNkC2U0UFmmLrR/zqoVOuUEQNdWgLXntf7
        Egr7Fo9l6wKwtyQYeb6Cp6t6
X-Google-Smtp-Source: ABdhPJyRv/f2iDpIa77VKpng6GR8lUQo97pb0tWgF7GslQuqXZ/4A3r6GF9lhNHCvfi94uZU/R2tUg==
X-Received: by 2002:a17:90a:c595:: with SMTP id l21mr2586636pjt.145.1624288593219;
        Mon, 21 Jun 2021 08:16:33 -0700 (PDT)
Received: from workstation ([120.138.13.116])
        by smtp.gmail.com with ESMTPSA id g5sm10290672pfb.191.2021.06.21.08.16.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 08:16:32 -0700 (PDT)
Date:   Mon, 21 Jun 2021 20:46:29 +0530
From:   "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To:     ULRICH Thomas <thomas.ulrich@thalesgroup.com>
Cc:     "hemantk@codeaurora.org" <hemantk@codeaurora.org>,
        SCHEMMEL Hans-Christoph <hans-christoph.schemmel@thalesgroup.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Add Cinterion MV31-W PCIe to MHI
Message-ID: <20210621151629.GA20545@workstation>
References: <PAZP264MB284690134DA010698E6B3BDDE60A9@PAZP264MB2846.FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAZP264MB284690134DA010698E6B3BDDE60A9@PAZP264MB2846.FRAP264.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ linux-arm-msm

On Mon, Jun 21, 2021 at 09:04:17AM +0000, ULRICH Thomas wrote:
> This patch adds VendorID/ProductID and MBIM Channel Definitions for M.2 Modem Card (PCIe Variant) to MHI:
> Cinterion MV31-W (by Thales)
> Additional information on such Modem Card (USB or PCIe variant) is e.g. available at:
> https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high
> 
> Signed-off-by: Thomas Ulrich <thomas.ulrich@thalesgroup.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> 
> ---
>  drivers/bus/mhi/pci_generic.c | 37 +++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 56f710763e36..5e263794d4c5 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c

[...]

> +static const struct mhi_pci_dev_info mhi_mv31_info = {
> +        .name = "cinterion-mv31",
> +        .config = &modem_mv31_config,
> +        .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +        .dma_data_width = 32

As per 704d98540e55, there needs to be:

	.sideband_wake = false,

I'll add it while applying.

Thanks,
Mani

> +};
> +
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> @@ -369,6 +403,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +        /* MV31-W (Cinterion) */
> +        { PCI_DEVICE(0x1269, 0x00b3),
> +                .driver_data = (kernel_ulong_t) &mhi_mv31_info },
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.20.1
> 

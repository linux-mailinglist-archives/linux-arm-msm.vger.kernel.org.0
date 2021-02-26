Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED9D326469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 15:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhBZOxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 09:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhBZOxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 09:53:31 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3FBC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 06:52:51 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id jx13so2658629pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 06:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XWdncf6gAYOi0fmXQsShkijBuxNIa+XrMeskxK/8gtQ=;
        b=YkH7O1HjvTIjwYOcCPsNcI3cYhuMjCiv9St04vuSjoSYub8mE6XPL+8jNqjTBiSruz
         zpA9UO2gVSBT/oY8Csn6w8UyHpgAQ/IJGt9QcpDsRQr+4aEEXtQ7VYY/zkDevSvaaJml
         WGkIqK1MMfVnR/W9peZ5iybRE20PmNvifW4AnIUhSUkqMuzYczm+GOd8XYfGm0P4Onnp
         ke/ALf3WlTssbPc2OQHhkfu6lmJNT+94kRPlVqWgJRX80pBfiold0YIfZwmt/NIggjvw
         L+KdO4ITXAmjsKXLgEiafjWqODlXDIPoMqg02nAqZh9F7sUoJUnxFG9dzm5PWNdk+5lI
         aj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XWdncf6gAYOi0fmXQsShkijBuxNIa+XrMeskxK/8gtQ=;
        b=LO1+Pc11hJVaavuzlSD4GLrZHmXQKhHwnyyQbNqeDmmqbTUn3Myr4KBYDGb9VBFyvb
         2y8O8mPZvI6nQm0FklNiVs84THUbrqWSRwcH/6l5t3tluCbTBIoK/OmiV9fESzQUCZNR
         DLU3L9tFpxTGqZwnmu3VX4EveDH54yT1cBf6TjMhosYfwA1adf85YMh2gAXFdxFSFCzA
         +nTXHk3qZB95bC1XhbAO2StRnsaHjfrDJHLDafUn66MiGP7VDx0DKhA4iYzfYD66A8Me
         dQMe8G8A6FEfBBZxVRizkDXaZ0cwUUY0+Kh+QK56Z6PFMPAUeQ/p+5GBNKmDLDLrQYit
         3daQ==
X-Gm-Message-State: AOAM5308YNEkb+VVxBz7GvoASBVzB+gGziXU7w+tx2VBAzjZIqxtK7Tv
        fS/asViXgBqJCz+GjRmg+6gC
X-Google-Smtp-Source: ABdhPJyBfrR57q8YTLxKIIfgqLMAfvgyq+fbJPPX7cLpyOPHu6CH9Da4EZ3HOsPDxlTPdluLxqU9YQ==
X-Received: by 2002:a17:902:e54e:b029:de:8c70:2ed0 with SMTP id n14-20020a170902e54eb02900de8c702ed0mr3364099plf.3.1614351170783;
        Fri, 26 Feb 2021 06:52:50 -0800 (PST)
Received: from thinkpad ([103.66.79.124])
        by smtp.gmail.com with ESMTPSA id j9sm8899500pjn.32.2021.02.26.06.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:52:50 -0800 (PST)
Date:   Fri, 26 Feb 2021 20:22:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, hemantk@codeaurora.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Add unique qrtr node id support
Message-ID: <20210226145245.GB70936@thinkpad>
References: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
 <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 26, 2021 at 04:12:49PM +0530, Gokul Sriram Palanisamy wrote:
> On platforms with two or more identical mhi
> devices, qmi service will run with identical
> qrtr-node-id. Because of this identical ID,
> host qrtr-lookup cannot register more than one
> qmi service with identical node ID. Ultimately,
> only one qmi service will be avilable for the
> underlying drivers to communicate with.
> 
> On QCN9000, it implements a unique qrtr-node-id
> and qmi instance ID using a unique instance ID
> written to a debug register from host driver
> soon after SBL is loaded.
> 
> This change generates a unique instance ID from
> PCIe domain number and bus number, writes to the
> given debug register just after SBL is loaded so
> that it is available for FW when the QMI service
> is spawned.
> 
> sample:
> root@OpenWrt:/# qrtr-lookup
>   Service Version Instance Node  Port
>        15       1        0    8     1 Test service
>        69       1        8    8     2 ATH10k WLAN firmware service
>        15       1        0   24     1 Test service
>        69       1       24   24     2 ATH10k WLAN firmware service
> 
> Here 8 and 24 on column 3 (QMI Instance ID)
> and 4 (QRTR Node ID) are the node IDs that
> is unique per mhi device.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> ---
>  drivers/bus/mhi/core/boot.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index c2546bf..5e5dad5 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -16,8 +16,12 @@
>  #include <linux/random.h>
>  #include <linux/slab.h>
>  #include <linux/wait.h>
> +#include <linux/pci.h>
>  #include "internal.h"
>  
> +#define QRTR_INSTANCE_MASK	0x000000FF
> +#define QRTR_INSTANCE_SHIFT	0
> +
>  /* Setup RDDM vector table for RDDM transfer and program RXVEC */
>  void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>  		      struct image_info *img_info)
> @@ -391,6 +395,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	const struct firmware *firmware = NULL;
>  	struct image_info *image_info;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct pci_dev *pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	struct pci_bus *bus = pci_dev->bus;
> +	uint32_t instance;
>  	const char *fw_name;
>  	void *buf;
>  	dma_addr_t dma_addr;
> @@ -466,6 +473,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  		return;
>  	}
>  
> +	instance = ((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 0xF);
> +	instance &= QRTR_INSTANCE_MASK;
> +
> +	mhi_write_reg_field(mhi_cntrl, mhi_cntrl->bhi,
> +			    BHI_ERRDBG2, QRTR_INSTANCE_MASK,
> +			    QRTR_INSTANCE_SHIFT, instance);

You cannot not do this in MHI stack. Why can't you do this in the MHI controller
specific to QCN9000? And btw, is QCN9000 supported in mainline?

Thanks,
Mani

> +
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	mhi_cntrl->dev_state = MHI_STATE_RESET;
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
> -- 
> 2.7.4
> 

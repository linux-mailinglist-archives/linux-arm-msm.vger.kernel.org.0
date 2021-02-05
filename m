Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F15C310B14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 13:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhBEM3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 07:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbhBEM1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 07:27:22 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD49C06178C
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 04:26:42 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d26so2986228pfn.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 04:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=olKxdUhhAjEHtniNFoNUxSd3ztLWLPRSJlDLlalivBQ=;
        b=QmSNoiBQEj3J0pPbLIzBouFKa9BDCavK9l9t2/OgYWKOzJIdspcMLiNVznn5ccLjnv
         VGm2tVraAkYij4tZX8r4QKA93WFo9lNOoDVE/vX9Nk1b0L7C/EXicSR4Ars8IekX1kOF
         pv8qQQ/qcoglQ2qLwNiOqKas+DD4T/GYKqOm5qp1KY/2spV/42EIPtbrrtceCTTnlFFt
         01OGMaJ+aO9v9o3nBIfTHP9JwqlYajPZ6QtOeFTSdXCwCsCF7kACNE8aws/oytPdqvwO
         ZjM/K9lksnm5xMmQHx7AqP4Yk53J4TB9404tS8MAsnK40kNJfqjhSfxXlPqg1dgzoBys
         +NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=olKxdUhhAjEHtniNFoNUxSd3ztLWLPRSJlDLlalivBQ=;
        b=LI9LtNFs0Xzf2NaT7bnJr6lth1H4o4E5V9fpIWkrARW5EILXZ68HxCywnoG+VukCUG
         dmJj4VLpfuC7KCjaa2NPe4CzxEYcIEknGumtAYjvgGkaxTFKqxkqswyUQHH+ONwfcOuT
         4N5Uslbu6zH6uQa1c99s+Fa3brXLaoCJGFRWyA3EITcQGbHSP6NP5ril0m3WcxXvw1DA
         in04zqGI7V8tEx2197+jbU1shG5qehy/fTnb44+AGEbvd0Firz7ZjM9QAf6otNnZ4x2Y
         TZRedtO29/gs9SVCyGezziQ7hPpv6oPKZqrJ6bz+Ll7xkzVTznJh0rSFEeh010zBU5lO
         7o0w==
X-Gm-Message-State: AOAM531qfm66+KL4qekAs1x/25M+FmZ4+VKlzQJzSOeJjZh38sd1N8tO
        ctlG692cFQZy0tfwGavQ4NCzo4mWLicS
X-Google-Smtp-Source: ABdhPJyowgLWzv5TXrD+DbNhkcq2x4kzEHs1olBsR73VpuKwZWwQLiEfpcS2QIIBHn63hosUTqSG+A==
X-Received: by 2002:a63:ec4f:: with SMTP id r15mr4160194pgj.344.1612528001558;
        Fri, 05 Feb 2021 04:26:41 -0800 (PST)
Received: from thinkpad ([2409:4072:6419:ab3e:3106:54ac:6216:6b24])
        by smtp.gmail.com with ESMTPSA id 141sm9399385pfa.65.2021.02.05.04.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:26:40 -0800 (PST)
Date:   Fri, 5 Feb 2021 17:56:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] mhi: pci_generic: Print warning in case of firmware
 crash
Message-ID: <20210205122634.GB3221@thinkpad>
References: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 03, 2021 at 05:39:42PM +0100, Loic Poulain wrote:
> Print warning when MHI detects sys error.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v2: remove useless fallthough & unused mhi_pdev variable
> 
>  drivers/bus/mhi/pci_generic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 444693e..2476041 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -217,7 +217,17 @@ static void mhi_pci_write_reg(struct mhi_controller *mhi_cntrl,
>  static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  			      enum mhi_callback cb)
>  {
> +	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +
>  	/* Nothing to do for now */
> +	switch (cb) {
> +	case MHI_CB_FATAL_ERROR:
> +	case MHI_CB_SYS_ERROR:
> +		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
> +		break;
> +	default:
> +		break;
> +	}
>  }
>  
>  static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
> -- 
> 2.7.4
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA373562E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 07:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344991AbhDGFMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 01:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhDGFMc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 01:12:32 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077A6C061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 22:12:23 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id z16so4730542pga.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 22:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ltI0p71hjvjdeWhWjSJn7XWTOKljDDid1ixDlOHvzXE=;
        b=UG9KzheTk7wB4l+mnUTl8otkPbA/OGfGYnyuP7iNrgcOx5o5F/ITHzwAHLu08S4r8T
         afa8pjcb5BEkUt89I1pdVlIMd/I55azv3Lt8pFa5K6xv5hSjfEDAj0qgd00Yr+3XNCBD
         jcCfv8lMlWbyq9EosykwnDpgUprKdKZLmndLLTgAeBe5gpWviw/kUI1epubOT3NIi2tJ
         /NDwu3hFG2auG+Pl5wLTqXU2Ykthn3NY+T0odgASHwnfeZ5PB255TbFBfy/PAr6QgQrE
         U33vTYa+w04DA8uDwR5vX7Rz6wEGa8GXXn67ypJvhuNzFqAKmToeEi8zs2FTuKEMiObT
         qU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ltI0p71hjvjdeWhWjSJn7XWTOKljDDid1ixDlOHvzXE=;
        b=sA7ReZ2xnfB39MTUbxtI6nUzL8bmvvy6l4o4lWc6J+gIXiXZZpl9lHZPYc8wbDfMhM
         LUCP25rLncfnLAtSMB4WQQqRkuZNd8ucfKpRrZKW7OoWqoWHgIMfvZlOT/ne0OHc4HCo
         d6RBtVcW2iWl4TCnqb/Zl+iOItlQFHbT014xobY+zcvwpgfj6w9FahDyW2pxPMCtWZBh
         KuVb7REmakH6nOm5DUxsGNjizE+KIEvE7eMpoYNFGaFmFgM8QM1TVD5wHrelLS/EMonw
         JtyjilZePvRY4PtxS8B8s8IdLs4QW42nTd23REdRZBx8xgPmaXiHrTsgwJf03ohyjXhH
         tMYA==
X-Gm-Message-State: AOAM5339TiAkpeA4pl9aU143MVQ7XtZZkkARKwwmNgM+e1nRkK8WkgA9
        octmwoZq+oXx7cseEZci3wM4uNf+OUyc
X-Google-Smtp-Source: ABdhPJyG45zFtrNMLnBH/76moCkdLTDiKhyiX7+S+rONAYr2AhtPq5Kq/RyA2Bo5IsjQJ9zh8Wd49A==
X-Received: by 2002:a63:1d18:: with SMTP id d24mr1682499pgd.402.1617772342362;
        Tue, 06 Apr 2021 22:12:22 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id g8sm3115133pjb.25.2021.04.06.22.12.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 22:12:21 -0700 (PDT)
Date:   Wed, 7 Apr 2021 10:42:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Add SDX65 based modem support
Message-ID: <20210407051218.GD8675@work>
References: <1617399199-35172-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617399199-35172-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 02, 2021 at 02:33:19PM -0700, Bhaumik Bhatt wrote:
> Add generic info for SDX65 based modems.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> This patch was tested on SDX65 hardware with Ubuntu X86_64 PC as host.
> 
>  drivers/bus/mhi/pci_generic.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 5cf44bc..92a1b18 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -204,6 +204,15 @@ static struct mhi_controller_config modem_qcom_v1_mhiv_config = {
>  	.event_cfg = modem_qcom_v1_mhi_events,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_qcom_sdx65_info = {
> +	.name = "qcom-sdx65m",
> +	.fw = "qcom/sdx65m/xbl.elf",
> +	.edl = "qcom/sdx65m/edl.mbn",
> +	.config = &modem_qcom_v1_mhiv_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32
> +};
> +
>  static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
>  	.name = "qcom-sdx55m",
>  	.fw = "qcom/sdx55m/sbl1.mbn",
> @@ -261,6 +270,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  };
>  
>  static const struct pci_device_id mhi_pci_id_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },

This should come last. I'll fix it while applying.

Thanks,
Mani

>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

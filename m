Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982FB333F5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbhCJNfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbhCJNfb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:35:31 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4551DC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:35:31 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id o38so11417628pgm.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kpZFlgwhgyKOrKSClARQ8cdL6JWcfVIeZO+UhSaX0yo=;
        b=ViFyN/I7ctipa+BrygutD/POqVbavaC1JYwBe4xw0HQn9ZktR596OL5Y3rRcvQ8LAl
         H7pvdAU7fstr84sYo7V+y+lCFrCPtZJXZalHig06yH9FI+AZgUAZDdSj3E4NBmK74PGe
         pbV9T6zakzzG+Dzq2xzvhJWSElolRbKXYX5hsGhiEZpmnq/QhSxQSt1HaGx33uJEsE4r
         EqFjmI28O2apwWTzHHOMqDnlWnXKFaO5PgtAhaAKz+8BeTtXUCGRY4j2vssSdkzBecFd
         I5b35og+JhARgi4u65aiFbmIeN6TLBvsRjI19jA2u0ub3R3iYe2YB3XDZKmkD36/pGTp
         z/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kpZFlgwhgyKOrKSClARQ8cdL6JWcfVIeZO+UhSaX0yo=;
        b=GUabu/IHNdg1x+o4psiJgJy888wkSVYEy7sxRUAlhZFSF6uEKdhrW1KaFG8EA6M5cR
         n+UBORIKfCY71UXz6e44sGrs33pTH7nbuh9nG55FBG2vrMHEbOWcROAPMPU2lSJqqXdy
         mchw6SXAhkeSCgzZftunM6AJoeLEVXH0aw3+0GcSLJ0tkxf97G2XXVzr004jisO3pNkO
         K4N8UTx6WnQwZgHzB64A/sXc7L1DeN3ezEKbqOWLZv/evD7IVtaFKVrGFSoC71fQJ4oV
         sdVYH0bfFy+WYv4dFbez33ZJraQkvICpgsJfi7UR98JyAh65za1WKpbYrbHwr14nykOf
         sbiA==
X-Gm-Message-State: AOAM532bOXTt8LRj0BFNZqJwpnBJwKlobnzT7fTcvzd0CfvQXvnN02de
        SIe/mAmwYvG0yy8R4nG5ToHH
X-Google-Smtp-Source: ABdhPJwvJs+ZLPK6o8wueLM4UI1s8MYoiAZlSBbzdmKyT1nICX371GJQ3S5ybkbL4O9n4NqgQ7XDOw==
X-Received: by 2002:a63:f209:: with SMTP id v9mr2812416pgh.97.1615383330763;
        Wed, 10 Mar 2021 05:35:30 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id d10sm17311453pgl.72.2021.03.10.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:35:30 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:05:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] mhi: pci_generic: Add SDX24 based modem support
Message-ID: <20210310133526.GD30275@thinkpad>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
 <1614971808-22156-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614971808-22156-3-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 08:16:45PM +0100, Loic Poulain wrote:
> Add generic info for SDX24 based modems. Also add the FIREHOSE channels
> used by the flash-programmer firmware loaded in EDL mode.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: no change
>  v3: no change
> 
>  drivers/bus/mhi/pci_generic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 45d0cf2..c274e65 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -212,6 +212,14 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
>  	.dma_data_width = 32
>  };
>  
> +static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
> +	.name = "qcom-sdx24",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
> +	.config = &modem_qcom_v1_mhiv_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32
> +};
> +
>  static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
> @@ -254,6 +262,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
>  	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
> -- 
> 2.7.4
> 

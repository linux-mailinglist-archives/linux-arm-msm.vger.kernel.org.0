Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A6932CCE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 07:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbhCDGeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 01:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbhCDGdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 01:33:39 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29B5C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 22:32:59 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id s23so6171579pji.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 22:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZVaNWV5ZzTWzGwBVUC0VbXcKnh2dD33whJJzQnJQNaI=;
        b=Wchw87X6sNmsdVMCRW5Qlpl0cUb3evWrAXhdN77vx7uOA25FpP3SKRdm/JwDfo6pkF
         Uv3FuBoeDwvPZdpKtktEjSkXzcJxHbwKjsPCRYLI1Wt+AqyJCbVFlr9K0IjEVO+rHHpY
         zxs7gf7LbjoEEbDMSAcDqKInPz4jSw0TK3kuqE3OPpMD5plj0/n3IHuM4+Vn88UTjQyC
         HR0ovbZNx5p7o6lo82UPH5bfhqpTRPq4kus1fVGajwiHi2WJCsvLeTghpfHWSEjGrTk/
         DrkHkapqMUqwkosSVkrQ9/vF7DY1VWRzDdgY4Vl1k71WPjBBuaTuC+7Ob+njR6aGEeJM
         4dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZVaNWV5ZzTWzGwBVUC0VbXcKnh2dD33whJJzQnJQNaI=;
        b=dFHfwQJ62kJSB1Ac6t0WJFXOXMSilS0YWp5PRVV/4MCBtLdnKV/dGTdkMBcRFLNWH/
         ZT8w08bwcIzJ7BWs9tWAr4CH7/8mSLqcq6juDGbOd0kKnQL3N1GZhXeiAm/wuJKQ1TkY
         vNDEAqFAQdA1rjUkrX5mEIWR0GRgjG8FffI34j5qoIhZhCkkuOJdQDwUMTFBaOYyjiF2
         h9epixMUkooU/7tp2I1FUugseVmpgAjZuwMtynXtD35OT3ZcFiBmaqD+Zn7ukEUsWV5o
         84Akehuu415TqHQuR3GnvRx6SeGdSokjUcwwSmBfBouOZ/QUqVxz1lb9bAmA8nxEQprp
         z7cA==
X-Gm-Message-State: AOAM532XgQ/zXcAKu8Y8AFCZZYJg8WM0dtIg8PJ6IcwxDc1fe9BURqnG
        Hr6itRNoFw1skFwaxIPQQmHL
X-Google-Smtp-Source: ABdhPJymWpwtlqdPzs+1im5N29ns7ccms70hJ2x5e0frx+0uPWaYb3DqJBqijW6FO/wLBgLVAcW9KA==
X-Received: by 2002:a17:90a:a481:: with SMTP id z1mr2915558pjp.161.1614839579305;
        Wed, 03 Mar 2021 22:32:59 -0800 (PST)
Received: from thinkpad ([2409:4072:80b:705f:ce40:2a5f:bf1e:b205])
        by smtp.gmail.com with ESMTPSA id l22sm8678958pjy.6.2021.03.03.22.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:32:58 -0800 (PST)
Date:   Thu, 4 Mar 2021 12:02:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] mhi: pci_generic: Add SDX24 based modem support
Message-ID: <20210304063253.GC3363@thinkpad>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
 <1614615911-18794-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614615911-18794-3-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 01, 2021 at 05:25:08PM +0100, Loic Poulain wrote:
> Add generic info for SDX24 based modems. Also add the FIREHOSE channels
> used by the flash-programmer firmware loaded in EDL mode.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 00a0410..87bab93 100644
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

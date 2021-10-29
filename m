Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6032D43F9C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 11:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhJ2J3L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 05:29:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:56570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231449AbhJ2J3L (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 05:29:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3F3160234;
        Fri, 29 Oct 2021 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635499602;
        bh=GUlUEJuXDpOoT/DJiV/i0VAam8meu8O/nvx+5SrZBjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XaoaCftUUx63NXoSsO/xF8UKC5vteKWbon9JbyxUZLzu3YyyIb9NelaGUj5UJyagD
         yJsIIhfc37EC6g+FvfepuIOjUz5mwV4xaBx8HCDgZGk3kIv0GGtWUbJZCVIrYha7Lm
         9LmXtpq9Fu9YKsDfovOCEASHQo26CfIvMviMX30ctNEviQmriF9Lr81Ud8YzqIl/8g
         YPNtl7HShsl01NcCJLHEPDtTjI/8wAjWBy+HhtRTGuPZa7tjYYwi8f29RcvNkjSW9r
         EWJVrCNMXsGM2cGlW1yXfxXjkmohc7QMzkkA6/Q1qW+jiISI6JH/5Xw9G2zdc8QXdG
         yrd8rd0zmh/0Q==
Date:   Fri, 29 Oct 2021 14:56:19 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Add new device ID support for
 T99W175
Message-ID: <20211029092619.GA4945@thinkpad>
References: <20211028034431.3563-1-slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028034431.3563-1-slark_xiao@163.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Oct 28, 2021 at 11:44:31AM +0800, Slark Xiao wrote:
> Add new device ID 0xe0bf for T99W175.
> 

Thanks for the patch! Can you share the difference between this modem and the
one (T99W175) we already have with PID 0xe0ab?

Please include the product page in description if any.

Thanks,
Mani

> Test evidence as below:
> root@jbd-ThinkPad-P1-Gen-4:/dev# lspci -nn | grep Foxconn
> 0000:08:00.0 Wireless controller [0d40]: Foxconn International, Inc. Device [105b:e0bf]
> root@jbd-ThinkPad-P1-Gen-4:/dev# cat wwan0at0 & echo -ne "ati\r" > wwan0at0
> [2] 2977
> root@jbd-ThinkPad-P1-Gen-4:/dev# ati
> Manufacturer: Qualcomm
> Model: T99W175
> Revision: T99W175.F0.6.0.0.6.CC.005  1  [Oct 21 2021 10:00:00]
> IMEI:
> +GCAP: +CGSM
> 
> OK
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 59a4896a8030..566483dc15db 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -423,6 +423,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* T99W175 (sdx55) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.25.1
> 

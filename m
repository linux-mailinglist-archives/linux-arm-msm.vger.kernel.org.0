Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A325442645
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 04:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbhKBD7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 23:59:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:43006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232720AbhKBD7O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 23:59:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 074BD60EBC;
        Tue,  2 Nov 2021 03:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635825400;
        bh=dj+iduYD46Zxko0xXTACsVOTIt8MF2IXH58t7O216Xo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fA2WylUAvidZdUUFyCNzrrZX16P+RbT89RH3zDGKJUD+RJECmyauokrJx8qJJVtNn
         bLyTi5fv0Ec9bdgfEH4Nwm7KaQZGg7FykC1haAurUd/XW+c7XycvV3iB8XzRATszKT
         0fz6WacB/ksWp10yy703TloVvzbUNS+M8pF+nF+oFRptwSsMOCXb3d1jjCyn21NRFB
         T+jB4Fg1XisBWDe9tIzkBZmQzISjDeAA06WTnb0Rg6IuRDhFfVmvsXuaMG9MF/juUa
         k4WP2fl1ydHmhpXqSLOUGZ+NgYR92s9xzUGdvWrRSg5NGVAuITES0ZpDkFO+UER+DV
         5ly+t1bZeSURw==
Date:   Tue, 2 Nov 2021 09:26:32 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: pci_generic: Add new device ID support for
 T99W175
Message-ID: <20211102035632.GA5646@thinkpad>
References: <20211029104918.3976-1-slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029104918.3976-1-slark_xiao@163.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 29, 2021 at 06:49:18PM +0800, Slark Xiao wrote:
> Add new device ID 0xe0bf for T99W175.
> This device ID is created because it is using Qualcomm SDX55 new base line.
> 
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

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
> 
> v2: Add descriptions about the dfiiference between 0xe0ab and 0xeobf.
> ---
>  drivers/bus/mhi/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 59a4896a8030..94d8aa9c2eae 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -423,6 +423,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* T99W175 (sdx55), Based on Qualcomm new baseline */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(0x1269, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.25.1
> 

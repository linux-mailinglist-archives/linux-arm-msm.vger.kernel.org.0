Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D3843FAB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 12:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhJ2K2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 06:28:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:39588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231683AbhJ2K2f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 06:28:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CF3260FC4;
        Fri, 29 Oct 2021 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635503167;
        bh=CcCIID5wduC9z6NVQXcXCOwmBbWGtq0gnP1rXWiVjt8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UoWTvZ4jShB406XOUlPAndbORlCAeDw79g0svpvnmCNjzb66rImQdj1WB1LzYAxJ2
         SCnf+M1nBrjJ9ulWn4iBBeRzjhBbEuXf9nYcQ6T3izf+fUKNGVd2j8n9AeUw6JrAAr
         WkDX0tqKZ+xa4a4iO1Y5T/PBz5/cGfARcUiM27lDS4pK25398GA85X68xz35fhCvwP
         2JFDT83NF0Wvel9w3zijykRV6LTp2AeambcWnWrPg/jPbzNgEBs6dFccWjV7z1LN66
         mh7UXLZJDOWraJjAKYZ5Qu/bt188+lAqdrCSfHkaTa641MfNtaeV6Y3qI9u0g/ruRb
         MmGLEN1OqLpKQ==
Date:   Fri, 29 Oct 2021 15:55:26 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] bus: mhi: pci_generic: Add new device ID support for
 T99W175
Message-ID: <20211029102526.GD4945@thinkpad>
References: <20211028034431.3563-1-slark_xiao@163.com>
 <20211029092619.GA4945@thinkpad>
 <68a1613c.3e54.17ccb7e922b.Coremail.slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68a1613c.3e54.17ccb7e922b.Coremail.slark_xiao@163.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 29, 2021 at 06:00:42PM +0800, Slark Xiao wrote:
> 
> At 2021-10-29 17:26:19, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> 
> >Hi,
> >
> >On Thu, Oct 28, 2021 at 11:44:31AM +0800, Slark Xiao wrote:
> >> Add new device ID 0xe0bf for T99W175.
> >> 
> >
> >Thanks for the patch! Can you share the difference between this modem and the
> >one (T99W175) we already have with PID 0xe0ab?
> >
> >Please include the product page in description if any.
> >
> >Thanks,
> >Mani
> >
> Hi Mani,
>    Thanks for this review. 
>    Actually this product(SDX55/0xe0bf) is using Qualcomm SDX55 new baseline(LE1.4), 
>  and previous T99W175/0xe0ab is using original base line(LE1.2).
>    Our customer wants us to use different device ID to separate from each other. 
>    Currently we don't have product page  as our customer's new product is not released.
> 

Thanks for the explanation. Please send v2 adding the baseline info in commit
description.

Thanks,
Mani

> Thanks
> Slark
> >> Test evidence as below:
> >> root@jbd-ThinkPad-P1-Gen-4:/dev# lspci -nn | grep Foxconn
> >> 0000:08:00.0 Wireless controller [0d40]: Foxconn International, Inc. Device [105b:e0bf]
> >> root@jbd-ThinkPad-P1-Gen-4:/dev# cat wwan0at0 & echo -ne "ati\r" > wwan0at0
> >> [2] 2977
> >> root@jbd-ThinkPad-P1-Gen-4:/dev# ati
> >> Manufacturer: Qualcomm
> >> Model: T99W175
> >> Revision: T99W175.F0.6.0.0.6.CC.005  1  [Oct 21 2021 10:00:00]
> >> IMEI:
> >> +GCAP: +CGSM
> >> 
> >> OK
> >> 
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >>  drivers/bus/mhi/pci_generic.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> >> index 59a4896a8030..566483dc15db 100644
> >> --- a/drivers/bus/mhi/pci_generic.c
> >> +++ b/drivers/bus/mhi/pci_generic.c
> >> @@ -423,6 +423,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >>  	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
> >>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
> >>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> >> +	/* T99W175 (sdx55) */
> >> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0bf),
> >> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> >>  	/* MV31-W (Cinterion) */
> >>  	{ PCI_DEVICE(0x1269, 0x00b3),
> >>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> >> -- 
> >> 2.25.1
> >> 

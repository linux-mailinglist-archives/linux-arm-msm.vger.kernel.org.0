Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD58455486
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 07:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241445AbhKRGHB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 01:07:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:50524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241204AbhKRGHB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 01:07:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61D5A6120A;
        Thu, 18 Nov 2021 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637215441;
        bh=Gs9D2KwTxs3OWcxoK8xBCbG42AA+a6f4cC1TfwQ+o5E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=moEKlKyHv8PClQTKjgTg+2LjiZtNmfUWVgJwZLwcXI2yEVhXL8k9Itt0GUyJHNPmS
         CTJSarEPYLW7ReogNQjR3OcBR08YTN4RAg/Y4JYe94gOQ2VatDAQfMX4rxOb4CPalf
         f81no89sQ5OD02ZlqzvQ71T5aFGLejAoWb45GlpTOt3vNbypFIlGfMHhvljvnTxr9v
         gds+NCN+bTgqq4Xjgz5srDukLkrWzsKm2uS+iKD53RQLvWsKxEyidoFRT9HOaL3FOd
         vUY4uRoVvd1ag7NbSPOCjnVgX+h742Shecm0r4XMCHB1klmfZ93F2OTPUHJhjtx3CL
         GekyVFLARvoQQ==
Date:   Thu, 18 Nov 2021 11:33:55 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: pci_generic: Add new device ID support for
 T99W175
Message-ID: <20211118060355.GB6461@thinkpad>
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

Applied to mhi-next!

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

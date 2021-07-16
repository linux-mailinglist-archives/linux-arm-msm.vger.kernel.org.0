Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE823CB1F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 07:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbhGPFnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 01:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229833AbhGPFnW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 01:43:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B691613DF;
        Fri, 16 Jul 2021 05:40:25 +0000 (UTC)
Date:   Fri, 16 Jul 2021 11:10:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        quic_jhugo@quicinc.com, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v1 2/2] bus: mhi: core: Depict serial number in
 hexadecimals
Message-ID: <20210716054021.GB3323@workstation>
References: <1626395276-24171-1-git-send-email-bbhatt@codeaurora.org>
 <1626395276-24171-3-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626395276-24171-3-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 15, 2021 at 05:27:56PM -0700, Bhaumik Bhatt wrote:
> In order to maintain consistency with the way OEM PK hash is
> displayed and improve the current way, depict serial number in
> upper case hexadecimals.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Just a minor nit, other than that:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 8b4336e..d825a06 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
>  	struct mhi_device *mhi_dev = to_mhi_device(dev);
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>  
> -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> +	return snprintf(buf, PAGE_SIZE, "Serial Number: 0x%X\n",

nit: please use "0x%x"

>  			mhi_cntrl->serial_number);
>  }
>  static DEVICE_ATTR_RO(serial_number);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

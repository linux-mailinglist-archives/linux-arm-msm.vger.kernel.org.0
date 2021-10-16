Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181CB4300DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 09:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhJPHkH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 03:40:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243775AbhJPHkD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 03:40:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03A67610D1;
        Sat, 16 Oct 2021 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634369875;
        bh=SQ1sGxstDNiCHoGFpM/o74PrWCBBtzDb9jdeE4ro8UE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fcTigPWuirmrSoOyW+bHf1GPh2yr33jOvrkoCETXbO4F1SCfpXuqM0E/ObD+AxFR9
         021jsF98bUKh0bGS1tkwkvSDP6hwhNIgE07/Xc+9dSd9xx/NIoLTap+VXs8zZZMpHv
         0fUQsLhV+fg3q2xU/075y2EMa2jLkSlEoF4gW1SQ=
Date:   Sat, 16 Oct 2021 09:37:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 3/3] bus: mhi: replace snprintf in show functions with
 sysfs_emit
Message-ID: <YWqBTj4slHq7HexS@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 12:27:34PM +0530, Manivannan Sadhasivam wrote:
> From: Qing Wang <wangqing@vivo.com>
> 
> coccicheck complains about the use of snprintf() in sysfs show functions.
> 
> Fix the following coccicheck warning:
> drivers/bus/mhi/core/init.c:97:8-16: WARNING: use scnprintf or sprintf.
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Signed-off-by: Qing Wang <wangqing@vivo.com>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Link: https://lore.kernel.org/r/1634095550-3978-1-git-send-email-wangqing@vivo.com
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 5aaca6d0f52b..a5a5c722731e 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
>  	struct mhi_device *mhi_dev = to_mhi_device(dev);
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>  
> -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> +	return sysfs_emit(buf, "Serial Number: %u\n",
>  			mhi_cntrl->serial_number);

The text "Serial Number: " should not be in here, right?  It's obvious
this is a serial number, that's what the documentation and file name
says.  Userspace should not have to parse sysfs files.

And why is only one sysfs entry being changed in this file?  Either they
all should be, or none, no need to do this one-patch-per-entry, right?

Note, I have rejected Qing's patches like this for other subsystems
already because they are not complete, this is something they are well
aware of by now...

thanks,

greg k-h

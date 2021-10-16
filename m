Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A05B4300AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 08:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236706AbhJPGs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 02:48:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:60952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236583AbhJPGs5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 02:48:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C1CF61108;
        Sat, 16 Oct 2021 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634366810;
        bh=ahnp24X17vL4giBapwgLqsYQxgIgv2RuRJVI0FsVq4E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=olWqvhIje6THog/VYiX6uFRrRFyYUj6/9gZ41PjXLWU19WrggyOW6w46XrtDja0Ao
         1gbpiC/m6MT3wMFWbNCKDXE4l3fQI9cGcyejxZH9Os1vVZL8mRESNcFvywOpT6F3vt
         muYcOp5hCxTuOV7MF3FlnHPCn1Sg+YDoEYjs+R8FZUxS0Zl/O14sHhc1ZrIaWXFM5W
         CjW+Vs2G/RHy0Q7q+JNZBdHUIjSS597FKyxG6iBMJjr9A9PU6iS+vHsx8XjaQql+VE
         RhEenCAGYdSy2I81JBWpf3RywZ+EO2Q939/VYwfarXWqrL1JcyjTwptPUN3jAs9GSF
         ezeLRtEQ2KUYQ==
Date:   Sat, 16 Oct 2021 12:16:43 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Qing Wang <wangqing@vivo.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: replace snprintf in show functions with
 sysfs_emit
Message-ID: <20211016064643.GA23491@thinkpad>
References: <1634095550-3978-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634095550-3978-1-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 12, 2021 at 08:25:50PM -0700, Qing Wang wrote:
> coccicheck complains about the use of snprintf() in sysfs show functions.
> 
> Fix the following coccicheck warning:
> drivers/bus/mhi/core/init.c:97:8-16: WARNING: use scnprintf or sprintf.
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Signed-off-by: Qing Wang <wangqing@vivo.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c81b377..f3ddefe 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
>  	struct mhi_device *mhi_dev = to_mhi_device(dev);
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>  
> -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> +	return sysfs_emit(buf, "Serial Number: %u\n",
>  			mhi_cntrl->serial_number);
>  }
>  static DEVICE_ATTR_RO(serial_number);
> -- 
> 2.7.4
> 

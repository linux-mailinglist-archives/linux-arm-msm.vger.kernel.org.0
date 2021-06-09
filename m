Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EB53A1B61
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 18:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhFIRBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 13:01:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:47616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231132AbhFIRBO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 13:01:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCA5A6139A;
        Wed,  9 Jun 2021 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623257959;
        bh=j+9ZvgFzt2Oi5vNAUO87QSrR/HuRPT3TeK8NyQbv1y0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OL9oD4VJfBeYxSMSMijst/dZ0Sf6NRTAA60it+ghUGTkdbxMvtB0gMq2Mk2G0bXku
         Mb6XihEHsYy1m9LnzmwHNHHgrfM6jpkv6MJZgCYKNIpThjEuxtOHU768KxAPHxDcee
         ZKD1zhZMZMFynxUSrLphahiaetluzR1+K+91lDSw=
Date:   Wed, 9 Jun 2021 18:59:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarvis.w.jiang@gmail.com, loic.poulain@linaro.org,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH 2/3] bus: mhi: pci_generic: Fix possible use-after-free
 in mhi_pci_remove()
Message-ID: <YMDzZDVDOgR22ey1@kroah.com>
References: <20210606153741.20725-1-manivannan.sadhasivam@linaro.org>
 <20210606153741.20725-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606153741.20725-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 06, 2021 at 09:07:40PM +0530, Manivannan Sadhasivam wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> This driver's remove path calls del_timer(). However, that function
> does not wait until the timer handler finishes. This means that the
> timer handler may still be running after the driver's remove function
> has finished, which would result in a use-after-free.
> 
> Fix by calling del_timer_sync(), which makes sure the timer handler
> has finished, and unable to re-schedule itself.
> 
> Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Hemant kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
> Link: https://lore.kernel.org/r/20210413160318.2003699-1-weiyongjun1@huawei.com
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

No Cc: stable on this?  I'll go add it...

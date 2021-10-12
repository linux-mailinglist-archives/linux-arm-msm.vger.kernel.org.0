Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BF7429EAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 09:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbhJLHex (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 03:34:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233834AbhJLHex (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 03:34:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38F7360ED4;
        Tue, 12 Oct 2021 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634023972;
        bh=LRBm2jh+UamGAZjoyaJ0xwYHqwdFrEgK4TcXaFgiWuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a/zEPf/+c+s5zCNYxn0+CCUcChx6frMtDzoHZqV02f92DqZbzb3iK+E4IsQTDlHGG
         UMJdAni034u8oTa5Lse9bIO7G4xp3NufOamCx75bOqnFyZuyqVKIbTErDnTLwc4Xl1
         50tfVc3L+PO7PndItyIa6p+JyNLeFgXk/fHd1QJE=
Date:   Tue, 12 Oct 2021 09:32:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, ppratap@codeaurora.org,
        pkondeti@codeaurora.org
Subject: Re: [PATCH] usb: dwc: host: add xhci_plat_priv quirk
 XHCI_SKIP_PHY_INIT
Message-ID: <YWU6IZwm2T24ONW2@kroah.com>
References: <1633946518-13906-1-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633946518-13906-1-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 11, 2021 at 03:31:57PM +0530, Sandeep Maheswaram wrote:
> dwc3 manages PHY by own DRD driver, so skip the management by
> HCD core.
> During runtime suspend phy was not getting suspend because
> runtime_usage value is 2.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/host.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index f29a264..0921f05 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -11,6 +11,11 @@
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> +#include "../host/xhci-plat.h"

Why are you tying the dwc3 driver to the xhci driver?


> +
> +static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
> +	.quirks = XHCI_SKIP_PHY_INIT,

If these quirks are now "global", they should go into a
include/linux/usb/ .h file, right?

thanks,

greg k-h

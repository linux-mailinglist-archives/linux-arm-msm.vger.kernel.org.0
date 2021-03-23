Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FC2345DCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 13:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhCWMKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 08:10:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:59656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230447AbhCWMJx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 08:09:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2429E619B8;
        Tue, 23 Mar 2021 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616501393;
        bh=NUDtKN67DNS8aVpPFNnBh94JC9s43ocy1tBIXArLiKQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=THWrW1FGBf2X1zkHm3qCp15nhLyPGBU0pRlGYPO91Bnc0Ppr9dV9koJO2ALbPu/Uz
         YowFUj+5zmClVaQ7UG+I3FO7xnp72Argytg5yqlUEM9n+mUZVQXO6PY0CA5WH+jXZE
         UsFMuf8KCPMRrtRMsYpoBPhSVhaBn/PRmyYvG+XA=
Date:   Tue, 23 Mar 2021 13:09:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v5 2/4] usb: dwc3: host: Add suspend_quirk for dwc3 host
Message-ID: <YFnajrkzmAC2a0Dw@kroah.com>
References: <1616434280-32635-1-git-send-email-sanm@codeaurora.org>
 <1616434280-32635-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616434280-32635-3-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 22, 2021 at 11:01:18PM +0530, Sandeep Maheswaram wrote:
> Adding suspend quirk function for dwc3 host which will be called
> during xhci suspend.
> Setting hs_phy_mode, ss_phy_mode , phy_power_off flags and phy mode
> during host suspend.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.h |  3 +++
>  drivers/usb/dwc3/host.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index ce6bd84..f05546c 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1113,6 +1113,9 @@ struct dwc3 {
>  
>  	bool			phys_ready;
>  
> +	unsigned int            hs_phy_mode;
> +	bool			phy_power_off;
> +
>  	struct ulpi		*ulpi;
>  	bool			ulpi_ready;
>  
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index f29a264..3db042c 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -11,6 +11,13 @@
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> +#include "../host/xhci.h"
> +#include "../host/xhci-plat.h"
> +int xhci_dwc3_suspend_quirk(struct usb_hcd *hcd);

Wait, this is right below down in this file, shouldn't it be static?


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5648A44081A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Oct 2021 10:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhJ3JA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Oct 2021 05:00:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:51316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230427AbhJ3JA6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Oct 2021 05:00:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FAF960F58;
        Sat, 30 Oct 2021 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635584308;
        bh=qG3G823JIzBJ2/MxvF2Pm7j/ThHt+frg08MkdIe9CWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eSkQPHFQ3FzheWgeM7ofBSJMya6fMVELILKWCNXfBgxkhedsSnfglihc/Emiaz8Az
         0cTUWEQtLGSNTZ8I9tGzUtSxzqj5p4nU+yOBqqo1GFLzuyOAlgWTLvi1Z1LbXS3gt3
         SPI1zkI6uJNIR02kNEGt9r/GAVHznpzLoi9iZgLA=
Date:   Sat, 30 Oct 2021 10:58:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH 2/3] usb: host: xhci-plat: Add device property to set
 XHCI_SKIP_PHY_INIT quirk
Message-ID: <YX0JMfgHS3vqEdU6@kroah.com>
References: <1635272372-9982-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635272372-9982-3-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635272372-9982-3-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 26, 2021 at 11:49:31PM +0530, Sandeep Maheswaram wrote:
> Add device property usb-skip-phy-init to check and set XHCI_SKIP_PHY_INIT
> quirk.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  drivers/usb/host/xhci-plat.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c1edcc9..2a45f89 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -323,6 +323,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
>  			xhci->quirks |= XHCI_BROKEN_PORT_PED;
>  
> +		if (device_property_read_bool(tmpdev, "usb-skip-phy-init"))
> +			xhci->quirks |= XHCI_SKIP_PHY_INIT;
> +

Why is this needed?  What will it fix?

You need more information.

thanks,
greg k-h

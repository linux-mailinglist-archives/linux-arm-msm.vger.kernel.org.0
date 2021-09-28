Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE0541BAC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 01:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243194AbhI1XKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 19:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243192AbhI1XKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 19:10:38 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD3AC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 16:08:58 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id k17so306999pff.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VAVjy8HcaFqaIzDnTlnGPoodVICGjX7cWhESEeYfADg=;
        b=oS9uweXO3FrPncRchHQEfxqL1veKPLliIy5Xe0MgjcruuM1JKRfGB5avSRn6VzVDYO
         HgHHKd0oa1DhfeUZbkCgAAo2H3nCvK1bfcnUs4bzu64kowqxKpgxGfbfxudBdL23iGpT
         lGY4k6Suz3YUqw8MjgjmTZRp05OIiD3pzKpHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VAVjy8HcaFqaIzDnTlnGPoodVICGjX7cWhESEeYfADg=;
        b=e1grTfbm6M7glLAYj7PqPWJJcX2DalJjX1aOyZn9Vjp/FHLPxEQyW13FFQZ5Zj1PWR
         zVs2EUC3To1R0lWMAQJDvA7xPr18XYv9MchDcRK/jWiyvSot2BTMQOlaW1t5sgiONvTr
         hzwwlOcRpcz2wHeEbWcLfveLpHaQWw+7xm/sUPdJex+yQNvNeDf7Zef7V+g052UwoZkZ
         ou+9CxZcmOrPD4JySBs63zM6jwvyuXttIFOCzNw6o9GIwozN2NOArkn8HMDdVaplh5y4
         +VrAiVmQFJM1cQ3iri8FeBfph3SrIy8A67cDOtGDFtdDWabP6OabxI+PWC3UQHkObqr6
         WjDQ==
X-Gm-Message-State: AOAM533ZwWG5dUUJTwdNcbzZvX+svEhMnlPcupa5f7l6PyMc+rFji4iR
        IhEw0pHJQkP7BrykuzDphUML4w==
X-Google-Smtp-Source: ABdhPJxb62wKoZWvOkb8tbvGIK8WyPo5F0hAn5W/Yvg4gHdhGsQHmdypvxWY5LBDB9Zi0TpfNuvcVQ==
X-Received: by 2002:a62:8f93:0:b0:447:baea:b5a7 with SMTP id n141-20020a628f93000000b00447baeab5a7mr288096pfd.68.1632870537575;
        Tue, 28 Sep 2021 16:08:57 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d7ca:580:94ab:8af8])
        by smtp.gmail.com with ESMTPSA id b2sm190693pfr.58.2021.09.28.16.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 16:08:57 -0700 (PDT)
Date:   Tue, 28 Sep 2021 16:08:54 -0700
From:   Brian Norris <briannorris@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Subject: Re: [PATCH v8 2/6] usb: host: xhci: plat: Add suspend quirk for dwc3
 controller
Message-ID: <YVOghtE9VkHGpItZ@google.com>
References: <1624882097-23265-1-git-send-email-sanm@codeaurora.org>
 <1624882097-23265-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624882097-23265-3-git-send-email-sanm@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 28, 2021 at 05:38:13PM +0530, Sandeep Maheswaram wrote:
> During suspend read the status of all port and make sure the PHYs
> are in the correct mode based on current speed.
> Phy interrupt masks are set based on this mode. Keep track of the mode
> of the HS PHY to be able to configure wakeup properly.
> 
> Also check during suspend if any wakeup capable devices are
> connected to the controller (directly or through hubs), if there
> are none set a flag to indicate that the PHY should be powered
> down during suspend.

...

> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c

> @@ -430,6 +431,39 @@ static int xhci_plat_remove(struct platform_device *dev)
>  
>  	return 0;
>  }
> +static void xhci_dwc3_suspend_quirk(struct usb_hcd *hcd)

nit: you need a blank line above this (in between functions).

> +{
> +	int i, num_ports;
> +	u32 reg;
> +	unsigned int ss_phy_mode = 0;
> +	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
> +	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> +
> +	dwc->hs_phy_mode = 0;
> +
> +	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> +	num_ports = HCS_MAX_PORTS(reg);
> +
> +	for (i = 0; i < num_ports; i++) {
> +		reg = readl(&xhci_hcd->op_regs->port_status_base + i * 0x04);
> +		if (reg & PORT_PE) {
> +			if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> +				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_HS;
> +			else if (DEV_LOWSPEED(reg))
> +				dwc->hs_phy_mode |= PHY_MODE_USB_HOST_LS;
> +
> +			if (DEV_SUPERSPEED(reg))
> +				ss_phy_mode |= PHY_MODE_USB_HOST_SS;
> +		}
> +	}
> +	phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_mode);
> +	phy_set_mode(dwc->usb3_generic_phy, ss_phy_mode);
> +
> +	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +		dwc->phy_power_off = false;
> +	else
> +		dwc->phy_power_off = true;
> +}

This series breaks USB across S3 suspend/resume on Rockchip RK3399 Gru
platforms. Those platforms do not support USB wake (they power off many
of the relevant IP blocks in S3), and they *require* reconfiguring the
PHY on resume, but usb_wakeup_enabled_descendants() is returning
non-zero. If I revert patch 3, things work again.

Perhaps that's a Rockchip bug (should such platforms be disabling all PM
wakeup capabilities for their child hubs/devices?), but I'd much
appreciate resolving that before merging such a regression.

This also may be a sign that usb_wakeup_enabled_descendants() isn't
really the precise condition you should be using, if other platforms
aren't accurately reflecting feature support status in here.

Brian

P.S. In case it matters, I'm noticing this because earlier versions of
your patches (which have the same problem) are merged in our downstream
Chromium kernel tree.

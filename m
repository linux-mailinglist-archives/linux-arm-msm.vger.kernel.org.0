Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67E939BAFA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 16:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhFDOiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 10:38:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:45282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229667AbhFDOiA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 10:38:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 450CE613E9;
        Fri,  4 Jun 2021 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622817373;
        bh=HwCNaCxyfpmQTZr5tIqLf0mLyNwi684+TYqbc6F7EQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dwRkfSKLdoVj8zEJKZD00ctGczPo7L93A4Pc8mu6iKhNUkN65FB0A9bvZyqbJqSyg
         BfsrianZHpbfzJ3xMC+sMc0xlbjG7DdPe7laCVrvFVcpdOAqttseAPNwfZNeSWE4Ev
         gYVqX8N+BxoRJmNADNLO7LdTFU/S87LXFEDVtXZs=
Date:   Fri, 4 Jun 2021 16:36:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
Message-ID: <YLo6W5sKaXvy51eW@kroah.com>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com>
 <87k0n9btnb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k0n9btnb.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 04, 2021 at 05:18:16PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> > On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
> >> Changes in V9:
> >>  - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qcom will
> >>    add the property by default from the kernel.
> >
> > This patch series has one build failure and one warning added:
> >
> > drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_calc_tx_fifo_size’:
> > drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of ‘dwc3_mdwidth’ makes pointer from integer without a cast [-Wint-conversion]
> >   653 |         mdwidth = dwc3_mdwidth(dwc->hwparams.hwparams0);
> >       |                                ~~~~~~~~~~~~~^~~~~~~~~~
> >       |                                             |
> >       |                                             u32 {aka unsigned int}
> > In file included from drivers/usb/dwc3/debug.h:14,
> >                  from drivers/usb/dwc3/gadget.c:25:
> > drivers/usb/dwc3/core.h:1493:45: note: expected ‘struct dwc3 *’ but argument is of type ‘u32’ {aka ‘unsigned int’}
> >  1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
> >       |                                ~~~~~~~~~~~~~^~~
> >
> >
> > drivers/usb/dwc3/dwc3-qcom.c: In function ‘dwc3_qcom_of_register_core’:
> > drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of function ‘of_add_property’; did you mean ‘of_get_property’? [-Werror=implicit-function-declaration]
> >   660 |                 ret = of_add_property(dwc3_np, prop);
> >       |                       ^~~~~~~~~~~~~~~
> >       |                       of_get_property
> >
> >
> > How did you test these?
> 
> to be honest, I don't think these should go in (apart from the build
> failure) because it's likely to break instantiations of the core with
> differing FIFO sizes. Some instantiations even have some endpoints with
> dedicated functionality that requires the default FIFO size configured
> during coreConsultant instantiation. I know of at OMAP5 and some Intel
> implementations which have dedicated endpoints for processor tracing.
> 
> With OMAP5, these endpoints are configured at the top of the available
> endpoints, which means that if a gadget driver gets loaded and takes
> over most of the FIFO space because of this resizing, processor tracing
> will have a hard time running. That being said, processor tracing isn't
> supported in upstream at this moment.
> 
> I still think this may cause other places to break down. The promise the
> databook makes is that increasing the FIFO size over 2x wMaxPacketSize
> should bring little to no benefit, if we're not maintaining that, I
> wonder if the problem is with some of the BUSCFG registers instead,
> where we configure interconnect bursting and the like.

Good points.

Wesley, what kind of testing have you done on this on different devices?

thanks,

greg k-h

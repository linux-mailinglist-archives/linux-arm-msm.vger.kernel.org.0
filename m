Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500431D8B0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 00:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgERWiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 18:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgERWh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 18:37:59 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7BFC05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 15:37:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a9so9516290lfb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 15:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3YtOhWL2mmndh/B9O7jrraNl2K/LA7+g4gZiQi5QFWM=;
        b=UIrEiBCKjPEaHs9txQcJ4eYhQI5sBomEmfBF7lM8+4ODX8H7kImazReFdDZPb6jRA8
         46zgv7vOXYfK2uUj+LDkTzmLnBI6s/w6LwSrBSF/EGXFeVPktTKh2v1R+HvhZOu59kwj
         Ms7G1pG73g6eV5WYOi96KodmwBO3O/GtXVg82eTTUv/uoe6isX6pTnC1wfRKc5cSEq/i
         WM8Fg6Mxh9J6zV+wDO+SlMtpysc0SVTRk1Wu+tftmK8rtq4v33UgfBVfrhw5Y6uhPiJw
         dkOOTXjjTOFYlmLr8SOU0XBViuKFdYnckxg10s8olqKMGjwzkEvng66SXZIuqCWNRXBz
         tvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3YtOhWL2mmndh/B9O7jrraNl2K/LA7+g4gZiQi5QFWM=;
        b=iBgPzuMDAjSLWjEDmw5p2fPsdJiNVBP6V7wgQHZg1rWJS06Xoea1pMfa2iktsLjuDN
         9wRw3UMbU2k1467Fs2sVS6H7fd5Y9Pgf2f+ngF7I8h7Dk1OWtDZopYU7lNGNzaSgA869
         YZhDLESLKPw9Cu3QDc+8O1xHSxOfDHSF00jcPKjx86ct6SO3IITqgQbb77X0hk4dOOQn
         8anJz/V4BG+4lCI0qePwJDBIso8OC3sLGvY+BoF5PYG1jlzerSU+USm5fn4CRv91IAYF
         tXQt4xN6kBK/AOh0dDVR7YU6mseg/ka2YKdk0tHzTgxftKCZfSWhGz1GAYzO69zVbMlP
         tj6A==
X-Gm-Message-State: AOAM533HNHgkJsXZoKXV8CgrDEakWKANoeBntCjXd32oY5OnzrHDWjhN
        XuNJUNqWVDXjlQrxqcAllu0ha8ZqstWdSffAaHJIGA==
X-Google-Smtp-Source: ABdhPJwb6U3jnJRIW7JhMTzGBAIw19BG57A3U2BbspTLo+5uOMelKG0XdG075NTiAHcpifPysnd42K5ti/+xxng0WvE=
X-Received: by 2002:a05:6512:1047:: with SMTP id c7mr6310853lfb.12.1589841477683;
 Mon, 18 May 2020 15:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200506060025.1535960-1-vkoul@kernel.org> <20200506060025.1535960-4-vkoul@kernel.org>
 <CADYN=9JLeWHODRWDEcTE_6iZ3TX-E4yyx3OwqzK-H-ytLAmQUg@mail.gmail.com> <20200518195719.GG374218@vkoul-mobl.Dlink>
In-Reply-To: <20200518195719.GG374218@vkoul-mobl.Dlink>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 19 May 2020 00:37:46 +0200
Message-ID: <CADYN=9+VuTwVk32hQXAAeDyErMn7D4Y+Gzdehy_=c8fBeU23jA@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] usb: xhci: Add support for Renesas controller
 with memory
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Andreas_B=C3=B6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 May 2020 at 21:57, Vinod Koul <vkoul@kernel.org> wrote:
>
> Hi Anders,

Hi Vinod,

>
> On 18-05-20, 19:53, Anders Roxell wrote:
> > On Wed, 6 May 2020 at 08:01, Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > > loaded. Add these devices in pci table and invoke renesas firmware loader
> > > functions to check and load the firmware into device memory when
> > > required.
> > >
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> >
> > Hi, I got a build error when I built an arm64 allmodconfig kernel.
>
> Thanks for this. This is happening as we have default y for USB_XHCI_PCI
> and then we make USB_XHCI_PCI_RENESAS=m. That should be not allowed as
> we export as symbol so both can be inbuilt or modules but USB_XHCI_PCI=y
> and USB_XHCI_PCI_RENESAS=m cant. While it is valid that USB_XHCI_PCI=y|m
> and USB_XHCI_PCI_RENESAS=n
>
> So this seems to get fixed by below for me. I have tested with
>  - both y and m (easy)
>  - make USB_XHCI_PCI_RENESAS=n, USB_XHCI_PCI=y|m works
>  - try making USB_XHCI_PCI=y and USB_XHCI_PCI_RENESAS=m, then
>    USB_XHCI_PCI=m by kbuild :)
>  - try making USB_XHCI_PCI=m and USB_XHCI_PCI_RENESAS=y, kbuild gives
>    error prompt that it will be m due to depends
>
> Thanks to all the fixes done by Arnd which pointed me to this. Pls
> verify

I was able to build an arm64 allmodconfig kernel with this change.

Cheers,
Anders

> and I will send the fix with you as reported :)
>
> ---- >8 ----
>
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index b5c542d6a1c5..92783d175b3f 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -40,11 +40,11 @@ config USB_XHCI_DBGCAP
>  config USB_XHCI_PCI
>         tristate
>         depends on USB_PCI
> +       depends on USB_XHCI_PCI_RENESAS || !USB_XHCI_PCI_RENESAS
>         default y
>
>  config USB_XHCI_PCI_RENESAS
>         tristate "Support for additional Renesas xHCI controller with firwmare"
> -       depends on USB_XHCI_PCI
>         ---help---
>           Say 'Y' to enable the support for the Renesas xHCI controller with
>           firwmare. Make sure you have the firwmare for the device and
>
> --
> ~Vinod

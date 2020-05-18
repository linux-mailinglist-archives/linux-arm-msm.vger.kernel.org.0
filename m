Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3E11D8B2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 00:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgERWoA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 18:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgERWn7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 18:43:59 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A0FC05BD0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 15:43:58 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x13so5611133pfn.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 15:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yqx7fwzdjHJkmgg9PpHSWruK1legOs9tOHB9RxnwbRs=;
        b=mACWKIf6r3CqCdMcDBn6VjpepgfOd38WJ3opB+zwOCwxfXXdrBEKsrATprGGroAeMp
         wot++3+d03nJK0ZPSe+gJZuyUoYC3hQ4Z5zmK5de4eRmDwRQmvmHX2BJc/BGWKLPpvpF
         txm+8RCl4VFZUOqT3ZZr4VTpnCbW04VJfhQ3Lm3z/iRHkFx7eFp6mvCH9JcO46pQHYE/
         8rdPZMVduzbwNmQWSV95602GHTGAunWlY9GxhKRCZ9fap3cJgkyAcVwwVPAmU+Ock3uh
         vBcYLsSElqLyph0oIep9XjvpkQrsS7xjUIVE+jhf+sa8MScL7Z7/aSb6cVbcnRIcNI1+
         61+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yqx7fwzdjHJkmgg9PpHSWruK1legOs9tOHB9RxnwbRs=;
        b=SsV0HbuM3RbHrQWax8K/CfhsMw6a8m79yVJMQihC/hwwUZwa6c//7N17b53sOPCQwt
         ATbXz1Y3Z0Y7tllTXS0/EJQYb/HkJqF6KPdb7WwaOHObnebuHrp/DqEwD6rpcoOj/kbU
         zuP3yN5xqvd6XDk85ZZOhGQ71IyXOZew76/UyMEhtpBh+LMga+9iptaK/l5CFx1LBaZD
         Ndrmz7uGcBvm5gUJC/3IQ/cCsE0J4BZVt5Uv3x7oXWhTu+D6ejaQ/23K8ckjrTfVv88M
         fL9acjAx7ahQFUVK83d7f3X4LkcznKfKeaHt6jLk//pVR33XqGlreGHCsj2eoenJDx89
         tbrw==
X-Gm-Message-State: AOAM531NApSu3y71w9h2i/FNoL4fH5Yik0kN3HJu/N41gGuqDD7mu+jB
        uQ3pGVHJfBCLH9S1Wykjoj56d+ylZLc=
X-Google-Smtp-Source: ABdhPJxlIRTWrF03bepkBfTcA4XUBx8J3Q2qKZ56ZmeXbiQlsRaZjUwWtlIQFIFKflvwnVbnqLvxnA==
X-Received: by 2002:aa7:973b:: with SMTP id k27mr2880419pfg.219.1589841837792;
        Mon, 18 May 2020 15:43:57 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c21sm5583248pfo.131.2020.05.18.15.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 15:43:57 -0700 (PDT)
Date:   Mon, 18 May 2020 15:42:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas B?hler <dev@aboehler.at>, linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 3/5] usb: xhci: Add support for Renesas controller
 with memory
Message-ID: <20200518224234.GK2165@builder.lan>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-4-vkoul@kernel.org>
 <CADYN=9JLeWHODRWDEcTE_6iZ3TX-E4yyx3OwqzK-H-ytLAmQUg@mail.gmail.com>
 <20200518195719.GG374218@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518195719.GG374218@vkoul-mobl.Dlink>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 May 12:57 PDT 2020, Vinod Koul wrote:

> Hi Anders,
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
> verify and I will send the fix with you as reported :)
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

This correctly captures the variations you describe above.

Regards,
Bjorn

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

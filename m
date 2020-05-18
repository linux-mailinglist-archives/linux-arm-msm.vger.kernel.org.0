Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0314E1D85A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731485AbgERSUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731149AbgERRxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 13:53:30 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F09C05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 10:53:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h26so8876312lfg.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=auxOAvLWtf1pZZSyVWFPai0DZNGDmQxFTyydphVNHvc=;
        b=Vl9mmuiC7+19REd6VDHNPar684dLArGlRGMkQn5oqgGISgDn9rA9Lik+VFA810mJKY
         Z/lqU/1LmGYWo/ob8AYxr4Q2/sNWezCyNM2TzOQag9de1dtWzYYjvtcqYLaj5UZ/eRSs
         j8hcnYEluwCIYYQEZhNVvSaQXUVwZaW1vekivhtGXj6agpH6us2lt2eVka42V2tC3FBb
         anttD+3GT6y2WprpvsdRhnf8iEsWgi9AJN5Lcv6UsJMZ0dJcUwz0KICOSnVe+AkXm4jK
         rk7WxHuCvOQsbVbuTW9D42lNo27aBJenp/CL1EDodgfeQDkV7DKsAI6jISrExqk+E3OT
         iqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=auxOAvLWtf1pZZSyVWFPai0DZNGDmQxFTyydphVNHvc=;
        b=FkmZxm8EWWlcwwdagMQOhWRxd6BnXeJA7r52P3a5h/se+1klE4c1mh8HkW8VdJGlHd
         /MjUJ4GriNrQO28liYicvwdFGxvFAkqgTszjsQ8FZeXkUX8rVrNnLY8fFTcM6dg5/ynp
         30PDz/A89B5PHaR19IQjQAJGniu7X2q3b+Pq0ohMkAQQeQzxKATK4OAyFaS/GUGxtGGD
         dYxxnKOlmrKqYQVb/kyTGTtorNXYYqs119w33RbLc/0Y05hPMgv0VR7JkoJPURd8BkLb
         aUAxOnaKAxMF+YnQz04T57EVTp4UbOplKe/FLUQeydBkaMdGLSG7R5hz2aUOj76k9lMu
         WB0A==
X-Gm-Message-State: AOAM531PGOaTJKNQkZXu3jWhUHtWigSq6pC1s3uvfYJ6Ed/M5oUuUoT6
        eHoZuwXlfU+znHaCNMpx2DTit0n7jBu+Zwo0hHQcQg==
X-Google-Smtp-Source: ABdhPJzv50aTNUNlvFS55s6qXm4/Sd4s/08q5esk2oruVv0ektYpkAo/7FrkfziK8Eed36WkBnmqcTgcwCr6rqNC7Eg=
X-Received: by 2002:a19:48c9:: with SMTP id v192mr8337329lfa.20.1589824408382;
 Mon, 18 May 2020 10:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200506060025.1535960-1-vkoul@kernel.org> <20200506060025.1535960-4-vkoul@kernel.org>
In-Reply-To: <20200506060025.1535960-4-vkoul@kernel.org>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 18 May 2020 19:53:17 +0200
Message-ID: <CADYN=9JLeWHODRWDEcTE_6iZ3TX-E4yyx3OwqzK-H-ytLAmQUg@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] usb: xhci: Add support for Renesas controller
 with memory
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
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

On Wed, 6 May 2020 at 08:01, Vinod Koul <vkoul@kernel.org> wrote:
>
> Some rensas controller like uPD720201 and uPD720202 need firmware to be
> loaded. Add these devices in pci table and invoke renesas firmware loader
> functions to check and load the firmware into device memory when
> required.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Hi, I got a build error when I built an arm64 allmodconfig kernel.

building obj-arm64-next-20200518

aarch64-linux-gnu-ld: drivers/usb/host/xhci-pci.o: in function
`xhci_pci_remove':
/srv/src/kernel/next/obj-arm64-next-20200518/../drivers/usb/host/xhci-pci.c:411:
undefined reference to `renesas_xhci_pci_exit'
aarch64-linux-gnu-ld:
/srv/src/kernel/next/obj-arm64-next-20200518/../drivers/usb/host/xhci-pci.c:411:(.text+0xd8):
relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
`renesas_xhci_pci_exit'
aarch64-linux-gnu-ld: drivers/usb/host/xhci-pci.o: in function `xhci_pci_probe':
/srv/src/kernel/next/obj-arm64-next-20200518/../drivers/usb/host/xhci-pci.c:345:
undefined reference to `renesas_xhci_check_request_fw'
aarch64-linux-gnu-ld:
/srv/src/kernel/next/obj-arm64-next-20200518/../drivers/usb/host/xhci-pci.c:345:(.text+0x2298):
relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
`renesas_xhci_check_request_fw'
make[1]: *** [/srv/src/kernel/next/Makefile:1126: vmlinux] Error 1
make[1]: Target 'Image' not remade because of errors.
make: *** [Makefile:185: __sub-make] Error 2
make: Target 'Image' not remade because of errors.

When I reverted this patch from todays next tag next-20200518 I
managed to build.


Cheers,
Anders

> ---
>  drivers/usb/host/xhci-pci.c | 35 ++++++++++++++++++++++++++++++++++-
>  drivers/usb/host/xhci.h     |  1 +
>  2 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index b6c2f5c530e3..ef513c2fb843 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -15,6 +15,7 @@
>
>  #include "xhci.h"
>  #include "xhci-trace.h"
> +#include "xhci-pci.h"
>
>  #define SSIC_PORT_NUM          2
>  #define SSIC_PORT_CFG2         0x880c
> @@ -87,7 +88,16 @@ static int xhci_pci_reinit(struct xhci_hcd *xhci, struct pci_dev *pdev)
>
>  static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  {
> -       struct pci_dev          *pdev = to_pci_dev(dev);
> +       struct pci_dev                  *pdev = to_pci_dev(dev);
> +       struct xhci_driver_data         *driver_data;
> +       const struct pci_device_id      *id;
> +
> +       id = pci_match_id(pdev->driver->id_table, pdev);
> +
> +       if (id && id->driver_data) {
> +               driver_data = (struct xhci_driver_data *)id->driver_data;
> +               xhci->quirks |= driver_data->quirks;
> +       }
>
>         /* Look for vendor-specific quirks */
>         if (pdev->vendor == PCI_VENDOR_ID_FRESCO_LOGIC &&
> @@ -328,6 +338,14 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>         int retval;
>         struct xhci_hcd *xhci;
>         struct usb_hcd *hcd;
> +       struct xhci_driver_data *driver_data;
> +
> +       driver_data = (struct xhci_driver_data *)id->driver_data;
> +       if (driver_data && driver_data->quirks & XHCI_RENESAS_FW_QUIRK) {
> +               retval = renesas_xhci_check_request_fw(dev, id);
> +               if (retval)
> +                       return retval;
> +       }
>
>         /* Prevent runtime suspending between USB-2 and USB-3 initialization */
>         pm_runtime_get_noresume(&dev->dev);
> @@ -389,6 +407,9 @@ static void xhci_pci_remove(struct pci_dev *dev)
>         struct xhci_hcd *xhci;
>
>         xhci = hcd_to_xhci(pci_get_drvdata(dev));
> +       if (xhci->quirks & XHCI_RENESAS_FW_QUIRK)
> +               renesas_xhci_pci_exit(dev);
> +
>         xhci->xhc_state |= XHCI_STATE_REMOVING;
>
>         if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
> @@ -540,14 +561,26 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
>
>  /*-------------------------------------------------------------------------*/
>
> +static const struct xhci_driver_data reneses_data = {
> +       .quirks  = XHCI_RENESAS_FW_QUIRK,
> +       .firmware = "renesas_usb_fw.mem",
> +};
> +
>  /* PCI driver selection metadata; PCI hotplugging uses this */
>  static const struct pci_device_id pci_ids[] = {
> +       { PCI_DEVICE(0x1912, 0x0014),
> +               .driver_data =  (unsigned long)&reneses_data,
> +       },
> +       { PCI_DEVICE(0x1912, 0x0015),
> +               .driver_data =  (unsigned long)&reneses_data,
> +       },
>         /* handle any USB 3.0 xHCI controller */
>         { PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_XHCI, ~0),
>         },
>         { /* end: all zeroes */ }
>  };
>  MODULE_DEVICE_TABLE(pci, pci_ids);
> +MODULE_FIRMWARE("renesas_usb_fw.mem");
>
>  /* pci driver glue; this is a "new style" PCI driver module */
>  static struct pci_driver xhci_pci_driver = {
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 3289bb516201..4047363c7423 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1873,6 +1873,7 @@ struct xhci_hcd {
>  #define XHCI_DEFAULT_PM_RUNTIME_ALLOW  BIT_ULL(33)
>  #define XHCI_RESET_PLL_ON_DISCONNECT   BIT_ULL(34)
>  #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
> +#define XHCI_RENESAS_FW_QUIRK  BIT_ULL(36)
>
>         unsigned int            num_active_eps;
>         unsigned int            limit_active_eps;
> --
> 2.25.4
>

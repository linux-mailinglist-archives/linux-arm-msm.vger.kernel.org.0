Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0737A1F70D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 01:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgFKXV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 19:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgFKXV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 19:21:57 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA48BC08C5C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 16:21:56 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k2so2840727pjs.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 16:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Mx1BJS+F5RobWjcFE5t60E3qsaoq0yype8aHumba4AY=;
        b=RXgoilEj3158/D81CyzqcOUTZGSWHs9fozqqHDzPcxAklVjRdy3hZHjcRNjda1AfcN
         MWh8NjVKFFD6uqQ06STzWf+p07V+jMqx60Slct7LfhtNx8i3FESb0eHAl0Rzjg1hft3B
         ++DDeyiqrKN7JopuxQxvASgSkFdlE740/jr9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Mx1BJS+F5RobWjcFE5t60E3qsaoq0yype8aHumba4AY=;
        b=h1KcoX7YVIcK1zlb6SSp2QRtQmCIQQN9ogVrPVHI8NebERnMouvPfuaVeolXBgJ13y
         AqJDGm9aaXdOmuVcHr5LozVEcA3JFATfhFVYHxPTH9TTQl1CIbOMzzB7Wrn97kHI/iWX
         HlOQBT+63nJAF6e3MjJRL1Hc8kGbo4oYZT5C9QRYt8Rsczl/zSZQZWyjcFoK13QmWPDq
         K1YyHBzl76XiW/P6uiCdYJzRFUwF0A8Ua02RNRsrmHXyGaYXEdoaYg3Ws6RDjOjfyLrW
         XUc7U6glY+bUMThlew6ICQ5X4LeF9xwEroNEf/V+dDPYDSc00n4bseUAa1Y+1mwiC708
         M5KQ==
X-Gm-Message-State: AOAM531GO02fktPAJjTF05if3ck6UH/Ma6x8fopzNQ1IQX6FcSMHZogE
        vIA6dY1oFqNsFw2SseaYCGx8OMTC4bE=
X-Google-Smtp-Source: ABdhPJwdz2sTBkJb9s0f/hzOItcMgoPC81y0CH/eE7gR25jQYxuS18l1pPBiz49y8/WC7LrnNm8i4Q==
X-Received: by 2002:a17:90a:70c6:: with SMTP id a6mr9302299pjm.16.1591917716068;
        Thu, 11 Jun 2020 16:21:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b7sm4036787pfo.202.2020.06.11.16.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 16:21:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591885683-29514-3-git-send-email-sanm@codeaurora.org>
References: <1591885683-29514-1-git-send-email-sanm@codeaurora.org> <1591885683-29514-3-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH 2/2] usb: dwc3: Host wake up support from system suspend
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Thu, 11 Jun 2020 16:21:54 -0700
Message-ID: <159191771455.242598.12826819292508436205@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-06-11 07:28:03)
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 25c686a7..8370350 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -31,15 +31,19 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/of.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/hcd.h>
> =20
>  #include "core.h"
>  #include "gadget.h"
>  #include "io.h"
> =20
>  #include "debug.h"
> +#include "../host/xhci.h"
> =20
>  #define DWC3_DEFAULT_AUTOSUSPEND_DELAY 5000 /* ms */
> =20
> +bool need_phy_for_wakeup;

static? But why isn't it part of 'struct dwc3'? There could be multiple
dwc3 instances that may or may not be wakeup capable.

> +
>  /**
>   * dwc3_get_dr_mode - Validates and sets dr_mode
>   * @dwc: pointer to our context structure
> @@ -1627,10 +1631,36 @@ static int dwc3_core_init_for_resume(struct dwc3 =
*dwc)
>         return ret;
>  }
> =20
> +static void dwc3_set_phy_speed_flags(struct dwc3 *dwc)
> +{
> +
> +       int i, num_ports;
> +       u32 reg;
> +       struct usb_hcd  *hcd =3D platform_get_drvdata(dwc->xhci);
> +       struct xhci_hcd *xhci_hcd =3D hcd_to_xhci(hcd);
> +
> +       dwc->hs_phy_flags &=3D ~(PHY_MODE_USB_HOST_HS | PHY_MODE_USB_HOST=
_LS);
> +
> +       reg =3D readl(&xhci_hcd->cap_regs->hcs_params1);
> +
> +       num_ports =3D HCS_MAX_PORTS(reg);
> +       for (i =3D 0; i < num_ports; i++) {
> +               reg =3D readl(&xhci_hcd->op_regs->port_status_base + i*0x=
10);

Please format this as 'port_status_base + i * 0x10'

> +               if (reg & PORT_PE) {
> +                       if (DEV_HIGHSPEED(reg) || DEV_FULLSPEED(reg))
> +                               dwc->hs_phy_flags |=3D PHY_MODE_USB_HOST_=
HS;
> +                       else if (DEV_LOWSPEED(reg))
> +                               dwc->hs_phy_flags |=3D PHY_MODE_USB_HOST_=
LS;
> +               }
> +       }
> +       phy_set_mode(dwc->usb2_generic_phy, dwc->hs_phy_flags);
> +}
> +
>  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  {
>         unsigned long   flags;
>         u32 reg;
> +       struct usb_hcd  *hcd =3D platform_get_drvdata(dwc->xhci);
> =20
>         switch (dwc->current_dr_role) {
>         case DWC3_GCTL_PRTCAP_DEVICE:
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 013f42a..ff02d41 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1094,6 +1094,7 @@ struct dwc3 {
>         struct phy              *usb3_generic_phy;
> =20
>         bool                    phys_ready;
> +       int                     hs_phy_flags;

Does it need to be signed? Why not unsigned int or unsigned long?

> =20
>         struct ulpi             *ulpi;
>         bool                    ulpi_ready;
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..ec183646 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -19,6 +19,7 @@
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
>  #include <linux/iopoll.h>
> +#include <linux/usb/hcd.h>
> =20
>  #include "core.h"
> =20
> @@ -192,21 +193,34 @@ static int dwc3_qcom_register_extcon(struct dwc3_qc=
om *qcom)
> =20
>  static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
> +       struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
> +
>         if (qcom->hs_phy_irq) {
>                 disable_irq_wake(qcom->hs_phy_irq);
>                 disable_irq_nosync(qcom->hs_phy_irq);
>         }
> +       if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_LS) {
> +               if (qcom->dp_hs_phy_irq) {
> +                       disable_irq_wake(qcom->dp_hs_phy_irq);
> +                       disable_irq_nosync(qcom->dp_hs_phy_irq);
> +               }
> +       } else if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_HS) {
> +               if (qcom->dm_hs_phy_irq) {
> +                       disable_irq_wake(qcom->dm_hs_phy_irq);
> +                       disable_irq_nosync(qcom->dm_hs_phy_irq);
> +               }
> +       } else {
> =20
> -       if (qcom->dp_hs_phy_irq) {
> -               disable_irq_wake(qcom->dp_hs_phy_irq);
> -               disable_irq_nosync(qcom->dp_hs_phy_irq);
> -       }
> +               if (qcom->dp_hs_phy_irq) {
> +                       disable_irq_wake(qcom->dp_hs_phy_irq);
> +                       disable_irq_nosync(qcom->dp_hs_phy_irq);
> +               }
> =20
> -       if (qcom->dm_hs_phy_irq) {
> -               disable_irq_wake(qcom->dm_hs_phy_irq);
> -               disable_irq_nosync(qcom->dm_hs_phy_irq);
> +               if (qcom->dm_hs_phy_irq) {
> +                       disable_irq_wake(qcom->dm_hs_phy_irq);
> +                       disable_irq_nosync(qcom->dm_hs_phy_irq);
> +               }
>         }
> -
>         if (qcom->ss_phy_irq) {
>                 disable_irq_wake(qcom->ss_phy_irq);
>                 disable_irq_nosync(qcom->ss_phy_irq);
> @@ -215,21 +229,34 @@ static void dwc3_qcom_disable_interrupts(struct dwc=
3_qcom *qcom)
> =20
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> +       struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
> +
>         if (qcom->hs_phy_irq) {
>                 enable_irq(qcom->hs_phy_irq);
>                 enable_irq_wake(qcom->hs_phy_irq);
>         }
> +       if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_LS) {
> +               if (qcom->dp_hs_phy_irq) {
> +                       enable_irq(qcom->dp_hs_phy_irq);
> +                       enable_irq_wake(qcom->dp_hs_phy_irq);
> +               }
> +       } else if (dwc->hs_phy_flags & PHY_MODE_USB_HOST_HS) {
> +               if (qcom->dm_hs_phy_irq) {
> +                       enable_irq(qcom->dm_hs_phy_irq);
> +                       enable_irq_wake(qcom->dm_hs_phy_irq);
> +               }
> +       } else {
> =20
> -       if (qcom->dp_hs_phy_irq) {
> -               enable_irq(qcom->dp_hs_phy_irq);
> -               enable_irq_wake(qcom->dp_hs_phy_irq);
> -       }
> +               if (qcom->dp_hs_phy_irq) {
> +                       enable_irq(qcom->dp_hs_phy_irq);
> +                       enable_irq_wake(qcom->dp_hs_phy_irq);
> +               }
> =20
> -       if (qcom->dm_hs_phy_irq) {
> -               enable_irq(qcom->dm_hs_phy_irq);
> -               enable_irq_wake(qcom->dm_hs_phy_irq);
> +               if (qcom->dm_hs_phy_irq) {
> +                       enable_irq(qcom->dm_hs_phy_irq);
> +                       enable_irq_wake(qcom->dm_hs_phy_irq);
> +               }
>         }
> -
>         if (qcom->ss_phy_irq) {
>                 enable_irq(qcom->ss_phy_irq);
>                 enable_irq_wake(qcom->ss_phy_irq);

Is it possible to move this code to use the wakeirq library? I believe
only one irq can be the "wakeup" irq in that case but maybe that is
possible if we know what mode that phy is in? Or does the superspeed and
some sort of high speed irq need to be enabled for wakeup in case a usb2
or usb3 device wants to wakeup?

> @@ -240,6 +267,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>         u32 val;
>         int i;
> +       struct dwc3 *dwc =3D platform_get_drvdata(qcom->dwc3);
> +       struct usb_hcd  *hcd =3D platform_get_drvdata(dwc->xhci);

Weird spacing here   ---^

> +
> +       if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> +               device_init_wakeup(qcom->dev, 1);
> =20
>         if (qcom->is_suspended)
>                 return 0;
> @@ -262,6 +294,8 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>         int ret;
>         int i;
> =20
> +       device_init_wakeup(qcom->dev, 0);

Usually device_init_wakeup() is called once during probe and then the
wakeup enable state for a device is controlled from userspace.  Calling
this here will be semi-disastrous in the sense that we're going to be
creating and destroying a wakeup sysfs object each time we suspend. I
see that dwc3 core code has this pattern of calling device_init_wakeup()
from the suspend/resume path too, which looks wrong.

Shouldn't we be forwarding the wakeup request from the root hub to the
controller? I'm not super clear on how USB PM is supposed to work but
this doesn't look right.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A5D465C98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 04:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355136AbhLBDUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 22:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344683AbhLBDUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 22:20:23 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B426AC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 19:17:01 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id 7so52736230oip.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 19:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=f8tSGjZsit51ZITlSBYML7OThbDeGlSnXcANZo2xXoU=;
        b=OcAcusTmUQNb722Q+s0JJolLzmZh/A/oMIjkcGLj60eyHpAVWmMoW55wR33LD1BR+u
         yZtIfif+P8rJ045jUniTURO4tFThxLGIl4VfWy9xzmFtFN8sSu/l6nxOFBUoatDjsiEJ
         cj4Syc4/y63vqOFzjGlHSfLl4ubvZGlry23jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=f8tSGjZsit51ZITlSBYML7OThbDeGlSnXcANZo2xXoU=;
        b=Hm4jYvsa33R8o5vdsGtTkQAVu1bYKWeFbHlHBEtr2U/FVbSiskTPfkwzL83/Ny6mKu
         RJpLG362NDXil7huOhZeN9sS43DTWf4SLDU+Y4QwRJkP3CrrTNG1q/xO475OK3JaKKXP
         3WO0wcVCCDVlBRY+PKhGpIug6mmAUUtbd/OWBPSsi12CmOKBFIlcoUsyktQ/gFP4e4kQ
         gPcpjSnPrtlsXm0la3pYYkvyBHSJ0yKf1iAwoAIPI8SQYxuGMO9xLzjI2MmvrCFAau24
         E0brw4YbQrTIUKSZPNhaJnCrgo1pVpiqHKlPuYgkSQpMB4XCA7LIxB+I0EBRW6EKG7nH
         Cypw==
X-Gm-Message-State: AOAM532OVSuPmsakmfzjebNpCFAzdcrbk8AI7UlsQu/7yqipEPt+B772
        ZEzCF59OH9gsQxIySSDLZmxTkxxtVSMn9J1OcGYjLw==
X-Google-Smtp-Source: ABdhPJxKKpqyYTRLZ/lnUGnoxlC6oopfHFJcy8Rj+02jlacnjWTqomFSu8Z35xm90T0/8VYMq8ziR8goHh2Z8my/XDA=
X-Received: by 2002:aca:2319:: with SMTP id e25mr2366326oie.164.1638415021099;
 Wed, 01 Dec 2021 19:17:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Dec 2021 19:17:00 -0800
MIME-Version: 1.0
In-Reply-To: <1638339338-6731-2-git-send-email-quic_c_sanm@quicinc.com>
References: <1638339338-6731-1-git-send-email-quic_c_sanm@quicinc.com> <1638339338-6731-2-git-send-email-quic_c_sanm@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 1 Dec 2021 19:17:00 -0800
Message-ID: <CAE-0n50YLsHhqoNQDNnGUYhHQSbMc7qnS5nGB-Nk2Z2J13xBVQ@mail.gmail.com>
Subject: Re: [PATCH v3] usb: host: xhci-plat: Set XHCI_SKIP_PHY_INIT quirk for
 DWC3 controller
To:     Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-11-30 22:15:38)
> Set XHCI_SKIP_PHY_INIT quirk to avoid phy initialization twice.
> Runtime suspend of phy drivers was failing from DWC3 driver as
> runtime usage value is 2 because the phy is initialized from
> DWC3 core and HCD core.
> DWC3 manages phy in their core drivers.

This looks wrapped weirdly.

> Set this quirk to avoid phy initialization in HCD core.
>
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>

Any Fixes tag?

> ---
>  drivers/usb/host/xhci-plat.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c1edcc9..9bbd939 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -327,6 +327,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>                                          &xhci->imod_interval);
>         }
>
> +       if (of_device_is_compatible(pdev->dev.parent->of_node, "snps,dwc3"))

Are we sure that pdev->dev.parent isn't NULL here?

> +               xhci->quirks |= XHCI_SKIP_PHY_INIT;
> +
>         hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev, "usb-phy", 0);
>         if (IS_ERR(hcd->usb_phy)) {

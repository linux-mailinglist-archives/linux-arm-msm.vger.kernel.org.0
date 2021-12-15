Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7939247503E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 02:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239096AbhLOBEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 20:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239235AbhLOBDr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 20:03:47 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAC1C0698D2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 17:02:34 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso22969285otj.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 17:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=tAS1Dz9hbso+xED173BAGau2yBWGVtEsqq1M5udA5B4=;
        b=GhcyDIIM2jm8UKC8uDNBGGtP77QCBxbllbAGtu+WpoWBH3wSVUhxwivFOrME8ST8tl
         Zca8cebk0sf1py77IcG8U7XyTmZl2CrY3HgsduuvXY4KLAknZShqH4ci1NZFEdEVjVtS
         qyAfyjgIDXllV3LnagwFoaCUz33TU3k844SXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=tAS1Dz9hbso+xED173BAGau2yBWGVtEsqq1M5udA5B4=;
        b=LbKFWbiOKHeK07LOELxsok3fmrmROuzWunYrs1ZQbSY3YhLljDrX7oNB1Da6fjLCtu
         nmeg2CGg5ee+EItAIB+PurIB8uynYtSGRSXTKDho4jrIAOb1iC4WEemBPRi3BO9MczqP
         5BzvKv2CZcBCdq9UqcBGryUYSC6gx0MsJ4fzo/YsJCXVOjaqjBPJ+mGlhB8HPValtFdR
         i86AZfQlwHLizuHlyIEJO8NilSjCGnqNgXznC1skC0QKziqK8bUHU8ziuSJ1j9XlhwVO
         CUVLMMw2u7PRD6/fbPh0iKS4vGfuCgbMUb8OPOzk+j/judbIPuIlQiPlhrqvEUA4kI/y
         Fr7A==
X-Gm-Message-State: AOAM531L+EVTrYs4bFQBQaTTN8npMPK2N8wSwia1cMgAlLtr3oawDVyq
        AhN9h6tsNYzNaWeICCY+oHCw+TqOXmNoX7yk1yOU4Q==
X-Google-Smtp-Source: ABdhPJzk2YYgzmM+8WnPv9/YqjRAIl9m1g3mvsykEz3iVPSAuGfqP9Mv76ORVCT7utH3L4rsdcBxx1fWaqPrYYaIpNM=
X-Received: by 2002:a05:6830:30b7:: with SMTP id g23mr6732732ots.159.1639530153506;
 Tue, 14 Dec 2021 17:02:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 02:02:33 +0100
MIME-Version: 1.0
In-Reply-To: <eeeedcb4-d444-5402-2822-0fe942bcb83a@quicinc.com>
References: <1638339338-6731-1-git-send-email-quic_c_sanm@quicinc.com>
 <1638339338-6731-2-git-send-email-quic_c_sanm@quicinc.com>
 <CAE-0n50YLsHhqoNQDNnGUYhHQSbMc7qnS5nGB-Nk2Z2J13xBVQ@mail.gmail.com> <eeeedcb4-d444-5402-2822-0fe942bcb83a@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 15 Dec 2021 02:02:33 +0100
Message-ID: <CAE-0n50sO_HcMiou7nhWTkGRiyG1-yHJmgXexMhS=j+AH2NyfA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-12-13 20:47:48)
>
> On 12/2/2021 8:47 AM, Stephen Boyd wrote:
> > Quoting Sandeep Maheswaram (2021-11-30 22:15:38)
> >> Set XHCI_SKIP_PHY_INIT quirk to avoid phy initialization twice.
> >> Runtime suspend of phy drivers was failing from DWC3 driver as
> >> runtime usage value is 2 because the phy is initialized from
> >> DWC3 core and HCD core.
> >> DWC3 manages phy in their core drivers.
> > This looks wrapped weirdly.
> >
> >> Set this quirk to avoid phy initialization in HCD core.
> >>
> >> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> > Any Fixes tag?
> Not sure about the commit id to be used here.

Maybe whenever the phy started being initialized twice?

> >
> >> ---
> >>   drivers/usb/host/xhci-plat.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat=
.c
> >> index c1edcc9..9bbd939 100644
> >> --- a/drivers/usb/host/xhci-plat.c
> >> +++ b/drivers/usb/host/xhci-plat.c
> >> @@ -327,6 +327,9 @@ static int xhci_plat_probe(struct platform_device =
*pdev)
> >>                                           &xhci->imod_interval);
> >>          }
> >>
> >> +       if (of_device_is_compatible(pdev->dev.parent->of_node, "snps,d=
wc3"))
> > Are we sure that pdev->dev.parent isn't NULL here?
>
> +=C2=A0=C2=A0=C2=A0 if (of_device_is_compatible(to_of_node(sysdev->fwnode=
), "snps,dwc3"))
>
> Will this be ok ?

Probably? But I see this function already uses 'sysdev->of_node' so
that's probably all that's necessary assuming sysdev =3D=3D pdev->dev.paren=
t
in this case.

	if (of_device_is_compatible(sysdev->of_node, "snps,dwc3"))

>
> >
> >> +               xhci->quirks |=3D XHCI_SKIP_PHY_INIT;
> >> +
> >>          hcd->usb_phy =3D devm_usb_get_phy_by_phandle(sysdev, "usb-phy=
", 0);
> >>          if (IS_ERR(hcd->usb_phy)) {

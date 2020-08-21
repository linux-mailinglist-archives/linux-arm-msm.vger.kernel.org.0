Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BE124DD43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 19:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgHUROu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 13:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgHUROo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 13:14:44 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C959C061573
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 10:14:44 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id f12so2009910ils.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RTvsFOhGC05ImvCGxAXHe80DLl0Vnoh8uhjw9uG61SY=;
        b=qCziGrqPDSVtOLmbK1hFmaPBOq+huaVij1yQ263tMaWZonY5TWfaBxMerhZMu5VEP3
         RoPEPwzz/xcjuV+sZCG1Saoia1u3YKqx63vETf1XPu5IrA200TfHKvEGxaOTNHo5W+mG
         tCpVqh73Ai1QJJiviJSfv/he9dZ0cRwKhv0cdp7vo+LbX6FHoujL6bkQB7Qzicv6p2hE
         x4koMTN4PnrpDrX8npHVGmmmPy8pj+MUkr0jW05+KtnOLdeBNgPBu3vwKyD3t1KNEL7u
         BWwPpeGGTD5KgVYO5yUReKtkMR1+S+ZD4oeEDFdPiKx6JydchJQlt24N3BzYvr5uqc7g
         MsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RTvsFOhGC05ImvCGxAXHe80DLl0Vnoh8uhjw9uG61SY=;
        b=B/nDUsFKJliQXpgbN9CrV04aAvM67Gbc5EJZ18ywEpyim1ggpaWcuxSZg3UxLZFgeR
         syMjrJ8PkHLxwVJezg9ynI8db1hB+bM4V8gSOdt5uQ5IASIj3r0sBKFECNHomKL3k6rb
         kJnsF1HF9CNQaylWV6acnhAKeIBPloTaxB09KhHcKUJqEVp4u8AzkzUuFZ9EklXMSqeZ
         bhoMXRBf+IOc8vGvInfBSdUsEXrfJnAt3yUMAt/m8l5P3wcp2BVCRzfdd7otmQELkyxo
         xiOcZSsBo3EmCuqVAP9XGEn7D5q2PrwpOQ/BFKLJi9K4XgPrHPiGsX+DuIrrPpTICgG4
         QRmA==
X-Gm-Message-State: AOAM53321hzOQDxH5pXYgZNNGOmX9j2X9FsHc0PDDLxAbOXZtU7TKJUh
        kH3fO/ViJc4e/g493yHHhxNYIRk+Ii4w4O+7SFPUMw==
X-Google-Smtp-Source: ABdhPJzBtpIobytboUBjp0jMvWUO7qPOEborYgyUfFC+VcbkdjoC05hgYoAhDbvXVVliplquim8DuARZHvyU0DBp/us=
X-Received: by 2002:a92:5209:: with SMTP id g9mr3383963ilb.72.1598030083248;
 Fri, 21 Aug 2020 10:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200819221750.2055932-1-robh@kernel.org> <20200821011237.GA4527@lx2k>
 <CAL_JsqLfzDMJXDdqtVBYWrvuB8kBDHECWmNkS5EJStiwSFtp-g@mail.gmail.com>
In-Reply-To: <CAL_JsqLfzDMJXDdqtVBYWrvuB8kBDHECWmNkS5EJStiwSFtp-g@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 21 Aug 2020 10:14:31 -0700
Message-ID: <CAOesGMhFGTZddCdusgfcUjfTP847am+F8jTAWrqYXjq1PLXxag@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Reformat PCI ranges/dma-ranges entries
To:     Rob Herring <robh@kernel.org>
Cc:     SoC Team <soc@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Robert Richter <rrichter@marvell.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 21, 2020 at 9:14 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Aug 20, 2020 at 8:53 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Wed, Aug 19, 2020 at 04:17:50PM -0600, Rob Herring wrote:
> > > While bracketing doesn't matter for a DTB, the DT schema checks rely =
on
> > > bracketing around each distinct entry. Reformat ranges and dma-ranges
> > > entries to fix warnings such as:
> > >
> > > arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@=
f8000000: ranges: [[2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, =
2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576]] is not valid under a=
ny of the given schemas (Possible causes of the failure):
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yam=
l: pcie@f8000000: ranges: True was expected
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yam=
l: pcie@f8000000: ranges:0: [2197815296, 0, 4194304000, 0, 4194304000, 0, 3=
1457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576] is too long
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yam=
l: pcie@f8000000: ranges:0:0: 2197815296 is not one of [16777216, 33554432,=
 50331648, 1107296256, 1124073472]
> >
> > Seems like a bug in your tool? Why would we bother with this churn?
>
> It's a feature. :)

The feature is better linting of ranges, the new lack of being able to
do that for the way we've always been allowed to write ranges is a
bug.

> In this case, with the entries bracketed, we can check the PCI top
> address cell contents in the common PCI schema and check how many
> ranges entries in the specific bridge schemas if they have some
> constraints. The use of bracketing is useful to defining the number of
> entries not just for ranges, but everywhere. A device binding defines
> how many register regions or interrupts for example. It makes sense to
> delineate entries in some way. While yes, we have #.*-cells, there's
> not really any way to handle that in json-schema. And let's face it,
> #.*-cells is an odd construct.
>
> Currently, the dtc dts->yaml output maintains all this formatting. I
> suppose we could change that such that we parse #.*-cells and define
> the boundaries based on them. But then dtc has to know about every
> case of #.*-cells. That's not impossible to do, but doesn't keep the
> tool and binding data separate.

That's already the case, isn't it? Run that part of the check if you
have a new enough dtc, otherwise warn that it's too old but do all the
other checks.

It's also just a change in one place: the tool, instead of evolving
the language by adding ad-hoc restrictions that the compiler doesn't
even know about, and requiring old code to change.

This way DTC could even warn/recommend bracketing per cell, when you
give it the ability to parse/handle it.

> Looking at it another way, do we really want to just allow anything? A
> device with 3 interrupts could be written as:
>
> interrupts =3D <1>, <2>, <3>;
> interrupts =3D <1 2 3>;
> interrupts =3D <1>, <2 3>;
> interrupts =3D [ 00 00 00 01 00 00 00 02 00 00 00 03 ];
>
> Or can we have some coding standards that are no more onerous or
> pedantic than what we have everywhere else?

We're generally quite careful about applying new restrictions and
expectations on coding standards all across the tree, and when we add
new ones we usually don't require legacy code to change overnight,
only when there are other relevant changes to those files.


-Olof

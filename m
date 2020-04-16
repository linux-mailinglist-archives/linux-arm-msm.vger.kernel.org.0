Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA521ACD71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 18:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410778AbgDPQS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 12:18:56 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39046 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbgDPQSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 12:18:55 -0400
Received: by mail-oi1-f195.google.com with SMTP id 8so6798586oiy.6;
        Thu, 16 Apr 2020 09:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4HfSPhfYRgg7hXjXhAC7Y1EeYCA1tKGpq/7RYwzqLQ=;
        b=XptBWNaXGtr2lf4zmDuotfET//WHlNnI9aEfVp8OZ+3Wjg/9rtR8Fim+MQV0gGhnoe
         EqW6pfsUzNMFQgBC5wPSnOrfdacyEeoPOT1JbZX1QKxhxHZFQLeGTaFY2+Rgfy+1GF84
         N9SyiGaZILPvjyDjIMErGMlJi7HkPUztjFBFsdZ3fNISs6Qh4p9g46f50PkzbzgVpDto
         ag6wynhM5DMFzuC5sGqdRCcLaNbzoYmNmVddYIhKLk/3h4+pw0SOkXFjRQZShnEvsYO8
         RmOfKSmGncNie/Gw1tfE3ICa3NExeDX6FjxyuvWvzhDMkpyAGfDxET1qKTxCLl/1UoU0
         mStA==
X-Gm-Message-State: AGi0PubCTHvujUBVZtpBxulfeXcV82BBNA2BkzAV0GLiL/AcLvp7oyUi
        aLqVgyxRJoluOwW7ZZWko4cjul/0js3kRKDI148=
X-Google-Smtp-Source: APiQypJ9S7cnz9hITqdHHVyamXCWYRrJVGPFnD+VZ/1EEx7X1+UtJPbyFBYx3JtLlZlLYcDWxZ5vL+tvZA1NAMOzy+c=
X-Received: by 2002:aca:f541:: with SMTP id t62mr3288764oih.148.1587053934205;
 Thu, 16 Apr 2020 09:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200416115658.20406-1-geert+renesas@glider.be>
 <20200416115658.20406-3-geert+renesas@glider.be> <20200416125630.GF4987@lakrids.cambridge.arm.com>
 <CAMuHMdWRW4+YLR8fz0hUTAPupRkM4Y5c82XHuOWSvNYOh-BZ0A@mail.gmail.com> <20200416155655.GA7155@lakrids.cambridge.arm.com>
In-Reply-To: <20200416155655.GA7155@lakrids.cambridge.arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Apr 2020 18:18:42 +0200
Message-ID: <CAMuHMdXO5Qv1XezGW+yELOaTkoFUA4B8SvBpBH=r4mLtbnkBhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] [RFC] arm64: Add dependencies to vendor-specific errata
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Robert Richter <rrichter@marvell.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

On Thu, Apr 16, 2020 at 5:57 PM Mark Rutland <mark.rutland@arm.com> wrote:
> On Thu, Apr 16, 2020 at 05:38:07PM +0200, Geert Uytterhoeven wrote:
> > And perhaps you do want to enable some platform-specific drivers for
> > VFIO pass-through?  Hence having ARCH_* dependencies on those drivers
> > means they cannot be enabled :-( Hmm...
>
> IIRC platform device passthrough requires an corresponding VFIO platform
> driver in the host to handle reset and so on, but it does seem a shame

If your SoC has a reset controller, that problem has been solved in a generic
way, cfr. "[PATCH v5] vfio: platform: Add generic reset controller support"
(https://lore.kernel.org/lkml/20181113131508.18246-1-geert+renesas@glider.be/).
Unfortunately not yet upstream.

Combine with "hw/arm/sysbus-fdt: Add support for instantiating generic devices"
(https://github.com/geertu/qemu/commit/180318003c08594e8e852b2285a98184f905bfa9)
and you're set ;-)

> to not allow the user to select a driver if they really want it.

I forgot you can add "|| VIRTIO_MMIO" to the dependencies of drivers for
devices that can be used with VFIO pass-through.

> I guess there might be platform-specific PCIe drivers too, which might
> work with VFIO regardless.

Indeed. PCI is business as usual.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

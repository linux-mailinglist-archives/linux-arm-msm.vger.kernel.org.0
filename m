Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D9F1ACAB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 17:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392405AbgDPPiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 11:38:23 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38598 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395361AbgDPPiT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 11:38:19 -0400
Received: by mail-ot1-f67.google.com with SMTP id k21so3424820otl.5;
        Thu, 16 Apr 2020 08:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lw132FJ1IkHMDhBaUz9OoWvHN6gIUc3nGCLM6oGU1MU=;
        b=Ohxo0TgYT84hGGjNfx80J4lWtmSSGdDmAX+fK1BRxguPvpnrWbL4kHK6Ebf9ycegIh
         OpyPLxZIxjZ3OV+nWuNrM2usJfcckEXTzY5DrMbj5XeRBEzu3WSYQa3NV47g3uXwYmJj
         oE50HOdLjD40PuvqWmFIbyqYhLPthnh5wPIghHMqO0uoOBk5BQfUey7/UCrSqaofF8ac
         YjEfxNHrF9Dy1e3AYwsBhK5nmhkxpefFaJA9i3FrWDlqkcfSTNXIiKKArRGnyfUJPRmg
         +p6eX3HW/BHEL7zq3txR1wfsmJsS7+xpZHpFxLnbtn//MQk6/e20FyTFzQt4umq4mUCm
         Eagg==
X-Gm-Message-State: AGi0PuY2dj7gk+C06xkyEv0C9VhjO/Lke/bY1WVOJ6+QuJWoGC+f5LLN
        17ezpkFP/td1EALjSIVM7KE5Al9Fcy0s/4cGI84=
X-Google-Smtp-Source: APiQypI12iXIrm8mtmSb+XKSEPYhA1HFJq3oTSPTAEFz3A7lZAnTnLkLIG43fWAGSkgC9em1kdGMDMbBxLJi/Z6CDKA=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr26140182otl.145.1587051498619;
 Thu, 16 Apr 2020 08:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200416115658.20406-1-geert+renesas@glider.be>
 <20200416115658.20406-3-geert+renesas@glider.be> <20200416125630.GF4987@lakrids.cambridge.arm.com>
In-Reply-To: <20200416125630.GF4987@lakrids.cambridge.arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Apr 2020 17:38:07 +0200
Message-ID: <CAMuHMdWRW4+YLR8fz0hUTAPupRkM4Y5c82XHuOWSvNYOh-BZ0A@mail.gmail.com>
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

On Thu, Apr 16, 2020 at 2:56 PM Mark Rutland <mark.rutland@arm.com> wrote:
> On Thu, Apr 16, 2020 at 01:56:58PM +0200, Geert Uytterhoeven wrote:
> > Currently the user is asked about enabling support for each and every
> > vendor-specific erratum, even when support for the specific platform is
> > not enabled.
> >
> > Fix this by adding platform dependencies to the config options
> > controlling support for vendor-specific errata.
> >
> > Note that FUJITSU_ERRATUM_010001 is left untouched, as no config symbol
> > exists for the Fujitsu A64FX platform.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I'm not su1re that it makes sense to do this in general, becaose the
> ARCH_* platform symbols are about plactform/SoC support (e.g. pinctrl
> drivers), and these are (mostly) CPU-local and/or VM-visible.
>
> I think that it makes sense for those to be independent because:
>
> * future SoCs in the same family might not need the same CPU errata
>   workarounds, and it's arguably just as confusing to have the option
>   there.

True.  But at least the dependency restricts the confusion to a smaller
audience.

> * It prevents building a minimal VM image with all (non-virtualized)
>   platform support disabled, but all possible (VM-visible) errata
>   options enabled. I do that occassionally for testing/analysis, and I
>   can imagine this is useful for those building images that are only
>   intended to be used in VMs.

Oh, you also want to build a "generic" guest kernel, with all ARCH_*
symbols disabled. Let's hope a maleficent user cannot disable errata
mitigations in the guest kernel and break the host ;-)
And perhaps you do want to enable some platform-specific drivers for
VFIO pass-through?  Hence having ARCH_* dependencies on those drivers
means they cannot be enabled :-( Hmm...

> I think the change to SOCIONEXT_SYNQUACER_PREITS makes sense given
> that's a platform-level detail. Arguably that should be moved into
> drivers/irqchip/Kconfig.

OK, makes sense.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

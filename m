Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596571ACAE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 17:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897410AbgDPNhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 09:37:03 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38091 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897390AbgDPNhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 09:37:00 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N79q8-1jAqgf0EW4-017YmP; Thu, 16 Apr 2020 15:36:57 +0200
Received: by mail-qk1-f179.google.com with SMTP id j4so21187396qkc.11;
        Thu, 16 Apr 2020 06:36:56 -0700 (PDT)
X-Gm-Message-State: AGi0PuZjfQOakkBeJhSdzg1EQ4Yni8buejfx9qHBBF5n5sgs2SjRWb8c
        slfbla8MWhx1viB09XWLFEWqV1uSewhZje81w0Y=
X-Google-Smtp-Source: APiQypLVyFmoRVlk38JL3t/KgQwGOgf5vTbZbwYZ8CAepAFC6fF8Q7UEBWUdcp5NmdoSyWhbML+tvWJCMo127crkfFc=
X-Received: by 2002:a37:851:: with SMTP id 78mr31807202qki.352.1587044215844;
 Thu, 16 Apr 2020 06:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200416115658.20406-1-geert+renesas@glider.be>
 <20200416115658.20406-3-geert+renesas@glider.be> <20200416125630.GF4987@lakrids.cambridge.arm.com>
In-Reply-To: <20200416125630.GF4987@lakrids.cambridge.arm.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 16 Apr 2020 15:36:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3HkXotBFVfbL3iaqUAM2ENpBKh7gy+hXH8TXsZHPfwTQ@mail.gmail.com>
Message-ID: <CAK8P3a3HkXotBFVfbL3iaqUAM2ENpBKh7gy+hXH8TXsZHPfwTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] [RFC] arm64: Add dependencies to vendor-specific errata
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Robert Richter <rrichter@marvell.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zICuUsxQPPQJD0mFrfj74gKDbR2oFM2uttNnB1Q9C3oNdi5LUtv
 5D6vxZFGM/iFgzEoQ5IUx5wa/5KVR2w0jlyVvP4fg+H74Ianhbu1TbcYM3puwlF/LOmYA1g
 ipQbQGngZ9ulwoqwP43Iy+D+FiperRfFB1lS5OwY7cFdRnKwHSy9XcKbs6ze/eAmuhzbQc6
 ba3Xk7hYzVpNGelRS4umw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lWGfSsnYJZU=:cg0dI2jhukpt3KneC3m51U
 4dp48keK9naDXcPzv+ZxDaUthdtZZp4jiK2p0jlHlQ/hlS9LIoR70Lzo7xxWdY1TVM1NcUOFz
 4DEk7JN2+Oiv8O83Xc3f9BtleBV6Le8MWI8+ESBu1OIqv4Yw4N49W0jUfZDbQaPmJbFhyUtgH
 E8Ik75fnVMl74xDRoHroFqVKTcisthkw5epvHqyMdGS5ct1i15TCz00X3NOZMdzUWG7xmM2Th
 jv3JObSm9NpoD+sA+zxmZaHgtX0tKtdQQfr+Tfsje34OaftldJnj3kmJIe3JtssyAprc8Ru8o
 LKw876ziLaoncBv6AM5asEyOcJMFgiG/0jmSKSsUmZK/SoVZXYgoBp5e1QUPVEJ7Xqalkgz1x
 36pneyTABXBkzAjuPivkDEslewaUIMj0k2LEtXlWSGW6WqDKpvGlXm/IGHJlfi0DF0uJ8usgk
 8Q+AV3nSGobnvvsEMBIdEwjl28qLflaLCzVkV/BPXvZnO2cHNt+kDJcQYMWvynGCktgZuXpTf
 +mplQBjiPq5Narv2crbmgINc/PSxY3AfmYWBjEHjzuO6EsooFIjNUJbFNgAzSvTw+72KRmuAo
 F+LIXifeAZ6NZLqH+Hc3KOTy2DlKihNwmjvFt0YGQiR8Mbxgi4qVdlKQXlvn4K7kcDjh7k0Gt
 RDxQjsN5zeUYPOYeJ32hFtZu/+hfKsMsb+BvMnzH6JmPuwVkqpAfN0FPCXVgr7naD0edb2p2Q
 k+0n1j1v6GHyuZkYxrCBTTlDxJYYLsukDlDEIoGb7XqlIBY6FzG3+UeR9ntO/xMNLfmVcRgsQ
 itFMpk7bMYhDtLr+NI7ueNyh/Ficmo9MbEXhlxqRfH5QyoCMmo=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
>
> * It prevents building a minimal VM image with all (non-virtualized)
>   platform support disabled, but all possible (VM-visible) errata
>   options enabled. I do that occassionally for testing/analysis, and I
>   can imagine this is useful for those building images that are only
>   intended to be used in VMs.

Most architectures over time grow a CPU selection option that is
at least somewhat orthogonal to the platform selection. I think so far
arm64 has intentionally resisted this based on the idea that the CPUs
are mostly equal and differences are better handled at runtime.

If we decide to revisit this in the future that might help both the
errata selection and give a way to e.g. build for an ARMv8.2
baseline.
This does seem pretty far out at the moment of course, given
that most SoCs we work on are still based on Cortex-A53 or A72 ;-)

> I think the change to SOCIONEXT_SYNQUACER_PREITS makes sense given
> that's a platform-level detail. Arguably that should be moved into
> drivers/irqchip/Kconfig.

Agreed

       Arnd

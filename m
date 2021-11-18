Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB10455F66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 16:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbhKRP2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 10:28:07 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:40495 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhKRP2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 10:28:06 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mi23L-1mAWqO1xuT-00e8Sy; Thu, 18 Nov 2021 16:25:05 +0100
Received: by mail-wm1-f47.google.com with SMTP id i12so5678723wmq.4;
        Thu, 18 Nov 2021 07:25:05 -0800 (PST)
X-Gm-Message-State: AOAM53356mLbbBGrg5CGTEW6/JtNW3ZzuZHktYM46l8J2sf4ICSOvhNj
        vWFNpqX024aMJCheGm26NduAWE22L3JnK2ko2js=
X-Google-Smtp-Source: ABdhPJzCDc7U/om5VTrFzVpeYf+uqPA8EYXDoIatLLdGVXoJx5jqS+K6FZ7sUawNFCuFbFVHiLDr/9z+YsGN7/9johY=
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr11167951wmn.98.1637249105074;
 Thu, 18 Nov 2021 07:25:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636973694.git.quic_saipraka@quicinc.com> <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
In-Reply-To: <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 18 Nov 2021 16:24:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Bp4LP7C1-XLKvjyxV-e1vrHb-=3zpm75CRgPYNbY2jA@mail.gmail.com>
Message-ID: <CAK8P3a2Bp4LP7C1-XLKvjyxV-e1vrHb-=3zpm75CRgPYNbY2jA@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm64/io: Add a header for mmio access instrumentation
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        quic_psodagud@quicinc.com, Marc Zyngier <maz@kernel.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lkA5frvhWsdtogVokqZiCDKtivzgxSKDMsRrmNlpUQgO+z2trOt
 RqHaEfD1bTQCbXIKT7IrKjyit7Vw3hz3/CPL58Bv2oRtWjW108NPHZaVd2vmxwFPgurp3Bi
 J7EYa5jZAW8YQBJMwP3IYVtzMShL6gbFXQTx9bANscQ4avTxNJPFA6F1s7YAYnsFcEeRWGJ
 ca0uphHEY5YqITojhzsVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M2QPeqVcQjw=:Ne2Kxlsv1gHEqOwQVVxVr7
 M03OPsbON1U4/FRjFlWL/3K5NnHcndaFrcoKo27ahBDHlH2/HDnakiBIMf5gTK6JDLdZ3mImE
 Nzo2jjuDPQr4NNOaRt3pLyTi+vjIarqJRg77F7RGDfisaeCA8RAN/ivGXfzNlLf8+3cFwr3Sx
 lHs7W5B0naCJkgH+QukFt4TnoqR2KUuW/lTbyPtbpra6fMsZmHwVenXgY+19r1GG530KFCash
 CcGmkTLk6U4KYwmGnTjk233foyFg8ifcJTrG2qncfzFSMnWle/auA3JWi0gTzGYzISd2oZecK
 3hWUx2zA0drOJ9tXAq6Gim37DbuZhCW7R5yPOxz4DmboIn3PfK8xPRULXyKl7qxlgVoYH56h9
 Sh7H30hUVaFkAuN8HBfFeD91RxOI2WuL7ZEtxNkzCyHG7ugFpHfbF8cxI6u1kR2GE9JrpSpjD
 9fMoIvUyr2fhV1QPMsHRkpf+EAuxsyQjrE7pcIIS2uLQ5PZ8wHv6VWVSB4WgQ6hqzdpbu5WQb
 3gufiSCWVbGuIBuJMV5tX4nvtFvDJDeXKPGsSkrudPhgr9SfxKh70YYd51VgvJ0TtjkzfyGWx
 V597EJxq7ps03+f4skXUC7dif5xrw+eeOVlDrsUHoTVbkKJeuusXK/Bq/WEi09VukqqpPG/PY
 H659msrRmxn04auAeObwQoyS0hvs7I9DSLYmvDQzFA6ug7ORxOexU53sdYPpx34GRnXyZ3JMo
 k9u4JdS4oPfG/6crd2EsweniuepjXVNXPIO3gWQpSA0LVdENgW2KbITxkq19k8WtA1ssWvKqm
 QbaaYVR/+EU/SRP6R5OFPt4O5Km0Z/R+hgi/sZT3npBSadyLIM=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 15, 2021 at 12:33 PM Sai Prakash Ranjan
<quic_saipraka@quicinc.com> wrote:
>  /*
>   * Generic IO read/write.  These perform native-endian accesses.
>   */
> -#define __raw_writeb __raw_writeb
> -static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
> +static inline void arch_raw_writeb(u8 val, volatile void __iomem *addr)
>  {
>         asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
>  }

Woundn't removing the #define here will break the logic in
include/asm-generic/io.h,
making it fall back to the pointer-dereference version for the actual access?

> +#if IS_ENABLED(CONFIG_TRACE_MMIO_ACCESS) && !(defined(__DISABLE_TRACE_MMIO__))
> +DECLARE_TRACEPOINT(rwmmio_write);
> +DECLARE_TRACEPOINT(rwmmio_read);
> +
> +void log_write_mmio(const char *width, volatile void __iomem *addr);
> +void log_read_mmio(const char *width, const volatile void __iomem *addr);
> +
> +#define __raw_write(v, a, _l)  ({                              \
> +       volatile void __iomem *_a = (a);                        \
> +       if (tracepoint_enabled(rwmmio_write))                   \
> +               log_write_mmio(__stringify(write##_l), _a);     \
> +       arch_raw_write##_l((v), _a);                            \
> +       })

This feels like it's getting too big to be inlined. Have you considered
integrating this with the lib/logic_iomem.c infrastructure instead?

That already provides a way to override MMIO areas, and it lets you do
the logging from a single place rather than having it duplicated in every
single caller. It also provides a way of filtering it based on the ioremap()
call.

        Arnd

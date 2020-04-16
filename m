Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0203C1AC20D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 15:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894703AbgDPNHX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 09:07:23 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:34857 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894692AbgDPNHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 09:07:19 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MXpM2-1jjuWG0tyO-00Y6IA; Thu, 16 Apr 2020 15:07:16 +0200
Received: by mail-qk1-f172.google.com with SMTP id l25so21143204qkk.3;
        Thu, 16 Apr 2020 06:07:15 -0700 (PDT)
X-Gm-Message-State: AGi0PuaCuoECuJVy9gUNj8qegAWs4qh2KMh97Ge+nPrtZK7Uaz6HRTR5
        0en66QtYnvkti9lLEDsYwTh0CX1CYrnBDQTerXs=
X-Google-Smtp-Source: APiQypIhmxZomDyPI8hn1HA79vovNwkrPUqhu3fHt73HrirP0DJ/PgzDEYqgh4E4jJVMGFCKn/J8UzK64DqY6qWvfL4=
X-Received: by 2002:a37:63d0:: with SMTP id x199mr15671947qkb.3.1587042435017;
 Thu, 16 Apr 2020 06:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200416115658.20406-1-geert+renesas@glider.be> <20200416115658.20406-2-geert+renesas@glider.be>
In-Reply-To: <20200416115658.20406-2-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 16 Apr 2020 15:06:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14Vk1JKRYZkkAhC9fAV4CMQzvux_FWdNkn39OwsYn4mA@mail.gmail.com>
Message-ID: <CAK8P3a14Vk1JKRYZkkAhC9fAV4CMQzvux_FWdNkn39OwsYn4mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: Sort vendor-specific errata
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Robert Richter <rrichter@marvell.com>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cKIPdBDmganPCmYpbOwn6REz2pxkK+ju8nIo6xpIixo05eSCdjv
 NZmwsXQag4IUtUt1K0P1FfNCr2zQOpHdWaYF+8YEXebzINhM/smLRiw66PgOmrazZ9t1XBo
 r7Lw5VwMooGahJI5YU6auDNnq7qe1GOdc7Rs7O1RqDuASopEUkETC006ELx/Y45EXJOsFKh
 QeDTa92bQ2lZ+LNR6Wk1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7KxYyPtqaCE=:AUmirVDEPpP6TKAiQBEiIU
 k2+gXvw/Gmmmvir8ZAzHXNkYJduUsW73x+H8Nr/TxC4xItfpJCIvmKSP2gYOasQioVBkHhonZ
 mSkIpv7pFSC+fIvo64LzBLfGo+vemfWw/iLF9YsVoqgIHqtCojwES0Mc02+lh/USSKeY8kDgu
 Ymg3WZkggQxJXFHk2pa7z5oV0eHIi46ob/yebby49YsXnBd9EkWFFcf4DuvmHT/UE3CdGosHf
 eABPBmrsWREmyE5uq+i5Odqor7yIJT9kE5yncHfwwQ8u4sNSsVxJw8b+CSUydyl2ToCrg1/Uv
 QwZDloGy0yNyMEr7KL55MQCNFFrzE+B9IDcSTU8B0IjIWOsBXd/T+CTemHu2bfdeg4MhTw22J
 PrGoKIWD2JrHnryF3gmhu9/XDZsW9wOncLMCGVBErMXveL+iI6Pemy+gSvmQO+Yk4Ket/EDZH
 AsNoeounvYI2cCgrTv+lOk7bqiKqEr9cq9lzts8qPdYpbMjz+vGDmLMRjHA/vP2bCAiF7yB+9
 5OysB6ywHbIHHMrnWHmeGDi7LLk/Ml+a0ogY+3HKSgPLRnHryqYlfMraxbCX5zVY5cM4xFn+1
 bAzvdH/c/ErmjmJn4rgMTkkDoUZNvh9M2N/IiE9Xqh1etCLwwRMye6hmoms4+jwqselLqrY6t
 wzSC0T/uXrb7SFgFzSBhfik1WnyFFSN8v9PHkss2qedvV6XSqqPtTzSoOA0UmE5AekZ7Y0UQX
 HM+J/Ro7bMruBoCYrS1A1o4J/TKp9JRHCOf+/vNa33Bu8W1QA7UbMjBc3Ld3MNpf7Cz6kCgIV
 c6NqEK5RSZzs92x1H+lYQ4IVbGCtZxl+2lzd1+fejWcVgYwMEE=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 16, 2020 at 1:57 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Sort configuration options for vendor-specific errata by vendor, to
> increase uniformity.
> Move ARM64_WORKAROUND_REPEAT_TLBI up, as it is also selected by
> ARM64_ERRATUM_1286807.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks fine to me, though I wonder if we should move the errata
menu to a separate Kconfig file, given that it's already longer than the
Kconfig.platforms and Kconfig.debug files at 500 lines.

Maybe a Kconfig.cpu with both the "ARMv8.x architectural features" and
errata menus?

Either way,

Acked-by: Arnd Bergmann <arnd@arndb.de

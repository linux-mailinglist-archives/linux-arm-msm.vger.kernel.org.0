Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE32243C581
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 10:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239613AbhJ0Iw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 04:52:28 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:43025 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239598AbhJ0Iw1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 04:52:27 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8EdM-1mkHEn02am-014Aqh; Wed, 27 Oct 2021 10:50:01 +0200
Received: by mail-wr1-f54.google.com with SMTP id d3so2769158wrh.8;
        Wed, 27 Oct 2021 01:50:00 -0700 (PDT)
X-Gm-Message-State: AOAM531QdkrkptBmL4a8v4YR7lBE2jfuzL06RIDg48xhApAYgiQpEU7C
        fpllDg4XXgHE5K5svuTl0TY4HLAW74txhcjOJEs=
X-Google-Smtp-Source: ABdhPJzulGMx2l8bar1I6qe5RSM/d5wpOaG0F+fU8zqeLRJg7K2lynybU0xg8HdVMMVSnCWSe2GfQO1flqIYXN352eE=
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr26057935wrb.336.1635324600576;
 Wed, 27 Oct 2021 01:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211027072427.2730827-1-arnd@kernel.org>
In-Reply-To: <20211027072427.2730827-1-arnd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 27 Oct 2021 10:49:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1CjfRmJsc0p2P2ja1DB6QFsuwnkBdXk1CfdzGjGpK-3A@mail.gmail.com>
Message-ID: <CAK8P3a1CjfRmJsc0p2P2ja1DB6QFsuwnkBdXk1CfdzGjGpK-3A@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: fix non-SMP build
To:     SoC Team <soc@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fEB5JwCg9vpw7hi98kLJDbVZrQBzCf6yHr9+RwrbiguzpI2AGSp
 1xbKqgevc+xxZ9kiFXv1dAbzzCu6zFfrrepTW48zPVd2Jtz7najqeEmUVmjQc4htphUohev
 St/FThT2gyX9tFT6x6PpjfAXmJOZ39/aSYqEGAqt0xYfZGOPjmIX9TJdhTGJ3cZeOFxYV7V
 bpBHChcIJPdJdO/3jHpeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:573zewDPWK4=:O1MKOcBLcpipS/3M6AAze+
 zcun/VtbiqoE9HjGrdhXSoSKQGyX8hQSZPRZ0VOB7EFXN9uq1ZxkhPLigpGC8nYpzwERNgtAt
 tOjVHzewC1wB1rNf9pd307Mhn8goc+f0lh/j32m016Mny+wj6nJi2DuZeE+o92iBlUCFUZ1gK
 NWngcxEdjzJegPbkUwdikFLbYGeeTUHy8b/ULMxAVqty42CXUMDPXJdD5sfI4AoqTrFEzZim6
 wBFX0k464F9BcxlHwJLYGUugPFVeRiYO4Y4zFfQlfpjopyr4Uc2AHy6jJOon1o+dRh+117I6o
 v37XnpqFPweOT87Z4vXGay1ysfH8j1N7B5/Y44O1vmrGjHybIF6U0KzlYsQPNdoApRmm9H9YS
 Vwu79Tqwh82ob5r6QnPcRJmg1LCXwfrMnm4mAXlC9BLLuVsMEDzV4xGjGmiY41rplTEg/io+H
 UqsfYKV4Z4S6cUZj51nww6L/BEomHsNjLZM0bybQVJ/BsyahDEOD+EV1YJ+7e9TUksUjQdjKc
 lyX68bl1kX3vXoF2LgMbwpf7sxxmXQiJP0CZiSYge0NLkK2N5kBZgbqe9CN46WeHDFNYoFbX2
 2So8XWLivaunG/A15RJ4EO03LFEU3iOIDdzdUgIxyqdAaOHLzqkyNxpPbIo7lVdSzhcptgHa9
 9ta4vF0rHy/CYipBc+MPwQ9+XK/+VrQBmh7QlbkMxDenj60lCjTrmUb88Jxr2nikk2gM=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 27, 2021 at 9:24 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A check was added for non-arm platforms, but the same code
> is still broken on Arm non-SMP:
>
> ERROR: modpost: "__cpu_logical_map" [drivers/firmware/qcom-scm.ko] undefined!
>
> Fixes: c50031f03dfe ("firmware: qcom: scm: Don't break compile test on non-ARM platforms")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nevermind, this is not sufficient, as the symbol is not actually
exported, so this still
fails on SMP configurations, both 32 and 64 bit.

Any ideas for a better fix, or should I revert 55845f46df03
("firmware: qcom: scm:
Add support for MC boot address API") for the merge window?

       Arnd

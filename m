Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76681B256C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 13:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDUL6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 07:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728734AbgDUL6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 07:58:20 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10A3C061A10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 04:58:19 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a8so5017990edv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 04:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dOVEz3qW4OcKoJICbddYMdUpEUqeY5iehaXBl8VPK5Y=;
        b=ZXZ6YJlRRbIaK62URKbeIkLlq5Nv/kgiwrAa0cphiQx/x4maaaCMLwvPvQ21Trptsj
         bI71ZWGPJxbppFYzeZ0vyon9pa9QIRs5HrkntlVXywG3vgO5u7rCJ1jkHdtp5NlbrZ5f
         ELmyC0w3m8iUbKp8ehVuJaCHSzg9jgpWFWtZ5iaIOC2zAH7dVMbqJBcP6Ww30mHC59gt
         kt0tLGT2N2DvcGT2Gbatov3Ppg7GjWrX9KAuHZU5SluZcCi1kX/SkseVIdKwc471ug1i
         j1yJ3/wr58dI+DLfHysHHQH/pLpo/sa8Mn8eL21HGcr5tkPiyiedlktxZmnT9tkO7HRL
         quVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dOVEz3qW4OcKoJICbddYMdUpEUqeY5iehaXBl8VPK5Y=;
        b=r4xfVo8i53YSfx3KTRmOzFjJa4E6gPxWZm+xWgi9E7ZaaJTPcjC3FsDswDJ+7CDHOU
         +1O/Dqg74Qfu8Q0WBQu0zqR0/l0LuZNQGDAKe8KVnGELwQhtNnk+I3AdQdszJyr8jM0r
         Xo3a6HMVWDrw3pmZLYHs7igGLNLKg/8S1VzqAa4cYrdzxzm05zDPfvCgZIiHBRjlaFFk
         hOLzutnwfvFaSnCthVUlXzpoucN/zyBJ5fa4MzXN7Yn5wQYa/+GyTtXauO/OXF1ABjDc
         UupzIVnxAaLxyCuujP8NcH2ULqDbkrbQMztYpUzjH4gTBHwwkILRnLu3iSMQm+41HZZi
         /5iA==
X-Gm-Message-State: AGi0PubxkFWr6dr8m9MKc1dzhrIrYoc21ftP8YY+TmYKNxGnmyVXAGoK
        mGRJ/KZh4/sfo61hE3usHcFTgKuz+jksmvDwlA82xg==
X-Google-Smtp-Source: APiQypJ13fmDqL64hYhSd3gjzu0VPt2K9WNXGavPyYtGtqO1F4hdiqcAWCcpg3tMsAxegc100WaBkaY43X3tIrEuoBw=
X-Received: by 2002:a05:6402:b2a:: with SMTP id bo10mr9882340edb.366.1587470298400;
 Tue, 21 Apr 2020 04:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 21 Apr 2020 14:02:07 +0200
Message-ID: <CAMZdPi91at7Mpfe3FYM7jFokYjhkvf6TtXHfoTWCGEhoGyzVaw@mail.gmail.com>
Subject: Re: [PATCH 0/4] msm8996 CPU scaling support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

Any feedback on this series?

Regards,
Loic

On Thu, 26 Mar 2020 at 12:56, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> This series is a new tentative for adding MSM8996 CPU scaling support
> based on the previous Ilia's series, with some of the latest comments
> addressed.
>
> This series has been tested with dragonboard-820c and cpufreq-bench.
> The CPU opps are limited to maximum nominal frequencies (no turbo).
>
> Ilia Lin (2):
>   soc: qcom: Separate kryo l2 accessors from PMU driver
>   dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
>
> Loic Poulain (2):
>   clk: qcom: Add CPU clock driver for msm8996
>   arch: arm64: dts: msm8996: Add opp and thermal
>
>  .../devicetree/bindings/clock/qcom,kryocc.txt      |  17 +
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 338 ++++++++++++-
>  drivers/clk/qcom/Kconfig                           |  10 +
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/clk-alpha-pll.h                   |   6 +
>  drivers/clk/qcom/clk-cpu-8996.c                    | 547 +++++++++++++++++++++
>  drivers/perf/Kconfig                               |   1 +
>  drivers/perf/qcom_l2_pmu.c                         |  90 +---
>  drivers/soc/qcom/Kconfig                           |   3 +
>  drivers/soc/qcom/Makefile                          |   1 +
>  drivers/soc/qcom/kryo-l2-accessors.c               |  56 +++
>  include/soc/qcom/kryo-l2-accessors.h               |  12 +
>  12 files changed, 1001 insertions(+), 81 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt
>  create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
>  create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
>  create mode 100644 include/soc/qcom/kryo-l2-accessors.h
>
> --
> 2.7.4
>

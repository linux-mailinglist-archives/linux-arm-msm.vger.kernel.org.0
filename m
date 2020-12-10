Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EE92D694D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 22:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393911AbgLJVBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 16:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393905AbgLJVBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:01:39 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D01FC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:00:59 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id s85so3636649vsc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/bUg/JHgfzBzpuFBFOn8p3e0OM+x6zr/46sNTxuiKI=;
        b=bvh9TVKb7dO78rxDVVuaqv4jvt6YbRrCsLI6YhE3beS6kgnVQxClaky727e0EQLZcP
         BRtTO3Q9HpmONFKGjV+xwA13TXxUmi7l5G+pe7ToURLK/UJC1EGP70QxBL193EgBOOz3
         5u+w5OH7l7vFEydRPQb806fDDuCpMetU3Toj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/bUg/JHgfzBzpuFBFOn8p3e0OM+x6zr/46sNTxuiKI=;
        b=tUbw5qzHNoWuVRYiCWj3BNc10H04KUxDUMZKip5RgFtOGDGbZzhyj1OeN/mLbk7GNi
         nZru77SlJpE5xoT9kppP/LMC0SYWBmdmNarls2biHdtKnkwBwUKr9OpY5gqTP+w3d71g
         iRyxph/j/lxz8Dn5owWdrZ/b9QKV/xyhN1ZZsm0Kj4YOGlBbCC/OffA/fSyIVHpmyWqh
         +hgNwNSzNjoDuukdzUoS9/cdPAozuojT8L/Y+EGil8Ucgq8038PXFqxTMGVSfB0RS+k2
         5WFYX0g5Y5AOT2JQzVCgASfQjxsDzl1Hj2jjF5LcG24wyn7Lbn/R3cE46Rh1ExraANve
         vExQ==
X-Gm-Message-State: AOAM532FdSFNA2S/KqkpfHFvywsH0beIk092fcpE9jH5sR1M8mnUkukG
        WivYBs9mi9Cc0YGpthHYinmkoPqmkH1AKw==
X-Google-Smtp-Source: ABdhPJxptZvtndxYDCjkYe43Zm6uUMRxZsWQuc2TGQm+rbDjueRZLWX28HTa8YfHuun+OBVqL/NPoA==
X-Received: by 2002:a67:e155:: with SMTP id o21mr10967373vsl.47.1607634058377;
        Thu, 10 Dec 2020 13:00:58 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id w15sm663350uam.6.2020.12.10.13.00.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 13:00:57 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id u7so3629384vsg.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 13:00:57 -0800 (PST)
X-Received: by 2002:a67:4242:: with SMTP id p63mr10208380vsa.34.1607634057236;
 Thu, 10 Dec 2020 13:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
 <160763203722.1580929.17813582697140984791@swboyd.mtv.corp.google.com>
In-Reply-To: <160763203722.1580929.17813582697140984791@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 13:00:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vbi9-df=4uOiQcvz_QB76nnEtQ0O9=Cx99MTsOoqbRoA@mail.gmail.com>
Message-ID: <CAD=FV=Vbi9-df=4uOiQcvz_QB76nnEtQ0O9=Cx99MTsOoqbRoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sc7180: Use floor ops for sdcc clks
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 12:27 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-12-10 10:22:38)
> > I would repeat the same commit message that was in commit 5e4b7e82d497
> > ("clk: qcom: gcc-sdm845: Use floor ops for sdcc clks") but it seems
> > silly to do so when you could just go read that commit.
> >
> > NOTE: this is actually extra terrible because we're missing the 50 MHz
> > rate in the table (see the next patch AKA ("clk: qcom: gcc-sc7180: Add
> > 50 MHz clock rate for SDC2")).  That means then when you run an older
> > SD card it'll try to clock it at 100 MHz when it's only specced to run
> > at 50 MHz max.  As you can probably guess that doesn't work super
> > well.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
> > ---
> > Taniya: can you please update whatever process is used to generate
> > these clock files to use floor for SD card clocks.  I hope you can
> > also scour through these files looking for similar problems on other
> > SoCs and submit patches for them.
>
> Any chance the consumer of this clk can call clk_round_rate() and WARN()
> if the rate is not anywhere near what it wants it to be? I fear that
> this problem will just keep coming up otherwise.

Good idea.  Posted ("[PATCH] mmc: sdhci-msm: Warn about overclocking
SD/MMC") [1].

I just checked for the clock being higher, not lower and I did a
normal print rather than a WARN splat.

Interestingly this shows that we were also overclocking the eMMC
during probe (though we end up at a proper rate in the end).  I saw
these transitory errors during boot:

[    6.287870] mmc0: Card appears overclocked; req 52000000 Hz, actual
100000000 Hz
[    6.295811] mmc0: Card appears overclocked; req 52000000 Hz, actual
100000000 Hz
[    6.312573] mmc0: Card appears overclocked; req 104000000 Hz,
actual 192000000 Hz

[1] https://lore.kernel.org/r/20201210125709.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid

-Doug

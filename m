Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC242CEA49
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 09:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgLDIxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 03:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729342AbgLDIxp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 03:53:45 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5386AC061A53
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 00:53:05 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id z21so6603793lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 00:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OvnhVAvJ+aVTGs3i380olP2vILDpA1stTISjjteIyyo=;
        b=kHXlscX2tTXD1z5Yaey7v8lWrMbkzDRF0BdDvZi4O0qBqBXhAZBG0lXBM9zWaP0/dZ
         1hFDdJ07vxlyRg4S/rtMjfsFZvjygoy+PEwX4/8snWeMhDs2AbgBZ+0q6hc7e+93SUiA
         U74hpS93K7ZZhJoA5dXo/roez9nkDFmOHRq+eBYg6lnGXbAtAFrUnF6AnnitgoQVYgMv
         YVx/jriftYzolvI41VMMclIT8HhXQBcmmCnTFYIakSVlbiIBKfjTBNmsBI7Umy9yqxZ2
         6r2vVeE29nTQgcxiB1HGf7diQpk6QSQASqOcoX3evpdcTeSaPi/YwW8nZPfsfdRLvZHc
         k+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OvnhVAvJ+aVTGs3i380olP2vILDpA1stTISjjteIyyo=;
        b=V89mszyWJ+J4uqu36M48azb4KVWb/Zxh6e8i1zyMqcAg/goZAFNRDO31Sl32Gk/jsC
         qw0i72jCdz99jbgpYL8v7Hnm3j6CCljJ0xDTjD1ixiz80ujyPKMnZlkHaWoTtj/GZiOl
         4WUJR6XncSmbaiSf+PyGVam/eXTxM3SFUilYVuQ59o9y0wJWnYlPNxr5M45Z8nF8zcTn
         CRz5pzefn/f0Cv0quMWe6Sdd6K+JswGMEmRsTy5AXthylOvsfVKuU0WiwBWtbw+vwfry
         j04xjPGiDqX3BETzRxFZHJ+6/q/Zgwi9jmanFBlzHh6rcI6wr5gmZKid1CqECy6kh+cZ
         oaSg==
X-Gm-Message-State: AOAM531AOABHq4Q64JNwfpqTqJCbZVUw/n+EPefGXQapuqGKshd4Qiar
        sncG82LoHbjuL5eT3oDce+29DYPPSZXI8z5ltQ/zhA==
X-Google-Smtp-Source: ABdhPJwuilOTB0n9qQh2b7zD4iD8K4vY/jP5i3QcM9ws3a1L8Gv28Ri/VitZSRGz8yfhbh6HJpnyAk7clI8dOhuPLPk=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr2780465lfh.260.1607071983809;
 Fri, 04 Dec 2020 00:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20201124094636.v2.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <CAD=FV=W2i7dfcg2J2a-EO8nBvwHU0AMp79Esoy1Y=H_hNc+jvw@mail.gmail.com>
In-Reply-To: <CAD=FV=W2i7dfcg2J2a-EO8nBvwHU0AMp79Esoy1Y=H_hNc+jvw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 09:52:53 +0100
Message-ID: <CACRpkdb_v0f-D6arQbUL_F2z7ZkQ5SUn+AOKSzyWVaBpC-9Q=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Doug Anderson <dianders@chromium.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Archana Sathyakumar <asathyak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 30, 2020 at 10:32 PM Doug Anderson <dianders@chromium.org> wrote:

> NOTE: even though this has Maulik's tags, he has requested [1] that we
> should wait before landing while he talks with HW folks.

OK I'm holding this series back until you have confirmation.
When you know you want it applied, poke me (or send a new
iteration).

Yours,
Linus Walleij

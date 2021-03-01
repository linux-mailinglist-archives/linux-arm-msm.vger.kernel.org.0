Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5233532A0EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbhCBEkt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344187AbhCAWvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 17:51:01 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7407C06178A
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 14:43:04 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id z128so18369033qkc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xA2EiPMtYi+Gfmg1Yc47LmxZNfLbHszPXKAA6vPAIh8=;
        b=jYofzajioBOR03n4mCqbrDpH6/uBSr/aENM4iC5Q2rRptMDrqaVIPX0nIF14iyLROZ
         0RJhJQi0W1CELV1slYYaWGBnwqyUQmUjzRgurOCryijZ4pLbPkuTw2H4JAGuFs9fL/kW
         iirv9/cgEYCYikSJ/JtOiSHuDX0WkB5obllmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xA2EiPMtYi+Gfmg1Yc47LmxZNfLbHszPXKAA6vPAIh8=;
        b=EweFj5QL4ZKNeUssRRi7ZM5d9CEYtTiVO/jz4DltFJCevk3edymsFzAqAkKyS5sLaF
         Lhfo4NA4f8Jp92XJeKlDPxl+LWg6T+eTPIv+v7aAqbbqv4UL63EkpEVczm0tuAGvIl2j
         pwjX9NSs0OC7RGLjFbZ1WOf5BzyGbW/GsvHPgfuKxBnXuU7aAdeW5/u7azNKCIZ4CB0o
         fUzZyXGLbWGFDBNcNcq57yPP3idtTinMEb8nadEEp8dIg50vloiA2xeeJ2OQcQL7xUVm
         3gF8h0X/nC/ifVrZqSdtScTduFDeFZOztRAc0OwABs+yJJAD7yukHq3HLSE3zU/MmZh/
         ewBQ==
X-Gm-Message-State: AOAM530x4HmBpps4OzrEKn9A5AnJhhepgiXCOqIuQvyuBQmlHSAF+VPt
        tFIjNbambRHvMQ9IxlF/SrV1Q6Q9M+zSKQ==
X-Google-Smtp-Source: ABdhPJxhus1tPxu58y6pd0/LlD8QZlvsVpXtirCoqXixBEalrHwshe/c0Ks36LVt251tAIajfLucJA==
X-Received: by 2002:a37:8544:: with SMTP id h65mr16821013qkd.200.1614638583426;
        Mon, 01 Mar 2021 14:43:03 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id f27sm7558463qkh.118.2021.03.01.14.43.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 14:43:02 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id l8so18623646ybe.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 14:43:02 -0800 (PST)
X-Received: by 2002:a25:4e83:: with SMTP id c125mr24079401ybb.343.1614638581776;
 Mon, 01 Mar 2021 14:43:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org> <def1a6b37cbb54cb15329765266ed90c2f7aa24e.1614624041.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <def1a6b37cbb54cb15329765266ed90c2f7aa24e.1614624041.git.saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Mar 2021 14:42:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UzhLX4bdRV5gEXZgsbnQW9ViZxC9Vs2TXeSxXu72Dagg@mail.gmail.com>
Message-ID: <CAD=FV=UzhLX4bdRV5gEXZgsbnQW9ViZxC9Vs2TXeSxXu72Dagg@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] perf/core: Add support to exclude kernel mode PMU tracing
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Leo Yan <leo.yan@linaro.org>, Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        Mattias Nissler <mnissler@chromium.org>,
        Al Grant <al.grant@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 1, 2021 at 11:05 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hardware assisted tracing families such as ARM Coresight, Intel PT
> provides rich tracing capabilities including instruction level
> tracing and accurate timestamps which are very useful for profiling
> and also pose a significant security risk. One such example of
> security risk is when kernel mode tracing is not excluded and these
> hardware assisted tracing can be used to analyze cryptographic code
> execution. In this case, even the root user must not be able to infer
> anything.
>
> To explain it more clearly in the words of a security team member
> (credits: Mattias Nissler),
>
> "Consider a system where disk contents are encrypted and the encryption
> key is set up by the user when mounting the file system. From that point
> on the encryption key resides in the kernel. It seems reasonable to
> expect that the disk encryption key be protected from exfiltration even
> if the system later suffers a root compromise (or even against insiders
> that have root access), at least as long as the attacker doesn't
> manage to compromise the kernel."
>
> Here the idea is to protect such important information from all users
> including root users since root privileges does not have to mean full
> control over the kernel [1] and root compromise does not have to be
> the end of the world.
>
> But "Peter said even the regular counters can be used for full branch
> trace, the information isn't as accurate as PT and friends and not easier
> but is good enough to infer plenty". This would mean that a global tunable
> config for all kernel mode pmu tracing is more appropriate than the one
> targeting the hardware assisted instruction tracing.
>
> Currently we can exclude kernel mode tracing via perf_event_paranoid
> sysctl but it has following limitations,
>
>  * No option to restrict kernel mode instruction tracing by the
>    root user.
>  * Not possible to restrict kernel mode instruction tracing when the
>    hardware assisted tracing IPs like ARM Coresight ETMs use an
>    additional interface via sysfs for tracing in addition to perf
>    interface.
>
> So introduce a new config CONFIG_EXCLUDE_KERNEL_PMU_TRACE to exclude
> kernel mode pmu tracing which will be generic and applicable to all
> hardware tracing families and which can also be used with other
> interfaces like sysfs in case of ETMs.
>
> [1] https://lwn.net/Articles/796866/
>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Suggested-by: Al Grant <al.grant@arm.com>
> Tested-by: Denis Nikitin <denik@chromium.org>
> Link: https://lore.kernel.org/lkml/20201015124522.1876-1-saiprakash.ranjan@codeaurora.org/
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  init/Kconfig         | 11 +++++++++++
>  kernel/events/core.c |  3 +++
>  2 files changed, 14 insertions(+)

I'm not really knowledgeable at all about the perf subsystem so my
review doesn't hold a lot of weight.  However, Sai's patch seems sane
to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

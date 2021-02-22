Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB4B3220C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 21:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbhBVUVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 15:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbhBVUVs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 15:21:48 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30C8C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 12:21:07 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id x124so2875634qkc.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 12:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=na2/RnRgnH/8w2EWhU1MCTH0hcdu6Lj44empnumnDy4=;
        b=Y5bCllchHHbP8XBCtGC46iSxTXUj3JkmfFo1TORkiyAIROLZ7UB51MkUUfXoyqLfc5
         dQ4ChFamfDNB9SUiwQi4k3N/CEIPf5ryloDp6GwHQ2kwl/iy7hdcZeEZNHCQ5fibbKKf
         Iy58IGl2dVvuYfrd1ISKuhPSzulYZDYDJtCIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=na2/RnRgnH/8w2EWhU1MCTH0hcdu6Lj44empnumnDy4=;
        b=narDdNBYij6IfxV4buJ7hbVJNJl7FYfpY99NpLGtvdimJ7f0omVBTcUIuZWFlahfL1
         mkKXpowqg+r7QeXZdUW33Dd6B0NzETwMK+ts6bxZQdeE4p5cdnLoFRCUyVZWdFE6godY
         II9JdaXTTCrknBOK2kurv8iVN4qEk43xAHlQMhFe4jqKyoY5iCikqGtd3Jq3LUixZf2D
         b3zjYly6vqFHDzoZILdMsdSgg/FrOUBYk6muX7RCajnAz5EhRG8CTJyKxsEfbW2sB86J
         Xq7fUU4Dj/Gi3c77inYzHW5iroKej6xFZpo/k3VI2faXxR7cUuYIkMyKnnmOuNTiPOJ/
         lfbQ==
X-Gm-Message-State: AOAM530t2B7etXbg37MdPLO2/Pmx1vO3DExUn3TlI2vPPk+B30j408t2
        AmJiaKjhnm3SrIAO4i60rBp4Uno04KecNA==
X-Google-Smtp-Source: ABdhPJyfpJhu9AnKo/PPTuN6JXziG0OGFMaHhbdO09vPpqJ3g70oCr4/5aEiM8HBA+c3sD3C0MU6sw==
X-Received: by 2002:a05:620a:152f:: with SMTP id n15mr23280542qkk.268.1614025266906;
        Mon, 22 Feb 2021 12:21:06 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id n67sm13103117qkb.35.2021.02.22.12.21.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 12:21:06 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id x19so14231370ybe.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 12:21:06 -0800 (PST)
X-Received: by 2002:a25:aa43:: with SMTP id s61mr37800696ybi.32.1614024875145;
 Mon, 22 Feb 2021 12:14:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org> <5d063d6035ff079b10e34cee110a26b856957ebe.1611909025.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <5d063d6035ff079b10e34cee110a26b856957ebe.1611909025.git.saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Feb 2021 12:14:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WUxPrFYGWbTAUYMC1nuPSHT3fk=fcE-fGVveHpr1KPhQ@mail.gmail.com>
Message-ID: <CAD=FV=WUxPrFYGWbTAUYMC1nuPSHT3fk=fcE-fGVveHpr1KPhQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] coresight: etm4x: Add support to exclude kernel mode tracing
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
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

On Fri, Jan 29, 2021 at 11:08 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> @@ -1202,6 +1207,13 @@ void etm4_config_trace_mode(struct etmv4_config *config)
>         /* excluding kernel AND user space doesn't make sense */
>         WARN_ON_ONCE(mode == (ETM_MODE_EXCL_KERN | ETM_MODE_EXCL_USER));
>
> +       if (!(mode & ETM_MODE_EXCL_KERN) && IS_ENABLED(CONFIG_EXCLUDE_KERNEL_HW_ITRACE)) {
> +               dev_err(&drvdata->csdev->dev,
> +                       "Kernel mode tracing is not allowed, check your kernel config\n");
> +               config->mode |= ETM_MODE_EXCL_KERN;
> +               return;

So I'm not an expert on this code, but the above looks suspicious to
me.  Specifically you are still modifying "config->mode" even though
printing an "error" (dev_err, not dev_warn) and then skipping the rest
of this function.  Since you're skipping the rest of this function
you're not applying the access, right?  Naively I'd have expected one
of these:

1. Maybe the "dev_err" should be a "dev_warn" and then you shouldn't
"return".  In this case you're just implicitly adding
"ETM_MODE_EXCL_KERN" (and shouting) but then making things work.  Of
course, then what happens if the user already specified
"ETM_MODE_EXCL_USER" too?  As per the comment above that "doesn't make
sense".  ...so maybe the code wouldn't behave properly...

2. Maybe you should be modifying this function to return an error code.

3. Maybe you should just be updating the one caller of this function
to error check this right at the beginning of the function and then
fail the sysfs write if the user did the wrong thing.  Then in
etm4_config_trace_mode you could just have a WARN_ON_ONCE if the
kernel wasn't excluded...

-Doug

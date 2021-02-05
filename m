Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3CD311884
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 03:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhBFCj5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 21:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbhBFChu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 21:37:50 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA740C08ED3D
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 15:21:06 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id d85so8688343qkg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 15:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SkxWmY1OEi5ew/OSKLvpq24apidSW6DwKqLmpKsAI24=;
        b=dhJm5DFgG5FfOYeun7i2ErLsVXGm89DNuESD4ai0pZA9JRMXOL49fcDBKB7extQ27X
         Tu9PDANUQC4qGLS7Z7bZB6dQ1IOZRIUKeugve68PY0ozncrU6jqeTYyZ7BqteTcuQOpW
         8nu7d+SvxvYW9YIgUXskMc9cXCKatE1mnSXJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SkxWmY1OEi5ew/OSKLvpq24apidSW6DwKqLmpKsAI24=;
        b=LuqTvr5jtWZ3gcnneW2LM8c7Ej29hTFpA7XfblZ9aH88xOKdT04gp02rtCL8FnEPGJ
         w94FVBJJKdKLa0CM1j0/4kMym+S23U5HC4imPk37bJqylMS35GyhbIYYvwh1rWYAVGhm
         lu9qTKIMvo6E8NMkQ9iNiCKe5pbJFNyMn2gF4cOe5EQe13I+/Tma3imcwgGGkmJbkf2o
         Gssv4MvKSB1h7jrmnDqy+/W9ojMVAfUhfBCw5mpq3JgyEpWnWI5o9gt239V56gO4JTVF
         hZNR1ujC1VdH65BOEG3/PdQS2hxqMQrj21/iheUmlcyIg7iSLQJ9D0o1J17Tz0/wcN7p
         zGwA==
X-Gm-Message-State: AOAM531IYr96Pfp6Nm4+b8JG4HierqsHzda/AKIw5+ACaefTY7bKOtTK
        LpAH9huF980lMIZsZ60OlcuDtm8hZS1WyQ==
X-Google-Smtp-Source: ABdhPJxZA65DiREULmetlhP3pggEYRWdz4ecW8nAwWDmDuR75vvfgMP2YTSjTqtEYOWHxRbn0qeX0w==
X-Received: by 2002:a37:64c2:: with SMTP id y185mr6921568qkb.55.1612567265887;
        Fri, 05 Feb 2021 15:21:05 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id w188sm10700953qkc.19.2021.02.05.15.21.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 15:21:05 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id w204so8408407ybg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 15:21:04 -0800 (PST)
X-Received: by 2002:a25:b048:: with SMTP id e8mr10485056ybj.0.1612567264272;
 Fri, 05 Feb 2021 15:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20210202194752.247301-1-swboyd@chromium.org>
In-Reply-To: <20210202194752.247301-1-swboyd@chromium.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 5 Feb 2021 15:20:53 -0800
X-Gmail-Original-Message-ID: <CAMfZQbyM-3mMchUgFZgiX48x7WG=BG=dZ6aBwAyu-K_y05=qkw@mail.gmail.com>
Message-ID: <CAMfZQbyM-3mMchUgFZgiX48x7WG=BG=dZ6aBwAyu-K_y05=qkw@mail.gmail.com>
Subject: Re: [PATCH -next] media: venus: Include io.h for memremap()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 2, 2021 at 11:51 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This file uses memremap() now, so we should include io.h instead of
> relying on any sort of implicit include elsewhere.
>
> Cc: Dikshita Agarwal <dikshita@codeaurora.org>
> Fixes: 0ca0ca980505 ("media: venus: core: add support to dump FW region")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 1471c7f9c89d..915b3ed8ed64 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/init.h>
>  #include <linux/interconnect.h>
> +#include <linux/io.h>
>  #include <linux/ioctl.h>
>  #include <linux/delay.h>
>  #include <linux/devcoredump.h>
>
> base-commit: 0ca0ca9805055bb0efc16890f9d6433c65bd07cc
> --
> https://chromeos.dev

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>

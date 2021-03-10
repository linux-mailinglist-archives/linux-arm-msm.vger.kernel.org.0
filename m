Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7513348E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 21:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCJU1i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 15:27:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhCJU1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 15:27:16 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319BFC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 12:27:16 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id l15so1475904qvl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 12:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NjeHyvZMbZGJ8OEzLSik+NBjkSDo6JPO/IsATXTAv4U=;
        b=HqjgsGqmuDSGg/MeVO8mxOU3yiE7d6qGOOsFAoMQmWI/ZpLuOC3B3KDsNgAVmp1HEP
         I9teL1AcZ1SkgrbgstvsGH9yxsotjqYeZjCbqYMZcbLKvBYghiYTHElgDN1hIsSLWdZX
         v5PPGjpkNnOgUjrXWbCYWccvWjR0lD1duMzNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NjeHyvZMbZGJ8OEzLSik+NBjkSDo6JPO/IsATXTAv4U=;
        b=FGnvHSUqCPngjRYSgOGsPW0C571KeYR91O2lEr7TNZbbPiW7qsF9h0tfP+8hM5eeuY
         ylTdP1bH+EJc4M3ByztBu6sa4/YgVvk1YdUOMwoi1+FdLbLftA0vYjGf5nhviU/O37G+
         7mw6cxlc9tklxOtGoQSDdKxhXrJpftfryP034XR5ZxQV4DPzp2lmz0nWdkU3eEhEu9iD
         lCyobAvm/xUVedWta0pwcLH3zo1o2j9pWSb9PgPN1rHumYPVKZvcU1PgYycuPBq/PM5P
         JtAI7HXs+U5tJW7Gu06SwzFuRVTyBDfRUq6jr2sQP9Uf96348MRQbOUtf6eeA+s36VdR
         d4+g==
X-Gm-Message-State: AOAM531j8n8S05G47WQ+eEShBL/O7rAkoAQv7IPVQozxDSpjw2ABftZK
        BwsM08k+v/qD2pdGk4Gxlc0xayLcLWqzBA==
X-Google-Smtp-Source: ABdhPJyqUkuEEUJXfkSQLuqZUfvbqeR0WKs2cXnRs67He0MKwJxr7/uoJLAxWUtG7+EVWOIVGz1nhw==
X-Received: by 2002:a0c:9cc2:: with SMTP id j2mr1153038qvf.2.1615408034865;
        Wed, 10 Mar 2021 12:27:14 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id m16sm313724qkm.100.2021.03.10.12.27.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 12:27:14 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id u3so19272280ybk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 12:27:13 -0800 (PST)
X-Received: by 2002:a25:9348:: with SMTP id g8mr4388320ybo.343.1615408033534;
 Wed, 10 Mar 2021 12:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20210310202004.1436-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 Mar 2021 12:27:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-nZu1VTJdLOiXmtC4HrnK85KK=KqYe-9szX2LiJoo-Q@mail.gmail.com>
Message-ID: <CAD=FV=X-nZu1VTJdLOiXmtC4HrnK85KK=KqYe-9szX2LiJoo-Q@mail.gmail.com>
Subject: Re: [PATCH] watchdog: qcom: Move suspend/resume to suspend_late/resume_early
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 10, 2021 at 12:20 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> During suspend/resume usecases and tests, it is common to see issues
> such as lockups either in suspend path or resume path because of the
> bugs in the corresponding device driver pm handling code. In such cases,
> it is important that watchdog is active to make sure that we either
> receive a watchdog pretimeout notification or a bite causing reset
> instead of a hang causing us to hard reset the machine.
>
> There are good reasons as to why we need this because:
>
> * We can have a watchdog pretimeout governor set to panic in which
>   case we can have a backtrace which would help identify the issue
>   with the particular driver and cause a normal reboot.
>
> * Even in case where there is no pretimeout support, a watchdog
>   bite is still useful because some firmware has debug support to dump
>   CPU core context on watchdog bite for post-mortem analysis.
>
> * One more usecase which comes to mind is of warm reboot. In case we
>   hard reset the target, a cold reboot could be induced resulting in
>   lose of ddr contents thereby losing all the debug info.
>
> Currently, the watchdog pm callback just invokes the usual suspend
> and resume callback which do not have any special ordering in the
> sense that a watchdog can be suspended before the buggy device driver
> suspend callback and watchdog resume can happen after the buggy device
> driver resume callback. This would mean that the watchdog will not be
> active when the buggy driver cause the lockups thereby hanging the
> system. So to make sure this doesn't happen, move the watchdog pm to
> use late/early system pm callbacks which will ensure that the watchdog
> is suspended late and resumed early so that it can catch such issues.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/watchdog/qcom-wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

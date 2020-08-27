Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADE5255001
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 22:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgH0U1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 16:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgH0U1k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 16:27:40 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2745CC061264
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 13:27:40 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id x17so2084013uao.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pZ//jLyEGc9rQ/5ywgZs9AFGiQ4M3Jn6N3wi0W6fLTk=;
        b=cW9R1YXaVzPIgb19g8eHR8EByOO083Db4fVQIjH2ZM5PSNpYKloAXezTr/CP2u/mQA
         fvI9or4iuYtkKnYTQoORu5kv3YBwvSNmt9ZZYuPrUupI2TegHbXdJTPo5YypvYmxp8hx
         rJiqqxwpyyyZkCI0eAxr5m+KSQX1SjZBLpCz35ERVmRV7XMyrHFdzaY/PyiEvIVAq5X9
         hHQWjx4uhvCQ09u5QjwypG+jFOEFmJfRes61/kzhSe4xTo/Jk9QDPScuRoskWUDeWlXC
         2rn4iNmGYiWNVazbSXBBgM/hv6Lc0RAc09bPUmSAdDsk4LD33n2Castf2l92TfPyELj5
         77Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pZ//jLyEGc9rQ/5ywgZs9AFGiQ4M3Jn6N3wi0W6fLTk=;
        b=USwKe//YV9DoFkzk7E08tLb7Mk/DaoFNaIPKTuxZpwEURuY/bfT7RYFendkbF4nyhQ
         yJ9VGHaa9C+PQ0DtBBp2TwDGnZqRwlrkeX1IO6tfiMW0t0sfkwos7Z1VMffs8vtK/oCb
         pj05c1AJS4ErN/9ZPp/dJrZDoJgY++RowSwI4lAroT6pzccEMI99rtxvLfP/RpdTdgs6
         49YS2OG4bQM0NrjVMDGw/ckRDposlDEcsecc80tzhT5Mf+GKvtwI57ZFgnHJUnS2n3DB
         EY27Gwk6tVYNV9c3DJIjdlCSaTYCaglJIG3hGjSZlzIGB6GlguMSvvkmMhY3wthGWDHM
         YRDQ==
X-Gm-Message-State: AOAM532LTrTLA5/VL4prgbknyO7lf2tfAsArP19Uy6m7NK0HXPAQ0Oqi
        PsHVjs6jg2adGbszdGLjvr/OPsy3j5R1JbSAzujVMw==
X-Google-Smtp-Source: ABdhPJxzBjdIjLP+fic8QVRqI7i2HXnTm0gMDDu/fk4wtDvJw2bF8nvr92kZ7hQ/2QAwAvkj2Lc4HmeA0C6LORz2ceA=
X-Received: by 2002:ab0:142e:: with SMTP id b43mr14014891uae.7.1598560057400;
 Thu, 27 Aug 2020 13:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200827083330.1.I669bb4dc3d92bd04e9a695f97904797dc8241b79@changeid>
In-Reply-To: <20200827083330.1.I669bb4dc3d92bd04e9a695f97904797dc8241b79@changeid>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 28 Aug 2020 01:57:25 +0530
Message-ID: <CA+G9fYtWpBQb8Ew_G=bjcR7wBHMgKm=EXV7vuk6FE9m0-4Ef3A@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: When dev_pm_opp_of_add_table() returns 0
 it's not an error
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, vbadigan@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 Aug 2020 at 21:03, Douglas Anderson <dianders@chromium.org> wrote:
>
> The commit d05a7238fe1c ("mmc: sdhci-msm: Unconditionally call
> dev_pm_opp_of_remove_table()") works fine in the case where there is
> no OPP table.  However, if there is an OPP table then
> dev_pm_opp_of_add_table() will return 0.  Since 0 != -ENODEV then the
> "if (ret != -ENODEV)" will evaluate to true and we'll fall into the
> error case.  Oops.
>
> Let's fix this.
>
> Fixes: d05a7238fe1c ("mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

I will test this patch and report again on this email thread.

> ---
>
>  drivers/mmc/host/sdhci-msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index b7e47107a31a..55101dba42bd 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2284,7 +2284,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>
>         /* OPP table is optional */
>         ret = dev_pm_opp_of_add_table(&pdev->dev);
> -       if (ret != -ENODEV) {
> +       if (ret && ret != -ENODEV) {
>                 dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
>                 goto opp_cleanup;
>         }
> --
> 2.28.0.297.g1956fa8f8d-goog
>

- Naresh

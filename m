Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62D7416722
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 23:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243241AbhIWVLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 17:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243208AbhIWVLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 17:11:45 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68C2C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:10:13 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b15so30567636lfe.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RzCYOEChqS52ihYCFoLsCYGGR6ap8pXnjkTEkEmy1IM=;
        b=DwUvUexVIQ2f+G5CJTygnALkzFfFQTEkUtuLnis44qdnGAWeGJ1siEXg4btlfrJY0L
         1fp9oe9j1lL//ULw/51YZrFxU+cEPivYFu25FzHbGjZxHVFI9IomFikZHjhXLn+YNww9
         tDgvefSWm5+2yZauq/3TM5oKOEcjntfUQ2wdk9cJi3+hqbSBICoo8SWpJskJw/prNYAA
         OU9Tz+6FsN0/uprjvV9uZaLTpccMMnVoWE0eyaUp/9hPz982ubh2U3UXTuDqwPjuzHq+
         A+mCQBddelyPSz7OhxZ5gcgWWYfhd85+nw8YeBLVgD9czkCk+60/4GWpi5Lw9225jOSp
         oPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RzCYOEChqS52ihYCFoLsCYGGR6ap8pXnjkTEkEmy1IM=;
        b=ErE+Mow3Ar5bzuKWLHAaIpteTP40kRo/W3pz2N6nO9r1lm8IYfm4P1vjRQ7eMUDlT2
         jjpI01OtKO8GZXIjQz5mf1MzU3q21QmQD7BRFvNYXP/ZvCBkWPduM5N6GkrJjZAzcYHR
         sKfMzL9h5HUB3ptfR3J6arBFRRwfl49lyCtA6KXtZZk3/OIbCH4nSm/tfs0uJkd/IC9U
         VC/3OQ2/mV91m+QY9BryYmhHBFFxC9rmhoNjVBotsZobrKlGRje/YK9VsrY0vBq90m6P
         YXQTbd21wi1aYoLVzBZvfe5obOm4mG8DmFrA0xrn4Fgb2qpBbpkCJC48XggUl6xIcbll
         o/8A==
X-Gm-Message-State: AOAM532HtK3dy5E9kby8YgKtY8tfi4BqLcuLU7IV1nK2WjimQjNQDOBK
        ROFGYGRcclHkiYxv+jOrHwmb/4u3dBa2dNwLExflxQ==
X-Google-Smtp-Source: ABdhPJyvWnA5YfxMUa0cPBb67wdrszJXaQYs8/Ln8r6azwb7B76KLd8cP1MpRLp2CqAdwCnLqyZlEYKeslxOgKWfpOM=
X-Received: by 2002:ac2:4651:: with SMTP id s17mr6100025lfo.584.1632431412003;
 Thu, 23 Sep 2021 14:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <1632389487-11283-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1632389487-11283-1-git-send-email-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:10:01 +0200
Message-ID: <CACRpkdYSqyk4yhguZ0yWr5NDAsDZx8gR1Wchr=TPHaDpWg=KtA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sc7280: Add PM suspend callbacks
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 23, 2021 at 11:31 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> Use PM suspend callbacks from msm core, without this the hog_sleep
> pins don't change state in suspend.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> v2: removed some stale diffstat

Patch applied for fixes!

Yours,
Linus Walleij

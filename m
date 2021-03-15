Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B761233C16D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 17:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCOQQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 12:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCOQPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 12:15:45 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D198C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:15:45 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 16so16942199ljc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=whezGPX07b3sUPoOpaXH07SshdzQOy4tuu1n0282U3Y=;
        b=IkUaPU2LsXGiZ9t3R2YxU0xvXyAIf4MJNET4D3qz0haaeS6DDR8//ZDuN23aw74Tod
         C6ks7QK1cXE8kzlhgAH6AJ+aYqgUmcMJUmWd4fUA51YFa9gRHB0zGLsY2uPT/A2zmHfv
         k6nZny1yCduUwtvvu3wpc599sGC7hxaA5Bb8uuU+Q/9PIreBdRhbV7g8kuw3Yf3ohovR
         4Zm4eOOu6EYB8dIX7nQDzUusdTqIjnHwV3eLYsoBuVbXQC/Dk48rHHrWQivhYhRZfNJa
         whFia53i3rwrQuP4WP9CdYpW17gmmkxX2TkancRpN1seQQa2X7wX29FoMCk7nqYJ5B/a
         PFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=whezGPX07b3sUPoOpaXH07SshdzQOy4tuu1n0282U3Y=;
        b=mc33aDZvYtRMhcN4nu/CqzPmjpbe2+N4+FevOEcW4Wb8rMpTPhb//aYCCxxMnpBFsk
         o1xQbmO41A2B16hwsY5l6czXsO0xRyDGceGtWcaU61ch4oBYDpEixFmaa6f+PONuL9kz
         JEXNWKfcVznCk63wOB4S8mlS7AAIF74xA1fhLupRY0ip0/OTRPGe7NkGZ4dx35c3fCLe
         2gYpOxMAaQ+9xvGYtuMFz1vG1yfvJDg7xrtoFnpLvfGgSUfc0ef5Hl8R4V91N1QM+5pp
         QTVeDU07hQ9m3t7qjwwaQZVTRgVy0Fajz9ehlQl22UqiT0RD4MX9KwueJ437VCHwWe3S
         sflg==
X-Gm-Message-State: AOAM533jmgpnur8EdvSMeOyp9Dn0mbpHXEydY56qk3j08ZrpRYZZ5/Ic
        bUHu7DZ4fgIWw9eM9xfmr+k30qzb1R348EK/6o8k5NUXTs+Ncu6R
X-Google-Smtp-Source: ABdhPJwlxhBzJkkcvbojy4usCRwaY3bkBsWbXm6KSAwvyMDTAsyGhJSQGbZPJqu/Ax4MeK78p7DDeRHVotyxH9Jwr3k=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr10965708ljj.438.1615824943587;
 Mon, 15 Mar 2021 09:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210312034218.3324410-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210312034218.3324410-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 Mar 2021 17:15:32 +0100
Message-ID: <CACRpkdZOFGVnOY6wQtncKW8zdxqr1nicB9rRef+QffiFTOCaRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: sm8350: add GPIO wakeup interrupt map
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 12, 2021 at 4:41 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> From: Lina Iyer <ilina@codeaurora.org>
>
> GPIOs that can be configured as wakeup sources, have their interrupt
> lines routed to PDC interrupt controller. Provide the interrupt map of
> the GPIO to its wakeup capable interrupt parent.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This patch 1/2 applied to the pin control tree.
Please take the DTS patch into the qcom SoC tree!

Yours,
Linus Walleij

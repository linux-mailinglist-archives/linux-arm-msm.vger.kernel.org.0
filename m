Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 791B2EF9F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 10:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbfKEJtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 04:49:20 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45953 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730693AbfKEJtU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 04:49:20 -0500
Received: by mail-lj1-f193.google.com with SMTP id n21so7414151ljg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2019 01:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TAJe5ziKrCKK7rX2BdKY2ykoCXQoTfLqEiQktMB0pZc=;
        b=XCvudKjB3WldlrlLUYWp/rPSkhOTlZs7uTgllg94l9Dj/pvnvq+ZHihNGllZ5Cnfq2
         3YEIZcIKR7ab5YkIh0hd3sd3vHojbv0gNSkvu/8KbJzhxt6ln836ALEKFfSCMzu/KCdj
         CIm/wm9HhbRTGIlU7t98t9inx4s3syMNih/JbId2T8lWPiVQPkJfvBb8fXfHrmq8wVvu
         puto/O0rx5kW+R1PhNelEX7ydVAXKvbm31QA1dx+VlQegxySg7VaY9I/nwJ+ThZ/HjYs
         ZRMKjym+sv62w8vchDShhPjQ+J07r0+nWHFQAxFnFqO1NGw6cI3NdDud7gfMsrAp0dfG
         HBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TAJe5ziKrCKK7rX2BdKY2ykoCXQoTfLqEiQktMB0pZc=;
        b=unCfr837U/O/ErwBplqXavvXmlr7ruDW9wTp/oR12oLrR8RLFgxxwXRODuYGmsZCIC
         GAFlE+8Co2tJkv19jy+DIi4wudK1jq+Bux13uYgLy7naDb/B7XQsM6udzkqIQNjBRyKy
         wanujWR+E3i0a+Q/W+XZ+5hWG6f55JOswov7pt2Ldjw9PTOe9Mu2OiDR2l1k53949ixB
         WrB9w572hlvZc+PkzX1FI8ca9jPO+dDUKrCx+2/xi2ZCh6dCk2FBzM51Mmx8lOAD3PRk
         QuSCdxsItxeQdruoT/M5qmmbJOA2ezYH/gZPX5yGcDYeLzaLc/b9mNC43kg1WL8MQ3Fb
         S6Aw==
X-Gm-Message-State: APjAAAXwBVfoqERcbzm7tnRAh7JWozKrBMJceVR44bmuAIG3L0Azc4dG
        GamsHzyyd6Ya00WqTpcPCsLBQmhnpABrly6kokYLKA==
X-Google-Smtp-Source: APXvYqwzKGwdM6Y55E27yheMCcnZ7qcC3Lb2zH9XzpcvqFMRqUcMcymk+LRc2yyxdiCWk004eqbcBGD0s8yWxwr90pI=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr22644979ljm.77.1572947358711;
 Tue, 05 Nov 2019 01:49:18 -0800 (PST)
MIME-Version: 1.0
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org> <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 10:49:06 +0100
Message-ID: <CACRpkdbjFSiSmRrbjAm3xD-2jYcyHPb0U9L8rqMPM44_cQi8Bg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7180: Add GPIO wakeup interrupt map
To:     Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, lsrao@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 30, 2019 at 8:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:

> GPIOs that can be configured as wakeup sources, have their
> interrupt lines routed to PDC interrupt controller.
>
> Provide the interrupt map of the GPIO to its wakeup capable
> interrupt parent.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Looks good to me but I'd like to see Bjorns and preferably also
Lina's review on this.

Yours,
Linus Walleij

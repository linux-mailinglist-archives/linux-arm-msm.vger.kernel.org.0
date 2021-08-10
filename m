Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1BF3E830D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 20:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhHJSeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 14:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhHJSeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 14:34:06 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C4BC0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 11:33:43 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id o20so393403oiw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=gYZz10QOH/TLSpK9xInSP5W9KjyrAu8lPPeUY1ToCJE=;
        b=UkvTnleb2ewtinuVC7dDQEd5XOLkYp23xWGkwCzb6rbXV4wMfIeKFe8mHA8REQnDU6
         zGcRQ4iXxZoqPZSXdY2hTOG25VHEEnhB5DnBZVq/0HB/QDmw0jte5gSNNAFfDuw1RDvN
         6vxdDI/B+WY8yszlYAUNnPhoiWJpC8GPZsS3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=gYZz10QOH/TLSpK9xInSP5W9KjyrAu8lPPeUY1ToCJE=;
        b=HsSeH6By1WmJfTXAwDuJWPOg6lkur9mk0mCqH5My/GSRQhN4Ihyb5fYYaC0aGjcvkA
         59YiYE7oKTUEqgRD9i/eLcPTsjC/SiqmTvp7HRRf3hBItAm2mXQvYoRPhD+v0G4czElX
         iOxSnup8XEhc2PjZtAJLFkbcTDtNuKjwlT5mFutS51a5jg+yAOPToML502c0mdjRo6u5
         hCWlY0fnd/qFU8C0jF71EqElBthcaljVX32HMRUWAQix6Bk+Kvz9ulKY6UMIJHw/9UIx
         5cAMaDELjkFT8cnMXyqDpVdy+4YGjp+f87qu0nEXTckefkcBVxTfUcELx8heYpTtWETA
         D8DA==
X-Gm-Message-State: AOAM533m8/+fz7QxNo/favb5OZmBO+PupW+rYUPIa4HKgfQbRUNdyv3h
        ax3x5vZOQVSWa3iKG8qTDzYOxiObdhm4gIxlZoGcSw==
X-Google-Smtp-Source: ABdhPJx0r1eGpKElyHXDzuipufR0h+pMIYXO/v3pEKBRmpQ1oxloy4TUZvZtg8REVo/F47kGgJfrsCMhXbD/8mXWsTE=
X-Received: by 2002:a05:6808:984:: with SMTP id a4mr4781026oic.166.1628620423016;
 Tue, 10 Aug 2021 11:33:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 11:33:42 -0700
MIME-Version: 1.0
In-Reply-To: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
References: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 11:33:42 -0700
Message-ID: <CAE-0n52a8i-2oNxtqKaS+XGBE0+wcp0Jx05VgL2KnHoQLW-vDQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-08-10 08:29:22)
> Changes in V2:
> -- correct Fixes text
> -- drop commit text
>
> Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease of debugging")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

BTW, this conflicts with commit e8a767e04dbc7b201cb17ab99dca723a3488b6d4
in msm-next. The resolution is trivial but just wanted to mention it.

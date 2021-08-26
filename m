Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341343F82C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 08:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239344AbhHZGzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 02:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238773AbhHZGzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 02:55:41 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022F4C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 23:54:55 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id g4-20020a4ab044000000b002900bf3b03fso619612oon.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 23:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KhqwvKpX2QUupbDYfTBjhyLe2hfemZiewWwZY0rgk0w=;
        b=IKoyYNbSttHPGi5+7FMcORxQLLUgr+nGS4hi/HbbDCxYtSfz6/Do8eIOqxPKT1CBLS
         57YpI2ic79FSuSudLRG1MGqTg9lN/wHHgdsb7G3o8qCDJNHn0aaoK0/clk6xpbJYou/v
         EX5Iw3aDq7mm5yF87RCn/NMkWrW0Hr+1g683k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KhqwvKpX2QUupbDYfTBjhyLe2hfemZiewWwZY0rgk0w=;
        b=RxcZUKA9sTIuQFS2UvBqMyBJEhEkupDEbzZzmgtDRMLCEZKkuOC/5mHmpvapYPx5B1
         uvLDlGB8x+T2yBzthy85q+Mqe7WajKCxYL+RbhJerfdGfwGSffN/mb3ppGGev72PUSDQ
         XFaDyIlLKiPN7sUcvcNcB9RF+pq0lcikBwnKU++f4rmHgeYheb1wskznmqJQ71thixMM
         D4J+bwJBxTakDmqurG+IuBkj/LPJXbh0PpZlUBypBDsusjsbBzWoWvHy8uYXeIT4K8zM
         GKxwcVcSVCTlvdxor/r3f2fzXQzz450jZKkCiim0msy8xE0dPNac8SqCkXjSoXAlpq+Z
         FSDw==
X-Gm-Message-State: AOAM530L0xXakqqdLDWzEc0Wg1VXZS+eUZ0hiNJJj8ij1aD0LxgTlG0A
        e0FZtylU3PTEuYQafVjRfUd1wVVFCMTKf+C+OtvCYg==
X-Google-Smtp-Source: ABdhPJxXVSZ0AeDf4bM/tncwC3s9EqVDnIEfhIMOL7c4INLIqsTWlLNWu96+47aZUOf/3EzE4j0uBVgY5Q0OkeJXviA=
X-Received: by 2002:a4a:a841:: with SMTP id p1mr1813277oom.92.1629960894339;
 Wed, 25 Aug 2021 23:54:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 06:54:53 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-2-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org> <20210825234233.1721068-2-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 26 Aug 2021 06:54:53 +0000
Message-ID: <CAE-0n53M-bk-525Jh5owT54fQu-E+cHM-6m-qLo3APYLDLuueA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/msm/dp: Remove global g_dp_display variable
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-08-25 16:42:29)
> As the Qualcomm DisplayPort driver only supports a single instance of
> the driver the commonly used struct dp_display is kept in a global
> variable. As we introduce additional instances this obviously doesn't
> work.
>
> Replace this with a combination of existing references to adjacent
> objects and drvdata.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

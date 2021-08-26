Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706B63F82DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 09:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239528AbhHZHHY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 03:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238379AbhHZHHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 03:07:23 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13307C0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 00:06:37 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so2242292otg.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 00:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Fec8a8GcTBAqynn2ZZ7COpqa2SBkQGSlbtis8MeqbXA=;
        b=hBr3EdLiF710gt5w/7Ti6OPVvPt7kJNDQbZDuHcQcwmEP36zonNG1PzQEOnSfQmh6R
         LqyeSucKdE+WhY3M35Oe0js8ljT7e5Uhvty6o8QZNtmw0ZZK0TwNKIAhq0SQM+iQOS5q
         pBT8x6egV2yIYFMfJglx/8pEwVoidmAkWS8WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Fec8a8GcTBAqynn2ZZ7COpqa2SBkQGSlbtis8MeqbXA=;
        b=dhsUHfZG0HLLelp2Ly/V9Lt+OK8HwsADeAnNq6DKk2AKJY4IWwvShfsRup1zQdiuvq
         m/bw5QeMxUux6aNbw37LLntdQUTmJN5wcTRUD5aN838BDJkDLmmlQNdT2B/HZVVkbFvM
         Ms8PgHb1UzOVjcQz/n+Q6ZMEQJPlAR395ZyK4JCof4VI465LRowWf8QFMhbDKNQB1/9g
         2ZwMf5yvIa13TpgmtnJZ5/s6TN21X1z3GkgeaQ6XToKRbHfSCC78hzBcs78XWuacBuBU
         A2SDNdwb5zoLKdwrZQpacoEhcWEcLZ2r2lpQ70GD7TPqoEUfGNX1iMmYBMR9gvFJkK19
         3vkg==
X-Gm-Message-State: AOAM532FW4F0CKAYdOkSLBJMglMje3JVvYolsjpajJokYp9dPjSu7Nla
        ETIOBzWOBsNZBA18kPzgzS6ewQcLwEl6ard3YIw+rg==
X-Google-Smtp-Source: ABdhPJxX2h4Sf0+gqNiQoqCR55xo9CLNG4eyz7rKWgznAHyCt52DcMIUBYImUTQuoIE/k/3zVeRSzxCSsUkwkxlhKnk=
X-Received: by 2002:a05:6830:88:: with SMTP id a8mr1891301oto.233.1629961596490;
 Thu, 26 Aug 2021 00:06:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 07:06:36 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-3-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org> <20210825234233.1721068-3-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 26 Aug 2021 07:06:36 +0000
Message-ID: <CAE-0n50X5vKU7arknufaj17YQ0UspET_oN9u+if89q4Y-DvTUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/msm/dp: Modify prototype of encoder based API
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

Quoting Bjorn Andersson (2021-08-25 16:42:30)
> Functions in the DisplayPort code that relates to individual instances
> (encoders) are passed both the struct msm_dp and the struct drm_encoder. But
> in a situation where multiple DP instances would exist this means that
> the caller need to resolve which struct msm_dp relates to the struct
> drm_encoder at hand.
>
> Store a reference to the struct msm_dp associated with each
> dpu_encoder_virt to allow the particular instance to be associate with
> the encoder in the following patch.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

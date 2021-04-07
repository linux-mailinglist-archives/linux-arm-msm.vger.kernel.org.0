Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E2635780F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 00:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhDGW5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 18:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhDGW5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 18:57:25 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE7BC061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 15:57:13 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id 1so83618qtb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRs+CscktAAF86xhY4f4Gc+d+jTkYYtuzHlchmkbnGo=;
        b=DfQ8LfVYvhwJp3KWDRqYgmqB9J2punZRzzRcoTUoQjh3+MbEDBCELLIEcQYM8gDRxs
         2pLMt/ikmgNZjPORvJIzHWot8kz9+TBZSpXZc6dQQ18sj/XSWiYSSPQ13oXew7L4GVoR
         CEgfP0L86Z9Hho/7GGcm952dR4VN5jK7iDHAweRaOEnbuMvt2GICHE8X8lmcswsiAzdJ
         ykQj4d1u5EDW/WC4CBfUAUBa+IPmmYpet/uhQRZiOeFnOUxFDWAbi5Na/PyjSgoPup8L
         Goxqa5RSRF3R7m167JYmZGo1zEzkEBUDoJBUpD3kZwwCJIwetdzoGS1NiHaPoJL4vzbi
         RzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRs+CscktAAF86xhY4f4Gc+d+jTkYYtuzHlchmkbnGo=;
        b=tpg925wlqZ231GcnLgzQNwHJbhql4C2agm5Swqz713l2GXojIbxKgWiPymV+fVSb0y
         Vc3G1yJCXcBLeHww8vWwZer8qxYIRNMKcOCZV/lIB/U8djDjiIHmu2wrTmiQZmKYGqaU
         V7oz/R1k0g2j8MZinbz7hZftDUTX26jSa7rTSZGrRhzwH76bCSrgKb0AO3vmQS4asl/j
         ie+k8PMBaIJa3yRhL1Y5LcoqyQ86Gifwg8ZAgQV4Ark0QOmm3vp4GoSi1qOOAllYqTNV
         SHREoMHYh5KWBYVkoDz4KmkS0/wGwDZ2Z7hibLoG+mT+fz8X5tduIBUfpHI149A/WS3J
         LZig==
X-Gm-Message-State: AOAM530kkhyCFgU1NHR3Uo1hAhHY+DiaUvknImzejSFn8X/ES1lTKJRl
        zY0rnQZEZcucHtZdNXUMfpPpmMzH0U08IU7RklVlKQ==
X-Google-Smtp-Source: ABdhPJwL88K+C5x/fkGrHo0TqiM6J9CldMCEqdVeQBU6fBx7RyibSpm1pEKspE22YHyKc4R0qTegCJgblL8XYRbbO3I=
X-Received: by 2002:ac8:d4d:: with SMTP id r13mr364364qti.298.1617836232951;
 Wed, 07 Apr 2021 15:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org> <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
In-Reply-To: <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 8 Apr 2021 01:57:01 +0300
Message-ID: <CAA8EJppsM1sP=OTiMY8jsLLgU=+p3qgZDD7M+M5naJhfFEF_Zg@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Palmer <daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Apr 2021 at 01:41, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> > devm_clk_hw_register_fixed_factor_release(), the release function for
> > the devm_clk_hw_register_fixed_factor(), calls
> > clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> > after that the devres functions will also kfree the allocated data,
> > resulting in double free/memory corruption. Just call
> > clk_hw_unregister() instead, leaving kfree() to devres code.
> >
> > Reported-by: Rob Clark <robdclark@chromium.org>
> > Cc: Daniel Palmer <daniel@0x0f.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> > getting it into 5.12, otherwise there will be a cross-dependency between
> > msm-next and clk-next.
>
> Think I can get this into the last fixes PR. One question though, I
> think this follows the pattern that things like clk-divider.c use for
> devm. Are those also broken?

It looks so. See e.g. the devres_release() function. It calls
(*release) callback, then it will kfree the resource.
Also see Documentation/driver-api/driver-model/devres.rst, which does
not kfree() in release functions.

Do you wish for me to send all the fixes?



-- 
With best wishes
Dmitry

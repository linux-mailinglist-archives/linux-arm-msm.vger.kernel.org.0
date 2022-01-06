Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388E8485CC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 01:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245715AbiAFADI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 19:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245713AbiAFADG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 19:03:06 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501E7C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 16:03:05 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id 69so1083108qkd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 16:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ssONjB52T9db6+AwacpF9Z0HfuTWVxGvlKDXaL5sZD4=;
        b=WZSBpVwh3QTZfHBZLV54czxSDHcNrFDD00XjYyiQ2Ka0nqTU3wAFileKOC0v2xWY3F
         aYi4Ljg9ZJ5sZ0uCtB2FGIsbQ93KsMfvFApEF9mplhGmhQkMBEvI0OYcS4Lx1xCHCEJD
         qMJKxW7PKiWXujlSeqZBy4CT6x5stkKE2gEwjEaPLyAuvS5myEtG6eGJccGTEanGwDCU
         CF4FXMTGJutk/aEv8WS90+JA9xE2WhN7tZ0Mr7SjgK2zgj4Jgupn3jzjLHGcRgtFy6SK
         0DQnyL5RWLYfDn+zf16qdI7qauoNx1hue19JXGopxYDaQorZ4awyZT4sfyll5CWgKZ+5
         jXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ssONjB52T9db6+AwacpF9Z0HfuTWVxGvlKDXaL5sZD4=;
        b=5KyN7tyCBp9vqC2TiCGGp5EhMr51vGhJEJepXUlcegvr9BAO1IpXcrPrNeCs4P+UUC
         SqyIOBdreuJvJUg31XliK1dPSuYb5rrN9Spij5xAILbHqa4wDvvLZGmeuiiBj9mnJVBr
         pZR2q1RopJEqZdzMTN/pqEdaBfAQnNTNZTHWzApYkl+aEkv150YGJm9SCMUSKbbli59M
         IxGNtHcLMrRmeY+mbkS8wt58FC0CEfkZMr5s43xKAdKBLYeIB/FAwtjlBGqaSj2YQEax
         Nhgqn9aDALWGcxvBoOR6v1gr6E0fWAc71dC+TUewsLT98z6+m/wBd71mBZTGTyy6Dg1o
         3flw==
X-Gm-Message-State: AOAM532MCjUHvhMLcX3QqZrwB3Ga5vZKtdvuMZ5nBDe3EbjTOlbgUc6G
        /g71Mys6G4AHtV4kSu/Ju+ae9RLC6nJonCsT0lXw1w==
X-Google-Smtp-Source: ABdhPJy/OoApJncON5r6kNBonHzIlP9P6S23pAbv4nLVXCuC80zPXDfcJ33V7h0DY405MSua4DBRdlVX+QeRcw+KvA0=
X-Received: by 2002:a37:b8b:: with SMTP id 133mr38079500qkl.59.1641427384486;
 Wed, 05 Jan 2022 16:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
 <20220105232700.444170-3-dmitry.baryshkov@linaro.org> <CAE-0n52fsc9cFfUMOg8EufwwkjJp1sQDO07RVWBvK78+74ubLA@mail.gmail.com>
In-Reply-To: <CAE-0n52fsc9cFfUMOg8EufwwkjJp1sQDO07RVWBvK78+74ubLA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 6 Jan 2022 03:02:53 +0300
Message-ID: <CAA8EJppodnj9sW1oyXu8POd2Evkqz0vuNLmz5v8RYw+Ww-rpCA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: move msm_readl/_writel to msm_drv.h
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 6 Jan 2022 at 02:43, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-05 15:27:00)
> > With the reglog removal, msm_readl/_writel became single line wrappers
> > around readl/writel. Move those two wrappers and msm_rmw to msm_drv.h to
> > remove need for extra function calls when doing register writes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> Any chance this can go further and replace msm_readl/msm_writel with
> readl/writel directly?

This can go on a step-by-step basis. But practically yes. With this
change in place we should be able to drop most of the io wrappers.

-- 
With best wishes
Dmitry

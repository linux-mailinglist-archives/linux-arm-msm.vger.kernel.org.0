Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3071B3DDB6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 16:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbhHBOqx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 10:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbhHBOqw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 10:46:52 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA3EC06175F;
        Mon,  2 Aug 2021 07:46:42 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id x144so848993vsx.3;
        Mon, 02 Aug 2021 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TuUOxCKnvZSNTFcvco20X5jOuFpWKd95m2InPWTRPsw=;
        b=RtBUfygHY26LCx3H6AhwuFsqkg/TeNax2vo51jDZ7ZZmxLhDYNAWATRpuSA2lOk1qq
         1RzKn0/Rmgnz0mDOwlwbBZsRcB547tVGsgZ3Je/zBGaqNVZJDd3bINWmCJPrqUoankRg
         KzCG+HBiS95eEkTnQfhNZIXSgfBOHdF+TTIFOVFxqztBiPeBgGJUaINMNnPeCBe9Dl9U
         bN4J2BNmGDu44OSkjQ5fzwLamqBTEDg9+r31b/9HgGGpRms0ECnz71ELZd1c8MkC2GoK
         1MVdlLiiBxzwzxaxeHO3ZNy6dvBAtIE1jajQvGv/P7UOfpP/3+NEjzEtQMSCB3NutSJb
         qIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TuUOxCKnvZSNTFcvco20X5jOuFpWKd95m2InPWTRPsw=;
        b=FBuqTyq1wHFJNhvWMoWrXYj7nZKvBv8tPvCBYoz5EZzdd7MOh8s4dFQgf5/QS5Hza9
         vs6adaxZWdSWBds6i39U7EBqwkKq5cydoEh74SoCZfcK1qwjxZhGfnRXqrhgRKlUI9vJ
         0QNBgp38s24v9+Gp5oG/IE4n5ivBwkE3GG0RuEHZ5qAB6kV1zRnbWtv8mRk8sq6ECXlu
         raGqH0UKQOK3L5kAzGjlMfG7/XJdIoYwgrstY7mTITqm9UaiauEl9n/eLsKMMxjoVkzo
         r78DoHP4NpFNzp953skj7+hcSk+MEhTmV9qDyrh+gbz5TbtQ4Udt4zu2BUgEvQeGAkp+
         T7wg==
X-Gm-Message-State: AOAM532lOXFEj2fATrrK7rb8U5UEx5mxFqft3rRYR1z3WO+Tv7DyN5DM
        iXZok9cPETXV46qCT3ACDbm45oewI6C7X3cy/RI=
X-Google-Smtp-Source: ABdhPJwsMGK6fB6ykQXW0Hx1xMgqyEPEnorp+p3inrn+bk5OYy5Jq2OmodindHawgFS4opL0ZbVg2C9ViLxio48Z1lw=
X-Received: by 2002:a67:f30a:: with SMTP id p10mr9764065vsf.58.1627915599321;
 Mon, 02 Aug 2021 07:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210709024834.29680-1-jrdr.linux@gmail.com> <CAE-0n51cqCz4JD75n4ZZV2LDxbB6b0QwJ-La2hU8mnPcckNmSg@mail.gmail.com>
In-Reply-To: <CAE-0n51cqCz4JD75n4ZZV2LDxbB6b0QwJ-La2hU8mnPcckNmSg@mail.gmail.com>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Mon, 2 Aug 2021 20:16:26 +0530
Message-ID: <CAFqt6zZYK+EdePnex_D839XzMV=zXsdAd4bHKdCgX4gtUb1K5g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Remove unused variable
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     abhinavk@codeaurora.org, David Airlie <airlied@linux.ie>,
        chandanu@codeaurora.org, Daniel Vetter <daniel@ffwll.ch>,
        dmitry.baryshkov@linaro.org, khsieh@codeaurora.org,
        Rob Clark <robdclark@gmail.com>, sean@poorly.run,
        tanmay@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 15, 2021 at 3:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Souptick Joarder (2021-07-08 19:48:34)
> > Kernel test roobot throws below warning ->
> >
> > drivers/gpu/drm/msm/dp/dp_display.c:1017:21:
> > warning: variable 'drm' set but not used [-Wunused-but-set-variable]
> >
> > Removed unused variable drm.
> >

Can we get this in queue for 5.15, if no further comment ?


> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

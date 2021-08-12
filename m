Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6749A3EA99B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 19:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236649AbhHLRlP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 13:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbhHLRlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 13:41:15 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675D7C061756;
        Thu, 12 Aug 2021 10:40:49 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q10so9442318wro.2;
        Thu, 12 Aug 2021 10:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xtdQLvjPjv0VFnymA3MJ/ZBQrWAvyh02E35C2a4b0fw=;
        b=afrSxcQrgrx5gLO+SX6yckc/hp8/a4L8elF95WR6y2VEUp1eJ0DB02wBANyzJHgwK9
         udmrpXjwtBAYCBeitvcDDgiG/AsQxRoPXYTK+aOS99v+WcAiTU+H09RUcP9DVJMpPJ1p
         XuWPAIGAGldNquoKhvo1xx+XLu7bkZLHNp1e030UYBxdinvoN3STF0NKHAdoSGaAUoi6
         QojGbZTX4WUSGqFQ4d2jQh+cUnu3JWFp/d0EtDO6dzRA3tsFf4w7oPuseILSMrVFZ9sN
         rZsk4kI2TR448qr/xB9E2r1Kgki0MKObTvff4UatSETNAE+/LJI484OojK3TOGmgsbBd
         A9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xtdQLvjPjv0VFnymA3MJ/ZBQrWAvyh02E35C2a4b0fw=;
        b=aYvHwRtwnUJFtcijl0ltq0pwV58yghmCwRd9ehKlUjxSSZI/nGfAewMdQp6zbAMmoI
         oDz9pRe3JPyicpkQsA31EuHIv6HLQhRPbQj+lbXpy0otOEvDIH8wUsMnOygJuIq+rQDh
         Hj567STgINsSDDK4DzLNGMOjy3JM4aZdraYroUVdlxiRZa/Q2o4ZacR5TJ9sdZhZqJUX
         wFXI2J4cY/EYGK4dN31MVapYFiZVvAWV/leju3klR3GIUiQa/cemqAQpagJOPetnFFis
         b0pUyHRTI5YjjlPUIR2Ktzv2kmdGxWZAnrCkrAEhLESmmVmuARf10FpvHn2pHQtKq4Wy
         C2tw==
X-Gm-Message-State: AOAM532t3mLOhq62R6t7KBk+crhN33CZObcBO8i21d7pqn200Sr4gVWa
        SxW2qBpZ0G3jRHzt7bPFIi8zbaTd2JAcMptuVXQ=
X-Google-Smtp-Source: ABdhPJxlE105yhAhGgsHNT7Nc7Yi8zQggP8RT7fprusgr3rX2hm2op41s5yRrlr1/xo3E0R4pxqbOFzarTDjAkfLxpk=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr5137656wrm.327.1628790048003;
 Thu, 12 Aug 2021 10:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com> <20210811235253.924867-3-robdclark@gmail.com>
 <YRVa6Wy/24FUQEUw@ravnborg.org>
In-Reply-To: <YRVa6Wy/24FUQEUw@ravnborg.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 12 Aug 2021 10:45:03 -0700
Message-ID: <CAF6AEGu8H7HkC4ML8DEFDrmMdsErnjmo1iET4+kY_i24_LH56w@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/dsi: Support NO_CONNECTOR bridges
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 10:31 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob,
>
> On Wed, Aug 11, 2021 at 04:52:48PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For now, since we have a mix of bridges which support this flag, which
> > which do *not* support this flag, or work both ways, try it once with
> > NO_CONNECTOR and then fall back to the old way if that doesn't work.
> > Eventually we can drop the fallback path.
>
> Which bridges are missing support for the NO_CONNECTOR flags that you
> are using?

Currently (as far as things that I am aware of) it is just
ti-sn65dsi86, which the last two patches in this series convert.

But who knows what someone somewhere decides to build ;-)

BR,
-R

> Background for the question is that if you are using one of the bridges
> missing a conversion then we could do the conversion and maybe you could
> help with some tests.
>
> We in the above sentence is likely me, so it may take some weeks,
> but known there is a chance for testing is a good motivator.
>
>         Sam

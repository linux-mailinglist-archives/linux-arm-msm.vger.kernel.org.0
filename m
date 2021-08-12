Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8383EA921
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 19:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbhHLRIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 13:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbhHLRIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 13:08:11 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B540C061756;
        Thu, 12 Aug 2021 10:07:45 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id f12-20020a05600c4e8c00b002e6bdd6ffe2so1851903wmq.5;
        Thu, 12 Aug 2021 10:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HFRt0wziwCpQcCnxa537F+IhhJf27Jkl+Fr+dlW4BP0=;
        b=YsAymJhgfctdXRrVg5tCsE+2YeenjK9nfl4ERVAjKtDmFCPeCKagM97Ff4NpvIUByR
         61XBCorWB5JK9Rl0XgUcQavCgtbf5fFnNoYQP0diFgFVtYbQYjp3GDmqXR4fut+2taF9
         NJrA6Sa/owdJ6iIuPHloHY1WBSVi34aa7Ia/djsgw8Yi2x9SEG/r9sXrfqbPpJzub0eu
         3WysqIm1j2HeaZ4S9VeuI0mTWJLcoDiv1+nrvZ/OadgYHUaj4/zjaUCAhGZlsYsoYzz7
         +QYINKKPBFa2qcjMcYEhlIS65FDrJ7eCkRGZt8Po5onm9MsFOWC6K1TLsXL5kQXO45Iv
         E0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HFRt0wziwCpQcCnxa537F+IhhJf27Jkl+Fr+dlW4BP0=;
        b=LHqH/59QTwvNiiK1eANWPlE+i90VB46HJ6vWaeDqZIi8eWS4sJEG2YmlxdfshWgtbs
         X21DHNgJBGwSa6TPk27pD/4y9sTj3uZfq36SGOvdmYqcjBYjsSQeEgg2QRA5fZK28/MB
         q7jeR1tSfwDQe+sQc2dxpJjSo9Q/FGl7NOF1ukHljrVClFk3qt59i4YW46wsH16DcBqf
         5aQ7SYrYuoY+P4fy8c4Onxo820fNWBzxgl9f6POhSXyaBmkMb8kR3Jlv56WrU4Kiuvmj
         h1PkvVTWGrrblZ4wsams6/vy0QecEScLwfzrG7snLgMjUOKOQY7g60fARs8BFnVdKNH5
         M5dA==
X-Gm-Message-State: AOAM5338Q6b2YsuHHWihLJU0pls5V53+ceVUUyODGYUwJ0m7ey2Bhg9c
        sufOoj6KfWQagqb5ZEG9DWEEutzvzi5Fcg6mH9o=
X-Google-Smtp-Source: ABdhPJyyvzqMX+VE9EN3SxNGu4zLM6L6KBs2315nlwOIz/s+gUJnha7d6qfPVv7ZNVJFR06ap6Ku+MhKhxa66YJOyO0=
X-Received: by 2002:a05:600c:c5:: with SMTP id u5mr2296366wmm.49.1628788064120;
 Thu, 12 Aug 2021 10:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com> <20210811235253.924867-2-robdclark@gmail.com>
 <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
In-Reply-To: <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 12 Aug 2021 10:11:59 -0700
Message-ID: <CAF6AEGsiOC0rweuuRF5yC+ssPzF6Sz5Y=tgYHbgTx+km3eCu=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors
To:     Doug Anderson <dianders@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 9:55 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If we created our own connector because the driver does not support the
> > NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
> > a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
> > supported that mode) this would change nothing.
> >
> > Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> >  1 file changed, 3 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
> I'm going to apply this one to drm-misc/drm-misc-next and push since
> it's a fix and we're before -rc6, then I'll take a look at the later
> patches in the series.
>

Thanks.. this is the only one with some urgency, the rest can wait
until next cycle.  (And the bridge vs msm patches can land
independently, I've tested the different possible combinations)

BR,
-R

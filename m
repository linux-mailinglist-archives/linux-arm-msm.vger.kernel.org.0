Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E10423392
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 00:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhJEWig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 18:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhJEWif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 18:38:35 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD50EC06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 15:36:44 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so886333otb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 15:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Ft48Hk1n68Pbbbv8PEM8uaK94jbB+3DvpTmrUODshWs=;
        b=fuO8D1HZqE0QRC5GpyS800L44yJkv8eq3KoFfIz9YbzMy8gLkKwMt3ak48h8SgP/6a
         MQeVZSrXVzFGIZXzKkPlnHuvR/smgI79Gp9ry26Wtn83BDr+9N+s5hf0vtcSiqIJXkCr
         dCVLzMRfCGWeT4zL/RhFyyGcPZALadT1LfwAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Ft48Hk1n68Pbbbv8PEM8uaK94jbB+3DvpTmrUODshWs=;
        b=KulWE2kBw61WfkqH6qCYEMpL6DtN1xwllKKYb+FIzXy4OwGCwPElOiR9WFdJusNP6f
         y4xfQRqgmObJlLUvxTQ6WecjV6WJ+BIJP0qwmWndoUyk/NqnjB5tDIsJKKr1v+PJj0yc
         fNM5pVsP+j32YaUUEGkIyH5WFjQaGQLSj/kxHt/1BL0p0s1U/k26dy7NaYnK021sZpcI
         w+lw/JBeRKRxzVWEIlZiN+XCPdZHGGkDEQ3N5glQdUPVemot0etfZ1Lxrt0xzUpRZOc3
         lymo5iIfz9qVNuqNMu0YzXVFqmvcOnHTkMavsd6uAM9D7LVqiE2vsFBIBRqRyQdPgzqV
         O6xA==
X-Gm-Message-State: AOAM533/T6FlXmlsWoeqKYCWTy1oYrG4HSF1FCsZ81ZwHYp3HRYJShPv
        L2ymCRkQR2EaTa4WsRGmOTKFNLZ1GgTXt8MQCI9uZg==
X-Google-Smtp-Source: ABdhPJwXTb3iHipqtroSzM7KoB3GtcUPf2KB8S66ztGQmawIKW5iKloHtwS37bzAg5v7wipOcEhtT5hf+0xu3KA/PDA=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr17124450otn.126.1633473404179;
 Tue, 05 Oct 2021 15:36:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 15:36:43 -0700
MIME-Version: 1.0
In-Reply-To: <YVzGVmJXEDH0HfIL@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com> <YVzGVmJXEDH0HfIL@ripper>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 15:36:43 -0700
Message-ID: <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-05 14:40:38)
> On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > eDP this reduction improves the user experience dramatically - i.e.
> > > removes 9.9s of bland screen time at boot.
> > >
> > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> >
> > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > re-read the code a couple times to understand that it's waiting 100ms
> > times the 'delay' number. Whaaaaat?
> >
>
> I assume you're happy with the current 10s delay on the current
> devices, so I don't think we should push for this to be backported.
> I have no need for it to be backported on my side at least.
>

Sure. Fixes tag != backported to stable trees but it is close.

> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8992E524230
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 03:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbiELBl0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 21:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbiELBlZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 21:41:25 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B1454FBC
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:41:22 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id c22-20020a4ad216000000b0035f13ae7646so1875120oos.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rLjJ0ObXm/eG6uFPnmb+hbYQUbWPG5VcdG3gBpulpjA=;
        b=Oy2qCbFWbhJBsSdixvgT7G4jo+4gIjzNLWF7oRirqts3owtmixSElnXy9clxneyVgm
         HRrQZFgEeFiNNneI+TEcUmiy++apz0RYXUvUefMNmFGlbzAbCV7XPcCCNhhsaM4zVQNe
         RSD7V/WP159ERvRINmvoLgqVSgcceUwIGHH/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rLjJ0ObXm/eG6uFPnmb+hbYQUbWPG5VcdG3gBpulpjA=;
        b=16GYBuu5lIvYOb8C9N4ttt2RQUeMQJW8kmCh2Y82GCEVuj5cBJU/g4HXaLm0sU77N3
         IjK6sS4kvp1nMUE3amFrgaxx2Fra6U8kTJcCNKidq24Bddx4GR6v4pwhNv279e1d7lwU
         9ATL2kzQDHiLwxqx9/fAYDyf6WVhukGxg5erdsEw1bpJ8fKS9pidXHi3miEwVGGqvjC/
         AKviKeaXed5Rpp51qJEAB00gYPcSpliXKMV2WBOOHoaBmVRDjfs6zlIzBmdBbswrwXt6
         hnwJAXwdbfr0cgnsvlheZFbWGV3pFigxfYr/DEgPYc5+rmX0eYMBgzKtK5AfUi8Hnge/
         +ObA==
X-Gm-Message-State: AOAM5339RWxDgsMMjAwoz5W7Xpuh13WpDRmMcgtp+AiZcYNpEQimELf3
        7xILQ57C6iSZgEQaRc4B24tHE20kR2x1UH/lRHICtA==
X-Google-Smtp-Source: ABdhPJzMsinqtg+1aVXUb6CHbZyRBCYcDG6Dhx4Pikw/1PbPWqg/iWQaAJtoxWKqcuORKe4t/jiMxSg0p15gnHkqdUs=
X-Received: by 2002:a4a:6f49:0:b0:35e:1902:1d3b with SMTP id
 i9-20020a4a6f49000000b0035e19021d3bmr10874934oof.1.1652319681985; Wed, 11 May
 2022 18:41:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 18:41:21 -0700
MIME-Version: 1.0
In-Reply-To: <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
 <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
 <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com> <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 May 2022 18:41:21 -0700
Message-ID: <CAE-0n51Bt6VKJb4RjFfNUJVpWu=3jZs7Ym++7oa+-uvMf=hfWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: don't free the IRQ if it was not requested
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-05-11 18:30:55)
> On 12/05/2022 04:29, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
> >> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
> >>>
> >>> Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
> >>>
> >>> Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
> >>> clearing hw interrupts if hw_intr is null during drm uninit")? I mean
> >>> that with this patch applied kms->irq_requested makes the check in
> >>> dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
> >>
> >> Yes.
> >>
> >
> > I didn't see it deleted in the second patch so is a revert going to be
> > sent?
>
> No need to. They are separate checks. The older one is superseded (as it
> will be never hit),  but it is still valid and useful (to protect from
> the crash if this code changes again).
>

Ew, gross. The extra conditionals everywhere really makes it hard to
follow along.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1858D39C30B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFDV55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhFDV54 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:57:56 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049F9C061766
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jun 2021 14:56:10 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so6086805oth.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jun 2021 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=evDQonRj1S3K8SX7rZUDCIBczFx/sTo8Wvx2aYwIKls=;
        b=OWVBOB4L27Ux5W7z3KOprvIdOjq6V6gJYuHTJkkC+0KGtG05Uyygnys63nU6Hg4h7j
         iB+z2RmmKspf7lVJInQgiatOtsE65JJNqbtYqHRLPcsOVBsrm6FGazfGDlE4y5uGFGXG
         +4+fz2igEEl0ganIoL7z4jkhrrpZTxNkyRA6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=evDQonRj1S3K8SX7rZUDCIBczFx/sTo8Wvx2aYwIKls=;
        b=Af5De6rveXbf+wx4yPqg7DpbBwOBWz2VBswsIX+HRs4ObIZHHjQ/1b3DcInX266fSS
         7MfcndSbmpLs9wzrw2NZ5IYrERoeD8AtnudfBtKHOv+n++dAj2aOvZTI9sJXpeaGg65V
         d3Ywv4eWQCiuijrP8jU8WRjazRzE9sLkVGtgXfeaded5KEaNa8f50FjUw7YmNqkYBlmf
         fUsTCnpOly6t5OKUmyzs77PU5WlFZr85g+q9v09ePh/z8Z4LFGEs8kKiOSjjZ/6BtFUG
         Vzmy8dB6m8Ij0c88WmMEiKs5yAF+3VTwlIN4ijifYMtThd718rvUnTUQD2jMPJZsidSu
         DGfA==
X-Gm-Message-State: AOAM532sEpfYN1KP8tdKQB9jYQTMQOUL/kJS/bbjVSdau87KCC0UBk8A
        bFklehYeoIxvcnInAzurv1DtGXtT0IF2f2+pye/Wow==
X-Google-Smtp-Source: ABdhPJz30wwX+MWCxP0OwF1fi1pxyg1nUhQ2q7Vjonlctql1t61M7fV2t4d5RvkXGcWbtIcYD5GCLLqwA8BnqteyMT4=
X-Received: by 2002:a05:6830:3154:: with SMTP id c20mr5443978ots.233.1622843769406;
 Fri, 04 Jun 2021 14:56:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Jun 2021 21:56:09 +0000
MIME-Version: 1.0
In-Reply-To: <a1a8221a44edc3a509bdc1bb89bb5a97@codeaurora.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-5-bjorn.andersson@linaro.org> <a1a8221a44edc3a509bdc1bb89bb5a97@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 4 Jun 2021 21:56:09 +0000
Message-ID: <CAE-0n527b2FRKs83=9OBdUYPJXdT_fLx1-AHNA2uAQkpcSTWaQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 4/4] drm/msm/dp: Add support for SC8180x eDP
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        abhinavk@codeaurora.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sbillaka@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting abhinavk@codeaurora.org (2021-05-28 16:40:32)
> On 2021-05-10 21:20, Bjorn Andersson wrote:
> > The eDP controller found in SC8180x is at large compatible with the
> > current implementation, but has its register blocks at slightly
> > different offsets.
> >
> > Add the compatible and the new register layout.
> >
> I am not able to completely recall the history of why in the DP bindings
> we added DP register base as a big hunk and let catalog handle the
> submodule
> offsets.

I complained that there were many I/O regions for the DP block that
didn't seem to be changing between SoCs. Nobody objected to removing it
back then, but if the plan was to move things around later on then it
makes sense to split it out like it was done initially.

>
> I guess earlier that made sense because DP sub-block offsets were fixed.
> But if we plan to re-use the DP driver for eDP as well like this series,
> then maybe it might be
> better if this comes from device tree like the earlier version was
> planning to
>
> https://patchwork.kernel.org/project/dri-devel/patch/0101016ec6ddf446-e87ab1ce-5cbf-40a0-a0bb-cd0151cd577a-000000@us-west-2.amazonses.com/
>

Agreed.

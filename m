Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5BF4305DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 03:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234924AbhJQBdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 21:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbhJQBdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 21:33:31 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BA8C061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 18:31:21 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id m67so19110357oif.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=FkZ8BDMTGchcGS1E2IMJTlJ/g3mJdDD78OtHNGJ/EEg=;
        b=h9Pokhi4AVZI55uOa2jKdmsv1a9iMYO6Olt4WTnzPXHH1FearCdMb+CLrENVdDFx9F
         r+dk3bWzipc0ifqGDMW8qvRcQGRlZU//OAQbH/kZbfAKAh25odMFAv6FZdL1fDv5ixBe
         0qIlOENPlbW5mFiKP9X5w4oAif6j1ttN8V8Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=FkZ8BDMTGchcGS1E2IMJTlJ/g3mJdDD78OtHNGJ/EEg=;
        b=wfGELs+C3tAZwNJZVdVPTg9N75TFqcK7Ke/F4xUddJhTa4AoesgqTcDl+gVdA78WqN
         xdvymT+JDs2YaWyrwwOo7+QH+87VVqV2Mtv4Yzm2qM6u+YqlgT6L/E+A23NOC1m5cstg
         Nh6Nwt0m1M3nsPbM/hM+WSpZs3uG+iollT6e/NlFAghA45TkbCYSDr7ULdK9ckrF1wwR
         EI/qpdUiFoNGNHfux27blvf5Fp1Q0Zl0xEzH2IliNewiUzDO06BEgUwyV2Ess8q1E3di
         hWpqkPlRtBpKZCo5XEyQ/Qosxsxk2slUSdlZm3NT5eub9EKVV2AUjOWy5OLMbkjnBWJ9
         eeJg==
X-Gm-Message-State: AOAM532cUN03G6obPEoRXp4D1Y29Q3yg4sXGAqFOekY2N2PbtMYScoBl
        qWCH8KsrEQ9TJxUaSUPbfHGvRpBEvfOaSN3u5Jo9og==
X-Google-Smtp-Source: ABdhPJyugEUY5uN9Q+jCOvC6LoW1QUtqZ3z4ufKS9HicaDBtN79ngOQb5eAvAKrduNWR9bmcYtqK+pwYIsIhVnOfYlE=
X-Received: by 2002:aca:3306:: with SMTP id z6mr23201636oiz.164.1634434280958;
 Sat, 16 Oct 2021 18:31:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:31:20 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-6-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org> <20211016221843.2167329-6-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 16 Oct 2021 20:31:20 -0500
Message-ID: <CAE-0n51WqRgoY11x_y-LoNAwzaZZWDgWxU4z+bcfRRa7OfaAtw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] drm/msm/dp: Support up to 3 DP controllers
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

Quoting Bjorn Andersson (2021-10-16 15:18:41)
> Based on the removal of the g_dp_display and the movement of the
> priv->dp lookup into the DP code it's now possible to have multiple
> DP instances.
>
> In line with the other controllers in the MSM driver, introduce a
> per-compatible list of base addresses which is used to resolve the
> "instance id" for the given DP controller. This instance id is used as
> index in the priv->dp[] array.
>
> Then extend the initialization code to initialize struct drm_encoder for
> each of the registered priv->dp[] and update the logic for associating
> each struct msm_dp with the struct dpu_encoder_virt.
>
> A new enum is introduced to document the connection between the
> instances referenced in the dpu_intf_cfg array and the controllers in
> the DP driver and sc7180 is updated.
>
> Lastly, bump the number of struct msm_dp instances carries by priv->dp
> to 3, the currently known maximum number of controllers found in a
> Qualcomm SoC.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

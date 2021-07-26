Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378703D6A6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 01:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbhGZXPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 19:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbhGZXPY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 19:15:24 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97ACBC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:55:51 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id u25so13060837oiv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=aoD4jTfRbzylcA4bNLcfmr8Z+HRIOIxaPk90sso0ATU=;
        b=eQQhbr+z1dG29juiKiHPhvhbjUjYibakqGnSF4idMAK1hnTXJ3j2IVeHu37sbE1AIk
         nD5EMYai5v4xcjYBOPRRpBYhe50X/rIN3mKJ47uQiui9FNJ9cJ9Il+q1PE1UEpMocrOf
         Jokd9Bk5aK4znpuUCHl2Q09JwDeYHuWxCthT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=aoD4jTfRbzylcA4bNLcfmr8Z+HRIOIxaPk90sso0ATU=;
        b=LAG5b4SKz62hf423qMGas90RBe0FM6v+06sZa0Ld9/1vw8D+ywHt3JssboP147u7ys
         LS0BLDmETckS3z5XXp+t0+IVoIOOzlDYb2v2a9PL+TeuA6xvIihFcGADxm33pIggv1UO
         DbSb19UGwbVplWv+rlEGOfA1H8sXn5uamVPXaYNrh5NL9w9mjT/zjkRTHtAIJgJqq6Od
         fBldOdVREuw/kEcgmDo8kQBdFtm3YyL5kcMyGJ5vC+fmGxXP2NT0mS/Ia+/BGd9ySDya
         sDkhaMHxq015Q0KRNSnrUQMRpsmzc2Rl2UCxInlOxuXXrSD1K7wUeynjZr9o4WAzkdgk
         YW4g==
X-Gm-Message-State: AOAM533E0chQX0QuR82amfOQqokQ4gMz2NuCuydRnzNFPRCSS+k5w1dN
        9X5nlA9Xg/Obt0zHWYtDZnvoUB0xwLbv/r6W0EeONA==
X-Google-Smtp-Source: ABdhPJw65cG9TGz3WiBUJWp99aUzz4g/0pjfJNvmUosztg4FLwuh1PpAx+TFNVLnqwkG0FMULV596wJRHK85NE7MZGk=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1129053oib.166.1627343751055;
 Mon, 26 Jul 2021 16:55:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:55:50 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-3-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org> <20210725042436.3967173-3-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 19:55:50 -0400
Message-ID: <CAE-0n53utmLLoJqqffx_-MoiereWAeBFe9nPjAizKeuKRwedHA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/dp: Modify prototype of encoder based API
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

Quoting Bjorn Andersson (2021-07-24 21:24:32)
> Functions in the DisplayPort code that relates to individual instances
> (encoders) are passed both the struct msm_dp and the struct drm_encoder. But
> in a situation where multiple DP instances would exist this means that
> the caller need to resolve which struct msm_dp relates to the struct
> drm_encoder at hand.
>
> The information for doing this lookup is available inside the DP driver,
> so update the API to take the struct msm_drm_private and the struct
> drm_encoder and have the DP code figure out which struct msm_dp the
> operation relates to.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

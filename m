Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE51044B526
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 23:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237070AbhKIWML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 17:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236824AbhKIWML (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 17:12:11 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF5BC061766
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 14:09:24 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id o4so1331878oia.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Nov 2021 14:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=DPT5pWa6cT8nw3Zv9xh5xFmmq85YU9JvkFn3DJbbeno=;
        b=Eepl0E0INMovuY9E/5rpog6e/jKCyo5Mf5NMvqE+gygcSEWSSwfak8b9jRvDyxJIwV
         XbsyCcK/RVQDnUuh1ed6cRQNrYmeYfIzc4Rcw8U4qaSagdxJ5nO9ylDvR6Gpksurt6KS
         5RZ3DEDXQvUcXuCz53c1nTjSQHHOQOSASdlQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=DPT5pWa6cT8nw3Zv9xh5xFmmq85YU9JvkFn3DJbbeno=;
        b=UlKouM2XvJgYy0wDMXU7hAxZsSMvjaZcWek5iuf33BANGLaX4vLOx/s73Egwy3QAhy
         JooklAdbFadwNM83JdsRcEiVjgMx/yJBE6cl0NHFQYXrcv6PZIIZIFYwfDvY6WKD4nrw
         TJUOmjELZY61JD85Tv82p6dSAIK0SeMKyI8iVthXGNhM/6tVYXxKdJsb2uz3UjwaQPSi
         RVr6wkjwVycnrFaFlrDJmAIV9dE6LvThNNac9EuBbCGfF/GZhiPyl22LmiXldEUp8as2
         Ul6QNJO3S61ID4UtVC+QKr5OgRMkg+QXbhLAoNASal9AL2X1W90hfikBljc+TgKiJb+C
         O65A==
X-Gm-Message-State: AOAM53106u/mc4q8fQ0Ydxasun4G/qaMJlnZwUnj6siz1f8MtLSDWZc2
        fSi7gPHyHJgpdCzn+BJkXqLS6a2ujGKRNVRoeMt2/YIia/Q=
X-Google-Smtp-Source: ABdhPJyq+WHaMv+pQAv1iUIqLn4EAtyzQnLJaulAUyKW2RUle/i+EGbpt/SBpZiLkLkmUM3ZrpMeVk6x9TtFHDQkxCA=
X-Received: by 2002:a05:6808:211f:: with SMTP id r31mr8942621oiw.64.1636495764284;
 Tue, 09 Nov 2021 14:09:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Nov 2021 22:09:23 +0000
MIME-Version: 1.0
In-Reply-To: <20211106172246.2597431-1-bjorn.andersson@linaro.org>
References: <20211106172246.2597431-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 9 Nov 2021 22:09:23 +0000
Message-ID: <CAE-0n51evrWUseEKRbdsfx9nLHuv5YdS89OE3X5Ffs+LLN-35w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Drop now unused hpd_high member
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-11-06 10:22:46)
> Since '8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon
> Chipsets")' the hpd_high member of struct dp_usbpd has been write-only.
>
> Let's clean up the code a little bit by removing the writes as well.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

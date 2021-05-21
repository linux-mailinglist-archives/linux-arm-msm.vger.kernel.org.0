Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771FB38D1B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 May 2021 00:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhEUW7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 18:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhEUW7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 18:59:51 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80538C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:58:24 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso19435782otb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WWt/k9Je81/trW2ess0PPge81hA65LJflgpCeG95+Ro=;
        b=SHnMgnsQJTouHaGQqt9wUdT3Zp6Q/2DQMhh/lSL8MYm5uRkqyz9bPZjceu/fZmZUaC
         /bi+E7zLw635BjJ7M9yaoZqTwGwgqP8qmim5ZbMQ9pxM9LwhTtCN2JFbe0kP1e6NP67y
         ojzYKDjY2t7pxLukiK31Sb29vOfYJlay0n+Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WWt/k9Je81/trW2ess0PPge81hA65LJflgpCeG95+Ro=;
        b=VvmXmzLz3SaN3qphvTHVuPWN07IRgRLZ2jYilrgra0XoUzkeJo90nh+vgnzJ0DfCXW
         Hl8rOBro23SIop8DrhQB2GZ/uFbphzsuN32u0xzvVbe3cwtAtNADCWcdC98fmwNreD14
         mzYOAJ/ibmNR2vLvhZJcLOmUjoqwB+lY1SaR248dSfN40sxAlXcCHbQfFytJxyjuxC9a
         FL77spq93jexyRaRE7RmWWFTpHl6cQEkWUA61RfuuCoSvSUubiogism2rPLebP8B4b/2
         p/Ew7E46MrLN4bhuHvit25yCVsEsQwI8wFXZcRb86RokXEw3pKQPZbiIiBg3WYcX/e8u
         tY4Q==
X-Gm-Message-State: AOAM530ZGroA/Up1UTa4V4OPEffjnChj3vZMVsA9LIGFtgR+q/IBnwFY
        s/qyVp9F9OATDArzY6tt0rjiIbHUFUjykhbhY3rZb2RjKeI=
X-Google-Smtp-Source: ABdhPJwO86MrFBCtOIipE84r+ZTQINMq6JbXFOgjgA7d8nzGf6JSBROtp+5gY0cJjmLE/r/p5TiM2xjvF8dIa/zGIQI=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr10482377otn.233.1621637903832;
 Fri, 21 May 2021 15:58:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 15:58:23 -0700
MIME-Version: 1.0
In-Reply-To: <20210520120248.3464013-28-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-28-lee.jones@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 15:58:23 -0700
Message-ID: <CAE-0n53gjZKSByr+ny_Mp4MJtkwejJW2RLj0jp1D7fZtbeOvJg@mail.gmail.com>
Subject: Re: [PATCH 27/38] drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lee Jones (2021-05-20 05:02:37)
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

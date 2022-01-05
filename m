Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0D04859CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jan 2022 21:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243894AbiAEUJi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 15:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238714AbiAEUJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 15:09:30 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDE1C061201
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 12:09:29 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id j124so542863oih.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 12:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=w5io1mhY/CuWn+JWdMxz5VGckhBoDiBFygEqCAudt+0=;
        b=ByFqQpR9BH6VLpD3Y7uVEe2w3xHpWWTCubZouHyzxghEmg+Cg5+b0oATDt3XwiDioS
         5ekjUrLOwlH+49O9isEHigY9nkIyzRk9KtOZ2sQXGBVjLEzIOmGJqJVXQaRj/1Ai8db2
         XRcKHZbdgV1yqyNRhIzuRRdkKz6LyvHfMMj94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=w5io1mhY/CuWn+JWdMxz5VGckhBoDiBFygEqCAudt+0=;
        b=i6LIqnkv1fvZlLjogg8pyoThCp+OQ+nVtw/NvkI8e7+CJzxzOtnNqNtMXoCKIYw50j
         Y1I7uzqA1iHyuk49h+6JXuTemk1xw5eNVZxcJFNFdAns3jZUxrvFQBxPkoUyDHAktCXN
         fK4CTjlUN49NSRFvXf5lnPF/sJw3kTAIZWUBdUYxgaq6S7RTXuDG4fPnDqxuqXbZRHMu
         tA+fFLm0vPS97hWttf0CCqeSDab3zH10s13E9eme1MWFs9YxC8B0B7Fkn6sPeGBEdWiW
         dUcYKAe8sK63NEu8A4QMNfRa0H6eDhHNBY/XerNBPKQvpZniDSaNfMUr3FeEAozywVHi
         4Jug==
X-Gm-Message-State: AOAM530Twu/KZ17D+4MypViVgqXsxcbmDYIMNuALzyj/uFcxSpWW5qxV
        Mf28L2F3NzPrqfodb2ww55pXxVIUy3l5OE4y9jpb5w==
X-Google-Smtp-Source: ABdhPJwjz8XD8bGgh/xlrvEPoae5Md2PsKfYPTixPnc9jD7I2Lt5h5lXbD1+Ynwc+vpJk77ax73vcuCTauiJOOoyfkY=
X-Received: by 2002:aca:4382:: with SMTP id q124mr3813128oia.64.1641413369023;
 Wed, 05 Jan 2022 12:09:29 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 12:09:28 -0800
MIME-Version: 1.0
In-Reply-To: <6fd20c8779d6b03a5b54509af25b478049482087.1640531508.git.christophe.jaillet@wanadoo.fr>
References: <6fd20c8779d6b03a5b54509af25b478049482087.1640531508.git.christophe.jaillet@wanadoo.fr>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 5 Jan 2022 12:09:28 -0800
Message-ID: <CAE-0n52jDxkfYbsQPzKjSeD4rimTz1p2gaDRFpK-LLxxNV31Ow@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Fix a potential double free in an error
 handling path
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Christophe JAILLET (2021-12-26 07:14:05)
> 'dp_bridge' is devm_alloc'ed, so there is no need to free it explicitly or
> there will be a double free().
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

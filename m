Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE22423504
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 02:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbhJFAdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 20:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236953AbhJFAdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 20:33:42 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035C2C061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 17:31:51 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id a3so1657503oid.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 17:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=m+MQKr5bcojm+sq7twaLg9pOUyJH5Cs+bOJrOsgta0s=;
        b=GS/JhV0jd+qpvRnhjBqMFbLHcJyA18vDoEZRkcsyl70o2Zw9rFeYG2+GLxajHYUhQ/
         9mlZAfVZPGpCekxLKcIrOYPDk6TZJ9bRQRpE+bDcTzj2V5QnhwTSC+QryLhGHxlbHKJW
         pYDjcJibQ+zO4NJCsKj6a/Do0AGe+60gkzyXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=m+MQKr5bcojm+sq7twaLg9pOUyJH5Cs+bOJrOsgta0s=;
        b=RbvxaMe9Jkp0VnoX34QkFD8v5n7KGscnNwHzDRYC2OaVZiQF6Fv2l6qT3J6HMKW7Zo
         VqkWeXLX9mm+TrNnueaBi7xbkygJG2J5E2Lw0UXfQDwa2FRi4r8QCDWJ4ApNGDJYBjAm
         cJDzqKm6Uthmy1C5Ko3cft7TZIPFmEwiVFkmj/CecLAA1d/GLzCnNF+bEh3kgaNPXndl
         +qotKeee/nFbhs/9azHO7LiTebCPrQrCoAQ+CY4iJOBoGvZvxxu0tyn3Zipall7/ZHSG
         eM0/UnBIGZdnhjysrld/ir/hCdt5h8vUohbH3wcXEko9hO7hncjDH2Z2MHHtV8F0T1/+
         VFhg==
X-Gm-Message-State: AOAM530h0DDY3tOST61gsJ+J5NgS8aRJ4+TRtob/PG5SjpicMa9VCC7e
        /rGfOwjmUt9NkL1WM0z68uaoUR6uSFcWh5AhkI+1xw==
X-Google-Smtp-Source: ABdhPJzMWWttSwSsQa0qR8s31oOrQHsLnN0nu6wJj4lnGpC7laluIjYD8fdeIhSf0clYnnBS2KZ1NOlkP+u5kDOTJRg=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr5002008oia.32.1633480310393;
 Tue, 05 Oct 2021 17:31:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:31:50 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org> <20211005231323.2663520-4-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 5 Oct 2021 17:31:49 -0700
Message-ID: <CAE-0n53wHmorZ4HdhJmXTf+Z0j++LFut_aTryuCAa8ONW3iuLA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm/msm/dp: Allow specifying connector_type per controller
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

Quoting Bjorn Andersson (2021-10-05 16:13:19)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5d3ee5ef07c2..eaf08f9e7d87 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -115,8 +115,25 @@ struct dp_display_private {
>         struct dp_audio *audio;
>  };
>
> +struct msm_dp_desc {
> +       phys_addr_t io_start;
> +       int connector_type;

unsigned?

> +};
> +

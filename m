Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261C4487038
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 03:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344612AbiAGCQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 21:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344454AbiAGCQW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 21:16:22 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58407C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 18:16:22 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id u21so6320945oie.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 18:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=kKwZjkLvH6ZAyxG0ybHLi0g/OyU34wARZkVSPe8lOGY=;
        b=fjouixiydP9JfIEYO4dKSBB1qDJzNLODLO3f135n3yJtR03j2236LSj+1UPbe/Kb1q
         LQRX4MrsVNp5T8wuwow6pj1u5cShr8gJF6PgM0j66XuE9fyBQPWBhCWkoS7SHjdiV+Vr
         pcePNgHKNGX/5Y+o5qAiHk7TcmNiY+NaHuf+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=kKwZjkLvH6ZAyxG0ybHLi0g/OyU34wARZkVSPe8lOGY=;
        b=RkS7yqqN8Ew6zCYnFkzDk0nB6+PuXPVr0NiadS1f6vjaYFwQMGb+fy1PONs388umHQ
         fVli1+cEqxy9vIJMNJ5rUr/E+V1P8afsJNEUfR0E5w/lKIioZNVyNn6Aup0RGBwXNNTd
         8b4WtUTE73cu+5A2tUAusNIsya4RMTrjHPxOk/6v6yqhU1bPSnwV1gAxCBqN+eIuSUmZ
         X68h32HtCI4aYeaxKT7fn9xYi6SZ4skoqqzL9X9uWtTB91W5NcdoWbSABr+BasCpRA5X
         xzGBLOIdNU9jkavcdzTm62x5HdtmL8htusQnuxWIBExeAa0j6wSnLKxPqwecPadd47mt
         0NCQ==
X-Gm-Message-State: AOAM531ZsteR//q6pL4jET5N/M6f4ZRxV1K78RkykbyjrYyKy4p2YWyH
        Rkl7uXeLs0oOOpMXFXsylWP12cUG5SLddmVCsyp9ehD1uio=
X-Google-Smtp-Source: ABdhPJw8A1/PY/9sW6U9NcUoroIzSiIr77qSNDetdvPRYOFPKJhRkXW9Sirs8QrjrRjfHfN7YWmkU3aTwiVMic/LFWU=
X-Received: by 2002:a54:4710:: with SMTP id k16mr8244349oik.32.1641521781718;
 Thu, 06 Jan 2022 18:16:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 18:16:21 -0800
MIME-Version: 1.0
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 18:16:21 -0800
Message-ID: <CAE-0n52Si84XZxURUZ6ONKOCsyCDGF=AXHrStOoMPC67xRiVfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] Simplify and correct msm/dp bridge implementation
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-06 18:01:25)
> I noticed that commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> enable and disable") conflicts with the panel-edp (panel bridge)
> support. Both bridges will try to attach directly to the drm encoder
> itself. I started writing lengthy letter describing what is broken and
> how it should be fixed. Then at some point I stopped and quickly coded
> this RFC (which is compile-tested only).
>
> Comments and tests (on both DP and eDP setups) are more than welcome.

There are some DP patches dribbling in every day or so and it's really
hard to follow along. I asked Kuogee to resend all outstanding patches
as a single series but that hasn't happened. I'm not super interested in
reviewing/testing out these patches until the outstanding patches for DP
on the list are reviewed and landed. Have you looked at those patches?
See [1] for an example.

>
> The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3:
>
>   drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17 15:09:46 -0800)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-dp-bridges
>
> for you to fetch changes up to 7eff304d50ba520e9193a293a8e42bbd9d7aa0e1:
>
>   drm/msm/dp: stop carying about the connector type (2022-01-07 04:56:06 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (7):
>       drm/msm/dp: fix panel bridge attachment
>       drm/msm/dp: support attaching bridges to the DP encoder
>       drm/msm/dp: replace dp_connector with drm_bridge_connector
>       drm/msm/dp: remove extra wrappers and public functions
>       drm/msm/dp: remove unused stubs
>       drm/msm/dp: remove dp_display_en/disable prototypes and data argument
>       drm/msm/dp: stop carying about the connector type
>
>  drivers/gpu/drm/msm/Makefile        |   1 -
>  drivers/gpu/drm/msm/dp/dp_display.c | 263 ++++++++++++++++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 250 ----------------------------------
>  drivers/gpu/drm/msm/dp/dp_parser.c  |  28 ++--
>  drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +-
>  drivers/gpu/drm/msm/msm_drv.h       |  32 +----
>  7 files changed, 203 insertions(+), 380 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>

[1] https://lore.kernel.org/r/1640220845-25266-1-git-send-email-quic_khsieh@quicinc.com

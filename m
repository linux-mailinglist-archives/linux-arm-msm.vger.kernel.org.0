Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6023A120D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 13:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbhFILJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 07:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbhFILJg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 07:09:36 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AADBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jun 2021 04:07:41 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id r14so11955617ljd.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hO3vEEVdO0DPz+vO9KJvLBSJTaoPQXnru30sw8j8V+k=;
        b=tJ+IxUQX6y8nk471bg47+iouc2pnb5EzeCVGDMgfLNBUUydydIFqq6lhq/QTCdnxoi
         ETRyEs14qkwYFBNvb/vRgeiQw8SxbBcHxjYav9X1GrSQ3qaKSPkupNdkqkY/jwC+RDY7
         7A3o3Z4V/nSi5iyqhEr9hxnBtloNMkYSXpM+UjFwtN7Kz2HvnQ7P3YjmM5M0Q8/qTVHG
         3yVusC9NM0uIaOxkCxGe3ccLUlb59nfqak4qCXCkPmnMrkt4HxL+ZVO/zYUPfdsmP94r
         9cHO2x7EITXWT1XtHoIwzIklwSrrsHteBwexobdOewu31/N/V/hyIE6+7nbIgvvxrEUB
         CfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hO3vEEVdO0DPz+vO9KJvLBSJTaoPQXnru30sw8j8V+k=;
        b=osKjnvHI+dlrZ4KEc5QNiaBlKcoKqV70lP3EK2WL9dnkiPGCkBb/FvNkqrfEu+46yI
         tOVgytvISojEQx61EY9jwYxh1AhqDguO8L4WvK+wndUNECNQWygF/HQEcE2Oqa463gGE
         2c5FQ5NW1mhDrQDamMmpzNL11UXrdSvuIKO/S8dN6xQZl6TWX2RwBNkL46qnHF00wcNo
         QA0kcD04ADTPt+T1n4MbedGBPojjIqJ+wTJYVNkK0MyGFiLvdTMhHCvE+gxZRjq5rusk
         ucOcc9nwLx+Ay2gr+qzN7BcUn344SpOtnD+b3z8swnHVOiruScBAbT+ZabR/NqIbLUtD
         AZmg==
X-Gm-Message-State: AOAM532OpuMHpwbe6b0PnQcFRhRJ46kN4BE9sl752UogMzrZHSbhanYk
        yGxCeYeKmC4up4ADRlLgFKENAgDVhl+O1fgngVrciw==
X-Google-Smtp-Source: ABdhPJxL1/o/55M4zUInEECGJ8JlN2FQ3cBr/0HO5voXevIvLQKWpjpiW9USKNXD1KKnOZdv1T7oDDPbAU6x4fmJssI=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr22139779lji.273.1623236859907;
 Wed, 09 Jun 2021 04:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210607170555.4006050-1-dianders@chromium.org> <20210607100234.v9.6.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
In-Reply-To: <20210607100234.v9.6.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 13:07:29 +0200
Message-ID: <CACRpkdaa=1LsyESZenDWv91mTX4H_AhwzGnSO2b9v8zXRMAvzw@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] drm/panel: panel-simple: Stash DP AUX bus; allow
 using it for DDC
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 7, 2021 at 7:06 PM Douglas Anderson <dianders@chromium.org> wrote:

> If panel-simple is instantiated as a DP AUX bus endpoint then we have
> access to the DP AUX bus. Let's stash it in the panel-simple
> structure, leaving it NULL for the cases where the panel is
> instantiated in other ways.
>
> If we happen to have access to the DP AUX bus and we weren't provided
> the ddc-i2c-bus in some other manner, let's use the DP AUX bus for it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

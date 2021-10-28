Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9E943DB0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 08:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhJ1GXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 02:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhJ1GXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 02:23:41 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED51C061745
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:21:14 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so1316140otj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Mc9LKQAQoslOGm6o+pVM9AhRB1ZUOOEE/5oefVUl9Lc=;
        b=ispJvbrsPNohrDzzQOfGiAya2Gz/DXYBgvobMGSF8M38h1V5YLwF3zJvQ5mUvZWXwx
         dNEfCluGOMa///Ra8ket00k+BpYhjPld4QIjQuSaWuENr4YoQZ+SqqB8Z+bJu4ro7cMI
         wJxalHJpVDA7mjndkAe3QO2kjHgd/v7TFYCuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Mc9LKQAQoslOGm6o+pVM9AhRB1ZUOOEE/5oefVUl9Lc=;
        b=zpsDrL8jY4c/ETJy3nxmWQPsGQZ7yzK4TmJjRASVM5MIEOPM+/Ns2KCvLxD7aAUNHz
         edERLCxsRIEz+bV6A54921l3MptEosVYguhaikBoqUsy90MAz0qPzUtbjl8b5sx+n04d
         p/DNO0VHGSWDv9dRKWGqQAVJkgjPWfHpvFLOKdX+ZsIgBFmJXzPTGjZkf/y//zI7FRKT
         O4sjkPSIFoO7KSRtMdAlZheuCqzj28A0y8Co6qP2sRSA7j+BmIoAijvgVQLJ9V7z5sxs
         lN3jkNNA4H04T6QPe5MevB/j51yeqCadwU+R88mMYHbyVzsXZtiQT3gz4Flt/HBfSqXx
         jaNg==
X-Gm-Message-State: AOAM5307eBcjfjAr92i8ZwyvR2WPTu8MjI9y1CKdIBcWQclNSHBr0f5r
        LvrqlgTuhr7+pLQGqnPDxATcNNFFMX3nHil2mlW0uw==
X-Google-Smtp-Source: ABdhPJwXQHqI3ICCqimmpImWWFhlxNmRD9J4BKAimAk2nP8JakuCfq++JC5QTUaAhvBLQQixIagkH4fHHMXy87/FcEE=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr1891665otl.126.1635402074047;
 Wed, 27 Oct 2021 23:21:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:21:13 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com> <1635386088-18089-3-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 27 Oct 2021 23:21:13 -0700
Message-ID: <CAE-0n53gO-NtWosw8kjTkjv7eUPt+VH2rzAvDAYYwpGK+jJ=nw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm/dp: Add DP controllers for sc7280
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org, sbillaka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-10-27 18:54:44)
> The eDP controller on SC7280 is similar to the eDP/DP controllers
> supported by the current driver implementation.
>
> SC7280 supports one EDP and one DP controller which can operate
> concurrently.
>
> This change adds the support for eDP and DP controller on sc7280.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
> changes in v3:
>     - Split into patches according to function (Dmitry Baryshkov)
>     - Use DP_CONTROLLER_1 for eDP controller intf (Dmitry Baryshkov)
>     - Use DP_CONTROLLER_0 for sc7280-dp (Dmitry Baryshkov)
>     - Add macro in drm_helper.h for checking ssc capability (Stephen Boyd)
>     - Use existing macro to check assr capability (Stephen Boyd)
>     - Add comment for HPD_INIT_SETUP delay (Stephen Boyd)
>
> changes in v2:
>     - Don't initialize variables to 0 (Stephen Boyd)
>     - Use const for read-only dpcd (Stephen Boyd)
>     - Remove zero pixel clock check (Stephen Boyd)
>     - Sort compatible strings alphabetically (Stephen Boyd)
>     - Use pwm_bl.c for backlight instead of gpio (Stephen Boyd)
>     - Change return type for functions returning always 0 (Matthias Kaehlcke)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

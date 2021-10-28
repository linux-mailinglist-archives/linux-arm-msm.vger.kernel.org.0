Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0410643DB2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 08:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhJ1Gfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 02:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhJ1Gfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 02:35:51 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957FEC061745
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:33:24 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id w193so6978967oie.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=012a/Vm5/ys3I7xHUTpKoav2CLUL7YSpnaZKJZYXlbU=;
        b=kB6S9D3z3JDO5QzXuz/0sV2WOSEVXZ2qgSY0IZnKfGAJcuUfZn8yCNPiCiar7BGtV6
         p76fd7ObCQ41N8/bGr2+zEQdqFjOZb6RHaCKFtlNwaLIE9o7aFPPtECLa7F04KSjB4T0
         unmdhb6IwfpxRslLEclYxHgHi9c7Ote5ZJZH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=012a/Vm5/ys3I7xHUTpKoav2CLUL7YSpnaZKJZYXlbU=;
        b=DMzUQ2cYDnX6ChT+GtEknw160e6S2YIjcZ9MNCWwRgD4suk8NkhYK7fxyaBNB0buMR
         dN8qErnaSpqrn098+bscQhXt4ixpCxQQvCwMVfKD41Bk9RHFR9omBHfvkA21+Xzlqkab
         t7PZ+mc3MHbQSpOcDscdMSBmkuor+bHwJz2GqwW282sTHF2d1Fv3FfDy9ouRFh5m3r8L
         g+iEaP3+zMWXDXaO5bAAkpOdXnN2IJ6k7uHMCqp4Xg4OWNpMWHe92RtlT7xiz3ON2p15
         wkwB8Ftt0XBXJzGMZGpqmxoRsPqHoYefnE/noJ/NWOuW5dwsR/P5LR06BGR66hcRYdma
         07WA==
X-Gm-Message-State: AOAM530QibBQmank038sTwzEXL9ybKTA3oS8VEfQ+0zkHNhHho7eldMy
        JxIPqxfEIJ5VpPArE8vYFQC7AADDEevjZauxeaIVJEaOvJE=
X-Google-Smtp-Source: ABdhPJwKfcrcVbkDjjQUjrvG2947KpA9p0L4TJMaJtoUfNTXn8AL7+GfwN6Z13xYxPFcN24NqTGRjkARDf39SksmrAk=
X-Received: by 2002:a05:6808:a1d:: with SMTP id n29mr7024899oij.164.1635402804016;
 Wed, 27 Oct 2021 23:33:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:33:23 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-5-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com> <1635386088-18089-5-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 27 Oct 2021 23:33:23 -0700
Message-ID: <CAE-0n52b5xKboi6b-J0m-W_rbjgSzyJqhPrMVaZrm65L2GeOFg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/msm/dp: Enable downspread for supported DP sinks
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

Quoting Sankeerth Billakanti (2021-10-27 18:54:46)
> The sc7280 eDP sink that supports downspread will fail link training
> if source does not enable SSC / downspread. This change will set the
> downspread bit in the DP sink if supported and indicate SSC support
> to the DP PHY driver.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

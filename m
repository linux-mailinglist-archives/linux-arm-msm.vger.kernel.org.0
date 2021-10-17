Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB404305DC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 03:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244762AbhJQBdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 21:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244737AbhJQBdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 21:33:09 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A63C061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 18:31:00 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id q129so19180657oib.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 18:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=pehrrn4CE1KsK/Wvnw1j9FzE4EFmgiJ0jUGBDx8V0oc=;
        b=jO/Re6SWrMiWh6YCN4NXmVGAQeDRrqTn0L11tV5oM5KpYFd7HL24z3FJ51WWAUeaD2
         xZwOxAT0W153OezfwQqRdclZFPto3bFdMOeZl5swnzbnVTtITUR0IgZDv15etyqMSHaR
         3YK2kbFuBJSqBb1UXMZrb698eerNLnW+WjRRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=pehrrn4CE1KsK/Wvnw1j9FzE4EFmgiJ0jUGBDx8V0oc=;
        b=tAGx37AJOCqerYzdpSmeGDFCU0dCBV7eaPIA6PmHhb9L6a1KYNCos5ft8sWXlQk8UO
         q5PBzHdiku4jJu0VY6hklJGIvCVFcmOqP2u/JxqZQ2xrqAHC6VA0vVYEhsXqTxs6zoXn
         g0DCgKrcwtdY1CkHiB6g2jT8+AN5fiKim+kHCcof4a6SKGG1jrgVcmm744t0JFO2xGEL
         lUNhf6+kCuUpgBFaG2LOk29g6DWHfblxBx5wNGrenPSDPpyEFJYkQcl2hSBNAwqs6zDm
         hA6ayTGRTTvnv5YD67L4bj3Mk+PI2Vg02/YEEkli72Y/wx3puv77kzldZkPA1LqD+lB1
         CmZQ==
X-Gm-Message-State: AOAM532Fe2p/5uF1pIm73LhpN9cIaXuRQspDo00FCooJOCivV/cqyLEI
        tE00Q/cNIDBEuyu9TyVEGfcYy47Ma05dVE+MirSrpg==
X-Google-Smtp-Source: ABdhPJxy3t88xA6iK1Cjxtpt3um/UJTTxJMSRlcJVLLf71yXQYnhIGis19Js2+/b9dbn0rWz2Jqdc5iE1C4ar6o7380=
X-Received: by 2002:a05:6808:230f:: with SMTP id bn15mr14832128oib.64.1634434260154;
 Sat, 16 Oct 2021 18:31:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:30:59 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-5-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org> <20211016221843.2167329-5-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 16 Oct 2021 20:30:59 -0500
Message-ID: <CAE-0n538PL-JJgMCzP3yc-Y_9qbsHWhtfbcXxh081eFg3QgZ1A@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/msm/dp: Allow attaching a drm_panel
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

Quoting Bjorn Andersson (2021-10-16 15:18:40)
> eDP panels might need some power sequencing and backlight management,
> so make it possible to associate a drm_panel with an eDP instance and
> prepare and enable the panel accordingly.
>
> Now that we know which hardware instance is DP and which is eDP,
> parser->parse() is passed the connector_type and the parser is limited
> to only search for a panel in the eDP case.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

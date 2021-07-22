Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F95E3D2D7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 22:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhGVTfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 15:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhGVTfx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 15:35:53 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F088BC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:16:26 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so6460314otq.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=xXB6CY1/hyqIZ/vyf1haNoHbt4KWUoYy6vvZAmH1D+w=;
        b=oFGsQ0TKjSPUvmDJ+Ww7NKCOnlaH9mPPhQ8V1uT5yAbwlHkzi7XKHOwbKCdjsDCiFx
         yq1IJgMOZiLe6uDTqRaVUXxdZCoQJu8ag7Ir6ZFU8nUwgn7Znd4ZLaNh5xPaNp+azumy
         J/HSCBwivCGfPaDdx08xhc/6xnh7lVWGgPxdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=xXB6CY1/hyqIZ/vyf1haNoHbt4KWUoYy6vvZAmH1D+w=;
        b=iOqecOZEDzcVdvacZ/Hz/AZS8Xwl77kgD+gRS5F+rIB9mKTfJyEILoxNScS9VwgWMe
         yGYwXuJlvQTOzFxdSbBnGIcZdFNVa3ppiic0uXkcz94db47TNzPjE1NvJAmZvS+KiSbX
         AUDGydQXTCXnyEOwftmlEpTFQwqwtLAAfRKfxTNrzmlqytz/ssbXp3wHzte8MdaNomC5
         AaJthwSWJfKRC/Y+dPGSKaz9zqqI1SrEfg394rxacyhVifGiv3+DzJ7OLtDI5N30s45a
         CYo+bjfb9mN+Ajd+vr9x57sfeDBWtCJVk6yE58EfETK0yc4xx4PcSwGmxqSub3CKMv0S
         BFYw==
X-Gm-Message-State: AOAM530CuzupZmnkyj9NwqoafD4ZFtbXwgHbcnFKjkx3uwknpiGM4nCV
        YOEkdcqdvgdga9TwnR9/hbuIaQUTbz3PijXfNc7v1Q==
X-Google-Smtp-Source: ABdhPJx9tD8Po38Bpw7rs+mj+04e7lSnkyOtBucxpHE2LeWBu5SLBnaseuHcQzXabjdCy3cHqU3feQ+K8Kq30uLlLb0=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr984428otl.233.1626984986325;
 Thu, 22 Jul 2021 13:16:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:16:25 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-6-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org> <20210722024227.3313096-6-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 20:16:25 +0000
Message-ID: <CAE-0n51ftru=ap2PvKiXDTVoQGA1drzU-C29b_KXTN=r=uC78w@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dp: Allow sub-regions to be specified in DT
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-21 19:42:27)
> Not all platforms has P0 at an offset of 0x1000 from the base address,
> so add support for specifying each sub-region in DT. The code falls back
> to the predefined offsets in the case that only a single reg is
> specified, in order to support existing DT.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

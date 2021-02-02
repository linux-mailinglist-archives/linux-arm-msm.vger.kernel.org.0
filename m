Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB0230C5A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 17:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236300AbhBBQ1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 11:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236311AbhBBQXE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 11:23:04 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CC5C0611BD
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Feb 2021 08:19:27 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id s5so10681152edw.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Feb 2021 08:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMlokKzdK8V+Gvn42ll3ctucK3HqZBs6Jki/pOm978k=;
        b=CJkHp49YHJzedJgJ8H0hrsZdj+gxcN3BAsvOFGka+ihZA4DTtNVEF5t6RKE0TjxW2v
         3VMpxwUMuwbNi+sSTVjV8U9TbMQR0g84EXXXwMnBwLizunO/vn7NmdkDEm3nB97gJTge
         CmQx3qInSpzwbtaBji+YfXyAplBiO9PFpqcoQ0ydL6y+RMvM1c0F3g9IW/lFuwUbT5i2
         qsaxe9NAtjm1ocM5j13weD5kinZM7PA6gEygB1wxycnQH2CQLBM2UcnuYsGyVzyaSeIq
         biGF22X3wYmB4rJilAkhYYsEww8QJ/4taedDev41OVAc/XEl2Hmuu3ClRaJTCidCqhBc
         rsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMlokKzdK8V+Gvn42ll3ctucK3HqZBs6Jki/pOm978k=;
        b=a5n8Z0kNGh/CtTycP7I9a7IFCUUPsfB3A1/wgjADIqZUFkZRQha4LGu/exwUpcrVq0
         CbjQIf72cT2zKernG6MobJhIaRusW86LruMAafcv05tZRo8Nwe0V40b6XCynI+dIYCsH
         xjG0OPs4Pl/OekJiKpBAF7dmCmWWNaErYWt5sH6HfOWcRuw0V0HA5JYvYkIb5WbTEeix
         RupsNrGS50PuVBHsoroiDEUmdyK8Zfnf/qQv7JpGWKkUXgQsEZpdPewcUC6w3upa+FNE
         bQsVBpLCTFkOY8S5m3YxusasMRzs7xw373g7Z3ob9LEquaPDLYU1myXTqTBxNOktPR8x
         44Og==
X-Gm-Message-State: AOAM530XYd9TBFwq/Hp1U0On/+YEmQV2wnh95ThZjh+W9yn6pTkKBDjM
        JXqZzfL5RMw30eyM3KnyPJ9ZNRCN+bHKhZtkVBD/zg==
X-Google-Smtp-Source: ABdhPJwCqe/XoviTy7D5nVnoFrHySYWSUZsc5T9i8NY4Drep3y9EoWok5QgcVbshVpZUffyKN2kscyfdEMC4Lz+Xmes=
X-Received: by 2002:a05:6402:202a:: with SMTP id ay10mr3681976edb.93.1612282766286;
 Tue, 02 Feb 2021 08:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20210202123214.15787-1-bernard@vivo.com>
In-Reply-To: <20210202123214.15787-1-bernard@vivo.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 2 Feb 2021 08:19:14 -0800
Message-ID: <CABXOdTePOqMtZ88oTNDc0TT7oH652nLHApuXkbB-44jG5Z8PAg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove unneeded variable: "rc"
To:     Bernard Zhao <bernard@vivo.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 2, 2021 at 4:32 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> remove unneeded variable: "rc".
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index d1780bcac8cc..9cc816663668 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -409,7 +409,6 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>
>  int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>  {
> -       int rc = 0;
>         struct drm_display_mode *drm_mode;
>
>         drm_mode = &dp_panel->dp_mode.drm_mode;
> @@ -436,7 +435,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>                                         min_t(u32, dp_panel->dp_mode.bpp, 30));
>         DRM_DEBUG_DP("updated bpp = %d\n", dp_panel->dp_mode.bpp);
>
> -       return rc;
> +       return 0;
>  }
>
>  struct dp_panel *dp_panel_get(struct dp_panel_in *in)
> --
> 2.29.0
>

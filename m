Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E83F3996D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 02:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhFCAOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 20:14:15 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:40793 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFCAN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 20:13:59 -0400
Received: by mail-oi1-f173.google.com with SMTP id f30so3210374oij.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 17:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mjcG7yb0p2PCjeChIEZx/qwcbpSV6pjnKIr2LM5z6DM=;
        b=NrcYLu/c53UvNnWkwbC+Vo+HdEds3SEb3xPgCuHxo4K2YM1dbNKZNmSzwYZHDBimzc
         /HlEvWxgkdSDYuT61IXOSAgsufEDnEsWcHBZGATvUQlpot1ws1yWvFR0PLqUAmoWOF2Z
         O4ys4RorI7/0D48LzE7XFm+v2Hdo8l1d1u9rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mjcG7yb0p2PCjeChIEZx/qwcbpSV6pjnKIr2LM5z6DM=;
        b=I3EMbMWnGP//oYSKsDak0QnFML01GVPjbPuskKgP6J2KVGKA5Xc21XLt5aHVc0vfRG
         WULazbod0ewHi8yDvg4cB2dfqPrOelcf6K9Vl0ouSPSJLZi2tt7BiEjHpp3CvvdrU9nj
         ypZTV4BR5QsGTQQgZmQAtf+xX6lOa318VLTlhhYoiUbgZ5TNKmwOkxqmT+/QdKVEQM24
         8BhQBUVT/dTvMJgZPbMQOHlp1KFdIpjyRRwGelaG73SNUuMeraF1Kb0xQlcA2uJzMOJP
         WOVbs1SGtv9k7HMKXcxdE07JWunrWNd3poRNSKQHr9NSHBcBJFMauotDTRucsMu11eL4
         v6aA==
X-Gm-Message-State: AOAM533DaC8xsNljDYghXKUQHuRnuMRCMZlb4XS7g9DnNVOPHRIQ6RBJ
        eppOv0Y43yynw1mTrlats0ggKpzvdqxeIg==
X-Google-Smtp-Source: ABdhPJxfSzGCeRP+UoVjNUD7FVU53WZ1JQBOHckT01b28d0ITqzZApt2hBBM8lDzZgzvss5tnyuBUg==
X-Received: by 2002:a05:6808:a88:: with SMTP id q8mr5512888oij.9.1622679060054;
        Wed, 02 Jun 2021 17:11:00 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id t26sm339201otc.23.2021.06.02.17.10.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 17:10:59 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so4083726otc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 17:10:59 -0700 (PDT)
X-Received: by 2002:a25:8191:: with SMTP id p17mr50542159ybk.405.1622678728912;
 Wed, 02 Jun 2021 17:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org> <1622390172-31368-3-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1622390172-31368-3-git-send-email-rajeevny@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Jun 2021 17:05:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuWKHo1YLRTtN_dcMDuoc9erpwaGTb6WNgwHeDLuz8qw@mail.gmail.com>
Message-ID: <CAD=FV=WuWKHo1YLRTtN_dcMDuoc9erpwaGTb6WNgwHeDLuz8qw@mail.gmail.com>
Subject: Re: [v5 2/5] drm/panel-simple: Support DP AUX backlight
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@gmail.com>, Lyude Paul <lyude@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, May 30, 2021 at 8:57 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> If there is no backlight specified in the device tree and the panel
> has access to the DP AUX channel then create a DP AUX backlight if
> supported by the panel.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> This patch depends on [1] (drm/panel: panel-simple: Stash DP AUX bus;
> allow using it for DDC) and the previous patch (2/5) of this series.
>
> Changes in v4:
> - New
>
> Changes in v5:
> - Address review comments and move backlight functions to drm_panel.c (Douglas)
> - Create and register DP AUX backlight if there is no backlight specified in the
>   device tree and panel has the DP AUX channel. (Douglas)
> - The new drm_panel_dp_aux_backlight() will do the drm_edp_backlight_supported() check.
>
> [1] https://lore.kernel.org/dri-devel/20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid/
>
>  drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b09be6e..047fad5 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -800,6 +800,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
>         if (err)
>                 goto disable_pm_runtime;
>
> +       if (!panel->base.backlight && panel->aux) {
> +               err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
> +               if (err)
> +                       goto disable_pm_runtime;
> +       }

It's so nice now!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

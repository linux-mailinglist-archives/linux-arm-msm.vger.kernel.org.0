Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E17F5AA2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 23:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfKHWMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 17:12:41 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:35952 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfKHWMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 17:12:41 -0500
Received: by mail-io1-f67.google.com with SMTP id s3so8029725ioe.3;
        Fri, 08 Nov 2019 14:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VP7wzPTh3axuUTTJzTE2O0Yvg4rYT63oka2jFERivYw=;
        b=BvJos1COGV7s6Cc1rkvcxs/EByFGDz8rXSGaYgt+s0GChqZR3f9N2yT/jsTzEquUwY
         2T9IkfFqMXmbGpMZaWUE8R2KfgJdityZ9kQ1Kjj/wh90qNlgbYWHd/PXaHdXjzy/WDtu
         iD/zZoqKgESpFL1ayUvTXr9vj5faGQTz6FBVi1Rs9u+xAcXXbytw8aCKiI9xMzX6VUw8
         spODN7nOy1J6hB2EVK0E4qE1xF1r9DCQDB3UQi/4IbRmfqYVYrp9rJfWdWi4YoL6yAm0
         SVSU0+GExY6K1XtJUYf6addLiRAt7c+KE+l/hTdsU18kRBGPK4AkJjqmbCmUTxLap1Cb
         Jx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VP7wzPTh3axuUTTJzTE2O0Yvg4rYT63oka2jFERivYw=;
        b=kzTJHTUwx4fOtiPJr39ZqjAJEfHEg0DSJZCxPEeel9IECSqQysLLNBrEwYuT5NowAs
         /tNpUlyUdtKRq5dqBnFS/Avb2r/WyZyvQ2mDQNVrUcRzMlTpHg4o4JwBpZEd19VT7fC0
         BBQJZOAgtiigb4qFH2+KVOEP7cJ+f3nZyOJe2lqpofCwdgN2pvn1Q0kzOJG67dv5OReH
         Z/2OU/tADLYXETN8P5KzUuMnBGaj/tjUfFrZKH1Ibs4kZfKKg96XNu3Lm84o2thr2Io/
         ijSwUd3BgPKC9ESIBzqDtH17AEZ6ImpkvugxQOWg0sehlHhuWJQfWekzSWJAADog3+fC
         b/pg==
X-Gm-Message-State: APjAAAV6URwb0Rzr++16Guxnzj1xxyjMSR49g+eSqnNWfJXTrnvvTQNR
        5W/VrrW3w+Uq/nEoEqTNeie6inOYLAJoj43l2sY=
X-Google-Smtp-Source: APXvYqy74eTMXO2Bj8kE7ehtqnYovvN+7sRr+xSwJFSn6HaKnfhynYsLnin/wm4/30Ybps3M0mXYER00BmutigydhI4=
X-Received: by 2002:a6b:7846:: with SMTP id h6mr12161721iop.33.1573251159632;
 Fri, 08 Nov 2019 14:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20191108212840.13586-1-stephan@gerhold.net>
In-Reply-To: <20191108212840.13586-1-stephan@gerhold.net>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 8 Nov 2019 15:12:28 -0700
Message-ID: <CAOCk7No7r6Frdu8jSbdBCroXeF+HY=kqEQoJnK0HbkyjLse5Rg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Delay drm_panel_enable() until dsi_mgr_bridge_enable()
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jasper Korten <jja2000@gmail.com>,
        Hai Li <hali@codeaurora.org>, David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 8, 2019 at 2:29 PM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> At the moment, the MSM DSI driver calls drm_panel_enable() rather early
> from the DSI bridge pre_enable() function. At this point, the encoder
> (e.g. MDP5) is not enabled, so we have not started transmitting
> video data.
>
> However, the drm_panel_funcs documentation states that enable()
> should be called on the panel *after* video data is being transmitted:
>
>   The .prepare() function is typically called before the display controller
>   starts to transmit video data. [...] After the display controller has
>   started transmitting video data, it's safe to call the .enable() function.
>   This will typically enable the backlight to make the image on screen visible.
>
> Calling drm_panel_enable() too early causes problems for some panels:
> The TFT LCD panel used in the Samsung Galaxy Tab A 9.7 (2015) (APQ8016)
> uses the MIPI_DCS_SET_DISPLAY_BRIGHTNESS command to control
> backlight/brightness of the screen. The enable sequence is therefore:
>
>   drm_panel_enable()
>     drm_panel_funcs.enable():
>       backlight_enable()
>         backlight_ops.update_status():
>           mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
>
> The panel seems to silently ignore the MIPI_DCS_SET_DISPLAY_BRIGHTNESS
> command if it is sent too early. This prevents setting the initial brightness,
> causing the display to be enabled with minimum brightness instead.
> Adding various delays in the panel initialization code does not result
> in any difference.
>
> On the other hand, moving drm_panel_enable() to dsi_mgr_bridge_enable()
> fixes the problem, indicating that the panel requires the video stream
> to be active before the brightness command is accepted.
>
> Therefore: Move drm_panel_enable() to dsi_mgr_bridge_enable() to
> delay calling it until video data is being transmitted.
>
> Move drm_panel_disable() to dsi_mgr_bridge_disable() for similar reasons.
> (This is not strictly required for the panel affected above...)
>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Since this is a core change I thought it would be better to send this
> early. I believe Jasper still wants to finish some other changes before
> submitting the initial device tree for the Samsung Galaxy Tab A 9.7 (2015). ;)
>
> I also tested it on msm8916-samsung-a5u-eur, its display is working fine
> with or without this patch.

Nack, please.  I was curious so I threw this on the Lenovo Miix 630
laptop.  I don't get a display back with this patch.  I'll try to
figure out why, but currently I can't get into the machine.

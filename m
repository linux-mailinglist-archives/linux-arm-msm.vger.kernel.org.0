Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C21A15D507
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 19:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfGBRJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 13:09:54 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40017 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBRJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 13:09:54 -0400
Received: by mail-io1-f66.google.com with SMTP id n5so38729306ioc.7;
        Tue, 02 Jul 2019 10:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqaJi0HrAK4+dk3eMEGg3q9k+ySNsfHxhG2IP9d4UEs=;
        b=AVTZR9N4fUw9Rrth0jwcYm+mer+PVCcsHJlQbUWbkebZAGe6S0bsqdJ2WC2VpYZ7OC
         e6A3Az1SaumtPiznF/a16IrnPY1Y+9kKOSh4QtrGrp5fXq3rVJ+AIDYVnGBLMcACNBYL
         BIyrfH5EgMdhFAo3jb+hRIwPFnBChAtmB+i1wo41CtcqC+V8EFdc4lHisj+VkuZqC3AP
         MXBH0+UlYDeHOeEP67NpZTU1b0FcWVOJ5QI7P6D/jin8usF0OYNKgLTFOKKfv908OyhT
         9MIb/3xfjEAk7tPgOqr3CBPNmu3h3Y7nubuhGlDj5KJMGAJZKvn5HMfWjYwJqUv9FgKX
         CSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fqaJi0HrAK4+dk3eMEGg3q9k+ySNsfHxhG2IP9d4UEs=;
        b=ItCEjj2lcHWJUuIxMZQy/kDrvKv3BaM4la+Jw/9DSWma2o/TYbdql0+EZxe+taworl
         Tcc39LphcTEtV98YOOSIeYgjFWk711j6w7udOcClt23ggnmSq/uxueKbzGXHV3tU1dQ9
         zlsKrfys4r9ND04p61WGMd9DPfcUsgRfvpRcIiLhodLH/+PW8S1XAjqTJLj+Ud1vh2s9
         M9KDUXLfIRjd+5XAj42nj74zc3bXBO64Uu2GWimxbP62R6KA4aa/iDp36cgnOj4bGsLB
         vXEFM2uqCyk+thMOG3i9RQMbSFmnwGxsJ1cPVEWOVwpSFMpujFeJqX8RgH1ZHdtJr1Yq
         Sc0Q==
X-Gm-Message-State: APjAAAVJRKjoTwZdQ08DjspJogn3npriKYwMw55x0QacUP1MC+662Ssd
        5gC2oAlwp4AraF6iKFM8eovXOVO+tQCjMHFlyrM=
X-Google-Smtp-Source: APXvYqxnE/1cmrQUM28RI827W1EzrQ/YJ3EPJcW0btqKWfjxAt/uEzHidZYDJ5JH7Hc2zy6sNje0jpAisnfX9c2LPAE=
X-Received: by 2002:a6b:b987:: with SMTP id j129mr31360848iof.166.1562087393986;
 Tue, 02 Jul 2019 10:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com> <20190702154419.20812-4-robdclark@gmail.com>
In-Reply-To: <20190702154419.20812-4-robdclark@gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 2 Jul 2019 11:09:43 -0600
Message-ID: <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 2, 2019 at 9:46 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Noticed while comparing register dump of how bootloader configures DSI
> vs how kernel configures.  It seems the bridge still works either way,
> but fixing this clears the 'CHA_DATATYPE_ERR' error status bit.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index a6f27648c015..c8fb45e7b06d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -342,8 +342,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
>         /* TODO: setting to 4 lanes always for now */
>         dsi->lanes = 4;
>         dsi->format = MIPI_DSI_FMT_RGB888;
> -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -                         MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO;

Did you check this against the datasheet?  Per my reading, EOT_PACKET
and VIDEO_HSE appear valid.  I don't know about VIDEO_SYNC_PULSE.

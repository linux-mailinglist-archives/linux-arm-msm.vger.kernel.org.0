Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43AF85D50D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 19:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfGBRMt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 13:12:49 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44887 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbfGBRMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 13:12:49 -0400
Received: by mail-ed1-f68.google.com with SMTP id k8so27955850edr.11;
        Tue, 02 Jul 2019 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XoF0sNAlHbB2PqfJBA1jXMj4w92+gZnPePjTu0uUobU=;
        b=bHw55XaQGroF0ylnI35AGP91jmUT5NGLszLbt34h7hJdpUsA1e6tQQINu1L4phDSOr
         YQKxzV3xlxNsLK2qMjdBeknXnaEuUGAut8p4ynSaVCPcHPbzknLqhsv34RUxlHcfWx6o
         E10RM4Yp/m1E4sQ5sidfuvWHhiOf8+J4QoDpqwxjv9bSZBGk1b1yy82+IAjxvnCirYYy
         HhkxpNHrM9UMQggtDzhbmV+fesNi+DGCHw0S9u45uzgtc/A7BJoZte8xmxv8VTm/7o2I
         qlfUSD+o38eQxz3FG17pdj+1qlK4mx+NngoI0rMsBtqAS3jkDcauyL3TkK+IUt4EcYGN
         UWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XoF0sNAlHbB2PqfJBA1jXMj4w92+gZnPePjTu0uUobU=;
        b=kKrdyJ9C1hzKj2jtsdW+ApYdiAYEPotCN9jfK4bBDErphnd68dSlzWOdm2eqcx9tSa
         Owf+qULBd2jBrhBC3h6sRT6OZLWbTCM9iSTcYRooWxV06A79E6pI1Y0ppojIpUV2jiEl
         RHqRnrxgpXj+gkuVJsbaW6ArSZ7Zqxi5BRR4X5BfTXPGJN3FIhfCx88VXhtcjVZWgJjW
         QsF2oBK0Y9luTuXTlY7QTyL1Iz6bI1DUQ0ylEguUs/+4Knlgs2sPKcyVlnE5eT7tFNmP
         3FqPBw2+TTHZc0q0YfCCh2K1tesHb0+SD0XOQ22Vz7X9VIMrhpXnmiG0+hRbhOLfBhud
         6RaQ==
X-Gm-Message-State: APjAAAWKaIMKaQuSTFEJZJUncNdLDyD4MycrvyhLE8ERNgkeIVA3atk4
        Lcrdgc/7TIg/irbzdrT/h5Rnf32m509g/XQwvPg=
X-Google-Smtp-Source: APXvYqzkSu8z9mFY0i8yVY+FT2wCAAtApNeEZpub+8q71O42jEyUwtmm/AGgFEProRchS7okyCoM++zAFylZVEj7Kw0=
X-Received: by 2002:a17:906:85d4:: with SMTP id i20mr30449571ejy.256.1562087567246;
 Tue, 02 Jul 2019 10:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com> <20190702154419.20812-4-robdclark@gmail.com>
 <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
In-Reply-To: <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 2 Jul 2019 10:12:31 -0700
Message-ID: <CAF6AEGsUve1NnzF2kEeW0jwgXnxZTgFaHbq-c-+CKru1jS9tWg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
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

On Tue, Jul 2, 2019 at 10:09 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Tue, Jul 2, 2019 at 9:46 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Noticed while comparing register dump of how bootloader configures DSI
> > vs how kernel configures.  It seems the bridge still works either way,
> > but fixing this clears the 'CHA_DATATYPE_ERR' error status bit.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index a6f27648c015..c8fb45e7b06d 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -342,8 +342,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge)
> >         /* TODO: setting to 4 lanes always for now */
> >         dsi->lanes = 4;
> >         dsi->format = MIPI_DSI_FMT_RGB888;
> > -       dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> > -                         MIPI_DSI_MODE_EOT_PACKET | MIPI_DSI_MODE_VIDEO_HSE;
> > +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
>
> Did you check this against the datasheet?  Per my reading, EOT_PACKET
> and VIDEO_HSE appear valid.  I don't know about VIDEO_SYNC_PULSE.

The EOT flat is badly named:

/* disable EoT packets in HS mode */
#define MIPI_DSI_MODE_EOT_PACKET    BIT(9)

I can double check out HSE, but this was one of the setting
differences between bootloader and kernel

BR,
-R

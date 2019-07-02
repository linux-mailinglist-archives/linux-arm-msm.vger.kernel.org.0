Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F585D91A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 02:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfGCAeg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 20:34:36 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40599 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfGCAeg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 20:34:36 -0400
Received: by mail-io1-f67.google.com with SMTP id n5so676221ioc.7;
        Tue, 02 Jul 2019 17:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1EqOkAJ16JrzJYbRJsKM2M5z/cziA7sysWiFBw1wCQ=;
        b=cHbuCUvN+s8Lxw2Gyg3gi4DFYo+F4B8Y2Kkpc1I2sZAekDpolXvsjxL2vCLw+zBEqh
         XqJBFdv4ZmCJk7ExnlSoa231CpUFJrcpmHzSb6QDviDzMXT80sTIefoueo7dajOTdTbi
         aSPGfyYr4g1yfJTGDte3QRKpLEKt1aqtYlMj+ltHYK9bVYthpd6JxS8HV8gAdXOBjeLa
         uTskqhloZdHDc8VdGHBGGTqQcEBxsoj4u5Nv/wU43dV0lo6VBVMpKiI5X6sDz/w7Ybgg
         oCN/1Oo3aDlnsbAFjFi5ldNCfMPtrnA2qTcQ7ew+gfk4C/znPwGU2nex1jNx62tD5fmB
         J9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1EqOkAJ16JrzJYbRJsKM2M5z/cziA7sysWiFBw1wCQ=;
        b=SU6OceEQM4IhouTK4HKhjslxEWRHAF1qrvr9w3/5SGMIxSnF2UgxRlu3d8lj6qq8dB
         OgyiuRS+k11Poq7aDnyVCoQm9OkdvVfVWfgJOGXlbXjUiChdxbrBgikkIMOU/Qu029aJ
         a9ACX3jr46sS/sGYlZWE+YNNzJ5e7+yqQGbgc34Urk7tftd8GziorjFH3ESdyeuX14M4
         +d8D2C5hPW5kc+0/ZT6/aNp+4O+pDcv8ifxFcmke/Td6GFS87518EUHBidWHHoA+JHDN
         Z3LDnEhMsy+wpl9/bldazeM9790vfNcfsRDGqo5vmnQYZ6xcokboCoYzn6tileD7QyNc
         RGPA==
X-Gm-Message-State: APjAAAVn2NugxIQlKqr6V4ApAi4P5+DMqebtDhd+HEDV2pQcbOzOlHtG
        CCL2D9D0iHNMMnYOQZOLM2p/al1yJimGaC4vnNEPyA==
X-Google-Smtp-Source: APXvYqz2ea1Co87gENT0Z1FYNhMJZ2SZm3RqcDFrMzN+sTpYjy5Oh6gRJ+UNd2Qx/1ivh+Y0WvJG4xn2CxoR0RmeRwA=
X-Received: by 2002:a02:ac09:: with SMTP id a9mr39228087jao.48.1562102997246;
 Tue, 02 Jul 2019 14:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190630131445.25712-1-robdclark@gmail.com> <20190630131445.25712-4-robdclark@gmail.com>
 <CAOCk7NpyYSiDHP84E4bQiTA1Wk9Sd4w-F8-Zqu9tKtDoUTsFDw@mail.gmail.com>
In-Reply-To: <CAOCk7NpyYSiDHP84E4bQiTA1Wk9Sd4w-F8-Zqu9tKtDoUTsFDw@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 2 Jul 2019 15:29:47 -0600
Message-ID: <CAOCk7NrxsbAd9sp6m9RSfkRjwW5GZH7qJv2fd78bogas-4YMWA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: make sure we have panel or
 bridge earlier
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
        Sibi Sankar <sibis@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 2, 2019 at 2:30 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Sun, Jun 30, 2019 at 7:16 AM Rob Clark <robdclark@gmail.com> wrote:
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1824,6 +1824,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
> >                 goto fail;
> >         }
> >
> > +       /*
> > +        * Make sure we have panel or bridge early, before we start
> > +        * touching the hw.  If bootloader enabled the display, we
> > +        * want to be sure to keep it running until the bridge/panel
> > +        * is probed and we are all ready to go.  Otherwise we'll
> > +        * kill the display and then -EPROBE_DEFER
> > +        */
> > +       if (IS_ERR(of_drm_find_panel(msm_host->device_node)) &&
> > +                       !of_drm_find_bridge(msm_host->device_node)) {
> > +               pr_err("%s: no panel or bridge yet\n", __func__);
>
> pr_err() doesn't seem right for a probe defer condition.  pr_dbg?
>
> > +               return -EPROBE_DEFER;
> > +       }
> > +
> > +
>
> Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Actually, I'm sorry, I'm now NACKing this.

Turns out this prevents the panel/bridge from ever probing if its a
child node of the dsi device, since mipi_dsi_host_register() is never
called.

This probably works for you on the c630 because the bridge hangs off
the i2c bus.

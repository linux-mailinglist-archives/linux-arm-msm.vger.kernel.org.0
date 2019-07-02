Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA9A35DB1A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 03:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfGCBpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 21:45:09 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45317 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfGCBpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 21:45:08 -0400
Received: by mail-io1-f67.google.com with SMTP id e3so578184ioc.12;
        Tue, 02 Jul 2019 18:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e2dHY1JEDP4p/Iin7PE911+goagiVJlOgF+4JmS/qJI=;
        b=fyZTRJk1EU58W3X9rMzFfX/rWwLk6qDxZqQwcdvO1B+WhX5Ay/UJIb48NnkcP5NLcS
         ceblxUmOFxSPlx1GBeqmcDjUbH6sB6hrn9ORIMObg1R8IvxgkKwhM0eHPX8TqeaCFty8
         N1KWPAjaJlmDjw1YCme0ht1QbwjJUJm/C7jaXTjMhpiThgVwTaGdpllJwhVOfBbta9Qe
         iEOIk5xCVFOv1RNqmaZTN85pB/FACzYDacf0MfBCtismFZAJ99Yag41k6NHrbx4zHk4l
         ARNK8o0PJYPNErN/pE8MUBWWxADpIOzOOzbW9BqxwCooNLIvnGGGb//TGKGEF4OATYas
         R7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2dHY1JEDP4p/Iin7PE911+goagiVJlOgF+4JmS/qJI=;
        b=oOOz2HUqFrPw/wteX/d3dkFmUpo31fqug9S9NZ0/kpIn2yfpB8KPAOaMSEmwVDUiZb
         ULrjoq28SJ7RVO7tdfbpe8jqFmCyAaVre0/RLIqOdoDNnIrzkNoKIy8g3dyJNZSY1lCZ
         X42QmC/bqv3gxpH1fJ1RkUEvHO9kXtm+jSMkRnr4x0U4kgg8nzEy7ZPSZ+sWmTnkAzWU
         5lOWkDOrvpIgQCubD1QUjAEPYrDq0xrGBxX9tLu1gu+I9/I0pLqzLEg64fR1IDrlSQlk
         8y73Vh2YKYKC8xUgpDivQKl3HbmSYjiqjm605kdJ3MWuIqSbZOth+wU+jbYPSaVMzajh
         qaiQ==
X-Gm-Message-State: APjAAAX5cDPVTAkVXWbKHowTP9x2wMJdmi5H18I8Gtga0fgblGR+0WM2
        9FyMt75IxS3FxZnvi0HpMIe4NTENa9Sb3KXK4K4hOXyl
X-Google-Smtp-Source: APXvYqwXnBozA4Eg8repxRDmwc7v+ie6ZVutTX66BvuZfbKmO1Vnft8PUGkmnX5djxbfa6rxW7cPYo1M3PTW7hEaw/k=
X-Received: by 2002:a6b:f607:: with SMTP id n7mr7314656ioh.263.1562099449824;
 Tue, 02 Jul 2019 13:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190630131445.25712-1-robdclark@gmail.com> <20190630131445.25712-4-robdclark@gmail.com>
In-Reply-To: <20190630131445.25712-4-robdclark@gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 2 Jul 2019 14:30:39 -0600
Message-ID: <CAOCk7NpyYSiDHP84E4bQiTA1Wk9Sd4w-F8-Zqu9tKtDoUTsFDw@mail.gmail.com>
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

On Sun, Jun 30, 2019 at 7:16 AM Rob Clark <robdclark@gmail.com> wrote:
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1824,6 +1824,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>                 goto fail;
>         }
>
> +       /*
> +        * Make sure we have panel or bridge early, before we start
> +        * touching the hw.  If bootloader enabled the display, we
> +        * want to be sure to keep it running until the bridge/panel
> +        * is probed and we are all ready to go.  Otherwise we'll
> +        * kill the display and then -EPROBE_DEFER
> +        */
> +       if (IS_ERR(of_drm_find_panel(msm_host->device_node)) &&
> +                       !of_drm_find_bridge(msm_host->device_node)) {
> +               pr_err("%s: no panel or bridge yet\n", __func__);

pr_err() doesn't seem right for a probe defer condition.  pr_dbg?

> +               return -EPROBE_DEFER;
> +       }
> +
> +

Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

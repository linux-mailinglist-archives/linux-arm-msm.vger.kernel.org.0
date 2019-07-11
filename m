Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE72D65ED9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 19:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbfGKRmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 13:42:45 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42049 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbfGKRmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 13:42:45 -0400
Received: by mail-ed1-f67.google.com with SMTP id v15so6622892eds.9;
        Thu, 11 Jul 2019 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sDCTVVop4NPgBu2WxG9CKMJq6Rz5EG8pMIpMsrokx0Q=;
        b=YrfPuLnRDGVP7eg9cdZpsaPagof75FJD/41u5WhkrwxGuDOcBTDryC1LGTVQDUE3Bf
         rPk8w59kCJaAwUXAAxjhHXoC8HXSuyRcUwHai+6q84ZaQXDlpGjlXszEcKAPBQG7OtZJ
         fQN//8VLoNKtd51RzFI3jX1+9S7kqlIl9b9p95xhpp1DrnuYxEwiL2RRhViwPJ1sqzzN
         Rlnx1rYFqSF3+WHhZfNEudYW/p2m8AWHkGUoUsiJMOyTHIebhjbhnK0KXy9LKbjbEH8v
         sZRR4WypeArW8HJbWs7UzZqWVkBIYNzEd4mfpizDhvtkOoSvggwr/l2AHDNYZgcIslT0
         fcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sDCTVVop4NPgBu2WxG9CKMJq6Rz5EG8pMIpMsrokx0Q=;
        b=DuAD9q/yg0OJXx449hnrsqioiIcnJ2uhIXXo5frsyedn23xusXNTQs5nbpgInGMeTH
         0YU2IG+XUwc3MUP6pYs/n+dCMs8NSNt8UlqdctPCLX3/hYx/jkPmVSPb0d/IuP74RYzs
         891kQCxoIWfU14e2g4DfmqCvhefY/IJlwkpxol15gP7bqvelZQ20CY2kkCFvCLzqgAr5
         I84VImvGN7vxD3luanqLTmwwcMq/du0v70m3SL2ZlB11P35PNnvWLrPqLLdR9Wwwlp0b
         6Ks9RcZAtqesP6h1npom+/71mXsL2n+Omx7VbrFxv4vo6FI11tQIk95vM0oYyy02mFOS
         z0qw==
X-Gm-Message-State: APjAAAWKo+kwzbWB3FDm+5few+VlPoL/qqn2yqcd0l31VFVe4WJRTvGp
        JOC5+7ZYn8RvF+4IRvmBOfhIuHi0L+uOBRghR4s=
X-Google-Smtp-Source: APXvYqybvEj2gI8a+mKBgq/L1/X8hSAoV6wPjO69HykrLFeoq6zIaiUwmcQ6LeSMTx1h28aL9hhcTtZYF32EUx/Iurw=
X-Received: by 2002:a50:9203:: with SMTP id i3mr4933489eda.302.1562866963151;
 Thu, 11 Jul 2019 10:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190706203105.7810-1-robdclark@gmail.com> <20190711164908.GO5247@pendragon.ideasonboard.com>
In-Reply-To: <20190711164908.GO5247@pendragon.ideasonboard.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 11 Jul 2019 10:42:31 -0700
Message-ID: <CAF6AEGvF78tT4aHv1SO56zMD_0FaX=TF+2MmAATTM9rnqLvEsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 11, 2019 at 9:49 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Sat, Jul 06, 2019 at 01:31:02PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This should be more future-proof if we ever encounter a device with two
> > of these bridges.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index c8fb45e7b06d..9f4ff88d4a10 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -204,7 +204,7 @@ DEFINE_SHOW_ATTRIBUTE(status);
> >
> >  static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
> >  {
> > -     pdata->debugfs = debugfs_create_dir("ti_sn65dsi86", NULL);
> > +     pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
>
> That should work, but won't it become quite confusing for users ? I
> wonder if the directory name shouldn't be prefixed with the driver name.
> Something like "ti_sn65dsi86:%s", dev_name(pdata->dev).

*maybe*, if they are badly named in dt?  In the end the target
audience is really to help developers and people bringing up a new
board, so maybe my way encourages them to use sensible names in dt ;-)

BR,
-R


>
> >       debugfs_create_file("status", 0600, pdata->debugfs, pdata,
> >                       &status_fops);
>
> --
> Regards,
>
> Laurent Pinchart

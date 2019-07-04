Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 554EA5F976
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 15:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfGDN5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 09:57:14 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39855 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfGDN5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 09:57:14 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so5512247edv.6;
        Thu, 04 Jul 2019 06:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FFyR56GUnLHy2geI3ziIJleBntP257KjNAIucLrVbto=;
        b=sSMe3KUnCE/9cEqVz610EGJodOlNiM7nWzbx1zZ79RtpzxbcLa33M2jDifYqiexG0+
         vAZ5VR8pdueSNKBYIlI9C2zj7yyaHLKqycY6QbNU5Caqk1xm0PFg28WJr+StMyTPC2tG
         KtltdHgdepdP1B+TgssB4nk3tZIaXH2SZtfn173dD5iaP5NJLzhrd8Y/YGXG0g1FhGt6
         mmmiJ7M+4sNbgyTNadHtLZz3XXN23H5PQ1+aHa635fHwO6L802KYN4412D7UeT43pOuF
         /o+CMaU/9P57X0KNIgp9sJcaBMYHt/QfKjNSuIFP5slziNmx+Ia3Z3AwMwFXVhaMZETS
         g5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FFyR56GUnLHy2geI3ziIJleBntP257KjNAIucLrVbto=;
        b=kqjg/KspZwa8h9gdpBoEboYVkwfpWz8EjDfKStPUxOSHCA5oEJd7utwPPp2gDwnAUl
         7ft1Tx3QaZTy7ndLCCWKsXKS/5P0qkV6zxZlB11dASjaj+jLkURMooTnH3QcHdk7S0/b
         CEM80+v2tjnC2o1iHtckHCvUFa6XSBI2/D8eGU+pqYEbKhiu+JPEyFwsA2MrK0IAd2Kq
         pBkn4pW13BMnJA5ZbW/SPvzzNLb969iR7eYn2pexj7c/hMbDnXnI6OfUJKK3+9Jm3f8H
         A/YjVVDipvhKvM8muTwPxGZBE2Rvv6awx1yWuop2pYDNhWF/8LgAbDMn7rzxSmOYyvIe
         L2yA==
X-Gm-Message-State: APjAAAVPAxDndF25/A3jnPACjBHe2VRnbJNRFnR0go1X6ogJ/S2yckrc
        UFwyZeK6+pMglN17TnIYU8ibt5EoECUCVqS5vmg=
X-Google-Smtp-Source: APXvYqxCy5T2qYf8AtD/5du5tJyhwcoh7sEdY75fT+3dvw6D36Axv5jy7pbWYHuZwdh4ciPM2RDUPV1BkT6JF3v8oSI=
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr39043190ejb.265.1562248632457;
 Thu, 04 Jul 2019 06:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com> <CGME20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03@epcas2p2.samsung.com>
 <20190702154419.20812-3-robdclark@gmail.com> <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
 <20190704123511.GG6569@pendragon.ideasonboard.com>
In-Reply-To: <20190704123511.GG6569@pendragon.ideasonboard.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 4 Jul 2019 06:56:56 -0700
Message-ID: <CAF6AEGvYJ6iA5B+thJuBC=pFStuhsn87xrrcWAZyroWj5xKMZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 4, 2019 at 5:35 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Thu, Jul 04, 2019 at 02:31:20PM +0200, Andrzej Hajda wrote:
> > On 02.07.2019 17:44, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add a debugfs file to show status registers.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 42 +++++++++++++++++++++++++++
> > >  1 file changed, 42 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index f1a2493b86d9..a6f27648c015 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -5,6 +5,7 @@
> > >   */
> > >
> > >  #include <linux/clk.h>
> > > +#include <linux/debugfs.h>
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/iopoll.h>
> > > @@ -109,6 +110,7 @@ struct ti_sn_bridge {
> > >     struct drm_dp_aux               aux;
> > >     struct drm_bridge               bridge;
> > >     struct drm_connector            connector;
> > > +   struct dentry                   *debugfs;
> > >     struct device_node              *host_node;
> > >     struct mipi_dsi_device          *dsi;
> > >     struct clk                      *refclk;
> > > @@ -178,6 +180,42 @@ static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
> > >     SET_RUNTIME_PM_OPS(ti_sn_bridge_suspend, ti_sn_bridge_resume, NULL)
> > >  };
> > >
> > > +static int status_show(struct seq_file *s, void *data)
> > > +{
> > > +   struct ti_sn_bridge *pdata = s->private;
> > > +   unsigned int reg, val;
> > > +
> > > +   seq_puts(s, "STATUS REGISTERS:\n");
>
> NO NEED TO SHOUT :-)
>
> > > +
> > > +   pm_runtime_get_sync(pdata->dev);
> > > +
> > > +   /* IRQ Status Registers, see Table 31 in datasheet */
> > > +   for (reg = 0xf0; reg <= 0xf8; reg++) {
> > > +           regmap_read(pdata->regmap, reg, &val);
> > > +           seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
> > > +   }
> > > +
> > > +   pm_runtime_put(pdata->dev);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +DEFINE_SHOW_ATTRIBUTE(status);
> > > +
> > > +static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
> > > +{
> > > +   pdata->debugfs = debugfs_create_dir("ti_sn65dsi86", NULL);
> >
> > If some day we will have board with two such bridges there will be a
> > problem.
>
> Could we use the platform device name for this ?

hmm, yeah, that would solve the 2x bridges issue

> > Anyway:
> >
> > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> >
> > > +
> > > +   debugfs_create_file("status", 0600, pdata->debugfs, pdata,
> > > +                   &status_fops);
> > > +}
> > > +
> > > +static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
> > > +{
> > > +   debugfs_remove_recursive(pdata->debugfs);
> > > +   pdata->debugfs = NULL;
> > > +}
> > > +
>
> You need to conditionally-compile this based on CONFIG_DEBUG_FS.

Hmm, is that really true?  Debugfs appears to be sufficently stub'd w/
inline no-ops in the !CONFIG_DEBUG_FS case

BR,
-R

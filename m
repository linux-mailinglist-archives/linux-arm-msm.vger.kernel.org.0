Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD8044AD2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 23:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730520AbfFRVRb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 17:17:31 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43035 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbfFRVRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 17:17:31 -0400
Received: by mail-oi1-f193.google.com with SMTP id w79so8854111oif.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OVaisiOXoE8CbQX92HOyrJL+g6lUDABMWhLy1INrNs8=;
        b=Oz5HV1moPPoMk0SLnChqqtEqzhvfYwLU7u/hCFBWGfivTj/kHAznEvBv4R467lgKUO
         L2o4N+QjgGqsEEMT4nhuu34XkAv6TAvuLPG4rGiFrzyjtN+WuhwAOlydPGmDrk1cHusX
         sQaGvh6JEmDt3/1c+1QEanNN00IfKCa9rHtZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OVaisiOXoE8CbQX92HOyrJL+g6lUDABMWhLy1INrNs8=;
        b=izdnhsW1R97pv2vxDocPmYj7DWxob2yEo9A3tMtTvULjbr1oIllIrpZGQA2iwcQxCW
         SqxrT27eiPWZ36tlqqke5v9J5jnoilhQDRDnrdeHkowJqroh/ajCEt36bA0n/FCbSQ9P
         SvmhZ0IzovNHDQehH3MwFfFHoR8vEGfK2WkeOok0s0bptQUxCi5krRHtZJHsFy3AKyug
         bMdGaoikK15MCs1aT8VHKJQpLpG29a+LQQ6Fys0KsPr4Zd2SvU/+RbNoaEnHvHPKu3Tx
         7GKlK1PqseSvFMJIE4x6BSF5r256+1LzdiqkHV101rd8Hbikq3VRZKho1qZKyDHEXLQe
         X+gA==
X-Gm-Message-State: APjAAAWZUaxqsiyc5kbvXxk7n5ZCjktI08ZSC0h8ETobOxkBwpSKbEKF
        pWieSpyVtF7ksGe2UznF2fRj/kAYwq0XPkUpDriJGA==
X-Google-Smtp-Source: APXvYqwM5rdsu+2tscwSovuh/8/Anb5UmSPJu6tA1nsFIQjp4jCtEseqbfenFAQRa0EWvJ+Wgrw8cDcYjC5BdexcaM0=
X-Received: by 2002:aca:ab13:: with SMTP id u19mr396863oie.127.1560892650121;
 Tue, 18 Jun 2019 14:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190618202425.15259-1-robdclark@gmail.com> <20190618202425.15259-6-robdclark@gmail.com>
 <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
In-Reply-To: <CAOCk7NoTN6JEo7B=8P=T4C3t_Xr8eQUX=KG9j4N+jXZ8Pw2f4g@mail.gmail.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 18 Jun 2019 14:17:16 -0700
Message-ID: <CAJs_Fx4ys6CsgfrLHsU_8DKmgNAB6DbF+AQaHOJzwfzMFKj-Tw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 18, 2019 at 1:44 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Tue, Jun 18, 2019 at 2:25 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Georgi Djakov <georgi.djakov@linaro.org>
> >
> > The interconnect API provides an interface for consumer drivers to
> > express their bandwidth needs in the SoC. This data is aggregated
> > and the on-chip interconnect hardware is configured to the most
> > appropriate power/performance profile.
> >
> > Use the API to configure the interconnects and request bandwidth
> > between DDR and the display hardware (MDP port(s) and rotator
> > downscaler).
> >
> > v2: update the path names to be consistent with dpu, handle the NULL
> >     path case, updated commit msg from Georgi.
> >
> > Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index 97179bec8902..eeac429acf40 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -16,6 +16,7 @@
> >   * this program.  If not, see <http://www.gnu.org/licenses/>.
> >   */
> >
> > +#include <linux/interconnect.h>
> >  #include <linux/of_irq.h>
> >
> >  #include "msm_drv.h"
> > @@ -1050,6 +1051,19 @@ static const struct component_ops mdp5_ops = {
> >
> >  static int mdp5_dev_probe(struct platform_device *pdev)
> >  {
> > +       struct icc_path *path0 = of_icc_get(&pdev->dev, "mdp0-mem");
> > +       struct icc_path *path1 = of_icc_get(&pdev->dev, "mdp1-mem");
> > +       struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator-mem");
> > +
> > +       if (IS_ERR_OR_NULL(path0))
> > +               return PTR_ERR_OR_ZERO(path0);
>
> Umm, am I misunderstanding something?  It seems like of_icc_get()
> returns NULL if the property doesn't exist.  Won't this be backwards
> incompatible?  Existing DTs won't specify the property, and I don't
> believe the property is supported on all targets.  Seems like we'll
> break things by not calling the below component_add() if the
> interconnect is not supported, specified, or the interconnect driver
> is not compiled.

hmm, right, I guess I should test this w/out the dts patch.. probably
should just revert back to the previous logic..

BR,
-R

> > +       icc_set_bw(path0, 0, MBps_to_icc(6400));
> > +
> > +       if (!IS_ERR_OR_NULL(path1))
> > +               icc_set_bw(path1, 0, MBps_to_icc(6400));
> > +       if (!IS_ERR_OR_NULL(path_rot))
> > +               icc_set_bw(path_rot, 0, MBps_to_icc(6400));
> > +
> >         DBG("");
> >         return component_add(&pdev->dev, &mdp5_ops);
> >  }
> > --
> > 2.20.1
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno

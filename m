Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B48B446E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbfFMQzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:55:15 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35195 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393037AbfFMQzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:55:15 -0400
Received: by mail-io1-f65.google.com with SMTP id m24so18489974ioo.2;
        Thu, 13 Jun 2019 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ClC0u2JGR2lSo+6Tvkb2x52kadnHao11/SSLbD6/58k=;
        b=JrNaEHWuGK31T7Uo+VSWno6hHFAJENibo1UonPm+66izBPrzhseMDm7bv7X64xM5DK
         Cw9kQc0KCnUjh4IFkW/C31Zk4kzA6mouPoQfGyg+p3mDujIALjKIKTevGWXwncMxhJwO
         m2kMdmGqR/BatXqMusdoFI5nCzADTl/eYJnHTXoEVhw1h5HEyYenJYrp+kjJoQb3v6xJ
         mOUMwPay5Dm1ubWMu/GLLAxiBdkfT+DerQmRsGvmVB4Tgr0z0KELyQqYVcHzYXJRIgy/
         iSvOID0iZKuxCkn7pAxT6UAXELNV164onq0HuVxvAytjhlCn0A1cPqeVRPVxyuBCioD9
         8QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ClC0u2JGR2lSo+6Tvkb2x52kadnHao11/SSLbD6/58k=;
        b=e73VH3RwIHHY1EyQXo8Afv5XNF3VUjZM3fSke4mZmU+lLOJKkJs9lnD2hHpvetmCkW
         O70kXcLIXwXxxOK15JzU6r2+IGImYBRazj3G/IToJSt3M9C1sYmqiZj40uhFOvrK5ovX
         dvBL/5SKGdgA8mCeK3iC293erEW03Zw28z0ZqeaBHYFlD9/pbHvtrQiuQeHG3syCE1W1
         di5eCTnwhU6lIiap9XfC4slKFfUtJeRudSwHy4ofgIu+icIi7pqvomg+U65+f6nwxNvD
         nBrq1xjWgvqcv7hh7SFjGTHVHi4pyUJmVV5VUdXFiXgMCvDVSufGi3EtdOn2LnpA0BuV
         6S3Q==
X-Gm-Message-State: APjAAAVJYRTZV3YXQ/IsepKSXHY6hArqGPIXV6jkwuKco15X/bQYdM7X
        0xF6SFK00IhaM8FxdX1RHjV+wHGZMkx/sFF6E2o=
X-Google-Smtp-Source: APXvYqylceZhLVcUp0gOO9Vg8sEwwQ2V26ZkYvdHadRA9KxZ4IFbMZeY52TIAhHmV5cKS4Wm3sFmdLPdFRRz42Unlow=
X-Received: by 2002:a5e:8e42:: with SMTP id r2mr453389ioo.305.1560444913870;
 Thu, 13 Jun 2019 09:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190613162703.986-1-tiny.windzz@gmail.com> <20190613162703.986-3-tiny.windzz@gmail.com>
 <ac67e363-70cf-af64-d634-c3b0b6d408fa@ti.com>
In-Reply-To: <ac67e363-70cf-af64-d634-c3b0b6d408fa@ti.com>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Fri, 14 Jun 2019 00:55:02 +0800
Message-ID: <CAEExFWuM+oMUKf440myr0GHAnatdzaxr=0ibFDGVXDHs6J1bzA@mail.gmail.com>
Subject: Re: [PATCH 03/10] iommu/omap: convert to SPDX license tags
To:     Suman Anna <s-anna@ti.com>
Cc:     "joro@8bytes.org" <joro@8bytes.org>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "kgene@kernel.org" <kgene@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "will.deacon@arm.com" <will.deacon@arm.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "david.brown@linaro.org" <david.brown@linaro.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "heiko@sntech.de" <heiko@sntech.de>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 14, 2019 at 12:39 AM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Yangtao,
>
> On 6/13/19 11:26 AM, Yangtao Li wrote:
> > Updates license to use SPDX-License-Identifier.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
>
> Thanks for the patch. Can you also update another related file
> while at this. Will leave it to Joerg if he prefers it as a separate
> patch, or folded into this patch.
>
> include/linux/platform_data/iommu-omap.h
>

Done.

Yangtao

> Acked-by: Suman Anna <s-anna@ti.com>
>
> regards
> Suman
>
> > ---
> >  drivers/iommu/omap-iommu-debug.c | 5 +----
> >  drivers/iommu/omap-iommu.c       | 5 +----
> >  drivers/iommu/omap-iommu.h       | 5 +----
> >  drivers/iommu/omap-iopgtable.h   | 5 +----
> >  4 files changed, 4 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/iommu/omap-iommu-debug.c b/drivers/iommu/omap-iommu-debug.c
> > index 4abc0ef522a8..55ec67a45101 100644
> > --- a/drivers/iommu/omap-iommu-debug.c
> > +++ b/drivers/iommu/omap-iommu-debug.c
> > @@ -1,13 +1,10 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >  /*
> >   * omap iommu: debugfs interface
> >   *
> >   * Copyright (C) 2008-2009 Nokia Corporation
> >   *
> >   * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #include <linux/err.h>
> > diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> > index d2fb347aa4ff..e6442876913f 100644
> > --- a/drivers/iommu/omap-iommu.c
> > +++ b/drivers/iommu/omap-iommu.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >  /*
> >   * omap iommu: tlb and pagetable primitives
> >   *
> > @@ -6,10 +7,6 @@
> >   *
> >   * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>,
> >   *           Paul Mundt and Toshihiro Kobayashi
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #include <linux/dma-mapping.h>
> > diff --git a/drivers/iommu/omap-iommu.h b/drivers/iommu/omap-iommu.h
> > index 1703159ef5af..5256e17d86a7 100644
> > --- a/drivers/iommu/omap-iommu.h
> > +++ b/drivers/iommu/omap-iommu.h
> > @@ -1,13 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> >  /*
> >   * omap iommu: main structures
> >   *
> >   * Copyright (C) 2008-2009 Nokia Corporation
> >   *
> >   * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #ifndef _OMAP_IOMMU_H
> > diff --git a/drivers/iommu/omap-iopgtable.h b/drivers/iommu/omap-iopgtable.h
> > index 01a315227bf0..871c2a38f453 100644
> > --- a/drivers/iommu/omap-iopgtable.h
> > +++ b/drivers/iommu/omap-iopgtable.h
> > @@ -1,13 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> >  /*
> >   * omap iommu: pagetable definitions
> >   *
> >   * Copyright (C) 2008-2010 Nokia Corporation
> >   *
> >   * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #ifndef _OMAP_IOPGTABLE_H
> >
>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7207943894B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Oct 2021 15:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhJXN4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Oct 2021 09:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhJXN4G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Oct 2021 09:56:06 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0308C061348
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 06:53:45 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id a17-20020a4a6851000000b002b59bfbf669so2730730oof.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0R9Z93iBRZ/l6w3xgdirgKkuLQuHRUmteBH59zZVtMs=;
        b=tyW4ENZO122iXKKtOGSaRccmri07mrxsM1wUvp8QkX686l5gIHQVcHaEom69bdgtmf
         VNcx5Rmi9qJW0aNDJ4ZC9XEg7H/gEd80I1ORhp8gqcmxC+ld+e21W6LsDQuMCcY83ZDb
         u8gEMs/F/yNRdHuhAMPaqQ7LTu5Hg0VixiEF7Nt4yjUjsIthQZykpIKIRooYJC6D09Yn
         /Mh4t5Dhskf7mdXC5vf1J5R05k9vm33dvJSjlgctJK9utiGYBBVHXYjTWyLaPzcFaSJg
         ba01yF70z1a6gracozbN1crvO5mFhDfV/PfQkwi3s8ABS1i1lOlb3DTOOjUdSQB9Jr4B
         cXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0R9Z93iBRZ/l6w3xgdirgKkuLQuHRUmteBH59zZVtMs=;
        b=N++NaLqMDJ2tjTaIgBSetX8Il4I1g6Bk3Mt1AkSeVqRvuOscXNFv1PehwwD37I4NxU
         WJ3MZHQUpYdTJ2p2UAdgoLz1IJx/mOGSQqeZlmp1ni2pmLhO6GSc/gafsz29qnNF5jyC
         8bIKhEb24C82JCwddtss2+EQ3fnq5nPDv+QV+VeXJi5aqQtnIumplvYNK/1Y6VCJ9/xk
         ziiioCskUT+dY65BVz8G9xXYgnqG8fW9nl0PDwFmMQHuJzwdvVQ00GJNsJCgrUYB/WL8
         jIS1mWtmzuxJg72I37dUqeGDhRmBWsuAQkMB8LsiAd6Tlbz3Hvjp+H4x87XxMcx714DS
         vjkA==
X-Gm-Message-State: AOAM532AbxyDxWUPxqDt2OrwGe55SYPen1OXAuCcfyTjVB+/vv+6oPwP
        UwaF2W/u4r3hHEUqGBPG54d0ICV7+kWPEI8YltVauQ==
X-Google-Smtp-Source: ABdhPJzeUx9fLUDTUuig2ua6YOcfBUTAsKj8mv/SVhEuMHzyBNCFSbKScme6+IKnR2HVXGeSr93mOAgZh0RAqS5WSYw=
X-Received: by 2002:a05:6820:1622:: with SMTP id bb34mr8309557oob.7.1635083624959;
 Sun, 24 Oct 2021 06:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-14-bhupesh.sharma@linaro.org> <f7d038b0-4e31-5f81-387b-91fc5328372e@linaro.org>
In-Reply-To: <f7d038b0-4e31-5f81-387b-91fc5328372e@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sun, 24 Oct 2021 19:23:33 +0530
Message-ID: <CAH=2NtzdV5SWahtvfyzBnJ9UXZibzH6hTAXotENu_UDMJQqQTQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/20] dma: qcom: bam_dma: Add support to initialize
 interconnect path
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

On Thu, 14 Oct 2021 at 00:46, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Bhupesh, Thara,
>
> On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> > From: Thara Gopinath <thara.gopinath@linaro.org>
> >
> > BAM dma engine associated with certain hardware blocks could require
> > relevant interconnect pieces be initialized prior to the dma engine
> > initialization. For e.g. crypto bam dma engine on sm8250. Such requirement
> > is passed on to the bam dma driver from dt via the "interconnects"
> > property.  Add support in bam_dma driver to check whether the interconnect
> > path is accessible/enabled prior to attempting driver intializations.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > [Make header file inclusion alphabetical]
> > Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> > ---
> >   drivers/dma/qcom/bam_dma.c | 16 +++++++++++++++-
> >   1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > index c8a77b428b52..fc84ef42507d 100644
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> > @@ -26,6 +26,7 @@
> >   #include <linux/kernel.h>
> >   #include <linux/io.h>
> >   #include <linux/init.h>
> > +#include <linux/interconnect.h>
> >   #include <linux/slab.h>
> >   #include <linux/module.h>
> >   #include <linux/interrupt.h>
> > @@ -392,6 +393,7 @@ struct bam_device {
> >       const struct reg_offset_data *layout;
> >
> >       struct clk *bamclk;
> > +     struct icc_path *mem_path;
> >       int irq;
> >
> >       /* dma start transaction tasklet */
> > @@ -1284,9 +1286,18 @@ static int bam_dma_probe(struct platform_device *pdev)
> >               return ret;
> >       }
> >
> > +     /* Ensure that interconnects are initialized */
> > +     bdev->mem_path = of_icc_get(bdev->dev, "memory");
>
> I suppose devm_of_icc_get() usage could leave the error path and
> bam_dma_remove() intact.

Thanks, I will fix this in the v5.

Regards,
Bhupesh

> > +
> > +     if (IS_ERR(bdev->mem_path)) {
> > +             ret = PTR_ERR(bdev->mem_path);
> > +             dev_err(bdev->dev, "failed to acquire icc path %d\n", ret);
> > +             goto err_disable_clk;
> > +     }
> > +
> >       ret = bam_init(bdev);
> >       if (ret)
> > -             goto err_disable_clk;
> > +             goto err_icc_path_put;
> >
> >       tasklet_setup(&bdev->task, dma_tasklet);
> >
> > @@ -1371,6 +1382,8 @@ static int bam_dma_probe(struct platform_device *pdev)
> >               tasklet_kill(&bdev->channels[i].vc.task);
> >   err_tasklet_kill:
> >       tasklet_kill(&bdev->task);
> > +err_icc_path_put:
> > +     icc_put(bdev->mem_path);
> >   err_disable_clk:
> >       clk_disable_unprepare(bdev->bamclk);
> >
> > @@ -1406,6 +1419,7 @@ static int bam_dma_remove(struct platform_device *pdev)
> >
> >       tasklet_kill(&bdev->task);
> >
> > +     icc_put(bdev->mem_path);
> >       clk_disable_unprepare(bdev->bamclk);
> >
> >       return 0;
> >
>
> --
> Best wishes,
> Vladimir

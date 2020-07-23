Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872E622B4FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 19:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgGWRhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 13:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgGWRhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 13:37:46 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A0AC0619DC
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 10:37:46 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l63so3452523pge.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 10:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qnuIrZu2OWZ5kvibJg3aLSShYvtv8J4Cmi01ZuM4HUc=;
        b=PQL2Dzu+NyxvneZO+9riZM5BPQljQd5y0QHCqDonnE9YhEMxSIxU1BxGHIgflOvBgs
         aVM1ujTMLTpWe2xuZaJF0T90dTxI4S4fTu+fomJ9guXal5MCiQwuzFh+a9venPA8cruV
         I5+/M8kERmuifFpR2Y+CLeFkHpLbevIG8qmQu1qa0rxljQ8fiJYr6fisZklFa0WAjrWo
         ZSPFB3DurMQ1rcxRADLINxxFeRWWMIT1q6O6IIPbVD1KmIUzniZj1j4QtlKzWeS+f5M6
         NSWJEXusM+uVG0MzzQkqW4aBmpuhAyXMZWUcCOvREVIDcp500g0r42e2W9hfW5XmiToQ
         K41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qnuIrZu2OWZ5kvibJg3aLSShYvtv8J4Cmi01ZuM4HUc=;
        b=HxTu2FnDkQvHWk+Z/pUpgv+2YbawLjf0sKyvEhPJk/wrbqZ54UxAG9V2rluHireKnE
         t4MrILOdp/19m3goTQS4rpecqjMUm6wcPYFTrEKaHJpO8tNzMryp+f/IKAURWpBi7nrX
         20t+c0jhoXQ8eVqYGFK4fx3ZubToY5q+NXishAqha9mPAYNLLsNfLa4FYh8U8sCXvEsn
         XYMDubMwa4pAKQdZRF64z3p9ONzzAafXUcojTFZSUF2Zm0Z9Vuf0x5kta6B/4CKmRGsp
         rk2fl9XgTFPmYylbOf8cIFREln/uO6SdnRTnzIwrIjjmZfduikuMXDPg9XytfxkX+TiA
         U9Sg==
X-Gm-Message-State: AOAM533Dq3+p+MWeDHWiOPM+jY55cuUtD+AR5Xt1EZiravBVj4ppBi1r
        MDHuv2VxeZrWynRVoLLZcz0H9tLwLfkkDn4q3pErFw==
X-Google-Smtp-Source: ABdhPJzFd1N2krZxRMK3NLvXZSLLCFIMX7xBovURQlHaZx+irb05W06lmdHRV6Pg81rYWDbD3PvqpSO/m7aTpaGtEeM=
X-Received: by 2002:a63:fc01:: with SMTP id j1mr5228706pgi.0.1595525864945;
 Thu, 23 Jul 2020 10:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-5-saravanak@google.com> <1595504763.31289.5.camel@mtkswgap22>
In-Reply-To: <1595504763.31289.5.camel@mtkswgap22>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 23 Jul 2020 10:37:09 -0700
Message-ID: <CAGETcx-BWm9TPZix7WvVfe+BwHi=9-Bq2xJBLEK-dWH+xzpYxA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] irqchip/mtk-cirq: Convert to a platform driver
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 23, 2020 at 4:46 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> On Fri, 2020-07-17 at 17:06 -0700, Saravana Kannan wrote:
> > This driver can work as a platform driver. So covert it to a platform
> > driver.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  drivers/irqchip/irq-mtk-cirq.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
> > index 69ba8ce3c178..62a61275aaa3 100644
> > --- a/drivers/irqchip/irq-mtk-cirq.c
> > +++ b/drivers/irqchip/irq-mtk-cirq.c
> > @@ -295,4 +295,6 @@ static int __init mtk_cirq_of_init(struct device_node *node,
> >       return ret;
> >  }
> >
> > -IRQCHIP_DECLARE(mtk_cirq, "mediatek,mtk-cirq", mtk_cirq_of_init);
> > +IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_cirq)
> > +IRQCHIP_MATCH("mediatek,mtk-cirq", mtk_cirq_of_init)
> > +IRQCHIP_PLATFORM_DRIVER_END(mtk_cirq)
>
> Hi Saravana,
>
> Looks good for me to convert cirq to a platform.
> Thank you for your patch.
>
> Reviewed-by: Hanks Chen <hanks.chen@mediatek.com>

Hi Hanks,

Thanks for the Reviewed-by on both patches.

-Saravana

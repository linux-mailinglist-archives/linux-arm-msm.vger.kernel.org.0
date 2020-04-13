Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B9A1A6E2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 23:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388948AbgDMVSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 17:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388814AbgDMVSV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 17:18:21 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5425DC0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:18:21 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 71so8389563qtc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cMStv6/H6fKdh3eOej5IbI92bnMSzwFQyeN+60omz28=;
        b=E6azBBvnm4EbB/a9ZuKz2TSlug3KWPAiix5Rw5gOLRMxggeZR1Vyib7CqdzmSOZspF
         8Fpa8rKNOZR17A9UtkUQhZN6tPJCgwsCKCy/oZrkwX1OCq8nPE/G/dpst0z3O1svY9Mc
         KjwK947vOsj47uLZch2bcTR0/UPEH28HsxFK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cMStv6/H6fKdh3eOej5IbI92bnMSzwFQyeN+60omz28=;
        b=A35/Jfp3YQlRknY+/pCIlBeGH4zo5pmeiGZFSUlTDskK2OiG1WvRwox3+VU9yIeJT7
         yWxiiVqN6kbzT+lMelwEygcDylJiqUzOYfiNBsHnGB/QmBpB7qXBn5b/egLcYR+dWNtx
         epbFGJ7MqdO880KRczHrSf6zpiGrzYbrJbWqxntCUobzxwC6mioP5xeCqf2IFpdIdO31
         X/Qv3rQJ6P5Iy159U5keKqy70dWxW7tFjWE/sY6C+hMBeNvoOYAl2U5P8J7X57lif0Cs
         aeym5bQDtkSC0xiTcJyKVznzSI3tXauI1LMn38omdhThCv9q2XJguCgohgyd1A4yDlOR
         I2FA==
X-Gm-Message-State: AGi0PuZfZVh6ebG3Rjpi8XgJRfLGM1ylr4i/Ux7NzhHWuJ8yzh6BSM/D
        otJ3ItpFGoyp1pUrtXU508MDZIaTBCo=
X-Google-Smtp-Source: APiQypICCG5jYP8kCxAmPgUAXty3VhdBEq+m8+wpv8WKC7YPCLJ4aTCVdkdyu/mxrqaWVvMH3W9Tgg==
X-Received: by 2002:ac8:6d06:: with SMTP id o6mr13610901qtt.165.1586812700138;
        Mon, 13 Apr 2020 14:18:20 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id n92sm9412407qtd.68.2020.04.13.14.18.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 14:18:19 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id bu9so5147061qvb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 14:18:18 -0700 (PDT)
X-Received: by 2002:a67:7141:: with SMTP id m62mr13509743vsc.73.1586812698026;
 Mon, 13 Apr 2020 14:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200413170415.32463-1-dianders@chromium.org> <20200413100321.v4.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
 <6566837cdb0e8db522c53daba8baf49c2ca79376.camel@perches.com>
In-Reply-To: <6566837cdb0e8db522c53daba8baf49c2ca79376.camel@perches.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Apr 2020 14:18:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOzVmwpoxd4QTSPiG9nt=YjUYZdgmK=SKU6vTFWcf=bw@mail.gmail.com>
Message-ID: <CAD=FV=UOzVmwpoxd4QTSPiG9nt=YjUYZdgmK=SKU6vTFWcf=bw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] drivers: qcom: rpmh-rsc: Clean code
 reading/writing TCS regs/cmds
To:     Joe Perches <joe@perches.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 13, 2020 at 11:21 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-04-13 at 10:04 -0700, Douglas Anderson wrote:
> > This patch makes two changes, both of which should be no-ops:
> >
> > 1. Make read_tcs_reg() / read_tcs_cmd() symmetric to write_tcs_reg() /
> >    write_tcs_cmd().
> >
> > 2. Change the order of operations in the above functions to make it
> >    more obvious to me what the math is doing.  Specifically first you
> >    want to find the right TCS, then the right register, and then
> >    multiply by the command ID if necessary.
>
> Though these operations are only used a couple times, perhaps
> it'd be useful to have static inlines for the calcs.
>
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> []
> > @@ -67,28 +67,33 @@
> >  #define CMD_STATUS_ISSUED            BIT(8)
> >  #define CMD_STATUS_COMPL             BIT(16)
>
> Maybe something like:
>
> static inline void __iomem *
> tcs_reg_addr(struct rsc_drv drv, int reg, int tcs_id)
> {
>         return drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg;
> }
>
> static inline void __iomem *
> tcs_cmd_addr(struct rsc_drv drv, int reg, int tcs_id, int cmd_id)
> {
>         return tcs_reg_addr(drv, reg, tcs_id) + RSC_DRV_CMD_OFFSET * cmd_id;
> }
>
> > -static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
> > +static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
> >  {
> > -     return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> > +     return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
> >                            RSC_DRV_CMD_OFFSET * cmd_id);
>
>         return readl_relaxed(tcs_cmd_addr(drv, reg, tcs_id, cmd_id));
>
> etc...

I won't object if you really feel passionately about making that
change but at this point it doesn't add tons of extra readability for
me personally.  I was kinda hoping that Maulik and my series could
land in the next few days since having 16 patches outstanding gets a
bit unwieldy.  I'd rather not send out another spin of my series at
this point since it's just a bunch more churn in everyone's inboxes.
Maybe after they land you can post that as a follow-up cleanup?

-Doug

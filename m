Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDE96162DC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgBRSIP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:08:15 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35033 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgBRSIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:08:14 -0500
Received: by mail-ua1-f68.google.com with SMTP id y23so7815166ual.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6prP7ysYWXxngsabwCLZ6Q8WNjavjjlVNgaAaw12qdY=;
        b=fx2lGVQKk26pPAfyKcAsRSrGbTuNO3q08Z07hJsNy8c8SrZ3VTpeMJeE2T/XJFLDVv
         7UH+54XwBkACySAz7ob046rH5LmcV/kHRLOptqkAEZ0gzx23a15q/uuupl1GzPoEApyn
         EaEl+yQBStY3BALT+DDkCz4CxqvytqLNl2SJMUoYbCsLSGVazlljVeOO033WQfgbkco2
         8Dr0PL76qPJKtBpvSZU3vGh8OGo+HlBfjG39ijpu7SaZIVl2sA5lj4OpFFvRDyNyspX9
         StNgFWnBH3VvWv3Xs2wIUScxDGTAzPqKuIjSZVHVsBNYNxix4MZ9n1+X5+uWcD08A34D
         zn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6prP7ysYWXxngsabwCLZ6Q8WNjavjjlVNgaAaw12qdY=;
        b=WYsjNnvp32iugon4IucuCi/kfW086raPcqt+JNTEymuCrGpLneiGnKG2d6EMgWUtrw
         u5/AxO5RICXjS+p1/4SZkdflgClyndtsbUBdpfRDulb3t3djzkSkLI7jdsQ4iJvujNvN
         2AvZV3iAYhgVD4FRc9VCSUtgH4E5JUon5pU4NFX5qZYd+d99uM7E+bXaYxDCwRDeAHZj
         F3pkIYzYX9I0lY0VjEf7Zka2tzSsR8Nrl5ILXAvwxzdrTTYnA5eMtEtVZc6z/6xrZvZe
         x+seMhJ+E+1NjuRIcy71iThPzCsbiig516hye66egoCjxQiGD0TWJtU3t0eECxkFJVX7
         qBsg==
X-Gm-Message-State: APjAAAWLU8S+uaMaBka35+0p6vXLKnu42OIglZdhPF1kTyJoXnFlyK4X
        T1TfbceOIVUU8OE0rHdqwLxlr07FjgsAk80KbrPkzQ==
X-Google-Smtp-Source: APXvYqxXSevy633uPEdoHouYMiU2Bdtcao6EqdQuP5/fTrXmIAkhkpSTU43HjsJNmf1C5O1GSxH/32eMYQ2rqOkgTGo=
X-Received: by 2002:ab0:2358:: with SMTP id h24mr11397467uao.67.1582049292153;
 Tue, 18 Feb 2020 10:08:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580390127.git.amit.kucheria@linaro.org>
 <a1f7d34b7281c4e40307f67fce9a5c435ee5e7eb.1580390127.git.amit.kucheria@linaro.org>
 <20200203184213.GG3948@builder>
In-Reply-To: <20200203184213.GG3948@builder>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 18 Feb 2020 23:38:00 +0530
Message-ID: <CAHLCerPb+TDhgAYmjoO7-r9G+PvqEyfmj_QktaVP5HbkS_wvNw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drivers: thermal: tsens: Add watchdog support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 4, 2020 at 12:12 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 30 Jan 05:27 PST 2020, Amit Kucheria wrote:
>
> > TSENS IP v2.3 onwards adds support for a watchdog to detect if the TSENS
> > HW FSM is stuck. Add support to detect and restart the FSM in the
> > driver. The watchdog is configured by the bootloader, we just enable the
> > watchdog bark as a debug feature in the kernel.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  drivers/thermal/qcom/tsens-common.c | 43 +++++++++++++++++++++++++++++
> >  drivers/thermal/qcom/tsens-v2.c     | 10 +++++++
> >  drivers/thermal/qcom/tsens.h        | 14 ++++++++++
> >  3 files changed, 67 insertions(+)
> >
> > diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> > index 9d1594d2f1ed..ee2414f33606 100644
> > --- a/drivers/thermal/qcom/tsens-common.c
> > +++ b/drivers/thermal/qcom/tsens-common.c
> > @@ -377,6 +377,26 @@ irqreturn_t tsens_critical_irq_thread(int irq, void *data)
> >       struct tsens_irq_data d;
> >       unsigned long flags;
> >       int temp, ret, i;
> > +     u32 wdog_status, wdog_count;
> > +
> > +     if (priv->feat->has_watchdog) {
> > +             ret = regmap_field_read(priv->rf[WDOG_BARK_STATUS], &wdog_status);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             if (wdog_status) {
> > +                     /* Clear WDOG interrupt */
> > +                     regmap_field_write(priv->rf[WDOG_BARK_CLEAR], 1);
> > +                     regmap_field_write(priv->rf[WDOG_BARK_CLEAR], 0);
> > +                     ret = regmap_field_read(priv->rf[WDOG_BARK_COUNT], &wdog_count);
> > +                     if (ret)
> > +                             return ret;
> > +                     if (wdog_count)
> > +                             dev_dbg(priv->dev, "%s: watchdog count: %d\n", __func__, wdog_count);
> > +
> > +                     return IRQ_HANDLED;
>
> Patch looks good, but would is make sense to fall through and handle
> critical interrupts as well (both in positive and error cases of this
> hunk)?

Yes, it makes sense. I'll remove the return IRQ_HANDLED and add a
comment instead.

> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn

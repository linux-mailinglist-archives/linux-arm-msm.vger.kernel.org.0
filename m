Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCD428DCDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387869AbgJNJUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731054AbgJNJUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:20:43 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6C2C0613A9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:38:29 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id j15so447317uaa.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iaXaNW2aV97D5ctXO138LriNxFwgSSTpbL/SoLhTQI0=;
        b=lmrB2YzCp8StLVkt9dtcv9/wpvpxiyXtb0Iz9iRWltXMcOEpwym2EHbwSvmAaX5CXS
         D2Qm+WjJU2LmSziIQxPeS7HFHoDRRwE5FZhOHuV5qPOQ1mcuxxjhHosaXwqXkdjlDKs/
         W5cZvBus9lgLJgunyaPlGy4gGK6mZnxF6VBeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iaXaNW2aV97D5ctXO138LriNxFwgSSTpbL/SoLhTQI0=;
        b=E8s0poY9RzfdGG75MDVLpGeYQrgtq47cfo13D50e5rheRaFutBNxY0C6UHL2UHLfUX
         bXTODrRPfq5rDUXV7Cuh4RcloZbb8VMgTVFFVYn+H4p73Vcjn5HgYpIC8CCPDKf2908w
         U8m3AwphYhHwbF9tMgclptzL0wGZ/ma24gphnLyssmqu+Qx4oUbWDMVP75ToW7fxklRD
         TEuqo1+XcdPGZsvbmNj3agmEd/xCWEli62J8FSBYHlpsSwsYhkJ9nCQFfgQE4mfmyvh/
         YtS0bmI3kJrQJIK9+6FqUngzsxjc3HL/NdrzbNwm6td0plmghd1MjOlsVnEb9sM6LStk
         9Zfg==
X-Gm-Message-State: AOAM533QUUbdYEEmPAXCYGhZqC3H1OTT89xEJAUBHBrW9xNh7NuZhLTc
        SkOVkAWTRTynOE39rwEF77Er9HW2MWAgrw==
X-Google-Smtp-Source: ABdhPJyJdfCR8spqEpb7dkeKvJBcfAV7Ref7fHA2NbC13cuMX7KfSP7O43he1uPmM/KtplnJdxPcFQ==
X-Received: by 2002:ab0:2982:: with SMTP id u2mr1603008uap.68.1602625108299;
        Tue, 13 Oct 2020 14:38:28 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id u15sm169843vsp.9.2020.10.13.14.38.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 14:38:27 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id f15so448086uaq.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:38:27 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr1686577uad.104.1602625107073;
 Tue, 13 Oct 2020 14:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201008225235.2035820-1-dianders@chromium.org>
 <20201008155154.3.I646736d3969dc47de8daceb379c6ba85993de9f4@changeid> <160228992470.310579.7455188858203154687@swboyd.mtv.corp.google.com>
In-Reply-To: <160228992470.310579.7455188858203154687@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Oct 2020 14:38:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9Jr0AKy1ovhQeUbc0O8SMK5k7XJomdRowGUMZ5X0Oxg@mail.gmail.com>
Message-ID: <CAD=FV=U9Jr0AKy1ovhQeUbc0O8SMK5k7XJomdRowGUMZ5X0Oxg@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: qcom: geni: Optimize select fifo/dma mode
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 9, 2020 at 5:32 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-10-08 15:52:35)
> > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > index 751a49f6534f..746854745b15 100644
> > --- a/drivers/soc/qcom/qcom-geni-se.c
> > +++ b/drivers/soc/qcom/qcom-geni-se.c
> > @@ -266,49 +266,53 @@ EXPORT_SYMBOL(geni_se_init);
> >  static void geni_se_select_fifo_mode(struct geni_se *se)
> >  {
> >         u32 proto = geni_se_read_proto(se);
> > -       u32 val;
> > +       u32 val, val_old;
> >
> >         geni_se_irq_clear(se);
> >
> > -       val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> >         if (proto != GENI_SE_UART) {
> > +               val_old = val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> >                 val |= M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN;
> >                 val |= M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
> > -       }
> > -       writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
> > +               if (val != val_old)
> > +                       writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
> >
> > -       val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
> > -       if (proto != GENI_SE_UART)
> > -               val |= S_CMD_DONE_EN;
> > -       writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
> > +               val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
>
> Can we use the val_old trick here too?
>
> > +               if (!(val & S_CMD_DONE_EN))
> > +                       writel_relaxed(val | S_CMD_DONE_EN,
>
> Because this val | S_CMD_DONE_EN thing is just hard to read :/

This is done in v2.  Thanks for your review!

-Doug

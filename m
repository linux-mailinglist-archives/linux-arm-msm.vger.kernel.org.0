Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C071D2EC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgENLvF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgENLvF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:51:05 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60265C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 04:51:05 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id c187so654517ooc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 04:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cmu4YBAvToliFfVDxWezHK86Ml4PH9h8T7/JXeAmCJ4=;
        b=nLRO8G6FIBf9L+JTs57c/5HLTs2IGDh6RfDLTrlqsfZ4Y5xnO3QIRXBsY8O3mbds5W
         aMzUhZ7DRuDa08RO1VMFv5matROJEvlY0AHZj6nB6XBeM9ddd7pRekdkOnKVsyGA1+zv
         QSE9mRl1UjVeLqFTlTGMylOpBSQddi4BhUpdF5nh5vv6+yVMpq9Nx1B3hppV5rGL8CGR
         5smct6dgZDV1FUPAUmiuxCkCJZS2FlPb3zQuIJeu4iWRTrk27GyzNEWlBzMCJqRGIH/l
         KWBjujikL4fqPR0FIkQdi0uKIBAw6CdPIrdDhLzMs6oj1Q3npjB5Oa4jN1mQmFm7RT0O
         c+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmu4YBAvToliFfVDxWezHK86Ml4PH9h8T7/JXeAmCJ4=;
        b=uPnBr5incavE36JEHH6Y8pjvbY4/DTLL1rFDq3C1ShKY1cyDIRnB7eNnNRxMppF1QA
         rwlbEfv/Np7ynZZYl2HpTI3GVusvWYOmyK/YDlnbVkYx4M2nffCWx17V5QWmlajdTVaM
         abvZ3uZNyosIvT3iDsVo8IBTd5OsGi7JsxOXQq21FeceyyDuwy5fDJcqMBj5+ZXaEiDQ
         Fg6ReGTrm43KbZY5fDJulnvrmCK12TGBWdSo5DQCPvQZRuk5B2aMx83d+6PtpgnZU+Sq
         Afipf3M3xMFXbAw0fz4jsZba1yTtOUzn2cl965AC9j0qlJMoKD8BYuHDHP27jlC0JOqE
         vUrg==
X-Gm-Message-State: AOAM530uLqHcJ/7eGJIxJKEOgzcaAtJp14pa6UwgMfoxBb4sOTbFnNnJ
        s2zy1nJaH0p058h+/WRiUy/nJTE9w0bTKkBRiauawpUhUEkr4w==
X-Google-Smtp-Source: ABdhPJwi768XB+CazWxT5hYz1aNguKPDsIEcNgh+EmH5hm/Rc5enKl91gVcVBT3HBzucHTUyzTL+pmJixYK3SgaRBdU=
X-Received: by 2002:a4a:b4c1:: with SMTP id g1mr3275917ooo.58.1589457064720;
 Thu, 14 May 2020 04:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-5-sumit.semwal@linaro.org> <20200511104922.GD8216@sirena.org.uk>
In-Reply-To: <20200511104922.GD8216@sirena.org.uk>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 14 May 2020 17:20:53 +0530
Message-ID: <CAO_48GHXNYT7KT+7U_TNT5GtensREckKEVhD3nBTriaAePAr=A@mail.gmail.com>
Subject: Re: [v2 4/4] regulator: qcom: labibb: Add SC interrupt handling
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mark,

Thanks for the review comments.

On Mon, 11 May 2020 at 16:19, Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, May 09, 2020 at 02:12:00AM +0530, Sumit Semwal wrote:
>
> > +static irqreturn_t labibb_sc_err_handler(int irq, void *_reg)
> > +{
> > +     int ret, count;
> > +     u16 reg;
> > +     u8 sc_err_mask;
> > +     unsigned int val;
> > +     struct labibb_regulator *labibb_reg = (struct labibb_regulator *)_reg;
> > +     bool in_sc_err, reg_en, scp_done = false;
> > +
> > +     if (irq == labibb_reg->sc_irq)
> > +             reg = labibb_reg->base + REG_LABIBB_STATUS1;
> > +     else
> > +             return IRQ_HANDLED;
>
> Why would we be registering the interrupt handler when it's not valid?
Agreed, will correct.

Best,
Sumit.

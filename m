Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D8A2D6D96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 02:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389827AbgLKBbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 20:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732238AbgLKBbQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 20:31:16 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629CDC0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 17:30:31 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id q10so3943836vsr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 17:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6/ui+brALIzzHODJtRub5Kr0q2VzzsFb10HmnLjtN8=;
        b=QS7Uv/yM0PRtQyeFf//WFwiV+ogCjXWtV0Cz0aGpQQz5sajWjgEyunawPz0Ia792Nk
         D+metFn6VqI5QxM+8vxma+5Wpdm8nYEBWvcR/lQfCuEL44yL3RDRKE2+YnGR22RGK50J
         kB/stKnVWYa5capy2q0L/hUYWNbUR4wXO7mdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6/ui+brALIzzHODJtRub5Kr0q2VzzsFb10HmnLjtN8=;
        b=PBXqixzsDcleWEzoTEeRW9eCTSUwwI2i6SstXLVMMl4FuBLZZDtqk0KkF8RBQA4Skk
         ZncadKFCfM/yF03UYyzpCiCpv0k1O4MIgD16GRnFRYEH2nxlnlOx/sH3XsQDmoEuspP8
         WWutb/7taI57PdWOKG3n+qx1EfidB9gOpIXKlHYWg7IZnc8jkS3frEHSeFVrpGrxhmKg
         ix6RT+NTsdXkc7gtqeO+HSoigiTs3gFOPdzMuwXVUlUKxjkHOwptH6kD47bPIZpzFNDw
         pd98v48cdqc2tppRU6vwrnbDThSSXKJEYt1yyu6XA8ESRU36zLgevT5MZyj7V3T2T9Fk
         NkKw==
X-Gm-Message-State: AOAM530zMZOmNR2u7B8b4ksDl2AXFJ1+ZsrzbkDpgoWfEbAaXJEXC8HK
        3TBq70eE9PvSfLr3ZFBAV5im/SS+p2wmgA==
X-Google-Smtp-Source: ABdhPJxG93Thx2OPhcaPmjn7KR4dzaPHe6VtHr6GlDpHBwuDuetVJ5w0/uvTWi7YRAZrMJuHuysINg==
X-Received: by 2002:a67:fe85:: with SMTP id b5mr11044392vsr.19.1607650230319;
        Thu, 10 Dec 2020 17:30:30 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id e19sm751017vsp.20.2020.12.10.17.30.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 17:30:29 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id e15so2464597vsa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 17:30:29 -0800 (PST)
X-Received: by 2002:a05:6102:21c4:: with SMTP id r4mr11825359vsg.37.1607650229131;
 Thu, 10 Dec 2020 17:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20201203074459.13078-1-rojay@codeaurora.org> <CAD=FV=XKyXnjsM4iS-ydRWBnmYMojPOaYAdYhOkxkPTCQf0RLQ@mail.gmail.com>
 <160757022002.1580929.8656750350166301192@swboyd.mtv.corp.google.com>
 <CAD=FV=WtU3cnRe6pDKFMA9_0cnQFtSOyohY_bJwZObK+KrbhVQ@mail.gmail.com>
 <160764107797.1580929.14768824290834396298@swboyd.mtv.corp.google.com>
 <CAD=FV=WuQjKC6GHy8d2nuqS-fgsUfxYrJosg3eyC9JU1FPCcjw@mail.gmail.com>
 <160764316821.1580929.18177257779550490986@swboyd.mtv.corp.google.com>
 <CAD=FV=WvG085orLqnvg9WUobL7iyxwgoxh-8RvOaRdi9rLeDUg@mail.gmail.com>
 <160764785500.1580929.4255309510717807485@swboyd.mtv.corp.google.com>
 <CAD=FV=VD78fmSRciFf38AbZG=EFPzDiT_e7QkEC08zA9iL1vTw@mail.gmail.com> <160764967649.1580929.3992720095789306793@swboyd.mtv.corp.google.com>
In-Reply-To: <160764967649.1580929.3992720095789306793@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 17:30:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xgw+33pCycHyaMPsk64Qs+oh8e-RtJaM1yn0F27qZRVQ@mail.gmail.com>
Message-ID: <CAD=FV=Xgw+33pCycHyaMPsk64Qs+oh8e-RtJaM1yn0F27qZRVQ@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Fix NULL pointer access in geni_spi_isr
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 10, 2020 at 5:21 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > > I guess I'm not convinced that the hardware is so bad that it cancels
> > > and aborts the sequencer, raises an irq for that, and then raises an irq
> > > for the earlier rx/tx that the sequencer canceled out. Is that
> > > happening? It's called a sequencer because presumably it runs a sequence
> > > of operations like tx, rx, cs change, cancel, and abort. Hopefully it
> > > doesn't run them out of order. If they run at the same time it's fine,
> > > the irq handler will see all of them and throw away reads, etc.
> >
> > Maybe answered by me explaining that I'm worried about the case where
> > "abort" times out (and thus the "done" from the abort is still
> > pending).
> >
> > NOTE: I will also assert that if we send the "abort" then it seems
> > like it has a high likelihood of timing out.  Why do I say that?  In
> > order to even get to sending the "abort", it means:
> >
> > a) The original transfer timed out
> >
> > b) The "cancel" timed out.  As you can see, if the "cancel" doesn't
> > time out we don't even send the "abort"
> >
> > ...so two things timed out, one of which we _just_ sent.  The "abort"
> > feels like a last ditch effort.  Might as well try it, but things were
> > in pretty sorry shape to start with by the time we tried it.
> >
>
> Yeah and so if it comes way later because it timed out then what's the
> point of calling synchronize_irq() again? To make the completion
> variable set when it won't be tested again until it is reinitialized?

Presumably the idea is to try to recover to a somewhat usable state
again?  We're not rebooting the machine so, even though this transfer
failed, we will undoubtedly do another transfer later.  If that
"abort" interrupt comes way later while we're setting up the next
transfer we'll really confuse ourselves.

I guess you could go the route of adding a synchronize_irq() at the
start of the next transfer, but I'd rather add the overhead in the
exceptional case (the timeout) than the normal case.  In the normal
case we don't need to worry about random IRQs from the past transfer
suddenly showing up.

-Doug

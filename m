Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6E32D6D54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 02:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394847AbgLKBWd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 20:22:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394780AbgLKBV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 20:21:59 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4A5C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 17:21:18 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id p4so5941590pfg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 17:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=pfg1nfMsIxARt4cwJhUSe5jtXr5SrSeoRAuxALV7fQQ=;
        b=NNYsZSDZGrBuMC0K/HpZkM3vu59Oj3VjPBXGQd0fc7yf+4fWn2sxER2+M3U1MRl0RE
         8PDdKapc1s31lYi+cjafM+0mK2GZ5GByBsoFUvSKlTKU+UUZPZ0cHVr54Q3D/T3Iae+Z
         Uk53MAYJuYELYIYyJeY773zQNxsXWsTzXzN4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=pfg1nfMsIxARt4cwJhUSe5jtXr5SrSeoRAuxALV7fQQ=;
        b=Swsmqk5Ur+eLJaT00vLGjHo+2awISGayMSzigUfDhmDDabwFbsMNlPcombRQ6jo9ff
         FNmL0r3a29YJPIeM4Mx5g3OT4thHHGzQPaJ/jR09z8S1NNenkxxn7kVQLiwuwIKl4RI6
         ecn++NgBeCCGSbnvm2BGlg8HrP5az2W8zj+PoUgOwEwYcVzLejc+JHq9qnW6LR3JojHO
         uq3vktcQe/p5bf3OwLT3K/ltVstXxA36l0p/t6qpHX3dihEfahcchQG/Ccdk+nKMYmGk
         ji/die0pLgTix05NdFI/tARxD6jdrII1e5seFz3waLkujzVkaxtQieYGsUWWPmHucjzB
         74ww==
X-Gm-Message-State: AOAM5315eLwIzTuEWqJEGa+wkPcPnSRn5Y+m8A/IVKZ98x1GQ21hZKQA
        wkZ+J4e4McmRechttpY5cJncFA==
X-Google-Smtp-Source: ABdhPJxlHxsj/7g9NiPVSrAWsGu/6WNe9PqKSzLrBe0ctu2F0WDHqXUsou4UhuaK5E8pSAl29l8qEQ==
X-Received: by 2002:a63:f443:: with SMTP id p3mr9174462pgk.40.1607649678434;
        Thu, 10 Dec 2020 17:21:18 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id h8sm7668604pfk.71.2020.12.10.17.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 17:21:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VD78fmSRciFf38AbZG=EFPzDiT_e7QkEC08zA9iL1vTw@mail.gmail.com>
References: <20201203074459.13078-1-rojay@codeaurora.org> <CAD=FV=XKyXnjsM4iS-ydRWBnmYMojPOaYAdYhOkxkPTCQf0RLQ@mail.gmail.com> <160757022002.1580929.8656750350166301192@swboyd.mtv.corp.google.com> <CAD=FV=WtU3cnRe6pDKFMA9_0cnQFtSOyohY_bJwZObK+KrbhVQ@mail.gmail.com> <160764107797.1580929.14768824290834396298@swboyd.mtv.corp.google.com> <CAD=FV=WuQjKC6GHy8d2nuqS-fgsUfxYrJosg3eyC9JU1FPCcjw@mail.gmail.com> <160764316821.1580929.18177257779550490986@swboyd.mtv.corp.google.com> <CAD=FV=WvG085orLqnvg9WUobL7iyxwgoxh-8RvOaRdi9rLeDUg@mail.gmail.com> <160764785500.1580929.4255309510717807485@swboyd.mtv.corp.google.com> <CAD=FV=VD78fmSRciFf38AbZG=EFPzDiT_e7QkEC08zA9iL1vTw@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Fix NULL pointer access in geni_spi_isr
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        msavaliy@qti.qualcomm.com
To:     Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Dec 2020 17:21:16 -0800
Message-ID: <160764967649.1580929.3992720095789306793@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-12-10 17:04:06)
> On Thu, Dec 10, 2020 at 4:51 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > I'm worried about the buffer disappearing if spi core calls handle_err()
> > but the geni_spi_isr() handler runs both an rx and a cancel/abort
> > routine. That doesn't seem to be the case though so it looks all fine.
>=20
> It would be pretty racy if that was the case.  Until it calls
> handle_timeout() we're still free to write to that buffer, right?

Right I don't see any badness here.

>=20
>=20
> > > If we want to try to do better, we can do timeout handling ourselves.
> > > The SPI core allows for that.
> > >
> > >
> > > > So why don't we check for cur_xfer being NULL in the rx/tx handling
> > > > paths too and bail out there? Does the FIFO need to be cleared out =
in
> > > > such a situation that spi core thinks a timeout happened but there'=
s RX
> > > > data according to m_irq? Do we need to read it all and throw it awa=
y? Or
> > > > does the abort/cancel clear out the RX fifo?
> > >
> > > I don't know for sure, but IMO it's safest to read anything that's in
> > > the FIFO.  It's also important to adjust the watermark in the TX case.
> > > The suggestions I provided in my original reply (#2 and #3) handle
> > > this and are plenty simple.
> > >
> > > As per my original reply, though, anything we do in the ISR doesn't
> > > replace the changes we need to make to handle_fifo_timeout().  It is
> > > very important that when handle_fifo_timeout() finishes that no future
> > > interrupts for old transfers will fire.
> > >
> >
> > Alright. With a proper diagram in the commit text I think doing all of
> > the points, 1 through 3, would be good and required to leave the
> > hardware in a sane state for all the scenarios. Why do we need to call
> > synchronize_irq() at the start and end of handle_fifo_timeout() though?
> > Presumably having it at the start would make sure the long delayed irq
> > runs and handles any rx/tx by throwing it away. Sounds great, but having
> > it at the end leaves me confused. We want to make sure the cancel really
> > went through?  Don't we know that because the completion variable for
> > cancel succeeded?
>=20
> I want it to handle the case where the "abort" command timed out!  :-)
>  If the "abort" command timed out then it's still pending and we could
> get an interrupt for it at some future point in time.

Sure but who cares? We set a completion variable if abort comes in
later. We'll put a message in the log indicating that it "Failed" but
otherwise handle_fifo_timeout() can't return an error so we have to give
up eventually.

>=20
>=20
> > I guess I'm not convinced that the hardware is so bad that it cancels
> > and aborts the sequencer, raises an irq for that, and then raises an irq
> > for the earlier rx/tx that the sequencer canceled out. Is that
> > happening? It's called a sequencer because presumably it runs a sequence
> > of operations like tx, rx, cs change, cancel, and abort. Hopefully it
> > doesn't run them out of order. If they run at the same time it's fine,
> > the irq handler will see all of them and throw away reads, etc.
>=20
> Maybe answered by me explaining that I'm worried about the case where
> "abort" times out (and thus the "done" from the abort is still
> pending).
>=20
> NOTE: I will also assert that if we send the "abort" then it seems
> like it has a high likelihood of timing out.  Why do I say that?  In
> order to even get to sending the "abort", it means:
>=20
> a) The original transfer timed out
>=20
> b) The "cancel" timed out.  As you can see, if the "cancel" doesn't
> time out we don't even send the "abort"
>=20
> ...so two things timed out, one of which we _just_ sent.  The "abort"
> feels like a last ditch effort.  Might as well try it, but things were
> in pretty sorry shape to start with by the time we tried it.
>=20

Yeah and so if it comes way later because it timed out then what's the
point of calling synchronize_irq() again? To make the completion
variable set when it won't be tested again until it is reinitialized?

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9405F2DB85D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 02:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgLPBSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 20:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgLPBSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 20:18:38 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CF7C061793
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 17:17:58 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id x126so6748728pfc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 17:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=9gQ8rHC/bTzmKtSLzhN4/DmZNBfAaJGJNaoibLypAoU=;
        b=QigsSQbqE1PF4dZencpayPsN4OS7GNSPnGpcxyjJu5ahVdqBsHr/nGm9/ycJrCe8KS
         4Lc6KM/1wh4Pj1qHZNoTyXOrda5O2PxK7A9kA0vNivJN1Lv7FDUK+A7K3S4vLXCIwpsH
         Dqz8vGAqHWQq63qNvzh9IKKg7QJZ1DabNG9+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=9gQ8rHC/bTzmKtSLzhN4/DmZNBfAaJGJNaoibLypAoU=;
        b=m1GvA3Fa1oHyuWQdXO9TPkGHo5euYgt+rsRjrUnwnik0Ykaws69aAIZO/2O6VWWWiO
         EwWkqLFHoQrILMEzhjbS86uF1WuRw5gWz7NAx5cLRSPayfHO0p1GqEtGeqOJeEo/3mYO
         RWjporjyZ3z+BCXsTbN6EDHk/QnJo+4T1aZFkFcqUl4Z4snK+G8vnlfy/apQew/c08zz
         2DThygNkPr2UhxgDHGrCfQxsj5iW8hnR067zAeAEQja1VlaqKbcgOt+CT/Pd9Qg5tIRf
         R4j7mbg1GmWLuQpZGC/dGKvRRvfEQ2MOa5HDKiNKA30QPupNEANSPJHesr42GqwnwfkH
         z77g==
X-Gm-Message-State: AOAM531qTnakeg9JiLBpjjumqPOEHnguboBmDOIVhrbqa1k0l+/2BWxH
        7Eeg/n0aQZCGvVtvhvmzHiIGJg==
X-Google-Smtp-Source: ABdhPJz/U+WbLMkQJ+D+MaXIlkWgTHNA6zgW9tPyw+ooD0QD3gl7bc/jZrZEHmL84jLP/mHEYHvCqw==
X-Received: by 2002:a05:6a00:a91:b029:19d:9421:847 with SMTP id b17-20020a056a000a91b029019d94210847mr21362633pfl.72.1608081477348;
        Tue, 15 Dec 2020 17:17:57 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id er23sm118141pjb.12.2020.12.15.17.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 17:17:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=XSrqzDFHGpW3b_Sx+bA8u8MMGqdfMJnXkKhkWL6H952A@mail.gmail.com>
References: <20201214162937.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid> <20201214162937.2.Ibade998ed587e070388b4bf58801f1107a40eb53@changeid> <160800104145.1580929.10562113130948868794@swboyd.mtv.corp.google.com> <CAD=FV=UT0+BKrUPbATGCbO1fmwwmrKbSy5c+mW-61wS1y6TtJw@mail.gmail.com> <160807113302.1580929.9178584426202538854@swboyd.mtv.corp.google.com> <CAD=FV=XSrqzDFHGpW3b_Sx+bA8u8MMGqdfMJnXkKhkWL6H952A@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spi-geni-qcom: Really ensure the previous xfer is done before new one
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, msavaliy@qti.qualcomm.com,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Dec 2020 17:17:55 -0800
Message-ID: <160808147515.1580929.1688687061880694586@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2020-12-15 15:34:59)
> On Tue, Dec 15, 2020 at 2:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Doug Anderson (2020-12-15 09:25:51)
> > > In general when we're starting a new transfer we assume that we can
> > > program the hardware willy-nilly.  If there's some chance something
> > > else is happening (or our interrupt could go off) then it breaks that
> > > whole model.
> >
> > Right. I thought this patch was making sure that the hardware wasn't in
> > the process of doing something else when we setup the transfer. I'm
> > saying that only checking the irq misses the fact that maybe the
> > transfer hasn't completed yet or a pending irq hasn't come in yet, but
> > the fifo status would tell us that the fifo is transferring something or
> > receiving something. If an RX can't happen, then the code should clearly
> > show that an RX irq isn't expected, and mask out that bit so it is
> > ignored or explicitly check for it and call WARN_ON() if the bit is set.
> >
> > I'm wondering why we don't check the FIFO status and the irq bits to
> > make sure that some previous cancelled operation isn't still pending
> > either in the FIFO or as an irq. While this patch will fix the scenario
> > where the irq is delayed but pending in the hardware it won't cover the
> > case that the hardware itself is wedged, for example because the
> > sequencer just decided to stop working entirely.
>=20
> It also won't catch the case where the SoC decided that all GPIOs are
> inverted and starts reporting highs for lows and lows for highs, nor
> does it handle the case where the CPU suddenly switches to Big Endian
> mode for no reason.  :-P
>=20
> ...by that, I mean I'm not trying to catch the case where the hardware
> itself is behaving in a totally unexpected way.  I have seen no
> instances where the hardware wedges nor where the sequencer stops
> working and until I see them happen I'm not inclined to add code for
> them.  Without seeing them actually happen I'm not really sure what
> the right way to recover would be.  We've already tried "cancel" and
> "abort" and then waited at least 1 second.  If you know of some sort
> of magic "unwedge" then we should add it into handle_fifo_timeout().

I am not aware of an "unwedge" command. Presumably the cancel/abort
stuff makes the FIFO state "sane" so there's nothing to see in the FIFO
status registers. I wonder if we should keep around some "did we cancel
last time?" flag and only check the isr if we canceled out and timed
out to boot? That would be a cheap and easy check to make sure that we
don't check this each transaction.

>=20
> However, super delayed interrupts due to software not servicing the
> interrupt in time is something that really happens, if rarely.  Adding
> code to account for that seems worth it and is easy to test...
>=20

Agreed. The function name is wrong then as the device is not "busy". So
maybe spi_geni_isr_pending()? That would clearly describe what's being
checked.

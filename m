Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269A1C8D5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 17:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbfJBPuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 11:50:12 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34487 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbfJBPuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 11:50:11 -0400
Received: by mail-io1-f67.google.com with SMTP id q1so58090289ion.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Oct 2019 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GgrgypA3DxUGV2Hcyn2yPyZpwe6ccGDhojrwZbcYpCc=;
        b=ujTSEqsXf+iupp/ifM3h7w4Ejxx2fmymksEJAm0g8N0Alo7FNBe3Lz7dNvlR1Mt7DL
         7s/pgBLsUsU+RK3RaP38PbrOC6mkp7+3v3/LCJ1sWWn5xLcyykjatUpJpE6uxsDtDEYa
         KtP5XeVD0rbFpkjv5nKpwLZP4W9TauVZ1/JJP3IME77URgq/n4jKSa7GXJDvhvgkAKBq
         HOZpugbfayXfKMZwY2NRxfDSy28lJGL5iut6ZZ8iFF98J5cX5O9KjK1pSMgBnkWUScI0
         jcH1jQgQVVxXQ+5rGV2lpH3V8edYcYdj+/Te595M9OzSZJKvrJnB5nTgFc//xkXkgNJ7
         RwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GgrgypA3DxUGV2Hcyn2yPyZpwe6ccGDhojrwZbcYpCc=;
        b=hCjQz2NNZGxt9qCG+ZHO8zDkUUMMRnYTy0kzc9sKVKJFC1fEbaoomu9rir330DpZNn
         O1mw47J1wqoUNv9cvv6RUPpNdBcNuQy8/38X84ljhc+SJewZ10hXkynp5rPstUPQC+qe
         jn7PYHrUmBtLWOGgneRo4nWT4C1WzhumvoZg4uvwDIomEApmDjztlAps2JJd1nbEg6eW
         m4nspTQ6ynhF/kq90pE8BPjFe3e9Q6OCXr10stHg+MaNcc0zHe4+z/iCpTFc2fBtbl1k
         EaZUczlEt2mlCn7ChUei1jukYeeXX3ZmRTFvgLDbgwKr72LDjCx31Dv7VR7Yj3kI2oBW
         GRdQ==
X-Gm-Message-State: APjAAAUsqiJv1s55OyYvLy+igSMBMw0Zj3+/p5GTCa/uh+b5JSH++Ol/
        +W2alVsz1MjYMl8tJWgLwkby7N9d0Mywyxtt0qw=
X-Google-Smtp-Source: APXvYqxWoflWc4huqe4ztcpNHyki7LeviAKmD46t20HNaJsq4ky/7tlOgT/pMGjJCpqYc2vou9S51QJsOpaiPNJb4Dw=
X-Received: by 2002:a6b:da06:: with SMTP id x6mr3930202iob.42.1570031411001;
 Wed, 02 Oct 2019 08:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org> <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
 <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org> <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
 <5b8835905a704fb813714694a792df54@codeaurora.org> <CANLsYkxPOOorqcnPrbhZLzGV9Y7EGWUUyxvi-Cm5xxnzhx=Ecg@mail.gmail.com>
 <585ee38c-39d1-47df-78b7-f4b670f17a25@free.fr> <20191002153410.GA10598@xps15>
In-Reply-To: <20191002153410.GA10598@xps15>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 2 Oct 2019 09:49:59 -0600
Message-ID: <CAOCk7NrSufekeFKnEsAQVsvBHzQ0N=mzf5vMta3tKHWuGtF5Ow@mail.gmail.com>
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 2, 2019 at 9:34 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Oct 02, 2019 at 05:21:23PM +0200, Marc Gonzalez wrote:
> > On 02/10/2019 17:03, Mathieu Poirier wrote:
> >
> > > The problem here is that a debug and production device are using the
> > > same device tree, i.e msm8998.dtsi.  Disabling coresight devices in
> > > the DTS file will allow the laptop to boot but completely disabled
> > > coresight blocks on the MTP board.  Leaving things as is breaks the
> > > laptop but allows coresight to be used on the MTP board.  One of three
> > > things can happen:
> > >
> > > 1) Nothing gets done and production board can't boot without DTS modifications.
> > > 2) Disable tags are added to the DTS file and the debug board can't
> > > use coresight without modifications.
> > > 2) The handling of the debug power domain is done properly on the
> > > MSM8998 rather than relying on the bootloader to enable it.
> > > 3) The DTS file is split or reorganised to account for debug/production devices.
> >
> > I believe 3) is already the de facto situation.
> >
> > arch/arm64/boot/dts/qcom/msm8998.dtsi is the "base" config.
> > arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi for the MTP board.
> > arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi for the laptops.
>
> "DTS file", i.e msm8998.dtsi

Bjorn (the primary maintainer whom will likely be taking any DT
patches) and I had a chat.  We concluded on disabling the coresight
components (by default) in the msm8998.dtsi, and then enabling them in
the msm8998-mtp.dtsi.  I think Bjorn would like to see some patches,
which it sounds like Sai will post in a few days.

This is probably how things should be moving forward for all qcom SoCs
since its standard practice to disable the coresight components via
efuse or other hardware mechanism for production products.

>
> >
> > > Which of the above ends up being the final solution is entirely up to
> > > David and Andy.
> >
> > 2498f8c1c668 ;-)
>
> Then it is even easier to make a decision.
>
> >
> > Regards.

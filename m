Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38FCE78868
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 11:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbfG2J35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 05:29:57 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44843 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbfG2J35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 05:29:57 -0400
Received: by mail-qk1-f193.google.com with SMTP id d79so43573970qke.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2019 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ni9Dwron1DAB/VosEOyb9bTzIzvLrdks0+fVcvOhKzw=;
        b=gQMwxy1NEfJ4R4DdsragGEeQ1ePMx/vtNIQSPpA1XOQXbdPx507ukDsYGumSvXvKRW
         CqYqNtmlpcLTzUVwVuy3FksrIh2MYpbrC3CMM3zWlPFhfBtGuI34/HrYWfBihkhCAxtb
         744VcN0eb6rpIquLvouIHiSDU3rEmaB/o6wT1UJXTa4iDxydMmBmLMPZHmnpryD/9tAd
         v82HBKIdVMepnufQ6aX9eJxw/+jNDFGRmDRQyrRb7b+x9ospaczHxwFnAIDAaQurc3ii
         wpqE8opLmS1b6y2UsY4RVIoX0v4Oz7q0FUcSBdPzq7Qcfgr0/l7uZEfejMuSekXcOTJE
         uh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ni9Dwron1DAB/VosEOyb9bTzIzvLrdks0+fVcvOhKzw=;
        b=jfSuNnLsFPgsYdjJNoGUx/HgkIcsR+9B6bxS7e/sOlDiXozvlOMQMkTIYrzGgJA9tx
         ozq3AB8vLQ14CrcqMEZCS1PncnB5lWGbzNt3mbH3jHPBj9Myivz8JQic6DO99Mp9QHp9
         PrHQ736bEgTjAHonZ8QyokeWnWvv2qq5v8Tez+Jx45CQ/cEVZyDmlifx6Yh0r/4XHSv8
         ie2wEub4ESOstX/BD+Ed4Bfk4UxvqUWvoF03yB8/oBKOVLuDFAs5ynWygrL0+q9tmWc+
         2aBJD8fkNbUa845HBUnFd1N3R9myVIJ2CVuoaSc3NYCi+/iAkCCwUbBby9JFhC3iFOfM
         d7bg==
X-Gm-Message-State: APjAAAUZeIkuG7EhpU72ydqSq5MCc04LVZLTK7N17BwVfmlivCD+ZFrj
        /NciehsI3IdIL6WzSLmwEeRKPOxJW7Iri4fUhgwArg==
X-Google-Smtp-Source: APXvYqzz2PDrlp9N2pc7W/QuOgqLqcGPA9kPz77ASGS4q7fTLpEkpvutYsOf5F4N2ND7QgCLSin3rOzyMs4xSnwLZ0M=
X-Received: by 2002:a37:4e8f:: with SMTP id c137mr70800649qkb.127.1564392596646;
 Mon, 29 Jul 2019 02:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <ec8205566eb9c015ad51fbb88f0da7ca60b414fd.1564091601.git.amit.kucheria@linaro.org>
 <2812534.bLfc0ztHNv@g550jk>
In-Reply-To: <2812534.bLfc0ztHNv@g550jk>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 29 Jul 2019 14:59:45 +0530
Message-ID: <CAP245DX1u6JNPaqU_=Dq9HFG=EriGJGD2r4yOa88BmdmSH69GQ@mail.gmail.com>
Subject: Re: [PATCH 12/15] arm64: dts: msm8974: thermal: Add interrupt support
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Andy Gross <andy.gross@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Brian Masney <masneyb@onstation.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 29, 2019 at 2:33 PM Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On Freitag, 26. Juli 2019 00:18:47 CEST Amit Kucheria wrote:
> > Register upper-lower interrupt for the tsens controller.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> > Cc: masneyb@onstation.org
> >
> >  arch/arm/boot/dts/qcom-msm8974.dtsi | 36 +++++++++++++++--------------
> >  1 file changed, 19 insertions(+), 17 deletions(-)
> >
>
> Hi, the title of this patch should be "arm" and not "arm64".

Good catch! Copy-paste error, will fix.

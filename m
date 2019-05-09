Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77EF2183B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 04:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbfEICZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 22:25:55 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40637 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfEICZz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 22:25:55 -0400
Received: by mail-ed1-f68.google.com with SMTP id e56so593553ede.7;
        Wed, 08 May 2019 19:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dV00bhvitZyhUixU9bkcFkopWQ37LaEH0x2qCgsghaQ=;
        b=fEf4IWGadCTWVwexFcQu9G5ffqcmzFCHyG2Y7VEWUC++JswOh9aeE5P+25F8g5ai6S
         uW1EZ8MgoDpiTEEwHQENtrcCTBaO5lzyTFf1ROoIVD31KFKY0FyN7KZzwZb2a1YAGx8z
         gfuW6K+13N39gmPdrPYvc/1oQrSSX24ZoHQvqWQ3H+c78bZEiMnQIunySmy411OO85Wr
         sqzUJnGN9kr0kvQdsiD5e9ir8lFZc8qIM2aX5uBaoQqr1PQJjMcZNPvLxQi9W9OtZCo3
         iGeq9K6qBoYuva44haY7ZuA49TOmNUdDtbBGb7+K8cKWgO3sa704DVvPekcbrRgCuwXT
         HX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dV00bhvitZyhUixU9bkcFkopWQ37LaEH0x2qCgsghaQ=;
        b=X+ceMHp0Ix17rvJ95jIlHFgGPxNhCIuAy3NktYJ2jIk7PW1IMkKpUfvBcrExI95jjl
         AnYqj628mQtcMVxX37N0QmiIXbkQskrajbp9Ir39lraTD6HE5gQaQBVUPbVlPhYxBZa2
         zWsk99QNf4qy6HvZJbhyKF2Lf7lSF2UsDgg7b3Pu4zrsj7qb3PyRLtmTGlQj0/Y/fMAy
         Dk9rVN87tSDYe3tDdbhn0zSSZbifqwzZlyyIVM3vsSEdChNqAKSkVc0GrOIy/w1JhOE5
         Bpe/A4ZSoiUhjKdvS0BJrJynLevbOHDcSirOtIBKeRr7cmS92J0OdDCPyryuYshiNn1F
         YUDw==
X-Gm-Message-State: APjAAAWVEHDnh+iNOcJnbjPM60HA4Pq8wossKHgEAP3Xymfno1TAlY0T
        hhwGPIcr2j3HcpuACMxr6AOjcncWsYa3JvJkIKo=
X-Google-Smtp-Source: APXvYqymS3jNPYoPoYTVXnqAuO2BYYvz7TS/SDyCdCXiOkfqcA7noytpW9Gx0yFP/avBPOcvjhRerfKKN4Q4vJQvmFc=
X-Received: by 2002:a50:9441:: with SMTP id q1mr1091789eda.101.1557368753776;
 Wed, 08 May 2019 19:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org> <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro> <20190509021616.GA26228@basecamp>
In-Reply-To: <20190509021616.GA26228@basecamp>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 8 May 2019 19:25:44 -0700
Message-ID: <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
To:     Brian Masney <masneyb@onstation.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 8, 2019 at 7:16 PM Brian Masney <masneyb@onstation.org> wrote:
>
> On Mon, May 06, 2019 at 11:39:02PM -0700, Bjorn Andersson wrote:
> > On Sun 05 May 06:04 PDT 2019, Brian Masney wrote:
> > > diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> > [..]
> > > +                           clocks = <&mmcc MDSS_MDP_CLK>,
> > > +                                    <&mmcc MDSS_AHB_CLK>,
> > > +                                    <&mmcc MDSS_AXI_CLK>,
> > > +                                    <&mmcc MDSS_BYTE0_CLK>,
> > > +                                    <&mmcc MDSS_PCLK0_CLK>,
> > > +                                    <&mmcc MDSS_ESC0_CLK>,
> > > +                                    <&mmcc MMSS_MISC_AHB_CLK>;
> > > +                           clock-names = "mdp_core",
> > > +                                         "iface",
> > > +                                         "bus",
> > > +                                         "byte",
> > > +                                         "pixel",
> > > +                                         "core",
> > > +                                         "core_mmss";
> >
> > Unless I enable MMSS_MMSSNOC_AXI_CLK and MMSS_S0_AXI_CLK I get some
> > underrun error from DSI. You don't see anything like this?
> >
> > (These clocks are controlled by msm_bus downstream and should be driven
> > by interconnect upstream)
> >
> >
> > Apart from this, I think this looks nice. Happy to see the progress.
>
> No, I'm not seeing an underrun errors from the DSI. I think the clocks
> are fine since I'm able to get this working with 4.17 using these same
> clocks. I just sent out v2 and the cover letter has some details, along
> with the full dmesg.

since we don't have interconnect driver for 8974, I guess there is
some chance that things work or not based on how lk leaves things?

BR,
-R

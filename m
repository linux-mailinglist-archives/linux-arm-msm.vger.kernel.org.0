Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55127151078
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 20:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgBCTsb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 14:48:31 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:42369 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgBCTsb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 14:48:31 -0500
Received: by mail-yw1-f65.google.com with SMTP id b81so15071957ywe.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 11:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NCm+aKbpcmsno90SlUdPzAeCBBjBdQJv8DZqSIB3TLc=;
        b=cpZ1edWIsH5TQ+/Zjo96Im+Kyjp+MYJhHErcmWKEaPehX2/4pi0G9wf3IOqyrht4Lb
         HntRYMoY9ItVRobZDa9P+bvjKBGZcgB2uNCsUIl2cYB68qggUCLNhxmm4gncJM6jQ2cm
         csj+AnSNFV4sd79IORgtOu5wfViHItEn+amHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NCm+aKbpcmsno90SlUdPzAeCBBjBdQJv8DZqSIB3TLc=;
        b=XFxTw1SFXgfm/9X1DHtyoe9DisS/3W7BNJYNNrg6fZiXuqasRvDdNHEWPe0D3ZkGTp
         w+UdnuhSYTrWjG0Hv0qMfXO68qYRpl7+wUAaafANIi06LLYUWN8OSxswnz+aetn9YjdK
         uuKFGMwMZCOVUQi0WInrP3P1ji33H1PIYP3iw9vzHu907d59+/SL1vL59IXg0R4ilPs6
         IdSYkgYiDPcREO0q5gol7vsk9H25sDpBEMcuckWBsa1HnFTuFUSz6AB4IcMxZwKqEwAs
         aSFCVqJTCWR+Vl2dzJXL3dFx1rWFVyA7kvWNvVY77QtGLliPY41SR/a2T4q91yWgaHfN
         8DkA==
X-Gm-Message-State: APjAAAWOdHQAyxNivaLfZXa27tUntWA3iGgDoUFklFMBum+sdUSB7pzX
        a8aOCiVY67DV5mri5qI4Gt9SAhYw4+Y=
X-Google-Smtp-Source: APXvYqy8Kh2hrz1uEmGpApsB8TLSh/WlU2ltArZuQ6eOu9Fn3UEBt+4JHyAyzyHHJ7m19RqUKZ9/7g==
X-Received: by 2002:a05:6902:6a5:: with SMTP id j5mr21464165ybt.462.1580759308559;
        Mon, 03 Feb 2020 11:48:28 -0800 (PST)
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id a12sm8774156ywa.95.2020.02.03.11.48.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 11:48:28 -0800 (PST)
Received: by mail-yw1-f53.google.com with SMTP id l5so15074090ywd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 11:48:28 -0800 (PST)
X-Received: by 2002:ab0:30c2:: with SMTP id c2mr14984867uam.8.1580758895085;
 Mon, 03 Feb 2020 11:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20200203183149.73842-1-dianders@chromium.org> <20200203193027.62BD22080D@mail.kernel.org>
In-Reply-To: <20200203193027.62BD22080D@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Feb 2020 11:41:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X2K-Qr17qXgG1Ng8MpZQogagBqMwWu=D2OpQf+ZskBPw@mail.gmail.com>
Message-ID: <CAD=FV=X2K-Qr17qXgG1Ng8MpZQogagBqMwWu=D2OpQf+ZskBPw@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] clk: qcom: Fix parenting for dispcc/gpucc/videocc
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 3, 2020 at 11:30 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-02-03 10:31:33)
> >
> >  .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 --------------
> >  ...om,dispcc.yaml => qcom,msm8998-gpucc.yaml} | 33 +++----
> >  .../bindings/clock/qcom,sc7180-dispcc.yaml    | 84 ++++++++++++++++
> >  .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 ++++++++++++++
> >  .../bindings/clock/qcom,sc7180-videocc.yaml   | 63 ++++++++++++
> >  .../bindings/clock/qcom,sdm845-dispcc.yaml    | 99 +++++++++++++++++++
> >  .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 ++++++++++++++
> >  ...,videocc.yaml => qcom,sdm845-videocc.yaml} | 27 ++---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 47 +++++++++
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 28 +++++-
>
> I don't want to take patches touching dts/qcom/. These aren't necessary
> to merge right now, correct? Or at least, they can go via arm-soc tree?

Right.  They can go later.

Specifically for sdm845 until the sdm845 patches lands the old dts
trees will yell about the missing clocks, but it's not like they will
compile fail.  Also the bindings themselves will validate fine.
There's no other way forward, though, and the old bindings caused
similar yells.

For sc7180 there's no usage of any of these clocks and this adds the
first usage, so definitely no problem there.

Once you've landed then Bjorn or Andy can pick up the dts.

-Doug

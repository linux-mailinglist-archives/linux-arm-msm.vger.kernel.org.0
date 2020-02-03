Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 718A6150FAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 19:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgBCSfP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 13:35:15 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:41845 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgBCSfP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 13:35:15 -0500
Received: by mail-vk1-f193.google.com with SMTP id p191so4400818vkf.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 10:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opEKTCgEyzNySp8NgE/YRaLRspNXo0xH4Ilo0G3sH6g=;
        b=bVcdqWYsw56zW7nr9YoFlMnqcxjJDVj4/ok84BJS1e8Yb8dBneL7jgN610vLEkKq8a
         INkAkqv0Gm0TTiPCevDSoZcm0AI2vPcC3Ia+jWEpSfGElrgc/84lkQ8E/TslqqrzS4hM
         /7qmk6g9qZNpsUtt5mpdv3R6s5vF52G3k+kak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opEKTCgEyzNySp8NgE/YRaLRspNXo0xH4Ilo0G3sH6g=;
        b=OKUqyyma3aoD83AwCAU3RR+vVg7pOhkgrFYmDHyf6NSy/4rjAzURLCzodbfhNMtiuT
         PpUETW95llochfv43Zvhc0RtkngY8WlnJJX17ST7XNzav63sthaC9NisKA3mcevb0vB2
         ECap/fZqQVQLaKHzxXIXF6RAq50rxxNTpSGy31+exusl/GXQkv6Ao/awhQjeG9qFB6E+
         ca6MmmgWzdURKQJbv7PmiowZHgYY0xuQM5oMhwiCqQhNRssUolOF8hPWXVkXCubfOqDo
         PAlWatH2an+6XQlU6YahUW/LB6+9LrRfYkoYcJblY/ZNkY4FZu368hfvRdjpye1Od+I1
         2+GA==
X-Gm-Message-State: APjAAAXIqqoCrVZAWgY7gFI7mqgiNSLX/lntkhcewJxs8PneOfFZs2VT
        Cr3V/wvRJEaigcbeFrveqBqKeusyTh4=
X-Google-Smtp-Source: APXvYqwyuyKOk5QxyIVz0UGo65EcVGtrGcXMpz5OUgCJuGl4WKduCy63w4zbBzcRIsARJinkA5Yq4g==
X-Received: by 2002:a1f:6d82:: with SMTP id i124mr14914993vkc.4.1580754913774;
        Mon, 03 Feb 2020 10:35:13 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id j29sm3795801uab.0.2020.02.03.10.35.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 10:35:13 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id m195so4408294vkh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 10:35:12 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr15117676vkf.34.1580754912485;
 Mon, 03 Feb 2020 10:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20200130211231.224656-1-dianders@chromium.org>
 <20200130131220.v3.7.I513cd73b16665065ae6c22cf594d8b543745e28c@changeid>
 <CAL_JsqLj8WbP=oXAovyVFOc-58eFr5xS5EJK=kpAK-eT7_TyNw@mail.gmail.com>
 <CAD=FV=X=vAM7HZmA7pCm707rb8u+ogEqPUu_F_ueiS9GwbVwuw@mail.gmail.com> <20200203162954.DE0AD2086A@mail.kernel.org>
In-Reply-To: <20200203162954.DE0AD2086A@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Feb 2020 10:35:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VmvgjUqRzFYNbb_w7QGq0+H9jnT=aS1Zq=PR7ybgSLyA@mail.gmail.com>
Message-ID: <CAD=FV=VmvgjUqRzFYNbb_w7QGq0+H9jnT=aS1Zq=PR7ybgSLyA@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/sc7180/msm8998
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        =?UTF-8?Q?open_list=3AOPEN_FIRMWARE_AND_FLATTENED_DEVICE_TREE_BINDINGS_=3C?=
         =?UTF-8?Q?devicetree=40vger=2Ekernel=2Eorg=3E=2C_Matthias_Kaehlcke_=3Cmka=40chromium?=
         =?UTF-8?Q?=2Eorg=3E=2C_Kalyan_Thota_=3Ckalyan=5Ft=40codeaurora=2Eorg=3E=2C_Mark_Rutland_?=
         =?UTF-8?Q?=3Cmark=2Erutland=40arm=2Ecom=3E=2C_linux=2Dclk_=3Clinux=2Dclk=40vger=2Ekernel=2Eorg?=
         =?UTF-8?Q?=3E=2C_Kristian_H=2E_Kristensen_=3Choegsberg=40chromium=2Eorg=3E=2C_Michael_?=
         =?UTF-8?Q?Turquette_=3Cmturquette=40baylibre=2Ecom=3E=2C_linux=2Dkernel=40vger=2Ekerne?=
         =?UTF-8?Q?l=2Eorg?= <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Mon, Feb 3, 2020 at 8:29 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Doug Anderson (2020-01-31 08:48:37)
> > Hi,
> >
> > On Fri, Jan 31, 2020 at 8:43 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Jan 30, 2020 at 3:12 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > The qcom,gpucc bindings had a few problems with them:
> > > >
> > > > 1. When things were converted to yaml the name of the "gpll0 main"
> > > >    clock got changed from "gpll0" to "gpll0_main".  Change it back for
> > > >    msm8998.
> > > >
> > > > 2. Apparently there is a push not to use purist aliases for clocks but
> > > >    instead to just use the internal Qualcomm names.  For sdm845 and
> > > >    sc7180 (where the drivers haven't already been changed) move in
> > > >    this direction.
> > > >
> > > > Things were also getting complicated harder to deal with by jamming
> > > > several SoCs into one file.  Splitting simplifies things.
> > > >
> > > > Fixes: 5c6f3a36b913 ("dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > > Changes in v3:
> > > > - Added pointer to inlude file in description.
> > > > - Everyone but msm8998 now uses internal QC names.
> > > > - Fixed typo grpahics => graphics
> > > > - Split bindings into 3 files.
> > > >
> > > > Changes in v2:
> > > > - Patch ("dt-bindings: clock: Fix qcom,gpucc...") new for v2.
> > > >
> > > >  .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 -------------------
> > > >  .../bindings/clock/qcom,msm8998-gpucc.yaml    | 66 +++++++++++++++++
> > > >  .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 +++++++++++++++++++
> > > >  .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 +++++++++++++++++++
> > > >  4 files changed, 210 insertions(+), 72 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml
> > >
> > > I'm not seeing any differences in sdm845 and sc7180. Do those really
> > > need to be separate? It doesn't have to be all combined or all
> > > separate.
> >
> > They are the same, other than pointing to a different #include file.
> > I debated whether to put them in one file (arbitrarily named after one
> > SoC or the other) or to put them in individual files.  I got the
> > impression from Stephen that he'd prefer them to be separate files
> > even in the case that they were 99% identical, but I certainly could
> > have misunderstood.
> >
> > I'll do whatever you guys agree to.  If you want them in one file I'll
> > probably name it "qcom,sdm845-gpucc.yaml" just because that SoC is
> > earlier, unless someone tells me otherwise.
> >
>
> I'd prefer them to be split out and point at the include file so we know
> what numbers are valid. It provides clarity and helps avoid the back and
> forth of combining and splitting the files. We suffer the same problem
> on the driver side, and we've long given up trying to combine SoCs when
> they're otherwise fairly similar.

Thanks for clarifying!  Rob: I hope it's OK that I've gone ahead and
sent out v4 leaving this alone.  I knew you were interested in getting
the other bindings patch out sooner rather than later and I was hoping
to get both series out together so I could context switch to a few
other things early this week.  Apologies if this was moving too
fast...

-Doug

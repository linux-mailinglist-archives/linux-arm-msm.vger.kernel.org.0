Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10190151145
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 21:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgBCUsz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 15:48:55 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43501 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgBCUsy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 15:48:54 -0500
Received: by mail-vs1-f65.google.com with SMTP id 7so9859368vsr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 12:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+JwFHbchxJ0gg1my7n1CXaZxr3hxuHVj1YoJC44SlE=;
        b=SCEVhtfbAbnwghXPkv1qNGhfhx7+ObPqKjLQOZh9HGoAf2EoYmD7XqBz5PP5nVTOwt
         Xg77qSn8dKpq9fyJTZ4fb1ysvbU8U7zW7weoRKoHtZ2yFgzJ9Fc4br1YZ49aI0X7k802
         OZYYW2/7BmFempKoaKOmfRN2mU09LOD5o4jC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+JwFHbchxJ0gg1my7n1CXaZxr3hxuHVj1YoJC44SlE=;
        b=gbHiSfPC3xxvM2XnZupAkfuBH6gRAFVmOua7Gbfn+T/G9hmAGQEkQCZDq0wT5BNr6o
         ddCaSQzhkJsdJLC9MQNP8fDhMXLnuPfsk8iwGb61gf0xUEVwHoH69rJFg7A8eEvZXNpt
         xBHFI583k+arGg2lY83Nwq3+pH4nelQtH9AliGUV8OEg7d9BdA96zPirF/OHBflC0nW+
         KCnNWBoE/Zn044ftOqeFu+/Ojqh/4/h2ofvlZffz5L+5so4lweW5d+2Q4nmhqe4zPNqe
         KnP5uhjgmgay88RTcEKGre2FFjaSKDJf0E1FkjrvZBnN0r7pfgXAkQOXDLrLlGvsQfi1
         NUfQ==
X-Gm-Message-State: APjAAAWW+nmHD8E+j+KV37eEUsquRYnijsgIcAjv5qbWCkyzxB/SXqJT
        8C4gh6ZPtr3996L6MzqN4Y5R4BoMyu4=
X-Google-Smtp-Source: APXvYqyNrK1ilvT+mHjwvkcxuMscnajFBciubajZiLimBA6j/YOHMZnEUXdbeHp4twgItGPesXz+lA==
X-Received: by 2002:a67:6746:: with SMTP id b67mr16710120vsc.193.1580762933174;
        Mon, 03 Feb 2020 12:48:53 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id f9sm1029060vkl.21.2020.02.03.12.48.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 12:48:52 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id 1so5900105uao.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 12:48:51 -0800 (PST)
X-Received: by 2002:ab0:2006:: with SMTP id v6mr14461189uak.22.1580762931322;
 Mon, 03 Feb 2020 12:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20200203183149.73842-1-dianders@chromium.org> <20200203193027.62BD22080D@mail.kernel.org>
 <CAD=FV=X2K-Qr17qXgG1Ng8MpZQogagBqMwWu=D2OpQf+ZskBPw@mail.gmail.com> <20200203200443.GN3948@builder>
In-Reply-To: <20200203200443.GN3948@builder>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Feb 2020 12:48:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VQyTHYizfzMwjAaRbmQ4zvFFzdfgGiVkLQU+b+pFVnzg@mail.gmail.com>
Message-ID: <CAD=FV=VQyTHYizfzMwjAaRbmQ4zvFFzdfgGiVkLQU+b+pFVnzg@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] clk: qcom: Fix parenting for dispcc/gpucc/videocc
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
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

On Mon, Feb 3, 2020 at 12:04 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 03 Feb 11:41 PST 2020, Doug Anderson wrote:
>
> > Hi,
> >
> > On Mon, Feb 3, 2020 at 11:30 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Douglas Anderson (2020-02-03 10:31:33)
> > > >
> > > >  .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 --------------
> > > >  ...om,dispcc.yaml => qcom,msm8998-gpucc.yaml} | 33 +++----
> > > >  .../bindings/clock/qcom,sc7180-dispcc.yaml    | 84 ++++++++++++++++
> > > >  .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 ++++++++++++++
> > > >  .../bindings/clock/qcom,sc7180-videocc.yaml   | 63 ++++++++++++
> > > >  .../bindings/clock/qcom,sdm845-dispcc.yaml    | 99 +++++++++++++++++++
> > > >  .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 ++++++++++++++
> > > >  ...,videocc.yaml => qcom,sdm845-videocc.yaml} | 27 ++---
> > > >  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 47 +++++++++
> > > >  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 28 +++++-
> > >
> > > I don't want to take patches touching dts/qcom/. These aren't necessary
> > > to merge right now, correct? Or at least, they can go via arm-soc tree?
> >
> > Right.  They can go later.
> >
> > Specifically for sdm845 until the sdm845 patches lands the old dts
> > trees will yell about the missing clocks, but it's not like they will
> > compile fail.  Also the bindings themselves will validate fine.
> > There's no other way forward, though, and the old bindings caused
> > similar yells.
> >
>
> Can you please help me parse this, will old DT cause complaints or will
> it fail to boot?

Sorry, let me try to be more clear:

a) Without my series: "make dtbs_check" limited to the bindings files
I'm touching yells.  Examples:

.../msm8998-mtp.dt.yaml: clock-controller@5065000: clock-names:1:
'gpll0_main' was expected

.../sdm845-mtp.dt.yaml: clock-controller@af00000: 'clocks' is a
required property
.../sdm845-mtp.dt.yaml: clock-controller@af00000: 'clock-names' is a
required property

.../sdm845-mtp.dt.yaml: clock-controller@ab00000: 'clocks' is a
required property
.../sdm845-mtp.dt.yaml: clock-controller@ab00000: 'clock-names' is a
required property


b) With just the bindings from my series, "make dtbs_check" yells, but
yells about different things.  The "gpll0_main" one goes away but this
one is new:

.../sdm845-mtp.dt.yaml: clock-controller@5090000: clock-names:0:
'bi_tcxo' was expected
.../sdm845-mtp.dt.yaml: clock-controller@5090000: clock-names: ['xo']
is too short
.../sdm845-mtp.dt.yaml: clock-controller@5090000: clocks: [[26, 0]] is too short


c) With just the "dts" from my series, you'll again get different
yells from "make dtbs_check".  I won't bother listing them, but they
are similar to the above.


d) With everything from my series, the "make dtbs_check" limited to
the bindings files I'm touching is clean.

---

* sdm845's ability to boot is unaffected by this series.  I have
tested booting sdm845 after this series and it's fine.  Since nothing
in this series touches the sdm845 clock drivers (only the bindings and
the dts) that means that the new dts must work with the existing
drivers.  You can land the sdm845 dts any time after Stephen and Rob
are happy with the bindings.

* It should be fine to land the sc7180 dts file without waiting for
the driver change.  The dts here will work with both the
dispcc/gpucc/videocc that's in clk-next and also the one that results
from applying all of my patches.


> > For sc7180 there's no usage of any of these clocks and this adds the
> > first usage, so definitely no problem there.
> >
> > Once you've landed then Bjorn or Andy can pick up the dts.
> >
>
> Do I need to apply these after Stephen picks the driver patches? Or are
> they simply nop until the driver patches lands?

The sdm845 patches are a nop until some future patch changes the Linux
driver to start using them.  I don't know of anyone planning to do
that.  The only real result from an sdm845 perspective will be making
things "more correct" from a dts standpoint and keeping "make
dtbs_check" happier.

The sc7180 patches are OK to land even without the driver.  They're
not a nop and I've actually validated that I can bring the display/gpu
up with them (even without the driver changes) on my downstream
kernel.

---

Sorry it's so confusing.  Happy to try to clarify more if the above is
still too hard to follow.

-Doug

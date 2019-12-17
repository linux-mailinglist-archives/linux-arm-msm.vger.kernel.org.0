Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60967122497
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 07:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfLQGXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 01:23:00 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39784 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfLQGXA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 01:23:00 -0500
Received: by mail-pf1-f196.google.com with SMTP id q10so107646pfs.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 22:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fwHTfnJaI9qnMvf2gSHfOz3OAkZOCzCGX5TYMPhWqUA=;
        b=dFn7VKlHM/jteR5MfqGleAz/hb1y6mlIHXAhvp1Jq7TNAdwfpl0D30IIVXK32ytp6Q
         +YAo0OOlee56Yr5UTweg+CKiB565URXCbLnmw4B8JBfXVDOngHrK8DX0OPk6m5eVc0nE
         b9VPMLnT2AxEfHM/z5N53rqS/4C2J1ciUc/x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fwHTfnJaI9qnMvf2gSHfOz3OAkZOCzCGX5TYMPhWqUA=;
        b=ZELHn75Qjjn8cfnDctT+hgqk0dQ9lme5NLUHowcmWohz9ufGn5qkZIQqBrp92sdbKv
         +4pcNprtoE4eQesov24p6ta1vW/319D3gL8ccOU6hBC5qckg/1WYaWU+DYd6ROcf4UK9
         TFPyPHH6h5rZfAQZ86ZVZtzYk8MuhXZUvCNPkoF3md79txdzM6lY3t1pj0rDpHnezkfS
         IJEyMmxj3b/rp5en8HnvwkOGlFVvwhEEJKkaqI46DJMZLH6BgpoTsjpQN2b/QZ7jVGX5
         Btv728K+cxY5hHOZc5pf+F0DSaPUKWYmkZZeV7NqvtA4cJYcwiUoZ6CRaRytR5CSvgZi
         zhDg==
X-Gm-Message-State: APjAAAXZufKp2KczPtHt/ReasfAThMMKehZlknMfZKhywSqmqC3ZeOMy
        uPYYD8dXxqNtmlMNt+anK/rOaTRh/S0=
X-Google-Smtp-Source: APXvYqwW+VxK5AtUGJmLgOOgbGeKk/ycNO1girO5Y2k2LEjMPwPRptHfbSgY5Hf3BXOoHwNutypMXA==
X-Received: by 2002:a62:3045:: with SMTP id w66mr20893324pfw.122.1576563779568;
        Mon, 16 Dec 2019 22:22:59 -0800 (PST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id m45sm1577942pje.32.2019.12.16.22.22.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 22:22:59 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id 4so6953431pfz.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 22:22:59 -0800 (PST)
X-Received: by 2002:a6b:be84:: with SMTP id o126mr2416373iof.269.1576563289206;
 Mon, 16 Dec 2019 22:14:49 -0800 (PST)
MIME-Version: 1.0
References: <20191212193544.80640-1-dianders@chromium.org> <20191212113540.7.Ia9bd3fca24ad34a5faaf1c3e58095c74b38abca1@changeid>
 <5df2b752.1c69fb81.77c46.0f9a@mx.google.com>
In-Reply-To: <5df2b752.1c69fb81.77c46.0f9a@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Dec 2019 22:14:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UGRqeAr8vVUfx3ADyxNLJRz3g=YhWNX1adgepx_kADrA@mail.gmail.com>
Message-ID: <CAD=FV=UGRqeAr8vVUfx3ADyxNLJRz3g=YhWNX1adgepx_kADrA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sc7180: Use 'ranges' in
 arm,armv7-timer-mem node
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 12, 2019 at 1:55 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2019-12-12 11:35:43)
> > Running `make dtbs_check` yells:
> >
> >   arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: timer@17c20000: #size-cells:0:0: 1 was expected
> >
> > It appears that someone was trying to assert the fact that sub-nodes
> > describing frames would never have a size that's more than 32-bits
> > big.  That's certainly true in the case of sc7180.
> >
> > I guess this is a hint that it's time to do the thing that nobody
> > seems to do but that "writing-bindings.txt" says we should all do.
> > Specifically it says: "DO use non-empty 'ranges' to limit the size of
> > child buses/devices".  That means we should probably limit the
>
> It got cut off here. I'm waiting to find out what it is!!

I was going to say that I should use ranges to limit the address cells
in addition to the size cells, but then I think I must have got
distracted and forgot to finish my


> > I believe that this patch is the way to do it and there should be no
> > bad side effects here.  I believe that since we're far enough down
> > (not trying to describe an actual device, just some sub-pieces) that
> > this won't cause us to run into the problems that caused us to
> > increase the soc-level #address-cells and #size-cells to 2 in sdm845
> > in commit bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address
> > and size cells for soc").
> >
> > I can at least confirm that "arch_mem_timer" seems to keep getting
> > interrupts in "/proc/interrupts" after this change.
> >
> > Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> This pattern exists in most of the qcom dts files. Can you fix all the
> arm,armv7-timer-mem nodes. Maybe the binding has the same problem too in
> the example.

Yeah.  I'm a little scared to go and do this for every qcom device
tree file since I have no good way to test them, but I suppose I can
give it a shot.  I was kinda thinking that, in general, it would make
sense for folks to tackle one SoC at a time and make that SoC clean
and test it.

In any case, your idea about updating the example seemed wise to me,
so I sent out:

https://lore.kernel.org/r/20191216220512.1.I7dbd712cfe0bdf7b53d9ef9791072b7e9c6d3c33@changeid

I'll put this patch on hold until Rob gives his thoughts on that one
so we can really make sure we're supposed to be using ranges in this
way.

-Doug

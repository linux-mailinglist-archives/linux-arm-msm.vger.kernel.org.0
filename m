Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD6436CED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 09:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfFFHFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 03:05:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44081 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfFFHFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 03:05:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so720366lfm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2019 00:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LxUuoqEbUmgmnRX9vLQxQ/tQ09ZsJx159pAs1BZjQQw=;
        b=XE2mWnWbAi156xacpzGakgxd0XdnPCTjLko9UBbfOxI68vIwEY1UqU3DdVepHT2unK
         IXFQuljTyQaBE63iTT06aLL+Gabw06PozTCJJyXbmKvvVShYaCMrd+a5URAFB89lEIrU
         oH3FnL+nYHmx42QzFDxG5r+oZSqRevKAxlp0V/DFV++C/3xPhMUC2Woo4QjnWcxAJlx8
         I81qqKzeu0gdR3REUvOrz+2QwvtvK3yIaokulPtppIRatORNpAjdXcyB35p+xAEy9RmN
         y4ND6KqQT11fRSwVqXg03KLBPqqJX4YYaH2X4ZLxkTZKD4Y39fNVQOdJy8bB0sRlmd6C
         qLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LxUuoqEbUmgmnRX9vLQxQ/tQ09ZsJx159pAs1BZjQQw=;
        b=jzZJXhZwtd+ToC93Cpwyt0tH8YquB5ggLxPDs6V8p1subuWyKd9pSvp8GCWCwKIcSk
         Dgr2S54phuU0Js5D7YU+exiEIaVaDrDVO6aknep04x+geyN4AP8YaIQemHdyPXo3U+A8
         IOD3DUgQf87u1ppeg1QsXQU46ukjbQVbJSD8/Gh3BIigU0Kwt3GyR6VyZxowUgKGOcKg
         k7Vb1lLfEa+1yAB+lqONkf/jw9woDRc/9U++LSkPyooPlLN+2CabTgzFcoBzprCDU0QZ
         NMXb+XQqqUozl50Ta6pXPyiBrFrAgRXZvN2JYqg3Oa1V9mNbBC8bJokp361f6Qlg47zK
         jpvw==
X-Gm-Message-State: APjAAAXBFX7CmEr8TReVwbPkwGm7BJiEBsCDIFQdrWhj41Xq+3vOkIdp
        5klc04qUIo8+UbWOzacBRY1fNNPQLLDDw2J7hoqV6Q==
X-Google-Smtp-Source: APXvYqxZCAlDmT5oc8zqUrM9LX+7zRm365sy7bvsFw5heno4p5UQD7LD9oIpvPIgG/H6nUWIJ0qyXLkVoeON3W+U3V8=
X-Received: by 2002:a19:2892:: with SMTP id o140mr9068556lfo.177.1559804728178;
 Thu, 06 Jun 2019 00:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190114184255.258318-1-mka@chromium.org> <CAHLCerP+F9AP97+qVCMqwu-OMJXRhwZrXd33Wk-vj5eyyw-KyA@mail.gmail.com>
 <CAHLCerPZ0Y-rkeMa_7BJWtR4g5af2vwfPY9FgOuvpUTJG3rf7g@mail.gmail.com>
 <155786856719.14659.2902538189660269078@swboyd.mtv.corp.google.com>
 <CAHLCerP69Jw27VyO+ek4Fe3-2fDiOejtz6XZPykPSRA2G1831w@mail.gmail.com>
 <5cdf2dc8.1c69fb81.521c8.9339@mx.google.com> <20190605172048.ahzusevvdxrpnebk@queper01-ThinkPad-T460s>
In-Reply-To: <20190605172048.ahzusevvdxrpnebk@queper01-ThinkPad-T460s>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Thu, 6 Jun 2019 09:05:16 +0200
Message-ID: <CAKfTPtCR360osDz3oW+XhHT1R12SacAuJ44W_NfFOPWxJFjOPg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sdm845: Add CPU topology
To:     Quentin Perret <quentin.perret@arm.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Quentin,

On Wed, 5 Jun 2019 at 19:21, Quentin Perret <quentin.perret@arm.com> wrote:
>
> On Friday 17 May 2019 at 14:55:19 (-0700), Stephen Boyd wrote:
> > Quoting Amit Kucheria (2019-05-16 04:54:45)
> > > (cc'ing Andy's correct email address)
> > >
> > > On Wed, May 15, 2019 at 2:46 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Amit Kucheria (2019-05-13 04:54:12)
> > > > > On Mon, May 13, 2019 at 4:31 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > > > > >
> > > > > > On Tue, Jan 15, 2019 at 12:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > > > >
> > > > > > > The 8 CPU cores of the SDM845 are organized in two clusters of 4 big
> > > > > > > ("gold") and 4 little ("silver") cores. Add a cpu-map node to the DT
> > > > > > > that describes this topology.
> > > > > >
> > > > > > This is partly true. There are two groups of gold and silver cores,
> > > > > > but AFAICT they are in a single cluster, not two separate ones. SDM845
> > > > > > is one of the early examples of ARM's Dynamiq architecture.
> > > > > >
> > > > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > > >
> > > > > > I noticed that this patch sneaked through for this merge window but
> > > > > > perhaps we can whip up a quick fix for -rc2?
> > > > > >
> > > > >
> > > > > And please find attached a patch to fix this up. Andy, since this
> > > > > hasn't landed yet (can we still squash this into the original patch?),
> > > > > I couldn't add a Fixes tag.
> > > > >
> > > >
> > > > I had the same concern. Thanks for catching this. I suspect this must
> > > > cause some problem for IPA given that it can't discern between the big
> > > > and little "power clusters"?
> > >
> > > Both EAS and IPA, I believe. It influences the scheduler's view of the
> > > the topology.
> >
> > And EAS and IPA are OK with the real topology? I'm just curious if
> > changing the topology to reflect reality will be a problem for those
> > two.
>
> FWIW, neither EAS nor IPA depends on this. Not the upstream version of
> EAS at least (which is used in recent Android kernels -- 4.19+).
>
> But doing this is still required for other things in the scheduler (the
> so-called 'capacity-awareness' code). So until we have a better
> solution, this patch is doing the right thing.

I'm not sure to catch what you mean ?
Which so-called 'capacity-awareness' code are you speaking about ? and
what is the problem ?

Regards,
Vincent

>
> I hope that helps.
>
> Thanks,
> Quentin

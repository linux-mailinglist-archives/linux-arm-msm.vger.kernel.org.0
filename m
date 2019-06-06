Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0661E36E62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 10:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfFFIU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 04:20:28 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38290 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbfFFIU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 04:20:27 -0400
Received: by mail-lj1-f194.google.com with SMTP id o13so1132943lji.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2019 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdF1v4zNmglgg6wRPSMEUUX+aiqDBLcWc0FEbJ3SK/c=;
        b=inVF2SVnrhXJctU6cvftwgiH6jhX52LsKf+SD2K74Q1TYYxrr94ztiUPR+tkEAmNqG
         aHrFY8Azl6VW3k6Fg+9RTwUCI5gvDR38VZouO6YMTaebpoqZ0UtSKPyMJZCrL5qvWRJY
         wYAOmHVzGLVPWHy58HVCUbcEDpifnOIlmmPwZR8Z4WgUSrSc5PKYhn65hrW4n6+U78oi
         tHa+YyF0WdMxWbJsz7WhDszmJcXesPyels4MMBcE7CVbTW3FG92os80vQb1qnWrCG6ar
         lrI4SgaUsDnx7HOAl0Eg9/k5lEfllxz5X0+4jBuPM2kjvaDlxCbnUjOJ4mqdG7M7gcax
         pFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdF1v4zNmglgg6wRPSMEUUX+aiqDBLcWc0FEbJ3SK/c=;
        b=hBPssxTTLGEtlgcuT/a77MBW2sa022Mk+zn4CI6Zu/W0/mABDiGXI3CV2a74izrW8A
         TKhgJAycewng7bYedsfWZCHUOxdvY2XS6/LKwKcuPYjRzgncudtIYbcElxox4khvHUOF
         MdJU1jHCH59iFh1r5UBc9V4RkGbzC8RjtinAF0ntw9qmzImoiAX3715AgphRQjq5nAN9
         7prwONTMCBI5mLbL4lZ0IT/Cme+scjDwWwZg2yyGksLZrEDpLvXyYAbOuvjyllFkBu0O
         TIZAv7VxyYr1wSQyW/hXIFGxt0DXahfCmwOk0fVN3+a3A2h+1rLfdLodG1qSymj1dmQp
         Lo8A==
X-Gm-Message-State: APjAAAULbOAV8I3HwR1bAXOpRjDcjp1MjwtgrFrk1b3oRmC01LiBr5xh
        1x/8NtwLg6bLOaljzoC5bSRXRenBscggL95EOj2uhA==
X-Google-Smtp-Source: APXvYqxrq3Csc717Yxh30k3K1QTXdOLvuL7CJlzkO7gNEZaHwBqa0R5v/zq4UUdsK5UPe4vQAMfI1+YcE1nBoWSZJcI=
X-Received: by 2002:a2e:9d07:: with SMTP id t7mr16654557lji.43.1559809223322;
 Thu, 06 Jun 2019 01:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190114184255.258318-1-mka@chromium.org> <CAHLCerP+F9AP97+qVCMqwu-OMJXRhwZrXd33Wk-vj5eyyw-KyA@mail.gmail.com>
 <CAHLCerPZ0Y-rkeMa_7BJWtR4g5af2vwfPY9FgOuvpUTJG3rf7g@mail.gmail.com>
 <155786856719.14659.2902538189660269078@swboyd.mtv.corp.google.com>
 <CAHLCerP69Jw27VyO+ek4Fe3-2fDiOejtz6XZPykPSRA2G1831w@mail.gmail.com>
 <5cdf2dc8.1c69fb81.521c8.9339@mx.google.com> <20190605172048.ahzusevvdxrpnebk@queper01-ThinkPad-T460s>
 <CAKfTPtCR360osDz3oW+XhHT1R12SacAuJ44W_NfFOPWxJFjOPg@mail.gmail.com> <20190606074921.43mbinemk3j565yu@queper01-ThinkPad-T460s>
In-Reply-To: <20190606074921.43mbinemk3j565yu@queper01-ThinkPad-T460s>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Thu, 6 Jun 2019 10:20:12 +0200
Message-ID: <CAKfTPtA9WDOH3UzU-Qz4AqhLNGkOPo9EFkTHXGqTq7qsrec_JA@mail.gmail.com>
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

On Thu, 6 Jun 2019 at 09:49, Quentin Perret <quentin.perret@arm.com> wrote:
>
> Hi Vincent,
>
> On Thursday 06 Jun 2019 at 09:05:16 (+0200), Vincent Guittot wrote:
> > Hi Quentin,
> >
> > On Wed, 5 Jun 2019 at 19:21, Quentin Perret <quentin.perret@arm.com> wrote:
> > >
> > > On Friday 17 May 2019 at 14:55:19 (-0700), Stephen Boyd wrote:
> > > > Quoting Amit Kucheria (2019-05-16 04:54:45)
> > > > > (cc'ing Andy's correct email address)
> > > > >
> > > > > On Wed, May 15, 2019 at 2:46 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > > >
> > > > > > Quoting Amit Kucheria (2019-05-13 04:54:12)
> > > > > > > On Mon, May 13, 2019 at 4:31 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jan 15, 2019 at 12:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > > > > > >
> > > > > > > > > The 8 CPU cores of the SDM845 are organized in two clusters of 4 big
> > > > > > > > > ("gold") and 4 little ("silver") cores. Add a cpu-map node to the DT
> > > > > > > > > that describes this topology.
> > > > > > > >
> > > > > > > > This is partly true. There are two groups of gold and silver cores,
> > > > > > > > but AFAICT they are in a single cluster, not two separate ones. SDM845
> > > > > > > > is one of the early examples of ARM's Dynamiq architecture.
> > > > > > > >
> > > > > > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > > > > >
> > > > > > > > I noticed that this patch sneaked through for this merge window but
> > > > > > > > perhaps we can whip up a quick fix for -rc2?
> > > > > > > >
> > > > > > >
> > > > > > > And please find attached a patch to fix this up. Andy, since this
> > > > > > > hasn't landed yet (can we still squash this into the original patch?),
> > > > > > > I couldn't add a Fixes tag.
> > > > > > >
> > > > > >
> > > > > > I had the same concern. Thanks for catching this. I suspect this must
> > > > > > cause some problem for IPA given that it can't discern between the big
> > > > > > and little "power clusters"?
> > > > >
> > > > > Both EAS and IPA, I believe. It influences the scheduler's view of the
> > > > > the topology.
> > > >
> > > > And EAS and IPA are OK with the real topology? I'm just curious if
> > > > changing the topology to reflect reality will be a problem for those
> > > > two.
> > >
> > > FWIW, neither EAS nor IPA depends on this. Not the upstream version of
> > > EAS at least (which is used in recent Android kernels -- 4.19+).
> > >
> > > But doing this is still required for other things in the scheduler (the
> > > so-called 'capacity-awareness' code). So until we have a better
> > > solution, this patch is doing the right thing.
> >
> > I'm not sure to catch what you mean ?
> > Which so-called 'capacity-awareness' code are you speaking about ? and
> > what is the problem ?
>
> I'm talking about the wake-up path. ATM select_idle_sibling() is totally
> unaware of capacity differences. In its current form, this function
> basically assumes that all CPUs in a given sd_llc have the same
> capacity, which would be wrong if we had a single MC level for SDM845.
> So, until select_idle_sibling() is 'fixed' to be capacity-aware, we need
> two levels of sd for asymetric systems (including DynamIQ) so the
> wake_cap() story actually works.
>
> I hope that clarifies it :)

hmm... does this justifies this wrong topology ?
select_idle_sibling() is called only when system is overloaded and
scheduler disables the EAS path
In this case, the scheduler looks either for an idle cpu or for evenly
spreading the loads
This is maybe not always optimal and should probably be fixed but
doesn't justifies a wrong topology description IMHO


>
> Thanks,
> Quentin

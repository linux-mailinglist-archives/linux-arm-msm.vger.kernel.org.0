Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780353660B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 22:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbhDTUPD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 16:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233750AbhDTUPD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 16:15:03 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2CBC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 13:14:31 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id z1so44480034ybf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Apr 2021 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWvsYx7IzA9GfPTPmUcRLPUp1HCGUIZAXpCS/2LWJYw=;
        b=qRBop6uajhYMowB9AXqHDztVfTiCiqT++oepEeiC48vFhRAcU5LSIRHcwfYT6NYauq
         LTwmT9uX5LEJ/sJwDNDCgBTtMSRNIeAdCxKUfDl/tQRqwAZC0ztbLPpJgheyJt+NZ9so
         +NqTrcoSEYR3RWqmNdcs4IHrQLyBJuYWcI+WKxRtbhBPetjcm41tow/4HHlnC2qy061z
         XTmsi6VYo655p4rYUVymlsZ6Eq8LfT5DzWbIqMzJIGjssJz5zlondDt8xlRv1TsHgDbc
         0aPaVXj8asBjnjgaoKee+PmnjH9kHWHSsvLrHjAbDJA7gToKPadE0h3GLfpOizcsUUp0
         ZTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWvsYx7IzA9GfPTPmUcRLPUp1HCGUIZAXpCS/2LWJYw=;
        b=lah2cbr/ST+2ckpp3HncraNJDI1wiLIuQpBI8na8ZLAjYx2bNXPgfLAvNcKmyJudvH
         AejHWxuU003pQVRqxnAUAtiWgl0Iohvt81joEMq8dFI+6uqeuWR9dlvvTJDeKtI+kNK9
         Y4Hq7PIbA5xHTECJGfWOjbo3hkdbo3fvQgEN8WwGxwqecRfog00zaMtyirqS92ikaE8s
         dZUTxFQIva10ixF934w6RjTLZ+WKtqQh6oabIX1ujlfWsUqTw5HIerrqhf5fdfv6Nx9x
         E5xhRcRe6LOQz4PbuWFXQ1aGZsO0JdBtoIGo6q1fB8vWC1qBm5MfzUufqxdPGwfSE1aj
         rnNA==
X-Gm-Message-State: AOAM531QgNl6UK6VYcRJSVv0flBfRdsaUiBlDjHUPSx96ZjtsyXPrqK4
        THMfaqh2IK3hEZcMuiIvoiYy8rgP4JJRpp8H3dKu2w==
X-Google-Smtp-Source: ABdhPJw2vBj+tqkve0bKkIOUuRE5iUgwXY9JWUju+TRFeedSda5f9+5dA+C4VDJ10Q85wMvBXqE9SaTQ4sCau98cfEU=
X-Received: by 2002:a25:aac3:: with SMTP id t61mr26366634ybi.405.1618949670166;
 Tue, 20 Apr 2021 13:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
 <CAD=FV=WLZCSd6D5VFyD+1KBp5n1qyszER2EVaEMwYjQfPSSDnA@mail.gmail.com>
 <b77f207b-2d90-3c8b-857f-625bd3867ed1@codeaurora.org> <6fdf704c4716f5873d413229ca8adc57@codeaurora.org>
 <CAD=FV=Wa4fT5wZgd0==8kLy_tzTLgdZ-HwdfOEAM9pMeMjjFyg@mail.gmail.com>
 <8126e130e5c0ea1e7ea867414f0510c0@codeaurora.org> <CAD=FV=XavWbf_b7-=JT6V5_RNA8CjdK4oRu7H719AaPDJ5tsqQ@mail.gmail.com>
 <32096a375966e1fcc149016df012c445@codeaurora.org>
In-Reply-To: <32096a375966e1fcc149016df012c445@codeaurora.org>
From:   Doug Anderson <dianders@google.com>
Date:   Tue, 20 Apr 2021 13:14:18 -0700
Message-ID: <CAD=FV=U0zEDi1Xn3OmVFA3h3maVWS_o2FXOW9qDEzTf1Moja=A@mail.gmail.com>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        sartgarg@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Odelu Kukatla <okukatla@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 20, 2021 at 10:21 AM <sbhanu@codeaurora.org> wrote:
>
> On 2021-04-15 01:55, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Apr 13, 2021 at 3:59 AM <sbhanu@codeaurora.org> wrote:
> >>
> >> >> >>> +                                       required-opps =
> >> >> >>> <&rpmhpd_opp_low_svs>;
> >> >> >>> +                                       opp-peak-kBps = <1200000
> >> >> >>> 76000>;
> >> >> >>> +                                       opp-avg-kBps = <1200000
> >> >> >>> 50000>;
> >> >> >> Why are the kBps numbers so vastly different than the ones on sc7180
> >> >> >> for the same OPP point. That implies:
> >> >> >>
> >> >> >> a) sc7180 is wrong.
> >> >> >>
> >> >> >> b) This patch is wrong.
> >> >> >>
> >> >> >> c) The numbers are essentially random and don't really matter.
> >> >> >>
> >> >> >> Can you identify which of a), b), or c) is correct, or propose an
> >> >> >> alternate explanation of the difference?
> >> >> >>
> >> >>
> >> >> We calculated bus votes values for both sc7180 and sc7280 with ICB
> >> >> tool,
> >> >> above mentioned values we got for sc7280.
> >> >
> >> > I don't know what an ICB tool is. Please clarify.
> >> >
> >> > Also: just because a tool spits out numbers that doesn't mean it's
> >> > correct. Presumably the tool could be wrong or incorrectly configured.
> >> > We need to understand why these numbers are different.
> >> >
> >> we checked with ICB tool team on this they conformed as Rennell &
> >> Kodiak
> >> are different chipsets,
> >> we might see delta in ib/ab values due to delta in scaling factors.
> >
> > ...but these numbers are in kbps, aren't they? As I understand it
> > these aren't supposed to be random numbers spit out by a tool but are
> > supposed to be understandable by how much bandwidth an IP block (like
> > MMC) needs from the busses it's connected to. Since the MMC IP block
> > on sc7180 and sc7280 is roughly the same there shouldn't be a big
> > difference in numbers.
> >
> > Something smells wrong.
> >
> > Adding a few people who understand interconnects better than I do,
> > though.
> >
>
> ICB team has re-checked the Rennell ICB tool and they confirmed that
> some configs were wrong in Rennell ICB tool and they corrected it.With
> the new updated Rennell ICB tool below are the values :
>
>
> Rennell LC:(Sc7180)
>
> opp-384000000 {
>               opp-hz = /bits/ 64 <384000000>;
>               required-opps = <&rpmhpd_opp_nom>;
>               opp-peak-kBps = <5400000 490000>;
>               opp-avg-kBps = <6600000 300000>;
> };
>
>
> And now, these values are near to Kodaik LC values:
>
> Kodaik LC:(SC7280)
>
> opp-384000000 {
>             opp-hz = /bits/ 64 <384000000>;
>             required-opps = <&rpmhpd_opp_nom>;
>             opp-peak-kBps = <5400000 399000>;
>             opp-avg-kBps = <6000000 300000>;
> };

This still isn't making sense to me.

* sc7180 and sc7280 are running at the same speed. I'm glad the
numbers are closer now, but I would have thought they'd be exactly the
same.

* Aren't these supposed to be sensible? This is eMMC that does max
transfer rates of 400 megabytes / second to the external device. You
have bandwidths listed here of 5,400,000 kBps = 5,400,000 kilobytes /
second = 5400 megabytes / second. I can imagine there being some
overhead where an internal bus might need to be faster but that seems
excessive. This is 13.5x!

* I can't see how it can make sense that "average" values are higher
than "peak" values.

It still feels like there's a misconfiguration somewhere.

-Doug

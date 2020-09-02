Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31E325AF05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 17:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgIBPcx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 11:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgIBPcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 11:32:41 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F90CC061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 08:32:41 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id n7so12295vkq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 08:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CaZwArJVDsGm3BuqCJoaQAv1/h87JxXOYIV/nwkJsOI=;
        b=apW9O2U7VXpHx2cVUs09CAp1uF3w9aOpWk4Vb8yGApJGh1qjt3XA6PXXFw13jrgzgR
         tI4O/e8yuhAbTWTBy6q9Jl+S7v3R9/w5G9705tGiktUvp3rpntBNYZwBkxXKqpXfoU6x
         lULIGWY9qLRpCNLvcGgymqDpj+A/tHo4j3Ca4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CaZwArJVDsGm3BuqCJoaQAv1/h87JxXOYIV/nwkJsOI=;
        b=nxwdlWJChYC1VTvhy97/E5zpIhWWsdATtrsmE75ZeTY2R89KPLdjYnt23KRNrJ4GIf
         9FV6scilnzoszC3GS5SxngIO6+GmZ1V07+JdmVbafbQz/hz6+txZoR5hBfrNK6QOFmjL
         SMSk4VbrE6TqPwV/zAHgWeLEZty+sSLLsQ0Q9ovCCzAb0yVOe9jgvv0eBnst4V3E1aif
         UP/Oz0YtQtLG5G6kEPP8g2d58kgisnkKN9NQlEQuF3oBSwRhy0++/XuPtJ0nOZF62UqZ
         v+iNSZGWbS8ip+z6nsHMU9/pgUWpShw2t+ItUtHZzOuNWIqAKQWsFQI6nAgDsRdhEr+o
         J3Ew==
X-Gm-Message-State: AOAM5333wyKoPsJaGcwukBzgu0+AyTP/ClEOEVrcVED/0e1aR04vPpF8
        PXtfY5oYD2x40dPJf/jSiAs48R2lGgG5/w==
X-Google-Smtp-Source: ABdhPJw34jOmcDIBeeee6e9+pmXWfkzBr1ai8OzvPArq7Zu41TuiCpHQoI2oPHbjxnv9Z1wpnOOPdg==
X-Received: by 2002:a1f:4646:: with SMTP id t67mr5676894vka.75.1599060759868;
        Wed, 02 Sep 2020 08:32:39 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id c125sm2545vkc.44.2020.09.02.08.32.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 08:32:38 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id r13so1702316uah.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 08:32:38 -0700 (PDT)
X-Received: by 2002:ab0:623:: with SMTP id f32mr5391415uaf.121.1599060757775;
 Wed, 02 Sep 2020 08:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
 <20200901170745.GA3419728@google.com> <CAD=FV=Xv0FLtWWcQcRy7p2LPNdDtSjdarsvNHRHaLkWwABnwJw@mail.gmail.com>
 <8ad0589e-102d-7523-899f-0ebe85b7d2b8@codeaurora.org>
In-Reply-To: <8ad0589e-102d-7523-899f-0ebe85b7d2b8@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Sep 2020 08:32:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XKUEQP3gyE8E2UOE12qKYwzgMp0eNeYjCp0DxPDACSMQ@mail.gmail.com>
Message-ID: <CAD=FV=XKUEQP3gyE8E2UOE12qKYwzgMp0eNeYjCp0DxPDACSMQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for CPU
 thermal zones
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 1, 2020 at 10:36 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> > * In terms of the numbers here, I believe that you're claiming that we
> > can dissipate 768 mW * 6 + 1202 mW * 2 = ~7 Watts of power.  My memory
> > of how much power we could dissipate in previous laptops I worked on
> > is a little fuzzy, but that doesn't seem insane for a passively-cooled
> > laptop.  However, I think someone could conceivably put this chip in a
> > smaller form factor.  In such a case, it seems like we'd want these
> > things to sum up to ~2000 (if it would ever make sense for someone to
> > put this chip in a phone) or ~4000 (if it would ever make sense for
> > someone to put this chip in a small tablet).  It seems possible that,
> > to achieve this, we might have to tweak the
> > "dynamic-power-coefficient".
>
> DPC values are calculated (at a SoC) by actually measuring max power at various
> frequency/voltage combinations by running things like dhrystone.
> How would the max power a SoC can generate depend on form factors?
> How much it can dissipate sure is, but then I am not super familiar how
> thermal frameworks end up using DPC for calculating power dissipated,
> I am guessing they don't.
>
> > I don't know how much thought was put
> > into those numbers, but the fact that the little cores have a super
> > round 100 for their dynamic-power-coefficient makes me feel like they
> > might have been more schwags than anything.  Rajendra maybe knows?
>
> FWIK, the values are always scaled and normalized to 100 for silver and
> then used to derive the relative DPC number for gold. If you see the DPC
> for silver cores even on sdm845 is a 100.
> Again these are not estimations but based on actual power measurements.

The scaling to 100 doesn't seem to match how the thermal framework is
using them.  Take a look at of_cpufreq_cooling_register().  It takes
the "dynamic-power-coefficient" and passes it as "capacitance" into
__cpufreq_cooling_register().  That's eventually used to compute
power, which is documented in the code to be in mW.

power = (u64)capacitance * freq_mhz * voltage_mv * voltage_mv;
do_div(power, 1000000000);

/* power is stored in mW */
freq_table[i].power = power;

That's used together with "sustainable-power", which is the attribute
that Matthias is trying to set.  That value is documented to be in mW
as well.

...so if the silver cores are always scaled to 100 regardless of how
much power they actually draw then it'll be impossible to actually
think about "sustainable-power" as a mW value.  Presumably we either
need to accept that fact (and ideally document it) or we need to
change the values for silver / gold cores (we could still keep the
relative values the same and just scale them).

-Doug

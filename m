Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5DC25C494
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 17:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbgICPMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 11:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728637AbgICMRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 08:17:55 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F24C061251
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 05:17:12 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n3so3658940pjq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/BKi2i04xBQBPBh/3OfYq0JRpU2M+He5BM3tljwdBCM=;
        b=CFa0qij2VAf/49RV/zrVX3ncNvnawUqzeGRhAyqR73uvVwsZ6hAeWDUGsG1iks33Yw
         qw1Yl03RYYHbFFHCzQ0PRzupwQJvkCqZwMICNDOSfgLGE/O4ELoNyjbaPL1hw8vg5FA8
         8yW4KCkJAbe23y5BhusonlRTSxbSsaG+8h7/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/BKi2i04xBQBPBh/3OfYq0JRpU2M+He5BM3tljwdBCM=;
        b=RGp9fp9txN5JwHnMFNKMlWJhRSyzX8WEXz8MqZu8JLwz2ka4xxCFF4Sw5k5zMzvK5A
         z8/izByOfw1qW//2AjeYJAK+NOSOEXn0jmSUmYscA2NntpfdV4rlHYR5GgP67x29kojV
         vT//pqFW+3V5HBLNtRsqlPKbhQj8GQTGu/yko7AEofh2vGgZvuMQNo5MaJhuUSco/Vcj
         7HClZjkG5u+IaE5XuCyECEkTk/D1g7+XYYEp0cG4FPvZqGvaH+Xlu3CXTQJXKBKEukLs
         fKYFr3KzBbKPoviLPmYni9UqYG6J0Vpg+fKoDFK7GUy469tgSvzDXbImir17tEiJa9/c
         pOHA==
X-Gm-Message-State: AOAM5324Som5sS60owRezLEEUvCmZ11Vie0Lf1mrJK/8UQWXeBUJXQbd
        CYao9pZ6fOksN73x/RTjh8gcTg==
X-Google-Smtp-Source: ABdhPJyRNKcBgEX/LHFE+6DRGovh0X2K5LHGwdLni0au93gA95eaRzC4WEulWXQDvMWRqPJEHgWOjA==
X-Received: by 2002:a17:90a:858a:: with SMTP id m10mr2854307pjn.185.1599135431975;
        Thu, 03 Sep 2020 05:17:11 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id q201sm3130842pfq.80.2020.09.03.05.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 05:17:11 -0700 (PDT)
Date:   Thu, 3 Sep 2020 05:17:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Doug Anderson <dianders@chromium.org>,
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
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add 'sustainable_power' for
 CPU thermal zones
Message-ID: <20200903121710.GG3419728@google.com>
References: <20200813113030.1.I89c33c4119eaffb986b1e8c1bc6f0e30267089cd@changeid>
 <20200901170745.GA3419728@google.com>
 <CAD=FV=Xv0FLtWWcQcRy7p2LPNdDtSjdarsvNHRHaLkWwABnwJw@mail.gmail.com>
 <8ad0589e-102d-7523-899f-0ebe85b7d2b8@codeaurora.org>
 <CAD=FV=XKUEQP3gyE8E2UOE12qKYwzgMp0eNeYjCp0DxPDACSMQ@mail.gmail.com>
 <6693eed6-9a6b-48c8-e56e-acdde9cf9ffe@codeaurora.org>
 <f77d9b24-dbca-cea0-2ef8-3c5cf0c2f2dd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f77d9b24-dbca-cea0-2ef8-3c5cf0c2f2dd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On Thu, Sep 03, 2020 at 11:00:52AM +0530, Rajendra Nayak wrote:
> 
> On 9/3/2020 10:14 AM, Rajendra Nayak wrote:
> > 
> > On 9/2/2020 9:02 PM, Doug Anderson wrote:
> > > Hi,
> > > 
> > > On Tue, Sep 1, 2020 at 10:36 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> > > > 
> > > > 
> > > > > * In terms of the numbers here, I believe that you're claiming that we
> > > > > can dissipate 768 mW * 6 + 1202 mW * 2 = ~7 Watts of power.  My memory
> > > > > of how much power we could dissipate in previous laptops I worked on
> > > > > is a little fuzzy, but that doesn't seem insane for a passively-cooled
> > > > > laptop.  However, I think someone could conceivably put this chip in a
> > > > > smaller form factor.  In such a case, it seems like we'd want these
> > > > > things to sum up to ~2000 (if it would ever make sense for someone to
> > > > > put this chip in a phone) or ~4000 (if it would ever make sense for
> > > > > someone to put this chip in a small tablet).  It seems possible that,
> > > > > to achieve this, we might have to tweak the
> > > > > "dynamic-power-coefficient".
> > > > 
> > > > DPC values are calculated (at a SoC) by actually measuring max power at various
> > > > frequency/voltage combinations by running things like dhrystone.
> > > > How would the max power a SoC can generate depend on form factors?
> > > > How much it can dissipate sure is, but then I am not super familiar how
> > > > thermal frameworks end up using DPC for calculating power dissipated,
> > > > I am guessing they don't.
> > > > 
> > > > > I don't know how much thought was put
> > > > > into those numbers, but the fact that the little cores have a super
> > > > > round 100 for their dynamic-power-coefficient makes me feel like they
> > > > > might have been more schwags than anything.  Rajendra maybe knows?
> > > > 
> > > > FWIK, the values are always scaled and normalized to 100 for silver and
> > > > then used to derive the relative DPC number for gold. If you see the DPC
> > > > for silver cores even on sdm845 is a 100.
> > > > Again these are not estimations but based on actual power measurements.
> > > 
> > > The scaling to 100 doesn't seem to match how the thermal framework is
> > > using them.  Take a look at of_cpufreq_cooling_register().  It takes
> > > the "dynamic-power-coefficient" and passes it as "capacitance" into
> > > __cpufreq_cooling_register().  That's eventually used to compute
> > > power, which is documented in the code to be in mW.
> > > 
> > > power = (u64)capacitance * freq_mhz * voltage_mv * voltage_mv;
> > > do_div(power, 1000000000);
> > > 
> > > /* power is stored in mW */
> > > freq_table[i].power = power;
> > > 
> > > That's used together with "sustainable-power", which is the attribute
> > > that Matthias is trying to set.  That value is documented to be in mW
> > > as well.
> > > 
> > > ...so if the silver cores are always scaled to 100 regardless of how
> > > much power they actually draw then it'll be impossible to actually
> > > think about "sustainable-power" as a mW value.  Presumably we either
> > > need to accept that fact (and ideally document it) or we need to
> > > change the values for silver / gold cores (we could still keep the
> > > relative values the same and just scale them).
> > 
> > That sounds reasonable (still keep the relative values and scale them)
> > I'll get back on what those scaled numbers would look like, and try to
> > get some sense of why this scaling to 100 was done (like you said
> > I don't see any documentation on this), but I see atleast a few other non-qcom
> > SoCs doing this too in mainline (like rockchip/rk3399)
> 
> On second thoughts, why wouldn't a relative 'sustainable-power' value work?
> On every device, one would need to do the exercise that Matthias did to come
> up with the OPP at which we can sustain max CPU/GPU loads anyway.

You assume that a thermal zone only has cooling devices of a the same type (or
with the same fake unit for power consumption). This falls apart when multiple
types are used, which is common.

Also sustainable power is only a derived value, the lying already starts in
the energy model, which is used by EAS, so a fake unit could cause further
problems.

> I mean even if we do change the DPC values to match actual power, Matthias would
> still observe that we can sustain at the very same OPP and not any different.
> Its just that the mW values that are passed to kernel are relative and not
> absolute. My worry is that perhaps no SoC vendor wants to put these absolute numbers
> out.

This is pretty much 'security' by obscurity. It would be relatively easy to
measure actual power consumption at different CPU speeds and derive the DPC
values from that.

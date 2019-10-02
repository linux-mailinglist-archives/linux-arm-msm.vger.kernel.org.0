Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E6CC90A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 20:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbfJBSSu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 14:18:50 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40951 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJBSSt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 14:18:49 -0400
Received: by mail-io1-f65.google.com with SMTP id h144so59079735iof.7;
        Wed, 02 Oct 2019 11:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eG6ofvrckUFcFRYXwx/ccEp5zbwUgI4UE493A1wR4no=;
        b=eRzFCqQe4nvNRGO5zbc7vgTWV5c8zYTtTrbRd770nTtsJNwmMCYJLSiO4h2k1DrsuZ
         62XWZvx0kPFUhkur2RFvwrd4gsi4/cO2A4Bt15ywfZNYne9TWPqG2X+5/ALs7eOV1mm+
         KppNrSUsi4PuPhIRxsgKFsGSLguuq+HffYC5ksmIuHNOsuc7dY93DYi5RMHmjgGYW8fS
         m/x8E9QBLa9U9RlWS2GQM6MyORB5fIW2Za7HIBKRc8y7xU7xyghufZZq9ZXWbZYOZ71a
         xOFdQpRiKVSWyhl0LmbvEy7I/xmkD9ksVFS/38CVNTxDJf0Ek908Nxo/7LBMD5kZyk/4
         zBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eG6ofvrckUFcFRYXwx/ccEp5zbwUgI4UE493A1wR4no=;
        b=HF4EUxxL9YndIHIpIq2T3+mYsJ1oX3RsruS1Vs6N33ayoUIXU9bnfRP60jkTDs+mGN
         GQl6tM7lXQu7belpxbcRULEDhpDIWA1uyDN3Uk1zGT19rK/HhWizb4RuoZFTf66nvBLY
         gzsZqvvYTBYwpOuPIMYpndXHyccoD528KKeNTeWl5wNnL1NqYA139jtXFEaP5ecbu2Vn
         V1fPWLobFkqUNJ9fGfv8XY33XyG9TLdHLrAng/R/MOJ9t4ED5nzPe1O9u6J4Hl3R7wLf
         27ENMdWNz3O60xtmWdEjrKTBlz7oDS/QP8gUMuLUWxIuIZWKHwfMyKzawv6oXJv3TfJL
         Ukhg==
X-Gm-Message-State: APjAAAUQJKaVm63Dfj7VsPKLytR1hWofA3TyZmy0zWN/JwQ0efdzovcq
        +U43gxJCrjfA9kZ9QNtU8c/j+pzrJfxlqVXJBAU=
X-Google-Smtp-Source: APXvYqzeGOG+vjdbOlerjELbGdZs+cwv0jd4E+qA7STc6TTnUbh87zuNhWs38yf4kxrOP6qiE/fmRvTpGxP8XFDpqFg=
X-Received: by 2002:a02:cd2d:: with SMTP id h13mr5165251jaq.19.1570040328827;
 Wed, 02 Oct 2019 11:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com>
 <20191002091950.GA9393@centauri> <20191002092734.GA15523@centauri>
In-Reply-To: <20191002092734.GA15523@centauri>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 2 Oct 2019 12:18:37 -0600
Message-ID: <CAOCk7Nqqm6d3bR9hFJH6rp1jMPmx2e2qmJtnOuw5viaGWohEZA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Amit Kucheria <amit.kucheria@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sibi Sankar <sibis@codeaurora.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 2, 2019 at 3:27 AM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> On Wed, Oct 02, 2019 at 11:19:50AM +0200, Niklas Cassel wrote:
> > On Mon, Sep 30, 2019 at 04:20:15PM -0600, Jeffrey Hugo wrote:
> > > Amit, the merged version of the below change causes a boot failure
> > > (nasty hang, sometimes with RCU stalls) on the msm8998 laptops.  Oddly
> > > enough, it seems to be resolved if I remove the cpu-idle-states
> > > property from one of the cpu nodes.
> > >
> > > I see no issues with the msm8998 MTP.
> >
> > Hello Jeffrey, Amit,
> >
> > If the PSCI idle states work properly on the msm8998 devboard (MTP),
> > but causes crashes on msm8998 laptops, the only logical change is
> > that the PSCI firmware is different between the two devices.
>
> Since the msm8998 laptops boot using ACPI, perhaps these laptops
> doesn't support PSCI/have any PSCI firmware at all.

They have PSCI.  If there was no PSCI, I would expect the PSCI
get_version request from Linux to fail, and all PSCI functionality to
be disabled.

However, your mention about ACPI sparked a thought.  ACPI describes
the idle states, along with the PSCI info, in the ACPI0007 devices.
Those exist on the laptops, and the info mostly correlates with Amit's
patch (ACPI seems to be a bit more conservative about the latencies,
and describes one additional deeper state).  However, upon a detailed
analysis of the ACPI description, I did find something relevant - the
retention state is not enabled.

So, I hacked out the retention state from Amit's patch, and I did not
observe a hang.  I used sysfs, and appeared able to validate that the
power collapse state was being used successfully.

I'm guessing that something is weird with the laptops, where the CPUs
can go into retention, but not come out, thus causing issues.

I'll post a patch to fix up the laptops.  Thanks for all the help.

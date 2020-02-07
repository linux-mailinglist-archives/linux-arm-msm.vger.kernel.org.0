Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B6A1557CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 13:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgBGMdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 07:33:06 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:47021 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGMdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 07:33:05 -0500
Received: by mail-vk1-f196.google.com with SMTP id u6so526018vkn.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 04:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=twtq6AmHtqUnVlUAbKpPEtdoaGtXpV1mwpVd5YJVSts=;
        b=xQu4+EHhFRFlnyvW2p6/S1UWGhxtBGS4fkV0O7245rLUTBWSZvPWZKXPUskfY9lmzB
         /lYHVNze4GDXh8V7W6x/9Q87cQvSAQN/S7uhG3OKqECw9APIZb+tVpRLEdqDHOjulxP4
         jsJRZM+UltT5+fAa6eGFN6V5fJ46cZObhVP+0Q4clWGOSXhq2UjqPSk1vwrUOlM378lL
         n/6hrRitZK+mXiy0qV3jQw4/rw9Svw0kusMJ4FHVzCxj/RaI5u6TKP+af/SWu0iISJto
         gOThRm2CG7TEFmsCSeHCLsUXNkqkhr2NDvglKf7D4TDAOtktXxk6C1tGWiJVGRT1uC+L
         pi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=twtq6AmHtqUnVlUAbKpPEtdoaGtXpV1mwpVd5YJVSts=;
        b=TprS/UiDRTgx3GvbxoQukev3NjGHyjATbza2dSb/QtujQq7s9q2/6scHHyZ8y8leY2
         CujlNo8M1isalWIUqnWxun714GUMmLWMMKCMWyvetu7uWneZQLASm3lxzTCJE/0r7ZJa
         QL5UOls25SFdZgXFqhKTW+UrmRZ40ZzzzoVZIEs8+bc1YbnoAzAs1iUb1sK3CYUTOSF5
         hIrZ7dZ0881brwMUhXcXgxxDDHzXgv2GoGrzY0mfYYNKe9uPfTccDh9qsZU431GeYg/f
         trpdXJFZ3gBiKKNP55GnlSLNaVEXIdSf38gCIadOMhaD/fTTY8Tlr+gRXLsUXCTBeWL/
         Bm5w==
X-Gm-Message-State: APjAAAVKttTy11XPTb0vze3Bw4Kcga9RYCR8AoQNFby0MHP38D33L/1x
        KWdgazPUkE50t1rjMTo115X5Qc5fUr9tyzNFAMPN1A==
X-Google-Smtp-Source: APXvYqwd2iUAO56g39Z3AI5rVCzQsHgInfZfT32zsa4e7crxd9R36HCQB4/vaaZN1zLJ9dnGC8jrHT52+51jJ+OU93Y=
X-Received: by 2002:ac5:c844:: with SMTP id g4mr4661734vkm.25.1581078784950;
 Fri, 07 Feb 2020 04:33:04 -0800 (PST)
MIME-Version: 1.0
References: <1580736940-6985-6-git-send-email-mkshah@codeaurora.org>
 <20200203170832.GA38466@bogus> <0d7f7ade-3a1e-5428-d851-f1a886f58712@codeaurora.org>
 <20200204152132.GA44858@bogus> <6ff7c82d-4204-a339-4070-0154ab4515f1@codeaurora.org>
 <20200205140603.GB38466@bogus> <CAPDyKFoyepN2VX4COMomp1e9dXPozzrgCdcy0paee2jp8Wm3YA@mail.gmail.com>
 <20200205161816.GD38466@bogus> <CAPDyKFqaA7oN2+oLS=Puw+jQXke_ErGQAWYuTuU-6PS7mo5YbQ@mail.gmail.com>
 <20200206204514.GB8107@codeaurora.org> <20200207111955.GA40103@bogus>
In-Reply-To: <20200207111955.GA40103@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 7 Feb 2020 13:32:28 +0100
Message-ID: <CAPDyKFp-zvD1iFcpRaTFiuazxYmLEx0Czf3=TZJxjSCDmmPsvA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drivers: firmware: psci: Add hierarchical domain
 idle states converter
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, lsrao@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[...]

> > I understand the arguments for using PC vs OSI and agree with it. But
> > what in PSCI is against Linux knowing when the last core is powering
> > down when the PSCI is configured to do only Platform Cordinated.
>
> Nothing :D. But knowing the evolution and reasons for adding OSI in the
> PSCI specification and having argued about benefits of OSI over PC for
> years and finally when we have it in mainline, this argument of using
> PC for exact reasons why OSI evolved is something I can't understand
> and I am confused.
>
> > There should not be any objection to drivers knowing when all the cores
> > are powered down, be it reference counting CPU PM notifications or using
> > a cleaner approach like this where GendPD framwork does everything
> > cleanly and gives a nice callback. ARM architecture allows for different
> > aspects of CPU access be handled at different levels. I see this as an
> > extension of that approach.
> >
>
> One thing that was repeatedly pointed out during OSI patch review was no
> extra overhead for PC mode where firmware can make decisions. So, just
> use OSI now and let us be done with this discussion of OSI vs PC. If PC
> is what you think you need for future, we can revert all OSI changes and
> start discussing again :-)

Just to make it clear, I fully agree with you in regards to overhead
for PC-mode. This is especially critical for ARM SoCs with lots of
cores, I assume.

However, the overhead you refer to, is *only* going to be present in
case when the DTS has the hierarchical CPU topology description with
"power-domains". Because, that is *optional* to use, I am expecting
only those SoC/platforms that needs to manage last-man activities to
use this layout, the others will remain unaffected.

That said, does that address your concern?

Kind regards
Uffe

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69AC2EF09F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 11:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbhAHKXo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 05:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbhAHKXo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 05:23:44 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BEEC0612F5
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 02:23:03 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id x26so5283002vsq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 02:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aOuT3Oi+vPve6YqCYUYuw/dI03+W04u5ZGoPFLj22Y0=;
        b=NKZLZMIvdtJLJFN88ujdmELsO2ixYwJXQzvCnS4q68kR2B9rFKwVlSXSaAXiIIloCe
         ++ouK4EEpLVj2OKsVtg+PoFZH/yH0Pfr1l4vc1EiDUBPK62Pe15zY5Kw0Z3w1o9xrOJ6
         FXUwy0cuZlN9SFGyP073qWD6RPjZKUMzVIIFkNUmaEJo4kVuVZpMkPF6VsmwN+hlTP7N
         TGXcm3zMgObi7g2Hl+0WA7kC3iq92PGQiVpishWb3RxtauoKBIaSuGXcHYP/wzKeJU3y
         6u0U1YbeiBse5+dRG3+99Pk41LgY6A2IfAPclHWvfNbD0dteNxL0zdq9fb0QysHw7Hkt
         IYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aOuT3Oi+vPve6YqCYUYuw/dI03+W04u5ZGoPFLj22Y0=;
        b=bdfX0dBITSrjUfDs1UCIigrzidTPN+FSUYJQHYhBKrZ0kBNkavYg99RHgSrLweoQI1
         Mp1RqYSDerVwlnFb7hjmFkqTE5GRqFtfAjO/nM7YRjDbPeNal1bwwzueNBWMAucuDTUp
         snWn2kdrPEMvOpk/Bj+I2RryB7OJLJkcCwAC0XeQSL7hAb9KE2+4tE62zU4IRR4WwZeG
         ZwMF+YpGPjha2obYv+E/2qMs1cTyt19w6THLAaJuDx67aBAsNtV50Z/I/5onjiYPDyz2
         VGZsypnjVHiPSace+e0bvOzgwV5EgiCJco06h3wnQao4mz+jm6XG9gvQS8oFNls3r7Wa
         bQDQ==
X-Gm-Message-State: AOAM530RWBL96ZlbLV7ISfzLHHAzcacwgJ+jZKiqOxDmaZsk3dnk8zTt
        FcejtanvQJs2jJnks8/7maih56DJpFre0t25Xuy+ee2rswUIRQ==
X-Google-Smtp-Source: ABdhPJyew8MgUznUgu9YOJy4A4Lv01S16RtMRDENnkPfo5u3LUHyRLBb6TIWlsHJpeAqlQEOIgaq986in3WuB39kDa0=
X-Received: by 2002:a67:e286:: with SMTP id g6mr2036107vsf.42.1610101382204;
 Fri, 08 Jan 2021 02:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20201216175056.19554-1-ilina@codeaurora.org> <CAPDyKFrdZTd0mWHYhk13uyNWoxqjkO_iSni_TC5uir-PpgxSpw@mail.gmail.com>
 <X+VBBKZXZ2JW3ZDL@codeaurora.org> <CAPDyKFrAV5Af8WVTy==u1-Ak7zrwC+X7bWSRCc_RrwHoTKfVGw@mail.gmail.com>
 <X+lDTxDqTS9ik9TR@codeaurora.org>
In-Reply-To: <X+lDTxDqTS9ik9TR@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 8 Jan 2021 11:22:25 +0100
Message-ID: <CAPDyKFr-C4V+oaD53+ACT02UBqKggRqSqCsm76k7OS8QNx7iCg@mail.gmail.com>
Subject: Re: [PATCH] PM / Domains: allow domain idle states to be disabled
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Dec 2020 at 03:30, Lina Iyer <ilina@codeaurora.org> wrote:
>
> On Sat, Dec 26 2020 at 05:33 -0700, Ulf Hansson wrote:
> >On Fri, 25 Dec 2020 at 02:31, Lina Iyer <ilina@codeaurora.org> wrote:
> >>
> >> On Tue, Dec 22 2020 at 03:16 -0700, Ulf Hansson wrote:
> >> >On Wed, 16 Dec 2020 at 18:51, Lina Iyer <ilina@codeaurora.org> wrote:
> >> >>
> >> >> In order to debug critical domain and device power issues, it may be
> >> >> necessary to disallow certain idle states at runtime. Let the device
> >> >> disallow a domain idle state before suspending.The domain governor shall
> >> >> check for the 'disabled' flag while determining the domain idle state.
> >> >
> >> >For debug purposes, you might as well just set a dev PM Qos latency
> >> >request that corresponds to the state you want to disable. This will
> >> >then prevent the genpd governor from selecting the state.
> >> >
> >> True, but it will also disable idle states deeper as well. Would like to
> >> avoid that.
> >
> >I see. In any case, I am not so excited about adding an exported genpd
> >interface for this that drivers can call, for example.
> >
> >Then I would rather see a proper debugfs interface, where userspace
> >can both see the available states and choose which one to
> >disable/enable. Would that work?
> >
> Sure, that would work. Any recommendations for existing debugfs node
> that we can add this to or something new?

I think there are two options:
1. A specific "enabled-states" node containing an array of values, one
value for each available state. Like "on off on", if there are three
states available, for example.
2. Convert into having a per idle state subnode/directory and then add
a "enabled" node for each state.

I guess the second option is more straightforward and easier for user
space to deal with, but I have no strong opinions.

Perhaps there is a third option as well?

Kind regards
Uffe

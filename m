Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC394118F9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 19:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfLJSR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 13:17:29 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43350 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbfLJSR3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 13:17:29 -0500
Received: by mail-pf1-f195.google.com with SMTP id h14so223326pfe.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 10:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xnqsR6KxRMPZn1DprBXkpQaD3O7a0GCSa9jFkA9nGgk=;
        b=tGzB/8kPxisFB1SLe4nogXiJNwsTcpnhtsQWeGCUCX7a94oYWAwsPz1bh4sv1IIA0a
         H66W++HcFvvpP65d9zmekil7amPTrVNIfjqad+Iz36hnumA+LrZ1kieJpgm1ExqhL0xF
         a2t6GgO8hiE9Rxp7zbScJSJqcb5pX7p6Bq8Kw+EIYwcVv9Se6oR+hVd/R4kaTE0gfShK
         xF37SP/FwoorrTF/zKQD5UeKzEdYK0KWDbWj0fA4zMk6nkKPR76OhQOeqB5zXjNKRC5P
         jyXF8+hileVU8sJgbKcNF5oPVJCI7wEjMEOdlEaOR0jyVRhZvIO4lCDwvob2MMQ8uDL6
         3FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xnqsR6KxRMPZn1DprBXkpQaD3O7a0GCSa9jFkA9nGgk=;
        b=afaj/YBefhfsH9nweN32rTZlcvfWzEd15GTu7f5Jn1EcTuGG3yLgW/JXYoVifoMIuh
         Uyb9WlaWAnE5NLLxaVljsJ4AqIHyDMo2ODSoiJ60rwAQLyu9VC4veil1IhFh90D/JdcH
         BFCydJv1wltY2AI/hs7IaVz6ZOJ0Qa6P9VaQSW+fu/0u29lxains/HjN7LF9KQfWI/dr
         OpfvybtqQQEIJcYpkCSl1AXFJ3NlM4xiEQlOzB3B7Qm5JpD/bz75gkmfqsKSs0z+noaI
         /O5cCKy5XqPizCZRWc46Y8FBIokg4HH7upiGYrq72lNAydv/V6UEuGlHwctGEqIm3Lmf
         zwpQ==
X-Gm-Message-State: APjAAAXmxwlvD6e9ol2b5w5TnFyMJJUeZOeYyW7DWXYmAS7hNZS9bL5V
        jKyAy2a9UhYupEs3rFM2crJWWQ==
X-Google-Smtp-Source: APXvYqyJsFcqNjXcVcRsCHF1sgL46PHL0nJ7NBvxo6MpRW+/Q+hq7cdNhP7wCmyiABz2y2xhrm9JPw==
X-Received: by 2002:aa7:8687:: with SMTP id d7mr36544154pfo.164.1576001848883;
        Tue, 10 Dec 2019 10:17:28 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u190sm4272842pfb.60.2019.12.10.10.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 10:17:28 -0800 (PST)
Date:   Tue, 10 Dec 2019 10:17:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
Message-ID: <20191210181725.GD314059@yoga>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <1573068840-13098-2-git-send-email-agross@kernel.org>
 <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
 <20191108031854.GA12993@hector.lan>
 <20191210105737.GB228968@gerhold.net>
 <CAHLCerPs8+Fp1N-x7cQ2ETQ8d+fHN5b08V-jVFyFdQLYDndoBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerPs8+Fp1N-x7cQ2ETQ8d+fHN5b08V-jVFyFdQLYDndoBA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Dec 09:36 PST 2019, Amit Kucheria wrote:

> On Tue, Dec 10, 2019 at 4:27 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> >
> > On Thu, Nov 07, 2019 at 09:18:54PM -0600, Andy Gross wrote:
> > > On Thu, Nov 07, 2019 at 07:36:03PM +0530, Amit Kucheria wrote:
> > > > (Removing arm-soc)
> > > >
> > > > Hi Andy,
> > > >
> > > > On Thu, Nov 7, 2019 at 1:04 AM Andy Gross <agross@kernel.org> wrote:
> > > > >
> > > > > Arnd, Olof, and Kevin,
> > > > >
> > > > > I have one slight faux paux in this pull request.  A drivers: soc change got
> > > > > into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
> > > > > without messing up a lot of people who depend on the SHAs not changing.  So I'm
> > > > > sorry for this inclusion.  I'll scrub this better next time.
> > > > >
> > > > > Andy
> > > >
> > > > > ----------------------------------------------------------------
> > > > > Amit Kucheria (5):
> > > > >       arm64: dts: qcs404: thermal: Add interrupt support
> > > > >       arm64: dts: msm8998: thermal: Add interrupt support
> > > > >       arm64: dts: msm8996: thermal: Add interrupt support
> > > > >       arm64: dts: sdm845: thermal: Add interrupt support
> > > > >       arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
> > > >
> > > > One of my patches to add interrupt support to msm8916 tsens is missing
> > > > here. Specifically this one:
> > > > https://patchwork.kernel.org/patch/11201853/
> > > >
> > > > Will there be a second PR this cycle?
> > >
> > > I can work up another and throw it on top.
> > >
> >
> > FYI, the patch seems to be still missing in 5.5-rc1.
> > tsens now fails to probe on MSM8916 with:
> >
> >   qcom-tsens 4a9000.thermal-sensor: IRQ uplow not found
> >
> > Can you queue up the patch as fix for 5.5?
> 
> Indeed. Andy/Bjorn, let me know if you need anything from me to get
> this into -rc2.
> 

I'm pulling in some fixes for a rc-pull, so I could add it there.

But why are we breaking backwards compatibility with existing dtbs to
add a new (optional) feature? Shouldn't there be a rc-fix in the driver
for this regression?

Regards,
Bjorn

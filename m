Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD43432E2F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 08:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhCEHcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 02:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCEHcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 02:32:02 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5ADC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 23:32:01 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id s23so1423733pji.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 23:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MTdKQB2Gsmruy+Q9zWhpChcNm8Ichv3FAZ+t4aTfi4c=;
        b=zxHU1IOGfcqjMkpH7aTe2arIDCiUtW4kQuFhkYjGeEBTiHQMVnFanCEiKO2hvymCDm
         nmAcgkrCw/Ej1nCed0RQFrw5nTx0i3p055ukKJ4Y3mRxwTMzC53E9m4Rx0+kvCFOV7ye
         VRIO+i3k1h2phAZwtk9KWKAYdqyoPOkyjmGw43tZeJSr44J51t7JuCRJrRwuZtH5MOEk
         hHZ+uSOrocxOk/0PCntiK6ltoHhSsnsCY5k09oXQIrYoYaqeElz3A1LLw4aHto3nFhfR
         wlFpQ2IyXHTl3L5I85ZDhF7M8v7WCJ2G8gLTFmzJoSXLJ8amjhoC1caDtxJhInztatRO
         t0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MTdKQB2Gsmruy+Q9zWhpChcNm8Ichv3FAZ+t4aTfi4c=;
        b=QgQmgw4+oCrSTFAGyBnUk4dmVxyh8LHoo00NqK7p/YaNvooO2BfcObC4mMX+wxyFFa
         +dLBiDkNd1CRgZYJMJ/3crXyiPUctfHsp2oleMwR5sAZzQxxm13sNlSTAk878aE0abVD
         i9a87dTymeiRakWMjns4j3BiDX+DE+KON4hrMQGbKjzbGvtXAULQKG7vnuYqiKyHzB03
         vOC1aAQpKhGWaMuoIhKW8aPq2n1oZCFrX8CPgByizBuqlEacaFyOnrOkrgaNHPx9BuQr
         P3WGKPvkam/WwRNn8ttecIuqcSqYbnu6O4QCqQcgKkhriXGghew+a16OfvvUcFs8f4nH
         lmLw==
X-Gm-Message-State: AOAM533aWpPPK/C5UhmBYMMax1iX7nWcL/pzDEQrzbm5y/8wr47lg/IQ
        5D/tBwSS5MgkXoNOQsYVJpud0w==
X-Google-Smtp-Source: ABdhPJyjvG+QHEVO9SJWduVkRkCLdX9UN/zRTwyetVnMryZdVVG46qnM910uHz5g1IHNHoE6WNlrpg==
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr9112733pjb.19.1614929521292;
        Thu, 04 Mar 2021 23:32:01 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i66sm1464028pfe.31.2021.03.04.23.31.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 23:32:00 -0800 (PST)
Date:   Fri, 5 Mar 2021 15:31:55 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: efi: add check for broken efi poweroff
Message-ID: <20210305073151.GI17424@dragon>
References: <20210305065120.11355-1-shawn.guo@linaro.org>
 <CAMj1kXHOXOX6V735tLPxcVUAAM0AeZkLKyOUDKTPvazLjjrQ6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHOXOX6V735tLPxcVUAAM0AeZkLKyOUDKTPvazLjjrQ6Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 08:01:02AM +0100, Ard Biesheuvel wrote:
> On Fri, 5 Mar 2021 at 07:51, Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > Poweroff via UEFI Runtime Services doesn't always work on every single
> > arm64 machine.  For example, on Lenovo Flex 5G laptop, it results in
> > a system reboot rather than shutdown.  Add a DMI check to keep such
> > system stay with the original poweroff method (PSCI).
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> What is the point of using EFI runtime services on this machine if
> poweroff doesn't work either?

Hmm, I'm not sure how many EFI runtime services are being used by
kernel, but this is the only one broken I have seen.  Not sure we want
to disable the whole thing completely.  Also, I'm looking at commit log
of 0c5ed61adbdb ("efi/reboot: Allow powering off machines using EFI")
below.

    Not only can EfiResetSystem() be used to reboot, it can also be used to
    power down machines.

    By and large, this functionality doesn't work very well across the range
    of EFI machines in the wild, so it should definitely only be used as a
    last resort. In an ideal world, this wouldn't be needed at all.
    
    Unfortunately, we're starting to see machines where EFI is the *only*
    reliable way to power down, and nothing else, not PCI, not ACPI, works.

It seems poweroff via EFI runtime services is known not working for
every machine, and was meant to be the last resort if nothing else can
power off system.  If we try PSCI first on arm64, you do not see my
patch at all :)

> Can't we just boot this thing with
> efi=noruntime?

We are trying to get arm64 laptop support into distros, and patching
kernel cmdline with 'efi=novamap' is already a pain.  We do not really
want to have more of it.

Shawn 

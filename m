Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BEC32EEC8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 16:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhCEP1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 10:27:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhCEP04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 10:26:56 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37748C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 07:26:54 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id l7so2402703pfd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 07:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDCKmBwc3bmMEBeKHwUIXHxVyjgt+fwdnRL0e8+Ediw=;
        b=KZt6rrRcmmi/1o96N10stoXRZ5QCvZ2TAAwGVtwogJS8ffUE5/M8ztqblAdZAh0jCG
         FaEeR0yAAgUjlUieAy2SXWJL9DC2bHA/brkU97Cj7QkWywmjuUOb0e6kcQIN8QrnapAI
         h6pO+7pUwMdp8kwTC7Yh5JSJeYKr+UO+FW6CxTrPpJtsVuMCa5SuSnvfBzmuSBS5gBT/
         RWOMquCw06w/c7gUJOYa55GoHyACRNpNa58RerExY3T9fU+pO2hDhTaUiw3Z3fmtNVrG
         WA3QrF/To8y9aLCM9pw4YsuktDauU6jammBebapt4PwKxapHAARU4Nk889YWL6Fvmhja
         GdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDCKmBwc3bmMEBeKHwUIXHxVyjgt+fwdnRL0e8+Ediw=;
        b=ha0ARr5KSJ1ncb+FFdJLNv9O2L1UQu2pD01gnCwwteTwJMdXTBUb3ynH7YwiaDEjmW
         /BuoMOC5J2teNHwL8c7ic2n+38zIq2nnu8mdmjWV51IQUMyKFL73iXR4vml5D15ISEpn
         m7WsaAH3kooLaspvDHIABtoIsUk0ninIU63wemU2R3S52auOTxsYEzivCI9uSPzZu/gz
         5Jo7BdH5QIXAVKPyaPIKK6wa2HNGnb3LtZTOqZ0l8t4m6QU8iAF3ExDiBMEJ3BEFsqEA
         QoJ9Z+kO58iAVCstOMx+/vLN6JeyOqFccvBWVLjl/pdAouQNDIgBC4OQERgPOBwRDkik
         BI9w==
X-Gm-Message-State: AOAM5320Yz03s3g/jBsRe5WvFMvqJgE07K8Xgwt/W2gRglRegiW+ye4c
        d8VuJ2vdt8tDbyovKV9okb0IW19U1pjqGt+aHUWwDuClEIXp9g==
X-Google-Smtp-Source: ABdhPJwfjAwDJaXEg1UXY+Z3ENUzQHqtttN+4HYwhpSeenHpyY8Ds95bLX58l0XlNkNHIbSClZcGKHfqwX3XYkYf4M4=
X-Received: by 2002:a63:2262:: with SMTP id t34mr9374741pgm.303.1614958013680;
 Fri, 05 Mar 2021 07:26:53 -0800 (PST)
MIME-Version: 1.0
References: <1614953347-10192-1-git-send-email-loic.poulain@linaro.org>
 <153fe801-3855-5aa3-8698-ac7fde697255@codeaurora.org> <CAMZdPi_+hpUkzpxKc1+K=xes=WZtkknaVarfgnfnYuP_a=kiBQ@mail.gmail.com>
 <4ea01db5-9bdf-e002-8d1f-e272853edfcd@codeaurora.org>
In-Reply-To: <4ea01db5-9bdf-e002-8d1f-e272853edfcd@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 5 Mar 2021 16:34:48 +0100
Message-ID: <CAMZdPi82JuqEAj3dWCj03JNRkEtANPW8dcQmkSDqgiVXG6VxOw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pm: Change mhi_pm_resume timeout value
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 5 Mar 2021 at 16:09, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 3/5/2021 8:08 AM, Loic Poulain wrote:
> > Hi Jeffrey,
> >
> > On Fri, 5 Mar 2021 at 15:49, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >>
> >> On 3/5/2021 7:09 AM, Loic Poulain wrote:
> >>> mhi_cntrl->timeout_ms is set by the controller and indicates the
> >>> maximum amount of time the controller device will take to be ready.
> >>> In case of PCI modems, this value is quite high given modems can take
> >>> up to 15 seconds from cold boot to be ready.
> >>>
> >>> Reusing this value in mhi_pm_resume can cause huge resuming latency
> >>> and delay the whole system resume (in case of system wide suspend/
> >>> resume), leading to bad use experience.
> >>
> >> I think this needs more explanation.  The timeout is a maximum value.
> >> You indicate that 2 seconds is more than enough for any MHI device to
> >> exit M3 (citation needed), but 15 seconds is too much?  The difference
> >> should only be apparent when the device doesn't transition in the timeout.
> >>
> >> Put another way, this doesn't say why 15 seconds is bad, if every device
> >> only needs 2, given that wait_event_timeout() doesn't always wait for
> >> the entire timeout value if the event occurs earlier.
> >
> > Yes, right that deserves an explanation: depending on the platform and
> > the suspend type (deep, s2idle), the PCI device may or may not lose
> > power. In case power is maintained, there is no problem and the
> > controller is successfully moved to M0. But in case of power loss, the
> > device is going to restart, and MHI resuming is going to timeout and
> > fail since M0 will never be reached. On PCI side we simply
> > reinitialize the controller in case of resume failure. So in other
> > words, MHI resume is expected to fail in some cases and it should be
> > handled with minimal impact on the system.
>
> Can we detect the power loss in far less than 2 seconds, and abort the
> resume process?  Waiting for the entire timeout, regardless of the
> value, in the power loss scenario you describe seems less than ideal for
> the system impact you are attempting to optimize.

That's a good question, like checking the state is M3 before trying
anything, need to check that.

Regards,
Loic

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702B632ED95
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 16:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhCEPAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 10:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbhCEPA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 10:00:26 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D76C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 07:00:26 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id r5so2174090pfh.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 07:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNyM+5SRItsbGyX8+njEF14B2e8cEYOH3ujnU32jylY=;
        b=Imcg4NUpaa278Yl6xwoevDsGrsFnN8llIjE0TqlVPhHYEdiWjgLV5yw6bh8m87cl87
         bcuTl1JWCBJHXyHZO2RtrYkqgtKY4d1xqIS7e+a31P9doYLtv1zsZzacUgPFmKaDXnSA
         8AFtQILvUD3PioapGSFW08s5m3nwdlO3+AnAr329yDPN7LqFtVfHOZ++3ouawHlwN3Rw
         QO/oZ0ZcrvS2eWXUPxA7kKCZTmBEgLjybrTmX9pAZpJ+ac1pmDjxxXGosGLJu6fCX9oa
         wjpAxgRlcnOc+h5NgLAnCOxJIGX9S+W8vPylQgzKoXgF/rJXbqGwachfQNPEFIrbF05b
         ECIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNyM+5SRItsbGyX8+njEF14B2e8cEYOH3ujnU32jylY=;
        b=kq7acRTfNBi70IRQ3XUxSX3TVJqQUWDEBxzxkQaX5kxRkWDIBVoAe/T3bDbHTUbL8d
         0itbjldastQcr/mBl4/Ce8LpxTBnO49qkeLj7m/AXrRMObk/U80ql0m6F9AGkLd9Drw+
         NRsILlL6RA6gdIIJgK4LAbcgkEVshMFiug1IEK2ZXXiXOQHW+h5VKY3Tew1ixn9FyjlC
         V7LfdA9F++5vNW0wihZ+NTnbqL7Zntz97Y2XaOngaFftUYJB1+WLOSauTRJUk0QgxkJM
         KRykxJf56PWrYz+kwmPoWvM2uavnF/ptXAbgJp0qYUeL+DxEZewcWBT2HcaNcfYMXEZY
         bzfw==
X-Gm-Message-State: AOAM533Keb1hxDvAl19t4IH+ca1MM8n6bu9hcciBEA2MT0vW33UfnV/N
        76qjXCuXo7A9WgsHnF6kNp8QKScQqeMBpV25vcgpag==
X-Google-Smtp-Source: ABdhPJxoJvTK+gcrgiompDvvTJIcNnvOvJIGlYM5/ZxRqIaQj87nE5Gq7hGftnfjl3rHS9321gTxUa/HPo79VV//LxQ=
X-Received: by 2002:aa7:86d9:0:b029:1ef:4f40:4bba with SMTP id
 h25-20020aa786d90000b02901ef4f404bbamr6270694pfo.54.1614956425726; Fri, 05
 Mar 2021 07:00:25 -0800 (PST)
MIME-Version: 1.0
References: <1614953347-10192-1-git-send-email-loic.poulain@linaro.org> <153fe801-3855-5aa3-8698-ac7fde697255@codeaurora.org>
In-Reply-To: <153fe801-3855-5aa3-8698-ac7fde697255@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 5 Mar 2021 16:08:21 +0100
Message-ID: <CAMZdPi_+hpUkzpxKc1+K=xes=WZtkknaVarfgnfnYuP_a=kiBQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pm: Change mhi_pm_resume timeout value
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey,

On Fri, 5 Mar 2021 at 15:49, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 3/5/2021 7:09 AM, Loic Poulain wrote:
> > mhi_cntrl->timeout_ms is set by the controller and indicates the
> > maximum amount of time the controller device will take to be ready.
> > In case of PCI modems, this value is quite high given modems can take
> > up to 15 seconds from cold boot to be ready.
> >
> > Reusing this value in mhi_pm_resume can cause huge resuming latency
> > and delay the whole system resume (in case of system wide suspend/
> > resume), leading to bad use experience.
>
> I think this needs more explanation.  The timeout is a maximum value.
> You indicate that 2 seconds is more than enough for any MHI device to
> exit M3 (citation needed), but 15 seconds is too much?  The difference
> should only be apparent when the device doesn't transition in the timeout.
>
> Put another way, this doesn't say why 15 seconds is bad, if every device
> only needs 2, given that wait_event_timeout() doesn't always wait for
> the entire timeout value if the event occurs earlier.

Yes, right that deserves an explanation: depending on the platform and
the suspend type (deep, s2idle), the PCI device may or may not lose
power. In case power is maintained, there is no problem and the
controller is successfully moved to M0. But in case of power loss, the
device is going to restart, and MHI resuming is going to timeout and
fail since M0 will never be reached. On PCI side we simply
reinitialize the controller in case of resume failure. So in other
words, MHI resume is expected to fail in some cases and it should be
handled with minimal impact on the system.

Regards,
Loic

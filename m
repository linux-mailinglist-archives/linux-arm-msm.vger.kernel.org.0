Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E4632EFB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 17:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhCEQIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 11:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhCEQI3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 11:08:29 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902F0C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 08:08:29 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id 16so947372pfn.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 08:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZUrSsflmXrJKzBBajhnta1UCm2xCwUXwlSF9VSLPRY=;
        b=NNB03kRqRD0W09gfztnMw3F6UhbQU4z/9keZ2v9YSB1yISieuoBTwUBTmeIa1xcE+4
         rQaKQ1VO7c+6aQjdq5aKxFTfBHj93Epu/cSP3XWx2eoQSn5AcHJBPJpjUbJrmRVO3YnN
         7L+eUmlJkT6UVpfkRthBoJRAR5+6NrO9GJUngl5BL32W//tq1vXz3AKYfvIOIXvYFB/2
         eRm/9V1oSDYqPUqElBbLz1aYQahy7+93nGXBIjClmOopzHS+Qin+kbthTbx0eDukxlap
         8yf1PYrr1YYvr3WmqpIMM8hQQzsCKUQASnYKcEXCgACDcoRN9wowEZteJsZPs+O3o2QK
         PChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZUrSsflmXrJKzBBajhnta1UCm2xCwUXwlSF9VSLPRY=;
        b=hhJdsBAvU9SGYX6Qw/aKVMNFaBtKMUVL76ZzxLByHllrT38EizX3OWMZLjXBC+DIC8
         tr3fwdMBq7sd+AsVNJ53RKhdsuaOiRUMzGD9vnNG3Zw8rD/Oy1r2aGFg0WQO0KnpxR6E
         wUs1cU9pvgI0ECJXr29cd9vrZ8x2GwBvVjmNxDRbf1HSsvyJcTjzoTXWJr2uXVll8i3c
         bjcQF75jbrL62ALp6+O7acNv2ihDTd+rquAB/Z4naaFY/ukgjTk6E4UgPgEtmMVmIisN
         7QPaOxnQbYB158siiKqx8uV9VyMlL51QlHK2B/XfUONSqn7Mdr2Wgmw2mQ7QPpLmBgmu
         2NiA==
X-Gm-Message-State: AOAM5314t/5vc/1Bek2WwpWF1jKvTPgT6VVbKvBuafeFuV7v60KCF3Qz
        njiE/TFETnzS735mr3O4m8c5c8gWrkQxgqSKSaDEPQ==
X-Google-Smtp-Source: ABdhPJyyJFUdLKi5tNCq54S8cplWOuJO3FoPZ7aZQJwnP4RUGHog3RWEeJr8fhZGxijVQPJp6+xQnEWYTMZjvOpa4pE=
X-Received: by 2002:aa7:9341:0:b029:1ee:ee87:643a with SMTP id
 1-20020aa793410000b02901eeee87643amr9529479pfn.55.1614960509017; Fri, 05 Mar
 2021 08:08:29 -0800 (PST)
MIME-Version: 1.0
References: <1614953347-10192-1-git-send-email-loic.poulain@linaro.org>
 <153fe801-3855-5aa3-8698-ac7fde697255@codeaurora.org> <CAMZdPi_+hpUkzpxKc1+K=xes=WZtkknaVarfgnfnYuP_a=kiBQ@mail.gmail.com>
 <4ea01db5-9bdf-e002-8d1f-e272853edfcd@codeaurora.org> <CAMZdPi82JuqEAj3dWCj03JNRkEtANPW8dcQmkSDqgiVXG6VxOw@mail.gmail.com>
In-Reply-To: <CAMZdPi82JuqEAj3dWCj03JNRkEtANPW8dcQmkSDqgiVXG6VxOw@mail.gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 5 Mar 2021 17:16:24 +0100
Message-ID: <CAMZdPi-vn3GSon+QhL+4=qwyO_mnJyPvMpFXTz3_c686VQqXoQ@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pm: Change mhi_pm_resume timeout value
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 5 Mar 2021 at 16:34, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> On Fri, 5 Mar 2021 at 16:09, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >
> > On 3/5/2021 8:08 AM, Loic Poulain wrote:
> > > Hi Jeffrey,
> > >
> > > On Fri, 5 Mar 2021 at 15:49, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> > >>
> > >> On 3/5/2021 7:09 AM, Loic Poulain wrote:
> > >>> mhi_cntrl->timeout_ms is set by the controller and indicates the
> > >>> maximum amount of time the controller device will take to be ready.
> > >>> In case of PCI modems, this value is quite high given modems can take
> > >>> up to 15 seconds from cold boot to be ready.
> > >>>
> > >>> Reusing this value in mhi_pm_resume can cause huge resuming latency
> > >>> and delay the whole system resume (in case of system wide suspend/
> > >>> resume), leading to bad use experience.
> > >>
> > >> I think this needs more explanation.  The timeout is a maximum value.
> > >> You indicate that 2 seconds is more than enough for any MHI device to
> > >> exit M3 (citation needed), but 15 seconds is too much?  The difference
> > >> should only be apparent when the device doesn't transition in the timeout.
> > >>
> > >> Put another way, this doesn't say why 15 seconds is bad, if every device
> > >> only needs 2, given that wait_event_timeout() doesn't always wait for
> > >> the entire timeout value if the event occurs earlier.
> > >
> > > Yes, right that deserves an explanation: depending on the platform and
> > > the suspend type (deep, s2idle), the PCI device may or may not lose
> > > power. In case power is maintained, there is no problem and the
> > > controller is successfully moved to M0. But in case of power loss, the
> > > device is going to restart, and MHI resuming is going to timeout and
> > > fail since M0 will never be reached. On PCI side we simply
> > > reinitialize the controller in case of resume failure. So in other
> > > words, MHI resume is expected to fail in some cases and it should be
> > > handled with minimal impact on the system.
> >
> > Can we detect the power loss in far less than 2 seconds, and abort the
> > resume process?  Waiting for the entire timeout, regardless of the
> > value, in the power loss scenario you describe seems less than ideal for
> > the system impact you are attempting to optimize.
>
> That's a good question, like checking the state is M3 before trying
> anything, need to check that.

Ok, please discard this patch, I've submitted another change that
takes care of this more properly.
Thanks, Jeffrey for challenging this.

Loic

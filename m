Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7491D46E12B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 04:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhLIDO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 22:14:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbhLIDO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 22:14:59 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5743C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 19:11:25 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bi37so9441447lfb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 19:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c+zQKGqZr8HXn102ZG5ijRoDp7kpXqQXnN4PdMGmbcg=;
        b=jYx3n3tG3V6uw2IXXiIyTTwc4IaIMPdJFd/JgAw0N80PfaQM1Oy+Oef/S7yoz7CaV0
         1o3rsj6avNqKZ46XIrNvYHADvRgO0udYMlcMXtgV7PO8wEGHgDq8dvh9hcJeosAy1NOt
         6Ubry5ylivFKI0KcuaJZPXJ7hTkJbpoZe9ATgb5Q9Cim4qxXGNmIbTRilkKBg9bSxVQK
         J8AJY9RbGy63vzQCDr5uVUGX7AxIUhBrKayqUdPM5ObNm0dpNvmaP95ReAtSoJcNiZAX
         NAj5+urPVmDogqR+DOAagoN4BqF8fouxUE8n/jd3RMhBFDthm86uwR2BFKoxb+8/HDNK
         x5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+zQKGqZr8HXn102ZG5ijRoDp7kpXqQXnN4PdMGmbcg=;
        b=xaHqQMtOGnZj0rJ42eij7/bgOqWFEj8U9029y+vayE5f7w1HCzE1jfDr0hsMFKOHBB
         Q8MV/rydYuI6nivdEREm4dT0XRJrG6L83ZSvrjXRdX9lCic+2aXvzVBQOlhj0fcE9GUe
         uxYJ4svsy+faPTAfDVZ4EIWuUdM+sktRU7o4ety8OT/CQ7Tkp5BmB1Jc1kEGoMcarng2
         MhPRggJCAZFiEnJsLbSdPdUkN1Zz1YBPcBvDa8I7it+MxuGhLDOxR9FZIw3moAA6Swmz
         coK6rz+iT101mNmY1ABzjWJoUSktrOr44D2slBKOXJ6XYykL/1Hy/PixkT5cmBPxyUmR
         5n/A==
X-Gm-Message-State: AOAM530kYmiqAZ3M9Io0hJnBNk8QPyBW7IVji00WBh3vz8HsVCbE1X55
        VOg5CJvQsA5xuShzxAeuLIVs354aEb2v4SVtFslDtw==
X-Google-Smtp-Source: ABdhPJxMfltZiIgin1roB5XH9E4O9k9cjPWiXPuBF9cRXFGcERVh6IPLOCF1yrPcWr9jbe9xAOcI0Xr+CQaR9dW37eE=
X-Received: by 2002:a19:760d:: with SMTP id c13mr3280695lff.661.1639019484116;
 Wed, 08 Dec 2021 19:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
 <YZ2x+xuvnHC48MHg@ripper> <CALAqxLV7YzuHLzNFSWawjpoJGb3WwO4bgnMN_5mWoHmB582kZw@mail.gmail.com>
In-Reply-To: <CALAqxLV7YzuHLzNFSWawjpoJGb3WwO4bgnMN_5mWoHmB582kZw@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 8 Dec 2021 19:11:13 -0800
Message-ID: <CALAqxLWjK4h-ghF5s8qV6Q3Wp3K1N816dTfiLNatBTms6NDe3A@mail.gmail.com>
Subject: Re: [PATCH v2] media: venus: Synchronize probe() between venus_core
 and enc/dec
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Tadeusz Struk <tadeusz.struk@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 30, 2021 at 8:49 PM John Stultz <john.stultz@linaro.org> wrote:
> On Tue, Nov 23, 2021 at 7:29 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > Rather than trying to synchronize away the side effects of
> > of_platform_populate() I think we should stop using it.
> >
> > I had the very same problem in the qcom_wcnss remoteproc driver and
> > in below change I got rid of that by manually initializing a struct
> > device for the child node. In the event that the child probe defer I
> > would just probe defer the parent as well.
> >
> > 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")
> >
> > The change might look a little bit messy, but the end result it much
> > cleaner than relying on various locks etc.
> >
> >
> > But in the qcom_wcnss case I have a child _device_ because I need
> > something to do e.g. regulator_get() on. I fail to see why venc and vdec
> > are devices in the first place.
>
> I definitely agree with Bjorn that all this asynchronous component
> probing feels overly complicated, and a rework is probably the better
> solution.
>
> Though my only question is:  is someone planning to do this rework?
>
> In the meantime, Tadeusz' patch does resolve a *very* frequent boot
> crash seen when the venus driver is enabled.
> So Stanimir, should we consider merging this as a stop gap until the
> larger probe rework is done?

Stanimir? Does the above sound reasonable?

thanks
-john

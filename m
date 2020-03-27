Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80792195D8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 19:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgC0SWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 14:22:46 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41432 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0SWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 14:22:45 -0400
Received: by mail-ua1-f68.google.com with SMTP id f9so3861318uaq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMqfnFJfOBNCe0ahBd62eMY+XQaeL21j8Kfs+r5ufSA=;
        b=G7WCrgscZMeRk0ftZqju+5xPkj8WyWt0QH3xSwv9B6HzbWbeum1U4B64GLxHjdb9Qt
         SG2/j74SA5xNvA3oZy3EIZDIkGC3tvKLMwcsJVmo/w88jkaO/mufMSy/6mKQG5xd+3yt
         r1mtAyJ6LsEE3cGbfLXKlEvld8VsPvVFft+PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMqfnFJfOBNCe0ahBd62eMY+XQaeL21j8Kfs+r5ufSA=;
        b=mrVHt8ydAA54vMmkic6IHwayQDk2XxvJ9j/9dfW2xVBk8mvYBx1qeFQj+BZuYnjVaV
         gMqpldcYDDLDBJQ3ZPx6TwLm6jvZWYD1bIjZHaY/rrOgnD9BYzMzWf1Vu2nzRUVlzzjY
         8rAVOVTQ+t8M/cOpjNkrSMsA3n7v3QKpOq7MwpZi+z3FRQI9G+JjO7FEeqosqJVMq74+
         nxtZFA7q3wRgW+IhgFtIfj7os72JjtYkhOjqpAp4+mTerQhBFT4dnwRdYIw5KNr7KAHU
         kPJuQw+t8q6BZUqKPDk5nXa+cfBQchkDwMkvqUJJRnsmbtrdJMlkOBjdQtlZf6MMJ1M9
         QULQ==
X-Gm-Message-State: AGi0PuZrfYfpjzBASfo9CCGlNT9FUlKE9mxJsJYo5fiDa2tZsoGUDdkJ
        zCdomOnZ1wSmD2BNa9MiTY4p/kSLO7k=
X-Google-Smtp-Source: APiQypKHdiRNY406PG382EfAH7rqD94arH8S0KfdCrJfXclmL3KbK34vcLQKg05e29n5QKoXwZYK2g==
X-Received: by 2002:ab0:6796:: with SMTP id v22mr154665uar.41.1585333363292;
        Fri, 27 Mar 2020 11:22:43 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id l17sm2359208vsq.28.2020.03.27.11.22.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 11:22:42 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id y138so6837937vsy.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 11:22:42 -0700 (PDT)
X-Received: by 2002:a67:7c02:: with SMTP id x2mr277589vsc.45.1585333361883;
 Fri, 27 Mar 2020 11:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org>
 <1585244270-637-5-git-send-email-mkshah@codeaurora.org> <CAD=FV=UQAbqitmYR7=5+AAL8pqy2imzEWf8BTkBoD6mthAwpKw@mail.gmail.com>
 <7bd2c923-4003-a1c4-610f-548e79a94d35@codeaurora.org>
In-Reply-To: <7bd2c923-4003-a1c4-610f-548e79a94d35@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 27 Mar 2020 11:22:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEH_A4SvyX0uv9Z_n+z9_SYcdm2LfsLRK7qALEiOyHqQ@mail.gmail.com>
Message-ID: <CAD=FV=WEH_A4SvyX0uv9Z_n+z9_SYcdm2LfsLRK7qALEiOyHqQ@mail.gmail.com>
Subject: Re: [PATCH v14 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 27, 2020 at 4:00 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
>   * @ctrlr: controller making request to flush cached data
>   *
> - * Return: -EBUSY if the controller is busy, probably waiting on a response
> - * to a RPMH request sent earlier.
> + * Return: 0 on success, error number otherwise.
>   *
> - * This function is always called from the sleep code from the last CPU
> - * that is powering down the entire system. Since no other RPMH API would be
> - * executing at this time, it is safe to run lockless.
> + * This function can either be called from sleep code on the last CPU
> + * (thus no spinlock needed) or with the ctrlr->cache_lock already held.
>
> Now you can remove the "or with the ctrlr->cache_lock already held"
> since it's no longer true.
>
> It can be true for other RSCs, so i kept as it is.

I don't really understand this.  The cache_lock is only a concept in
"rpmh.c".  How could another RSC grab the cache lock?  If nothing
else, can you remove this comment until support for those other RSCs
are added and we can evaluate then?

-Doug

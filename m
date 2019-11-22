Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC5310679B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 09:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfKVIOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 03:14:51 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40866 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfKVIOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 03:14:51 -0500
Received: by mail-vs1-f66.google.com with SMTP id m9so4246401vsq.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 00:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kFTfLz77NfOOoLRcjoRQoDvWTF66Atpx3UZ3GFfFuKk=;
        b=ZwDWMqx+Nhi1GjLIEgBzGDzcliHIzbVRqH6FsQsZS3QO+ytfBXNLs2DUa758bQdkdh
         66Rb4/Vdi7d875DaOKhoxbpjLYWaf87TSMA8tpEP7kinrYYMXfmu+TqSxno3zNOPFxnb
         taF3ZXVXk9b9/EabAcdMnv3VsekR7jctf7FAlzMwS3G2WjpJFtw444OcwMV0vlF4eJZK
         PE78xHeCfX5fr2GCXh2wglMMw/bCdh2Zpw4mvFUsJJsTeKvLuN0e4SwQ60kthIwiFLqj
         Y9E17GJcAzWqbhXPs1AJ1ei9+JDNjX1DKVx8fdlOE1AJcV0vv+3tHgyiAWxazI+fIF3X
         jEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kFTfLz77NfOOoLRcjoRQoDvWTF66Atpx3UZ3GFfFuKk=;
        b=j8ImozEw4HNhrW+Tt5Bnwg1xyuX4zYdkqygrho3PxGK7uqH1RyxddpwuA+ayMAni+Q
         dLWreDJoFBNsEpoVBSwjcHU15a6YmEO03qbCvE+SXBGvE5tidFWLQp1rmCIlxMhqUeYZ
         5KdD/k/7poKeIa6GNNwwfgyOHYs9nE9DhcKMTwAIKdcF3j5phG9TiKgK74K1is1QfVmx
         zeqyMZUg65kJ4QbwvN/r0KIdgyik+JmPdvzRHHUEu+JD7oyC5nnfIkp7Quu69VsSwqTA
         RhEZ2+1aFfgTa+GDiGIS4YJDsvPewdT09sx/aFx2dhvS+7Afuyf83phUplNcQi3AQ0nE
         NmyQ==
X-Gm-Message-State: APjAAAXFMWkhOz1lRMid3forPUhKw04hCecffa1AejCR4bAIXfvHr2OC
        gvQw2scI26xQ7j7KHMwlDrN4+wBtxC3Kg/4N4wy6QA==
X-Google-Smtp-Source: APXvYqzK+cyn8m/2M4gYVtla7YFWEf/01wZBxA5Qm1kV1UpsOuvqk37Xn1jmB1PigbuN81mwvRR8Jtk1ZnfSecXaf4I=
X-Received: by 2002:a67:5ec1:: with SMTP id s184mr9129478vsb.200.1574410490515;
 Fri, 22 Nov 2019 00:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20191029164438.17012-1-ulf.hansson@linaro.org> <CAPDyKFpiMK_P+4+n9wHc+68X6j44XOoTm=J8OXz5HkqoMxOsOg@mail.gmail.com>
In-Reply-To: <CAPDyKFpiMK_P+4+n9wHc+68X6j44XOoTm=J8OXz5HkqoMxOsOg@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 22 Nov 2019 09:14:14 +0100
Message-ID: <CAPDyKFprrtTJ8b5B1AgOWEGNeMGdjS4NbVFU1h4E2SA_oZ2dAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] cpuidle: psci: Support hierarchical CPU arrangement
To:     Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Nov 2019 at 12:00, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Tue, 29 Oct 2019 at 17:44, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > Changes in v2:
> >         - Avoid to affect the non-OSI path with specific changes for OSI. This
> >         forced me to re-order the series and a caused more or less minor changes
> >         to most of the patches.
> >         - Updated the DT bindings for PSCI to clarify and to include the "psci"
> >         name of the PM domain to attach to.
> >         - Replaced patch1 with another patch from Sudeep, solving the same
> >         problem, but in a different way.
>
> Hi Sudeep and Lorenzo,
>
> Apologize for nagging you about reviews, again. Can you please have a
> look at the new version!?

Lorenzo, apologize for nagging you about reviewing this series.

It seems like both me and Sudeep are now waiting to hear from you, can
you please have look.

Kind regards
Uffe

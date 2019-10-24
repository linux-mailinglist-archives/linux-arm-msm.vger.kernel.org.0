Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35698E38F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 18:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409959AbfJXQ42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 12:56:28 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:35796 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409957AbfJXQ41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 12:56:27 -0400
Received: by mail-vs1-f65.google.com with SMTP id k15so7711524vsp.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2019 09:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rD0W5k6f2ID7q7g4hwunZTETm45udsFKDrCjL00gegQ=;
        b=WJ7HqMq2UBUeER1U+qXYYcrUZXUr1aZKzL6BM8wsVvhAnTX2/9EpzTEV0OAwdxKpjT
         4XxQP2j2BOoOmA7Kcr73hQjR534p1UVbpMP2mgd0A0H4Mnzwkf38ON9qkZ3ug7kUsfNL
         JsaiuIhqC5hKpiBUnvYGbo0BOQJdcpw9FN9/kgt+ASAQ9WIm5gK9AI6ozSlLcgaUzXsJ
         AMjX44WEvLZNLvq0f7PIb2uXLvOOpWiQKJZ6dGySm0ueoFN1kQPV0+UoCKMukUzRJJtu
         IzvNtipgrD59PKNainry4UQAL2N9UFPpfBHcLUz0yY+Ak8UtBiIUXcwn5VHPVxo1zpLy
         Dt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rD0W5k6f2ID7q7g4hwunZTETm45udsFKDrCjL00gegQ=;
        b=onMnZQPRn6FjKp4aTSMbdYg/WB11IV6aVwiGxV1kjDeEGClvJwek7yVK0ysIZH3uDg
         FjVdXF3gHRK6vaY1gu0KGxHAZUCxb8ZXrSoL+hKXvbMzhzcsuJOIa2UqMjNeF8U8bd9c
         fzt6eYBbJyF++zrQCc/NRad09JW8aIs98db70rciqkNzvswBGFxoDRGmczDyzlM9/yYK
         d7pU1NFeWhy3kboEfex7dBoqAjp2ak5/F/dNx6T9cEm29h4Ful0wgvQHgsCSg9MkqcWN
         QFOu3ZfAsaSZrvynuYMeZqM2gGtsx4q7Chgu9LaHfkTKZngev/CdhwGzNxutcwqeJVFD
         KRCg==
X-Gm-Message-State: APjAAAVNWEClm63dhGxXFmt/OgxkVr1Eqp3YTHW1MeUGHBXiifpIThdU
        sSfqm590CIMgZA3kZIT/aeWjYdQmTqGRWd5zCzLaQw==
X-Google-Smtp-Source: APXvYqydNX3XdNyNTLcuW9pCNacVJGVnjYiuRC2HH8+frArbLOyWb8AStR5DMWrrX/BK4AfRo9niEvGq44yPGjL/tnA=
X-Received: by 2002:a67:ebc2:: with SMTP id y2mr9732656vso.191.1571936186556;
 Thu, 24 Oct 2019 09:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
 <20191010113937.15962-12-ulf.hansson@linaro.org> <20191024163515.GD22036@bogus>
In-Reply-To: <20191024163515.GD22036@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 24 Oct 2019 18:55:50 +0200
Message-ID: <CAPDyKFq43XrGLDOVZmOeBTLKG0BBvTji6c0Z+cT8uc6PPyp8YA@mail.gmail.com>
Subject: Re: [PATCH 11/13] cpuidle: psci: Attach CPU devices to their PM domains
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 24 Oct 2019 at 18:35, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Oct 10, 2019 at 01:39:35PM +0200, Ulf Hansson wrote:
> > In order to enable a CPU to be power managed through its PM domain, let's
> > try to attach it by calling psci_dt_attach_cpu() during the cpuidle
> > initialization.
> >
> > psci_dt_attach_cpu() returns a pointer to the attached struct device, which
> > later should be used for runtime PM, hence we need to store it somewhere.
> > Rather than adding yet another per CPU variable, let's create a per CPU
> > struct to collect the relevant per CPU variables.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/cpuidle/cpuidle-psci.c | 23 +++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> > index a16467daf99d..1510422c7a53 100644
> > --- a/drivers/cpuidle/cpuidle-psci.c
> > +++ b/drivers/cpuidle/cpuidle-psci.c
> > @@ -23,7 +23,12 @@
> >  #include "cpuidle-psci.h"
> >  #include "dt_idle_states.h"
> >
> > -static DEFINE_PER_CPU_READ_MOSTLY(u32 *, psci_power_state);
> > +struct psci_cpuidle_data {
> > +     u32 *psci_states;
> > +     struct device *dev;
> > +};
> > +
> > +static DEFINE_PER_CPU_READ_MOSTLY(struct psci_cpuidle_data, psci_cpuidle_data);
> >  static DEFINE_PER_CPU(u32, domain_state);
> >
>
> /me just thinking still: If it make sense to keep psci_states separate
> and domain_state and only other things needed for RPM/OSI in the
> structure. I do understand that we modify domain_state and hence
> we can't use READ_MOSTLY then. Let's see, for now keep it as is, thought
> I will think out aloud.

I believe we are striving towards the same goal, which likely means to
separate the non-OSI path vs OSI path, as much as possible. Simply to
avoid any unnecessary operation being done in the non-OSI path. Right?

However, while I was trying to address that, I realized that it would
probably introduce even more changes to the series. Therefore, it
thought it may be better to address these kind of changes on top, as
improvements.

Does it make sense?

Kind regards
Uffe

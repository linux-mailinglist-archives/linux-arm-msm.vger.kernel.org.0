Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEABB3B31B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 12:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389386AbfFJKWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 06:22:24 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:40110 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389171AbfFJKWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 06:22:24 -0400
Received: by mail-vs1-f65.google.com with SMTP id a186so3065944vsd.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2019 03:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pFMIIVsyJBl8LZ+WUnN+JflDTkBBRBPq/m9+UsHc1js=;
        b=kOl0u/Rhe57ubEv7N22/9aZ//K3tjzZfW3Py8ox3gbRPJ6UjiUgoBGpilHmu/nCgmF
         Ll1a6TJ7+gn0FAn103tRUjuk892mvZfOsB00cLYygk5yPXdQvJrPnZIpzYG3zXELtLMJ
         NLCtkLm8RZc0kCi5TJQfbd9CP/i/0rIJmiJvP1UXVlh0gR4m02y3koKodB6L+b382pE0
         M3zkVPlISPXoI3B7+3H/4zEB5JxriVTdDltIcyAUw50l/asQ0SrKbfQjTlnP9OKVTAjE
         njP6gb75FZQe1lldrnZ7yn8rRe+wgtVpTZ0/WmG3SePMX0wfqy+bDDbLj459+WuP2TPZ
         aefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFMIIVsyJBl8LZ+WUnN+JflDTkBBRBPq/m9+UsHc1js=;
        b=hIV96gE6AU+htVKoXdocHYC5y0x/jHxCVUry9faa2K61vej939cJrAFdXDYdWefeIs
         FW4WN47QeP+2+0Pwv2Ps5jbAo/0XWlcdy3HGVF2Afg/pVKqjlO3zan9FaABabfT8QK5D
         BxjuuXyyzBUUnt84oZoD/uKnIe2oqkfR/Ggc1jHly4ZS1U2AQJpyrLdyeMo15+/3io4R
         y0jQbufY6aHYcMoa9DxlRlFJ/WnF0HMHlT5sFA3iN29/9zhu5Bdg8afX2JgcfZFHkhks
         3oXfyo14kSEygAeqdA8TcRDLApKX9QykwJleZDz3mCf6FtKCqlB/udXMZHnoxMa/bvlw
         uKrw==
X-Gm-Message-State: APjAAAU7moKSNtoD9n4O0tWkvinAj9OOUNw1wZwLmLyZmoM9EXPmtCdw
        T4Edfgnboyq8njYkfgSYgxrJZU3IuZeKTxlwLCuCiA==
X-Google-Smtp-Source: APXvYqxDX2qJsmmcFSXEA/D7lgBIhL5BcM//GZ2Awrb+ANPG1PdpnIRRbG98Nj437OF6HC5C/S/rLx9BEVMrPwv/lGw=
X-Received: by 2002:a67:ebc5:: with SMTP id y5mr24379568vso.34.1560162143163;
 Mon, 10 Jun 2019 03:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190513192300.653-1-ulf.hansson@linaro.org> <20190513192300.653-16-ulf.hansson@linaro.org>
 <20190607153114.GI15577@e107155-lin>
In-Reply-To: <20190607153114.GI15577@e107155-lin>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 10 Jun 2019 12:21:47 +0200
Message-ID: <CAPDyKFqooMww0B6vGL56BnG-L=13C3oWeDFx4v1cO9=W9QPwVQ@mail.gmail.com>
Subject: Re: [PATCH 15/18] drivers: firmware: psci: Support CPU hotplug for
 the hierarchical model
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Raju P . L . S . S . S . N" <rplsssn@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souvik Chakravarty <souvik.chakravarty@arm.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 7 Jun 2019 at 17:31, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Mon, May 13, 2019 at 09:22:57PM +0200, Ulf Hansson wrote:
> > When the hierarchical CPU topology is used and when a CPU has been put
> > offline (hotplug), that same CPU prevents its PM domain and thus also
> > potential master PM domains, from being powered off. This is because genpd
> > observes the CPU's attached device as being active from a runtime PM point
> > of view.
> >
> > To deal with this, let's decrease the runtime PM usage count by calling
> > pm_runtime_put_sync_suspend() of the attached struct device when putting
> > the CPU offline. Consequentially, we must then increase the runtime PM
> > usage count, while putting the CPU online again.
> >
>
> Why is this firmware/driver specific ? Why can't this be dealt in core
> pm-domain ? I am concerned that if any other architectures or firmware
> method decides to use this feature, this need to be duplicated there.

What is the core pm-domain? Do you refer to the generic PM domain (genpd), no?

In such case, this is not the job of genpd, but rather the opposite
(to *monitor* the reference count).

>
> The way I see this is pure reference counting and is hardware/firmware/
> driver agnostic and can be made generic.

As stated in the another reply, I would rather start with having more
things driver specific rather than generic. Later on we can always
consider to move/split things, when there are more users.

In this particular case, the runtime PM reference counting is done on
the struct device*, that genpd returned via
dev_pm_domain_attach_by_name(). And because
dev_pm_domain_attach_by_name() is called from PSCI code, I decided to
keep this struct device* internal to PSCI.

Kind regards
Uffe

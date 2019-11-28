Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8947510CFAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 23:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfK1WFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 17:05:17 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39815 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbfK1WFR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 17:05:17 -0500
Received: by mail-vs1-f68.google.com with SMTP id x21so18291592vsp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eg2hwVNG36UdAAXRMWJPY/0013JXkVyMI5qlSVza82Y=;
        b=sLdYI3DYGQsUfNcUWae0ePETum3rBzILoYqPB0E3Nl4lI0tgq8C3M5YyyZ9IMwAZgh
         fgFZVURclM4pRMKVWGDcpP4ckFgw6CmiAKjV6TJH6UtPUy3FGzxu5OjtTzn3Cxc5G94e
         m8DUHKtnrVwdTMQHKW9fiD+GfIhL6dtHA5l7QLI703UKDFr7QLUMI+gfOoNPPT22EzS2
         9veI2zmYFGE+rTuyzeMg6YnnwP8DATz1P7JiPJaEBNYiKbY6BFf1koI8kKMSb0HOs4Kc
         H9Fspg+qY/axrYE0rOAeGJIRi9LyjnzkxVcsFOGvG5xmHLP1Yr/ciNrXMouMYtqtl8pT
         TvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eg2hwVNG36UdAAXRMWJPY/0013JXkVyMI5qlSVza82Y=;
        b=M2EmJ7k0sW+yQCHCagJlN23X4o2jr0jomwSX/v9dzAInuHVDwlgDKeKKVX66khmvtM
         j0/6gIRRgHPtb9hyBJUn3l943Hy6g2CQ2+7owPjbIY+SdpQFQZ/q+0/jz1DXQbtFHu+G
         p21zS+tFrdpnHQ4zhrV+daYN4jUTdTHlTYNjdHf5MCLZZ7vw0KAHbO68pyMwww2VgQ9j
         P3LmIBER1WPyl5NIRVLUO3alPNvtkknqfWar/ad/pOzo2QsahGZuKbmXMBpY+92WLy7/
         4HceKk816jUNg6aLh9ZqP9goWoZkqxL1eQrJTv+j4rNClK+/usrSkSOzRkxNva47ipF+
         97MQ==
X-Gm-Message-State: APjAAAVpBCaVb7SdXcgmuHUi94OaCnHMn/3IaYueN1QJp/myR+uJzfp6
        3EpYHyD5Da/QT7NrjzaPzTqbK7eeYQm2+idzpYjTSA==
X-Google-Smtp-Source: APXvYqy+w2SusbAnYTwpYOPR+3O04TV2fCvs/a6Owbg9BpfbqHj4W+afKqvLkHDe8YOqttHJE93znFv0z6daCoPiM4k=
X-Received: by 2002:a67:2087:: with SMTP id g129mr31887061vsg.191.1574978716243;
 Thu, 28 Nov 2019 14:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20191127102914.18729-1-ulf.hansson@linaro.org>
 <20191127102914.18729-9-ulf.hansson@linaro.org> <20191128141443.GA31123@e121166-lin.cambridge.arm.com>
 <CAPDyKFr1GTAkNyTmLvvC1ovm4yOtMGLOVWA-e-wjGJz2ENdN1g@mail.gmail.com> <20191128183143.GA15793@e121166-lin.cambridge.arm.com>
In-Reply-To: <20191128183143.GA15793@e121166-lin.cambridge.arm.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 28 Nov 2019 23:04:39 +0100
Message-ID: <CAPDyKFoXk9pX0MWnFp+YpiKDzq9wWVPe89J0JqeSkjN+VgJeow@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] cpuidle: psci: Add a helper to attach a CPU to
 its PM domain
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 Nov 2019 at 19:31, Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Thu, Nov 28, 2019 at 06:21:03PM +0100, Ulf Hansson wrote:
> > On Thu, 28 Nov 2019 at 15:15, Lorenzo Pieralisi
> > <lorenzo.pieralisi@arm.com> wrote:
> > >
> > > On Wed, Nov 27, 2019 at 11:29:09AM +0100, Ulf Hansson wrote:
> > >
> > > [...]
> > >
> > > > +struct device *psci_dt_attach_cpu(int cpu)
> > > > +{
> > > > +     struct device *dev;
> > > > +
> > > > +     /* Currently limit the hierarchical topology to be used in OSI mode. */
> > > > +     if (!psci_has_osi_support())
> > > > +             return NULL;
> > > > +
> > > > +     dev = dev_pm_domain_attach_by_name(get_cpu_device(cpu), "psci");
> > > > +     if (IS_ERR_OR_NULL(dev))
> > > > +             return dev;
> > > > +
> > > > +     pm_runtime_irq_safe(dev);
> > > > +     if (cpu_online(cpu))
> > >
> > > It is unclear to me how we handle (or rather we don't) CPU hotplug
> > > with this series - it does not look OK unless genpd code manages
> > > that automatically.
> >
> > The series doesn't handle CPU hotplug at the moment, simply because I
> > am targeting to get the basic support, upstream first.
>
> Basic support must work and that includes CPU hotplug - I don't want
> to merge code that work with assumptions that aren't valid.
>
> > For a functionality point of view, this isn't a problem in my opinion.
> > Simply because the consequence is only that the idle states for the
> > "cluster" will not be reached if there is a CPU brought offline.
> >
> > As we talked about at LPC and as also told Sudeep for the v2 series,
> > CPU hotplug is going to be implemented by using a CPU HP notifier.
>
> Yes, it should be part of the series.
>
> > That should be fine, right?
>
> Yes, hopefully but it has to be part of the series.

Alright, I send a patch on top, asap.

Please review the rest and if it needs a respin, I can fold it into the series.

Kind regards
Uffe

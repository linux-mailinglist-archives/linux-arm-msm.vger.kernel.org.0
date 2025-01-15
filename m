Return-Path: <linux-arm-msm+bounces-45057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 454C6A1160F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 01:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51375169C01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 00:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782212111;
	Wed, 15 Jan 2025 00:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X9KITJsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE0BA3D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 00:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736900650; cv=none; b=mXLO5OpQda+3FOxKSJawlb2f6fppF0b0BDx4qaXfvaJ27i7wLdlu9951o4hL08bYXZpEoneG/3l4CvWE9WO8ApWi22Vx2JVEoO9o1lhWMR67mnM36MavqZGKTHPZTHHSZfm0YleshPupqbathoh649dZaMxLOHIGA2d5va+G740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736900650; c=relaxed/simple;
	bh=GlrHrjyH7schnzpzjXM5JH4X1WNKBqsNsXzi+kBESOg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GN3Xck38mptkwECGysDiCDvdWa2i3ssk204RULcXVCnOYM1hte6xB4iZm61kXEMH8UJeHdFduSaCqt8NZKUzRNNn+Q+TQ0prvo/7vckZFS3h5JzVE/tMDVAV+0nLnZ130Xlw7W3ooaQ8I/IX5l9RmoEuRQeIYUHmH7pQijyW5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X9KITJsz; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6e5ee6ac7so513034085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 16:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736900647; x=1737505447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdkrQTRhznZOHJugzyblEZGatDWjWHhDWzWqyeJbNHU=;
        b=X9KITJszZgbF4fv3rNt7BRDSf9KWL0Cq81XtZ7yjH2kNr7hj3yR7Yq2FZi+r3eYCiX
         sL096YA494ZUk6ZntJzkEf3GSPQDpF6x/mC/fblcTZtV8Bpu3vLHcH8AWmfivAaqwYaH
         Cscyv1proqkA9SOtdll6/BsRLcGRBAccVTPLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736900647; x=1737505447;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdkrQTRhznZOHJugzyblEZGatDWjWHhDWzWqyeJbNHU=;
        b=mGK0EQOEtZDZLzCJAfeuU/0Mw5vz3n/IWnhb/E3lnfuZ9EPXbmU2BiaCY+jJpaMf/F
         tDdOh0txoLAWOTg2dzD+/MO1ajnaknU9J1YWnYEzRkecelS6BaSjG77w7igMhXEb88b4
         cuXkOqbP585/EwGf/zOb2XJ3rNAkXqNnVljebrJswAARF5CnHGVRbQ+wl095/CnRU/ba
         EjoSIahWZMJZYdvbXMWTV5Z2eGkdA9jKJQqX1Pn8mqCfr3pRU0UrRpsJZYAx0wiLI/wY
         PhbRdMGblDCZM3yjeYnLQ7ohGSl/8LxkMHVlj9Ebw4LqiZ9cq+dfUVv4SauPROR7+JXf
         YGAg==
X-Forwarded-Encrypted: i=1; AJvYcCXLtGaZWRK59tLQD2NWYCV3kqyV04lgypjs21fBUR7cFfF/4ARGFkrdTzT+AoFW+sD17/KI6pXxKSP/rnXA@vger.kernel.org
X-Gm-Message-State: AOJu0YzUk7/8O4KDYls7Qk7cwy+GwY+Jw7uQGpwlnue2RRgNVaKtF2i8
	WkdB9YUflRnxbRvKpStSSKkSc+E6ZqHRk4MensQNb7oLkz6OWMG1VOmJXrhD3KmUNjIz34SBoMZ
	AlZkXQS3dtkfnnhwV63TU9phnmSkFvqXOQlBg
X-Gm-Gg: ASbGncvKo6v4SzZ/+MdnPCprigkkCS0jxqStOMkFi2TqD/FUh++A6Wnk9zUoDGwHZ8r
	nzEYld601L0/JYJ+ZYMKhMFuCv31qelQ1wB2TI09f8pOtmD5m5Z7uPUPtoWr5UMumfg==
X-Google-Smtp-Source: AGHT+IGFlnDsW2kYH9Fj+I7/X5kk5DRoyvUl1Vg4TYrbwt2tYG+HP+0yjJ7qusb6i1E+hOnMy50XeRmYAHgeARPLxE8=
X-Received: by 2002:a05:620a:1b8f:b0:7b6:6ffc:e972 with SMTP id
 af79cd13be357-7bcd96fa261mr4559763085a.5.1736900646849; Tue, 14 Jan 2025
 16:24:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jan 2025 16:24:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250110140934.GB2630182-robh@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org> <20250108012846.3275443-6-swboyd@chromium.org>
 <20250110140934.GB2630182-robh@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 14 Jan 2025 16:24:06 -0800
X-Gm-Features: AbW1kvavzIgI9aEsq8_mXYL0R-E63WYKH0DsECCwhvKpTHMjYrqscz7VM-RM9s4
Message-ID: <CAE-0n51sr_D7e66WiSETiSuE3nZaAJwS5KfuYzdVWsLbL=q2zA@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] bus: qcom-sc7180: Attach pm domain to watchdog device
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Rob Herring (2025-01-10 06:09:34)
> > diff --git a/drivers/bus/qcom/qcom-sc7180.c b/drivers/bus/qcom/qcom-sc7180.c
> > index a615cf5a2129..7dfe6b32efef 100644
> > --- a/drivers/bus/qcom/qcom-sc7180.c
> > +++ b/drivers/bus/qcom/qcom-sc7180.c
> > @@ -3,18 +3,140 @@
> >   * SoC bus driver for Qualcomm SC7180 SoCs
> >   */
> >
> > +#include <linux/cleanup.h>
> > +#include <linux/clk.h>
> >  #include <linux/device.h>
> > +#include <linux/dev_printk.h>
[...]
> > +
> > +static int qcom_soc_domain_power_on(struct generic_pm_domain *domain)
> > +{
> > +     struct qcom_soc_pm_domain *soc_domain;
> > +
> > +     pr_info("Powering on device\n");
> > +     soc_domain = gpd_to_qcom_soc_pm_domain(domain);
> > +
> > +     return clk_prepare_enable(soc_domain->clk);
> > +}
> > +
> > +static int qcom_soc_domain_power_off(struct generic_pm_domain *domain)
> > +{
> > +     struct qcom_soc_pm_domain *soc_domain;
> > +
> > +     pr_info("Powering off device\n");
> > +     soc_domain = gpd_to_qcom_soc_pm_domain(domain);
> > +
> > +     clk_disable_unprepare(soc_domain->clk);
>
> How's this going to scale when there are multiple clocks and it's not
> just turn on/off all the clocks in any order? Or when there's ordering
> requirements between different resources.

We'll need different power_on/power_off functions when the ordering
requirements are different. It would be similar to how we have different
clk_ops for different types of clks.

>
> I'm pretty sure I've seen attempts to order clock entries in DT based on
> the order they want to enable them.

Yes, I've seen that too. The order in DT shouldn't matter. The SoC PM
driver will know what order of operations to take, including between
different resources like resets, interconnects, power-domains, etc.
That's the general idea of this driver, it will coordinate all the power
for devices in the soc node, because it's written for that particular
SoC. For example, if there are ordering requirements it can get clks by
name and "do the right thing".

Another goal I have is to power off devices that aren't bound to a
driver, and/or never will be. If we can figure out the runtime PM state
of devices before adding them to the platform bus it would allow us to
power those devices off at runtime or during system suspend if userspace
isn't actively trying to power down devices. Maybe to do that we'll have
to be notified by subsystem frameworks when a provider is registered and
then once all the providers are registered, get the PM resources like
clks and interconnects, etc., figure out if they're on/off, set the
runtime PM state of the device to match, and finally add the device to
the bus. Then we can extend the driver PM core to allow userspace to
turn off devices that aren't bound to a driver, because we've moved the
SoC PM glue out of each driver into this one driver that both adds the
devices to the system and manages the device power.

If a node is status = "disabled" I'd like to still get all the PM
resources for that device and either put them into one overall SoC PM
domain, or in an "unused device" domain that we can have userspace tell
the kernel it's safe to power down those devices that were left in a
(semi-)powered state by the bootloader. Obviously I haven't gotten to
this point yet, but it's another TODO item. We could also populate those
devices but never let them be bound to a driver because they're marked
disabled in DT. Then we don't have to do anything different from devices
that are ok to use, but we waste kernel memory. Either way, the PM
resources for disabled devices need to be dealt with.

>
> > +
> > +     return 0;
> > +}
> > +
> > +static int qcom_soc_add_clk_domain(struct platform_device *socdev,
> > +                                struct platform_device *pdev)
> > +{
> > +     struct qcom_soc_pm_domain *domain;
> > +     struct generic_pm_domain *pd;
> > +     int ret;
> > +
> > +     domain = devm_kzalloc(&socdev->dev, sizeof(*domain), GFP_KERNEL);
> > +     if (!domain)
> > +             return -ENOMEM;
> > +
> > +     pd = &domain->pd;
> > +     pd->name = "wdog";
> > +     ret = pm_genpd_init(pd, NULL, false);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* TODO: Wrap this in a generic_pm_domain function similar to power_on() */
> > +     pd->domain.activate = qcom_soc_domain_activate;
> > +     pd->power_on = qcom_soc_domain_power_on;
> > +     pd->power_off = qcom_soc_domain_power_off;
> > +
> > +     dev_info(&socdev->dev, "adding pm domain for %s\n", dev_name(&pdev->dev));
> > +     dev_pm_domain_set(&pdev->dev, &pd->domain);
> > +
> > +     return 0;
> > +}
> >
> >  static int qcom_soc_sc7180_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> >       struct device_node *np = dev->of_node;
> > +     struct platform_device *sdev;
> > +     int ret;
> > +
> > +     sdev = qcom_soc_alloc_device(pdev, "qcom,apss-wdt-sc7180");
>
> We're going to have to have an explicit call for every child node?

Probably! Or we can populate the "complicated" ones that require
something different and then populate the rest of the nodes that didn't
get populated explicitly with some sort of loop over non-populated nodes
that attaches a simple pm domain that does generic on/off sequencing. I
haven't gotten that far to know if populating everything explicitly will
be a problem.


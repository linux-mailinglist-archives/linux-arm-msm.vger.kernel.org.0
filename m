Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0221EC1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 12:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfEOKa4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 06:30:56 -0400
Received: from foss.arm.com ([217.140.101.70]:40336 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbfEOKa4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 06:30:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9270880D;
        Wed, 15 May 2019 03:30:55 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BE223F703;
        Wed, 15 May 2019 03:30:52 -0700 (PDT)
Date:   Wed, 15 May 2019 11:30:46 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Niklas Cassel <niklas.cassel@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Lina Iyer <lina.iyer@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Message-ID: <20190515103026.GA26759@e107155-lin>
References: <20190508145600.GA26843@centauri>
 <CAHLCerN8L4np0WAY4hTjTnPXFtTK6EH0BXWLXzB-NiRaAnvcDA@mail.gmail.com>
 <20190510091158.GA10284@e107155-lin>
 <CAHLCerM83weBBvwurU45d9_M0Wg49WjDFTRJ6KL8vj7cavz03g@mail.gmail.com>
 <20190513094935.GA4885@e107155-lin>
 <CAHLCerM6SVCx5vdrodh+O5nQ0uDwr7zpvOMxVYtreT9EFk22eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerM6SVCx5vdrodh+O5nQ0uDwr7zpvOMxVYtreT9EFk22eg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 15, 2019 at 03:26:14PM +0530, Amit Kucheria wrote:
> On Mon, May 13, 2019 at 3:19 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Fri, May 10, 2019 at 11:58:40PM +0530, Amit Kucheria wrote:
> > > On Fri, May 10, 2019 at 2:54 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > >
> >
> > [...]
> >
> > > >
> > > > Yes entry-method="psci" is required as per DT binding but not checked
> > > > in code on arm64. We have CPU ops with idle enabled only for "psci", so
> > > > there's not need to check.
> > >
> > > I don't see it being checked on arm32 either.
> > >
> >
> > arm_cpuidle_get_ops in arch/arm/kernel/cpuidle.c checks the method, has
> > to match "psci" for drivers/firmware/psci.c to work on arm32
>
> That is a check for the enable-method, not entry-method.
>
> We don't check for entry-method anywhere, AFAICT.
>

Ah, you right. My eyes can't distinguish between entry-method and enable-method
anymore :(

--
Regards,
Sudeep

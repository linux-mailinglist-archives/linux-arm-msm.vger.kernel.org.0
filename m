Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1544CB10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 11:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfFTJir (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 05:38:47 -0400
Received: from foss.arm.com ([217.140.110.172]:56312 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbfFTJir (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 05:38:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D696360;
        Thu, 20 Jun 2019 02:38:46 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F15B3F246;
        Thu, 20 Jun 2019 02:38:45 -0700 (PDT)
Date:   Thu, 20 Jun 2019 10:38:43 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mathieu.poirier@linaro.org, stephan@gerhold.net,
        david.brown@linaro.org, agross@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: Coresight causes synchronous external abort on msm8916
Message-ID: <20190620093843.GF1248@e107155-lin>
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <CANLsYkxaX2=Bp_BWWUFimC-UmP3L5g=CU7tqjd+xoFVcWG38tA@mail.gmail.com>
 <6bb74dcc-62e4-5310-5884-9c4b82ce5be9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bb74dcc-62e4-5310-5884-9c4b82ce5be9@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 09:53:30AM +0100, Suzuki K Poulose wrote:
> Hi Mathieu,
>
> On 19/06/2019 21:16, Mathieu Poirier wrote:
> > On Wed, 19 Jun 2019 at 12:39, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> > > In this case I'm wondering how it works on the Dragonboard 410c.
> >
> > There can be two problems:
> >
> > 1) CPUidle is enabled on your platform and as I pointed out before,
> > that won't work.  There are patches circulating[1] to fix that problem
> > but it still needs a little bit of work.
> >
> > 2) As Suzuki pointed out the debug power domain may not be enabled by
> > default on your platform, something I would understand if it is a
> > production device.  There is nothing I can do on that front.
> >
> > [1]. https://www.spinics.net/lists/arm-kernel/msg735707.html
> >
> > > Does it enable these power domains in the firmware?
> > >    (Assuming it boots without this error...)
> >
> > The debug power domain is enabled by default on the 410c and the board
> > boots without error.
> >
> > >
> > > If coresight is not working properly on all/most msm8916 devices,
> > > shouldn't coresight be disabled by default in msm8916.dtsi?
> >
> > It is in the defconfig for arm64, as such it shouldn't bother you.
> >
> > > At least until those power domains can be set up by the kernel.
> > >
> > > If this is a device-specific issue, what would be an acceptable solution
> > > for mainline?
> > > Can I turn on these power domains from the kernel?
> >
> > Yes, if you have the SoC's TRM.
> >
> > > Or is it fine to disable coresight for this device with the snippet above?
> > >
> > > I'm not actually trying to use coresight, I just want the device to boot :)
> > > And since I am considering submitting my device tree for inclusion in
> > > mainline, I want to ask in advance how I should tackle this problem.
> >
> > Simply don't enable coresight in the kernel config if the code isn't
> > mature enough to properly handle the relevant power domains using the
> > PM runtime API.
>
> I don't think disabling the Coresight in kernel config will hide it.
> Since the coresight components have the AMBA compatible, the AMBA bus
> driver will definitely try to probe the PIDs via amba_device_try_add(),
> as shown by the backtrace. I assume that is causing the problem.
>

Indeed, all the devices are added on boot irrespective of the configuration.
So either enable the power domain before boot if the kernel configuration
is disabling the runtime PM or any other power domain related configurations.

--
Regards,
Sudeep

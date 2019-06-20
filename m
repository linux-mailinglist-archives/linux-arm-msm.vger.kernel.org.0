Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCBD84CAF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 11:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfFTJfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 05:35:34 -0400
Received: from foss.arm.com ([217.140.110.172]:56156 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbfFTJfe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 05:35:34 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73665C0A;
        Thu, 20 Jun 2019 02:35:33 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52ADD3F246;
        Thu, 20 Jun 2019 02:35:32 -0700 (PDT)
Date:   Thu, 20 Jun 2019 10:35:30 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>, david.brown@linaro.org,
        agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: Coresight causes synchronous external abort on msm8916
Message-ID: <20190620093530.GE1248@e107155-lin>
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619183904.GB937@gerhold.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 08:39:04PM +0200, Stephan Gerhold wrote:
> Hi,
>
> On Wed, Jun 19, 2019 at 09:49:03AM +0100, Suzuki K Poulose wrote:
> > Hi Stephan,
> >
> > On 18/06/2019 21:26, Stephan Gerhold wrote:
> > > Hi,
> > >
> > > I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> > > It works surprisingly well, but the coresight devices seem to cause the
> > > following crash shortly after userspace starts:
> > >
> > >      Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> >
> > ...
> >
> >
> > >
> > > In this case I'm using a simple device tree similar to apq8016-sbc,
> > > but it also happens using something as simple as msm8916-mtp.dts
> > > on this particular device.
> > >    (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
> > >
> > > I can avoid the crash and boot without any further problems by disabling
> > > every coresight device defined in msm8916.dtsi, e.g.:
> > >
> > > 	tpiu@820000 { status = "disabled"; };
> >
> > ...
> >
> > >
> > > I don't have any use for coresight at the moment,
> > > but it seems somewhat odd to put this in the device specific dts.
> > >
> > > Any idea what could be causing this crash?
> >
> > This is mostly due to the missing power domain support. The CoreSight
> > components are usually in a debug power domain. So unless that is turned on,
> > (either by specifying proper power domain ids for power management protocol
> > supported by the firmware OR via other hacks - e.g, connecting a DS-5 to
> > keep the debug power domain turned on , this works on Juno -).
>
> Interesting, thanks a lot!
>
> In this case I'm wondering how it works on the Dragonboard 410c.
> Does it enable these power domains in the firmware?
>   (Assuming it boots without this error...)
>
> If coresight is not working properly on all/most msm8916 devices,
> shouldn't coresight be disabled by default in msm8916.dtsi?
> At least until those power domains can be set up by the kernel.
>

Why do you want to disable in DTS if it's issue with some incomplete
kernel configuration. If power domains are disabled in the kernel, then
the pm_runtime might ignore and proceed assuming the firmware enables
all power domains ON on boot.

--
Regards,
Sudeep

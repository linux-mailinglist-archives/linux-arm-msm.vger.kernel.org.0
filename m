Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 610834ECD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 18:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfFUQOH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 12:14:07 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:17511 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUQOH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 12:14:07 -0400
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Jun 2019 12:14:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1561133644;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=KYSyIaHOav3ZO2XBQ/Ogk5t2GXK9gtYCHwouuD6sHvk=;
        b=XDTmPrkmEo5Ya4cwb62NV/t76GFapxyaJZ/o7oYqd5koSOf6+Wray2Y8RnvGQDujt+
        6KUEA9RbGf3jU8s3O1kRXi9/QotcG2Mjmx5J8DPKIBubCfqiMnnNFBWFoI43pUv6ig4/
        e7MkJp0Dh6EKzkE4v8YUhqM0f//ymfWNWLf6nMWVTKtsTaA6YMAXLjXpd7FA2nJwyzYs
        ttDXQZU1oi7Rlwh74hvQXAtqOEPC+BdZg21s0e0BNuj24k2hZdrSDRAXWaueImbu6wzx
        aj9dfK4vDe4SFGQoip58Jcj6G9gqb1c4xHbyC7iWEMWYrP4uPrYWlldY4TJTAxBYdzRn
        6YMw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8b5Ic/FbYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id m0a13fv5LGAqGUG
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 21 Jun 2019 18:10:52 +0200 (CEST)
Date:   Fri, 21 Jun 2019 18:10:51 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>, david.brown@linaro.org,
        agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: Coresight causes synchronous external abort on msm8916
Message-ID: <20190621161051.GB34922@gerhold.net>
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <20190620093530.GE1248@e107155-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620093530.GE1248@e107155-lin>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 10:35:30AM +0100, Sudeep Holla wrote:
> On Wed, Jun 19, 2019 at 08:39:04PM +0200, Stephan Gerhold wrote:
> > Hi,
> >
> > On Wed, Jun 19, 2019 at 09:49:03AM +0100, Suzuki K Poulose wrote:
> > > Hi Stephan,
> > >
> > > On 18/06/2019 21:26, Stephan Gerhold wrote:
> > > > Hi,
> > > >
> > > > I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> > > > It works surprisingly well, but the coresight devices seem to cause the
> > > > following crash shortly after userspace starts:
> > > >
> > > >      Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> > >
> > > ...
> > >
> > >
> > > >
> > > > In this case I'm using a simple device tree similar to apq8016-sbc,
> > > > but it also happens using something as simple as msm8916-mtp.dts
> > > > on this particular device.
> > > >    (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
> > > >
> > > > I can avoid the crash and boot without any further problems by disabling
> > > > every coresight device defined in msm8916.dtsi, e.g.:
> > > >
> > > > 	tpiu@820000 { status = "disabled"; };
> > >
> > > ...
> > >
> > > >
> > > > I don't have any use for coresight at the moment,
> > > > but it seems somewhat odd to put this in the device specific dts.
> > > >
> > > > Any idea what could be causing this crash?
> > >
> > > This is mostly due to the missing power domain support. The CoreSight
> > > components are usually in a debug power domain. So unless that is turned on,
> > > (either by specifying proper power domain ids for power management protocol
> > > supported by the firmware OR via other hacks - e.g, connecting a DS-5 to
> > > keep the debug power domain turned on , this works on Juno -).
> >
> > Interesting, thanks a lot!
> >
> > In this case I'm wondering how it works on the Dragonboard 410c.
> > Does it enable these power domains in the firmware?
> >   (Assuming it boots without this error...)
> >
> > If coresight is not working properly on all/most msm8916 devices,
> > shouldn't coresight be disabled by default in msm8916.dtsi?
> > At least until those power domains can be set up by the kernel.
> >
> 
> Why do you want to disable in DTS if it's issue with some incomplete
> kernel configuration. If power domains are disabled in the kernel, then
> the pm_runtime might ignore and proceed assuming the firmware enables
> all power domains ON on boot.
> 

At the moment, disabling it in DTS is the only way I have found to make
the kernel boot successfully.

I have tried booting with clk_ignore_unused and pd_ignore_unused but it
does not make any difference. If the debug power domain is the problem,
then I suspect it is not turned on by the firmware on this production
device.

Also see my other reply:
https://lore.kernel.org/linux-arm-msm/20190621160631.GA34922@gerhold.net/



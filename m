Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92EEC4C0EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 20:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfFSSjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 14:39:11 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162]:8968 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfFSSjL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 14:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560969549;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=yE9t/HpOhUCCw92yGlKlu+arbDgwr4eDSSJxIXUUaY0=;
        b=ajhnJvPHZK+S9Xsmcw8SLK+xKb+/osPrBMbKu485FZYgoB4QqROmyw8Y7CYKGulTq/
        PbnO8fB1NLlh8MaA8xFjYU4qq9osInmUU19SmLWjo9NiGgz4ZDMTdU3KWec3ixGS4N6z
        ZLzWw43krkED/s4Y9688kSQYC7tVKz167MT/RzLMQIkMNQPhc+hrEtGxu3W7+gyrSUAv
        60QVUdE0WOT2GqZocoVZMbR5HKw4qjL2xFiZOKqqlLLoNOf7m7cuMVaAfg2mt/v2q5wC
        Dw/arM0j+Lc6nwxAxq2xzKAGBJ7a8qC4LOTvEdqyaH+eTs/4JhtlNl3xgf+AWbYjw9mt
        ijMw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267EpF+OQRc4oDXF5yRxHE="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.24 AUTH)
        with ESMTPSA id m0a13fv5JId57Jh
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 19 Jun 2019 20:39:05 +0200 (CEST)
Date:   Wed, 19 Jun 2019 20:39:04 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     agross@kernel.org, david.brown@linaro.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Coresight causes synchronous external abort on msm8916
Message-ID: <20190619183904.GB937@gerhold.net>
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 19, 2019 at 09:49:03AM +0100, Suzuki K Poulose wrote:
> Hi Stephan,
> 
> On 18/06/2019 21:26, Stephan Gerhold wrote:
> > Hi,
> > 
> > I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> > It works surprisingly well, but the coresight devices seem to cause the
> > following crash shortly after userspace starts:
> > 
> >      Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> 
> ...
> 
> 
> > 
> > In this case I'm using a simple device tree similar to apq8016-sbc,
> > but it also happens using something as simple as msm8916-mtp.dts
> > on this particular device.
> >    (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
> > 
> > I can avoid the crash and boot without any further problems by disabling
> > every coresight device defined in msm8916.dtsi, e.g.:
> > 
> > 	tpiu@820000 { status = "disabled"; };
> 
> ...
> 
> > 
> > I don't have any use for coresight at the moment,
> > but it seems somewhat odd to put this in the device specific dts.
> > 
> > Any idea what could be causing this crash?
> 
> This is mostly due to the missing power domain support. The CoreSight
> components are usually in a debug power domain. So unless that is turned on,
> (either by specifying proper power domain ids for power management protocol
> supported by the firmware OR via other hacks - e.g, connecting a DS-5 to
> keep the debug power domain turned on , this works on Juno -).

Interesting, thanks a lot!

In this case I'm wondering how it works on the Dragonboard 410c.
Does it enable these power domains in the firmware?
  (Assuming it boots without this error...)

If coresight is not working properly on all/most msm8916 devices,
shouldn't coresight be disabled by default in msm8916.dtsi?
At least until those power domains can be set up by the kernel.

If this is a device-specific issue, what would be an acceptable solution
for mainline?
Can I turn on these power domains from the kernel?
Or is it fine to disable coresight for this device with the snippet above?

I'm not actually trying to use coresight, I just want the device to boot :)
And since I am considering submitting my device tree for inclusion in
mainline, I want to ask in advance how I should tackle this problem.

Thanks!
Stephan

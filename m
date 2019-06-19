Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0465D4BFD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 19:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfFSRjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 13:39:35 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:34100 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfFSRje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 13:39:34 -0400
X-Greylist: delayed 76371 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Jun 2019 13:39:33 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560965969;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=XYYSEo8xkLqEkhoToj39ayE5dpK53KVud0IYJso7SWw=;
        b=HEpnVVHQj+XKDc9EIHBhpXt8BewN2w+xxxApgbDjrOM7x8S1zPPljIoJCyXgBwrA1k
        +Jz35OyGg690BqCVUMbYJghY8nlJllQluTnLcqmICbGdsgsLTwLqmQX2FTRn2lKR8MGv
        9EW+NMhXiLtqykuNS+xx5IGHNKmSAQeSO0yZ37nMxBLtme7+bkprQIthl7aSanm8ztdJ
        ZCN+3AVxQYHGOAGeynfaXVLwqJg+rUvLYW3y3Ivr8JYOUWTgGkXXIWT8SQ/Se92ASnvZ
        Rj5baMqguzRhYCqfYsAO5rR9sW/PBsYo6lYdIooufyb6wjmGOzLv1k8dt4GKv4ODR67g
        k3bA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267EpF+OQRc4oDXF5yRxHE="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.24 AUTH)
        with ESMTPSA id m0a13fv5JHdM7Dr
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 19 Jun 2019 19:39:22 +0200 (CEST)
Date:   Wed, 19 Jun 2019 19:39:12 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: Coresight causes synchronous external abort on msm8916
Message-ID: <20190619173743.GA937@gerhold.net>
References: <20190618202623.GA53651@gerhold.net>
 <CANLsYkyViZmpwAPyd7huMC=QRvH3sd0VchJuL-E4+vuYnb0g9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkyViZmpwAPyd7huMC=QRvH3sd0VchJuL-E4+vuYnb0g9A@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 18, 2019 at 02:40:06PM -0600, Mathieu Poirier wrote:
> On Tue, 18 Jun 2019 at 14:26, Stephan Gerhold <stephan@gerhold.net> wrote:
> >
> > Hi,
> >
> > I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
> > It works surprisingly well, but the coresight devices seem to cause the
> > following crash shortly after userspace starts:
> >
> >     Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
> >     Modules linked in:
> >     CPU: 0 PID: 32 Comm: kworker/0:1 Not tainted 5.2.0-rc5 #7
> >     Hardware name: Samsung Galaxy A5 (SM-A500FU) (DT)
> >     Workqueue: events amba_deferred_retry_func
> >     pstate: 60000005 (nZCv daif -PAN -UAO)
> >     pc : amba_device_try_add+0x104/0x2f0
> >     lr : amba_device_try_add+0xf0/0x2f0
> >     sp : ffff00001181bd40
> >     x29: ffff00001181bd40 x28: 0000000000000000
> >     x27: ffff80007b258b38 x26: ffff000010f490a0
> >     x25: 0000000000000000 x24: ffff000011b35000
> >     x23: 0000000000000000 x22: ffff80007b316ed8
> >     x21: 0000000000001000 x20: 0000000000000000
> >     x19: ffff80007b316c00 x18: 0000000000000000
> >     x17: 0000000000000000 x16: 0000000000000000
> >     x15: 0000000000000000 x14: ffffffffffffffff
> >     x13: 0000000000000000 x12: 0000000000000001
> >     x11: 0000000000000000 x10: 0000000000000980
> >     x9 : ffff00001181ba00 x8 : ffff80007b126a20
> >     x7 : ffff80007a5e0500 x6 : ffff80007b126040
> >     x5 : 0000000000000002 x4 : ffff80007db85ba0
> >     x3 : 0000000000000000 x2 : ffff000011b35fe0
> >     x1 : 0000000000000000 x0 : 0000000000000000
> >     Call trace:
> >      amba_device_try_add+0x104/0x2f0
> >      amba_deferred_retry_func+0x48/0xc8
> >      process_one_work+0x1e0/0x320
> >      worker_thread+0x40/0x428
> >      kthread+0x120/0x128
> >      ret_from_fork+0x10/0x18
> >     Code: 35000ac0 d10082a2 52800001 8b020302 (b9400040)
> >     ---[ end trace b664cbefc1cb2294 ]---
> >
> > In this case I'm using a simple device tree similar to apq8016-sbc,
> > but it also happens using something as simple as msm8916-mtp.dts
> > on this particular device.
> >   (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
> >
> > I can avoid the crash and boot without any further problems by disabling
> > every coresight device defined in msm8916.dtsi, e.g.:
> >
> >         tpiu@820000 { status = "disabled"; };
> >         funnel@821000 { status = "disabled"; };
> >         replicator@824000 { status = "disabled"; };
> >         etf@825000 { status = "disabled"; };
> >         etr@826000 { status = "disabled"; };
> >         funnel@841000 { status = "disabled"; };
> >         debug@850000 { status = "disabled"; };
> >         debug@852000 { status = "disabled"; };
> >         debug@854000 { status = "disabled"; };
> >         debug@856000 { status = "disabled"; };
> >         etm@85c000 { status = "disabled"; };
> >         etm@85d000 { status = "disabled"; };
> >         etm@85e000 { status = "disabled"; };
> >         etm@85f000 { status = "disabled"; };
> >
> > I don't have any use for coresight at the moment,
> > but it seems somewhat odd to put this in the device specific dts.
> >
> > Any idea what could be causing this crash?
> 
> CS and CPUidle don't play well together on most boards, something I am
> actively looking into at this very moment.  To avoid the problem
> either disable CS or CPUidle.

Thanks for the very quick suggestion!

In my case, CPUidle seems unlikely to be the cause - unfortunately all
the msm8916 phones and tablets were released with a firmware that does
not support PSCI. Therefore cpuidle is not working properly either. :(

To be absolutely sure I have attempted to disable cpuidle by commenting
out related parts in the device tree. I booted with cpuidle.off=1 on the
kernel command line but the error persists.

> 
> Mathieu
> 
> > I'm not sure if this is a device-specific issue or possibly some kind of
> > configuration problem.
> >   Or is this feature only working on development boards?
> >
> > Thanks in advance!
> > Stephan
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

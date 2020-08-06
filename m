Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608AD23E2B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 21:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHFT7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 15:59:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:59624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbgHFT7a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 15:59:30 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DFBAE2173E;
        Thu,  6 Aug 2020 19:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596743970;
        bh=rZzNB7Mchw1xUwGcA2KB6ufKo5ZZoG/yMfMIbq6pK/Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2oq7B8IMmc0UB+V4Gs9PVKpLknPtYkzLPt6nce5QAFIKMqUSYttUwXraHgU41ekQg
         idJrEf9h1GGJy7Kb1jWhp9GWclJ9y5E0WckC6dyocfEOOSli3dSDSVcshgAAIiOcbz
         1H86dIn1t92Nnw6/n5miq3I0V0KITvHSGAIBX5LM=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k3m2y-000Mn1-AH; Thu, 06 Aug 2020 20:59:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 Aug 2020 20:59:28 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>, steev@kali.org,
        Nial Peters <uceenpe@ucl.ac.uk>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
In-Reply-To: <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
 <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
 <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <4d79a3e9c8c24f8adb6f7ade97d5a9c6@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: saravanak@google.com, john.stultz@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, hanks.chen@mediatek.com, cc.hwang@mediatek.com, loda.chou@mediatek.com, steev@kali.org, uceenpe@ucl.ac.uk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-06 19:05, Saravana Kannan wrote:
> On Thu, Aug 6, 2020 at 5:12 AM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-08-06 02:24, John Stultz wrote:

[...]

>> >> + if (par_np == np)
>> >> +         par_np = NULL;
>> >> +
>> >> + /*
>> >> + * If there's a parent interrupt controller and  none of the parent
>> >> irq
>> >> + * domains have been registered, that means the parent interrupt
>> >> + * controller has not been initialized yet.  it's not time for this
>> >> + * interrupt controller to initialize. So, defer probe of this
>> >> + * interrupt controller. The actual initialization callback of this
>> >> + * interrupt controller can check for specific domains as necessary.
>> >> + */
>> >> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
>> >> +         return -EPROBE_DEFER;
>> >
>> > Yep. We're getting caught on the irq_find_matching_host() check. I'm a
>> > little lost as when I look at the qcom,pdc node in the dtsi its not
>> > under a parent controller (instead the soc node).
>> > Not sure if that's an issue in the dtsi or if par_np check needs to
>> > ignore the soc node and pass null?
>> 
>> I think you have nailed it. This checks for a domain attached to
>> the driver we are about to probe, and this domain cannot possibly
>> exist. Instead, it is the *parent* this should check for, as we
>> depend on it for successful probing.
> 
> Duh! Looks like I made a copy-paste/typo error. The comment clearly
> says I'm trying to check the parent and then I end up checking the
> node getting registered. I'm sure this will fix it.
> 
> Actually Nial sent an email a few hours after your and he had found
> the same issue. He even tested the fix with an irqchip driver and it
> fixed the probe issue.

OK, thanks for confirming. It would have been good if these patches
had seen a bit more testing.

> 
> I'm assuming you'll put up the patch yourself. Please let me know if
> you need me to send one.

I have queued this [1] in -next.

It'd be good if someone (John?) could give a Tested-by.

Thanks,

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/irqchip-next
-- 
Jazz is not dead. It just smells funny...

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D7623E332
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 22:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgHFUbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 16:31:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgHFUbE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 16:31:04 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BD7620855;
        Thu,  6 Aug 2020 20:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596745863;
        bh=F4AtrtRO9qwW/JfWMr8YyqALJC/wmxeoK0pMEZzq7Hk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ziD/DCjCAm6/8RP+Os8tyl7Pjhc+IhZ/+KJZNdOmtc8xt0MQoKUjHbTZ93QLIu8V6
         PffbS3Ag2oN3S8rv2RneDQxmak9pUkTtCNF11RA2IEKrp6A8UXavZbbxAZt6Wya05H
         5PxzdWZHxj2pG65AYFYnDlO0Lhj01VgVg+5ok6kU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k3mXV-000N83-Lh; Thu, 06 Aug 2020 21:31:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 Aug 2020 21:31:01 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>,
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
        Loda Chou <loda.chou@mediatek.com>,
        Steev Klimaszewski <steev@kali.org>,
        Nial Peters <uceenpe@ucl.ac.uk>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
In-Reply-To: <CALAqxLUhit4Zz27Uce7gPGVRmkDJ_2UTC2fyk8NkOfgqR8diHQ@mail.gmail.com>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <CALAqxLUz6GTT96nO9igiWVwyaRs_xbO+=mySLm4BKX6-Uh90ZA@mail.gmail.com>
 <5e6124390b9e3e7f4d6f6decbdb669ca@kernel.org>
 <CAGETcx89BRdSP6FKjDPU0zapt0ET9_PUr6bjZb9EA-jYn0maFw@mail.gmail.com>
 <4d79a3e9c8c24f8adb6f7ade97d5a9c6@kernel.org>
 <CALAqxLUhit4Zz27Uce7gPGVRmkDJ_2UTC2fyk8NkOfgqR8diHQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <c5e73672a123ee6a920bdd0c3d6023c4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: john.stultz@linaro.org, saravanak@google.com, tglx@linutronix.de, jason@lakedaemon.net, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, hanks.chen@mediatek.com, cc.hwang@mediatek.com, loda.chou@mediatek.com, steev@kali.org, uceenpe@ucl.ac.uk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-06 21:09, John Stultz wrote:
> On Thu, Aug 6, 2020 at 12:59 PM Marc Zyngier <maz@kernel.org> wrote:
>> OK, thanks for confirming. It would have been good if these patches
>> had seen a bit more testing.
> 
> Yes, again, my apologies for that!

I would say this should be the job of the patch author, before
anyone else. Yes, silly bugs happen. In this occurrence, it
could have been avoided by just boot-testing it, though.

Oh well. At least it was caught early.

>> > I'm assuming you'll put up the patch yourself. Please let me know if
>> > you need me to send one.
>> 
>> I have queued this [1] in -next.
>> 
>> It'd be good if someone (John?) could give a Tested-by.
> 
> Just validated. Tested-by: John Stultz <john.stultz@linaro.org>

Thanks for your patience, the reporting and testing.

         M.
-- 
Jazz is not dead. It just smells funny...

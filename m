Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDE642C9FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhJMT1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:27:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229664AbhJMT1c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:27:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CC97611C2;
        Wed, 13 Oct 2021 19:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634153128;
        bh=wsyadpnFPzQgJjy5NCRs++eEdp+fySv4oOIBLQK45lI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FuqhcnflJJxh0fNXtJhuO0n977ucnwMCXbU3/wyRn4isISHezbh7b95VPe+znVxGO
         QJy1GJDDMsU+nhrmqt0hDwQwMmyUcIyih3vBRRUgud57CRTFfhOKDr51HzpggY8OJD
         0/fCRqV22xZp5J8qZfCfK/K52XkebO/i9sTtAQeYznB8RY+AOkTJRTcXRk3RNQF0hX
         Z24YNVXTNbSoeUlXqffSl8wSoyY1v/JZaQzPNBBeKPuXz3KLGzudXeaOOSwEGHJtMe
         viF6G1YvowDyY0Bj0LZ244yo0PZJ2Ywuf9lcBD09Cli5avdDvKvcDgYfu03MNVVcJB
         ItFlrji5MY8Fw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7efffba4-5e8b-1b71-8bee-3dffe65cfdf5@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-4-git-send-email-quic_fenglinw@quicinc.com> <163406173869.936959.6395787327312518099@swboyd.mtv.corp.google.com> <7efffba4-5e8b-1b71-8bee-3dffe65cfdf5@quicinc.com>
Subject: Re: [RESEND PATCH v1 3/9] spmi: pmic-arb: check apid against limits before calling irq handler
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        tglx@linutronix.de, maz@kernel.org
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 13 Oct 2021 12:25:27 -0700
Message-ID: <163415312707.936959.13741150880359468709@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-10-12 22:31:22)
>=20
> On 10/13/2021 2:02 AM, Stephen Boyd wrote:
> > Quoting Fenglin Wu (2021-09-16 23:32:58)
> >> From: David Collins <collinsd@codeaurora.org>
> >>
> >> Check that the apid for an SPMI interrupt falls between the
> >> min_apid and max_apid that can be handled by the APPS processor
> >> before invoking the per-apid interrupt handler:
> >> periph_interrupt().
> >>
> >> This avoids an access violation in rare cases where the status
> >> bit is set for an interrupt that is not owned by the APPS
> >> processor.
> >>
> >> Signed-off-by: David Collins <collinsd@codeaurora.org>
> >> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> >> ---
> > Fixes? BTW, a lot of these patches are irqchip specific. It would be
> > good to get review from irqchip maintainers. Maybe we should split the
> > irqchip driver off via the auxiliary bus so that irqchip maintainers can
> > review. Please Cc them on irqchip related patches.
> >
> > IRQCHIP DRIVERS
> > M:      Thomas Gleixner <tglx@linutronix.de>
> > M:      Marc Zyngier <maz@kernel.org>
> Sure, copied Thomas and Marc for code review.
> This is a fix to avoid the register access violation in a case that an
> interrupt is fired in a PMIC module which is not owned by APPS
> processor.

Got it.

> >>   drivers/spmi/spmi-pmic-arb.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb=
.c
> >> index 4d7ad004..c4adc06 100644
> >> --- a/drivers/spmi/spmi-pmic-arb.c
> >> +++ b/drivers/spmi/spmi-pmic-arb.c
> >> @@ -535,6 +535,12 @@ static void pmic_arb_chained_irq(struct irq_desc =
*desc)
> >>                          id =3D ffs(status) - 1;
> >>                          status &=3D ~BIT(id);
> >>                          apid =3D id + i * 32;
> >> +                       if (apid < pmic_arb->min_apid
> >> +                           || apid > pmic_arb->max_apid) {
> > The || goes on the line above. What about making a local variable for
> > first and last and then shifting by 5 in the loop?
> >
> > int first =3D pmic_arb->min_apid;
> > int last =3D pmic_arb->max_apid;
> >
> > for (i =3D first >> 5; i <=3D last >> 5; i++)
> >
> >       if (apid < first || apid > last)
> ACK, will update it following this.
> >> +                               WARN_ONCE(true, "spurious spmi irq rec=
eived for apid=3D%d\n",
> >> +                                       apid);
> > Is there any way to recover from this? Or once the mapping is wrong
> > we're going to get interrupts that we don't know what to do with
> > forever?
> This is a rare case that the unexpected interrupt is fired in a module
> not owned by APPS process, so the interrupt itself is not expected hence
> no need to recover from this but just bail out to avoid following register
> access violation.

And then the irq stops coming? It feels like a misconfiguration in the
firmware that we're trying to hide, hence the WARN_ONCE(). Can we
somehow silence irqs that aren't owned by the APPS when this driver
probes so that they can't even happen after probe?

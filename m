Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E10642E5C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 03:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbhJOBR2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 21:17:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231998AbhJOBR2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 21:17:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D060611C8;
        Fri, 15 Oct 2021 01:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634260522;
        bh=9/DvSRL0jI6Cli+C3Z8VSSXJjPo2bNVBUPn08nItio4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pUNHgPCP3lbMWr6Ye2Ee2B/lAOr7D7dM7Qw/P3QIzC0VOVgXP6bDwDTFVtDF0c5ki
         14F9SUra+cT6nhRiSDcnKFU8yKSa0kFzwTUzTG4NTUHy9zIombgcUfoo9xdRo+8CLF
         xaSWgZBOvHPlpSDHnv+9YqiNmHmVfNkFsWt2JDlAaVCsFnFGc9ayTjLoq64Rj3tdPd
         YjLxXn3n9JBNoH9k6N6dspa00kU2BAlQNi1oE79zP3EZhEIMlUe7vR6jj7TlNhJGlK
         AHI2nRRDcShOR2TJKGp8+yI2xnbZ5t7tqn+EhE/6WaXUlVsuLWAoK6lCA1oZDvDF0F
         PaXY/vKUf03dw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6ca3f254-90ad-e0e5-ced9-0f12deb408c6@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-4-git-send-email-quic_fenglinw@quicinc.com> <163406173869.936959.6395787327312518099@swboyd.mtv.corp.google.com> <7efffba4-5e8b-1b71-8bee-3dffe65cfdf5@quicinc.com> <163415312707.936959.13741150880359468709@swboyd.mtv.corp.google.com> <6ca3f254-90ad-e0e5-ced9-0f12deb408c6@quicinc.com>
Subject: Re: [RESEND PATCH v1 3/9] spmi: pmic-arb: check apid against limits before calling irq handler
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        tglx@linutronix.de, maz@kernel.org
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 14 Oct 2021 18:15:21 -0700
Message-ID: <163426052104.936959.4574808739645012745@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-10-13 20:11:40)
>=20
> On 10/14/2021 3:25 AM, Stephen Boyd wrote:
> > Quoting Fenglin Wu (2021-10-12 22:31:22)
> >> On 10/13/2021 2:02 AM, Stephen Boyd wrote:
> >>> Quoting Fenglin Wu (2021-09-16 23:32:58)
> >>>> From: David Collins <collinsd@codeaurora.org>
> >>>>
> >>>> Check that the apid for an SPMI interrupt falls between the
> >>>> min_apid and max_apid that can be handled by the APPS processor
> >>>> before invoking the per-apid interrupt handler:
> >>>> periph_interrupt().
> >>>>
> >>>> This avoids an access violation in rare cases where the status
> >>>> bit is set for an interrupt that is not owned by the APPS
> >>>> processor.
> >>>>
> >>>> Signed-off-by: David Collins <collinsd@codeaurora.org>
> >>>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> >>>> ---
> >>> Fixes? BTW, a lot of these patches are irqchip specific. It would be
> >>> good to get review from irqchip maintainers. Maybe we should split the
> >>> irqchip driver off via the auxiliary bus so that irqchip maintainers =
can
> >>> review. Please Cc them on irqchip related patches.
> >>>
> >>> IRQCHIP DRIVERS
> >>> M:      Thomas Gleixner <tglx@linutronix.de>
> >>> M:      Marc Zyngier <maz@kernel.org>
> >> Sure, copied Thomas and Marc for code review.
> >> This is a fix to avoid the register access violation in a case that an
> >> interrupt is fired in a PMIC module which is not owned by APPS
> >> processor.
> > Got it.
> >
> >>>>    drivers/spmi/spmi-pmic-arb.c | 6 ++++++
> >>>>    1 file changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-a=
rb.c
> >>>> index 4d7ad004..c4adc06 100644
> >>>> --- a/drivers/spmi/spmi-pmic-arb.c
> >>>> +++ b/drivers/spmi/spmi-pmic-arb.c
> >>>> @@ -535,6 +535,12 @@ static void pmic_arb_chained_irq(struct irq_des=
c *desc)
> >>>>                           id =3D ffs(status) - 1;
> >>>>                           status &=3D ~BIT(id);
> >>>>                           apid =3D id + i * 32;
> >>>> +                       if (apid < pmic_arb->min_apid
> >>>> +                           || apid > pmic_arb->max_apid) {
> >>> The || goes on the line above. What about making a local variable for
> >>> first and last and then shifting by 5 in the loop?
> >>>
> >>> int first =3D pmic_arb->min_apid;
> >>> int last =3D pmic_arb->max_apid;
> >>>
> >>> for (i =3D first >> 5; i <=3D last >> 5; i++)
> >>>
> >>>        if (apid < first || apid > last)
> >> ACK, will update it following this.
> >>>> +                               WARN_ONCE(true, "spurious spmi irq r=
eceived for apid=3D%d\n",
> >>>> +                                       apid);
> >>> Is there any way to recover from this? Or once the mapping is wrong
> >>> we're going to get interrupts that we don't know what to do with
> >>> forever?
> >> This is a rare case that the unexpected interrupt is fired in a module
> >> not owned by APPS process, so the interrupt itself is not expected hen=
ce
> >> no need to recover from this but just bail out to avoid following regi=
ster
> >> access violation.
> > And then the irq stops coming? It feels like a misconfiguration in the
> > firmware that we're trying to hide, hence the WARN_ONCE(). Can we
> > somehow silence irqs that aren't owned by the APPS when this driver
> > probes so that they can't even happen after probe?
> Actually this is a rarely happened case that couldn't be reproduced easily
> and consistently for further debug. I agreed this should be caused by HW
> misconfiguration or even some unknown HW bug that it would send out SPMI
> interrupt messages with incorrect APID, but we have never had any chance
> to find out the root cause. The patch here simply checked the APID and
> bail out if it's not in the valid range, it won't cause anything bad but
> improves the SW robustness. After that, the IRQ won't be triggered again
> because the latched status in PMIC is not cleared. Also, because of the
> access restriction to the registers corresponding to this APID, there is
> nothing we can do from APPS processor side to keep it silent.

This patch seems like a band-aid for an issue that isn't fully
understood. I suppose it's good that the irq will stay asserted forever
and then it won't happen again until it gets cleared by some other
processor in the SoC. Instead of the WARN_ONCE() can we track if any irq
is handled when the chained irq is raised, and if nothing is handled
then call handle_bad_irq() on the chained descriptor? Take a look at
pinctrl-msm.c to see how they handled spurious irqs that aren't actually
directed at the APPS processor. We should do something similar here.

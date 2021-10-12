Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F6542AB74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 20:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbhJLSEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 14:04:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233357AbhJLSEW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 14:04:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9B15604DA;
        Tue, 12 Oct 2021 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634061740;
        bh=IA9bq939HFIthWZowdjpzrEL9kw+TYWcbEgjEet03Ug=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=svmJ5mNLvHOtxjPznYH+3g2TTlo6RwUN53E9jlQqQR6sQYnaRS5BONRC8Xo1zZ91m
         5udB0bi6UrQZojOQ6pfqbbIjy+mEucEP/oqnBVS4FLmdTInpXEBizyRzfeQKCde857
         zXgH73ite2ix+1TnOxTNks+QmWsy6F3PYYYORMHqScIWFcAKXut0ebTB7OkuZPYDHD
         DtrCr8de0WOnZuMqa23tHQoheCSFq46hpXaTEA1xzsqE7/XK5ZeUsWVg3SaviiPVZf
         52/SAE6Kp8cJ3NZ8TKI0n1toJlOZC47Pdtmmioz2x9RMBhZViR5047zneon8O7njy8
         uJxSku4dMraYw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1631860384-26608-4-git-send-email-quic_fenglinw@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-4-git-send-email-quic_fenglinw@quicinc.com>
Subject: Re: [RESEND PATCH v1 3/9] spmi: pmic-arb: check apid against limits before calling irq handler
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        quic_fenglinw@quicinc.com
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 11:02:18 -0700
Message-ID: <163406173869.936959.6395787327312518099@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-09-16 23:32:58)
> From: David Collins <collinsd@codeaurora.org>
>=20
> Check that the apid for an SPMI interrupt falls between the
> min_apid and max_apid that can be handled by the APPS processor
> before invoking the per-apid interrupt handler:
> periph_interrupt().
>=20
> This avoids an access violation in rare cases where the status
> bit is set for an interrupt that is not owned by the APPS
> processor.
>=20
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

Fixes? BTW, a lot of these patches are irqchip specific. It would be
good to get review from irqchip maintainers. Maybe we should split the
irqchip driver off via the auxiliary bus so that irqchip maintainers can
review. Please Cc them on irqchip related patches.

IRQCHIP DRIVERS
M:      Thomas Gleixner <tglx@linutronix.de>
M:      Marc Zyngier <maz@kernel.org>

>  drivers/spmi/spmi-pmic-arb.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 4d7ad004..c4adc06 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -535,6 +535,12 @@ static void pmic_arb_chained_irq(struct irq_desc *de=
sc)
>                         id =3D ffs(status) - 1;
>                         status &=3D ~BIT(id);
>                         apid =3D id + i * 32;
> +                       if (apid < pmic_arb->min_apid
> +                           || apid > pmic_arb->max_apid) {

The || goes on the line above. What about making a local variable for
first and last and then shifting by 5 in the loop?

int first =3D pmic_arb->min_apid;
int last =3D pmic_arb->max_apid;

for (i =3D first >> 5; i <=3D last >> 5; i++)

	if (apid < first || apid > last)

> +                               WARN_ONCE(true, "spurious spmi irq receiv=
ed for apid=3D%d\n",
> +                                       apid);

Is there any way to recover from this? Or once the mapping is wrong
we're going to get interrupts that we don't know what to do with
forever?

> +                               continue;
> +                       }
>                         enable =3D readl_relaxed(
>                                         ver_ops->acc_enable(pmic_arb, api=
d));
>                         if (enable & SPMI_PIC_ACC_ENABLE_BIT)

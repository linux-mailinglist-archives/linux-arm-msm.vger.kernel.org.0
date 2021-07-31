Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519DA3DC4EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 10:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhGaIU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Jul 2021 04:20:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230338AbhGaIU1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Jul 2021 04:20:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8107060F39;
        Sat, 31 Jul 2021 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627719621;
        bh=x6IuptWPn4NILNW/vfNzrSqEssOd4EqWaQZgxs6ql9E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d5+U+/tmUQYwcpdNYMp8ea9eSvyn8IC2FktQWaaRxUCKEny3yrJFs/evJ2OmMKjxJ
         LAghGjhN4w30izCfjQrl2RJWqsj+AOkMm6GenDaex3FT5TZv5h7uVvydIjHZhJPn5q
         KOK/nf5AhEbk5amUnAYx3YJ3g1mBhcqUmgxcCJTZj1L/y4QE+PBRENjhmumYDq+Krc
         lzpGKFAL6JKsmPwuL3+91ONKr/kxNo0L0fYGZ6a3ZIPsB6vm+h90G44UpmjFUbZwcH
         3D2EzqX18x3slNLz0aC1tLEkGTNJI+TfjWWR/NubCCnc/ZXya8azZDTKMePBb76udL
         NCPeCgHgYINQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210728180209.14764-1-collinsd@codeaurora.org>
References: <20210728180209.14764-1-collinsd@codeaurora.org>
Subject: Re: [RESEND PATCH] spmi: spmi-pmic-arb: fix irq_set_type race condition
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
To:     David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Date:   Sat, 31 Jul 2021 01:20:19 -0700
Message-ID: <162771961962.714452.2347964437306072737@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+irqchip driver maintainers

Quoting David Collins (2021-07-28 11:02:09)
> The qpnpint_irq_set_type() callback function configures the type
> (edge vs level) and polarity (high, low, or both) of a particular
> PMIC interrupt within a given peripheral.  To do this, it reads
> the three consecutive IRQ configuration registers, modifies the
> specified IRQ bit within the register values, and finally writes
> the three modified register values back to the PMIC.  While a
> spinlock is used to provide mutual exclusion on the SPMI bus
> during the register read and write calls, there is no locking
> around the overall read, modify, write sequence.  This opens up
> the possibility of a race condition if two tasks set the type of
> a PMIC IRQ within the same peripheral simultaneously.
>=20
> When the race condition is encountered, both tasks will read the
> old value of the registers and IRQ bits set by one of the tasks
> will be dropped upon the register write of the other task.  This
> then leads to PMIC IRQs being enabled with an incorrect type and
> polarity configured.  Such misconfiguration can lead to an IRQ
> storm that overwhelms the system and causes it to crash.
>=20
> This race condition and IRQ storm have been observed when using
> a pair of pm8941-pwrkey devices to handle PMK8350 pwrkey and
> resin interrupts.  The independent devices probe asynchronously
> in parallel and can simultaneously request and configure PMIC
> IRQs in the same PMIC peripheral.
>=20
> For a good case, the IRQ configuration calls end up serialized
> due to timing deltas and the register read/write sequence looks
> like this:
>=20
> 1. pwrkey probe: SPMI  read(0x1311): 0x00, 0x00, 0x00
> 2. pwrkey probe: SPMI write(0x1311): 0x80, 0x80, 0x80
> 3. resin probe:  SPMI  read(0x1311): 0x80, 0x80, 0x80
> 4. resin probe:  SPMI write(0x1311): 0xC0, 0xC0, 0xC0
>=20
> The final register states after both devices have requested and
> enabled their respective IRQs is thus:
>=20
> 0x1311: 0xC0
> 0x1312: 0xC0
> 0x1313: 0xC0
> 0x1314: 0x00
> 0x1315: 0xC0
>=20
> For a bad case, the IRQ configuration calls end up occurring
> simultaneously and the race condition is encountered.  The
> register read/write sequence then looks like this:
>=20
> 1. pwrkey probe: SPMI  read(0x1311): 0x00, 0x00, 0x00
> 2. resin probe:  SPMI  read(0x1311): 0x00, 0x00, 0x00
> 3. pwrkey probe: SPMI write(0x1311): 0x80, 0x80, 0x80
> 4. resin probe:  SPMI write(0x1311): 0x40, 0x40, 0x40
>=20
> In this case, the final register states after both devices have
> requested and enabled their respective IRQs is thus:
>=20
> 0x1311: 0x40
> 0x1312: 0x40
> 0x1313: 0x40
> 0x1314: 0x00
> 0x1315: 0xC0
>=20
> This corresponds to the resin IRQ being configured for both
> rising and falling edges, as expected.  However, the pwrkey IRQ
> is misconfigured as level type with both polarity high and low
> set to disabled.  The PMIC IRQ triggering hardware treats this
> particular register configuration as if level low triggering is
> enabled.
>=20
> The raw pwrkey IRQ signal is low when the power key is not being
> pressed.  Thus, the pwrkey IRQ begins firing continuously in an
> IRQ storm.
>=20
> Fix the race condition by locking a spinlock for the duration of
> the read, modify, write sequence in the qpnpint_irq_set_type()
> function.
>=20
> Fixes: 67b563f1f258 ("spmi: pmic_arb: add support for interrupt handling")
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index bbbd311eda03..379ad6c1c14a 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -127,6 +127,7 @@ struct apid_data {
>   * @intr:              address of the SPMI interrupt control registers.
>   * @cnfg:              address of the PMIC Arbiter configuration registe=
rs.
>   * @lock:              lock to synchronize accesses.
> + * @irq_lock:          lock to ensure mutual exclusion for IRQ type sett=
ing
>   * @channel:           execution environment channel to use for accesses.
>   * @irq:               PMIC ARB interrupt.
>   * @ee:                        the current Execution Environment
> @@ -146,6 +147,7 @@ struct spmi_pmic_arb {
>         void __iomem            *core;
>         resource_size_t         core_size;
>         raw_spinlock_t          lock;
> +       raw_spinlock_t          irq_lock;

Maybe a better name is type_lock given that it's about the irq type
setting rmw sequence.

>         u8                      channel;
>         int                     irq;
>         u8                      ee;
> @@ -600,10 +602,13 @@ static void qpnpint_irq_unmask(struct irq_data *d)
> =20
>  static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_ty=
pe)
>  {
> +       struct spmi_pmic_arb *pmic_arb =3D irq_data_get_irq_chip_data(d);
>         struct spmi_pmic_arb_qpnpint_type type;
>         irq_flow_handler_t flow_handler;
>         u8 irq =3D hwirq_to_irq(d->hwirq);
> +       unsigned long flags;
> =20
> +       raw_spin_lock_irqsave(&pmic_arb->irq_lock, flags);
>         qpnpint_spmi_read(d, QPNPINT_REG_SET_TYPE, &type, sizeof(type));
> =20
>         if (flow_type & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) {
> @@ -616,8 +621,10 @@ static int qpnpint_irq_set_type(struct irq_data *d, =
unsigned int flow_type)
>                 flow_handler =3D handle_edge_irq;
>         } else {
>                 if ((flow_type & (IRQF_TRIGGER_HIGH)) &&
> -                   (flow_type & (IRQF_TRIGGER_LOW)))
> +                   (flow_type & (IRQF_TRIGGER_LOW))) {
> +                       raw_spin_unlock_irqrestore(&pmic_arb->irq_lock, f=
lags);
>                         return -EINVAL;
> +               }
> =20
>                 type.type &=3D ~BIT(irq); /* level trig */
>                 if (flow_type & IRQF_TRIGGER_HIGH)
> @@ -629,6 +636,8 @@ static int qpnpint_irq_set_type(struct irq_data *d, u=
nsigned int flow_type)
>         }
> =20
>         qpnpint_spmi_write(d, QPNPINT_REG_SET_TYPE, &type, sizeof(type));
> +       raw_spin_unlock_irqrestore(&pmic_arb->irq_lock, flags);

Could we have a qpnpint_spmi_set_bit/clear_bit() API that takes the bit
we want to touch as an argument and then does it all under the originial
pmic_arb->lock? Then we don't need a different lock, we can avoid that
drop the lock under the else if condition above, and the area for the
lock will be contained within the set/clear function instead of here.

> +
>         irq_set_handler_locked(d, flow_handler);
> =20
>         return 0;
> @@ -1285,6 +1294,7 @@ static int spmi_pmic_arb_probe(struct platform_devi=
ce *pdev)
> =20
>         platform_set_drvdata(pdev, ctrl);
>         raw_spin_lock_init(&pmic_arb->lock);
> +       raw_spin_lock_init(&pmic_arb->irq_lock);
> =20
>         ctrl->cmd =3D pmic_arb_cmd;
>         ctrl->read_cmd =3D pmic_arb_read_cmd;

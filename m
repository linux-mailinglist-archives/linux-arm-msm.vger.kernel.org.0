Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8101242AB0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhJLRqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:46:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:57590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229495AbhJLRqg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:46:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25E2D610C9;
        Tue, 12 Oct 2021 17:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634060674;
        bh=lVL3q5uChIkTh3tk08GPoiBOGZxjg76dso8RpirFeW8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Pp5n6k+vHngx0oAzK71EV4QIwnREZETfdcp4S/ZxjDE9o9jSmqwltgIZpu312Poaq
         Gme3coZ2DzgLrgs9vv4/KBmDKwQXfJq49XpxKINR4Qe0DikHCQl6MUfI2gJuHxRDs4
         hnbkGTD0AiR8Qgxrb1AB/A9pUiNlJBCbX6mVDAm7DbmVPiSrgB+25QMPaZs5Lb7onX
         UHT22W8UInOMIsE8yMDs63GE+b5zb1ZJgFpZvs5nCs7Hr808YJlazigsdAY9MkiokZ
         8O0tDK5X2kGpr7/BPQV+FZEmvt0uW4PAn5+2KHSd3briMs2UEqhnbMzuQdKcy2a6qn
         XGbYrznEcQuew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1631860384-26608-6-git-send-email-quic_fenglinw@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-6-git-send-email-quic_fenglinw@quicinc.com>
Subject: Re: [RESEND PATCH v1 5/9] spmi: pmic-arb: correct duplicate APID to PPID mapping logic
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        quic_fenglinw@quicinc.com
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 10:44:32 -0700
Message-ID: <163406067294.936959.15501496135258886323@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-09-16 23:33:00)
> From: David Collins <collinsd@codeaurora.org>
>=20
> Correct the way that duplicate PPID mappings are handled for PMIC
> arbiter v5.  The final APID mapped to a given PPID should be the
> one which has write owner =3D APPS EE, if it exists, or if not
> that, then the first APID mapped to the PPID, if it exists.
>=20
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

Does this need a Fixes tag?

>  drivers/spmi/spmi-pmic-arb.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 59c445b..f1b72d8 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -918,7 +918,8 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic=
_arb *pmic_arb)
>          * version 5, there is more than one APID mapped to each PPID.
>          * The owner field for each of these mappings specifies the EE wh=
ich is
>          * allowed to write to the APID.  The owner of the last (highest)=
 APID
> -        * for a given PPID will receive interrupts from the PPID.
> +        * which has the IRQ owner bit set for a given PPID will receive
> +        * interrupts from the PPID.
>          */
>         for (i =3D 0; ; i++, apidd++) {
>                 offset =3D pmic_arb->ver_ops->apid_map_offset(i);
> @@ -941,16 +942,16 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pm=
ic_arb *pmic_arb)
>                 apid =3D pmic_arb->ppid_to_apid[ppid] & ~PMIC_ARB_APID_VA=
LID;
>                 prev_apidd =3D &pmic_arb->apid_data[apid];
> =20
> -               if (valid && is_irq_ee &&
> -                               prev_apidd->write_ee =3D=3D pmic_arb->ee)=
 {
> +               if (!valid || apidd->write_ee =3D=3D pmic_arb->ee) {
> +                       /* First PPID mapping or one for this EE */
> +                       pmic_arb->ppid_to_apid[ppid] =3D i | PMIC_ARB_API=
D_VALID;
> +               } else if (valid && is_irq_ee &&
> +                          prev_apidd->write_ee =3D=3D pmic_arb->ee) {

This can be one line please.

>                         /*
>                          * Duplicate PPID mapping after the one for this =
EE;
>                          * override the irq owner
>                          */
>                         prev_apidd->irq_ee =3D apidd->irq_ee;
> -               } else if (!valid || is_irq_ee) {
> -                       /* First PPID mapping or duplicate for another EE=
 */
> -                       pmic_arb->ppid_to_apid[ppid] =3D i | PMIC_ARB_API=
D_VALID;
>                 }
> =20
>                 apidd->ppid =3D ppid;
> --=20
> 2.7.4
>

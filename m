Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5B542CA31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 21:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhJMTke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 15:40:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229989AbhJMTke (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 15:40:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80E156117A;
        Wed, 13 Oct 2021 19:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634153910;
        bh=1/hjFW2ygJ0uYLiaRIcfmB5JWSBU8zq3TcAb9ayy3pE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EPK/Y0lyoOFy/Y/W96uc/dmmP03Rk8lGpdYx3KbuSMz5zXgV40tuI2OtIag2+d6ON
         Vh2wkCncLUDyXrtmcxY7GvOLfEp0rGNiE9d48u1C3vlfD8ZFAhuMQfRajOLCid1plB
         2qvOJnNzl+j3kzke+qsLG2WIg64XX9/znfVk5+bOpS+UgEmQVsKtnu/cGjFgFLYZYH
         OugFhXrapAQDLIIDbpqJvAMw7yQyXUwHJHCxq2JJNz0W6rxwXWAD7cErb+ObGHGAu0
         Cv0k2XS/VmklHbVN07uU95kVqMcba8fu9qOwsNi2EinyI9VX2qPQFt9Brybx0eRzsJ
         ENiHLA1WOtjSQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3bf1fbf3-e741-ef08-a4e4-b348b877d02a@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-9-git-send-email-quic_fenglinw@quicinc.com> <163406051353.936959.12718174954614897750@swboyd.mtv.corp.google.com> <3bf1fbf3-e741-ef08-a4e4-b348b877d02a@quicinc.com>
Subject: Re: [RESEND PATCH v1 8/9] spmi: pmic-arb: make interrupt support optional
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 13 Oct 2021 12:38:29 -0700
Message-ID: <163415390922.936959.12352892206436080955@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-10-13 01:36:54)
>=20
> On 10/13/2021 1:41 AM, Stephen Boyd wrote:
> > Quoting Fenglin Wu (2021-09-16 23:33:03)
> >> From: David Collins <collinsd@codeaurora.org>
> >>
> >> Make the support of PMIC peripheral interrupts optional for
> >> spmi-pmic-arb devices.  This is useful in situations where
> >> SPMI address mapping is required without the need for IRQ
> >> support.
> >>
> >> Signed-off-by: David Collins <collinsd@codeaurora.org>
> >> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> >> ---
> >>   drivers/spmi/spmi-pmic-arb.c | 45 +++++++++++++++++++++++++++-------=
----------
> > Is there a binding update? Can the binding be converted to YAML as well?
> This change doesn't add/update any dtsi properties but just checking if an
> existing property is present to decide if IRQ support is required, so no
> binding change is needed.

The property is now optional in the binding. Please update the binding.

> >
> >>   1 file changed, 28 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb=
.c
> >> index 988204c..55fa981 100644
> >> --- a/drivers/spmi/spmi-pmic-arb.c
> >> +++ b/drivers/spmi/spmi-pmic-arb.c
> >> @@ -1280,10 +1280,12 @@ static int spmi_pmic_arb_probe(struct platform=
_device *pdev)
> >>                  goto err_put_ctrl;
> >>          }
> >>  =20
> >> -       pmic_arb->irq =3D platform_get_irq_byname(pdev, "periph_irq");
> >> -       if (pmic_arb->irq < 0) {
> >> -               err =3D pmic_arb->irq;
> >> -               goto err_put_ctrl;
> >> +       if (of_find_property(pdev->dev.of_node, "interrupt-names", NUL=
L)) {
> > I don't think we should be keying off of interrupt-names. Instead we
> > should be checking for something else. Maybe interrupt-controller
> > property?
> Sure, I can update it to check the presence of "interrupt-controller"=20
> property.

Ok.

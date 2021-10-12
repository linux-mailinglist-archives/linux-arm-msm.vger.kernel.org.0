Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392E742AAF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhJLRn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:43:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229495AbhJLRn4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:43:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA4DD610C9;
        Tue, 12 Oct 2021 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634060514;
        bh=ZwD/HIm+5qJHTS5AGFULHjjui4GevfWYy8Os8F415SI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hTK3deVcSxYMEoQ7t4J3jVPGe9C1u9MqDclSvwUhCRDlvGdDJ5FmPP9QZwOF2xcjG
         wUEVrk9wRd/gl06+L+CkI1ZTXjRcJvLt7IwqI0IqRKMY7WeqlDAEbxkzsbIjaYuc6R
         J7LneXS1WjDyZurnlBy0KxVBFQTrfu6meaPgx889DwH5fROk1Rf/ne+0zNJpRMexgw
         esLWOSwZpUeayxC0PD4Lh+zYQEHUeIi9n2M91oQWtI7fn7fHvI8M1nrKxQlL/+1B4e
         K3wuoahEobxZEfmAGCxgz0YXJ87hhy+dPoMTEhztQzf6A5qZ01uyTC/Op7KfhUmf4q
         viWx/J48hgITQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1631860384-26608-9-git-send-email-quic_fenglinw@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-9-git-send-email-quic_fenglinw@quicinc.com>
Subject: Re: [RESEND PATCH v1 8/9] spmi: pmic-arb: make interrupt support optional
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        quic_fenglinw@quicinc.com
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 10:41:53 -0700
Message-ID: <163406051353.936959.12718174954614897750@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-09-16 23:33:03)
> From: David Collins <collinsd@codeaurora.org>
>=20
> Make the support of PMIC peripheral interrupts optional for
> spmi-pmic-arb devices.  This is useful in situations where
> SPMI address mapping is required without the need for IRQ
> support.
>=20
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 45 +++++++++++++++++++++++++++-----------=
------

Is there a binding update? Can the binding be converted to YAML as well?

>  1 file changed, 28 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 988204c..55fa981 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -1280,10 +1280,12 @@ static int spmi_pmic_arb_probe(struct platform_de=
vice *pdev)
>                 goto err_put_ctrl;
>         }
> =20
> -       pmic_arb->irq =3D platform_get_irq_byname(pdev, "periph_irq");
> -       if (pmic_arb->irq < 0) {
> -               err =3D pmic_arb->irq;
> -               goto err_put_ctrl;
> +       if (of_find_property(pdev->dev.of_node, "interrupt-names", NULL))=
 {

I don't think we should be keying off of interrupt-names. Instead we
should be checking for something else. Maybe interrupt-controller
property?

> +               pmic_arb->irq =3D platform_get_irq_byname(pdev, "periph_i=
rq");
> +               if (pmic_arb->irq < 0) {
> +                       err =3D pmic_arb->irq;
> +                       goto err_put_ctrl;

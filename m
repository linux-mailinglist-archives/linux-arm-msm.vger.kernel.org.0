Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEA744B1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 20:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfFMSvl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 14:51:41 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41338 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfFMSvk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 14:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AoGVTpO9zrb+1lSUsvcK/kqe1TkrIDM1OzuifM0MG0U=; b=OkUzokA5JOaF9gqrT7UHxscsl
        x/RbwO++AjM1cPG8ubPFKMxiWTkecrOJ1+dZ5FURuOCDSD6MBr45g1tjf/V4u07vJRnNK1tUahczJ
        W21wqeZAnEjcBYvj21LGo7dpAPjqTgcpw7OnJ/DzQHgL0LNWT0TT7zy1ntTYSB6lf+UMU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hbUoz-0005QJ-1f; Thu, 13 Jun 2019 18:51:37 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 8C75E440046; Thu, 13 Jun 2019 19:51:36 +0100 (BST)
Date:   Thu, 13 Jun 2019 19:51:36 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drivers: regulator: qcom_spmi: enable linear
 range info
Message-ID: <20190613185136.GW5316@sirena.org.uk>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
 <20190606184923.39537-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ahZICQ7iXVM/oLYH"
Content-Disposition: inline
In-Reply-To: <20190606184923.39537-1-jeffrey.l.hugo@gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--ahZICQ7iXVM/oLYH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 11:49:23AM -0700, Jeffrey Hugo wrote:

> +		if (vreg->logical_type =3D=3D SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
> +			/* since there is only one range */
> +			range =3D spmi_regulator_find_range(vreg);
> +			vreg->desc.uV_step =3D range->step_uV;
> +		}

This doesn't build for me:

drivers/regulator/qcom_spmi-regulator.c: In function =E2=80=98qcom_spmi_reg=
ulator_probe=E2=80=99:
drivers/regulator/qcom_spmi-regulator.c:1837:29: error: =E2=80=98SPMI_REGUL=
ATOR_LOGICAL_TYPE_HFS430=E2=80=99 undeclared (first use in this function); =
did you mean =E2=80=98SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS=E2=80=99?
   if (vreg->logical_type =3D=3D SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                             SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS
drivers/regulator/qcom_spmi-regulator.c:1837:29: note: each undeclared iden=
tifier is reported only once for each function it appears in

--ahZICQ7iXVM/oLYH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CmzcACgkQJNaLcl1U
h9BLcAf+LbREmfxXdirC6a4pyidOidMHVXvJ5RSlum+DW3aj56vF/aXiYyZm9d2C
4I+6WFnpU6GIbsNXcYPRkng30IZO5++Da8NPRPyYhcmBs+pJhpQjlPiPg6UK2/iB
AmsQStemH0Zi1crGMEeLU/nYREfZpTnS9GXH4r5SMvja5EigTEKfSqlhoWl5hoJd
INPx2zNjnBP21hVt0aUs+uEj2xiAuwMrN8VtHT152T51jVofsIxXZYBXtmSFKdLJ
9nkFy36LT6YA2gso7Caw+ku3SYPfXgkPu7YdOjnlFOp5sDC2dX7nlKeAZwiphDcU
IgFxUVv32eyNOS7wxahaxSq/ypFIPg==
=u3Lf
-----END PGP SIGNATURE-----

--ahZICQ7iXVM/oLYH--

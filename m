Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D409111185
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 04:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfEBCd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 22:33:26 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52582 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbfEBCd0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 22:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=FFKovFdQTg5OJY5i063qAtTB6erYm+spnUt2RsGxwCU=; b=JTkOOzkpa2AgLB/H1z7i9Ta29
        nwuy3p6YYaIv61JcB04usEfZ2SvkIkfhKVp0gLyrbdUN01vpGILYrgak3mgt4utJWdlNibX/lIbUz
        Pkml9MzPnZQ82WH7285KddG+ZKYuTLlVS3A0LNMDBzEYLkKZQmYQr5o2ZPWC8qus5iExc=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hM1XE-0005zR-0e; Thu, 02 May 2019 02:33:20 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id DD91A441D3C; Thu,  2 May 2019 03:33:16 +0100 (BST)
Date:   Thu, 2 May 2019 11:33:16 +0900
From:   Mark Brown <broonie@kernel.org>
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        niklas.cassel@linaro.org, khasim.mohammed@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Message-ID: <20190502023316.GS14916@sirena.org.uk>
References: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7WENQHN97/U9vH7R"
Content-Disposition: inline
In-Reply-To: <a3c281d5-d30e-294f-71ab-957decde2ba0@linaro.org>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--7WENQHN97/U9vH7R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 02:31:55PM +0200, Jorge Ramirez wrote:
> On 4/27/19 20:21, Mark Brown wrote:

> > Since the point of this change is AFAICT that this regulator only has a
> > single linear range it seems like it should just be able to use the
> > existing generic functions shouldn't it? =20

> yes that would have been ideal but it does not seem to be the case for
> this hardware.

> The register that stores the voltage range for all other SPMI regulators
> (SPMI_COMMON_REG_VOLTAGE_RANGE 0x40) is used by something else in the
> HFS430: SPMI_HFS430_REG_VOLTAGE_LB 0x40 stores the voltage level in two
> bytes 0x40 and 0x41;

> This overlap really what is creating the pain: HFS430 cant use 0x40 to
> store the range (even if it is only one)

> so yeah, most of the changes in the patch are working around this fact.

I'm not sure I follow here, sorry - I can see that the driver needs a
custom get/set selector operation but shouldn't it be able to use the
standard list and map operations for linear ranges?

>=20
> enum spmi_common_regulator_registers {
> 	SPMI_COMMON_REG_DIG_MAJOR_REV		=3D 0x01,
> 	SPMI_COMMON_REG_TYPE			=3D 0x04,
> 	SPMI_COMMON_REG_SUBTYPE			=3D 0x05,
> 	SPMI_COMMON_REG_VOLTAGE_RANGE		=3D 0x40, ******
> 	SPMI_COMMON_REG_VOLTAGE_SET		=3D 0x41,
> 	SPMI_COMMON_REG_MODE			=3D 0x45,
> 	SPMI_COMMON_REG_ENABLE			=3D 0x46,
> 	SPMI_COMMON_REG_PULL_DOWN		=3D 0x48,
> 	SPMI_COMMON_REG_SOFT_START		=3D 0x4c,
> 	SPMI_COMMON_REG_STEP_CTRL		=3D 0x61,
> };
>=20
> enum spmi_hfs430_registers {
> 	SPMI_HFS430_REG_VOLTAGE_LB		=3D 0x40, *******
> 	SPMI_HFS430_REG_VOLTAGE_VALID_LB	=3D 0x42,
> 	SPMI_HFS430_REG_MODE			=3D 0x45,
> };
>=20
> It just needs it's own
> > set/get_voltage_sel() operations.  As far as I can see the main thing
> > the driver is doing with the custom stuff is handling the fact that
> > there's multiple ranges but that's not an issue for this regulator.
> > It's possible I'm missing something there but that was the main thing
> > (and we do have some generic support for multiple linear ranges in the
> > helper code already, can't remember why this driver isn't using that -
> > the ranges overlap IIRC?).
> >=20
> > TBH looking at the uses of find_range() I'm not sure they're 100%
> > sensible as they are - the existing _time_sel() is assuming we only need
> > to work out the ramp time between voltages in the same range which is
> > going to have trouble.
> >=20
>=20

--7WENQHN97/U9vH7R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzKVuwACgkQJNaLcl1U
h9DtBAf/fJs9R87cXNcFsxrNNksszOWu5ND0JxSJzxsn6F/SqOtvQqIWwvNkZFnn
xAnvKxojILHRP1HP1bAZTpeH0tQumGjDYWgXWOiexYkar6+TZbQjftk+WEOvuXnE
H/Z8H6ZU+7dNneX7vyyM2cWjjngayoM2GWHdEE531uMUnRGhyvjPbiBTP9109Pnx
nN6FG8+ENYurZpOKSJS+0AvzdoEz22WMYo+fKENqtRP/yi0ERtabto5NOWkN7qub
OVcNIA3zR+5YxFGoXlA/0v3Y4ado+0sC+9kRpmE9eZ/oIQ/uKSXX0UzN1+WmDGIy
qv/iLyyNvpa1F18cw9aNNCfQSUL5QA==
=1c2Q
-----END PGP SIGNATURE-----

--7WENQHN97/U9vH7R--

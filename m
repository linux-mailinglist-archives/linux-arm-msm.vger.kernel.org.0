Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2A0262B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 13:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbfEVLBS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 07:01:18 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55612 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbfEVLBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 07:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zayKSYs/1H7s0xB/BM7u3QdiVVXr8vKW/624+3am8oI=; b=lBsZPNdl+N8oAgIkMsLdVrTnR
        szN9nikklbIFhthxDf+7g9jkQU3hMZP0jTjniUsU2bUIUR8FCKydeCfHZ2YYXMCsjWG7T99RN+jjv
        XCLG1c/qnj2jWwbvjAWB8553rHe7VwZMyoewf5+3MDRqQMna/HHUKeAPpMUWYk5pOp8Tc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTOzf-00043C-2o; Wed, 22 May 2019 11:01:11 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 678611126D0E; Wed, 22 May 2019 12:01:07 +0100 (BST)
Date:   Wed, 22 May 2019 12:01:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, lgirdwood@gmail.com,
        agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
Message-ID: <20190522110107.GB8582@sirena.org.uk>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
 <20190521185054.GD16633@sirena.org.uk>
 <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
X-Cookie: Does the name Pavlov ring a bell?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 05:16:06PM -0600, Jeffrey Hugo wrote:
> On 5/21/2019 12:50 PM, Mark Brown wrote:

> > > +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
> > > +					      unsigned selector);
> > > +
> > > +static int spmi_regulator_common2_set_voltage(struct regulator_dev *rdev,
> > > +					      unsigned selector)

> > Eeew, can we not have better names?

> I'm open to suggestions.  Apparently there are two register common register
> schemes - the old one and the new one.  PMIC designs after some random point
> in time are all the new register scheme per the documentation I see.

> As far as I an aware, the FT426 design is the first design to be added to
> this driver to make use of the new scheme, but I expect more to be supported
> in future, thus I'm reluctant to make these ft426 specific in the name.

If there's a completely new register map why are these even in the same
driver?

> > > +	if (reg == SPMI_COMMON2_MODE_HPM_MASK)
> > > +		return REGULATOR_MODE_NORMAL;
> > > +
> > > +	if (reg == SPMI_COMMON2_MODE_AUTO_MASK)
> > > +		return REGULATOR_MODE_FAST;
> > > +
> > > +	return REGULATOR_MODE_IDLE;
> > > +}

> > This looks like you want to write a switch statement.

> It follows the existing style in the driver, but sure I can make this a
> switch.

Please fix the rest of the driver as well then.

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzlK/IACgkQJNaLcl1U
h9AXBAf+Mto6O8QugYdL/55lY+O0vvNOPBrb59BAFs7716IWtNgDrcYMV26RZQSH
BzgdRdziDxkoGHoN5SW0+SMI4M3+P/z2H/27sIzWS9XVN1Sa2FWpY/YXuLbH2CZi
X9ghBPTYAzoMuBUmYLFGtLIRdiO9010etKXNciGD2gFJfNNadNKO3J8hC3OqDgTZ
bMxyC5g7MC3I9htRJ9yafXbbXHqahv65Ef6qJglqAab9l8lEYZUsinLDr0+RsDjA
VK6zsNXyfMwkdUUWvLpzObIWE3LYAys1o/c62/nPfPdJp39K5ZVaN8oAKAQlcULk
rvwI3qh/T/+DFRxCMIU+w/Hp9MLa5g==
=jGLx
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--

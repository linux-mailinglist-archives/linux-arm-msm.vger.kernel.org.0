Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74CDA48843
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 18:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfFQQEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 12:04:11 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33350 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbfFQQEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 12:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CLbL6cpc9U7h527k8o/1MxF91Z/CtBA1frPv8iuvv78=; b=CzHAVvqyU0UCgx6eMsims7dJ2
        21zkbdbIB6UEFSRRnA57/6BGsabwS5TzyehbKe065AwrEI+Ea8uu06M5wRo3ll3Jn6jhnbLpwF0Sl
        IOTHYtT2w6FjoIkYv1ipdWRbjt8XoDTPgR2Md3Qq2tadbnCiQxqlDjm0N7aPvyrwsu9LQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hcu6x-000279-GA; Mon, 17 Jun 2019 16:03:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id CBA86440046; Mon, 17 Jun 2019 17:03:58 +0100 (BST)
Date:   Mon, 17 Jun 2019 17:03:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
Message-ID: <20190617160358.GC5316@sirena.org.uk>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
 <20190617150502.GU5316@sirena.org.uk>
 <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l8YfOjwMha7d9KWK"
Content-Disposition: inline
In-Reply-To: <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--l8YfOjwMha7d9KWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2019 at 09:17:21AM -0600, Jeffrey Hugo wrote:
> On Mon, Jun 17, 2019 at 9:05 AM Mark Brown <broonie@kernel.org> wrote:

> > > +static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
> > > +                                           unsigned selector)
> > > +{

> > > +     mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;

> > This could just be a set_voltage_sel(), no need for it to be a
> > set_voltage() operation....

> This is a set_voltage_sel() in spmi_ftsmps426_ops.  Is the issue because this
> function is "spmi_regulator_ftsmps426_set_voltage" and not
> "spmi_regulator_ftsmps426_set_voltage_sel"?

Well, that's certainly confusing naming and there's some confusion in
the code about what a selector is - it's supposed to be a raw register
value so if you're having to convert it into a voltage something is
going wrong.  Just implement a set_voltage() operation?

> We already have code in the driver to convert a selector to the
> voltage.  Why duplicate
> that inline in spmi_regulator_ftsmps426_set_voltage?

Either work with selectors or work with voltages, don't mix and match
the two.

> > > +     switch (mode) {
> > > +     case REGULATOR_MODE_NORMAL:
> > > +             val = SPMI_FTSMPS426_MODE_HPM_MASK;
> > > +             break;
> > > +     case REGULATOR_MODE_FAST:
> > > +             val = SPMI_FTSMPS426_MODE_AUTO_MASK;
> > > +             break;
> > > +     default:
> > > +             val = SPMI_FTSMPS426_MODE_LPM_MASK;
> > > +             break;
> > > +     }

> > This should validate, it shouldn't just translate invalid values into
> > valid ones.

> Validate what?  The other defines are REGULATOR_MODE_IDLE
> and REGULATOR_MODE_STANDBY which correspond to the LPM
> mode.  Or are you suggesting that regulator framework is going to pass
> REGULATOR_MODE_INVALID to this operation?

You should be validating that the argument passed in is one that the
driver understands, your assumption will break if we add any new modes
and in any case there should be a 1:1 mapping between hardware and API
modes so you shouldn't be translating two different API modes into the
same hardware mode.

--l8YfOjwMha7d9KWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Hue0ACgkQJNaLcl1U
h9BokQf/fWdp7er8/W74adT1KeOqQi4nPS93SO7dWKuu7q1YNud8ppBRNgmG3djL
xaZh1dTIqVx2GICGfhZA3uEYPTsgPfNiM0ENiApp8OqfxX8VE5J6Ww01ikPQq08J
Hgwb5piOsDD1uQWUr07Y7R3eoZeKmFCWBRAxUSdNSFBdbQy/v1Of2Yl98/ghbP7Z
c8Au/mllEECB2Ew4rFXJXse1R19p0feZxxw2DQUPPB+AQ46TstNc487vUoSKNxJp
8D2BxD5Ph+8wT9lHUimBTNyNhBtRo8wiO0yXOe7xWR8w3rJxMUGe1jNJqFO4olqf
KFAvYXEW+12HBtSq7ZaqNi5iCB/XJg==
=GX4O
-----END PGP SIGNATURE-----

--l8YfOjwMha7d9KWK--

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543313B0792
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 16:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhFVOkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 10:40:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:52674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230047AbhFVOkv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 10:40:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CA2461378;
        Tue, 22 Jun 2021 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624372715;
        bh=MyhNL+c9sQXrWYKNAjOcAvrFWHv6tfoPr73JTbBBYCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C02DTrauRo62YzP44ABo7c0pzCl4EsyYfOE/OEXOr5EtyROY6obZKYheMpCJxGKBA
         UD9eAap2mHtoqFjVu+WFBUUvgqu/Km0Nth+WRcEfyQSA1XYGIIU7uODy6VtRlJkt6j
         1pnO3njuqtG8Q/40453JmY79piYWfbNm9O3HdCnLnHPVFz7A0z49rtTS5DEa5XLBVL
         q9Q0gk6bzJV5MhXf4cUJgzoeJILNjthrtfuz2WneP+xo0XsYQdInWt4bcCMBnPmfVT
         raca3KcSbKuefLfuaSVmdTBDOBb9FD8sJfCeXbKqgngOA48pLnQbcKefW8H0rEHKQ2
         ptQtG68JBrvLg==
Date:   Tue, 22 Jun 2021 15:38:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
Message-ID: <20210622143812.GE4574@sirena.org.uk>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
 <20210622112843.GB4574@sirena.org.uk>
 <CAA8EJpoTdg3O6dzpTaNS5fJRbtb1Fndv0mEuO+e4b6XCmuvzhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline
In-Reply-To: <CAA8EJpoTdg3O6dzpTaNS5fJRbtb1Fndv0mEuO+e4b6XCmuvzhQ@mail.gmail.com>
X-Cookie: fortune: not found
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--0H629O+sVkh21xTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 22, 2021 at 05:17:28PM +0300, Dmitry Baryshkov wrote:
> On Tue, 22 Jun 2021 at 14:29, Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Jun 22, 2021 at 01:31:36AM +0300, Dmitry Baryshkov wrote:

> > > Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> > > being controlled through the UART and WiFi being present on PCIe
> > > bus. Both blocks share common power sources. Add device driver handling
> > > power sequencing of QCA6390/1.

> > Are you sure this is a regulator and not a MFD?  It appears to be a
> > consumer driver that turns on and off a bunch of regulators en masse
> > which for some reason exposes that on/off control as a single supply.
> > This looks like it'd be much more appropriate to implement as a MFD or
> > possibly power domain with the subdevices using runtime PM, it's clearly
> > not a regulator.

> First attempt was designed to be an MFD. And Lee clearly stated that
> this is wrong:
> "This is not an MFD, since it utilised neither the MFD API nor
> of_platform_populate() to register child devices." [1]

Well, perhaps it should do one of those things then?  Like I say this is
very clearly not a regulator, it looks like a consumer of some kind.
The regulator API isn't there just to absorb things that need reference
counting, it's there to represent things providing supplies.  This seems
to be very clearly not a supply given that it's grouping together a
bunch of other supplies and switching them on and off together without
providing a clear output supply.

> I've tried following Rob's suggestions on implementing things clearly,
> but doing so results in too big restructure just for a single device.

I don't know what that suggestion was?  If there's only one device that
uses this why is it not implemented as part of that device?

> > > +static int qca6390_enable(struct regulator_dev *rdev)
> > > +{
> > > +     struct qca6390_data *data = rdev_get_drvdata(rdev);
> > > +     int ret;

> > > +     ret = regulator_bulk_enable(data->num_vregs, data->regulators);
> > > +     if (ret) {
> > > +             dev_err(data->dev, "Failed to enable regulators");
> > > +             return ret;
> > > +     }

> > The regulator API is *not* recursive, I am astonished this works.

> It does, even with lockdep enabled. Moreover BT regularly does disable
> and enable this regulator, so both enable and disable paths were well
> tested.
> Should I change this into some internal call to remove API recursiveness?

You should not be implementing this as a regulator at all.

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDR9dMACgkQJNaLcl1U
h9B2Hwf/X35x6Prj+oZAglRHpnyQgOLNQJQckoFKWi7U7UMLqoQa8sFfKYgY53gK
JsoduanV5yqSrjSC/BGK2LNnz5wN0kDvD95QSbLxqchC6jPIAu2ZLy5/Pr/EI1VM
nqsM0GmiJbWfDREnpANqjEnXJkDuxEZyS6niP8o8MqvNWmLEtj6tQiSUQG1xAlzk
5IDiZn4fkE+JchdmX7yYViglpvZJ9qM4QsDitbUSD9DmfJg5xwk2t5ZPbi8aOKgV
XSfQzYPxoTMM9r4vXHc9Eav1M1O/NU1+Jv6HYR1FrsNMePSmc0U5FamJMiPWhQTf
+uvsq4/+X5hXZ3frFLglZk9PUnTfjQ==
=Nwo6
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--

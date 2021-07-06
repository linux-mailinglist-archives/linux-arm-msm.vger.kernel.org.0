Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0273BD618
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 14:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235906AbhGFMbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 08:31:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:33316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237525AbhGFL63 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 07:58:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6F8861179;
        Tue,  6 Jul 2021 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625572549;
        bh=JXmBsXYXG9KG7U5AjlAUHgTa15XndAwh6xpRx35ssAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JbOfwmVF4OkhS5vWEeG1/y6EzbbSwmaGz+O2PUgdxW8i2J5XsnE7M6+ypvPxZiLBM
         3klouA+VESkfgGkHYyVBVx5HAXAMNeDdkwIVUlkmZB4SfoyyvNJwuuVLQZl1sl9nsf
         0qQ7VeJLZSks0CiTqNdrnJgOXjaWxCHUW29odk/ZYWRSc+mczvm80gi1qDhbm2bNPq
         XWfnvdeAJB7ZdvMhgvuqLB+U0egmAIOso0LHfx4nboab6JTrLN15TfrTVD7LgBqzzZ
         nemt4h8ofc9CIUk76G2oifZwmbZ+SizUH2SPthodth6U5RWSM+ykcrqZnKpIuDWzz+
         uyTdLgzFUAD1w==
Date:   Tue, 6 Jul 2021 12:55:17 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Peter Chen <peter.chen@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH v3 2/7] regulator: qca6390: add support for QCA639x
 powerup sequence
Message-ID: <20210706115517.GB4529@sirena.org.uk>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
 <20210621223141.1638189-3-dmitry.baryshkov@linaro.org>
 <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <CAPDyKFo6dmjw0TnaK7=35dq5Si_6YYpeeSa=gU++1od7WkQZ7A@mail.gmail.com>
X-Cookie: Some restrictions may apply.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 06, 2021 at 09:54:03AM +0200, Ulf Hansson wrote:
> On Tue, 22 Jun 2021 at 00:32, Dmitry Baryshkov

> > Qualcomm QCA6390/1 is a family of WiFi + Bluetooth SoCs, with BT part
> > being controlled through the UART and WiFi being present on PCIe
> > bus. Both blocks share common power sources. Add device driver handling
> > power sequencing of QCA6390/1.

> Power sequencing of discoverable buses have been discussed several
> times before at LKML. The last attempt [1] I am aware of, was in 2017
> from Peter Chen. I don't think there is a common solution, yet.

This feels a bit different to the power sequencing problem - it's not
exposing the individual inputs to the device but rather is a block that
manages everything but needs a bit of a kick to get things going (I'd
guess that with ACPI it'd be triggered via AML).  It's in the same space
but it's not quite the same issue I think, something that can handle
control of the individual resources might still struggle with this.

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDkRKQACgkQJNaLcl1U
h9A9oAf/QENRZjXRFVPDjWc5SZZ1jRLz0JmogYRWNMICgbOtz1VBdXoNW/Lww3pt
dke5UKjZ+XQkNR3aavlJL+PatLcw5KcLLIM7q6seqDtyV3oesMqPe4eHpf7E8niH
RlrkwxoSHb3r7/tYFr2TNDxL1ZuQKEOT1Bn1tcNP4krJ4sa2M4sYmM7XV4VdFlkE
/ymTDt9FrU/lQZHkT414lAI615+uJqFaRn17h6TnrC0MhELJ/BoLo62tBWaO0gtv
sey70r+PcIRzS6p/iA8i+HHNTfR5EiVnBF3tVidPeOwt8Haj8TfhdDGbvzeAuaDc
sia1bg8tC8v+IFLkdkwWFG7TzvN8ZQ==
=L8x2
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--

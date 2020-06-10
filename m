Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA42D1F51BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 12:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgFJKAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 06:00:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbgFJKAN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 06:00:13 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8777D206F7;
        Wed, 10 Jun 2020 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591783212;
        bh=VSaKKfy/V9rqADPSSuu4IkfVocrsiTN4SkeMzZaW7sU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YDs7MBeb2K677sLe+jsRXVpbxfgyiWtMqgAAH4UBRVDPr6G15N6APmORXYwb0GRiV
         8+vaBwg4yMWkxljIhw0cjb2+glk+B4zRdYHRnaSZhsEefHapZURnCwnIK5CNGsPWW9
         PssrjRNGQ367egX8GwKYwHnwj4R+zYE2Fw4pcmoo=
Date:   Wed, 10 Jun 2020 11:00:08 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 1/3] dt-bindings: mmc: Supply max load for mmc supplies
Message-ID: <20200610100008.GA5005@sirena.org.uk>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1591094883-11674-1-git-send-email-vbadigan@codeaurora.org>
 <1591094883-11674-2-git-send-email-vbadigan@codeaurora.org>
 <20200609230216.GA1655591@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <20200609230216.GA1655591@bogus>
X-Cookie: fortune: No such file or directory
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 05:02:16PM -0600, Rob Herring wrote:
> On Tue, Jun 02, 2020 at 04:17:54PM +0530, Veerabhadrarao Badiganti wrote:

> > +  vmmc-supply-max-microamp:
> > +    description: Maximum load for the card power.

> > +  vqmmc-supply-max-microamp:
> > +    description: Maximum load for the bus IO line power.

> By a 'common regulator property' I meant documented with regulator=20
> binding like *-supply, not common to MMC. How is MMC special?

TBH I'm surprised that these aren't defined by the MMC spec or by the ID
information from the part we find connected - I'd not expect the board
to be defining these at all.

> Thinking about this some more, what's wrong with the max current in the=
=20
> regulator nodes? I suppose you could have more than one load and need to=
=20
> define the loads separately?

One of the bigger reasons to think about the loads would be to
dynamically configure the mode the regulator is in to go into a more
efficient mode when some of the devices attached to it are turned off.

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7gryQACgkQJNaLcl1U
h9DsNQf/QMOcKgKBR1OfTOXetzJw0GYmTTeWBRwrDxvOzlh/codHfgyJ97CrHmOY
1+Th0yTlUfe69S3B5iZpER3S5jU+lsZmkeaKBNfxx3qykrWDpRi3FQG5AIOEBDB6
m43i71UuvaryROGVyZQWEXiQ+H6RpJ7MV7IUBSa9bFZBVwwJ0ous7/nzsPt5iwfr
0P/ZivT1TK9t/Zkp7biFYiuIZqvtDaSlO6yyPIb60D0Xq4+9XVJ+kPYnvRj7CEb5
w3RLxK78z4QCWveNCjNrhIUtynLudM63ofRP3O6qtcYQ7wRkHjvpTbOZ4JvUMoKl
bdh2nZKb7xJazHo13G3QtNgjgoq/0g==
=QJTj
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

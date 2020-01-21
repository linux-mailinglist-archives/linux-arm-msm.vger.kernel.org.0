Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D76C4144223
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 17:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgAUQ2B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 11:28:01 -0500
Received: from foss.arm.com ([217.140.110.172]:45542 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgAUQ2A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 11:28:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D9B630E;
        Tue, 21 Jan 2020 08:28:00 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0F403F68E;
        Tue, 21 Jan 2020 08:27:59 -0800 (PST)
Date:   Tue, 21 Jan 2020 16:27:58 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: vqmmc-ipq4019-regulator: add binding
 document
Message-ID: <20200121162758.GE4656@sirena.org.uk>
References: <20200112113003.11110-1-robert.marko@sartura.hr>
 <20200112113003.11110-2-robert.marko@sartura.hr>
 <20200113144101.GM3897@sirena.org.uk>
 <CA+HBbNFZRd6igqUC6qjBdaPQ-37x_p90zCByTxNFDsJsRpMsGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline
In-Reply-To: <CA+HBbNFZRd6igqUC6qjBdaPQ-37x_p90zCByTxNFDsJsRpMsGw@mail.gmail.com>
X-Cookie: You too can wear a nose mitten.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 11:33:12AM +0100, Robert Marko wrote:
> On Mon, Jan 13, 2020 at 3:41 PM Mark Brown <broonie@kernel.org> wrote:

> > ...requiring it doesn't seem useful.  All the other
> > regulator-specific properties shouldn't be required either,
> > unless the user specifies a voltage range we won't allow changes
> > at all which should be safe and the name is purely cosmetic.

> Are bindings even required at all here then?

Even if there's no specific properties you still need the compatible
string and documentation that it should use the generic regulator
binding.  This should be trivial but it means that we can do things like
validate system DTs.

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nJo0ACgkQJNaLcl1U
h9BD7Af/Z+CvO0r35ZuGFo9ti4Wqf5dNd573mF96aEKbUl/LhYFjYVryIpydGG3E
3MJxciGc9gspX4vzooRK6B2WkWqbVWUF56H68XA7D3ONK8llaGjtTOT+Ttn/v7uC
Jh/DFvRdvVCfwUMAITW4znqy806k7DRJDWSNq5I0Mv9Z8OcNOkZP5jnxai0eYCuv
WCnZQOWux4pK0DVHC+RHOW/rbiowOmcXgDD9PGv6Hc3XbtV0KcQ9W2OvjuUJC0k1
BXnvh3sgblk174bvKz9QVBnaYiFltHoNWS+sC8U+UhN3ieuYQOBEqpyjAwK5CTVW
T2OpSPfT1psIKEWUCYP3p4I53LQoRg==
=RiUj
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--

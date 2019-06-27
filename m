Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D2E589E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 20:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfF0SXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 14:23:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:53344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfF0SXz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 14:23:55 -0400
Received: from earth.universe (unknown [185.62.205.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F566205F4;
        Thu, 27 Jun 2019 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561659834;
        bh=fWIzpDW0+Wg+5wTx85ZaYjTGVBeQJ9z2XRONfWJCNns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iFbS+UwBaYIBWqY8qMXUv4cnT55vJ4sgPwlTOApwHeqWpcFJ0eGZAxMWS4OyxNu5H
         I13AlimxaulvJTGPVfAXdgaSeYzbGybY8eK8ELjedo7E7fSG4TquRJRnqahaXmUQdB
         QVgFLAJ65+e1+X4CjHHuLkSUUh/57XGpoTunhl18=
Received: by earth.universe (Postfix, from userid 1000)
        id A716D3C08D5; Thu, 27 Jun 2019 20:23:51 +0200 (CEST)
Date:   Thu, 27 Jun 2019 20:23:51 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] reset: qcom-pon: Add support for gen2 pon
Message-ID: <20190627182351.hkzfg2xtrdeijb4v@earth.universe>
References: <20190614231451.45998-1-john.stultz@linaro.org>
 <20190614231451.45998-2-john.stultz@linaro.org>
 <20190616185637.GE31088@tuxbook-pro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="krkyqiyijqfvwquy"
Content-Disposition: inline
In-Reply-To: <20190616185637.GE31088@tuxbook-pro>
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--krkyqiyijqfvwquy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jun 16, 2019 at 11:56:37AM -0700, Bjorn Andersson wrote:
> On Fri 14 Jun 16:14 PDT 2019, John Stultz wrote:
>=20
> > Add support for gen2 pon register so "reboot bootloader" can
> > work on pixel3 and db845.
> >=20
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: David Brown <david.brown@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Amit Pundir <amit.pundir@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> >=20
>=20
> Sebastian, please take the first two patches through your tree and we'll
> pick the dts patch through arm-soc.

Done.

-- Sebastian

--krkyqiyijqfvwquy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0VCbQACgkQ2O7X88g7
+ppyNg/7BfW4RlYs2Mbp6/IMpbcPouG/tAxSmwpbNSiZs8NA9y87/m0/E0+cqaaC
mvkLsfFXmt1cug4z7wskcBPe8ipUnwONkzA/ZttNhIJKIT7mU/VR7kaV7kmdzfXd
j1jtJknW5MuxJoC6/Xv78lBOZd1cStlY2xrAxInbPmaos9xS83sY853XgOgGOOR4
yrn5fS1Utsf6Ws5fU/eXZnkoOYbc6OmSRh8uJhnTzTTkSS4TJCSmgv7P72bA5vPv
3rXWjyA7Oqwv1k5qiuMldNRctQPMN7k6/ZfWuqbZJ71c6BoiD/2fVTus1rCq1Np8
qO49NDOXAlIk9vKMN0j5jsLHFjU2FG2cuEPp3+vkRXq/7716c2AICosKilw01tf5
/jg/u7+QqhCYxyj0AQlBo80rituoKOA0nOcMCIyS4bvEQFVOpPR9PJoL4Nh0tzwS
zTs9iiOSby5lFsKFV9i8UsEMlxwotmHUu+ffolsfi3V6941fVTbFgAllLN5Gl6sl
f3px93C0UMbyn3d3bz2+jLwMaU6yVObQZ4uH7VhR/8II583A2ZHP1kgY7K/PmJWx
H672IKsoNpRnns242WUqvAVP6BiGBw+Dv5cvwzKFHSA6iBeFqdP3HSby4i1Xrj8O
idypzibFCOeQlTypDrbhhc3TCQr6lRBuGm5hCGflZFHTduXotKQ=
=8aBk
-----END PGP SIGNATURE-----

--krkyqiyijqfvwquy--

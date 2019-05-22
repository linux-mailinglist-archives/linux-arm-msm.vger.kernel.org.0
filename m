Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA5A265B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 16:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbfEVO2p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 10:28:45 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36820 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbfEVO2p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 10:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OXmLc8bSIMLSQIDMwLhc+SaxU3Xuanb61bHQ8Mozh7o=; b=qmZLcTK8t7jPXa0FqM0B9E5MO
        wDrieXAdFArXgdtkDHZ4mCXR1lV0Q/8uRyaAu4qo8VgqfFcZP7/hOOOL0vB5jf5l+BPbbz9zGjBQ6
        co/VRh2OA1pANEq6vc8joBOa70B/q9kt2Kik0LB+Ne4BIXOzOz/F5dkZXXrRue8sxjTJA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTSER-0004Un-9o; Wed, 22 May 2019 14:28:39 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id DFE3911226BC; Wed, 22 May 2019 15:28:37 +0100 (BST)
Date:   Wed, 22 May 2019 15:28:37 +0100
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
Message-ID: <20190522142837.GE8582@sirena.org.uk>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
 <20190521185054.GD16633@sirena.org.uk>
 <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
 <20190522110107.GB8582@sirena.org.uk>
 <4e5bdf77-3141-bff6-e5b9-a81a5c73b4e4@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline
In-Reply-To: <4e5bdf77-3141-bff6-e5b9-a81a5c73b4e4@codeaurora.org>
X-Cookie: Does the name Pavlov ring a bell?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2019 at 08:16:38AM -0600, Jeffrey Hugo wrote:
> On 5/22/2019 5:01 AM, Mark Brown wrote:
> > On Tue, May 21, 2019 at 05:16:06PM -0600, Jeffrey Hugo wrote:

> > > I'm open to suggestions.  Apparently there are two register common register
> > > schemes - the old one and the new one.  PMIC designs after some random point
> > > in time are all the new register scheme per the documentation I see.

> > > As far as I an aware, the FT426 design is the first design to be added to
> > > this driver to make use of the new scheme, but I expect more to be supported
> > > in future, thus I'm reluctant to make these ft426 specific in the name.

> > If there's a completely new register map why are these even in the same
> > driver?

> Its not completely new, its a derivative of the old scheme.  Of the 104
> registers, approximately 5 have been modified, therefore the new scheme is
> 95% compatible with the old one.  Duplicating a 1883 line driver to handle a
> change in 5% of the register space seems less than ideal. Particularly
> considering your previous comments seem to indicate that you feel its pretty
> trivial to handle the quirks associated with the changes in this driver.

Ah, so it's not a completely new scheme but rather just a couple of
registers that have changed.  Sharing the driver is fine then.  Ideally
there would be some documentation from the vendor about this, a mention
of IP revisions or some such.  If not what the DT bindings do for names
is use the first chip things were found in.

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzlXJUACgkQJNaLcl1U
h9C+ZQf/TqQlF1ddY6Pa7ieCP0TCY5fWm5JoIZlTG/2Rm+N9ucuHg0yY69ufYHfx
2/um2JJBej0FYI2l20kRcV+D5Mgzi9fr7bM2HHWc0eMUpDcSgxAsPE5yMPwTELwt
u59c+J7YyFL4I0ZZsLvFl/tLvf+eEAOgluj/wjMHXbE6rjjwujGnz7MTljY50EQB
+z/EfHzhJQj93txkYaEYmIdAUWLIqzgMlxYvfcvqU3/5af3FAyk43ytzT19MB3Ty
+rC6IkooIfmgFJnRfCjbxu6igpsVl6vTGgRwL9UnLOz86RK4yhvrQ9zdlgYoWViK
4aIBU4bxP1MI3uscDoP+YyNoKjE7Yw==
=yQnz
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--

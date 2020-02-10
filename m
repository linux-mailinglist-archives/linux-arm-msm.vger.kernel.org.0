Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1B1158239
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 19:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgBJS0M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 13:26:12 -0500
Received: from foss.arm.com ([217.140.110.172]:37366 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgBJS0M (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 13:26:12 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 099E01FB;
        Mon, 10 Feb 2020 10:26:11 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8337A3F68F;
        Mon, 10 Feb 2020 10:26:10 -0800 (PST)
Date:   Mon, 10 Feb 2020 18:26:09 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Adam Serbinski <adam@serbinski.com>
Cc:     Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols to set PCM rate
Message-ID: <20200210182609.GA14166@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <18057b47c76d350f8380f277713e0936@serbinski.com>
X-Cookie: No lifeguard on duty.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2020 at 10:45:16AM -0500, Adam Serbinski wrote:
> On 2020-02-10 08:36, Mark Brown wrote:

> > This would seem like an excellent thing to put in the driver for the
> > baseband or bluetooth.

> The value that must be set to this control is not available to the bluetooth
> driver. It originates from the bluetooth stack in userspace, typically
> either blueZ or fluoride, as a result of a negotiation between the two
> devices participating in the HFP call.

To repeat my comment on another patch in the series there should still
be some representation of the DAI for this device in the kernel.

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BoEAACgkQJNaLcl1U
h9Dt3gf/bFSOu6V+qzsiaesbSxDO9219Hy4V2hYSQ1z8vybvLiHC/y+aBPL2xMkR
UfIpywFkr/Z8rfeh9AgWE2DekjHGzhuSiGL6bIUL/rJby4SFpqivGd0CXIm9+Otl
cqW1Z+brf3N1dWwqlgV8SXdZP3KqS/6xPhIPOVHgU+2rEcpK6zA/E11pMzsxDx0Z
IP42k+mNUvpjn8tDN9XCRXoLsRViBTcWu8bnQ7LhpgmVVeCuJiFzm9yYcRuvuiI9
1pBk+lu+M1OSfymucb34ZroCtsdqUj3A0nN5Dgg80d/Ju/6zuYINwHwXqlI6Xqp8
yU//EGeDtJIQdteOB1q30MgKqRKKpQ==
=cdIZ
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

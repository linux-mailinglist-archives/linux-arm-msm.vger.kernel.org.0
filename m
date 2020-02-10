Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB29C15841B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 21:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgBJUIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 15:08:43 -0500
Received: from foss.arm.com ([217.140.110.172]:38402 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbgBJUIm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 15:08:42 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF8D431B;
        Mon, 10 Feb 2020 12:08:41 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 614613F68F;
        Mon, 10 Feb 2020 12:08:41 -0800 (PST)
Date:   Mon, 10 Feb 2020 20:08:39 +0000
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
Message-ID: <20200210200839.GG14166@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
 <20200210182609.GA14166@sirena.org.uk>
 <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline
In-Reply-To: <f88d21773f47f5a543a17ad07d66f9b7@serbinski.com>
X-Cookie: No lifeguard on duty.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2020 at 03:00:55PM -0500, Adam Serbinski wrote:
> On 2020-02-10 13:26, Mark Brown wrote:

> > To repeat my comment on another patch in the series there should still
> > be some representation of the DAI for this device in the kernel.

> Respectfully, I'm not sure I understand what it is that you are suggesting.

> Is it your intention to suggest that instead of adding controls to the
> machine driver, I should instead write a codec driver to contain those
> controls?

I have already separately said that you should write a CODEC driver for
this CODEC.  I'm saying that this seems like the sort of thing that
might fit in that CODEC driver.

> Or is it your intention to suggest that something within the kernel is
> already aware of the rate to be set, and it is that which should set the
> rate rather than a control?

That would be one example of how such a CODEC driver could be
configured, and is how other baseband/BT devices have ended up going
(see cx20442.c for example).

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BuEcACgkQJNaLcl1U
h9DMaQf9GjP0HkMcqo5yI64nvRK1tv1Ea9AL0H1Mlyqry7AQgS5d1PcRXiYU9MOj
9eMHwbPyh02erDpaLNZLuawcksp7JmDypG7Wj6ZAw6FUh3YnybFjq+pao5SBb/e4
4xvGxokT0mYhgXkBOL8l+Rarkz4HHmnsuag1YeGP82F8ZnCpDH0mzO4D005vA83D
Xlv0KtbReo0N2zuM8ElShKIiIBaO4gnvsU6Mxf4PaOhPTYh3Q7ubtB4zJ/+JJh7/
O+q5EyXDZnXR+FK65tdzGg3UaaQwGyaAAEhdW8A5u48uxnidwWTKM0QE+eHolHL4
5vpjCOhUsJOeS+8qXyfakKzjpY2E1w==
=02k4
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--

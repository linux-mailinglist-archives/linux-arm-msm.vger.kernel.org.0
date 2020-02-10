Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08F7C157460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 13:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgBJMRu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 07:17:50 -0500
Received: from foss.arm.com ([217.140.110.172]:59632 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbgBJMRu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 07:17:50 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F32D1FB;
        Mon, 10 Feb 2020 04:17:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2383B3F6CF;
        Mon, 10 Feb 2020 04:17:48 -0800 (PST)
Date:   Mon, 10 Feb 2020 12:17:47 +0000
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
Subject: Re: [PATCH v2 0/8] ASoC: qdsp6: db820c: Add support for external and
 bluetooth audio
Message-ID: <20200210121747.GB7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <20200209154748.3015-1-adam@serbinski.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 09, 2020 at 10:47:40AM -0500, Adam Serbinski wrote:
> Changes from V1:
>=20
> 	Rename patch:
> 		from: dts: msm8996/db820c: enable primary pcm and quaternary i2s

Please don't send new serieses in reply to old ones, it can make it
confusing what's going on and what the current version is.

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BSeoACgkQJNaLcl1U
h9AXcwf+JotBidwYRMp5BFxzyJd8AsD5K/bwUTlXwbhHdclwaupF2z3h0gGO18p0
tWogxstUFEdCAZVVYrkvF/+ft2+uTGq97dzwYNvmElu+aVxxCTpVFcPqmmupQs2Q
fbOxU0/JFCUjSeZtMd38eqINLOYZw2sAYdeBPpVA131kMdj4fG2G6Xc488cjr2Im
NijwBF7pTlc8patTM6m7FSMtfSHu9w9S7OEMC4TVA2rpdOCkINXatLaW8rMcf4WF
EnrKOYYrkNAb72uiwyhWDqVUcneFDq/dooPTA2pT3SZdV+FFW0eZ6XpLTYXepk1v
u9vqNNjvnMKE2W46nfIEdkuTS8D17A==
=uHcF
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--

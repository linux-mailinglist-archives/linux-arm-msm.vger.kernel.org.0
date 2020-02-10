Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35CE2157C38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 14:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731474AbgBJNfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 08:35:51 -0500
Received: from foss.arm.com ([217.140.110.172]:33798 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727828AbgBJNfu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 08:35:50 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43951FB;
        Mon, 10 Feb 2020 05:35:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2A63F68E;
        Mon, 10 Feb 2020 05:35:49 -0800 (PST)
Date:   Mon, 10 Feb 2020 13:35:47 +0000
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
Subject: Re: [PATCH v2 6/8] ASoC: qcom/common: Use snd-soc-dummy-dai when
 codec is not specified
Message-ID: <20200210133547.GI7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-7-adam@serbinski.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="16qp2B0xu0fRvRD7"
Content-Disposition: inline
In-Reply-To: <20200209154748.3015-7-adam@serbinski.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--16qp2B0xu0fRvRD7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 09, 2020 at 10:47:46AM -0500, Adam Serbinski wrote:

> When not specifying a codec, use snd-soc-dummy-dai. This supports
> the case where a fixed configuration codec is attached, such as
> bluetooth hfp.

Fixed configuration devices should still have normal drivers that say
what those fixed configurations are.

--16qp2B0xu0fRvRD7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BXDMACgkQJNaLcl1U
h9CYzgf8DU6Fw+qDimV4Ug1WnuJrwfbSYr1FZoSZ7Cghuqu1iivMC1eRDp2KmIsO
OrabAfutm8A+HH6/daaPn0JePCU+/Z/q2MiCJCsf6Kp6yqLcia2N4qfamVOaoZw0
7TtETvXhLQ5zSqQkV8kqfRlYsyMesAtSD6rGrNBo9nY5ZFh5iJ0dvVCMvwOic/oX
PMIaJ0ih4lvq3CnuGdP/agOdlC+UvqKmrU10Z1lgKxHrWQxynjjRD0ktIoNygZQx
RO6T1jVY3wqz4Y59OL0xJaIHECc7Yx05EBwFoBaCr25Zgci0jjbb2RlfHVHazlo3
gXUz3ap0UdkUw8fp2dxJRiL45BQVyA==
=+Q3I
-----END PGP SIGNATURE-----

--16qp2B0xu0fRvRD7--

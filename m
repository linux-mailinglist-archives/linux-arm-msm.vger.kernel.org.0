Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A9C281766
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 18:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387938AbgJBQEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 12:04:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgJBQEY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 12:04:24 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A45C8206FA;
        Fri,  2 Oct 2020 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601654664;
        bh=tLPzH2hyb1cVoOBRiSqGlR//BlHHzuzYZmefLI5fJt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AB6YYz7ouhlp1NgTCFdm/NFc6Z0iOVjqoyw9x8bSTba7zyFmaVRrPR6VxQFviRROr
         SoRs0Uf3IfS0uhO4/QvyPQMYfeWeCrXU1f/M2JcokALezj2EKz8uaJbhwF2jLm8idx
         dZ9NnRzeE8ZnHDCTTkM4qDelXpNZIjlbOrM/jGdk=
Date:   Fri, 2 Oct 2020 17:03:24 +0100
From:   Mark Brown <broonie@kernel.org>
To:     David Collins <collinsd@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
Message-ID: <20201002160324.GE5527@sirena.org.uk>
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org>
 <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com>
 <20201001174326.GT6715@sirena.org.uk>
 <160157827040.310579.12112194764912078296@swboyd.mtv.corp.google.com>
 <7c45b147-f1d2-4b32-9e51-71c5d2cb576f@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Content-Disposition: inline
In-Reply-To: <7c45b147-f1d2-4b32-9e51-71c5d2cb576f@codeaurora.org>
X-Cookie: Words must be weighed, not counted.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 05:45:00PM -0700, David Collins wrote:

> The SPMI regmap debugfs files are used extensively for testing and debug
> purposes internally at Qualcomm and by our customers.  It would be helpful
> if the more verbose naming scheme were accepted upstream to avoid
> confusion and broken test scripts.

...and doing this in the dev_name() should help other diagnostic users
(like dev_printk() for example).

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl93T0sACgkQJNaLcl1U
h9BIQQf+PljQWeGDBbOYRMF4h8E3VCi3zypNNsEiVmCSNf9g8u9stDEBLNN91RJL
oMxZEvQ8OX9AvZseXCiUxFlaOSbbBJjfPYAV0ZXO32axRjWCCg0KA6Q6j5087vGp
fcqqKmnTVWVj77FH+Z8rATYDFqtkNVZgqRrcJpcXVpFPkn3iQtO4Are89iHMaI17
JxvizSqlEtCSlhM2jRrqrsR6eOMQ7Y5YYxDBPkpGQ5EhCYEWV4yL0dwgGdpuu90L
fYE+Y600avwvgRTPUjbmY0aMMaGP+wnzCnXbYsTzgg/rgUrKjVz6It/Yo7g+ETvR
BDYkRcbeuNwQ+dSqdDBZcEHkJ8LYZQ==
=oQjy
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--

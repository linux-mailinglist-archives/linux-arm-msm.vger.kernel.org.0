Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E7D445433
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 14:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhKDNrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 09:47:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:40598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229869AbhKDNrS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 09:47:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C32A6112D;
        Thu,  4 Nov 2021 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636033480;
        bh=2IZ1MpOoH9S3y2ci4QxGhZ12rQuQHoqmEAL5qJFT5Xg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rva4quG1xXSuZKkw+aH6M3vlpYaIsNXvtBFL/C2EMp6lMinWTM4oFYTRgxotAFTvy
         bbEW+q/DhK2iM7J3zJ1rZ0x2xOHNca9+H0DJM4hd7zlYJd0sTd68qgUJwRYZwdvc1/
         dr/YxTiSGOrLoM8CaPlTmXoY3M60qKC5CpDU/l+qJLu1pLctocrDy3/JC2Rz9uKy50
         Je6nVROX6LfgK3nYf4UDKau/jmp8n8ENh58k4jQBJM+iVludlwzsh2YNAu7KgsBc6n
         2qq3FkdbKLtaDjdyOtXIHRsDz6Oz8vfTbfCKFTdRsI6s1pu7naMZpQn/M07ODBPTSS
         Yhdq5XltB08Gw==
Date:   Thu, 4 Nov 2021 13:44:35 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_spmi: do no register unused regulators
Message-ID: <YYPjw6f4mPeslcGK@sirena.org.uk>
References: <20211104004351.2206578-1-dmitry.baryshkov@linaro.org>
 <YYOYZ1cEFFJhX2ae@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h3V8QfBcIZ6fJVOy"
Content-Disposition: inline
In-Reply-To: <YYOYZ1cEFFJhX2ae@gerhold.net>
X-Cookie: Motorized vehicles only.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--h3V8QfBcIZ6fJVOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 04, 2021 at 09:23:03AM +0100, Stephan Gerhold wrote:
> On Thu, Nov 04, 2021 at 03:43:51AM +0300, Dmitry Baryshkov wrote:

> > Typically SPMI interface to PMIC regulators on Qualcomm platforms is
> > used to supplement RPM interface in cases where direct control is
> > required (e.g. for the APCC or GFX regulators). Registering all possible
> > regulators is thus not required and may be potentially harmfull if
> > somebody tries to setup those directly. Thus register only regulators
> > that are really used in the device tree and ignore all unused
> > regulators.

> Shouldn't the missing regulator constraints already take care of that?
> If you don't setup any voltage etc in the device tree it should
> effectively make the regulator read-only.

Right, we won't touch the hardware configuration unless there are
constraints explicitly permitting it.  Drivers should always register
any regulators that are physically present unconditionally, the core
will only make changes if the system integration permits it.  Open
coding this in drivers just causes code duplication and creates issues
if there's changes in the generic bindings.

--h3V8QfBcIZ6fJVOy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGD48IACgkQJNaLcl1U
h9AOPwf/USfd+yxesPi2E56+4jeZ7wPWZnC5lBakLqilvg+fkDIgd7G8bzlo7gJt
PZbrn/izn7EYLyjipcvori557X3TEstcwJQrvA0AaF/57tDEP2Ttam/ygcO8MCtV
Mgi+McbnQXPUj4mGCzTKM+bLdFwDZFOTIgcdeeoGgSGMeaxjBPL6TMUIuZnzUHsn
0x2exb/aCNOFjCZ/sq578HsytQz3epkSQvFsKXfmWNSLovAtaPshba0HcOi7oByi
deqOMDoGAM3sfCx8dX/1OzQ4FHlmI49Iv6BInhDgDfofuPtFAmcX6Xm4voLxuNpK
kai0WitpT6lGhXAlKqOhyItaGIlSwQ==
=9orx
-----END PGP SIGNATURE-----

--h3V8QfBcIZ6fJVOy--

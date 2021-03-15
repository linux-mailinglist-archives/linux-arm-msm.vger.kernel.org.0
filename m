Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C284033BFA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 16:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbhCOPWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 11:22:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229703AbhCOPVf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 11:21:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B00664E45;
        Mon, 15 Mar 2021 15:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615821695;
        bh=7eA2jOmALQBifeGCCZLfB7f+nnHFLR/kMJZ3ERyDZq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qFYFYh++JNd0c1XFJkfHGZvZpBKvSo61n4U0YVKTOfMkPmw75CJyBTO7XwforFA81
         JBoPAro5qQ5Ge3+kKRz1/pznayHYr/IqW7ePpGnlGWnuHYmUqSj3fbLyORid8LU6bI
         TkCo+s6JZNE1bFEaijEDhEZJHwaSM98Ifho/hxzGNpIjj2DldDQBDwTrPk7239vsPE
         3MskxVRJbXrt9+GaKJwT3d3dXYF/QOf3Myab8BkiC48Ic2P5fSYVFTd0wn5BgKJHnU
         xj5ruO2xcJiCJuySoBXLV4h7mCU5TQPDJziGXXWNQJ0fpBuVrY2PdI9gehO1eOiQQI
         Wh+g+78H0terA==
Date:   Mon, 15 Mar 2021 15:20:19 +0000
From:   Mark Brown <broonie@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH V2 0/5] Add PM7325/PM8350C/PMR735A regulator support
Message-ID: <20210315152019.GB4595@sirena.org.uk>
References: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
X-Cookie: Close cover before striking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 07:24:09PM +0530, satya priya wrote:
> Below patches are already picked
> [3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
> [6/7] regulator: qcom-rpmh: Use correct buck for S1C regulator

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBPezMACgkQJNaLcl1U
h9BF1Af+KEPuzg138g/HoYKia5LJ6Cdyk4fa3fVVHcVFXlsXmQHM22Mp3Tf28e/X
lIM9+E/H0bTB24qIAAVKZvGizf34EIjD0ykWcEwQyObDqmuB9u7mtDCKiiy7HaOw
J/Ia3B7o/QSrHaFQitLPytDIDN2PROBKhpB29QWj1rLSdnllgmjBv+vHLOj5VCC0
FqZ/YroEo9Ii5GsFVp9lGmlrKjAjyDTVt9aXwMgJH3xrcTUfDgolLcdQPLxc8ssU
pbwVLlWJ4FWYpqqjaEEFp942ThfCy6V4SPSNBSr6LJHhIYxtNVGEVkk1XT0GyKCZ
0fiPtsP7Jd2dfi3rWc5kui9dEStp0Q==
=TFHb
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--

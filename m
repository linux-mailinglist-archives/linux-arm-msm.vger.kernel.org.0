Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518A429D2E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 22:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgJ1Vh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 17:37:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbgJ1VhZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 17:37:25 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34CE2247C7;
        Wed, 28 Oct 2020 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603920698;
        bh=LB7IIgnXLRPsvFSUKfcokjOHLKCLUEJ1lH4XLR7MgK0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k+A7w0xItkNypDfSE7bzwrJqNiCTMGib6IX7NpCgnWnSUwFpafXnO36QAYiJdnpnf
         EOvurTDYgXlZqJIYCL1avYRyhlWXUbxuL74ZdIigPGd9Xcx4lyLEQ17m6Jmf3f4zF8
         PQ1E4zSN9hqRZ3SMZF3Mf+sqJgazYPWF4Pvzo0OA=
Date:   Wed, 28 Oct 2020 21:31:32 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v2] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
Message-ID: <20201028213132.GC6302@sirena.org.uk>
References: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
In-Reply-To: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Allow 6 to 8 weeks for delivery.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 05:04:34PM +0530, Srinivasa Rao Mandadapu wrote:

> Fixes: cba62c8b49be ("ASoC: qcom: Add support for SC7180 lpass variant")

This commit is actually

    Merge series "ASoC: qcom: Add support for SC7180 lpass variant" from Rohit kumar <rohitkr@codeaurora.org>:

which is not the commit that should be pointed at here.

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Z4zMACgkQJNaLcl1U
h9BhgAf/REPtAdUvxZvoB6gjMUFKH76y/rzERDgx0/fE+V/YDYb4P7Y45oXgGgwX
qHVXKLHq5BO4CsRGk1pozAgu4JsLRmTe/nmOkhSKl03VOUxAOrdJ5aYbQJotmEJD
oJEo4v4slQWlq1e4zfR7KF6f/eX/kF1r7GSErZBZ+RjGJETpfqsIbfL7wOZs4u9q
xsA7JJzVfzObYngoBJTZ7gHvuGYrbNXowOWkGrR/CiYFlDLMtPgWkZgtWSIjpbzc
mQCm+OOXp8ImuP3fc8Y02yzDlnus5yiPwareUbYjLPRKwOZQW88FfbfzyAA5AJDK
Uzo/iywf8dc8Nr9VGZGyXr1Zrj5k1w==
=ANOe
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--

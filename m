Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30AC141F64B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 22:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhJAU3H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 16:29:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230111AbhJAU2O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 16:28:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B12D61A56;
        Fri,  1 Oct 2021 20:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633119990;
        bh=vXHfax9r9lddztIM164XFEM0kr2hoeoQ2/mwckZGDAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=meZ3RyYTPec73G07idC5IUTIyL9CBE5FHdWwR51raQdT6tH84HRfySGFUc6KU91rM
         eqUTBvWCwNFl3o1dWseBwjfLpYFCLWF6IJubEg3LCRkqwhN6nnkj/tErFkbVOee8eC
         RiHB49+kcCXeBqp5H3sC8S9U4vDBX1YrfC9l83I3Q151IjbBXjfSsV1ljCk8B2AmM3
         yRII7FcYHNn0ZvkT8zUQeX5Sgiklo2JTuzaDqI2iOyQRerr2Au8b0+UL0GRxlMYMnx
         H9mSyP8KufKGqoUS61wsByeyA7hSYOgMKS2keQwdHdx/V8TRgiHA+xQ4OlZsdt5KB/
         N7F5wsRdSbr8Q==
Date:   Fri, 1 Oct 2021 21:25:39 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, mka@chromium.org
Subject: Re: [PATCH V1 1/2] dt-bindings: spi: Add sc7180 support
Message-ID: <20211001202539.GE5080@sirena.org.uk>
References: <1632997450-32293-1-git-send-email-rajpat@codeaurora.org>
 <1632997450-32293-2-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
Content-Disposition: inline
In-Reply-To: <1632997450-32293-2-git-send-email-rajpat@codeaurora.org>
X-Cookie: "Pok pok pok, P'kok!"
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2021 at 03:54:09PM +0530, Rajesh Patil wrote:
> Add device tree compatible for sc7180 SoC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFXbsIACgkQJNaLcl1U
h9ASeAf+Ovebf56F1WWWWiQKFCWm6cBwITcjaeV7bhiWd297kBrRONtcJ16/h1b1
Ao6YxQFw5LJF8JYr4LE/NlYeEsBXQ8ELzZaCfoiZow2v+GVKaqkpn/uzLCoVGYR1
2miPdTc0dsuWwjjg6cCxWEjNXauSoFooSkyWtTW4C93OTvpdCjE01N+cVwFaEZW3
uCEyQfkujOft6i+Bk59s3IZGFwOnMEHqOdcBskKmNoeNLoLL1SAuvKoq9pF6rdxh
ImGd5MqnjbvS89Auw+1G5dkQB3wZ1ZLXJSBc8FGOFrKf7ke2UPLOIyX6L4p3U9+H
Rz/2BhRFzoItt6xFeiyR2wwVL1s1Qg==
=S3o7
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--

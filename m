Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B6B35000A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 14:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235409AbhCaMSd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 08:18:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:36000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235119AbhCaMSS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 08:18:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06C576192E;
        Wed, 31 Mar 2021 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617193094;
        bh=u7LpefF8xJjsWeVPdFEv6lIBIP7FmplpuMDa9sjTYK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k8yNaTqpJxrJtV3SADlwVqARidcyQJrRY+Oz6TqHn+dBzSF6Bvbs6cN7uIDJkB7SW
         Hrb3p7yE31fNXL7SVAe1WOlSaj3zEEhjFwHxRMjDOXk8tX/lLVhpydfT0U6znETN+2
         rJqENN/am41zliT37FPNdPS85IBelW+4zV9OsPDj7IdRluWnaNqmqoC4Vp6LkRsfLl
         W5jXx9dGgxLbsZ9c7Y66OIu++5SG7dnRMdyZd5d0an5j9EJlVsLDHY9MtsR2/OIxHI
         lUubUduT69svv9S98E/Ogu4N4edIEx1mkYOkrMsB+LgM36yQf/++uK2dZwqcnsTLA7
         JiVtuWX3TSTHg==
Date:   Wed, 31 Mar 2021 13:18:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V3 4/5] dt-bindings: regulator: Convert RPMh regulator
 bindings to YAML
Message-ID: <20210331121801.GD4758@sirena.org.uk>
References: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
 <1617192339-3760-5-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Content-Disposition: inline
In-Reply-To: <1617192339-3760-5-git-send-email-skakit@codeaurora.org>
X-Cookie: You can't take damsel here now.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 05:35:38PM +0530, satya priya wrote:
> Convert RPMh regulator bindings from .txt to .yaml format.
>=20
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Mark's comment moved this patch to the end of series.

You've not done this, this is patch 4/5 and there's a subsequent patch 5
which incrementally updates the binding.  This defeats the point, the
series is still blocked on review of the conversion patch.  Please put
the conversion as a separate patch at the end of the series as
requested.

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBkaHgACgkQJNaLcl1U
h9Dt9wf/WTLtkDjXd7O2rAa4w3l5TsJnBiATuViDXibQVZM/ANUqqLoyOM0LQxxN
549647AbXcoTLTDiUIaHRlRCsCQJwhufalc9T0MDtFf/2AbIqAfKvwI1rwfTxsWa
XHZaqmUJz2sr8lwyC5311EJ5lkCJxo82usNQND+Yva7kufEgfpuvMO8Nd6GCdvQH
pvDv0sMHRf8Nl5XXlRHApIZNC3iSjrJyaKYz1//hQ927DZa9xxehXo05wzK+bzBb
IT6hDskHLrwLYom/hhxmmSuS8IUyrQjZ6QSngqc/I8u/wxmXtlxJ2Zri4p2iTz2M
SwkHfyCjQgvKU+NhsgaQhVr2L82HOQ==
=5uu/
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--

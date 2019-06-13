Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C973344AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 20:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfFMSkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 14:40:25 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50618 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfFMSkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 14:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=t2/Vc/q/GlaihJsCwFZdn2XBcJoMXN52dRYqrNUXbTk=; b=j6aytOY5Yv8Yr3ftg88JL/wah
        I3f0CBRWklwgpuBqfviXwZS7ohvVt6dZ5LX37vBXYId9R7KutDFvLrU+EIJzHKXtoYHb6tl4Ex8wI
        jNqecSjMKtmjFiHWGv6Dj5lNGkVlNDWSoPt7eNhDi5b1cNZJz5CAfqECqBCLZug5t0su8=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hbUe6-0005On-0A; Thu, 13 Jun 2019 18:40:22 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 64A31440046; Thu, 13 Jun 2019 19:40:21 +0100 (BST)
Date:   Thu, 13 Jun 2019 19:40:21 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drivers: regulator: qcom_spmi: enable linear
 range info
Message-ID: <20190613184021.GT5316@sirena.org.uk>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
 <20190606184923.39537-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tRcR9GoWqjXrt11v"
Content-Disposition: inline
In-Reply-To: <20190606184923.39537-1-jeffrey.l.hugo@gmail.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--tRcR9GoWqjXrt11v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 11:49:23AM -0700, Jeffrey Hugo wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>=20
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--tRcR9GoWqjXrt11v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CmJQACgkQJNaLcl1U
h9Ahywf+PzmqBut8uqKJcwRB5GhEE/ja3bqrcVbbgZGMo9jgh3NlGBd1xhCjnT7B
C7rWgMGl8IkSs6871omjtoMd+oUUN71u263yIqbB8TlcB4iHMJClXET/2GMK0xZb
YINX6pN+iKs2M097dGHBFOLEsVnWF6P9Qk286okJE308HdaPHYopjMbpvaxoObR/
o0Q58ziZ2r9Cz2lIux8y1vfh4aliq+Vdkzv7kkLpLNo4UZ3vOK37ZISo2Ur/pRDE
t2NxWi3pwdJrCttqy11GJulo6F8Es1p+MQccN2ve2T7DekndPP9fuhX+1XYjgj9G
ekVpT2ORE+6wnxpps1nVEZS4hP5nvQ==
=totN
-----END PGP SIGNATURE-----

--tRcR9GoWqjXrt11v--

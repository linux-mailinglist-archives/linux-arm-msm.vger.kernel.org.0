Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509122006F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 12:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732512AbgFSKmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 06:42:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:56988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732670AbgFSKl4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 06:41:56 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7E73207FC;
        Fri, 19 Jun 2020 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592563315;
        bh=3YwGEO6C6OlOhnJ1+8PAKyD5+7GTC3afKx5ypttFhIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YsIZMBK1wcmTJxMxC4VejuhKgeTofC9rXDevluPriFFEWYzbv4gNb8Wpq3oIJHFci
         fcapG4pnt1Av5STNGfL2FWfP8N7fRTgCYrB69e8TLpvyNMNxliK0HJbCsX4VYALD0M
         NUkTR8C4wXQF23JwV1b00Cl0fznJnHCkJaRJznOI=
Date:   Fri, 19 Jun 2020 11:41:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH 4/6] dt-bindings: regulator: add YAML schema for QCOM
 SMD-RPM regulator
Message-ID: <20200619104152.GC5396@sirena.org.uk>
References: <1592550307-11040-1-git-send-email-kathirav@codeaurora.org>
 <1592550307-11040-5-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline
In-Reply-To: <1592550307-11040-5-git-send-email-kathirav@codeaurora.org>
X-Cookie: Robot, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2020 at 12:35:05PM +0530, Kathiravan T wrote:
> Add the YAML schema for the devicetree properties used in the QCOM
> SMD-RPM driver.

Please make YAML binding conversions the last thing you do in any series
that includes them, they often require quite a few revisions and there
is often quite a backlog in YAML binding reviews which means that
everything else gets delayed.

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7slm8ACgkQJNaLcl1U
h9Dd0gf6AvYZf/j5cZUt1nnFr5XfdUsrgQYIIoXX10tbrF+bkcbNe/ZByIBhtOAQ
NTvsaNTYONT3GGTX8reXfe6ey7qv4twCMDB3TwQHpV426YLGaCX670yaguZ1lmKP
eKWt1PI1PZtQip315X1uOIozdcMUIRO97humVzxUo5bSGwVgVyxjWz8OoHs5GI7K
EztGbaiCMsx1LwTqv7mMWEEj0xe6d7cXCBHNiJLYeKly1DG8qGRwcSyq5p9VAYMe
lm5aXKh3bJQj37BhsZezGwwnklAIy2uY0XKzI3i9rzjMZ3y38GDSI3nwVcSQ2cGI
3k9iEvKHvykY0NeU/FfxEMPFnnt7Zg==
=sR3l
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--

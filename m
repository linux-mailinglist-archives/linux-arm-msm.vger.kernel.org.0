Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC5C45DD5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 16:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240028AbhKYP3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 10:29:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:55574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355990AbhKYP1c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 10:27:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B52996101D;
        Thu, 25 Nov 2021 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637853861;
        bh=N1FOICKYx8df62U0dhSbL5O2MFUzMOtFlbsNrPsZvoU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lmsrwdpe+ttX0IEen+wS5tkOVZlggnt7+sGvMuSB2upDolQDFHo67mcV7ADniGSVm
         HsBM4V93aMLrO64U1h13bMFa1jnUk5kneZBV2O1aZ56i76VKGPc/PVS4Z56NyhfbAn
         VsBVa8+abzQOFveTu3qiiwGO8gD3aG4qCMNHRyW7+0D6vznAqes14fBEImRDt9VK+o
         URmXbRJUeMwJ57txKy92b9fafgYaStoundWlpSmwD5wOFAb1Zz4k5Se/3L3HO/HsmR
         ZounNt+sa0lQYcMeYd/NCDQhhn8ITGCs5OzqokgXFN1gS58dFe0N1CO3AaQ4LNTR58
         /RPxdQteCeEqA==
Date:   Thu, 25 Nov 2021 15:24:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, swboyd@chromium.org,
        collinsd@codeaurora.org, subbaram@codeaurora.org,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 2/6] dt-bindings: regulator: Add pm8008 regulator
 bindings
Message-ID: <YZ+qn2hA4MzNEqM+@sirena.org.uk>
References: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
 <1637314953-4215-3-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CswzH+vgELyYIlv6"
Content-Disposition: inline
In-Reply-To: <1637314953-4215-3-git-send-email-quic_c_skakit@quicinc.com>
X-Cookie: This bag is recyclable.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--CswzH+vgELyYIlv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 19, 2021 at 03:12:29PM +0530, Satya Priya wrote:

> +properties:
> +  compatible:
> +    const: qcom,pm8008-regulators

Why are we adding a separate compatible for this when we already know
that this is a pm8008 based on the parent?

> +  vdd_l1_l2-supply:
> +    description: Input supply phandle of ldo1 and ldo2 regulators.

These supply nodes should be chip level, they're going into the chip and
in general the expectation is that you should be able to describe the
supplies going into a device without worrying about how or if any
particular OS splits things up.

--CswzH+vgELyYIlv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfqp4ACgkQJNaLcl1U
h9Dr+Af9FLcGk6WdCH+gR9n1V50xl6lQHFr24c6T9C95z/NK0w7JfDffo6TSTDGL
GmiESrCqPxdpXeWjB9irMYdZQ654ZWXriQ0cf94mQt3cuOs92HMcMP+6MMdHJL00
woFVqYyMWzAhXoDB7R+iI2pbI4DwgBU7ZHNQLRZ5MnXMJ5Yb/kqG2ZKTxNbzpylb
XgP6SddLv9y+cesJODllwyiLbIf0Mbt54eD+e57pmkMy1HDxOKMJdtWPpF9m2U7i
hLE8dm2G9nUzmKJVhSjix3rkA8h++OZBzzoUly3dbry+yTV7Ej+Asr629driMH6W
AW+qU/Y9zDYqjHSEe5JYPGRhooOldQ==
=gTjl
-----END PGP SIGNATURE-----

--CswzH+vgELyYIlv6--

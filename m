Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE89C1A78E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 12:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438728AbgDNK4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 06:56:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:34376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438723AbgDNK4R (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 06:56:17 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AA5F206D5;
        Tue, 14 Apr 2020 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586861776;
        bh=OrDXTih3RBsU8OWNI07hoBDWpLOY9wKKaAm9RMEBMLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DCQ8zOM8onMVoMA8YgwBGyLC1/QVhufjI6QTVJehdIFRa7fZE4jxzxfAfyYEVNrDI
         0Tt9M6ND2DZidl1hKAIHyJGiLWANYgB/T/Sc9P47Km+bzJJnt0QRY/v9QL5tZY0d34
         FrzZxNlYGLoXLHeVz2Zr8dKsOF0dbdIqo4qgWhC4=
Date:   Tue, 14 Apr 2020 11:56:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] regulator: max77826: Add max77826 regulator driver
Message-ID: <20200414105613.GA5412@sirena.org.uk>
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
 <20200413164440.1138178-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20200413164440.1138178-2-iskren.chernev@gmail.com>
X-Cookie: I've only got 12 cards.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 13, 2020 at 07:44:38PM +0300, Iskren Chernev wrote:

> +static const struct of_device_id max77826_of_match[] = {
> +	{ .compatible = "maxim,max77826-regulator" },

This should just be maxim,max77826 - there's no need to disambiguate or
describe the device in the compatible string.

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6Vls0ACgkQJNaLcl1U
h9DjzAf/bkHB+lOn620nAMtWbpwdBWX+2Uv646XBlc6Izk+UvqWnyvBAD4FpP3BH
+1S4uEVp6jlP9TYMuYlmwr7WfAYBYtbIqPXdAw7l0M8M19Ni/p4IXnTnIMKfrzVK
AYujzozp5R7AXDQQQhup0EjkRptTxAk9fH4tLraifsGua0JPuDddsGpZO1SQ8iuQ
/D2XG1FzxZI/Q9NP/OYnc59AR2xXcIGG28sH6b8ijk448NrET2JYEcKfJJzzQBPt
vBh+865uKZY3j/91aitNg6Dlpf3OyK1ea0M9fIeRf1UcQwqAtdvwsRRnZ9q/7IHS
RfHRs+rUGwd7sGVmMZsar80m/Sq2Rw==
=gAMH
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

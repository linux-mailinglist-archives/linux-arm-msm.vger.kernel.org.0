Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C554545DDE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 16:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347285AbhKYPuu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 10:50:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:59786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356190AbhKYPsu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 10:48:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B817E610C8;
        Thu, 25 Nov 2021 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637855139;
        bh=5RgsiEBJ9/rtL8DrXdq8915UIX/Wyea9VvxiwKazdjo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M5ztynTNl5G/wrvPCKG4Z3lhOi+3zdatMWCZ6EPcvavtXMitANZarcAS2aWA2OrNN
         WUqarfNji/zHWMcn2YspNFw2WtZ6fNWzBJBQ3Lzu9JZLBsSieZytxMT+ncPQVpyvpc
         ykfOc1AVJ+gG5kjPZhIqQjsLvpWLmNR9jkRvCVEhQSM038MOg/oftaZxjTD9HQdn/l
         BNS8gRQP5y5hJhKF9FNpD91NpIJxRBlzclRISvhY+z3heww4A+5+W6wT1vCPcS/b8l
         VCuwmSGuKRWSMhI+vcuFfpz/EWGC5etQtbKDxPG2x1/S6iP1R7zITLyeDk2Z8Jfv6U
         7+1M0jshR2qjA==
Date:   Thu, 25 Nov 2021 15:45:33 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, swboyd@chromium.org,
        collinsd@codeaurora.org, subbaram@codeaurora.org,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 4/6] regulator: Add a regulator driver for the PM8008
 PMIC
Message-ID: <YZ+vnV12gDCtia5S@sirena.org.uk>
References: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
 <1637314953-4215-5-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yT0yWrM1Hvr0VdiY"
Content-Disposition: inline
In-Reply-To: <1637314953-4215-5-git-send-email-quic_c_skakit@quicinc.com>
X-Cookie: This bag is recyclable.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--yT0yWrM1Hvr0VdiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 19, 2021 at 03:12:31PM +0530, Satya Priya wrote:

> +	for (reg = &reg_data[0]; reg->name; reg++) {

Why is this not just iterating from 0 to ARRAY_SIZE() - that's the more
normal way to write things and doesn't require a terminator on the
array.

> +		child_node = of_get_child_by_name(parent_node, reg->name);
> +		if (!child_node) {
> +			dev_err(dev, "child node %s not found\n", reg->name);
> +			return -ENODEV;
> +		}

This could be pulled out of the array.  I think you're also missing an
of_node_put() on the child_node.

> +		rc = of_property_read_u32(child_node, "reg", &base);
> +		if (rc < 0) {
> +			dev_err(dev, "%s: failed to get regulator base rc=%d\n",
> +						reg->name, rc);
> +			return rc;
> +		}

It's not clear to me why this in particular is being read out of the DT
binding, I'd expect this to be in the array describing the regulator the
same as everything else?

--yT0yWrM1Hvr0VdiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfr5wACgkQJNaLcl1U
h9Cdpgf/eag5hpAiJ69Ar39sC/0LmSBkI1e5b+DAb2nX7n+0bXjhlVDVG1ybGObj
nwKjVJQW3ZgrLLhYVMowMdc2m6711Jlxw4Q9DS8WNEOVkao1TXHyzynse0sK2sc0
A63l4g1X+Xn7Vyd1LdquYgz7G6JhG2gg+/m3vJgpsWQ8N3dCXA2+iSmjL3x7ArFl
G6r9uEG3xzH9ffxlJO1gYZtb/8kNdKkAXRVARWnQdEAJIWiSrdWT57l5y3Il1nlm
dX7cAxav81/iIKDIOZYbh7RHzoUzzjnj7LPxZRVxaymUrQFnOuEiPVguh3APHCBQ
Ogvq8db6lsIA1tJ3ZDpqJSOqkf6nNA==
=BMhi
-----END PGP SIGNATURE-----

--yT0yWrM1Hvr0VdiY--

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10F136B2C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 14:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhDZMN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 08:13:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231550AbhDZMN3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 08:13:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE5BB610A5;
        Mon, 26 Apr 2021 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619439168;
        bh=3mfWvtf3MvTXveZMvJipN7XiE9UeGtzIh/4sgDdjK6M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bWLFA3+f3cAJ5seUc6WwRMtqX7LuygsorGJykfU3mbBTvNMUvcmqLl1IHMA7W4SB6
         0RiEq99DQV9O0iZWhwLNWIbBa2CVFiwUdNzd+KBIZRGidd8g9fMvKwuPfdYRrpUteH
         /OXod35rGsNU2jETTXroSiixo87a+yilovmouPcdHv7avCiAII3gqTVlvOewGBa/kp
         RbOY0m4RCleHYh5fBjthVZ8XW5t2jKq+MOS8eTipHxu/4tt91RslJm6zhrm/xCU8Um
         cam9IyEQVJTIKb4SBGeVos2ptoBK3yJztGhhbNv6vSAHBJOC8ti9P6jvluwXkES6aq
         o2XMXN+R5nOPQ==
Date:   Mon, 26 Apr 2021 13:12:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH] regulator: Fix current limit for QCOM PMIC VBUS
Message-ID: <20210426121218.GC4590@sirena.org.uk>
References: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
 <20210423163203.GF5507@sirena.org.uk>
 <a2152494-4e8f-27ef-07e7-e575ce3ee653@linaro.org>
 <20210426115548.GA4590@sirena.org.uk>
 <c7f797da-f5b9-5c95-4664-efadf4e7b86b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline
In-Reply-To: <c7f797da-f5b9-5c95-4664-efadf4e7b86b@linaro.org>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 26, 2021 at 01:03:49PM +0100, Bryan O'Donoghue wrote:

> I get your point, however, the downstream kernel i.e. the kernel that ships
> with the n-million qcom devices sets the limit to 3 amps.

We've not traditionally used downstream kernels as a quality guide, nor
can we assume that every system running upstream kernels is running
unmodified downstream kernels.

To repeat my original feedback: this needs to be something that is
configured per system, please make it configured per system.  Simply
repeating yourself over and over again is not going to accomplish
anything constructive.

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCGriEACgkQJNaLcl1U
h9BodAf/bIz54VmBA036w7ZOOKgy3cqHQx/emgJXhInNerbm+z0kIDkDEFwjLPhx
hzbIB/iLXAkWO98DKOnOvMWxXSx0GzTARt+93xR3AtI39iHfpOWnxtPn5N2ENipw
fj7DA36D7awPLP9TTdDSOoi4P4rqmwYa91iGsCicEZDnisPzBXg1I305bQ4y83/V
KYYKcV/H+ngp7H4mUF3w/BiTQDikf67O7MQFIbt/Gk3waNh3n5jUZHSfSxXiDZ0G
5RkZoK0SEhBwVjQmfVsUS1OjU4PXf20O2v8V95P53EPEUBf12VsOZfdNSqZvurQy
jzvjAplK8A0jrFHvVd5Lc3cvjm0nYA==
=cpTO
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--

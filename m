Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BB11E7AFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 12:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgE2KyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 06:54:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:32910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgE2KyP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 06:54:15 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E884207F5;
        Fri, 29 May 2020 10:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590749655;
        bh=iItic/SJFuDHh9NK1YYlCZaWzpJMgEyjk4VirrtCP2A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FNSw5BXXedvJT9Ua90q6xqOYTCbeqPvGFfbiYPL9CTKGdgVAP3Sj+40vOJfOkz1py
         2rgHIVW9NVEq086q1iMAAVHt+My02HGlXOk5kDMRsVBF8XTnMb4ao4vP7xAAhZDAio
         IWrksg6Abg+2bWQIjYM8URGmgjigRqwj3BK6/dzE=
Date:   Fri, 29 May 2020 11:54:11 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH v3 1/5] regulator: Allow regulators to verify enabled
 during enable()
Message-ID: <20200529105411.GF4610@sirena.org.uk>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
 <20200528154625.17742-2-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Content-Disposition: inline
In-Reply-To: <20200528154625.17742-2-sumit.semwal@linaro.org>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 09:16:21PM +0530, Sumit Semwal wrote:

> +		while (time_remaining > 0) {
> +			/* We've already waited for enable_time above;
> +			 * so we can start with immediate check of the
> +			 * status of the regulator.
> +			 */
> +			if (rdev->desc->ops->is_enabled(rdev))
> +				break;

I'd expect to prefer to get_status() if it's available.

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Q6dIACgkQJNaLcl1U
h9DsdQf/XvF7XSA3+wsHApX3Vw3vgnDX0EIbdCj+mAhN4yXaRDNBh9h+nYatUqVI
4IuubtGTRY0RtBsggRNfd51POUPwItWmPkQNGi50gaYlXCUFTS9DFAxPw+L3HwQS
8DXWUoESsD+kkk6gnbz7cYxbvojECkeyDERrAYXaXbbYCU037zNhr42FrYI+owAm
T+3BDj0hsuaDBYbcbzDGntieQ/eedOPfz2XAbm6bGZH95NcT13VYEBXhTxGgtdyP
6x4Tv7B5/G82rWeWn4+SI6SfWva3ZP81c4JPZnZ6alG+8csxR1qz2nnGCg+x53H3
JMHXL8TmkGhD5LB7bLIp8whI9v5Yiw==
=33t3
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--

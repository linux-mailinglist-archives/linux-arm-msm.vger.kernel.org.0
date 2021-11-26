Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C2645EFE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 15:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377663AbhKZOdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 09:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351127AbhKZObm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 09:31:42 -0500
X-Greylist: delayed 419 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 Nov 2021 05:46:30 PST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2339CC0613FA;
        Fri, 26 Nov 2021 05:46:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B1F4A62288;
        Fri, 26 Nov 2021 13:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BD4C93056;
        Fri, 26 Nov 2021 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637933969;
        bh=NC4SpiZ2SHdTDSCTPOpq9t5x7oRVWD4HdHwzbrrZNBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LnzuaG0aGkSbR11VcYAhw+LABMdgP93Eb79e+hjZKIh/WOMreVmEeXBxIpXzyXXms
         BGTLlweG4pPZYKxUtGXROXQClLNB3esFBYx+eQUBYRgyA+GVObOOdBCjD7dSj5mcJE
         oniJJGSEqxtsYfCiu0YgPTAJynNzUVpcc9YGmdWQlSkk8msyd9OQBHV3w33o4UKcCV
         jzbckwgg1rO5e+AqN+wuVvV+czHcDglgU85iBbjs2zjRz/DimZWx3G+/ktXeSrGYZt
         OOPazXpd42BZegLzm3RZaaaFs4EGjXET5mb2im3HE7FwmRUy3g0d+h+saTXQhBRYtT
         808fo/59GQffQ==
Date:   Fri, 26 Nov 2021 13:39:22 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH v6 10/10] ASoC: qcom: SC7280: Update config for building
 codec dma drivers
Message-ID: <YaDjiip57q5hDe+l@sirena.org.uk>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-11-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8VdVWGcSreCkYakr"
Content-Disposition: inline
In-Reply-To: <1637928282-2819-11-git-send-email-srivasam@codeaurora.org>
X-Cookie: You fill a much-needed gap.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--8VdVWGcSreCkYakr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 26, 2021 at 05:34:42PM +0530, Srinivasa Rao Mandadapu wrote:

> This patch set depends on:
>     -- https://patchwork.kernel.org/project/alsa-devel/list/?series=582321

To repeat yet again:

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--8VdVWGcSreCkYakr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGg44kACgkQJNaLcl1U
h9B2PAf9HFtpuSJkMDBV0v+tqGL4HutQce5WtAopOh7XBAr+9F4S0Zc/wjf7/rEo
XsZ5s26AzXEBFCam543O95L/8xOKJoRBTCpzNI9shL0I9Us7v3OrnpKmtlmFfguz
pdHWM/ynf7GukdQkiKCjFdvb7ecDnIhcUotEmrod4v0JlHbTa8oTNHAm3xW1sOVV
aJN9QVOLSErb033mTnfCRakno8KqclFjBFrYE9Kr5mQTGHwduq36zTDrVM268eyX
LH+vhF0mKVUkfuTZKQbY/8NpnLbmBSnQ6Uf4LjBs1itPiv9cWJGuE/lPqB8GNecj
VIfGGvzQFpOlGDGmYRb4RAyPvuOJAg==
=eXdC
-----END PGP SIGNATURE-----

--8VdVWGcSreCkYakr--

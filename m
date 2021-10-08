Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2B2426BB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 15:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242602AbhJHNci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 09:32:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:45164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230312AbhJHNcb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 09:32:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B04160F9C;
        Fri,  8 Oct 2021 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633699836;
        bh=/7mJmle3e4Gpv9xlULJnPukFgV/2LlmCJJhy0Z+i9Yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ni+Vpf7+MECOn73d/aiO4SbdMircJS+g+46EFB4pH+hrYtzkX5QlXVwMd0SySNGrF
         lM+zO2Vr+7BPGPM5oNiYXqpHE8bltiVuNkIK7UTZJxuVhbB4kttefVizOBC1CmOTL4
         BNvajbHcm600QUSO/bWOdPvTNKZHWinnWDEPdiOe6hCV+h8hUhiZXtjEvFSfg7YYwE
         t6mN8R5cFu/0z/fv3SBCyCKPp2maQtedtHjsTiRlU35JRIF5HdHHOfH7vZdac2SQzv
         qimvAI33a3m9Op4vSpDPv9XFPQGVqGkxRB8+CRUgDqRFVOZxx3s8AlztsOByRxYC86
         01KAYsglPpkKA==
Date:   Fri, 8 Oct 2021 14:30:30 +0100
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
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
Message-ID: <YWBH9gAKIHJMlFlY@sirena.org.uk>
References: <1633443285-18685-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BPJD35IZkxr8pTnU"
Content-Disposition: inline
In-Reply-To: <1633443285-18685-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Check your local listings.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--BPJD35IZkxr8pTnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 07:44:45PM +0530, Srinivasa Rao Mandadapu wrote:

> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg))
> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);

This is a new DT property so needs an update to the bindings.

--BPJD35IZkxr8pTnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFgR/YACgkQJNaLcl1U
h9AUvAf9FbBPGw1yV6XG/d/bVCgoobVsSJFVbNKFWgBaYVu18TFmfPra+yBC5eR2
2DmM38hLH90ljY/9aV76p7aBFn87KZlU/jTc8j7+LQ99UvSGNj0ztJH84d6lQMQG
0+IoK5/OX46PcYSYrhFdWAIf1ZxSM8SJSXVpLr/MGiw3GiQr8V90HIIHokeV7Fow
WyPItSKcOYUXnG9g4QsskC69yrEcfxWdrSVNnFuc2TEBqayMdW+AolYuL9T+qDy9
eI970IdonyKGcBWVc4Ag16V0v3vYyArTDPyQclw4sEb7s5QwrUpAzeQU8BcwvS3X
9sGE7ZMVi3H3B6SYPF/aDE0PUHHMWw==
=CyWD
-----END PGP SIGNATURE-----

--BPJD35IZkxr8pTnU--

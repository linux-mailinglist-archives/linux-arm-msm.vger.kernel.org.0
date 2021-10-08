Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6378426D80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 17:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242884AbhJHPce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 11:32:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:43546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231129AbhJHPcd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 11:32:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99BB860FD7;
        Fri,  8 Oct 2021 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633707038;
        bh=8+7ImSJ4m3PvpXuUfyLFMGEhzENQrTkj1pOv+1Kg52I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dyxiipKlHhyZPn5jRpNP9wWXumvxzgjOzQMfGY3mYHIMn7r8cca3a8Ra/wYUMXJuR
         4jzbjtWhVz9I+evoy6pDRsjLBpHbq3n/CuCI0AjMCuId56uJZnuNqBGqzgPqRKKiuJ
         Azl7WFQgrvdT4yoNnZ4JDbQujjUbnW+T9CmUtoNtVTY8QDv4BE7cww4xNgT1wvdv52
         8ng+XHoxOXPSq548p697OdRdEEKOBB4xSnAqob/AuWJzJ3JtV9I6GuN+LOYDUx22co
         eXAiuvrfFtj4Z8Hi82eIZssIyiNs7hLKDyapT644nOB4s6jGCcBZHnwyPwFlxyj/C0
         LXRrBsBtbWs6A==
Date:   Fri, 8 Oct 2021 16:30:35 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
Message-ID: <YWBkGzwiOeiIdr9F@sirena.org.uk>
References: <agross@kernel.org;bjorn.andersson@linaro.org;lgirdwood@gmail.com;broonie@kernel.org;robh+dt@kernel.org;plai@codeaurora.org;bgoswami@codeaurora.org;perex@perex.cz;tiwai@suse.com;srinivas.kandagatla@linaro.org;rohitkr@codeaurora.org;linux-arm-msm@vger.kernel.org;alsa-devel@alsa-project.org;devicetree@vger.kernel.org;linux-kernel@vger.kernel.org;swboyd@chromium.org;judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
 <e65c77f4-766c-a5ce-9cbd-f1697c1be28c@linaro.org>
 <20ddc4ea-e99c-5492-1931-be1999655563@codeaurora.org>
 <da23bfce-23cd-0869-d752-b0713136072a@linaro.org>
 <5748236d-7db2-9d19-a113-6e66b3dee81f@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eXI7rXJOJnv0Yxnj"
Content-Disposition: inline
In-Reply-To: <5748236d-7db2-9d19-a113-6e66b3dee81f@codeaurora.org>
X-Cookie: When your memory goes, forget it!
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--eXI7rXJOJnv0Yxnj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 08, 2021 at 07:37:12PM +0530, Srinivasa Rao Mandadapu wrote:
> On 9/28/2021 2:01 PM, Srinivas Kandagatla wrote:

> > In that case you should probably consider using regmap_register_patch()
> > for corrections to the default registers in sm8250 case.

> As regmap_register_patch() not working in this use case, updating defaults
> in probe for sc7280 specific differences.

In what way is regmap_register_patch() not working?

--eXI7rXJOJnv0Yxnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFgZBoACgkQJNaLcl1U
h9C7eAf/XNE/8gWTD1il/H3m6CvBtA6i9ZKiAEK7auQN6RRstOai7B6solohK+n7
+cAuDDJXZhZicTfYD7kb4fxPLPB/qV4c/sdNw1JEBGdbqDDamSwh9ZCfIvzMF24U
pyvxSMqKqhC+sopzP4Nkd2eJ7Wfs5nmoQQmg4USw18bqPXCyYG/0EnFgsUEUGpC1
+9U5zWuOUaN44RZhRsLK5Zc3jkit7XlSON1K4cnFPxadBXaF+uWF3Xo9JayG4Xfy
AQQdTel0p0ed3zbsYkoU7knG6EZXMAC8Td5Dfds//hd7hbf+cD6geeVbmO4LLHUT
MuanBlwPHQ2n6rbj+o4nWyL4jo5+KA==
=do89
-----END PGP SIGNATURE-----

--eXI7rXJOJnv0Yxnj--

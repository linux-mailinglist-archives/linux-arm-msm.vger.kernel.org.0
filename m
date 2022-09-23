Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41C45E7B98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 15:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbiIWNO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 09:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbiIWNO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 09:14:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA89AB060;
        Fri, 23 Sep 2022 06:14:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 832A1B83466;
        Fri, 23 Sep 2022 13:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AACC433D6;
        Fri, 23 Sep 2022 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663938864;
        bh=JFdIBNAZD4RHRhDOZo1MsEw5mh8HKk/wCX1HXVg0M7o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7ZQKIn54EzgbXv6pLdt9e+mX9QboN+1vzVBIT0di9eHDhtfbfB8Ci8X/1D18uXA2
         i/oA+/cNOxZIKuZQEVKYTel+nxzrZw4HAxZJhv1gh8jKb/8K37eKE6I5QDtHU3EhzA
         051jnEO77O7L7ZTEroCQjKK+EzUbmw9M4INOOX1hxhB1QW7hqG/++d2HQyguK3fFP9
         iuD0qxYKSIwkmuQZc9FLoBPoyNuPerc4VNq+0w4Tf2SWQzj/L9apxYyo+S0oOCnK7H
         eAZOiLnm/QREMAAs2mfDW+6wTTeQTI6JAiXDN3IglE9+2DPhoVi/ASpk8vs/TyEZtA
         Dt8JjY5ejcLXg==
Date:   Fri, 23 Sep 2022 14:14:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: qcom,rpmh: add pm660 and
 pm660l pmics
Message-ID: <Yy2xKsyEDCkfxnI1@sirena.org.uk>
References: <20220920223331.150635-1-mailingradian@gmail.com>
 <20220920223331.150635-2-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+0DGd3iPoJrAwrKc"
Content-Disposition: inline
In-Reply-To: <20220920223331.150635-2-mailingradian@gmail.com>
X-Cookie: Heisenberg may have been here.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--+0DGd3iPoJrAwrKc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 20, 2022 at 06:33:30PM -0400, Richard Acayan wrote:
> The SDM670 uses RPMh for managing the PM660 and PM660L. Document RPMh
> support for the PMIC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--+0DGd3iPoJrAwrKc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMtsSoACgkQJNaLcl1U
h9BN2wf8Cboe8Tm6dISPpdxG7LpUkKXuEPtOxHwUnz2cEmkFuaU97SYt+RqZTMGI
Kkm7MOeyNVAh9Kt0lJo/yWFIhxxR8eJ3bc5l6i55CrJ2CDb7MOQFLEAtkAg/dDqO
fWFouYQRtCU7tHGgxHekfFhvj0y4bj9ccgfGBTX0dPNmp1/+HxpHORgInY5dVh9J
IgLg7ZtFHRYxAA+YlQTSURZ13rhObRTq4qbGZAGENdTU+qlSZxndbvi7OlLqgoIo
3dw52j1NpNUZKjb24MMaeq3Hep1lhjAj5AP4plTPf5IHiRE+h+4EfDTjy28Hm2N+
q3Hr3jypPQx6vWRsUPmeq+jtty/sxA==
=1Fr2
-----END PGP SIGNATURE-----

--+0DGd3iPoJrAwrKc--

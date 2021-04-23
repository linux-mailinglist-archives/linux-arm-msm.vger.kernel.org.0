Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A65C3696FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhDWQdK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 12:33:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhDWQdJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 12:33:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22791611BF;
        Fri, 23 Apr 2021 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619195553;
        bh=JLReUbDXIj+9jT5M93OOSVqRmda7uDufts3sqxqivvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LvhbBQllXVBmmjd5WuFog6GhnOiPlL71eGKpcJotruFS4IRt5KmHeJehCzLX1ckbw
         iar6k/GiRl2DBTVY5ZQaIoum7tndT+b0/efQRog3WNBlDOKJ87GDqbXz4ly4vQTsJi
         pOD1emZm2UAGmkZY12WRjJrpKlMMNniC7uhw+KYOJwEgGNYckWb2IyO+/8wkSbHVQ0
         K4sd0TYKVjNNdnVexNVNlT3cd/2znSVzqdioS6oh6s1+7pFI6ELp/TyM8N9wfd1IMf
         mxdrEgGTJmoHXhCCKo7ZzCNKaoVzctAoZGOkIlzbi2EhBf95jAblNV9VweUomv1DFD
         WEsHwdbAxMfXQ==
Date:   Fri, 23 Apr 2021 17:32:03 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH] regulator: Fix current limit for QCOM PMIC VBUS
Message-ID: <20210423163203.GF5507@sirena.org.uk>
References: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Content-Disposition: inline
In-Reply-To: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
X-Cookie: This is now.  Later is later.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 23, 2021 at 05:06:58PM +0100, Bryan O'Donoghue wrote:

> +	/* Set OTG current limit to 3000mA up from bootloader set 2000mA */
> +	regmap_update_bits(regmap, base + OTG_CURRENT_LIMIT_CFG,
> +			   OTG_CURRENT_LIMIT_MASK, OTG_CURRENT_LIMIT_3000MA);

This seems like something that needs to be configured per system, the
system may not be physically capable of delivering an additional amp
(150% of the current defaults) safely.  It's going to be better to be
out of spec for high current USB devices than to exceed safe physical
limits, there's a good solid reason why the regulator API never touches
the hardware without explicit constraints allowing it to do so.

I also thought there was support in the USB specs for negotiating how
much power is drawn (not that everything will DTRT there but still)?

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCC9oIACgkQJNaLcl1U
h9BYLAf+ImhrF5tT7tD8RumX+O+pI1+35R4TEcnAsjFRDZ+PUFOCmT1iosEE53q4
IOXS4g27Fa7mMbW11aS5ODzNms9YO5gVE6w6fpjImXIgOE8WEaEEblKtM6R2aAtq
eSXzvss1gbCSh4I4AS/FF7nBaXzV3Z04WgGkfSkcMxgOftQu/am4IX3782r5wz/l
sHKAsIRDQoa3wx9PGQNkM1B+QAjNO7m5n1IxeqwDZEiyHE8XhtE8YArR12IMjaLH
rZSA2RQtggT7FLN6tCIv7aFb3sRwfcPSuWqjYTC+GAGA8n0j+nhgdEkhxmxthAJS
NoJ4wxFgO8vKBM53Sxktoq07UEW4eQ==
=2uiC
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--

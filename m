Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8BE40FD2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 17:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241335AbhIQPub (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 11:50:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:48318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343700AbhIQPu3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 11:50:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64E9A611C8;
        Fri, 17 Sep 2021 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631893740;
        bh=p5JtEDkWnDUrax7jGsnw3exoS8yGGa7NH5B44DIs66c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GRs0LZ+5z99Fxh+JdCpW2L33droziUIl7wfHVQwtoJDoBTZMBUlZl5N2GInL2AZ3b
         v/sqmUSGzQPOUXxUtLfrunUWe0yXVRl6GejAKVuYQM9D20v3W3RfTMcDucbMrR2knI
         pmnfU/9zUqvKR5EcheLj1Y0167LDllwlRf7d4EM2V7GQW80/9TAAdvKJcWWXEqvDna
         VT0Alp6gbAagKaZRUQYzN166QQJ4oG6InwSQQWRZVqJlioEqdI2r5xBIh8VGRvmUWy
         7AEjQDX9RSkpAQM+oLRq2eS9liCCXhaQ+LKozcXKAQmo4nFDuY2CszhVcM8BuKH5E1
         Rj1FFjvet2Cjg==
Date:   Fri, 17 Sep 2021 16:48:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Satya Priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, mka@chromium.org,
        swboyd@chromium.org, Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] regulator: dt-bindings: Add pm8008 regulator bindings
Message-ID: <20210917154818.GC4700@sirena.org.uk>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
 <1631875538-22473-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Content-Disposition: inline
In-Reply-To: <1631875538-22473-3-git-send-email-skakit@codeaurora.org>
X-Cookie: A man's house is his hassle.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 17, 2021 at 04:15:36PM +0530, Satya Priya wrote:

> +    properties:
> +      reg:
> +        maxItems: 1
> +      regulator-name: true
> +      regulator-min-microvolt: true
> +      regulator-max-microvolt: true

You shouldn't be forcing these properties, it should be perfectly OK for
boards to have fixed voltages especially for example during bringup or
for debugging.

> +      qcom,min-dropout-voltage:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Specifies the minimum voltage in microvolts that the parent
> +          supply regulator must output, above the output of this
> +          regulator.

If this is needed in DT it should be a generic property since most
regulators have some requirement here however usually it's a fixed
property of the silicon and should therefore just gets set in the
regulator_desc as min_dropout_uV - I'd strongly recommend having a
default there even if there's some requirement for it to be set per
board.

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFEuMEACgkQJNaLcl1U
h9CcPQf/d5wKbltucOrKHNi3Z3T+lOCB3hFwu7r0S/sGHSSKDLZHCrv88RiDDP4i
ADJfMJDU6jMH99u1uYV5/FJ3dfyx81goy6564MPh/yzOcSMuH/NiW0j4HED1w8Pp
PJYb9ObxZ+VSfV9d/ClQCr73w6lBXxHH9YhngVzcfAMo92vITFDyUEAHyvCsmmmR
PC6wh+N+mhFUbg7ckbmlKxYkMFnQW49bAbyvMrHm/ZH2lga185+gArn0x5zsG0d2
WO42bLBhiM6zHZUd5Y4BjcL3hS22yWGBJfiCH4nAGjtL8yeJ4evRT+xIHG2Auh8C
BRU/VrzRcg8Xe+XF1icLkvJ7/jJe3Q==
=l9su
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--

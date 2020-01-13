Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCDA1393DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 15:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbgAMOlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 09:41:04 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37740 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728643AbgAMOlE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 09:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cmw7dFl1Y7sQ8UiRxp2eW384vYAmiwDtFE09krfcKmk=; b=QmXXoIoXXOYZRdaMuzCjDqOVB
        vdU4T/efZPGe8aN+PFuYBZGSQL21ap1tA/7zfIPRDtxe2cRe6WczzbJJd1xeSI2A2M3V2tg614f/e
        9wM4DGc4nDaSPcYbqH1+MGKv9kdb8EaPS48iKjbnvq5f67DFmAC/07lBiKWeXFLP5hzlA=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55] helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1ir0tp-0002tS-PJ; Mon, 13 Jan 2020 14:41:01 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 70D6DD01965; Mon, 13 Jan 2020 14:41:01 +0000 (GMT)
Date:   Mon, 13 Jan 2020 14:41:01 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: vqmmc-ipq4019-regulator: add binding
 document
Message-ID: <20200113144101.GM3897@sirena.org.uk>
References: <20200112113003.11110-1-robert.marko@sartura.hr>
 <20200112113003.11110-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YIleam+9adpUeYf+"
Content-Disposition: inline
In-Reply-To: <20200112113003.11110-2-robert.marko@sartura.hr>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--YIleam+9adpUeYf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 12, 2020 at 12:30:02PM +0100, Robert Marko wrote:

> +  regulator-min-microvolt:
> +    description: smallest voltage consumers may set
> +
> +  regulator-max-microvolt:
> +    description: largest voltage consumers may set

Why are these explicitly specified in this binding?

> +  regulator-always-on:
> +    description: boolean, regulator should never be disabled
> +    type: boolean

If it's not physically possible to disable the regulator then
specifying this property is redundant so...

> +required:
> +  - compatible
> +  - reg
> +  - regulator-name
> +  - regulator-min-microvolt
> +  - regulator-max-microvolt
> +  - regulator-always-on

...requiring it doesn't seem useful.  All the other
regulator-specific properties shouldn't be required either,
unless the user specifies a voltage range we won't allow changes
at all which should be safe and the name is purely cosmetic.

--YIleam+9adpUeYf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4cgXwACgkQJNaLcl1U
h9AGOAf/XoQqm2m+apQzBOVYMiwDsu0nOFhxV8XaJBiWBGzU0AawlSf5QbCGmAW6
ttTl87Wm4eih/gQDT1WwKmNtgEggitznUEP37aeokmebJnpQVoypuCjHmBhvhAr/
QqqZg4U2cNTWUZSiq5GMJZVr0kobt8vKd8APtYPufQWs1sE2txUkSyCemxt8cMSu
4dXf+oxe1V5BwwY8dLAjuEQ1Yfi7WerN67LdwhaOrBDNZrMFydu68oyHU1GAX1qf
Cid0TccaEHF6bZv0uc/XF6RgzHstqmYo/QG5KVwTw+lcHk3BTBZ5imWoOVrpS7lx
DBvbEUuLAZ3I1H1vZyTVsA3snTtHBA==
=5bSM
-----END PGP SIGNATURE-----

--YIleam+9adpUeYf+--

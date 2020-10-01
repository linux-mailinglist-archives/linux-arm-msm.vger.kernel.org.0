Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEAF3280475
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 19:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732609AbgJARCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 13:02:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732360AbgJARCR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 13:02:17 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D57A208B6;
        Thu,  1 Oct 2020 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601571736;
        bh=sgTI1pReU0OH6N+t9LIFaXFWSw9Gg4El0/cro75I080=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tleQxA9Usy8EMlbjjfcLgW1O5nEP666Fx0SDN5uWndimLCercOPoQ0lMjbsyLow4P
         Smg2YxuBRvFvcFyqm3VJN8B0dMIJjMaDKcnRI4QAb32mRLC7QXwzYByg6oNGBe4GAZ
         kwZhSdohSm1E5gCYck+018Oj/4mgdXiqlF/PMSAc=
Date:   Thu, 1 Oct 2020 18:01:17 +0100
From:   Mark Brown <broonie@kernel.org>
To:     kholk11@gmail.com
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Support for PM660/PM660L SPMI and SMD regulators
Message-ID: <20201001170117.GR6715@sirena.org.uk>
References: <20200926125549.13191-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tuFXEhzhBeitrIAu"
Content-Disposition: inline
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--tuFXEhzhBeitrIAu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 26, 2020 at 02:55:42PM +0200, kholk11@gmail.com wrote:

> AngeloGioacchino Del Regno (7):
>   regulator: core: Enlarge max OF property name length to 64 chars
>   regulator: qcom_spmi: Add support for new regulator types
>   regulator: qcom_spmi: Add PM660/PM660L regulators
>   regulator: dt-bindings: Document the PM660/660L SPMI PMIC entries
>   regulator: qcom_smd: Add PM660/PM660L regulator support
>   mfd: qcom-spmi-pmic: Add support for PM660/PM660L
>   regulator: dt-bindings: Document the PM660/PM660L PMICs entries

This said patch 0/5 but there are 7 patches here...

--tuFXEhzhBeitrIAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92C1wACgkQJNaLcl1U
h9Apowf+M8mQLNlk5C94v/lobmqDbp7yeHjIkO29sX/+IA/8l3WhZdODZBZympxf
4MX9afgFpZBbdIhbd+010VVDItDmhoFKMf7pAR8x/ZiGropxJxejerfNnDNUGLeB
gTc2lMBvuaJjJ5uzFiKDhQl+1jBAwhfN64/mVbZREPXleJck4OXEuwCDpO2lMzM8
wYCczlhHpRsqdDWvmIXGs0430LJrlnxMcV1B1Tp2KKH4Wl40qkqtv4a9xw2WriWl
GU7XDUFGRazpyOY1zrZC7XiwFx4VwD1ECupoq8DzF+wwR9XYfBeFhteHb2hhKIlK
3TQOhIHxtwr7ZmM9915GK388ZkhucA==
=AhOy
-----END PGP SIGNATURE-----

--tuFXEhzhBeitrIAu--

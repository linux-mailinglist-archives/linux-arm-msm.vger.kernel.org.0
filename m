Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594C43373C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 14:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbhCKNYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 08:24:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:39068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233523AbhCKNYD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 08:24:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6BBA64E68;
        Thu, 11 Mar 2021 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615469043;
        bh=xzwPI5JQtjn9+7GZC/fdahrb74yKvS/0GBNKLNERVog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P5E69wx4H/HQaP9IQntG+GLU/dcUn1WinkdK4P6pRqu8cEN8fpco3cIkjgtBLDOE/
         v2eGVExuK3ptdJ4hS8bQGnh8S7frkABUTmn+CMWvwgPHfKqhf0XMT/XEz1N3rLgOYv
         Gt4nasZWfYj8+x6R5Nsqtb+ZNbR2gmhDV257GjHddNwvTFFDwFTfV45oaTnYsAJ6D9
         N296W4Z5vSvP2SD06gyeuWP09bELyjN3XV9jdktBJzbZ4rEHupD9l1cNP05rW/AFqk
         3LlCMK79gO13coX3grZiC/19pPKYsXk03mrEDqj4aQdKdHQa/gAvrlc0ZqFRAM9gDW
         M+Sa3yhHSpWyg==
Date:   Thu, 11 Mar 2021 13:22:50 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
Message-ID: <20210311132250.GA14183@sirena.org.uk>
References: <20210311081805.20424-1-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20210311081805.20424-1-srivasam@codeaurora.org>
X-Cookie: innovate, v.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 01:48:05PM +0530, Srinivasa Rao Mandadapu wrote:
> The max boundary check while parsing dai ids makes
> sound card registration fail after common up dai ids.
>=20
> Fixes: cd3484f7f1386 (ASoC: dt-bindings: lpass: Fix and common up lpass d=
ai ids)

Commit: 43e2ca64db47 ("ASoC: qcom: lpass-cpu: Fix lpass dai ids parse")
	Fixes tag: Fixes: cd3484f7f1386 (ASoC: dt-bindings: lpass: Fix and common =
up lpass dai ids)
	Has these problem(s):
		- Subject does not match target commit subject
		  Just use
			git log -1 --format=3D'Fixes: %h ("%s")'

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKGaoACgkQJNaLcl1U
h9Aotwf9H3YJMXqgVqMpFF8abbKcwn2Y9/R0MP/2J5YhR+xupIqDeGHGNC/gOtSS
ROOzaJZacTkOE/sqjGRKMeg+wrqIZYL05zoLNHx9T2tJyy5dibQmQBpmSSkF2z9j
Ad9/7hnDLy+5oTlsz1UV1Iv53b1on49md2+2eY88MSi3wNniqmug2QxzAKh5Sccd
qQ6e41aYPVQBBMABQLVufZ5mMl9KuKxq9r1y24pTTqzcXyPPt0NVOxEsc6hi6H+K
D92+fEs254c11G+sq/U9RRY0/iMAmsRlWFIdvdt3NWoMqHS3lCdpHHH7eGjfXpSr
d/Wz9SkL7LuMRuIMOsXTQ9m1pf32DA==
=+anN
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

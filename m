Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B4220365A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 14:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgFVMEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 08:04:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727864AbgFVMEL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 08:04:11 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12E432071A;
        Mon, 22 Jun 2020 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592827451;
        bh=OtCXs6qM/P9EkBQOGbFbsuL3yixXLWMZlDM2pS2KULw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lLSiwOPq3kFltNjGmVtUTR8bqdRAZLMPunIKPq/ormr3CcYLEKhYqR99c7sOWbm6j
         QGDp3guukz+KDDmVFZZbM801EPjtvCQJHQ1Jn22iv/gzYz0+zqTS2g6Agann7ySK64
         D7rgZz7rr4H84BwzotL1cGZN6bQDlsmoSWEjnkqs=
Date:   Mon, 22 Jun 2020 13:04:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pantelis Antoniou <pantelis.antoniou@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthew Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
Message-ID: <20200622120409.GD4560@sirena.org.uk>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline
In-Reply-To: <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 02:34:23PM +0300, Pantelis Antoniou wrote:

> > This looks much like a replacement for ALSA UCM and userspace audio jack
> > detection coded into the device tree.

> I wouldn=E2=80=99t call it a replacement exactly. It=E2=80=99s merely a w=
ay to bundle all
> of this information about codec glue in the kernel (where it should belon=
g IMO).

No, you're encoding use case decisions into the DT here - for example
your example will break use cases like ring tones and shutter sounds
which should play through both speaker and headphones.  It's also
setting volumes which may be inappropriate or may be not and interferes
with userspace using those same physical volume controls.

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7wnjgACgkQJNaLcl1U
h9Dz/Af/ajnJ98C2qreuaWAPQ8PgLd/GE3P0ukq/sBXHzyMUg16weomHiWdIrtEZ
/78/EQEqwb8rigyHLVLC7P/BBmLH2XqpNu0tB0hhv4iN5ywyvri2U6LbDUIlSdKM
VieAO/eLiOmM7lC34jf5n6JJllQJGAFQlsJMeSdsBMim/xILhPXPAZ8Vw10PakkK
VWBCA2z5kQLlqU7R/90f9HqXaQFegxQJzJN4otivtTr0bNq3fYVnjs/l8cGoIM78
hHTm7Gg5dIPxG6u5SL+s6073hlMRzS1NOPCjz/9nuJgNV49BR9kvHT25GE2wPmLP
Pbq2xpkHMsSQSpnRaK81eKX9f3gp1Q==
=IFZO
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--

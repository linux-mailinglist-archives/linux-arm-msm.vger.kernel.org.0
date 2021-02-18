Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1861931EAEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 15:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhBROY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 09:24:28 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33732 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbhBRNpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 08:45:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 543681C0B96; Thu, 18 Feb 2021 14:43:47 +0100 (CET)
Date:   Thu, 18 Feb 2021 14:43:47 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: Re: [PATCH 12/18] arm64: dts: qcom: msm8994-octagon: Configure
 Lattice iCE40 FPGA
Message-ID: <20210218134347.GB14087@duo.ucw.cz>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
 <20210131013853.55810-13-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <20210131013853.55810-13-konrad.dybcio@somainline.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-01-31 02:38:43, Konrad Dybcio wrote:
> From: Gustave Monce <gustave.monce@outlook.com>
>=20
> Octagon devices have a Lattice iCE40 FPGA connected over SPI.
> Configure it.

> +	status =3D "okay";
> +
> +	/*
> +	 * This device is a Lattice UC120 USB-C PD PHY.
> +	 * It is actually a Lattice iCE40 FPGA pre-programmed by
> +	 * the device firmware with a specific bitstream
> +	 * enabling USB Type C PHY functionality.
> +	 * Communication is done via a proprietary protocol over SPI.
> +	 *

Wow. That's interesting hardware design. Someone should put RISC-V CPU
in there!

Best regards,
									Pavel
								=09
--=20
http://www.livejournal.com/~pavelmachek

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC5vEwAKCRAw5/Bqldv6
8hkMAJ9j/OMHKcPuiOpUVyyiQeZ1hkCKhgCfZQaNIWK576MCUcmH4AjveKZAs10=
=3Cbc
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--

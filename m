Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2102FAA9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 20:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437123AbhART0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 14:26:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:33394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390424AbhARLiE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 06:38:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 385FF22CAD;
        Mon, 18 Jan 2021 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610969842;
        bh=DFDLTsvgjvFrpYts0MUpDKjSJv7X4cfmoGmxg2T+lxE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ht/K/dOm+n6j+u4svc925LDLs7DG0tdGysPEGezRHEQ/ebqEso/O5saSc7kmWadXV
         /JyQEf9IQNXMGToB5jEMQT3iUdB4shoFnfHzwJBKDSD05Fi6PCVVpVxXlDGP1Sn1nj
         MKnl++d/T1RP7oj8YwCWeVerHgo7Hffwz0ye3T/grhGJ8McwpKAYw5JkmVNyh/3zx7
         +rBLamk68TUHdDNi84r/8RIFAlAVfvs76/Sat5LZkkNWf2fJ6eSH15402pGzdrfhrd
         vVrDgTWH+kPj1/kj+CVgLG353yl0vv+EL2h7AhoKS5WsPWnEHu7dNUu8u1mYSidrCU
         bLWa0+5qSHtag==
From:   Felipe Balbi <balbi@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: usb: qcom,dwc3: Add binding for SDX55
In-Reply-To: <20210118051005.55958-2-manivannan.sadhasivam@linaro.org>
References: <20210118051005.55958-1-manivannan.sadhasivam@linaro.org>
 <20210118051005.55958-2-manivannan.sadhasivam@linaro.org>
Date:   Mon, 18 Jan 2021 13:37:14 +0200
Message-ID: <8735yywk5x.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> Add devicetree binding for SDX55 USB controller based on Qcom designware
> IP.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmAFcuoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZxIRAAlpEpxTpJDTCzj+N4SW/IvB68Da7w97Zi
3Y1rUZSbQmbLkclkDEnF0H10rF1oT2b39xeVbj++j56S1BCB3XVRli+LRYcnEx+o
SissxEDGr1baczSn8uZJ/UgWIEFrp1JztyqLSWtA62NCEmC7+HQoZf0765CMELVv
V3dC8Y6GFRWBNErxfuwoJdVgbWe3SPNrrkTodnAZxNKsxiV2V23jy1j+kWRKMabx
50gMSKBbAhbLNuvZMVoOHp3TgXZofcCboT0RH6sr0ycBGipJkIjApn03zslFL2RW
tgIR2Y1H4HN3JimLP4NEfERyCU0v0ibwf/gLMdMy4/psfEcoE7E+I2GLadAlL5wa
0iDVPyLvjmpyj136DAM0X07iZsak5mpeaTMvkrYqPDABnOflfyOAv5eysXPkh+Sf
xh/676DIR7LfNBrdPrql/69sQmW54t9kBR803jYHhYr8tvVdqYLnKFGNMpEFGH1+
/05EFqwnR3M5cppmBPL2qhP7y8Blig29o/YTB6ysrArdkcfosp7ZrABliUJ0CuU4
bfKjRDeJamJGoYTZu0hcKX5pF+/3teJXESoBK3j0jXTGkr+mCCJG+VfWArXEd3x5
BoKrdA2D65G+i/kyZ6x983augUgAit9GW4y2IldPMHhE0E4GgDWnpoEuBnmuxk3+
s2CVt/FiDaI=
=KbUF
-----END PGP SIGNATURE-----
--=-=-=--

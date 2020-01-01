Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19CF112DFEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jan 2020 19:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgAASTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jan 2020 13:19:05 -0500
Received: from mout.gmx.net ([212.227.15.18]:36953 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727170AbgAASTF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jan 2020 13:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1577902738;
        bh=hpm2OGR91QQ/m5niGl/vEaS3kObf+3M6jFZ61Y1/CY8=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=G8/oZsF9CPIVvIVmeUxBTihG3u6zLZ8zGIYhKv8u079GM9xmjWMmIeappByWQJd+a
         6bVYoesWtV0yVbbnoXOw8YBYzOgQ2N83qYmL6TM2/H4qWiLHi3IXLaJkFavOjJbHxZ
         sXouv3VcvcWHpvJDS/XK5+QaXvY3w7RLj3hHeRTA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.102]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYc0-1jRnuG0BIc-00m3Qw; Wed, 01
 Jan 2020 19:18:58 +0100
Date:   Wed, 1 Jan 2020 19:18:57 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, bjorn.andersson@linaro.org, joro@8bytes.org,
        agross@kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: fix NULL pointer dereference during probe
 deferral
Message-ID: <20200101181857.GB2110@latitude>
References: <20200101033949.755-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20200101033949.755-1-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:3eYn0RZGHqV1q9jear8kWLgBqk7G/K4ETwM30zDRTCkJUqY6pCy
 K48FKiO3NN3BtpX31To/OcNCQiU4cs6fWV0iKVceLlc5KnL+I8mr+i4/i4F+M/xeEz97yn/
 UA4SezqipJ1XKPN8AV1V8ywBoC66lYeT0Jm636FhQuDnxsNTe3RlNNabqbUbyA7XpuZo7tP
 aJGtkbsuWqLjlmP//fE0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iLkOSE/y0FE=:1U22ENNWgayFiSrwSh3M37
 crbHF62WoA5m10xSN6vB76UxhTot4SEQDASsoFjnvMNUPvQcqmFQc3iNydauQTWZolUv+61k7
 Qkt519I4MnfNNFu0k/J6Drc28aSjyWqBijaWPueID4n6f/coz0erbEKVoHDHUB7quOJUynuSv
 /sIkoJ0MH1poV2JAXjy45ievAPC5tZv+TNtlo4NcPrL2KC7GXi3EI39tvra3Gx9I2NUCYHYwn
 CcBKp0es90e1F6wYYod2sz14wcIGg3X3MHCkj2vDTJfx2B90612PZqoGFqD3p1DeJ3LmB5ZVQ
 xK0iXXBtNMzPM/TAWwiEeLY90kOGQcRuoRG3qGo/NZ1cxHPbNrf/K0das2vaJA94mvdyO1mVK
 DP0YgnQ6hoa4AYrmkUL9sWZuqtIpLbgC3dnMAsusKRnLH1Pue0/XxONNxiMisujb9AVRS9Vva
 +t0rY24oM4H0slQ0/1YzCv80OoGVJAVRb6cIjscIYbwtvx5xLg3zVaBl520CpY36pKauJ82Gx
 kQm4hIvCC1SUo+bz9M/EeqmT2SBcFoHVnQHqtFIV+H+Vh2s8bHpCkAevZVA/0CjIMSUB7LZkd
 ggavJNDaYIsvWVJYB75qf11qS71TyvqfMtLTyr1z16ihOkttdHeAMUkpd/SRg+oC+rPamSz/g
 I5UoEu3dw23UUHecV7rJeA77mBY4JBCYRefUTyvXyMdh0aff2N4XJw3OyQoNntJmyTx9nNmkr
 yTiKoXPuXPpcvS0dvTr1C6IESXlOSBKBx2SLsBFoHOvkd4NPtf1DkvVnPEGjlXQNQlUOPDwvi
 pS1oUVq4XIC++LKAMT269jBcXAV7/VZfIG3AHAAZLZ5ylEM59KD7p57//KOh1lhRls3//qljg
 /wOoXBTGqRvxKuU/LZ7OxgB/XLitYCHNp1xk2FCy1eplMh6t/UFXCAnGKe5yogAFUrBn5wSzF
 RRF4Ht+HY3zAa5nEWZK2LJ0RHA3YCSR0bxrghhuI2kYRdYhylGSZhXgQbmMVRsSiINkYSY84e
 MGhfCAT702ntQ85u/+7dV37wPI84n2KK4Fkq7C4GugmWZ9gf/i6Edl1tRzUfegceDfUJ6le4E
 cWM2PlD570jRpGSTdSjQ3xk2P+BhfJpx8hCZeGCVF+5bb2G+BRwv7UP/W5BFmUzvv/HXb1yFQ
 nQssxjlfnkCkOfN+qzhIdsfKtpQkw3GfmZPw3a1JzMoa/e89fl9/DXykHeScGxqnXIp2tXrcx
 BLNsZroG7655XoznHBk6I5pMt0mwo0CR5XYA+DwRHLhOfoDmicK9c1UKyNhM=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2019 at 10:39:49PM -0500, Brian Masney wrote:
[...]
>     (kernel_init) from ret_from_fork (arch/arm/kernel/entry-common.S:156)
>     Exception stack(0xee89dfb0 to 0xee89dff8)
>     dfa0:                                     00000000 00000000 00000000 =
00000000
>     dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
>     dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
>     Code: e92d4070 e1a04000 e3a01004 e240501c (e5930014)

This looks like ARM code...

>     All code
>     =3D=3D=3D=3D=3D=3D=3D=3D
>        0:	70 40                	jo     0x42
>        2:	2d e9 00 40 a0       	sub    $0xa04000e9,%eax
>        7:	e1 04                	loope  0xd
>        9:	10 a0 e3 1c 50 40    	adc    %ah,0x40501ce3(%rax)
>        f:	e2 14                	loop   0x25
>       11:*	00                   	.byte 0x0		<-- trapping instruction
>       12:	93                   	xchg   %eax,%ebx
>       13:	e5                   	.byte 0xe5

=2E.. disassembled as x86 code.

I suspect that scripts/decodecode picked up the wrong architecture
somehow. Perhaps CROSS_COMPILE wasn't set?

>=20
>     Code starting with the faulting instruction
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>        0:	14 00                	adc    $0x0,%al
>        2:	93                   	xchg   %eax,%ebx
>        3:	e5                   	.byte 0xe5


Greetings and a happy new year,
Jonathan Neusch=C3=A4fer

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl4M4ogACgkQCDBEmo7z
X9uc6xAAt8EnWXrDJbKJksr2JLYDwsRONNkcbseMDFX6lxbaUtMInIzz+lALKI23
VFFFwmNKK72kxiQYgITNFWV4LC19MBMKdXSXtw8F56MX1vIFgcibvh703Y0n/hEE
81tMDn3DVlDyuRMN+jTAZrFMqeFB2yywoPYjzesQX9hprI0DyyGZtPbqRHkCpWfN
aWthJYvX1+QWyMjt8fHinUsLptLA7qtb4ZRUMXg/O8xO+NC3Khn9nVc8wqDeddAH
A/U9i9bvhFBzQotNQdqaxzn/4mlBGN9xpPR+b2m6evJ+71Di1uNpoZocxrIdEMsv
NPor1p04QFW8nWL1ZT6qa8MyUPuv+YTRrqBYnaXgPskBMal/KA+0U98WOWzWh84u
IKxWLYD1O3SL0udQsIXOb6FUE4fSrzXDKIWtgZERhnqM2vrmGooJbRNyE/IeRdXD
Q8gkOLwxZKX7aRzzXqYVCWbQsBIvE3oUUtJB/kdleY0Q1CRb9l2tYTqrlnMcSjIE
Qxh9EZim7MgzwX8nmf4CSAV5t7gSSoxlLXiMZOAye2AkhHygdVlGEH0AQk4P17oW
P6jwyKZ/88PgNai3frPAYOufE+AHS49K/p7iOWcmPbSmyJ3ii6tml6h8kvWA0ff1
sHXQgCiyZPUKNg3KD5TOZ4rLQwxon85eYlqP+KbB3taO1H6Mwvo=
=xMEO
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--

Return-Path: <linux-arm-msm+bounces-40310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0519E3F91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 280CF2820E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3689720C47E;
	Wed,  4 Dec 2024 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnCXEqfS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8967A188587;
	Wed,  4 Dec 2024 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329572; cv=none; b=asJ8z/eilFzFZpNBlUcb6EAnW8i35X/lYZR4ExY+kqOUmbz1WhMFE16qCPi+Hf/Co+KEvF77C/DZUleD4UyGwdLo0FOxaOpwTUyjZSc/JCLlbewk0hNiEPPPxZQCgNzgbcvrreK4Cljzc5cpAcJE2SjYNmjb3jwyFniMDQLE24A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329572; c=relaxed/simple;
	bh=CySl2OhgJgVkeRcK+TzjcCOnqGEVHnmeriCYAaYqB1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1n59D17XqQLMb85S+97qtAbPy0SqF6TBs7cHip1yQaHWKQE/eRNYV9qOvtyQlAvUQhgAO7qPguIcBMt25K13YUfcPy9twVUHM5z9raE1NcpgOaTBAwQ1K6XF5pFXHfmRky922dx0lhPf7uobTDkdIAHUNAR3tzDBZ0gJd7gV00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnCXEqfS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e1be0ec84so1733740e87.1;
        Wed, 04 Dec 2024 08:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733329569; x=1733934369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avsElWR/fKi9kOjnFO0ifEAxNLupFUHqYpFEY06aggo=;
        b=gnCXEqfSIPJnXuVj7yyEstCA0LGcw2qRJYgKMa+dA3LpgHTfTHmr2LHO5IOGDfEfHc
         Y7J/RcCFjFUOEppG2fC+qARaGd5zTbwsmh4VYGXvkoGivgSgkq6UDFiy4MVwaFF9re0N
         TXtNnmMVH5Hk9xKFRdKjoDih9W6OSdBU4wLxXRDY173iMR+QhDaWdKtZwOG3kNZsnEYk
         q7YUlv26b3a68rD2VXknQzbAM64gPRizA+A/DtkCM4B1N1Tp7wpLwNzM2HoVixm0GJ7U
         drVUXjCQ5xe2g8v1DKxHTBI5VeY8qtAsDPoERZ+83+zDg7iDFrXWsfmuFl0QAD0EKv3/
         W+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329569; x=1733934369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avsElWR/fKi9kOjnFO0ifEAxNLupFUHqYpFEY06aggo=;
        b=bwAkrQ9S+u51HkvP6CnXufiY1z9pjoWiCAuEJhpPwAwzLF3kE75bpFgsjzbJCi08DC
         FWTP7rooCCqiFg7jzHOLRYwoFSMhelaALBxdBcDNFnmvNZr+zaddIu+hcUerjXtkxlDF
         44BNwCpVobGymeRe7vuWs/ztjQc7caZhbq386lAZWNHJwNl0S+b1HOOq3i0+kSlQ3gcy
         y22mMe+Ei9vSQmBX1qONA/aLyb7ytILoSvBwUJMUZNAxIHfjSRflU5l2++Q0D3wfnOdz
         oJecSsiFoIz1vDWmP7rFztVNMn5l4IStGVz+rHRoRtEi1oY6yvHBRjJrxlV3kuB2xBOe
         SW3w==
X-Forwarded-Encrypted: i=1; AJvYcCXVKv4dsvX2DAymmk1lgNxeTc7hArlowVaS6CJ47pgE7IaBNXeAlBnWTOw5vCQY/qqewMWEM9bi0pDE8Z0+@vger.kernel.org, AJvYcCXhN58QVfPoEVudZobDL08cuRrCnwu2fS4OiGBqQIgvRP0RvIVQd/Gb4sPv31VzWH1O3S6yReLspADDmu0M@vger.kernel.org
X-Gm-Message-State: AOJu0YwqM69VSA4iEDzQ/NCjkZaG4hamGC7Drn92Zs9+WB3HBFG+7IbJ
	5sUtH+U8rxdduUBpD3GBsgrvDnD7EGikYXraHAdXYZiIuj8Voj/n
X-Gm-Gg: ASbGncsabe46rqD+Qpp7KcLFyT5zZa6GSO4lpvlPndtrbs6ZHVoEYV5YMWLySqKgdbS
	KD/QSaidPTx4Uak8qA1zDxF3/ZPm4DxGKy0O3FtQF5mPxiny76+V0Kxg12BfJo+B0wIl5sySxaT
	Z787kduckjDIBZfKR8hT2CWp9sYJ9RNHPUOUuHo5Ma+OyBGxML9/+0rljpolxmo7xEdgmQEQoC5
	7rkmFX/lpV3Rbh+4TL/U1Qz3lPBUlB9ryq90RvqGCNCV6hptybelQ/oc+Zmh0aWO4qBL0e0kevB
	e5b9/ZR2k3E=
X-Google-Smtp-Source: AGHT+IHZ1hSLNbyVNKzBWLLPkHij7c2uDQguaytbWO4jC4VLwSaGA+Z10qe03u3qav3/qIqYzj4nJg==
X-Received: by 2002:a05:6512:3b83:b0:53d:d41e:b1a8 with SMTP id 2adb3069b0e04-53e129fdd48mr4338645e87.20.1733329568568;
        Wed, 04 Dec 2024 08:26:08 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f19csm2252958e87.150.2024.12.04.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:26:06 -0800 (PST)
Date: Wed, 4 Dec 2024 17:26:04 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/9] ARM: mvebu_v5_defconfig: rebuild default
 configuration
Message-ID: <Z1CCnGZvuBLZ2k2P@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
 <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
 <303c44ca-879c-477c-a96c-9741bf3bf31a@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kilpMY/xPkg/Gz5s"
Content-Disposition: inline
In-Reply-To: <303c44ca-879c-477c-a96c-9741bf3bf31a@lunn.ch>


--kilpMY/xPkg/Gz5s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 05:04:25PM +0100, Andrew Lunn wrote:
> On Wed, Dec 04, 2024 at 04:56:47PM +0100, Marcus Folkesson wrote:
> > This configuration contains obsolete configuration options e.g.
> > CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.
> >=20
> > Rebuild this configuration by run:
> > make ARCH=3Darm mvebu_v5_defconfig
> > make ARCH=3Darm savedefconfig
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>=20
> You probably want to wait until Arnd big removal patchset lands,
> because this is going to be immediately outdated.

Thanks for the info, I wasn't aware of this.

I will give it another shot when his patchset has landed.

>=20
>      Andrew

Best regards,
Marcus Folkesson

--kilpMY/xPkg/Gz5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmdQgpcACgkQiIBOb1ld
UjLPcA//Y76oK6kUD1ojWaB5BoNve4LYgzpwUuIeHXLEpw6zWShBHmqs6RM3dzs9
13xOZUPx4wFAWbYi06fdTM33ep0akpMgVwbNG6z12mI3W3MbRsz/CZ7cM8oVTTIo
NViHeU9Jk8EZVX1udBAFToQIOeO5v1TICeBQF8aWhaNv5MgUNL6H2hQ/AaHxpjmv
P8Trltk+r3A4d6g0ZcJ7LvQcIdePls3jPwnHMNHcb8YkfPCwTAo3mqWm3N9mT/SO
CdRsblLyGHBqu+c/9bgqAZglgyAi4xjIhWJVBwdqVn9AgHRsKwmxBkX6Pa3dqr4l
5P+PBnoqv/CAtlO9nakNDPu4NyeYJ8M6MkKU/5wjcVIuTNnsz9ntcdsJimmC48y9
F9HI8xvUpJjiRtd5VnrCbU0fbw1nh2G6kpCArhsgmpq4Th5EAZxhOBV6yV3ClzJJ
5zXckqwRG9XbFZMQ5nuC9J+qIzyjqTEfIKEgOB+ZlbAs4in0H25z02z7wmUVvkNS
yj6neRSyB2xea+W7wkSdIcxH+1WFH24AdV6nxyYtzZjrLAT87yIf+EUQUJZztk7H
plJs5NLilJBeeKsgC0Sj67Z//MtLLv+3FQZmyOTZg9eI0qvVd3A1SKRQLopTE2vT
oF2TutNMWmnnauYXBXta/Kk2yC0ubur3Ne9bYG4sKni3yEI6WE0=
=vnf8
-----END PGP SIGNATURE-----

--kilpMY/xPkg/Gz5s--


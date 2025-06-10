Return-Path: <linux-arm-msm+bounces-60889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EAAD4612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E2BB17B255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296C82686A0;
	Tue, 10 Jun 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XqQQCR+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD90A283686
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594971; cv=none; b=MrAiW+UI3rBeT1rwrD/RPvh3zHISvbXHaZvUYQaxou84k6wbyYSr5Sxi6cwrLbt0/Xj8H3zAPXHT2Elcq/J+D3Db/3zckSexnZxJswJM7r93QN7SIIpNc9ywHB96aO533iUUqxh0Ah3PDts+MbKMTS7yGb9YY6kDiYT9nwjgMjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594971; c=relaxed/simple;
	bh=Fib/YbEPp/InJ/JNwcu3nDYpvzboQysxkrpsv0GCT7M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2jEB47dQeYn+clBDOz62DCYXWQQKM71xLISMCc3RxmzEaLyX5mgw/E1R5KpBzrP2lFLLcrL6Tfgm7HMKszs8NT843bwdu+PiwaxQ6lhM4Av5DvU0wMI7tzdN7bQbrc6bc7r8ggUbauVlvkGLtgvdw6j9HawTR20W0Zt2+T7xlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XqQQCR+o; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749594963;
	bh=5XDxG69hJWIR7MrTeXsJdUOv+6s4mDyGo/RvB64CshI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XqQQCR+o3z3LchzfZOYdUg/qSXh1lqnsdgAXG5SgJCCPke4qd/s1Fj8JmbT7g6Q78
	 4mivrnFZXAbUJ447uRHI+FlwrBfUmaeMa0bVoNL86Gz5anhMjZ1HWdv1Cqcw4dhOWp
	 rowaQjr0zptqkeZsXfUci7SzdEc46Yq7IQ359BOAI0fSETiGhxhToqV8VaGtZt6ogR
	 5raEQz6pXyBOwQC1R/BfI93PONWTtr2o6ephTKrrpu7TYEgd+OMn32YWPTMB3Q0CSB
	 a6k/CSlUaJA8aBMqZ6s2qtVTiCBcXjJj1dbwGby3SLPUp6ompcOSQ6u/lOxy7U34yi
	 Rqgldoy3InQjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bH3Xz1hQlz4wy6;
	Wed, 11 Jun 2025 08:36:03 +1000 (AEST)
Date: Wed, 11 Jun 2025 08:36:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Use dev_printk() in RAS
Message-ID: <20250611083602.169893da@canb.auug.org.au>
In-Reply-To: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
References: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vSsDob3nsa+9LwSfoRqKvy2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vSsDob3nsa+9LwSfoRqKvy2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Tue, 10 Jun 2025 11:59:12 -0600 Jeff Hugo <jeff.hugo@oss.qualcomm.com> w=
rote:
>
> pci_printk() was removed with commit 1c8a0ed2043c ("PCI: Remove unused pc=
i_printk()")
> so change to using dev_printk().
>=20
> Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Service=
ability (RAS)")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250610124809.1e1ff0cd@canb.auug.org=
.au/
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/qaic_ras.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Thanks.  I will apply that to the drm-misc tree merge until it is
applied to the drm-misc tree itself.

--=20
Cheers,
Stephen Rothwell

--Sig_/vSsDob3nsa+9LwSfoRqKvy2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhIs1IACgkQAVBC80lX
0GxYlQf9HEoJDJGuzaElhagMan6AK+uuQFks37DLEKQpaUPnPMfc+5kQRg1uadxw
+VvJo7JBT+d58quTE4AGoTk9w4udA5ClCjq/Hij2hUZZ4/snZvAr3GBcUzWVW/Kk
ZdOt2P7mSRswJABNJ6OeBwBcHvKlkdesnf2VVacL5qFNn3w0SFYca8OgxwpWRrD7
B6WnqPttrC+WjQLVeCo5WEhkGouDFhMr5KC+A4Aa7XKaKfHECRNABOAMSxyelaIB
VZ0C1XMCsk5mgfxNwlHdrB3Qn2vhi+H9/gxi4awI/Ixz9pirCB29rM5QkZKxIcpM
GeHxrTmgrlQZ6pDIkuM2SStFkzmqaQ==
=tFPA
-----END PGP SIGNATURE-----

--Sig_/vSsDob3nsa+9LwSfoRqKvy2--


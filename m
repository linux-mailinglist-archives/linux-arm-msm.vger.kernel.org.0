Return-Path: <linux-arm-msm+bounces-46961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB59A2962C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 17:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9631164165
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 16:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1174C1ADC7C;
	Wed,  5 Feb 2025 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IzYfjndp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A889A17BEC5
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772609; cv=none; b=Xaxeomscgwon/iMeVejIjgHWp8egwUNyqgDpNoyLBbBTdwfXRmKGVRfy8zuZNzRhPfXw5vo7vGTcGATnUD9WA05z6NGEoMs3vbl99LBzTkADs1NV/m8/tgE7cC8TNuKsidxppljOjkkTFvEyarOSNSDpzNHaiYvgcZnYLSsoeAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772609; c=relaxed/simple;
	bh=gIXdY1mLEJOad0UDgvl1N4/XnFtkdtWs5lWVPm8r1H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0rUaL+dehKQvpxkR9sdrWkvKGWvloIuCAtcGqkPxJOO8pOw3Rpj1XnmggD0VD3c2kB/iKkMGSATYMZylYk5vNMbQT2sdbE0LiJM16W2qFQMyIymQHZmnR7kNSms+0JMIoRuciS5FGSEFN8w7iGoq/TMuxYque8WIhANU/P7Sc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IzYfjndp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gIXd
	Y1mLEJOad0UDgvl1N4/XnFtkdtWs5lWVPm8r1H4=; b=IzYfjndprupblbyLdsOG
	55ti7uOx8bocr8l1yXzZcSe1S/YAEW41K+WQrlXNeDvz6vGhjBccb9Cpw/NmP2+V
	J+Et+6sbsZq5pHAobkaqiTg5HyuUrisxVhNnTkcaKEPPpEZzlXyFZFanb8w34GfM
	p6Fc85Lbj3H3Nqi5ICP54NKb2PhEH1KyQ1mGlIblMX7NB0XfcF2Z0sL13aZFdiwD
	uVsaLvwsU+IciUftrQVqDTNrL0i3vMG+8vcgDCH0MjiDRKVkOXbsgywd2mU74Zxj
	+CKIfhKEL+4Pu56SZn7yFMZ6PmsSdTCjaggaUFUXSr66AuVi/axmbtbvf4Yx4SqX
	8A==
Received: (qmail 3454112 invoked from network); 5 Feb 2025 17:23:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Feb 2025 17:23:22 +0100
X-UD-Smtp-Session: l3s3148p1@ULROi2ct9pi5aIo9
Date: Wed, 5 Feb 2025 17:23:11 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Add Qualcomm i3c master controller driver support
Message-ID: <Z6OQb29Ca2tmQs2Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzsO1nsGHdcZDS3F"
Content-Disposition: inline
In-Reply-To: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>


--yzsO1nsGHdcZDS3F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This patchset was tested on Kailua SM8550 MTP device and data transfer
> has been tested in I3C SDR mode with i2c and i3c target devices.

Can you share with which I3C targets you tested this driver?


--yzsO1nsGHdcZDS3F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmejkGsACgkQFA3kzBSg
KbZQ2xAAgEwgaTMhHELob/ZfmcCI38cbMP/TafPOaNf307oz1I1GFRRSCWOuriMH
brOL5Xtu+1hOCqrgDud1VJE89os5nNYPr1Nv4NFgLgv1H6G4O6jouZSZd80yldef
SV5BH1b1QQWvO1d6wjUVIJ94/d41G8J5Pty1M7VchX/z24fa59ZNq4bw2iiV3BTJ
FrNwZEVcaDFK4OIpERN82fB5yaa5wTbuj/OH/eKTnL2aBIq4a26WQD6lFxpvB9g/
OwANtW+GjMbJNu1QlwuAV6saIJbs8DOmYFLMkIeMe41BVjjjnoirkuG7FfISICZh
KCcecac9ZUmcYKE6WKMQQP16TotI95q3x5V2IYEPw7DtHIIUWeCrKqpADl0H4nyk
aOzkR33UTVceA5e7ZTTGuYo1hyGxNRsrlWzy2kdXjTp3IeDDZbNA6uKPLGvkLV2T
1YUmzZjD44sWSIf6WEVdretg4D9JZniLqtb4LbiSEOPJErEjlgB88wz4vlF1os59
BtZfc+m04LyioTPbe3qtzpWKbNbOgX7VLjSoiUeIR66zwYRpUz9lMFk01GzfKXr9
q3y9gj80Cglug1Cz2yDuF7r9lbknE74m8oZwBc4V7UNNRhCm3Bd93XCfyUmMP61m
MKPsEQSKEbQTc+zv7Je1WMm+2j3we4Md3++FvhZNblryGLfGWmY=
=dz0m
-----END PGP SIGNATURE-----

--yzsO1nsGHdcZDS3F--


Return-Path: <linux-arm-msm+bounces-83446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1FCC898C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 12:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E6304E51D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 11:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9623246EC;
	Wed, 26 Nov 2025 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="V2YihFNx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BD7322C66;
	Wed, 26 Nov 2025 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156978; cv=none; b=lSuCiR1ohPRy3AJREMPE4mgI83cG282g7Fz6dDZb0A7IR4QxoBjv6P2LbOMrBEjD5p8cnyFiIJ23DE8NysUdK8S+3GqgMAimaHAUBP9VvFhgjAhxIO91ZvvwPqJQnoISZayZg59elVYy8l523T+6zhysURGb4usDtGSXApsh8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156978; c=relaxed/simple;
	bh=U/wxBNwg9ZIbZz03o2yJZD63+bIgL81790dbvb7XZs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+zy1vilsjEzEXhEgrKEPoMXPAi6ZxHlUCi4VNbVJXeNOzahXo9EAJ0RL0Ge4Js8LwrLJ7bw80MmBAnvLpUbqntkdVAIqm82bRnLZQB82xQqxvZH06bRT++RZMReH5WOK5rEGzBYQKFcH0+QL5FNNQ2A62JYXwji7aEh2FBM8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=V2YihFNx; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id DA0021C008F; Wed, 26 Nov 2025 12:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764156966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/O7ZYQMbnfF1alHdobiDhyliZvC6+S+ReFZr8vdocbQ=;
	b=V2YihFNxzyWaY0KqRZmrilS5zPCQDUHlyH3vRUtU2gRTGh+MlI24G43DQNiJlz0sW4e69s
	HHJgoJ6Jzdm4fnSmvnUBu5sVN6ItR137e2s/YT2jgOatHxhKS2mx193gTC/NiehCZBo578
	lfSibBoAlyxNpZzLi5rdMBOdNF8DiBw=
Date: Wed, 26 Nov 2025 12:36:06 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Piyush Raj Chouhan <pc1598@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tony.luck@intel.com,
	gpiccoli@igalia.com, david@ixit.cz
Subject: Re: [PATCH v2 0/3] Add Xiaomi Redmi K20 Pro (Raphael)
Message-ID: <aSbmJhExpHGxy3BZ@duo.ucw.cz>
References: <20251104221657.51580-1-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2CXdsymDnl1vkxw6"
Content-Disposition: inline
In-Reply-To: <20251104221657.51580-1-pc1598@mainlining.org>


--2CXdsymDnl1vkxw6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This is v2 of the patch that makes several cleanups and minor fixes to
> the SM8150 Xiaomi Raphael device tree.
>=20
> Changes in this version:
>  - Updated qcom,vmid to use QCOM_SCM_VMID_MSS_MSA instead of hardcoded 15
>  - Added include: <dt-bindings/firmware/qcom,scm.h>
>  - Set ECC size to 8 in ramoops region
>  - Updated firmware paths to use "Xiaomi" instead of "xiaomi"
>  - Adjusted configuration for panel pinctrl
>  - Removed redundant LDO8 regulator entry
>  - Cleaned up PM8150L LPG LED definitions with proper labels
>  - General styling and ordering fixups
>=20
> Link to v1:
> https://lore.kernel.org/all/20251022054026.22816-2-pc1598@mainlining.org/

Thanks for doing this. Please cc phone-devel@vger with phone-related
patches.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--2CXdsymDnl1vkxw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSbmJgAKCRAw5/Bqldv6
8vdNAJ9w/RWvOgSvEzIzVh+zu34qYxfzcgCgj0jDPGnQSP3Py+ELe55y6PBM/28=
=j4Kt
-----END PGP SIGNATURE-----

--2CXdsymDnl1vkxw6--


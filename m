Return-Path: <linux-arm-msm+bounces-116865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zzJpMrG5S2oCZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:20:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABC711DFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:20:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Xf4hF8Tc;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116865-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116865-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98F4B30E25B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287D7302146;
	Mon,  6 Jul 2026 13:46:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4BB1DE4F1;
	Mon,  6 Jul 2026 13:46:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345577; cv=none; b=UcG+k0Tsnqw1+AsPRGu9DA2SaRH3wzkfiLh1CGA7oDdDFzdy3VYwW7OwUGiJhZp6R6VJww7ka8A+s4ZvP4068H5lHmFhldgmLsl6LycxC6P3aOSKnKr8KgQ7YuU0PT+Vhd4Dj78hhgYJ6Vo/CgSc8SZoZ8q2EI38j5Gr46kqY/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345577; c=relaxed/simple;
	bh=YVrG55MTbCf8F6iNwNAZlvgZCo+2ab1PuIEFWlguY5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgFHHE6B6/9bAHRHKUISmoqgaW1tbFrrSUVs1yJxZ8UO5HO0N42byRDbxJIq/mA3wkIG2nA9vcU91XtRBjd/zaf8eVAiUecbbcH9YGgbdrUYnjmBAiRIf6nHvzv140i2Hoyshh+GJoQO/cjgGfpbq9d39IwSdTz5k7zMcU47fak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf4hF8Tc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18DC1F000E9;
	Mon,  6 Jul 2026 13:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783345575;
	bh=AwITMy3REMoQJOkqpxdYS41foLIWXWMtXkmz5EfGZXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xf4hF8TcWAJxhQDAa5pKWB3VcKijbqXnB+B1TKqS0AjiiGlPMRKrrWXXmwpbFgWGr
	 F8qD7b2p4HtjgTot39MNNTk487iamJxV2FAQvSWmgoXl0kAKrfNhvHrTHWWKJex3lG
	 Yk3Y8kHCyjT2DroHFhOQ/wrurMyQFli3t/qzpTbFVRamLAlHunJyDVCAYNQKOdZiao
	 EA1tkPS4KLfJMan8nSg1sinw7tu7/wIK1P9B7e0UPZQ2FVaXMdrDTW3sz+lIrA24wa
	 ZrJbuQSme1oiEOXuLz8GpJ9V14C/LIyyWEMEcFiEjJ1IXpJYz8WD91YHZCuR1tCw/0
	 be3OdyC6fHHvg==
Date: Mon, 6 Jul 2026 14:46:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/4] regulator: qcom_usb_vbus: add register
 abstraction and PM8150B support
Message-ID: <4d9623e3-c39e-4ce3-bda2-792b72da44eb@sirena.org.uk>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <iaoZE4hpivDN9Ni1ZEuOqYXFz-q7GLrDobrLO4sHWFWIIUT5ieju5KEScJtVNW7u8ue4HojywjRY7BTQ2wNADw==@protonmail.internalid>
 <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
 <477e95d5-ee3f-4a75-acef-a01f317f16c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ECtlvQQHnq2Hwls"
Content-Disposition: inline
In-Reply-To: <477e95d5-ee3f-4a75-acef-a01f317f16c9@kernel.org>
X-Cookie: Did I do an INCORRECT THING??
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116865-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68ABC711DFE


--3ECtlvQQHnq2Hwls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2026 at 02:45:26PM +0100, Bryan O'Donoghue wrote:
> On 06/07/2026 13:31, Rakesh Kota wrote:
> > Introduce per-compatible regulator descriptor data via struct
> > qcom_usb_vbus_reg_data to abstract register layout differences between
> > PMICs. This allows the probe function to dynamically populate the
> > regulator_desc fields rather than relying on compile-time constants.


Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--3ECtlvQQHnq2Hwls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpLsaEACgkQJNaLcl1U
h9DxkQf9HpkuKL/k3dcoEnEPYQVBQtSrVXnZ1uDMBDbCVJt7lSctmDbji23OPQ6F
grhVNtjUbnejlWzVsliSnYseAKzomgI7bvsaAL4w8DJ1Kf4gvfiYqs4YYTvtxJte
dLznX9Nks1q1XgYUam8fh3kgLlcFIieq23sciUQojwbeRh8gE1IIaoUWu4cbJu8e
9otfWEDhC/OkI0tGpWE8KnypLKLIOmU+/vJ/wlVr9e7Kv45J/+dEyS2AHCqL6oJJ
5uqTvR1mxkm/sPA+xVO1KGgaGfUSh+5xmvsZy1TwAV0gexPq7P9b2MV0cpI42b21
qG7rJ5Px5199cfu7XiqWgjJpBa5t9A==
=YmXH
-----END PGP SIGNATURE-----

--3ECtlvQQHnq2Hwls--


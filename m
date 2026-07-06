Return-Path: <linux-arm-msm+bounces-116977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e0htDdnmS2rEcQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:33:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA3713E74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WYcSAmRF;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116977-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116977-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DD7230455C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 17:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414ED3A5E67;
	Mon,  6 Jul 2026 17:24:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3840D395AF7;
	Mon,  6 Jul 2026 17:24:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358659; cv=none; b=SqWBLxe0aq+Mx8kQqKGfsoC/QIvNdwp2nm0c3ua9HfRM6J//3JgncdBhVv9smCCFFwwC/mSjU1yWJYc8KinEhc5T8ELKJLtrVadam/wIIv/qwn6YM+VFHrFQO7ENtIZLbnzFbH7v9FDloJXYAaDcU2oOKY3zdQXl0muxMfxys8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358659; c=relaxed/simple;
	bh=B0rnQdDJy+7zXLBGXoRZ59stE8KocR+LttZreSh0AcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQ5Esnq5HWlX0eDaCMIKTYiCZy5MmCxedbgS+kmrEiEy7TrRLkTsAftvmlj/Hz9UuwSS6O38mJdCsyMb5FkzaKJtF0Gbd2xQWsHsFSOPwxVTc5Im91bAo9hkhEfi9VJByozIsWp4oaYhyNT03nfWoCPAqGYkM6IGv3mSHb3hmOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYcSAmRF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744601F000E9;
	Mon,  6 Jul 2026 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783358657;
	bh=B0rnQdDJy+7zXLBGXoRZ59stE8KocR+LttZreSh0AcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WYcSAmRF4wpYkC+qvf2ZwYOZxq+aHXBV/iRLYp8Bu8jXKZQP/tJKymE3A8prbULB1
	 eH6Vl8/gzipnxCn+N8TGXrNUHywCKEE6fx6LbctDHnpkFU9VNct+2yuYf4/XKkUZXs
	 Qck8UvhBTQr7wo674HBX3IOV66P5vZQhUUmn1Ab/gIyGfH8NEDt8uQOydojH0KTal8
	 lR+vajehzg7t9xYp/Xok/y9KOaL232ddACIYQ0ErHcwInDo1ExU7gxD0WUXEiqcJVd
	 re1h1k1YIN3mhUvDBout7574DFN85MFsMIZH31hfID05tnxsFXr45dMoWP/ApkmHc4
	 teqJTaf75vZKA==
Date: Mon, 6 Jul 2026 18:24:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: regulator: qcom,usb-vbus-regulator:
 add qcom,pm4125-vbus-reg
Message-ID: <3e5c12de-bbb6-46d7-8356-7f21a0c07a84@sirena.org.uk>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-1-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bnb/to0nkEuMkRdp"
Content-Disposition: inline
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-1-999d78a87b81@oss.qualcomm.com>
X-Cookie: Did I do an INCORRECT THING??
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-116977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEFA3713E74


--Bnb/to0nkEuMkRdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2026 at 06:01:05PM +0530, Rakesh Kota wrote:
> The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
> It uses a 2-bit VBOOST voltage selector supporting output voltages of
> 4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Bnb/to0nkEuMkRdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpL5LsACgkQJNaLcl1U
h9Axggf/a7pSsQ520BTomyUqepzGXHQ3vU8ca316cURw1I9KNMsJCwtK0s7I1QVp
6lc1ICaEu5WMz+iRbah21bF78HHyJWt+Bf9EsIioo31IwqtHK0mtfCc++ZszeydJ
vohQw3FqQHztWmuJ8Enef2IPEuZXGdjDCC8ve1IszPU8HTja0wK8jFd3Tyzb2JcW
FZ0f0V86rU8BFsvqwzBIQwb1gMDeoEyFHYhXUTL/aju+wvm22K38/VeN/MMTXud4
wMTFY7rFvSwWNHRJfPPtEXZaO4leL9pyklSBFSCKUwAsSyMeeZkhPt/SGKffxDM4
O4Qhuxu+IrVPCz5LRAyiG6rK00z+rw==
=V0jx
-----END PGP SIGNATURE-----

--Bnb/to0nkEuMkRdp--


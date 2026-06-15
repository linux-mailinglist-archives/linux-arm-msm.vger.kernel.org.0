Return-Path: <linux-arm-msm+bounces-113250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rl2PLPg2MGpdQAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:31:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4430688E46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:31:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="fKfIaIi/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113250-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113250-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CAD9D300A649
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA22C41B36D;
	Mon, 15 Jun 2026 17:31:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54673B3893;
	Mon, 15 Jun 2026 17:31:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544669; cv=none; b=M7k+IH0JWRSbbyDij5NKbuQyzPM0xFOu+DKyKeTknXF61ihe5E+zsCxz0Sa8OGRGd+7EsPiO/tZw1UiqszYdSFZ9rMzBNmDsO5mN+PKvQL7tpJLdA8iGfuz9sSw0Z5JtdFukfNaj5l5tJejvckcw4Aw8DGe2l4e36WHhLiB19Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544669; c=relaxed/simple;
	bh=1gcnEDjWDAEz8X1w4F5e5RudzlQfShoAv3p4N7kmm0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlZO5rK5N6Jsf807JPc3XQxxYtlUZmO8kgujMT0xcXacWGbm0oYzfGmpKG7zmjKaaQnjtykft5wX2GQ8b3+FKjlHAHF+96vCYnbrLPDJKVvmJjHF9qoaPhXvXAD6hgnHwlJrwA4Zo/nxqkJ854VmtU46JvCBnO/5smQjOpBaCx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKfIaIi/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6071F000E9;
	Mon, 15 Jun 2026 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781544668;
	bh=PhE8/fOoqI55ScEUuKgc/C39bxohWG7zOxg/HSra9v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fKfIaIi/gjzMJq/5nLAaudWl7aQ3vXEv3Oro5q8dM+CDFzU+ob1Z9dA9iv00w7JCg
	 r+jLmXfZUHcE3lciaRde+c5c6kSWNoIzy107BgqhOEH/NUALwEckeBwavliiw5+nmY
	 KRGyJmKGM+Qq8fKjXnL1xC9647ozhPlRjes65HSD7ZSNPvwpfqkt4q+72a8T2Ojl1m
	 GIUyWBS0JnJxFoHHrHo87F3RHF3wIOyNhwRQwvQ2mwrWNWwaB7LT3+o1MYUa3O+PDP
	 jLhkafEa6jrDBw+C2WtSuErTHU22SzejEn9zUcP/PLHU1WEkXvP6fO1EbsHmV3siV4
	 kClmBHeHdDAFg==
Date: Mon, 15 Jun 2026 18:31:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
Message-ID: <f2e9f59c-3de7-41e4-92d9-88f91955175d@sirena.org.uk>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
 <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
 <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
 <c649bd80-4bb0-4a92-bacc-949ca40a1fe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="taTBRLb945K4eoD2"
Content-Disposition: inline
In-Reply-To: <c649bd80-4bb0-4a92-bacc-949ca40a1fe9@oss.qualcomm.com>
X-Cookie: To stay youthful, stay useful.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-113250-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4430688E46


--taTBRLb945K4eoD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 15, 2026 at 10:54:26PM +0530, Kathiravan Thirumoorthy wrote:
> On 6/15/2026 9:28 PM, Mark Brown wrote:

> > This looks like a get_status() operation, not an enable operation?  The
> > enables and disables are pure clock operations.

> Thanks, Mark for the review. If I understand correctly, I should track the
> clock enable/disable operations and return that state in the is_enabled()
> callback (as I did in v1). Please let me know if my understanding does not
> align with your expectations.

Yes.  If as it seems the device can actually implement a get_status()
operation the driver should do that as well.

--taTBRLb945K4eoD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowNtcACgkQJNaLcl1U
h9CUvQf+PYJEVoTjeKw6T21LQp0lkO7Jmjwb3Bw80UHX07rexrGOKox+3gqsvdDP
tnX22iJvOBB7C29ebBB4wfN3rx3CWcgH/eOimNLrkhlxGgI0sCY2IiTaiaaYJKSI
/s44r2OTNmkLzfM9sJRRXiROMW0jl7umKNpDM4XmmgWxaprOaI48Zqq0fH84+YMX
w7yRtDPUzjnULtl+ytnqlB97v+DqwEqSyTOqy7dJQjkh8QyPBS1uUhmqgzWtvVsm
UDjaG9kyWAZpweal/06oRQUAzpivHKg8wNq1nr9cabVO6D0L9tv7lFkEX4Jwunmu
kAoiw0YiF1sjFr0Ad/sTPwFwbHwGog==
=Lnni
-----END PGP SIGNATURE-----

--taTBRLb945K4eoD2--


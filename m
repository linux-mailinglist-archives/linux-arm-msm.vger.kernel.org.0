Return-Path: <linux-arm-msm+bounces-104303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOJcMgkF6mk/rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:39:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E02451654
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B1553018753
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126653E0C5B;
	Thu, 23 Apr 2026 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4iW7twc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13FE3806D8;
	Thu, 23 Apr 2026 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944385; cv=none; b=YpeUk/KK9XOYb8OMaB21qoO5B0JqbyvzT9exF2ITOcmAuoE+04hhSia3TrKOdyJUtECiVzd1PAdQRITOpQ3I3Tj5EAVHRnbd/amPNzBgHRh2bCn01V9Ac3GBtvzhVmIa0D2RiIm3nbYjI2JserrXvi979Frs7T0OeJJ59lw+8Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944385; c=relaxed/simple;
	bh=J1QNHeoy9fAME4ob3Nw4ZtDv5x/WmKP53dNeFbT4Ips=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uptanExmj9L9V9Ffoi+uSl/yQVwmy4sle7lOklFx6SOp6spRK+N7x2mKeXizKhBZ0bPH7SvVG3P/uv7kWoH4V3J3Kyy2NSrjeIIGSU8qlS3VmCFV3mZdhquIbDkwa/obO6RSVxHLc+bYXFJa3pyKhUGvezmOiEFfrqZci+rqmmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4iW7twc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D268C2BCAF;
	Thu, 23 Apr 2026 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776944384;
	bh=J1QNHeoy9fAME4ob3Nw4ZtDv5x/WmKP53dNeFbT4Ips=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4iW7twccvf3FFuDM34CNhaVvQBhe1OyLgimuFhNTQp8LVDwMtjU4t52BNaF2SE2V
	 X1Lp/IwRNjsDm+Vfprw5bpNpUFzmR9eRiHywNFqhucMbQ1lcPkC9dPfNBGuE4SAICD
	 S7960bTo+IipFwqn8g4jllboiiDlSMVCewJLKyBfcBSCbCgNYfkGQ7Fh/7gZmB24Pt
	 3hL5/jpYGttbKzwJeCP8QlJOpj8cPdUqKOOBaP25oiyOJfb5qyrFFlfA65uM7S7a4C
	 V6jNh1S9Nhh+noWyj8LEsSEbuDNJd4DeP6jXo7a3JXNIfvJCXlJsh56pTKcWVTTEtW
	 bfZKgUk1kh80w==
Date: Thu, 23 Apr 2026 12:39:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
Message-ID: <1bdcb9b1-c703-4a7c-a740-06f237bacfd5@sirena.org.uk>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
 <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
 <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
 <8ca34203-68cd-4e5a-a4d7-de36c0c35f91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NfVQflrxZ6SkiTkH"
Content-Disposition: inline
In-Reply-To: <8ca34203-68cd-4e5a-a4d7-de36c0c35f91@oss.qualcomm.com>
X-Cookie: I'm hungry, time to eat lunch.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104303-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37E02451654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--NfVQflrxZ6SkiTkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2026 at 01:20:01PM +0200, Konrad Dybcio wrote:
> On 4/23/26 6:41 AM, Viken Dadhaniya wrote:
> > On 4/20/2026 10:14 PM, Mark Brown wrote:

> >> Does this handle missing qspi-memory properly?  It's not conditional on
> >> the compatible so it'll run even for existing devices.

> > All existing device trees have been updated to include this path,
> > so there won't be any probe failures for existing devices.

> The problem is, not all users of the new kernel also update the device
> trees

And also the binding says that for some SoCs there's still only a
requirement for one DT to be specified in the binding IIRC.

--NfVQflrxZ6SkiTkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnqBPoACgkQJNaLcl1U
h9CuhQgAgqlQdZ7ZPRmVhv4gPsLaBBNFsHPO+x4PoKupuZyK0x+0+R/efpvIRp1r
jyHsumqv69C1Q1CQKMA4dkVMOj0IuTq/qriU+2aaiQl6yxG7IuHTMxfzx7n0cljH
PbUYVVfmtiSYWPXMzUVfVbSoBfQzE3IbJWPtD1qXXXm12laPerAkNerELJD3/pW4
6ChjpXDaDO6L6VpTSuy1VHfbnIHWAvyOIRODmITQTCnK8lkGQmgkUp8m2MfCMPYt
95ZEQgm+wcGDJQNplqsvCRsyueigXe9Quon+yeuptG0dZeIN7/geXsuSwsHRi3WD
zt+PhNIc2qOBl9j7imWxyEZPckyk4g==
=e3MG
-----END PGP SIGNATURE-----

--NfVQflrxZ6SkiTkH--


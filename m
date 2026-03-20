Return-Path: <linux-arm-msm+bounces-98974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPOQENq4vWnyAwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 22:15:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F02E12D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 22:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42AFD3024B18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 21:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09317280A20;
	Fri, 20 Mar 2026 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vg8Hpznx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B6368971
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041301; cv=none; b=sL3j7HF9HzD7lXt8/Vs2GFpx8Fjk1MFsjBFN6SbxVpJomLagZ6HCGfy/zBl4oNnxguJCDB37CUvMtT8UXmsi+zagb5ACF0VLZO1qfjQ85M7Axh0659OhS5TyNzsb+pJjc+gcXizXIMfWtfetQMf6o3x3y+RjLwhzWh0cV8cmcO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041301; c=relaxed/simple;
	bh=gO5UhDNhFn1ojze5ogbDG991DIMWJJB4bmVCCn865V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3tjGHyT+jrbSRqZYET+JEnLz1OTnmjkInM/Zg75u4DIZbCN6vsXRxaAFPaj6Qraa8JCfdbvuJ2yF9Ez2lUrWTQYba5crTU/WkqtSqKAebWri/wnX5GC5s1flzbwm+XDEJ3IghyWN76m0WmYIoHaJI0zsF5Grys6w9cPTrpyVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vg8Hpznx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gO5U
	hDNhFn1ojze5ogbDG991DIMWJJB4bmVCCn865V8=; b=Vg8HpznxbbPncQ+oD/Gx
	uTP5MuK2gtU86+BgVaiobyOxL8/V9XpjhGfjc6upZK7XfpS3mK5lmhDdnXjKCTT+
	sseSWGjuGE6HwOpA0x+zneOFN5n92Un2kDDiSGjYbK0pDxLSolYzwKf4HsGxHTxU
	FkDsKaN/eXTlf0QJD48IHx9aVapCKYsr5LQS1B1e6JOkyLzaVDo9RcmuMqSik1gt
	A1PwN4asXfybC3B4CtJ2VWqTQogCu0ui+gXMOe5IZ3Akfs6KxJUuoig1Vh04cLhT
	nHW1Waaurbcvn0o3hzADqRTAdrsWcTnDE9G/4ysCGodYAdWac+eIvEsAvXJscqHe
	Eg==
Received: (qmail 1698466 invoked from network); 20 Mar 2026 22:14:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2026 22:14:48 +0100
X-UD-Smtp-Session: l3s3148p1@z72LLHtNjoEujnsL
Date: Fri, 20 Mar 2026 22:14:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document Milos
 compatible
Message-ID: <ab24w_ESHK46nG8P@shikoro>
References: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
 <20260320-milos-cci-v2-1-1947fc83f756@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pD0ll/xn1Oqxasoq"
Content-Disposition: inline
In-Reply-To: <20260320-milos-cci-v2-1-1947fc83f756@fairphone.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98974-lists,linux-arm-msm=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD4F02E12D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--pD0ll/xn1Oqxasoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 09:09:49AM +0100, Luca Weiss wrote:
> Add Milos compatible for the CAMSS CCI interfaces.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied to for-next, thanks!


--pD0ll/xn1Oqxasoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm9uMMACgkQFA3kzBSg
KbZ0tg/+LUI3JxaBw5Qt8zsyDLp5qi5ASZQO/aaaU4PH8JR1EuCcV4lnbEDr9TnH
85Z88F4dpUstC/vB8OXPpU0pZbOvQiq2NFQihiGA0Lq0oqiylmYDieJxiVZGDjwZ
U4WpM91KThPy7c9wWFFV24XcPTs5YFKcR7nYi72O+ukGePF+31CrTFRgmbay3C+y
Fb0lqtY7rKlxvlZP4qhQRNOuhlfwH/mJkpCvI8FzQOe048Zf5hHq0p+Un+Ndap3b
C98q2HTTu+UOFNVgOqEIatFKBtZY2GhLenXwCmCtuNDJW7XLeUfjCTF8eAnQsK1q
eG7ZJmzLR5KYI5ly/BlSDefVS9Bd7cfLtNnaGDDhVLB25Vls9uT1F0mAeXDVu+20
j796W6D94GInA0PFdOHB8Hh7r0GHm/zfABI6yuE+8e1W5oILXyMj92SDup7ktKEL
WcNRpDivBGof2aYmcHkXF54zGULcctuYNrbNzQHi89+NQd1+u57uLGgBgREMbwK5
EVTUGmjn7yXNStuWTmHghj/hkNWVcOcGVw57p1zrJiL1MK3Dwiw57FsR2FMhohzp
cxaJv3Ky5EDsbFh1ON+T59UFXp7Lqr5LC46AMxNJ3Phpi5leXT8iQb+KY3jG/olL
iIMRTua+RFtyfw4Stur3reyPB60d3lfHkYZu7Q7RybCs99y9ZtE=
=sp0J
-----END PGP SIGNATURE-----

--pD0ll/xn1Oqxasoq--


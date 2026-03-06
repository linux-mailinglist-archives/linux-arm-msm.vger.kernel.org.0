Return-Path: <linux-arm-msm+bounces-95724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEP3OaSOqml0TQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:21:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA021D002
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDEBD3042FD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD933783D1;
	Fri,  6 Mar 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEwP/G1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3E372ECB;
	Fri,  6 Mar 2026 08:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772785294; cv=none; b=kwMr7VOPS2egqdtYNyoszDr8u143Jp/13X6zZMjH4SzYq9i4SKJt36CaSX86+D1pejrzfeyx2NUWS9GEPGKIT3Z6e7c5VSAYtOFXvdXXUbwiDFuG18HoSuNlcYUomYinRcuWp5juDy1vO+IhjPFf6uX+fotmMN+uy88EP/ehDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772785294; c=relaxed/simple;
	bh=EcF0MkJ5o9gNfz2bw6h6/+Dj84U0l2eN/i4UbSOgFk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sW47bpu9M1RpZwKAVdYgOSeX2bNh8FYJDFyMMQXXRr40oZicHkFDcRulYsnksxf2vsRmZ+N2GRAw8ny9tfWadIUCqx015vWJ3OM4DsntDehaazSkO2zB+KtggRun49FDIQMZsF0UXdwKOpjxnH+m8KjHrDoj1ougJfUJa0oOH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEwP/G1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D25C4CEF7;
	Fri,  6 Mar 2026 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772785294;
	bh=EcF0MkJ5o9gNfz2bw6h6/+Dj84U0l2eN/i4UbSOgFk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEwP/G1i1K3PIVyfkWQpGJIb0cBlheXxLyyRSsBIfdXkf0D59aLae/TTr+1G2Ph+Z
	 vHvnp8Co3wC1uk3JVlLmsNEqAheu+fWHb555mto0lhJOOVB8Dj+xbK1UUtwT8mY9Dy
	 6IX+YePxK6wvyGb9rz/rqm304DnREbdLBM8hodeGEAevmjbRvEUtHLgD9X5C0d/bpM
	 R4t+2lqZDu3R3mh56sHlUuL78OTzNXxaEs3nAqRjyfIoeAxN4qU97ueHW97vjrOdWP
	 /+yGmrjWPh/7g7kp6Vd109k6twUU/KeSISIGajQUCxPs2fDwfrcw+aDM007RM2PT+y
	 QkXJCP7ixfEmw==
Date: Fri, 6 Mar 2026 09:21:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
Message-ID: <20260306-juicy-mottled-woodpecker-692b8b@quoll>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
X-Rspamd-Queue-Id: 8DCA021D002
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95724-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mainlining.org:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 06:28:33PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
> it can be commonized for avoid unnecessary code duplications.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi  | 317 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 304 +--------------=
-----

Difficult to review. Use proper b4 configuration or flags for
format-patch to generate rename.

Best regards,
Krzysztof



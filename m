Return-Path: <linux-arm-msm+bounces-101970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LHYEajR02m6mgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:30:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9444D3A4BC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65D7C301BF42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431151514E4;
	Mon,  6 Apr 2026 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="FEdhD5UU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CFE258EDA
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489425; cv=none; b=cmDS8HPFfRpGvA3hFFMxKdLyWoUYjEp+cbJMqgJBRzXdHwXJw4aRECNRJoi9n5djs6sdXc8NvTZEqXQKGXDGI8JT/TK+IlzEjivjhOUSbQkApxwfe239HY7iodtuPqCgoAc0nuhYAn/zxBMQ5C5iRNx2zs1g2PQHoU9IJxoJn30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489425; c=relaxed/simple;
	bh=qY8HXRLd3rg8UeZmh2bcc4S7RvrC1Vew4Crqm0UVq88=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=ncjmK0ot1tw+KNr6+9xvZWSuT/QkhWoCl8Fhb2RqmAUBoL9pxlotlcChLyUNJHFskcIxvz6ClSvbEEq45aanrYN7amVA+Cg1UiuCjn6Hi2DZb3dwwyRmNYmPkSXx/LWoffi2wiW/ndPTNstVoe1u7LBRVxDsObFERiptTFdC1J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=FEdhD5UU; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775489411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cl3MtyC0ml8bgrz0gHQfCrzWUIfK4oCJ4cASNn7ldtc=;
	b=FEdhD5UUJEAxm6EKJXJ0/H+8PuEjb+nCod/U7iJixCFyku4NCJ7wfxD/pB8W2uu6tx89NZ
	ruOIcWKXsnjNDFf4xkyOPRay87EHEcRsH8I1AMmw66PI92PAZ/CnOEJRWRrkrxb+EX8yXO
	QJUA9r92sqSTkwMSrZoOYVFKcXrrjbqLnqpZD/I+UQ/IRy0trZpZSkuXhWcOj8AuxRcdsY
	Ol2xr7blGEOxpvNhyz0Ead8/Y3c0J6ya6JZMsvmRaL/YKLHPKbh/3SmlQbzAd/n0tHx9tA
	hqd4UsQH432TJfB8SzCs2f3xMbjBDDsoz1RJGKPxU7mY73gvoR9OXbX8ss8PFA==
Date: Mon, 06 Apr 2026 15:30:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <f63f25751b5db2ee5420ec4c12e36271ca22a864@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v7 00/15] arm64: dts: qcom: sdm845-lg: Improve hardware
 support in devicetree
To: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, "Amir Dahan"
 <system64fumo@tuta.io>, "Christopher Brown" <crispybrown@gmail.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Pavel Machek" <pavel@ucw.cz>
In-Reply-To: <177541802142.2061229.9094394728986735362.b4-ty@kernel.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <177541802142.2061229.9094394728986735362.b4-ty@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101970-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com,ucw.cz];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:dkim,postmarketos.org:mid]
X-Rspamd-Queue-Id: 9444D3A4BC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

April 5, 2026 at 7:40 PM, "Bjorn Andersson" <andersson@kernel.org mailto:=
andersson@kernel.org?to=3D%22Bjorn%20Andersson%22%20%3Candersson%40kernel=
.org%3E > wrote:

> Applied, thanks!
>=20
>=20[01/15] arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
>  commit: 6a9e8df732014c1c758bd3cd6254b5b4cb273c7f
> [02/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change =
path
>  commit: b9afe8581c0e14b7b56e2314dc7f9597bf23ef67
> [03/15] arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for ju=
dyp
>  commit: 8f4c53ae286bd6a113245ad53ce957e623374cf0
> [04/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
>  commit: e9f611de7ab51540c0cf246df6b7d4d99f4cec64
> [05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma c=
ontrollers
>  commit: 4ec3045c969a326c458c53ca65bde5749e575d52
> [06/15] arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
>  commit: e746ed5af3084e9534135679c55e69eced0c657f
> [07/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger
>  commit: 995c258982429db93db103fc26fcb3a0acd6a5ee
> [08/15] arm64: dts: qcom: sdm845-lg-common: Add LEDs
>  commit: b49722c8a18cdd11f49357f3b8be23549f76a506
> [09/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
>  commit: 2e7cdd400b6a4e67c27fc3e839342824b51d01ff
> [10/15] arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>  commit: c6c66aa3ef33dc3076c6dac64003b29bd9515b58
> [11/15] arm64: dts: qcom: sdm845-lg: Add wifi nodes
>  commit: eb8fa32085261a07d763e9d616b3c206d0be82ff
> [12/15] arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>  commit: a5a5ad9848980e1019ca841fe057afb83debecfa
>=20
>=20Best regards,
> --=20
>=20Bjorn Andersson <andersson@kernel.org>
>

Please apply 13-15. 15 is the only change in v8, so what you've pulled he=
re from v7 is fine.


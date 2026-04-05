Return-Path: <linux-arm-msm+bounces-101893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLGrEoC/0mnOaQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 22:01:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E0539FB05
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 22:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6272030053A1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 20:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7982FF161;
	Sun,  5 Apr 2026 20:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="FSN+apLq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413D91E520A
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775419260; cv=none; b=WmNCZ0X8/U3TEtdtCq++IMQz16SjKo28JRkyGqhLv/oNX3oMK/28zeX2Ata0rZvfg7ILsCd4X5bboP2ZPvys9e5KxCkHLbtfedAP/tk9xtNGRj5v4/5b+jhjRUvLsqbR712CY0tnDGshTPzWUL5nQarfggv8kyBQNJPimeQkRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775419260; c=relaxed/simple;
	bh=ZiDzvy9g8YeHXrCmFIA1c5UVC87GbHKPehKmuGItu2Q=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=faZAOpCFJ5m4rceEa64ORiybJM6tszetE4re8Bar1Y5UcRABgfbr4swwsV8J+Ockd0U4bvfcSL3xCDOR6JTnd3IZeUpdtnB9on2sfWR/GXCwV1MUpHzuvdjrK3Z6DopkWB6XVFEFRgdfifzkD2kA8YOgJ6d+qj8FkCX/2zUt6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=FSN+apLq; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775419245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FtQWo7SPBOy19WmyZnDtoAnLJVMVBtDnao6e0gn/1ds=;
	b=FSN+apLqcH/AutdytzyxoMspUV7oB6q+WSduFxE6RBD/J8v+kB2YVSgPiwqGoNNKf4kZP0
	bj5BWNziET5fNIwYw99gusWPEXWa9ZjtIoYwLtNexYjRjJD/fv6oef4Vg0T8A5PpHpxvwA
	63LBy8T1485OBBq41Z/ysqREDa+pnmYDPlAGlNvSiNdVtkmqUnG04D9aP8GwjZYQDs/c9E
	uVYq77FOGzrgwXu8bfzVRcx1jhKniXbhrkmeTVlHFKgaO7BmgbQ6GGxfRGyXjXFcCyK9/D
	Q9YpisMSxleDIPPtmZotma1x+XHUSvorYpyfZeD7MVfKk805VgwV0w8GBFH96Q==
Date: Sun, 05 Apr 2026 20:00:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <842023c40ae28b529f848e50d46cf589c09f3983@postmarketos.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101893-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:dkim,postmarketos.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76E0539FB05
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

I'm new at this, so there might be some mistakes/misunderstandings, but I=
 sent a v8 with 1 tiny change for Konrad you might want to apply that ins=
tead.=20
And=20also the last 3 patches that got stuck in my mailserver didn't appl=
y? I resent them manually with git send-email.


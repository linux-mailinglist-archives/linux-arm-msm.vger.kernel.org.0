Return-Path: <linux-arm-msm+bounces-96461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JgNEjuKr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:04:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D59D244973
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D6F63006986
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D4B3A9D8B;
	Tue, 10 Mar 2026 03:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PvRLIoBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AFF3A9D8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111847; cv=none; b=ISsdEWZ0J/NmmpKcHO29dL6s+0ECFJmok3RcrZEziqhHZdvuyr7K7HM5n68x3mnVAmUFPuXQYwvWsgLNklAfPNS2w94u8wi9FHtCc2mKqv1TJIZEJPBg/Qh1WUJVBKtLpQCuFFOQyr1B+t1QUQ7ng6mmB4KP5P8+TKypySuMMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111847; c=relaxed/simple;
	bh=NrXMG/PPFGP1ghSiTP1PzvaMNUMKSfTfB+NTUwCFKmo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FRmEX7uOg5J5gyq7ILcY8lL9Zs1Tm8pwSi1hhEKTGrPl1Ug6TX253ofa8dc1t45884ofcL6YI9JBGdUB1Ibhngw12JiekTcBFcujnp3iV53ZSrQOI52a7XXcCGz+YIqGjYgtWYLRos60oxC9ttLkru0CK/RNd+rXahb1FBXEr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PvRLIoBO; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773111844; x=1773371044;
	bh=NrXMG/PPFGP1ghSiTP1PzvaMNUMKSfTfB+NTUwCFKmo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PvRLIoBOSfEfbDCDndyVEmpV+QhS976k0LZlQliftIcFv5bRvdPQOc4SLhCdfGxnF
	 YE3fcqUtDmwIv+K9cAzJ/5wNkp0Vm3Apw/hbd58a3dwa7PjiPsMUIgQ/bOvTZRbXJN
	 6WJ5tvDaRmoIaDds4rl7mzsaU1vVV2EhHtCbtaf84FExlp/u+PHvTYIrXG+0vfmlID
	 CE0/XkWZyiHK8nSgLXxhmeJyPKLAvEkHYdPOizLQoOCt3Ntqsutiw49daF7ZB4hnqm
	 pwZPaw3S1b1MO4vY7LrryWMjQXP0RDrTGqJiv1kCXWssi5+dr7amkqHHW8+hUlHSJs
	 +vxNCw+WOCDsg==
Date: Tue, 10 Mar 2026 03:04:00 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add ASUS ROG Phone 3
Message-ID: <aiez7cEpph57bS9vjzZt-ebtJRL7riKay60UUoeOmmzENyeKmvzZkc-ecTQcXjkb0d9RvfhONW4OOeK-3TgtxWy16LkOH-TRcQUq6XoDafE=@pm.me>
In-Reply-To: <20260309-rapid-kittiwake-of-justice-ea5be9@quoll>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me> <20260308-sm8250-asus-obiwan-v1-1-3c72941eb796@pm.me> <20260309-rapid-kittiwake-of-justice-ea5be9@quoll>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ec80a8adbb0ad3664057b2ec77b17e964b27721a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5D59D244973
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96461-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Monday, March 9th, 2026 at 3:59 AM, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

Ran checkpatch on v2, got a few warnings that seemed like they could be ign=
ored
given context but let me know if they need to be addressed:

Asked for MAINTAINERS to be updated, but from what I can see there is no ot=
her
sm8250 board that has a maintainer specifically listed.

Complained about undocumented tianma,ta066vvhm03 binding, but have that
specified as a dependency in the cover letter so ignored it.

Complained about undocumented pci17cb vendor prefix, but this doesn't seem =
to
be a vendor name so doesn't seem like warning applies? Also already in
sm8250-xiaomi-elish-common.dtsi.

> Best regards,
> Krzysztof
>=20
>=20

Thanks,
Alex


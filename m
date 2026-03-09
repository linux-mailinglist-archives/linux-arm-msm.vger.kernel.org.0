Return-Path: <linux-arm-msm+bounces-96157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCaVIu6ArmlfFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 09:12:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CDF2355F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 09:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FAF83029A76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 08:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1128A36B061;
	Mon,  9 Mar 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="jbZ2xgFn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C40D364024
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043731; cv=none; b=OP3NemrRngp7H8NK8kQMqUxBx4dTMXoocLvwqyFY0TUM1P4KQh7ilc99abe8XcqJrf+FIGbIAMBWRalNqTUx6VqePm22ILV+PryuIA3SSxhSYU4gRheGnzHkrVQtxg82xwUdKI3IsdpYCQldP26QKNBU0OOr4NhLZ6yRy4gvBS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043731; c=relaxed/simple;
	bh=yaBtMW9JGUwb77xGShB/9gW3SrXB1Su8/qEdx8/j5uU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXcqSFp0MYYEqgfckdudVrrQJaWJJp76VjfgFhnP7VmNxFjEg4z837nn4qP0jnj0B6NazrtzsGN0B0oHb07s2UMdWEpLF+pSbDHaFMz1wgZCzTD5yxt9gCWo4SnpdWyAMbMP7m7HVQCD+9Iuuwp+dRuf4ksUobahBI6Mg+yuhR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=jbZ2xgFn; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773043721; x=1773302921;
	bh=cygezOMdtCf5kGQwAmrbWXBh1wLwpLmYehIZoWuwRq4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jbZ2xgFn2ytT95fpsGr5d31xHGAJB0B1hUrw8HM3gLmQUdnBpLCrZpAoK+4Uil4Su
	 w+7iTii/6PbZfzCW0IDWc4O3y77YqiMqCrOTPhY/Ha1/TEez85hdicPouI7EsQPOyr
	 rhWPMjzhOX91gpc8/GZ8bi9kZmL4BsgplXlJTZnykIPgabLcgBqagyT6Fkpi0Ws64c
	 JtLDi7p22LfQjV3thtnZ41M3YbOD6W2RXft9aCrCqWMD1o73OuvSVxsJTnBS8+Q971
	 L2uuKhz+RI9Ns2AsBn+muzEvmFBg096l3q9XiOLDV/gWSnyx6WnTzSeyOTfOQGIpeg
	 +eJ7jFFp2xJ4g==
Date: Mon, 09 Mar 2026 08:08:36 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8250: Add label for reserved-memory node
Message-ID: <NyBYVOuujgzbrN9E_Y1pYyOJMgys_1tE2jUI80-mtjgzxXUCQLaw1ZxuGVPpBANTMTQPsH7OhUlxkSRt7b_hiekBLuzEgPswCGy3_MqT5tY=@pm.me>
In-Reply-To: <7641f6c4-6d80-4d62-b963-734371b14750@kernel.org>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me> <20260308-sm8250-asus-obiwan-v1-2-3c72941eb796@pm.me> <20260309-orange-coot-of-speed-b3fa28@quoll> <7641f6c4-6d80-4d62-b963-734371b14750@kernel.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 55ea901cab488ea38d63b864a86410ef09eb8553
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 43CDF2355F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96157-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Monday, March 9th, 2026 at 4:00 AM, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

> On 09/03/2026 09:00, Krzysztof Kozlowski wrote:
> > On Sun, Mar 08, 2026 at 08:40:38PM +0000, Alexander Koskovich wrote:
> >> For some devices it makes more sense to just redefine reserved-memory,
> >> for example on the ASUS ROG Phone 3 it is completely different with th=
e
> >> exception of hyp_mem, xbl_aop_mem, cmd_db and smem_mem.
> >>
> >> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
> >
> > Same comment as before. This makes no sense as its own patch.
>=20
> And this is v2, not v1!

Are you saying it should be fully included in the ROG 3 patch instead of be=
ing a separate change? Can just include into v2 of the ROG 3 series when I =
resubmit later if that's the case.

Oops on the version, should I increment version of a patch if the contents =
themselves haven't changed? Or is it just for any resend of a patch, versio=
n should be incremented?

>=20
> Best regards,
> Krzysztof
>=20

Thanks,
Alex


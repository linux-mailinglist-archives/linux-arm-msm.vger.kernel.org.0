Return-Path: <linux-arm-msm+bounces-94974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B3zBUCopWmpDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:09:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2971DB7DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 16:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C325C3067085
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78065430B97;
	Mon,  2 Mar 2026 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="M5tdeETq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E4218AD4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463676; cv=none; b=rAxDUavEoIRyTDZ7qsr9vYrwD/kwZH5Y6NLgyPhxs1JcneJBiM5XwJVB99MS1cnjDk+nm9598FkF+/Y0LAYRcRV+roVpfufjgH8Jece7QZTWBEmgmfpoEh1eg+rZ4CVOBpl8toCjpAlGNi3Damoh0OWI8/7F3mMXdA8Z+fs51/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463676; c=relaxed/simple;
	bh=pisXnXXBPQdwapUXns7sN5uIBljzosgJQwotMERG0q0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ck5nfbBV1Ar6h9rLRfsJ4l9XATn3sm9sIML8BrPyWi6J1gm0wV55W20ndLn3aKm5Zc5Xh82cVZ2KrglP39zoUuwHVVZPGWPkPdCihDfL35Fa+W0QhEoOfhXK0j0Akq0WRyD9f/HLbeHbzMHEsjI7QP/ye6c44AJO23z5AUlcqjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=M5tdeETq; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1772463663; x=1772722863;
	bh=pisXnXXBPQdwapUXns7sN5uIBljzosgJQwotMERG0q0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=M5tdeETq4o71gby/8DPVOrc9Uctf7ZypUFiqj9uYtKrSBFbdHQRuqr65CNPNrOaFF
	 tuLpnnDxe/Jl8EVGkLZ9yHSDuWwIdNkIVl6aUZ9iJ7Ln5kZXh26hpZM1OvX8l7UPa1
	 jvwCY4uq9sUuyqrgNCgiaBxfSTJOGPDogUKzA8jvP9MpCvPw+ld3rTUrZHPpoh8C88
	 18IjF3A4m3Mt3YGQ4dilkH7QwjpRn9C2eeuTH/OHGwWEiMWs2CpEI2DUnRWdtaUXSr
	 b/QIN98a3GweaheFm6XO28+ElcE5TkXMbVI7aZsP1Q0qiJX+TSekmCBsZCYjRWzvCG
	 u7zn7icfeGhiQ==
Date: Mon, 02 Mar 2026 15:00:57 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org
From: Tj <tj.iam.tj@proton.me>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: qcom_scm: page dumped because: nonzero _refcount
Message-ID: <3e67a37a-3a51-40e6-9608-2641101b6ee5@proton.me>
In-Reply-To: <06ddefe3-2048-4e79-80a2-8d998b2c6a51@oss.qualcomm.com>
References: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me> <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com> <94629352-595b-46bb-9c11-505aa9db0a1a@proton.me> <cc10cef2-f032-460c-bbc3-2ec9b5c922c0@oss.qualcomm.com> <8cf12905-8221-4f4c-9158-42984d26b0df@proton.me> <06ddefe3-2048-4e79-80a2-8d998b2c6a51@oss.qualcomm.com>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 759111b89cf4470064ef2cbb06215b89444ce387
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6F2971DB7DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94974-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 02/03/2026 14:47, Konrad Dybcio wrote:
> We have this line:
>
> 0x8BF00000, 0x0D600000, "PIL_REGION",
>
> which is a big region for all the remote processor firmwares. This
> unfortunately doesn't tell us where (and whether) the IPA FW specifically
> must reside, but we can take the conclusion that it's at least not fatall=
y
> wrong.
>
> Please try just disabling IPA (change status =3D "okay" to status =3D "fa=
il"
> in the DT file) for the time being.

Disabled. Leads to a couple of different traces I was able to capture in=20
photos. The images are 3.2MB each so not going to attach them, but if=20
you have IPv6 you can directly fetch them from my workstation. I shall=20
send you (and anyone else that requests it) the link privately.

The first is timed 145229.




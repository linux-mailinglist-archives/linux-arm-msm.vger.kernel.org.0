Return-Path: <linux-arm-msm+bounces-109688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CiWIRNuFGoTNQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:43:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E19445CC6BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E519830547D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602AE3815CE;
	Mon, 25 May 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRoC0Fpx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CC2F1FD7;
	Mon, 25 May 2026 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779723494; cv=none; b=blRDCXjGormD+enl8PCBoAmCvGA9SFEj8RDRaZZSOym2TdDFbPhVZFvkPHbQ/Y3z6z7m3owAVM4YedFTE9aDRkQYp3KF+cnovvT+l7PngOG9x8hKifWKW3vG4Lxq3bcROg+0W8Ld7zACQbdkee4LaG3zmDj9Ev1sR5qZynUbj4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779723494; c=relaxed/simple;
	bh=cYDr3PI57IuEP1yW4cs4iUEPUJC/JBk1R8fWP9DDJLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m2wl9iVI5+L+O3jFjG39BrGGSpZ6Az0YzO0CpeccQCbUmRtpKEbDiejxxshwk5siWdnR+eT9T+827ZJ0EdJV/i+5aJze4XFVCwhP5gOaGT0fTyvbE5iEVJTE7QoLY3ZI+i8wGkt2NC+gw+cVpS6ieWVf8xfaY4WZXq4MrrfQedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRoC0Fpx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087541F000E9;
	Mon, 25 May 2026 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779723492;
	bh=cUAd+24vz4IWLOip9+kJ8wK6kV0AFAOd4DONdYwQss8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bRoC0FpxdJZGWUxROzmBz9PcoqVUkYva8egIZ5+uG5EYt5zTY7GUhXMrhEmO8ub+8
	 Wu9tEzN0avsjUmXE+eKBXqsGX6/KClRyaH07yKSS5fNXeXOU65J9SLGcYbQyQWrsQ2
	 Gq36P8gM+CAbM0iccP7JUpNTMU62TWQImlaY54F2wRjYQItKZ1D2F5FI64WfH0Kreo
	 3Awo1dBOzwtiKNpShkVPfO+9bKZl4CoL3Nr5EMxfFNPdUziGyu7wA1+vS+zpjAK+bG
	 c+EISUJkMP4DRPleBOZ+M7YQTX1IBe46DWhWjnoORmxDMdxZvyMkHYyRwDfXhRhOFl
	 BB1jlF1yMsaCg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 val@packett.cool, mailingradian@gmail.com
In-Reply-To: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] ASoC: qcom: q6asm-dai: fix error handling
Message-Id: <177971321403.58460.11334167924852239986.b4-ty@b4>
Date: Mon, 25 May 2026 13:46:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cYDr3PI57IuEP1yW4cs4iUEPUJC/JBk1R8fWP9DDJLs=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiyRnEd1D3N6y/yCT2/l5DjiejPZ7Fv11rNvJvq4/+mJU
 Np7t8Gnk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYiG8cB0OD0ROPdJbEDAl1
 oZJUvvO83eqn5ois+JKb2/Al620E89JqkWcCRpfYt3Ma3eY17J/6Scuw2sRCXMQ/toh1T0IUy3q
 xMu68lvxpP9uvVbG+LpD9efgMuxGH+uS3OQpJLmtMmFfOWFW98djmDMlDhuven5p9Rqst4N72U5
 P/rKi5UfJMNtNPcadiS8Cp5Z6FZhEaftLTAsO4dOamrn79nfn2wpltIswSNa/Tb034J/vwxCbmC
 Fkp84SrJ86HlBqF+Hh4v+aIedy5P9BajWte0mOBBusDso7/mhdFe1m/mTOjsqakdv/2Div92K+f
 r7ndYVP5fJLpo1NRwv5n3/7PsZeXshL9zdcR69A/4ed7AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109688-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E19445CC6BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 09:23:42 +0000, Srinivas Kandagatla wrote:
> ASoC: qcom: q6asm-dai: fix error handling
> 
> Here is the set of patches, that fixes one of the isssue reported by
> Richard Acayan, while doing fix for the reported issue, found various
> other issues in the existing code.
> 
> This set contains some of those cleanups along with few trivial coding
> style patches which looked uncomfortable to read.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/5] ASoC: qcom: q6asm-dai: do not set stream state in event and trigger callbacks
      https://git.kernel.org/broonie/sound/c/cee3e63e7106
[2/5] ASoC: qcom: q6asm-dai: close stream only when running
      https://git.kernel.org/broonie/sound/c/048c540ee76d
[3/5] ASoC: qcom: q6asm-dai: fix error handling in prepare and set_params
      https://git.kernel.org/broonie/sound/c/4b4db09f283d
[4/5] ASoC: qcom: q6asm-dai: remove unnecessary braces
      https://git.kernel.org/broonie/sound/c/c92d880cde73
[5/5] ASoC: qcom: q6asm-dai: use pointer type with kzalloc_obj()
      https://git.kernel.org/broonie/sound/c/909595c288af

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark



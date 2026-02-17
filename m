Return-Path: <linux-arm-msm+bounces-93131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEECD5dSlGlFCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:35:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5C14B72F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EE6E3010791
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FB833439D;
	Tue, 17 Feb 2026 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSCYsFIB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F271D33373B;
	Tue, 17 Feb 2026 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328149; cv=none; b=sqHE7tSPfhqcJVy/zNShFdA7nesaxaABNsVE8Gy0q0W1Ii8Kks5OWTGYyNbJeTdjJQHvkfQeIQhISrC79biNdk/WKdZQf4Ede5mAF0hv8upZhAS3aX+daX6oO5BbzbpXoZAyF86rWz4z2k6Ll1z94qJ/T2MvmUM4LQzAx7cQ94E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328149; c=relaxed/simple;
	bh=s0SYbDrrnZrLZfPHiZPzCoZQTZSDIN3KASbQJWOqObI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uT48AJKi6u9Nj0Zlt9Wv40xhLzpvDIU/nDj6FyC9lh4IsNnI0E/XGNTCdRxGNlGAr53tb0a0r7XeopBUDPT5mMGgwLkvrZCMch7k6UaxnTb1N+RLweYtp3KhE6bqm5gqk2143MGLs7arDHF1BQbbvy+xKOKekdVEuqN2QcVwpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSCYsFIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6ADFC4CEF7;
	Tue, 17 Feb 2026 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771328148;
	bh=s0SYbDrrnZrLZfPHiZPzCoZQTZSDIN3KASbQJWOqObI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KSCYsFIB+X3jEzsPOB45RAWtmBkw9Hnoz+UnlKKaK57hJMm+n22Sc3tkfVCI4QTyj
	 oz5ts00cPFofayqHl7cYiTgEbCyrfvgCw2SXe+3DPOs7Iem+Tu+MLZh7p1ORJzZsbG
	 O186gprofajpy6/nICqraYZO8SH8Vz80BnuRXcZsFiH4fexmgdUMXPWzbOd+KcLQz2
	 ClNVFvGOm437TYwAxEw9LJ6c/auM+xQcVA9VjfS08kYKanWL0wnCL3JdUcM8hC6jHD
	 LgtG2+Q2eAj2kyGL9dQgOQkCIzTvF8rhdX0FH37e1Uq9AhNJiNhCbG+5te2TjfYuFt
	 uNTBSU5IHfxEw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
References: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
Subject: Re: [PATCH] ASoC: qcom: sm8250: Add quinary MI2S support
Message-Id: <177132814641.11429.11218650201291165140.b4-ty@kernel.org>
Date: Tue, 17 Feb 2026 11:35:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,machinesoul.in,fairphone.com];
	TAGGED_FROM(0.00)[bounces-93131-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D0E5C14B72F
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 12:30:10 +0100, Luca Weiss wrote:
> Add support for the QUINARY_MI2S_RX which is used on some devices to
> send audio data to speaker amplifiers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: Add quinary MI2S support
      commit: 957e5be2e1ff10d4b5e86d420c12580897069114

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



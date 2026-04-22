Return-Path: <linux-arm-msm+bounces-104172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHGMN5go6WljVAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 21:59:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72E44A591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 21:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2750D3012211
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B563F210B;
	Wed, 22 Apr 2026 19:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8cYEcyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A03F210A;
	Wed, 22 Apr 2026 19:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776887895; cv=none; b=MHAJbLTWaNmqqXAjxCr0m15MCbeubvQ/VcjXZWvH/Eas9txhdbXNOt6+O3mjkzKAuaU7XpGfjrOhkOkdoLbd7CVF61KvA9Abwr0Cf9qqN7fG/x1WmGdjkbBoDI0gifdCnzVIQlC8GOlYEoMtLDYiI05fksFqZPRjyf21Jb3N8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776887895; c=relaxed/simple;
	bh=LYvVyC78e037bReXvjd2uyLs7TRcgWQ1/dWq77r4RAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gVfOKM8URDEe0mXjiPC9sDRFXlYlgVd1CM5xdy2KoXRvuatFbJLjeTmNf4swyRWJ1wAAwPsNnLRHXCO4FzpYOu3/fLue/xUav4YvbjMhNpBnvtu4RSc0t8+iMPqmhfmeBu6Qx1kMRCpBsaqW7OV+2KSYuRAc+AZ/EmqpeP3cju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8cYEcyD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC0BC2BCB4;
	Wed, 22 Apr 2026 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776887895;
	bh=LYvVyC78e037bReXvjd2uyLs7TRcgWQ1/dWq77r4RAo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g8cYEcyDw3XK9v/hkWE5fkFprDngOjqLKILR7aBJsntj8be+BpBCgfp+wDdw1gGw/
	 ZzzpgpHDhZzVxGteBe5te6d2+N0CoowdIvyNX0l4g8VruJZ3Ol6cdfXTWqvs0pa0yU
	 CqDkCKTzrbj86XhCDsivAelw+IbzC9EVoAeZ7p85j2loZuNhyyXHPq6HAJTgwOmIFU
	 V/9rh0Zi0iBhXZ12mfrYy+kWHoHPxLrhz3SDe4KM+5LEEgVRJVkMzOXIkYn00Ekj05
	 X2N76q52T0sxO1Jyh6yDqfdS4GEgywFNFyCY5OfLH4IEQHyFjCNlhzyX2NskHpJiAi
	 7B31EzfpNWNDw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Tobias Heider <tobias.heider@canonical.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
In-Reply-To: <20260422-x1e80100-audio-limit-v2-1-333258b97697@canonical.com>
References: <20260422-x1e80100-audio-limit-v2-1-333258b97697@canonical.com>
Subject: Re: [PATCH v2] ASoC: qcom: x1e80100: limit speaker volumes
Message-Id: <177686906300.36226.17703920373519139645.b4-ty@b4>
Date: Wed, 22 Apr 2026 15:44:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LYvVyC78e037bReXvjd2uyLs7TRcgWQ1/dWq77r4RAo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6ShUWhI1AJ83zS9iBN4pHlmu+JdKtsuaG9pHI
 tTcKr9OnbuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaekoVAAKCRAk1otyXVSH
 0OroB/4+Q3Vw7LVxInAw6tWH+HL4hvWbHD6S6ULRbm5T6R1Nkbbj1BNxLJToCaqTVVAjkzU7zV7
 FOpjSLk/Bhpf+nRd4ZgLC2xf2VeGnikvlmpJw4wPF8P3IoEXY7iERGN1xWZjNV8hTLDobqJssA8
 7hFm2G1Eyncs/JZvWaVnEGyqFhG//zq1yWfZkfNUlRqew7TZjgST57Cza9+dxYevKG/6Eh5tLr6
 oti2Z/U7vM0lKx6/IzZi9y70BFrt34+B31zw5B2Te4VRlcAweYWWEmubLVIC5NfjCLwBSVGYz8l
 c9S3gOlgy6V8wfSKWw/7HOEfjHZCWkQ8TxDQZaH97g8zbE3T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,canonical.com];
	TAGGED_FROM(0.00)[bounces-104172-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE72E44A591
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 15:30:59 +0200, Tobias Heider wrote:
> ASoC: qcom: x1e80100: limit speaker volumes

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: qcom: x1e80100: limit speaker volumes
      https://git.kernel.org/broonie/sound/c/0a5ee0e520ef

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



Return-Path: <linux-arm-msm+bounces-116377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wjFYMjULSGp/kgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 21:19:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40847705134
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 21:19:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AcrLOfl8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116377-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116377-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26B4D30215B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 19:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200E131353C;
	Fri,  3 Jul 2026 19:19:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94882E06D2;
	Fri,  3 Jul 2026 19:19:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106344; cv=none; b=bj9u8A6/7t0khhj415xZ4cUDk4NfnoH6zTjyvBPEnoixXKIlAEbCmU/KYDsWZJaZg/uHn3WwL4JLL2nzjhldg/bqtb9PGkeH0l/N/y+EPFyaf0qD37tFGps9lDTPios5uB3MitmDXtP4f4oTWnNEq5RuQGeIXTfXVeEo9ahM88g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106344; c=relaxed/simple;
	bh=xJuVLJzroWMBD9DD71kNfwj90ClarasYnSkGTpNHemU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PKbsgdYcweyfMpd/5NNz4ghHPpQ3oHKKb+D0secc7JCFySvZH3wzIhZzj1EPnvjfoatUZkEiRj9uMf0Pt5RKT0YOw9sqSjMuRea4GlBJEZHs1+3ZG9x0ZuRscpbt/OmKNuZhXUAj4mE79N+ZY173uKyHnO88tOD1p2IqQtdXo0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcrLOfl8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99A51F000E9;
	Fri,  3 Jul 2026 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106342;
	bh=i5y2X3HFGbM7t4zbeA3K3meHSTZdNQp9aSf6Dom1Xwk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AcrLOfl8B4z2JUdJyLFQAe6iR/8N0ju4KeavUvXaCrsxSJcXf+Sd49VTbj+g4bX6N
	 3QoZ3008RgXNBC8wDahrTCycDczKMiRvw+gLDN0fKnmIQtXVvrmgkrqAJWHmjP0edY
	 YwQQfuw/bM1wNysUf9juOFrMa0KS3t9u/47sIlQ3q3s6cDmzNPkCGnXexgMh/Wwwfg
	 O0w+M3ZaaQAE1d0hVCPfpmBBn39sXfQFxKZ0e0Xxv+ay7gbjdABhzHL3q/ZJkuwZS/
	 SW6fxZNUARfThHbGNn7uZV4Jm3tMuWCB3lxRLT8dxNGOEc6RPI3b4MZjXjA3LRr4j1
	 K++m+7O58IxzQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
Message-Id: <178308705893.53103.838784798451369843.b4-ty@b4>
Date: Fri, 03 Jul 2026 14:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xJuVLJzroWMBD9DD71kNfwj90ClarasYnSkGTpNHemU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqSAsjRF0Ry17bJGK5+GHbUbUg/TJoZ4yshEzSY
 /r0ECHBARuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakgLIwAKCRAk1otyXVSH
 0EBbB/0TXgJGgUK4XdbWCpEU42NWKXx+ghMyla2oUGD8TD2DYyf8jX22czJ48zyVf9qsGNgbV74
 AxKMTT0HBsk8+A+jY2hRCVDJWqpMl8PXwX4d+d/Zq+dmpuc68JILsjgUqPpoFKPP8qTgyHGzKsF
 /25vhLzpq+nGWbO8TiISw8GNMj4WFVBGeJBpsrLSPoR8OH1HHB8+XoH7YbZdxr8qpZ8AXkZ7XpF
 uIR0M/9lowk7ptV4z8cnhB+QWh56bzM0hwUOz5tGjQIkTXmo3QE5Qls/sW3TlNzwX0/QUfLoBfM
 ZTt0hxlWBZuySq7Ff+wiP+cuYTWz+7xb2pS3fHJNAmfRI7J/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:ajay.nandam@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,perex.cz,suse.com,kernel.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116377-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40847705134

On Thu, 02 Jul 2026 00:14:56 +0530, Ajay Kumar Nandam wrote:
> ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
> 
> Hi,
> 
> This series converts the LPASS WSA and VA macro codec drivers to the
> PM clock framework for runtime PM clock handling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
      https://git.kernel.org/broonie/sound/c/cd054a6e272c
[2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
      https://git.kernel.org/broonie/sound/c/eb667d0fbdd3
[3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
      https://git.kernel.org/broonie/sound/c/541735571578

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



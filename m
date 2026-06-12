Return-Path: <linux-arm-msm+bounces-112975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PDJHFM2FLGo1SAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 00:18:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31B67CB42
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 00:18:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MCcjGVU5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112975-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112975-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56A163016B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 22:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552853CFF6A;
	Fri, 12 Jun 2026 22:18:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7CF3CF68B;
	Fri, 12 Jun 2026 22:18:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302729; cv=none; b=mjpyFNPm1KyrmGeYc1GUwVNa3jc6yiz2M+Q1EZ2FpgJui7NyhWx/iYmBWa5c2RkKvG90iJDvvY7J9OjtOPq6ZtaSu7OzO35Wl+gv8XsKr/Hreik0MmbQclGSpSs6kHwoXjsw0tPSYU00x0Pw+k/dp6DZLw95eRyeMZeaodvYv/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302729; c=relaxed/simple;
	bh=6NdJ1oXu8X+yrUyYOh3BVEt16gq7UD6K3TfA3IfrptY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z0byvKZFQip85lNfAy8gENAv1HoYK+1DhJ+GdQbWSA/tJzMGUOMiC0XpMwIt+kSB3xnNQk5o58PD1GWFo7MFSXyEV55XbqHaX0kh/hP8zv62vW9U13jSq8Yrx32YZkgNbjBSUQlOXNnE/506QDf5ytM53divVLdX4xDPxrAhG3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCcjGVU5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BC71F000E9;
	Fri, 12 Jun 2026 22:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302728;
	bh=+EaqxrR/sV3bOU1Rowx551pwQAzOjjox3enBFC+z/Nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MCcjGVU5k6xblfjlm0hOAQ0LxniK+ioRseQAbGr0sTWq5Lvyq/kScY4vYXkb/bfHt
	 whIPFKbPmP/Ai80uaaYsLEKZdkge2EV9bFQJ8FpSqRvTekmxqA2m4ENfJ45lDWb23x
	 JRoKEzD8PwT3Gi7LFaSUE3fz9rV7bdQPQh8T50fB+l9V4vBBBVOZgZTotMERGRI2j+
	 J/RNWyA2lumXc+UcKfnTHysZq0b5GRmfgSBSt73C0Kqcl+lcjT3N2TQ99nImUGUNVm
	 X4iMalO4cRwCX3tnuh50dZRQ0NYuJVlja1KFyzwDKG4daTUmWSEXpYwa0KIMhdlG+8
	 YIrtwz6f2NHEA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: use scoped OF node handling in manual
 cleanup paths
Message-Id: <178127725305.48375.17603847447471691265.b4-ty@b4>
Date: Fri, 12 Jun 2026 16:14:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6NdJ1oXu8X+yrUyYOh3BVEt16gq7UD6K3TfA3IfrptY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXBRNPXenH0pNh+GaHTYt582SCRLiGDStmcX
 CIiqu8x+JmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFwQAKCRAk1otyXVSH
 0KzSB/9EIxR68YF4xkDdQc5qt3LLq490icnYLlz3hS/NZYEltakjL8njExuQ3zcTJBfIUrJCoZe
 V1ON3uZ3j1Ea91FUKsiBqIRNWpfU9cOfYwKdezXVTXFbrtH8oYaas6j/H0fm3C3KFDrcx6OV62E
 veBD3U/6ovNL+EL/marF53J8tw5ujOw6s6ht+U6oO7M/aQqxpT59X0xh0pYOSN8xvvbEC0RIO14
 nE1lO2wTJVHs2UYC1pLy0fuJyexr2jtykNji0JTzLDnobKjHMfIwxzCmM7fiCMq9aeTTzznCM7k
 IlTzJifQ4K3OWu56FdA49audNwYAbb6FUZGz2hV7qyC9/1jV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:tiwai@suse.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:herve.codina@bootlin.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:cassiogabrielcontato@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:notify@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,suse.com,gmail.com,perex.cz,bootlin.com,broadcom.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112975-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD31B67CB42

On Mon, 08 Jun 2026 10:39:10 -0300, Cássio Gabriel wrote:
> ASoC: use scoped OF node handling in manual cleanup paths
> 
> Some ASoC drivers still manually release child OF nodes
> when leaving child-node iteration loops early.
> 
> Convert these focused cases to scoped OF node cleanup
> so early returns and normal loop exits keep the same node
> lifetime handling without explicit of_node_put() calls.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: qcom: common: use scoped OF node handling
      https://git.kernel.org/broonie/sound/c/22aed576add0
[2/3] ASoC: fsl: fsl_qmc_audio: use scoped child node loop
      https://git.kernel.org/broonie/sound/c/065df02692f0
[3/3] ASoC: bcm: cygnus: use scoped child node loop
      https://git.kernel.org/broonie/sound/c/9741aad24432

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



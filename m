Return-Path: <linux-arm-msm+bounces-118263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RMKPAx3dUGoZ6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:53:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D873A715
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:53:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H6hcwDCF;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118263-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118263-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B99EE3061816
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A721426EB7;
	Fri, 10 Jul 2026 11:48:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96C4252B2;
	Fri, 10 Jul 2026 11:48:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684126; cv=none; b=IqrVEw7Ve4QZPPl8ArXjQXrBHu+v82kGooympUVH1TsS74zU9lk0mBL4YJAfsmJfCSUJOBlbbLKoByxKMSjJ+QAvQnnjg6jCSWreHVSTBjfprPNOHVVWP50ZPAgPtJ5N4oc8pFqjpmfmN89aKS3ki2ROrGwIjRJaVQxJlVtcQyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684126; c=relaxed/simple;
	bh=wQnT3QB+qyLKlF55Dg6WSywYRdvVoJwYtzlqJVVLOUA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BGBlChrNTRPSA99bwgzUkMAhbHs6tdY/V4DaPRIq4Wx3FVQE8Z+9k2FGCSNfyfffloI3X8FiZSSz55zjjl4nL3MqXOlifSxYr+jKMa01YTEtUFc9U6wbU5+GCznK37Wpiw0+AcW9eahOjaHmtoPYUJcEPe+LT1uDymiRJ7U8U/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6hcwDCF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92301F000E9;
	Fri, 10 Jul 2026 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684117;
	bh=rV826htMq3ARxo5ZOePy3cYRZpDJLTRHdHrGAJy9B+4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=H6hcwDCFZmc1lfO2xwuPptlgT7JuISW2Tcn+cR0NVdas7t835tANZQWizc5Hf4N3M
	 0of+VE6DT7njZTxIlrt4orrXgSqzcGFnubAaBoDPXN47BoscEaB2Q7IdgJHUgrPzBU
	 lF/dX6vVubjwWoE4pyRSnMKWXIfvyn9vUDpJ7rDCQV7p0BLuMuc5hh3jEZhjukJVwL
	 I6thmSZZ6gJkwPgx93HsMHQxX2oNZ+Ql8jsYRZFu2qKhBCsZFuVGrhdBZbVF4ZM8hi
	 BsXAIYjgqsWa3WJlTwf8uA67YCqpdLpUHtRqjVFASZ9qKUwrbdhPq4Hq8S/1SmCQPT
	 TfAXr0fcKO+vQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072616.88634-1-pengpeng@iscas.ac.cn>
References: <20260704072616.88634-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wsa884x: Propagate regcache_sync()
 errors
Message-Id: <178361271325.100558.5004202923769920484.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:58:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wQnT3QB+qyLKlF55Dg6WSywYRdvVoJwYtzlqJVVLOUA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNwSdDTi9ompg2rdyDNwmSbz/htLra988hfeK
 nhaadRfjOGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcEgAKCRAk1otyXVSH
 0HtJB/4gUYcAx1625IoqZf7eGtEEkKid373gGxWppsM1Qb97OpCq5fDW9+acz+7hPiK/n5pO7uJ
 kzaRb9rrYD4Vs6cjcAgMoyh9bJ0w95o8dCIVxqdKexNxuWz76cWOhAYdBmF7N6ARpAX+HeFbebT
 6W5zrkfsVjng9Yauvi+yX3Aqn7gjBF6SnR+ekfXZTWvT8wj+ezHI43GhwG0K7JCu7u7/NbTNyLZ
 7669UwitkrIgR+GT+FawBzW0BOTJ7CZITkbMARgnTThSnJTUwmrYElB22rYpFHwVaV2HWm7J1aO
 on61PmOJecIM5GolMhW1zYLsPs1fN7ueBT+Es8NChVQDuTW6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,iscas.ac.cn];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118263-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A6D873A715

On Sat, 04 Jul 2026 15:26:16 +0800, Pengpeng Hou wrote:
> ASoC: codecs: wsa884x: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: wsa884x: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/6ed25217ae69

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



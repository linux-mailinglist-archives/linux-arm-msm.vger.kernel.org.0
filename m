Return-Path: <linux-arm-msm+bounces-91567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +9efFTk0gWlyEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 00:33:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A40EFD2A8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 00:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 303073014558
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 23:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E3C2D8DD4;
	Mon,  2 Feb 2026 23:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMtlPAz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D378287276;
	Mon,  2 Feb 2026 23:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770075190; cv=none; b=o343PrKBQ7Bhc4X+WtrnLNOQeOmQFBYXzAv8lnrZhdsojyxcWec2n6MvXOrF57frvyLzTxomD82ZT/3tK1/pkeK/L6sV++Ko2IBMaPufwwI8RfwIx5J9RFrMAyPnP6Ki5RoF/9w59C8VrgpQwXKtKrMAySgqLlay6rksvbBAwes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770075190; c=relaxed/simple;
	bh=eh5tVOlTZmiBlgQfny92fb/GJtH8eyR+7MNnbacuOBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IIQZmq2JSFdvd0j5/IFOqFfQhWbeAjyOosI32vUUg0JbaLCREXLqI5jKB7ZzL1spCsn6lxPxV+76xVeWM9cf6lv/Hwqvb4ngPAZ5IIG0nTr8K6XGFra2IT9jXlw1gvTyOhZnv5Lvg1/I1Mm8r6AbiznFkVd0ySEbORa1byVXtpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMtlPAz/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABF2C116C6;
	Mon,  2 Feb 2026 23:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770075190;
	bh=eh5tVOlTZmiBlgQfny92fb/GJtH8eyR+7MNnbacuOBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QMtlPAz/7Yo7x2Y2pI/Bp5RawUhlHbEfRK2/gv0evW5Se4LBTrPkx8MGsREu2jC8A
	 oK5bo7ZZh6ggEF3lIfXN/MRKpN8d1Cv5l8S1QO7OjEXlE2tijcKNwhrmkQoviSF+v7
	 ia6Lxr/Iqt9qAYVojJGxz52goyNVcvPTgfoSvlYu4bm0N92XF+3+iF4ZnJ166/0jHA
	 g9dRda6LXiakNwX9bVAtbN4yv4OzCcLIAqI4RDA17/Wok6J2k2Zt6lZJrWdF2uN7wv
	 zuNik2IsmrQ+43/cOXd12/wphfD1NWERictjMtvvI58EgBCcYF4WCW2b/kVqqRqbBN
	 gT8elTLP9ZKuA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20260131020111.46108-1-enelsonmoore@gmail.com>
References: <20260131020111.46108-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] sound: wcd-mbhc-v2: remove unnecessary
 module_init/exit functions
Message-Id: <177007518848.976577.14331557943658557012.b4-ty@kernel.org>
Date: Mon, 02 Feb 2026 23:33:08 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91567-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A40EFD2A8F
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 18:01:10 -0800, Ethan Nelson-Moore wrote:
> The wcd-mbhc-v2 driver has unnecessary empty module_init and
> module_exit functions. Remove them. Note that if a module_init function
> exists, a module_exit function must also exist; otherwise, the module
> cannot be unloaded.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: wcd-mbhc-v2: remove unnecessary module_init/exit functions
      commit: 090c8844e5d454a898183ec4a7be8a75681ed262

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



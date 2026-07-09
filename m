Return-Path: <linux-arm-msm+bounces-118262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id myRfCDTdUGoc6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:53:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3C73A721
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fA7LnibO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118262-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118262-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3336E3089475
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AC341611E;
	Fri, 10 Jul 2026 11:48:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F1F423152;
	Fri, 10 Jul 2026 11:48:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684124; cv=none; b=gCMuPzTjEG9DB8f13/EvLIY+42NLLu8amK2BxIqXh4nEY2d4DRwjCq32BTdbzGq7ElZrkktFsPiDJoaifED3ZJMH1xIb0xBzWW7upOobuVvvkF2mFdW++bWi2wd5nS9+SnA6tJ+Hu4st/g4rbXdo6vcKc3KlRTbGfeo2On7STxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684124; c=relaxed/simple;
	bh=JY5uy/2SFkrZy4QL93cSVfHPbR6M+HMHhXAKsGBWNQw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VvXl/G6jOEEM4Y21zG8zv7TnXG375vyP8wjtwtzNejo8YBqI1065bEiG4Rn+tdH8uSYua6GYcH84qsiKBRcVZvkPgfXTQ209dLuljBOf/0xZE5C4YTc1jz6ACp/vDCXxYGbKOfrN0IW0QDNI7eTrxzQySgLYT5FKpNT8+vtHZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fA7LnibO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ACF1F00A3D;
	Fri, 10 Jul 2026 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684113;
	bh=7z42eCI0lC74JHZmqrmkrhBvBorw3Axq/rT/mbua++c=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=fA7LnibOpQ3thBNBZi7E/0UtOhanX+uKP80o8Po6oyC+mSb+umMwYD+n5iYio0mZ6
	 WZoTi2OVgWuXfl/lDtVOdc6ztvDPGm2a0UyGQJ4Me2ta2ERzRRDI2NYxoP9p/Q/3Of
	 y0+4wliLt4pMJs1viZx5YasbhVu7GNt6jAbCTZ48a0jm3pVib1RbYTzt4CMo6N8/HG
	 lG51L1+KRSl7QVCe1eh06PjwdwkLyZTQ09GSN7lDr80b/tWZbAVy3Qr/BOcQLapF4D
	 BT44hLMvDn4fYcQDxgr0OMRe2kL6SR2cSDCEQGgO+RytLPpstJSRVnly9C+xkSjgKo
	 MjJvalid1CBiA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072454.80981-1-pengpeng@iscas.ac.cn>
References: <20260704072454.80981-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Propagate regcache_sync()
 errors
Message-Id: <178361267218.100558.15533929411931278993.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:57:52 +0100
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
 h=from:subject:message-id; bh=JY5uy/2SFkrZy4QL93cSVfHPbR6M+HMHhXAKsGBWNQw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNwOGTewTfTi0H2HWf8XxXAYrTdOh7MJvV6cx
 JcvMCPdm0CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcDgAKCRAk1otyXVSH
 0PW+B/409XOELMokk5RQ4MAiuUkb/vcP2+TpeKVtMf3yWW4CucLf5dLfhLH8s4Jf2qOdbWoRTLr
 F4RUs7zFrNwrAKX72BTR9h3XAeyKaO7s9yLS+LaMLZLaEKCzBro7JHNs6UJ6hi7Km0IGj05zWqi
 7s7NGWl5FbhBTx/vTs6pwa0Hfp0NmzmiL5f6YqdJ/kH19ucx7GNyLetesU1myvn+7EuzGgj1tj7
 U15JJNrT8NlkuLgIvc5y65QXnKM0BneSROPJ8gbcPZgAVfG/NvtekOVMs7DNCTsHGEvB3ME0P8P
 SH8xB/B/9EZryvsZyHN6c3tTaEfKjY1GKMtYEThwULMnpBuC
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,iscas.ac.cn];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118262-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9F3C73A721

On Sat, 04 Jul 2026 15:24:54 +0800, Pengpeng Hou wrote:
> ASoC: codecs: wsa883x: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: wsa883x: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/cc5c698bbca0

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



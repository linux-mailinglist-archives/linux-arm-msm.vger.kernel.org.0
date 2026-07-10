Return-Path: <linux-arm-msm+bounces-118264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C1uONN3cUGoK6gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:51:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE0973A6F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:51:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WtKC9VJV;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118264-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118264-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0DF63038430
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F4D41B374;
	Fri, 10 Jul 2026 11:50:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2F43BE16F;
	Fri, 10 Jul 2026 11:50:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684229; cv=none; b=APuWS/92Hs94+bE/IKR5sQrVU2hKXrsycGeBPK7b9O6eyMh23MdBuHTU1tQYzG1UnpYZtBbp5ZamQDBT7nqvAT6KT1PLXCQRtwt8lZUTEZOXKW+Zfe9Ro4qc5FvaLmh8vNjvaP7sdc/GBEmS42X7HohX/2l/yRcF/lSKMAmNyuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684229; c=relaxed/simple;
	bh=AFd3zwSCY2Cwpz5juit1hOsnW7ZjONoUMY4cNCm9v1g=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FyMTjDNb/4MVC0/rv4VQd+mWwwGetEuUabQk5x1wKdeF3LbjeKFDj5+rSEB4Q+zFme6rWfzQ5PP+Px7AZfs5octCxJkr91DQJk6BEOXl8C0orXiQ3q1+U2xxyV+upmtBNRTeCVicyozF0kRnfuHiBqP8vMvnCtRvvSU0mZd5H7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtKC9VJV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1321F00A3E;
	Fri, 10 Jul 2026 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684220;
	bh=dgBZBK6ARfH71OmeAF5+eVVSqE90TSwV3YTJXLycdpo=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=WtKC9VJVpVPuKmMcNom7s/5PtC5DLNWqLrU1mTLkCvLaP5nAL/DYym9rWZcFMnv2m
	 wkqO46ZYjwzss3WcjwbN4AkhM4PRp53XAFnXfBiLqBlIt/gDic+yX9vwfnsbAA4KEf
	 PX7joJ92VcGFfeLhyWi4+ejqdz7rAcShkHYWxPO6ZNHyDd5loVbleLg3Sj0iTMnTjB
	 YYFS3IDqZXauuBbW+EZ1OnzKDETnRM89PtgImpwAZQi+F6AgO4gw7G3gr7BZC6yb8/
	 vFCdAAvrzqTHGRdSgFhuG/4DTtmoVBEAmDxQhdi99/nboIjX+xPt8Lk4Nn+nP0JBFz
	 OBR8n1E853Owg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072236.70862-1-pengpeng@iscas.ac.cn>
References: <20260704072236.70862-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wcd937x-sdw: Propagate regcache_sync()
 errors
Message-Id: <178368419268.82617.5071102264345021448.b4-ty@b4>
Date: Fri, 10 Jul 2026 12:49:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AFd3zwSCY2Cwpz5juit1hOsnW7ZjONoUMY4cNCm9v1g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNx6lMsCA6U+LSVq7AVnU96nxJVOREA3iqN4t
 7D42wiAazqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcegAKCRAk1otyXVSH
 0A9OB/4jypgo99vdsdM9GI9UhufucgcdrRTI0kI2CO+lG/9h0TKB1LiqM2tviqoToQHqvA9dpQC
 KJ7ZtvGLfFBIlym9CBwSdSWFe2QPF7kzSP1d76jxqftPBxH+JtpP4diyzmwlSSh6GnPdjYDn/Yw
 MJEgo+O/QqXqDMbibD5fbk9FhJCbWSQdYP2WuJ67R+vYezf68KdZLtvdGGDff0FcjMpn+fRRlAU
 V36cqjXcMgQrQ2EoHyrrTuaWgZL7EHHA/wFy5Ayl5DOPYM4Rocw2EDkORInLzB2GaKDiy2USn4k
 ex58Irt8hvTC3kcBngYnkMbEZCDtvKJV2h+tq2Jv6JTYQl2h
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-118264-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BE0973A6F5

On Sat, 04 Jul 2026 15:22:36 +0800, Pengpeng Hou wrote:
> ASoC: codecs: wcd937x-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: wcd937x-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/a1d01870b45d

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



Return-Path: <linux-arm-msm+bounces-118260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E9ObLVPcUGrR6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:49:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60C73A6B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:49:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Uv+L1nK4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118260-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118260-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3614300BD4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7DF42669E;
	Fri, 10 Jul 2026 11:48:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560741CB57;
	Fri, 10 Jul 2026 11:48:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684113; cv=none; b=UFCNA6fNJkyW74qEA9ebIJFNEbLGrJOkukyzICy+hpKh9eIOKrY8uZDUG5e0ukQbgJx4UK3OOYEYQFRu5lThkTIe3wld2HqgCeTfegd1bWGTK/RZRLYZtQnNsctfYMkNawbhiV5Gw5pJ3qFUPDoG2X/JTJUsYYMUFNKPkDVasYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684113; c=relaxed/simple;
	bh=5iCV04m5JdiVZTIsQ+X37ZgC4ojqKKp9WVuad+cCls8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=utAmVzlVMnk3B0OLBne74Bx28aXcBmV8OYKMIaynxFh5HpmmdF4qI90NWEEHfRoi6L1Z5llx790EHhMbFKMKY4oDsvaFTJA+1/MZwKPrEe/oVZ6UuS1KonWttIxF+EMdn40vj71Il3jkmdPt8nSdSA8BjXOBeiZLKJj2Pi0H9L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv+L1nK4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49FE1F00AC4;
	Fri, 10 Jul 2026 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684104;
	bh=kIXYwGJ1rOhL0/zIjaTiWhDSEv6J/6/lC5/5kTE5/Z4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Uv+L1nK4FeDHUdr1qAHMk4RaypOYwDSQEh1z5Zu/xFXaT+jFrR4BY6RvxupPsfi6n
	 yL6Vy1EkIsGWnp980w6b/w7P7vY7v/667PgmxpNZVydXcvqyUaVFDifnra58sSbx0Q
	 h9NWDjT0Kw0VbEpGMEAMT8SbrMzlkCytJrTnccktOCns5JHWFtsV+q7nNT93cHuSqP
	 5L1nbFAP0eUl4I0FZaVq6PCtnK19Dy8QIbaWm13qUVrSGwoKZw6roYZOSeRo5gHw6E
	 C7MoId9t1oHbGufkBKuuKU9BNwL/xibKnPZfnTJFKziCvmfRbExnEUkahxrohlkSJv
	 Rh/rl/dhsdOzg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072347.76000-1-pengpeng@iscas.ac.cn>
References: <20260704072347.76000-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wcd939x-sdw: Propagate regcache_sync()
 errors
Message-Id: <178361263263.100558.10753000002601774337.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:57:12 +0100
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
 h=from:subject:message-id; bh=5iCV04m5JdiVZTIsQ+X37ZgC4ojqKKp9WVuad+cCls8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNwFNulPbGU/gJKSl6R1WZWmi2/Lmpkyx4iRc
 mq9N8eKcG2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcBQAKCRAk1otyXVSH
 0LipB/9HFO9FGf3mUW2wkA9pBWGzXvrs6T66s+vMvEGccOQw8Ziyt5j9r/lxxGkn/I01H1k5Btt
 C664XQ6prJ6M4Lzz4N8RrNdM6Y3i+rGvohysk45aBZOjNLXFdm7g/o4LZjE36mOcC5z2b+xvXHS
 tPptuEK0+yESUb+RkoiCKFwM1a/mhFyi1HTUpVu5oaeEta2w4CjopQqyVf39uU231A5fCCrJ/BC
 qgitOqFKE5umPWjtWXtxlFgaUmSJI2vi02JP+IkiBUFBpUunZRRgRrhLlhK94nR1U3MfJtbNG2y
 taCrWTE3Yt0Tn7zu/96mK8FCQtmI7Z6xK1vzOPnWbBFV9qEB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-118260-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE60C73A6B0

On Sat, 04 Jul 2026 15:23:47 +0800, Pengpeng Hou wrote:
> ASoC: codecs: wcd939x-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: wcd939x-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/495d266f67f4

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



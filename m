Return-Path: <linux-arm-msm+bounces-118259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lC0iHgncUGqt6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:48:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0573A670
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:48:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HnGAaOTa;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118259-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118259-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0112D300BBBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CFD423784;
	Fri, 10 Jul 2026 11:48:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7CF422545;
	Fri, 10 Jul 2026 11:47:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684094; cv=none; b=fbqeuoaiZvlrAjZo7Efp2wUjY2a30dWDuYvvJsDO2W3fjMudIeK2QsERgjWjhI2JkqFqZka5WW0fUv0sVZ91KRQZLYXjqbfz/cQ58bUW9Rmk8wtSnSBQ3bCb3rtg3OSMz5HiHKTMUu7QuK5BquADHT87pabECodLlpx5pJyjKKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684094; c=relaxed/simple;
	bh=UDMvUVromBjSOKbwOoyB38oAoWEwHzpalfunSo5BJUk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cDOejlM09Z+8yAIrAxIy8vecmD2GMWF0Pc+5QktH3l+SFfzXn0u4/Rls9WN8q1fCDuW7i/5I3QBbDrA9cKoi2gEjs3cGqglnzV5CA9idMl/F1aCX3UyYfDRgiSq0uN8PhohdSFnxvNYSD2dgywG4eFrtfL4qo+blJ62sP/TVps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnGAaOTa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404581F00AC4;
	Fri, 10 Jul 2026 11:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684072;
	bh=db715ZfJaL9XjMMK2AODdAigNIntRV8FHCBSSO1lz5w=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=HnGAaOTaOxV/rm5pJZfuowKfzuAerZYOqcL8WJU4XU9mgjec69nH1J5wbV/rF1pGs
	 WLTeCpajjCzTK+s1oGVlhQFePvvf9wu55FrChg1XKvQmcZlSJDn8+LB8qQvyhdwGge
	 8kZeMNNbibka4PhRfIlegs0RlGgzvcat/IWPyYBZ9PrtFtA7bZi7sBxpb5g1T9UhJo
	 MtYaVDB7mSQ9HGj4+C1WP1t567grbeyTOsZr/aQ/hDvtJtgR0uLUu0HbcQtukg40lm
	 1f9FTMEHijdkV5A4VKOksPv0K4TwagDy+NM5N91crSDpKz88hxjWtIxKV5UweZ7kSB
	 w+Uy2Vi2za4FQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704071933.52450-1-pengpeng@iscas.ac.cn>
References: <20260704071933.52450-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: pm4125-sdw: Propagate regcache_sync()
 errors
Message-Id: <178361245647.100558.9742203417216500459.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:54:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UDMvUVromBjSOKbwOoyB38oAoWEwHzpalfunSo5BJUk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNvmcW7A91hmQbcTg/h//xQkKgrgmcAe59eCZ
 NUKwoOVykGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDb5gAKCRAk1otyXVSH
 0MyGB/9XpHqYN/02PE81H4AExI+ctutsigT5ZH7XxZlqSW8hCHlgjzRFz0A7a1y0HhwKNCmpLf7
 yg+1U5vz04dJknSWkdEZHEeI6KKEBDcGQDJaocKtfT2OM3jqduk/HzALg4Keg16T/yN377iTXhu
 7FtcDVAYUIaGXpuGRLP8dHFgsDH8iwO7x9kiXlNWbzNkqLmFxFaj8G7v/5asGoBdBdX7Nfb2gsD
 3N0WEmLBeFf79/0I73rMUjCJ0AOovek2zs9lWmeBRCUj/5SXhUXb3h3KkhvfW4A0u9bESqAHfks
 7nigkGCMWeW+RSWhPrbB8KPNYZ1BLQMA18IlyzGVmiHBEt4L
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
	TAGGED_FROM(0.00)[bounces-118259-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BE0573A670

On Sat, 04 Jul 2026 15:19:33 +0800, Pengpeng Hou wrote:
> ASoC: codecs: pm4125-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: pm4125-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/808d65f3fb42

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



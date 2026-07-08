Return-Path: <linux-arm-msm+bounces-117964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qZvaH3OTT2r9jwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA39730F43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:26:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=J6tCPxTr;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117964-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117964-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83A3B31171CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDAE3FCB37;
	Thu,  9 Jul 2026 12:19:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB039B97B;
	Thu,  9 Jul 2026 12:19:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599572; cv=none; b=qYd+UPKVleruxlZX87QSoZCjzRcSDI+DtsRvzm83E3PrpB4ShgeHtwX0YSAWrNFHDnrHk93hnMe21wo4C3q5U9G4QxAqx21xdIEySjkqHaOVabvA1Jvcf84VMeeYLwUlc8tqr/t09jejZo15ko7Fo1gc5uWGBp44exMo76ps3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599572; c=relaxed/simple;
	bh=lLFb3NeGr3j/mqBNNRVAJU7GGWpr+OtsOj75xaa78Tw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gmh8A6ReN8tO4eNgpdX2bY/PgZWjVeMINiS/bqjzZtbGTnhswWVEIIav98L8rJl3NUYfqOIA/RST2GxxwyMg4KwnxKkNvD1X7izCNpwXhgVPgms49p3BNQwmGXTSb8+WwqYaAuxt0wyYHdinYJ+US4CtzkZ9IO7tFxkdGOMgCQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6tCPxTr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA8A1F00A3A;
	Thu,  9 Jul 2026 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599571;
	bh=BKIkzQoy+QU8+RkycpuiyuolcpRm0BseFUs55SuzILo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J6tCPxTr0wSkYd6+/6gRjJn7k71KNTEGbM5fbeiFryhYgWpAwb2idFtf8UbXB+Dtz
	 Kf9hQTQfjvGdUa4emNDW1rB9r6YSxy5ToXQBa91M6ws5z4z4zn/PkXHveoAUXNTzbL
	 6V7BimDb/SNlHTE1O1+vL/Oj2OGqpkWnBwQwqVm/DFjgN6vaGM/hrBwLZTmm3ilPl4
	 kyj9IIXH1gd/5HDTKVrOXZMm2V3dhsRD96mcmgJFV3E7GCAXk94aVNfiGF58A/N3GY
	 1GQ7ur0NmkpDMU+o5bX5WJ4bobtCTC5I6dIyIRRPSgrfU/1d5qVN4CBsUrebKaaeQZ
	 pBYJ1ARAFaAmw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20260708095840.385526-1-jirislaby@kernel.org>
References: <20260708095840.385526-1-jirislaby@kernel.org>
Subject: Re: [PATCH] ASoC: pm4125: Switch to irq_domain_create_linear()
Message-Id: <178353354831.26140.10365293261489481145.b4-ty@b4>
Date: Wed, 08 Jul 2026 18:59:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lLFb3NeGr3j/mqBNNRVAJU7GGWpr+OtsOj75xaa78Tw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5HQthk3xHpiX2orIOTLs45D51fl28QXcKGz0
 2iYDkXHRYeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+R0AAKCRAk1otyXVSH
 0FDlB/4vcPhj35KJ/1kz4s5OPxvv/nFhEnF7SXOC+269MreQ24lKqKhe/HfjDi4QgbobYBhwe43
 e2RiuPeQ8ogfoyTCLBlvEBFF8jZ22ZAam0YHN2gCxSvuaWcpjwx3IYzyyoOqNGVMYaqzLDKpzKx
 sUTzn+tuyZh26LbX2ERdLfYu8acHN8fx0b2U4j1ZexyPW31v3tX+IRbXPOvTutvEcEj82pwbwWL
 h5gDBWNSCu70gxVLiQlQi9xpC2340BVywcIk+tfsLDqqzHc/Yg/qcN7C6q8iqdGwh2gDfbUNEVU
 Kb+vLcx2QdQq6dsZxHfcTZYUSX7yGYqPHvxBdK5RQrTTOUI9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117964-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.com,m:jirislaby@kernel.org,m:linux-kernel@vger.kernel.org,m:tglx@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCA39730F43

On Wed, 08 Jul 2026 11:58:40 +0200, Jiri Slaby (SUSE) wrote:
> ASoC: pm4125: Switch to irq_domain_create_linear()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: pm4125: Switch to irq_domain_create_linear()
      https://git.kernel.org/broonie/sound/c/907e6a701029

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



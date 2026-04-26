Return-Path: <linux-arm-msm+bounces-104694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL3lBCE572mD+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:23:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C0470EB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B32B23032135
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAC030C631;
	Mon, 27 Apr 2026 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwnZZY/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A833F30595B;
	Mon, 27 Apr 2026 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285258; cv=none; b=ZjL+i1FMIJRAdyWvNScJyq/brcU3dJaxS/S6qGObYop5UlkGs/07BHP3jbTutwVYDQbkhA55W6h+C59C9ovRTCUbPZy9NcaxOoQqY23fXQmWr9FOKVUi/OPq2Nvh4bPVZ6jhJnVuBhnuFxe8NHQ0Pujwz/lLamoC1WAOSFhQc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285258; c=relaxed/simple;
	bh=zgOEC5VHuYVLv5NsTjji1+71ymgLOISctmE/pX7AqcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sKG3CR1uN22HVoDqiRLorRMAffM4GrKHe2BnsvF5dKgckt9X/nHt5LQ74dTq/aZZcNE67FIVAl8B4/iUvxJcFW7JU8X1sFu3qnJMYcD0u1+pn1T8/9nlCoHFvGFpkP38I9mj6XRlh2Am/AUXZEs8ZC0kr3eu52HZbRwAh7P64O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwnZZY/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392F8C2BCB4;
	Mon, 27 Apr 2026 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285258;
	bh=zgOEC5VHuYVLv5NsTjji1+71ymgLOISctmE/pX7AqcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UwnZZY/SrnN6siocfy5OviPCGy4qLMxuhhXaXqW+K0ke2KQw9KgIGAYmgvPycX15q
	 nEDNsimfiEuWUITjkhQlKiivtwMxKJ8nge7ZEJ7MRA2u3dyjhESFaYUsQYP31H69O0
	 kyNZep67mLGPQoLHMqxpcElG+ucCJl1yJUXb1ejoIxzmcBD57fS0ZHymJYNmqmir+z
	 hzXoR/WxNjV4+hfCVwL2hAoPEuGvBpiPGX82/6CZvAGQqtlwDm7JD0DTP5ejQdlCfr
	 DkPC1xa4g/JwHWlSOW1XngQGEZy0CepaastoXpvncx4cPKw5WEmFlUjfikfMUecIWv
	 tpe2BKlkSNLPQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
In-Reply-To: <20260420180221.785113-1-ajay.nandam@oss.qualcomm.com>
References: <20260420180221.785113-1-ajay.nandam@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer
 controls
Message-Id: <177724587376.266775.14182011479480763882.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:24:33 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zgOEC5VHuYVLv5NsTjji1+71ymgLOISctmE/pX7AqcE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7ziHTgBglBZNpE+TZ972f1loWQgiSiprcfq2C
 w2/RR7LAQGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae84hwAKCRAk1otyXVSH
 0M8YB/9Jvyor17dOsS/GBtmnEzsOISwvxtEvj93V0POf4WXm+UzVbRnhfxwwcGrSTfBCsR+pNSf
 JDVRY/sq1ezVOVtq95hPpKgYwlnTNASCJSx/QzvW5f+UD1Dhl76DaE6vmzo/vD862Zmgu9MFTtK
 9EOL4NzdpptBwkC+EBVa1TzKnWEo7iHi/hcgBVV2llOlhAk60Dbm3c7Tups1QyvTCnC35TJCb+y
 I0Qat7EPL8w0hMH5U51Nb3CnLd7FIA9TT1BnlET+6kSM6mg6bgg0wVjumqk29PSkE8ADP4CpDzb
 nAK/w7VKM1KI71K3P13Od+rpqVNMi8aVBk3sFvKgrLVbAweI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: A92C0470EB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-104694-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, 20 Apr 2026 23:32:21 +0530, Ajay Kumar Nandam wrote:
> ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer controls

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer controls
      https://git.kernel.org/broonie/sound/c/74c876bfd71b

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



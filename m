Return-Path: <linux-arm-msm+bounces-117963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lWGuBqSRT2p4jwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:18:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1E5730E6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:18:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h1vNAOyi;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117963-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117963-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FA4C300D946
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D9D410D01;
	Thu,  9 Jul 2026 12:18:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4153BBFA3;
	Thu,  9 Jul 2026 12:18:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599519; cv=none; b=ccBlqQpt6AMv9VlOew422h8t9OFhYFVC/AaMMfAUo5CmofAsCNi/HyTz/kOHq2kbNICPmf76QqrmIDVHJ79pKGrGskUhBt5o/ifDJ1Ot/0w10tHjgDgpgMKtOUO2MOM/03FoMErKwZZVaHmWCdzjgx/rUw9fdaJGmClwra8fO6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599519; c=relaxed/simple;
	bh=pQZlRLlZK/MKx7NWDn/AoRoYSJbt9cvhsQ1qOt0fZfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QUQFGlDQtZcUO85i4sCLlSiO2lpxeldEfvlKjZ3Byj+ixAguAbuW/FJgprqaj05VDpndg5P/GXKZrSNRG/vfjRfvwRUacaA4Sh/11Fc5nHXNqV+mjGkwdpvOjZPtGR+JWDIHO1eLN6lJ0akuTQJPEhQFdNOY1Z7oYArsBFC/bIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1vNAOyi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1281F000E9;
	Thu,  9 Jul 2026 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599517;
	bh=eGa3MKNT8jVVIkXt60Akdp3BWrDWFGXd+j+kdolvBVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h1vNAOyihGQ74wAAH8UZczr4Lxd9p/B8XQhaetbzesAKyTrXpsOoKGAgvkF+nA9Ji
	 hIM8z/UFkjp9bkuvmu/lvrMPPtXmrWZlmQgsdDMhF6TKqjTfbRMC+JVBe4XZTLKbd7
	 pm0s8JWBhOUIumEycH/HkSdt1PBsppb5Y0U+RSB1FQk0Ac2x4cuk0F0n3wmvUToxo/
	 5RECfD398eP4JgTd1s/smjvtywW9Cy+oRhiv8L2SGMXOtcmmdg7dVx08zh+QTvqfY/
	 Wkvwd9bD6vbqEIdngP7BDcsvks1L7plDLOYzr3Ji8zflr+qVVExgM+snnuGHIDgeBS
	 V/k01jwsyVF5g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
In-Reply-To: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
Subject: Re: [PATCH v1 0/3] ASoC: qcom: Add Eliza audio support
Message-Id: <178351055138.26140.17996633236854383161.b4-ty@b4>
Date: Wed, 08 Jul 2026 12:35:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pQZlRLlZK/MKx7NWDn/AoRoYSJbt9cvhsQ1qOt0fZfg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5Gadn2jDwLt7DaTBeb52p/WA/u642WZKog2r
 YFAl28YwdeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RmgAKCRAk1otyXVSH
 0NtXB/9luHR3/sQVOV8E036NiUbml22HnRvlMdivofO0nslfvXKuxOfMhrZkbIJ9HHQXCaN9KcC
 /qGoYEfjrbck4IqyRg7BPJ4N1RRDlCI7ZvOXqL/FgdhtVpcL9FqzeL3vxoYqwoqF0mjYSfE8Dvv
 ipZDxu9kAVycbqbqsIliR4SB5wSA/NXp7Y8EvjBouxquzD3xXuUFGXKNCoPxxtDoWvN35rzGk7E
 MbUMx4fp9Y7K6Qwk/mE5GFSCe/o08Ogcrhlyc6w7Y/T1kBE/I4YkG9gaOD0fvOVJdOWPCvfg0h6
 PWdOz1pJfxW72f80jrQizJ/fKftgKMTgJyaH17OywpP/y6cH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[24];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:ravi.hothi@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117963-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B1E5730E6D

On Fri, 03 Jul 2026 13:04:31 +0530, Ravi Hothi wrote:
> ASoC: qcom: Add Eliza audio support
> 
> This series adds audio support for the Qualcomm Eliza SoC. Eliza uses
> the same LPASS macro codec hardware as SM8550, so the existing SM8550
> fallback compatible is reused for all four macro codecs (RX, TX, VA,
> WSA). The sound card is compatible with the SM8450 generation machine
> driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: dt-bindings: qcom: Add Eliza LPASS macro codecs
      https://git.kernel.org/broonie/sound/c/bc0d4444f384
[2/3] ASoC: dt-bindings: qcom,sm8250: Add Eliza sound card
      https://git.kernel.org/broonie/sound/c/4214220c3144
[3/3] ASoC: qcom: sc8280xp: Add support for Eliza
      https://git.kernel.org/broonie/sound/c/0d037985725a

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



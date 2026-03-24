Return-Path: <linux-arm-msm+bounces-99725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Dj7EnrrwmkdnQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:52:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A631BDE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB38D318B751
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 19:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B7D392C50;
	Tue, 24 Mar 2026 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1Dz7oky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C4F313550;
	Tue, 24 Mar 2026 19:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381459; cv=none; b=gc2cLPWRDK5aNroTmHi37D5ZbNhafnacmUrXM5eRXFhjpLPVrBrYdRoW2NOX68oajwcfAkuAaQD8uSPAU66C/9AMo1EcNjQ+VnPzHSclBI9hQQ8PAuhjpfBwu7I51pTPKw6ryiyKDBEqeHyE+CTQSY6MXubidQqSTLJDKQZAXTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381459; c=relaxed/simple;
	bh=6YVkiN0dwk+uOHaHRu7tcR/42szjVRQGmSZKx1kvIJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Fc7AHd68sDyVwLSIlK8zq0FIO2S+OutP13NBuRUyPT6VvfWC2GHdbMSMPMw9LWiip2rld7WfiPj93OAZ2bN99X3EWlbqco/MreFH9/lTWrbEvmP8GArb3tkaqZP8hr64r//6IJw4O7gpU97Um0nKbxyUOEgfNm7+TlznPybK+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1Dz7oky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F84C2BC9E;
	Tue, 24 Mar 2026 19:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381458;
	bh=6YVkiN0dwk+uOHaHRu7tcR/42szjVRQGmSZKx1kvIJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q1Dz7oky8MIc6W7guYe9ks0cRXopE+qOd5gl5e3jgTATmtxZ3hnOYknKqhlQGtEMl
	 epRH6TsfOq2igVEIoVSqP9iv67UV5PWn6fy9X9sCHJpKOkqDJUZEYoQPbSTKGfHEzI
	 i2zhVmyhbaFpj58tAyg0t61v4hAX7mKkosk+ihYEXsacxGvk6zciGgGqCzcBegUpqV
	 M2yXkRLIA2750wxDifU+b38tKSEvO2wQNDKdUsAaNo0grPpghh3i6u8megGQtoTnbK
	 3w4k0NFPO3trd77IEdv8uI059SsFxQr4EyZQK+sK50JQn6MH13V1SNK821mHBxLHMw
	 U23QrYatPG8Lg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Stable@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>
In-Reply-To: <20260323231748.2217967-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323231748.2217967-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: fix typo in dt parsing
Message-Id: <177435775708.81121.1764309542515337919.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:09:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6YVkiN0dwk+uOHaHRu7tcR/42szjVRQGmSZKx1kvIJI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwumPY8dSfBrDKNqs0g+pGJri3WWDi3Iudb35G
 KRTW5giAhqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLpjwAKCRAk1otyXVSH
 0Dp/B/9h4MujSMn4OPjnMYbcYqdM62j5vzyGXt4nRV7Uq01jr9AIcrOgdZKQ3Z02n6syvnS0+s9
 Oid+Jk8vF8+8jPZSA0sghZ0356QHc1LBCPTAT+NvzRn1YgOemjsiUtO4JwCTwmO6STyxIW5Xq/G
 In2xxZdMCUfSoLPPYjLTouuzGf/gsUAaWFtsQo090jnaMy3CUL2+Gg0ow5pow7B+sG0IUp3MIyU
 GQFAGGTorkkBZBWnSspbqQnE3IHzY+sMXDl8CHWwiDr/iyoeVZHkFccJ966nEWiO4f4eisFWGJW
 U3huRXuwT+uVjJF4Mqtn0cVnZDiYwconZEO9UoJh1Jmt/Zrq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,ixit.cz,joelselvaraj.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 838A631BDE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 23 Mar 2026 23:17:48 +0000, Srinivas Kandagatla wrote:
> ASoC: codecs: wcd934x: fix typo in dt parsing

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: codecs: wcd934x: fix typo in dt parsing
      https://git.kernel.org/broonie/sound/c/cfb385a8dc88

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



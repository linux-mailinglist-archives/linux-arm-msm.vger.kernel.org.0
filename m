Return-Path: <linux-arm-msm+bounces-116302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WzAwDMulR2qVcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:06:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D7D702302
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:06:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=i9WwAHEO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116302-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116302-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00B343047777
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965313CDBB5;
	Fri,  3 Jul 2026 11:57:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444BF3CDBD6;
	Fri,  3 Jul 2026 11:57:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079831; cv=none; b=qsHoUkIRihsHmzPhVmsdiAw//pJGCbB6xUiNgFo/11uRriysQk80ubQIF0i5ibHDAY3a0+1a1l7TU4QF8L2ZgcN6yBmUdSwY5+Lkcypc514bI5AqxyWLDF6Yg89caaOeE0Ziv8BGq6y2fd+fs7A/TxRio52FYMEzBHmm8r2jos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079831; c=relaxed/simple;
	bh=LeylfFUIQskpyq+rX+I/Qjb4cjZ9FVn1dRTqv2pVQOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pilUJ6ojobWje5YCHv7wd9JND8Nds2A9zt5a2Peew1RmuA1ScEycCKthHE/aK2g312t0Zgw/VdBZrc/hkK+aSymWYwBtTsPTwSmrSJds0nqVoHjPJXC/NgLKaZ3ZHoPKcjYfHiO04jwLBDostUseb5eUafmAVsT0MU0rUQVm/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9WwAHEO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72911F000E9;
	Fri,  3 Jul 2026 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079829;
	bh=MD41EKc3eGDZUpvmSMHMNkbaQrXeEqhnCbpQ/t29/sY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=i9WwAHEOlTLzJWHMReiFUP+4nidFNWQPoi9oXVVgj3ygsMYgxoc+uZmBU7PwGnfbn
	 wolP1RBGhTxkLouA+NwNRqHCXXIaur9fxbfmY9743Mec9dpkpbr2W9bduSGbSQjHtj
	 WGiJLooN5IDMeluefz8tCz3O3V30Se8cXt+hAc6eQVajZqTPwBYAKyDP4IAJ2bqzBR
	 gMJbY3qOGyjbNYgiYRLDNAvposcxEJSHl7qluZr2vtwMtSobdC3gpQ/k/v5z9gzMrr
	 xgfArr4rTXsEmwYQDO9PhS+xpomVWocDm6ySKB2LbX2rXpM0FpR2wJSI9hi4ESTYj9
	 ADV+ZQd4ZOfKA==
From: Mark Brown <broonie@kernel.org>
To: andersson@kernel.org, mathieu.poirier@linaro.org, 
 Uday Khare <udaykhare77@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260618132054.11010-1-udaykhare77@gmail.com>
References: <20260618132054.11010-1-udaykhare77@gmail.com>
Subject: Re: (subset) [PATCH 1/4] remoteproc: qcom: Fix glink->node
 reference leak in qcom_add_glink_subdev
Message-Id: <178290544322.38925.3535198559099213437.b4-ty@b4>
Date: Wed, 01 Jul 2026 12:30:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LeylfFUIQskpyq+rX+I/Qjb4cjZ9FVn1dRTqv2pVQOg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6OTwKErpwcXSCiuJPcD6UDGBeBMbBL+zM5DQ
 T1eTpQripqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejkwAKCRAk1otyXVSH
 0Jw5B/9RzWRqnBaQK462RVzNBQMPT2tRk00nxoepHygwDuiI1f1KIfXkR6HwqHeemAaRLSxOvpU
 9tWpDQ3I8F40rtGMJy0KwVn0vNK8ZP1zCNDEfKwK8wVcF/RB0k9pFUr97a5yCKB/IFA6Qr5Duic
 25Gy/GH6Y+8qDiNIjJBx6Py+8IZ6Z53TCkV20ehcXKZT7MJQnrD9dy48zKcI06cFq3xQHLHs77/
 jpV7dP3ENHDT7hWqrd9iQS6SMXEegC+aAxnRRdrfC+3x3oT74sVwQJ6mMRb8WBEl2+WrW7c8k2I
 TI7vyPsMTZr6ynhagimrLJnZLbb8wW7ZNo8EN2L+3VAvOL+K
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[48];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:udaykhare77@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116302-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25D7D702302

On Thu, 18 Jun 2026 18:50:54 +0530, Uday Khare wrote:
> remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[4/4] regulator: tps6594: Fix device node reference leaks in multiphase loop
      https://git.kernel.org/broonie/regulator/c/7fd28093b3ef

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



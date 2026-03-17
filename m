Return-Path: <linux-arm-msm+bounces-98265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAG0L0uluWlILgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 20:02:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC32B1518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 20:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48529303EC19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DF83F87E3;
	Tue, 17 Mar 2026 19:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQvdaKw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD54C3F7896;
	Tue, 17 Mar 2026 19:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774076; cv=none; b=P5qt3BIFI9L4ORph9Jdq7lokl/onsvU8Jh83bT83LI2JB3RMk6bcyVVQP3H8P2WHMGv9qAgcSVVfqWGKTcHXfeEsXseblO2tFTvU72qngroRByuPgruBtp3IsXY5gpHVmMN7/QbbjIcm9P5KXrucxVkdXTskLl487LkPmTKxS7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774076; c=relaxed/simple;
	bh=70uFBpIkG6zJn31CeBEkpGdC6DKn/lCnoJjmFPoaaqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TLTQGoTnBhUI+KczDYpufqsuYPlKzgoJp7FQODLqFRJq6MQQyMcPXLVe+prNfpETNgVFBlUO8d85GC1XDto+m78Uh9FrOqjYjr+XujW2DnzHogeIBjFkOS2i4jDKEdQ8BdQ/2FsVMFkMnCfNTU0vyu31DkXrOgFWNu/AniT90Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQvdaKw2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDDFC4CEF7;
	Tue, 17 Mar 2026 19:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773774076;
	bh=70uFBpIkG6zJn31CeBEkpGdC6DKn/lCnoJjmFPoaaqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RQvdaKw2Q9zPjO9xCkTC9d8HT8RZoip1L8X6aIO4ww/rRAcu6xwQDtjvVihmjFooQ
	 76yxIwmh7U4WhDcqd3NqfmXHOWLDnDOb2lBFOst8Bzovpca3gVRwqY1VQbS57/GT2o
	 eWSXM2Bo9eMdb/6tfzcwThynl7dtXxaFPpbY3jQ66XbOD1fK3Ysj+zNvdNX7zMe45y
	 OGMQ1caYPihS9/uLWVXHiNgFl5UndC57gvDNRQq1VupuakzQ0eX+3rh3WfVh0G9O1C
	 0t38SiwPemvpmoKpSdyO4Tf54PYa90+k4Wxifc8BXnYgBQIToF3x7gDmgsHoYLBtJ+
	 JAGYiC+CFOXHA==
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com, 
 konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com, 
 jyothi.seerapu@oss.qualcomm.com
In-Reply-To: <20260313-spi-geni-qcom-fix-dma-irq-handling-v1-1-0bd122589e02@oss.qualcomm.com>
References: <20260313-spi-geni-qcom-fix-dma-irq-handling-v1-1-0bd122589e02@oss.qualcomm.com>
Subject: Re: [PATCH v1] spi: geni-qcom: Check DMA interrupts early in ISR
Message-Id: <177376733121.112898.6684043486446588264.b4-ty@b4>
Date: Tue, 17 Mar 2026 17:08:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=broonie@kernel.org;
 h=from:subject:message-id; bh=70uFBpIkG6zJn31CeBEkpGdC6DKn/lCnoJjmFPoaaqU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuaT56I0NutYsaNTM2u1wINFRWmitgr7ISEF3J
 HQ5oaJym+iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabmk+QAKCRAk1otyXVSH
 0FmpB/40rGdbaevWLi2Fnyvedp6jEvN7FHuR3ZUj3zkqCzPLFtEsEQi714CD5098IIHFVIa61Ux
 B8N3lT/fU+2UYL+RNZxj9ikAXDVMhc3YIglV6CsqPDNyWDxHUMqtgo9H26gMl88nxGKxELHtxK8
 6F5WDYemrGGV4996s0OnEZ1gs0kZU59qmdDrdRRo/Gc3ALu/nc9HNnmmzQ9BQ2/i4FGObu6uGVd
 zT41/yEUws4w9YV5cm6SGY6b5o73RpW95iE6pAuoel3hBeve/5E2kg3TUsY95a/VuVZ1yChDAz3
 cnCg35Czy/BwnYjaR5Rwc5bRJmNQRj8J+D4jxGk3SSMTVmwb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98265-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BEC32B1518
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 21:49:01 +0530, Praveen Talari wrote:
> spi: geni-qcom: Check DMA interrupts early in ISR

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: geni-qcom: Check DMA interrupts early in ISR
      https://git.kernel.org/broonie/spi/c/8c89a077ca79

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



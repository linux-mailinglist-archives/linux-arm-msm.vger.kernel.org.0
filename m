Return-Path: <linux-arm-msm+bounces-112280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4Ai6KTqcKGonGwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 01:05:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D7664B45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 01:05:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=exrzL2BL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112280-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112280-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D791D309087B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 23:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B493F164A;
	Tue,  9 Jun 2026 23:05:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C89F3EF664;
	Tue,  9 Jun 2026 23:05:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046312; cv=none; b=X0guE0awU0/3M2icRXx5VykhwlNRvqTXN/e+x4Z1G2mN62wQfB48AvRO3XeP6ddi+75nyC1IisT5EpqIlEPVdYoRzv3sEPsJ1HXGHvnGxifimOq90U6d6JVqTSsaChioeirEXXC/EMqwvVcVu0vcL87yOJjRuuF2bTFuPXvjmpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046312; c=relaxed/simple;
	bh=WBSEWc9Ub9ajTgf+r05KEz8QdxvxLsBmicHP1AmhPEY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LvJ9OEiAJfNrDrauI6OmvKKkH+GRId+sZ/+w8EyieTcqpDmwCo1tR/eCuw1zB2WOGwtf6i6QtUAcwudaRX5jZR86V3+S/pqUVjvmdnPUzaCBikHFEPxlejvW6n5mWQMtcM1RuGcMF7vQzSXqH4AN0iJblmxsdPObbaIZLVJd9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exrzL2BL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F731F00893;
	Tue,  9 Jun 2026 23:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046310;
	bh=0A6mqkysPmaX8VnA4nZH5iJqCKSPfw6NYqzHjo2z4l8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=exrzL2BLzNrEhXFOGd3+3fZKc8CTLay4372REMPSGK0XpwcJ6j824jbmCKChMuSp3
	 3q3K33Ey1D1+dP8mFBOzjA9W3aViAOYcxOpPPrfNUiKDuR9IlaSFnqkIaYNnxjyEBk
	 zwPS7vqz2v8I+5z+zSxKbqap8wFN/dq9k1kY2KVgHw4pA4jNqhhx8XeAgjrt3EyoGF
	 PKtsIGNaJnFJmiqQ3IrTOuwGf4wf73Bb1dEaQIv9fr7ySHLvybkayLBmk9PHooepDe
	 VjDe9j9d0OVa5hKGkAG1eHjmf5Rf2hKsh7wMhz5xC8IARORlvcMSg4HBSbTJpv20Ca
	 WqNPBNEm8yNPg==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260609-fix-spi-fragmentation-bit-logic-v2-1-e18efc255563@oss.qualcomm.com>
References: <20260609-fix-spi-fragmentation-bit-logic-v2-1-e18efc255563@oss.qualcomm.com>
Subject: Re: [PATCH v2] spi: qcom-geni: Fix cs_change handling on the last
 transfer
Message-Id: <178104125260.34323.1551253876744290838.b4-ty@b4>
Date: Tue, 09 Jun 2026 22:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WBSEWc9Ub9ajTgf+r05KEz8QdxvxLsBmicHP1AmhPEY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJwjvMAfUU3inP2j43gKV+hOuWYknfX6TOIcU
 toXBbdspG+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicIwAKCRAk1otyXVSH
 0IIaB/0ad8ndK3FL8LouctO4mx5Pb7fLl0cs5ONe2t8kwVCtwM34ap7J6OqZ/AwJ5+q7WobZR7y
 5bYPMfdTKAnI4qfIcUz7/PaBPY5nl6QpsSYW0oBt59W8Yp254ALkJqniizOL+3p0nY2uITaTObC
 lAcvGmpZ2eUfqIHXZL2H+dOO2/fglV8TQtObvs+pWEsA//36Cd82RDZUQEOG+taoEkUUQbfvh3O
 bW9m1cGTgGldnH/8+zZssi1DJvLLQjhjrayu3YBz7q13rrV6+kQLSBVGm+XmMDI4SatCFxgsfDX
 KgqPdl+PVFZBfqSprENVl4onfu51cLzz2P8sbAF8wPCV8BWZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jonathan@marek.ca,m:viken.dadhaniya@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112280-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 124D7664B45

On Tue, 09 Jun 2026 14:13:09 +0530, Viken Dadhaniya wrote:
> spi: qcom-geni: Fix cs_change handling on the last transfer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: qcom-geni: Fix cs_change handling on the last transfer
      https://git.kernel.org/broonie/spi/c/5ac5ec84734f

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



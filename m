Return-Path: <linux-arm-msm+bounces-112281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dEx7FUecKGoqGwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 01:05:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEEB664B51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 01:05:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eo8oPCId;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112281-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112281-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C9213023706
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 23:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65993E3142;
	Tue,  9 Jun 2026 23:05:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A5368287;
	Tue,  9 Jun 2026 23:05:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046335; cv=none; b=talNcIc90brWVr5CXWQ9igi4iUVht9XwMRizSONXRQbPtWHF+nxlG5uoYqvWB+34FgKFWq9AX2Xw4gWqXrNn10qJCn8bFntlxWpkz0fOu349H+rrk2cbVMrG+vck+t46mI3zKbry4jugh927Wzckt5uUZgJnNgSwnQXpCT+kvUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046335; c=relaxed/simple;
	bh=qtcaH8L1yvluTYbrwvjWN4eUHVFuFYQeSf7xQZO5ssI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mSw0PhMmR2bP7QrUil3hUAuA+ipNPV2UaYquOY777zP5pxNLQIQG7HetMY82BRiBMIb5Jta0yq67dEmEHuFtk4yoDcxWTDtMJRLxivrx2KS9Z9/T2bCj81lsiJSLgtQAOwBVcW176dLTrGVZ2+Aa8Bdt9KHUv6VUPKnCK+WY2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo8oPCId; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99F61F00898;
	Tue,  9 Jun 2026 23:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046334;
	bh=yT+5W4H2TlPWKtpdh47hOBHtSwupgqsf+iMTzAB9YC0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eo8oPCIdnrtV24DIf9pJ0NkTUK1QbfnktXv9OBpd/nvsvVcgAfoeoZagdu3H2Kvo/
	 YojjiL1toX6uuedw5yRYjaJnwMNloCHU/s1PrU4DbIRywalaAxRlmJe0s2o535FJ9i
	 gmP0gY+Y2REXFVA/pFz6NZ4vD3yTiJ+EEpySv6itHvPbjAqi+b17T7O2Mw00seYglf
	 YSm/NNJkMbawhmgxpdC1K56EkH+OtlVcUsQYvJL8Odb6/KgvPNV+9w1IVaPqxmWiSx
	 fuZbhVq/k8sLkHkkbaRXw6zzkkoiAUXh63gGXbqnZYeg8PXmgEmxXxqnE/pDgVevXm
	 iH1CAjkvdGJYQ==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
Subject: Re: [PATCH 0/2] regulator: qcom_smd-regulator: Add PM8019
Message-Id: <178104157125.34323.11061766000197294354.b4-ty@b4>
Date: Tue, 09 Jun 2026 22:46:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qtcaH8L1yvluTYbrwvjWN4eUHVFuFYQeSf7xQZO5ssI=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGoonDqgzCd3S5Ere1H3bu5vA8rWNWwRPxGB3h2ycM8Q41T4K
 okBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqKJw6AAoJECTWi3JdVIfQHc0H/0eJ
 6UpqB5LCb49w4KSAriBQ5pOnkgxGwR3CgRDSZJW80MwXwoAIbVKTsAXLlzf3s+Llnmf6GmLJKJG
 Bw3ms26/rSu37QzJ3ddmJ0RqYayQWDALEftk6rPahlckhuzjs9Wp0NB1+O3v7Qe9KleCISQRkUz
 HvEHhFgNLzQaGPor58TFB7yoVGZMzL0mnhoUtYisnDxPYS2Xjr6CBYeD00tg72Fu1aSe09sLDvr
 ZZ9slck+1hS2fARdZ3M3uZ7duAixctfHZijd3Bj3nPuZzb0etZSwcO1HQPBGUfPSwfCQCB4213Q
 HUz20HIvKmJL6xai10wxmEKRk2KslZkDJRnpuJw=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112281-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EEEB664B51

On Mon, 08 Jun 2026 14:05:42 +0200, Stephan Gerhold wrote:
> regulator: qcom_smd-regulator: Add PM8019
> 
> Add the definitions and dt-bindings for the regulators in PM8019 to allow
> controlling them through the RPM firmware. PM8019 is typically used
> together with the MDM9607 SoC.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/2] regulator: dt-bindings: qcom,smd-rpm-regulator: Add PM8019
      https://git.kernel.org/broonie/regulator/c/b13a590e3aa3
[2/2] regulator: qcom_smd-regulator: Add PM8019
      https://git.kernel.org/broonie/regulator/c/5116c7f0e7ba

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



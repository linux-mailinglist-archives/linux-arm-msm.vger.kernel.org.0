Return-Path: <linux-arm-msm+bounces-109921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFFTO78KFmq/hAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 23:03:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CD85DC94B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 23:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C084301F1A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 21:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691993C1F3A;
	Tue, 26 May 2026 21:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khW8M70m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8092264D6;
	Tue, 26 May 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779829437; cv=none; b=CZjivNn9FIovnELP4n+iEvdG1747kvUgwIKy05y1OU1eELMw6lj5Xf60FwCiY8sZEh2gIssyRr8Z6DQzbQrjnVLROGUUanumJnlITj7IEvmNmK8gR+KcsRqX+efCzr4+QDjhnp7oFcq2lZBFrmDnieG1ZXATxJtJhj27X8FfXzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779829437; c=relaxed/simple;
	bh=CaidAtYNQcEH1CXuDGvEduKnKl3V3spNZfnRwJa5y9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QqxdmCGERI+Fi+6/eOdj2L/E7QH9imX04uLdlvq3ZsRC9Ki4cAFMHpM/MVCtTTetN70/wDjfc8AzUWAow4RwjTtjmq3Fc7U6874cXAwmi/lgCYR2NIEfCkvb0cVFof7EEXf2hM3KWMtzWTPpTaa7rsAXNHSo0rlAGxq8jGvDNUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khW8M70m; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E6E1F000E9;
	Tue, 26 May 2026 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779829436;
	bh=UGJ2Q9JB0wXH8lsSmU4R701MU/I7n0vwE4S/DLdljlA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=khW8M70mzbCKVstjEn6QvJ7mB4lSo13MmbyJg3UYQ1lIjSTpbYppUIu/Zmyuk0xMo
	 ZsT1qiidOmJK0/hlPy8H74EK63CNjwcNPMTQl5FfgOhZXwA8BUso7L0sE/k7AFhIC1
	 zn3mHqruQ8JWVqqbu7DLPX3VKfTaenHmozdhkyw8NgblyYo1mkpPWt34CGq9C6jyGs
	 WxzZ+ESfthrDmabvknVoh/3p5EFpIytdkjWyNK1/y4P5JFBfrhEXjX+tEeI4liOJMt
	 9+Dz1xBy6lcONzFYzKQg0QRISpkQQ2LzvzM3dM19YM7pKnnfP38lQXKQM3iuTLxN3z
	 kzKlHZoOMp7OQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, sadre Alam <quic_mdalam@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
References: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/2] Enable QPIC-SPI-NAND controller for
 ipq5210
Message-Id: <177982073388.88748.17750336143894340854.b4-ty@b4>
Date: Tue, 26 May 2026 19:38:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CaidAtYNQcEH1CXuDGvEduKnKl3V3spNZfnRwJa5y9s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFgq5s/18gNuvVj+i73QPnM/XyBcFbIWP+RfvO
 /Igs1FfqlSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahYKuQAKCRAk1otyXVSH
 0O+nB/9d1fAkz8S0ej8IJKx8AnFtN6fqBzRQJRhdorDUmBLQGzxv2PlVDHTq6gP6VH5Q3XqVHqa
 WzgSrQs9J7d4v+ZGxaYHerVUj8Fj+iXYZx44hpkalQbLl9M3Pzi/qvP3fV7xVwdOr5PM0hc4yGY
 MguCkHdpU+ljOwb3xdnNcU6VxwW9yJbQneL+FkUFVAp6dIETh/uFcCcPYnHVYHQ5WOFjTyWsYoj
 srijKmAxvDIA/bc2nwYmCtH7gxPh/Qq1yXpTX3J3HVK15sdAAh/CxwQfgAPReuOkPTXarYThXBf
 +mTfkPjR0ogVpSEkM4GOm/Q23De/iXz8UYN7ooYqhUdRO1Fk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109921-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 63CD85DC94B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026 12:15:30 +0530, Varadarajan Narayanan wrote:
> Enable QPIC-SPI-NAND controller for ipq5210
> 
> Document the NAND controller binding and add the DT nodes to
> enable the QPIC-SPI-NAND controller in ipq5210.
> 
> Functionally depends on [1]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/2] spi: dt-bindings: spi-qpic-snand: Add ipq5210 compatible
      https://git.kernel.org/broonie/spi/c/60474437af5f

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



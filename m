Return-Path: <linux-arm-msm+bounces-105830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHEwGQhD+Wmw7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 03:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDD4C5A0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 03:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 981EC30090B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 01:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DFA34B192;
	Tue,  5 May 2026 01:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXzwB9AW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA61345753;
	Tue,  5 May 2026 01:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943300; cv=none; b=tawcnD2+o4/7AbDUO8wqLGRpyBPkv9dpKlTK4zY0m95vw/wP4+rX60JLfihoXFQJLvNdO3eucdRJ8IIyXZK/o+wlgBqdl1U8KuDZV1IAF7n/r8jA+6LGOUcNbMbke9om78Oq5dzWlVqb9Ja+ZCjqnZNSh+GTPSWKz2nRUhUeKnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943300; c=relaxed/simple;
	bh=SWCc+1/MA7nOSEbVmMSzRCEyMGZi6ENRt87ar10r8m4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YGVMWIZvYsTTmNxRqj+Dyn5KqP35y6GrjjJBUUPwOMQHKuBuTUjBWWlNgPOE7a1KCBM2+EejKs4Wi322E1yQQN9jsntaBAfWtZboYBBdV5GYJobq6iIVcAD7vRvuJLCt0rtFhUJpe+jkJRVwwLAXw7zXCWmOS5GHJkqZBEBB04A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXzwB9AW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C495C2BCB8;
	Tue,  5 May 2026 01:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943299;
	bh=SWCc+1/MA7nOSEbVmMSzRCEyMGZi6ENRt87ar10r8m4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iXzwB9AWXOmyugMFgY3pBlhyDzVKXAb5BQ31kDN7mhiRJqCBiPUS6yjxifsu7XuX3
	 65stG8l3JaQdJR1Ce9GoT0Ihjf1BWICexbWvet2UTuuMVwpwzfxN86qs1aE5/FN3rM
	 NI9+QB0OUOSRavUC7AR9HwZZHL0halpkVe4tappKuHUyJ04pXsq+2uKYlOEENkA4J/
	 R3+rJrg/ym7uZh1SadgpCKaZTG30r0G11jmAG3Nv5lxsjSH0TSwUVTJzzzh8o/lMli
	 MSl+fDcb17Yv/hG9kOQ19mlhi9WJGdwzVd+8ObrRlM4VwQCdBDpL2F4Z2tLsmNisEG
	 vuzvdk/Aa6pDQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/7] Add QSPI support for QCS615 and
 improve interconnect handling
Message-Id: <177790051963.458539.7193661612497763111.b4-ty@b4>
Date: Mon, 04 May 2026 22:15:19 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SWCc+1/MA7nOSEbVmMSzRCEyMGZi6ENRt87ar10r8m4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UMAzKOyYb6DnE7Okj2tLqjjDy18Jjq8hhIfO
 KD2RdJEfriJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDAAAKCRAk1otyXVSH
 0BgjB/94HlILyz+DUAn72ikTod0IPQgowq3cffTHXB0QbAY7TNdv+s55VZqc+9R1XCGpIR+LuPR
 cTuZKdoWKCIGsm49rzXm4p9y3PaA20ma88IRKDpBqcoIpaJGWPJHsZyRKcbNiSdtip2/BFvB1ev
 d1Ob6SNYCAqyzvp2rSOemviosT+YSYD3QSCcL70+kMayo1KsiSZYQPhiUbsbPMYU3yEzBPj2RXP
 1pAzNk8zZwA/bspE0RQlNks8v8zb+sZj1Dz98RTsito+vpt+cHXGlLINmcTVFH7iFpkB+7bQMJ2
 B+MixROUYJC3w9lxWGpgvDV2SsIRq5EFmgSoTpEGaupz6HB7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: 31CDD4C5A0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105830-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]

On Wed, 29 Apr 2026 22:31:35 +0530, Viken Dadhaniya wrote:
> Add QSPI support for QCS615 and improve interconnect handling
> 
> Add QSPI controller support for the QCS615 (Talos) platform and improve
> interconnect bandwidth management for QSPI controllers across multiple
> Qualcomm SoCs.
> 
> The series consists of:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/7] spi: dt-bindings: qcom,spi-qcom-qspi: Add qcom,qcs615-qspi compatible
      https://git.kernel.org/broonie/spi/c/0065dc1fed2a
[2/7] spi: spi-qcom-qspi: Fix incomplete error handling in runtime PM
      https://git.kernel.org/broonie/spi/c/d283d5d4d9f6
[3/7] spi: spi-qcom-qspi: Add interconnect support for memory path
      https://git.kernel.org/broonie/spi/c/104b5e9b85c0

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



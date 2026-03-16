Return-Path: <linux-arm-msm+bounces-98035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNzlJEp8uGmVewEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 22:55:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 156992A12E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 22:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB1AA302DF45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6F336A000;
	Mon, 16 Mar 2026 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laeeFBBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D69369224;
	Mon, 16 Mar 2026 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698117; cv=none; b=k/zPsBV35VTRFESZjYRN86shA7MszKQkdr8jtnF/nVChUAZ+hd3qVtmpuAlRkT0bn+GQooKWsGOS8WfQshbIO8R3IWEjSTftJmoDNzN7vpZELmR7bSICqh/S59UTgzwMsew7U9bL84CYfnwk3kvcQ2kdODTy1rJjOgAa5iRdz/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698117; c=relaxed/simple;
	bh=4gk6KEarzfm2kdgPRfA6Tz45ZUbKQPH4/xoOrY4EQpc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SVMz254LIuQyslQTa/SfIsqgmpm6YsVoSDApZMuPSTgiPtBnLOXqLy0KqJzWz9NcVV3yPSMWpAu/WYnJaoUqKo/MFkT/aWADkAADIOX2Z5E8skPfpJp1PcayorLF1qpbA8RofBuMa0vfRwa1voCtt2HiV1DQz3vDg9ckF8i4sOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laeeFBBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD2FC19421;
	Mon, 16 Mar 2026 21:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773698116;
	bh=4gk6KEarzfm2kdgPRfA6Tz45ZUbKQPH4/xoOrY4EQpc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=laeeFBBMD27X+POLxHsgB26bovJlwdYYFTlTP6ooziTX4b6HT1S1p34blXuBTqpDq
	 fVtmwEpIuSpkHQsShuv1hoPTRiuCBC8ZvF0EKpjcltOAt1fF5uAi6upfZQ1vvIW26Y
	 EXgThLVmqlE/ZGTc2GaBevlpP8C/m6thW+sB9keUHY7q2GcRe/l55A+6do7H977+9b
	 bArKWH2226hT6JolVwSLUgwzhNoPKOG7F7ks1crvGytoHXzN0A4xBOpy2NjmpOD029
	 hC0NawV/N9eGH5uH04tX2EJKTVPD0EJ/WEixfhHEhkkS/fR8MomaEtaLdl5AJQ2Mnm
	 Ncjm7EiVgB8Tg==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, 
 =?utf-8?q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260304141006.280894-1-cedric.bellegarde@adishatz.org>
References: <20260304141006.280894-1-cedric.bellegarde@adishatz.org>
Subject: Re: [PATCH] ASoC: codecs: wcd-clsh: Always update buck/flyback on
 transitions on transitions
Message-Id: <177368660737.157385.2975528292736020238.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 18:43:27 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-f420f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4gk6KEarzfm2kdgPRfA6Tz45ZUbKQPH4/xoOrY4EQpc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuHxCWjHcAbiDrsksI8Ipyj1CG3ikZzU4Pd5Oo
 TaN0m2eENSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabh8QgAKCRAk1otyXVSH
 0CGDB/9Fql/dXsL0iQbxS9xK+Lp+mQgzOEx4V5Mxd0/uU7rbQXqESIMD2dLSFB96wElbP6ozFVo
 wwsZO8lHq/cbtZZJPrgHjfnHUD5yafCg0HvuV4VD+TkmLe6yHgvJ3OUVRzeKpLNWgp/rDlUD+RV
 /07NPqGpUhaP5rmOTf4JS2c+g+/ycbs96obafe8FCWh3k1NB7xHSGSLO14hvCwtfyhu86isRICO
 KGOekFhocRkyTUhOyywLq/S+CyQKsLorzUwXxh3lIAbwzlhkOAphEHUjN2VypxbfspW/ZPSPQUV
 iiG9gCVrdgJGyukBYk9z3aVS/A0bXsoMKExVJHC2HBuNOLN6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98035-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 156992A12E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 04 Mar 2026 15:10:06 +0100, Cédric Bellegarde wrote:
> ASoC: codecs: wcd-clsh: Always update buck/flyback on transitions on transitions

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: wcd-clsh: Always update buck/flyback on transitions on transitions
      https://git.kernel.org/broonie/sound/c/f8d51e903a6c

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



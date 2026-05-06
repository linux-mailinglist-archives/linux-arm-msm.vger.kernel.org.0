Return-Path: <linux-arm-msm+bounces-106118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKZ3GjhN+2nWYwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 16:16:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D24DBECA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 16:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F82630A8D43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 14:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3DC47F2E4;
	Wed,  6 May 2026 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ft2erqLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BBA47F2D9;
	Wed,  6 May 2026 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076485; cv=none; b=QdfOi9MKRRwSxtOlnKk0yCtY5QQpLK0n2WI/bgSg/Tvg/+EyKXbPc/hEbirKLuhrcu4s+MaihPKQV2E9ON/WoWvehBB3gQR24o0X2Mb1T4NDKz5nwC2CeFxeOIFI2LFzAX3byQ29FxSedzCryHlepwRpdbEzq5i7dHhk3xdJ1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076485; c=relaxed/simple;
	bh=PSeesFMOJdG635M6qiABSCxM5EPByKi9f9cYiq2k7qk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vEX3GmIhipV3qJINfdN6uWLOCAwtn5Fc0AE3Aq2mZE+0VAD2ycOweJpEHTymG+83w06IGKlrq5HP01pybii9JN+TY1Tz3OTGIdmbXy2n1T/v0AYDpMt+kPxCbuvbhkCks4wIQ6E9Br3OVa46DsddEYaS3JF12ckoFP4l2fTqZ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ft2erqLv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E20BC2BCB0;
	Wed,  6 May 2026 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778076485;
	bh=PSeesFMOJdG635M6qiABSCxM5EPByKi9f9cYiq2k7qk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ft2erqLvTqaoYm7/P9nSh3sbTkKbb2XxXEpiosrIbSX+HFzS9zEKwwv43AXHbGTsy
	 XQYkxHoAd7QJG7e+yK/R9dnikkFqVvqhEzTbHat4dsm+VwI8l4C3nqUUNEia7yAvXR
	 UPRNzHViprEXVcugSOlJoC3TUXQ+UBvG+xHwEmCkKpcgMzOvZ9+R/hpAXFIRBiPOPC
	 sbWFOyu6Ttvv2q4DDGb0lzHDnKTeYfxwZIrTC9vcNQw01GvXprwdplhhQvtBSMmB++
	 hpiHfyJan0YzkuDIb+fEUtQFiTwnzUl8sFsi9xggEScX5G5d1ueyCd/cqK5j1Ovlt7
	 jirSRBqG9Igfw==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 David Collins <david.collins@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
In-Reply-To: <20260506-fix_pmh0101_ldo16_index-v1-1-cdc8708b01f4@oss.qualcomm.com>
References: <20260506-fix_pmh0101_ldo16_index-v1-1-cdc8708b01f4@oss.qualcomm.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix index for pmh0101 ldo16
Message-Id: <177807039664.624351.3601725657045579244.b4-ty@b4>
Date: Wed, 06 May 2026 21:26:36 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PSeesFMOJdG635M6qiABSCxM5EPByKi9f9cYiq2k7qk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+0tCH1QsbqEyiCgJx3xGR1wNa2Ygq9g/IiZpE
 2B1o3sxGIuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaftLQgAKCRAk1otyXVSH
 0HLMB/wJCh/ic6WJCKDOGy/6cgRp/WVV5Ly7DBQK95tPoDrehdBVYKpocFMES9X41jNe5SHFiNq
 Cw/E3ma97UOp/JEIpIGiAT+qaGnIufrKXmBgYjUoFr6NAoDckPw2b12BaOm6EncGKyqz1s1u3Oh
 4TTVt70b7PY18/yphxk81npv3bogAYcX62J/c8NRFKqDkp9kt1JSaR8ZXU5bUARCSPMxqawlsax
 5fD5uoSqnyvMzn04vux20ASDM1/aZGE2cBdX62nhGQ/X4c4hU5bNz/XvTDVJsvo/xobck/DxR/A
 s6oacURTQ+cjQ5bEyLNljWT+K/sxaYWbDLkQYSPBiCH4hTib
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: C81D24DBECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-106118-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, 06 May 2026 02:28:51 -0700, Fenglin Wu wrote:
> regulator: qcom-rpmh: Fix index for pmh0101 ldo16

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/1] regulator: qcom-rpmh: Fix index for pmh0101 ldo16
      https://git.kernel.org/broonie/regulator/c/628497e6d925

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



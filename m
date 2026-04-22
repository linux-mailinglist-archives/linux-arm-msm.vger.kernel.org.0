Return-Path: <linux-arm-msm+bounces-104173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMUEFHwo6WljVAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 21:58:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0FF44A582
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 21:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F67D301FC0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D853F23AA;
	Wed, 22 Apr 2026 19:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RftF9dwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9E3F23A3;
	Wed, 22 Apr 2026 19:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776887899; cv=none; b=LvJqVQ8ON26E5AS0GCfXivUl3kDLvMx+nHHs66Rlnx6mYzv0riHgcb5Ce81HsWUSwO5Utbh0EeKxK1m0WMlkz6yMgLnIRTLwYN8IWaxX2UxGHHcPzrQiHO6/gfB05jVZwHRVmpmKGCPliBChAVIx17tmUjS4ZOFOQsT/VDXflnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776887899; c=relaxed/simple;
	bh=6zTbJKgMDFIaC5AlChX16Aj5rIo/9W2/MPARet+KSgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VD0GxFqUjMCoeebNCq56KI8gQ7jbER/KdxxVy8PJJoWfrLgfVcWheX6yaeQKJTbbNl4fMuB+elAs/y8ZJJ1occcLX5qQNiz1IgFzZn/7Wr1IfkI67OOHXGGCwccJmvhfBDZh06PoFy7lXPVYq/4NW1CINBRW7oVo3Uvl8zslPDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RftF9dwC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6F4C2BCB3;
	Wed, 22 Apr 2026 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776887899;
	bh=6zTbJKgMDFIaC5AlChX16Aj5rIo/9W2/MPARet+KSgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RftF9dwCDYq8X3rfRvPL1a/JhHb80ljpRndZJAztTQzGhCyp80juBF1ItndMvo52Z
	 dR7BWVBZQ8stuAnl/+WFC0Z49++TeIjoOZ3LCAsFcjtJAvrJ2MFocdvlQuPlNSPqwo
	 EWrhaNNzlWbpzA7ZAnzb/nDqfCAElPaHAidSlMc//xmM81JkXYN6NeqV1pU9DvezRr
	 4v12WReXSU/kyYGG4cDy6H6MxA07WF1UX6TAKl1GBVqiJiE3ytDtVpfG1SHrB/o8lS
	 DSeuXCQolFYH3+7Ygdv/bRDtLU+5YDYyLwP8Mjaf/tS9ZsA8PFi0yEEAspPdvUxLrc
	 6Bwrt9LiqrcIQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260422083338.84343-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260422083338.84343-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] regulator: qcom: Unify user-visible "Qualcomm" name
Message-Id: <177686248514.36226.7640881642814693000.b4-ty@b4>
Date: Wed, 22 Apr 2026 13:54:45 +0100
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
 h=from:subject:message-id; bh=6zTbJKgMDFIaC5AlChX16Aj5rIo/9W2/MPARet+KSgo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6ShYXQ4SSt5Zzoaz1q2mtJzltJM0Afnnajpjk
 doPxHAG9UmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaekoWAAKCRAk1otyXVSH
 0HsXB/9PDg1IHzNhVJqjfU2/tKx1yqacExV8dnvarabCjrhZgz6/pUV+XMUzQ813PDMOOXhFjIv
 3AUSu6AKOyMcy17ncRD/ZCrFD8Lg/eud0pflQpHG1LTZBlje9iobL+vhrSrut1XemCu6UYRO7A4
 iewgy8BqTLkLqVwsnNr3McweA1zqG76/KzhzFWcK/x3lg6JH1sGbeGomCFJfS37SWbheC5GA6/F
 ErfSIeUoSGv6FY32szMgC4a4K/WLXrJLi9FHymGRQgyaC7RUvU4ovRbXTGQjCooYOnl1ccCUn8g
 3Lfs9ogbhECwyuUx8csMVrbqJYoZOj7HQuXgqfAWVzgv3Trt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104173-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE0FF44A582
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 10:33:39 +0200, Krzysztof Kozlowski wrote:
> regulator: qcom: Unify user-visible "Qualcomm" name

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/1] regulator: qcom: Unify user-visible "Qualcomm" name
      https://git.kernel.org/broonie/regulator/c/2af72ec297d1

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



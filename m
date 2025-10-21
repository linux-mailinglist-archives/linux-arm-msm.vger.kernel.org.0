Return-Path: <linux-arm-msm+bounces-78151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD2BF6160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA7418C6753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EFD32ED59;
	Tue, 21 Oct 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OINVbpEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D92832E6A8;
	Tue, 21 Oct 2025 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761046639; cv=none; b=iY4kXwKqgVpX6bSDbvvngCyolELLhC7NABRonIXi1n2yyOD8zm88JJqLxtymJbDsWJv/LqjRPHf6jVQJBobU6+MkPiSduIeRhE5mscKlMi1DpserTwtB9UKx8+YxzRmJiFThRdIFtkEE/s6BOyuryI/MmpMf/l53aMTpdMtM3BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761046639; c=relaxed/simple;
	bh=rlc3BnXF/BIE+14Y/akew+B7NiG0d92BARr2yNUa6ko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i96EPGSdN2KmbbvRqSV0laW8iXz9IQFfiDmu16imiFnxJ/831wVL5TymfcDVAvzi00kvr21c4vf9ESnNW5J4jBntaz4fJDdvkdLuP1LC3uV2altkVmj55uVamLZPu2AHa0GlrWiUaY4WXS/ERHPlaFxwJCKazSw+eYFY1tBvHF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OINVbpEd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A37C4CEFD;
	Tue, 21 Oct 2025 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761046638;
	bh=rlc3BnXF/BIE+14Y/akew+B7NiG0d92BARr2yNUa6ko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OINVbpEdg6lsbLAMFU+ZjkC80QADs+Nk4Rt8gJZSOyTytmvIHIQcpQ3CagvstxcUw
	 r871pDPoxdRQHbpAmLQGiCsxz9iH6oKlKegy32U6li7JOrtxO2E+R7IRIjae5U7jOt
	 6MYvKoQr3z60fikOoLBBonruOPQufljh92uFdoR1+ZzbgUB5iLvDsZBqsnpjwtG0iM
	 ZFylpkjy4mipnEx19I41ThayXH3ynHtxN5vM/ia/LHBnz9MCaKtPy59zoop2ErId6m
	 waJkFuUPMGBo6ibm6OoiOPs5L7xys/11+cbB1bVsdTWqHyAJL0Mpq07wBbMthl9tWV
	 rmILgLkeujIuA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, 
 alexey.klimov@linaro.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/12] ASoC: qcom: q6dsp: few cleanups
Message-Id: <176104663701.21978.12535064699762499813.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 12:37:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Fri, 17 Oct 2025 09:52:55 +0100, Srinivas Kandagatla wrote:
> This patchset does 3 things.
> - simplify code via __free(kfree) mechanism.
> - use spinlock guards
> - few cleanups discovered during doing above 2.
> 
> No functional changes
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: qdsp6: q6asm: do not sleep while atomic
        commit: fdbb53d318aa94a094434e5f226617f0eb1e8f22

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



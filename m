Return-Path: <linux-arm-msm+bounces-32504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D183D986447
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 17:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B61DFB36084
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 15:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FC91171C;
	Wed, 25 Sep 2024 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EH8GCQxn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193461A702;
	Wed, 25 Sep 2024 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276997; cv=none; b=O91WauQCzGbfniAxHgAaE3p4cgs8iVWPrkl573/nDFtrmHJ89TWJkoqUb5v0dynClxf5/vkaxF9t6RQnQhRTpgZc+iO5EE1rpM+6dMhD6+dwkRJAOxWvskDtE454vhRziwtV4i1Ty/MctH4T+fs+Augamz6Kcs81NQavRjcPBMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276997; c=relaxed/simple;
	bh=v6ZqQ0h3Q4wFy9NSRlR9T2wiHt8IegbsTzeMyUTfV/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ANzW6Yp9Sig9JeHLWqs1Ng4F2aa8sjd76vPEceYPTv9dqcp3aIraxVQpGkJTKU0pA1vqPrX/n80yWVhSYnTsW3ZfUEtPKDxCoQ4qRy5lt6ducR4cwcLnhuWYmDA5FhaEPKEipxJv79mNoojggcLCS9Om2IL4m6GjXBJhRL8tMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EH8GCQxn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E28FC4CECE;
	Wed, 25 Sep 2024 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727276996;
	bh=v6ZqQ0h3Q4wFy9NSRlR9T2wiHt8IegbsTzeMyUTfV/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EH8GCQxnuNLmojJvnFgDo2oOw+22mOTHKQnwSFJhAIxA7CHF7fFinMasmGo/htt0S
	 FNP1s3y3lRGu6rG2krldFh6PNWoHQMCbeFcHxDUUl9SMtrKVkLcZziyXSthqOSwawi
	 mWlKW72HAqZioIonpExemwMKEzbrm71Ilzt1DUuet4zcyfUVx/6b9v2o58rLLzj7zO
	 fMq/i1quOb+wW8sxf1oyO1kz8nbYC93NTXQ8akNVf3b2Yg/cpz1iLDVTnPZEkATDEY
	 NbZaC7IPHlN3rPs57DWIm0YisYu7XeE9IR9mHnygVMNyR3EQg0xQwWhOjBGWgG8AuA
	 92jB+BOVLrCSA==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, a39.skl@gmail.com, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org, 
 vkoul@kernel.org, klimov.linux@gmail.com
In-Reply-To: <20240925043823.520218-1-alexey.klimov@linaro.org>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
Subject: Re: (subset) [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix
 RXn(rx,n) macro for DSM_CTL and SEC7 regs
Message-Id: <172727699157.2075752.5178047483756857834.b4-ty@kernel.org>
Date: Wed, 25 Sep 2024 17:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 25 Sep 2024 05:38:22 +0100, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory.
> So far the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: codecs: lpass-rx-macro: add missing CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
      commit: e249786b2188107a7c50e7174d35f955a60988a1

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



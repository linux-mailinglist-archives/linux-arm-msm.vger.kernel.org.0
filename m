Return-Path: <linux-arm-msm+bounces-59578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CFCAC57D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9751890252
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6815327FD49;
	Tue, 27 May 2025 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKUZUmHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6D1A3159;
	Tue, 27 May 2025 17:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367465; cv=none; b=Y91+1cMcf98dtvwimxM1C8XOiNoWsrD632MX7xWC8C2Cj2n6sNOyXE94SuU4nundNSx6SD3KDyFptBqCa8EH0U56K7VCFKyE0yu2U6MsCh9mUYltu+QkxmzvgdZjEAH0kDughlQTZzs8IL2uZLOss+0q+kE0tWM22N++pSmVDys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367465; c=relaxed/simple;
	bh=oFMSlH2PFmkCusbkqieGsqktuo1FhaqErSIsbBtSOLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ch31IbeaQoYA88YFoJZ2FkpiszLlSDez1BOql1fC0uxZ5h4M03osuDj7ZVmW+Xldtu0eFVy+42+RInnAcBga4BUshdn7CKLcnTnvIJL+nl1oPCFm6EAZ4CKjQgyK/Je4Ab4aKck3wPwkKfz07TOFYU8FY3f/fm8wKEkd267+S9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKUZUmHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F7DC4CEED;
	Tue, 27 May 2025 17:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748367464;
	bh=oFMSlH2PFmkCusbkqieGsqktuo1FhaqErSIsbBtSOLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jKUZUmHwQ1N6veEbDXf8tb70g5DO8THwojuX83ZSEuyEKUlq1um4EPkIIx1wMPQs/
	 NUijS0LbMTQOEv0qNthfrpA8Kl85SxVgG9JJdnJs4RlW/30RyoZOPSvH4YgxL3kmcD
	 Ey/5DFVRZzSvIm+ZVVw90+8p0/jEia2GfTCNSJ9CgojpCbOC/q7VMuNARYvx0+NPuS
	 rb1d0X996eVEijBDh8VORTeVcbTO6fD/IxZT6nHKiQYmpgnc/ZMpEEJLUw4O8hUr6D
	 /zF6SHbRxSJBaAplAfHbuOZKFL4j6ThEKxKh6+cWOYSJKet2s3mAQOt93Qn3TnV89g
	 8L8kCv3P4PUGQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
References: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: wcd93xx: Few regulator supplies
 fixes
Message-Id: <174836746184.125386.18177744621323108615.b4-ty@kernel.org>
Date: Tue, 27 May 2025 18:37:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 26 May 2025 11:47:00 +0200, Krzysztof Kozlowski wrote:
> Fix cleanup paths in wcd9335 and wcd937x codec drivers.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: wcd9335: Fix missing free of regulator supplies
      commit: 9079db287fc3e38e040b0edeb0a25770bb679c8e
[2/3] ASoC: codecs: wcd937x: Drop unused buck_supply
      commit: dc59189d32fc3dbddcf418fd4b418fb61f24ade6
[3/3] ASoC: codecs: wcd9375: Fix double free of regulator supplies
      commit: 63fe298652d4eda07d738bfcbbc59d1343a675ef

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



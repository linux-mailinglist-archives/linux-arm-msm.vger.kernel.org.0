Return-Path: <linux-arm-msm+bounces-28807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E162954D5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFC1028668E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 15:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091AF1BD4E3;
	Fri, 16 Aug 2024 15:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oodnuVxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D81BC9EA;
	Fri, 16 Aug 2024 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821043; cv=none; b=nWZ6bGTemUdVuUJclszjSbKmIOInBLHJjJS3NQ/8za6vNv09DwQGeAggMyQSuOTqSRfpYxlcJ/c55Gzsta8AnulhnPaugfQdUggm44YKK9em4hhbBUiiGlvTFKppJ3YH+Fb0PklGmDdmrgRQu8kzUl4imARppeS7dbguCt3XhsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821043; c=relaxed/simple;
	bh=/gWJGAAYEWysus8W/MIeKMY6Sfi3VK0jLdw6jlTOx2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GW/42jpV4o0V83iyosQzoI3Saroxifj/Jf/whJXzy3RQ8LAZshX6Ic0TfZwem+TSChKVzEIn69PbJXDQx7ZVSXBUx62Bke9E8QPnjEuX3YxHUhsCUV4Zk1yoh/iAFOIqqH1NhGOusx6bG0mnum6mS0C1hKVh4ii07u8OMGaX1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oodnuVxp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BFEC4AF09;
	Fri, 16 Aug 2024 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723821043;
	bh=/gWJGAAYEWysus8W/MIeKMY6Sfi3VK0jLdw6jlTOx2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oodnuVxpVNOYj+ABas+W/M+19tvVVV+ISJz+iKdFYy9YEApNewhCJ00ZAh/50+lAY
	 tmlAzPJNOXd/hajPrV8kBc5aE7ylNySspFB1d5OYmagTLhQvqcBSREVbW5uDQ0sm3M
	 T+uptJTFkwuZU1aqeVoIu+4VSazi9qIq+SZ3GYgTSUTxiOH8bY3snCfEKEHMIJFkHh
	 3i8mNIQ3Z326OplFFNVWRkFESALBdtGMFKlCoYkLc+0tpdQVoZCCCTc5u63Nj5I4xq
	 MWAzhARvX0JlhmBuK64ydTWVy01WyU6UNLG4i7+IrlKymkyNHNub+uJupS3zgYcV4D
	 iVDcBpYk4tD3A==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org, 
 dmitry.baryshkov@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20240815165320.18836-1-srinivas.kandagatla@linaro.org>
References: <20240815165320.18836-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,lpass-wsa-macro: correct
 clocks on SM8250
Message-Id: <172382104064.70235.8442859739541696689.b4-ty@kernel.org>
Date: Fri, 16 Aug 2024 16:10:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Thu, 15 Aug 2024 17:53:20 +0100, srinivas.kandagatla@linaro.org wrote:
> we seems to have ended up with duplicate clocks for frame-sync on sm8250,
> it has both va and fsgen which are exactly same things. Remove the redundant
> va clock and make it align with other SoCs.
> 
> Codec driver does not even handle va clock, so remove this from the
> bindings and examples to avoid any confusion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,lpass-wsa-macro: correct clocks on SM8250
      commit: d08ea4193a72c5e3090240872ff7ed60a70716e6

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



Return-Path: <linux-arm-msm+bounces-33894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3682998AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 717DB1F211EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BF61F4717;
	Thu, 10 Oct 2024 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBGb+/8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3B71F470D;
	Thu, 10 Oct 2024 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571792; cv=none; b=hze+nwQKFZUmAPFCIF//Nt6GhRiqCXhUcAT2Gn5pAN8jewmzvmnszXFzo89EBUZcdV7nXFjg2Pgxd18k0WcV2iDZC2ZiF775BGsKKfj8scjL9Fcwgbq/C/I/1YAu69DsTb4EMyRq6qB992hhlB5/NBX3bXq1Y071jxmRZHrGn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571792; c=relaxed/simple;
	bh=gEqsursoMXes/uTPnwXCUjTwPXROEmBJpWx6slNqVPo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ptd1KmxbEF2DoKxkxaSZulzzoY8U3BNMjr/EfyiIFQ2OWEkWUFWTyZpBl7mgUQkUNqfXTNtzG/bjhiNjpLzqpnVXgRrYa3OLjvDg8qpu17/02cu38ysKG4eO4C0kdnrURV0bbYD8BVhKSunmIEqu/W0I3AB9mrzZ23uGXtvrP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBGb+/8X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405BCC4CEC5;
	Thu, 10 Oct 2024 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728571792;
	bh=gEqsursoMXes/uTPnwXCUjTwPXROEmBJpWx6slNqVPo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZBGb+/8XTDSAFMXJQKsVhxQxKIb5lH/1WJg0VlEZCL2fjd5GRByvlA2YbdMvdbym3
	 QFkP+IOpgIRSnncGrV5OM57rGa7ks+JJO68QPMLkkotD/+yG7jeaBGZ30k3U1401oO
	 7Ew7nCe7iFQxTLWjnVn4iCIiutpiBPb1GgYRRoyGQv3ilWHA6IH1m8sc335xv4rMfJ
	 c4TFmDj0R1ejorx2vFliitTBjeNWIQpN8oMHgXYl4AgtiRwof5vaIvK5JR0js38i32
	 tV7OxalPp0IBZ9gaNIs7iYZdVLWvu7/xZo5WjGp1aj/ExK5+EjE5xJlUN/lrl3RwwL
	 mcP6nEGSsGluA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241010050451.11913-1-krzysztof.kozlowski@linaro.org>
References: <20241010050451.11913-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sm8250: correct typo in shutdown function
 name
Message-Id: <172857178995.3727572.14267501698995203930.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 15:49:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Thu, 10 Oct 2024 07:04:51 +0200, Krzysztof Kozlowski wrote:
> The function is for sm8250, so fix the odd number in "sm2450" prefix for
> soc ops shutdown callback.  No functional impact.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: correct typo in shutdown function name
      commit: 2aab7d186bf10d1591e7645ca32cddeeb4dcaf20

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



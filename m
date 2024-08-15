Return-Path: <linux-arm-msm+bounces-28640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B32953613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 16:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 305AA1F2168C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 14:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAAC1ABEBA;
	Thu, 15 Aug 2024 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="us/C0sRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2641A4F16;
	Thu, 15 Aug 2024 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723733032; cv=none; b=IwJq7ZKkHrHBL3eDkCcKkX7gilkLTGEGEcwSK0z1clVRMZHkdGUm+xj2ohmPNhIWJaLa6/Xq+WZ6ghIneREu/yeAE3txaRw6B+AAnlmV+KGa8XkNLswfs2mFW6od/10tZIar5cNp0R1Mu9YTuJQkpk3DSCiQIV2N2di52kreXK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723733032; c=relaxed/simple;
	bh=qNXtgRVvIfrKa1tEBu1adkGaXzTG53J14ad/70fCQNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NRDtcUMI4ZD3aDdP9xym4kBORGLNviYrfgwFv/HsY7YSJZS+AWUl9rdrPAG6+qdMz6TtL/wFoR4W0G6976ehJaV9C71FrzJyUYwX6ZoYHjwzBQwn1IWb19SZIqVT7kJpZ3UVnVgvTfmWetFdVgf/dAP60SYIZsGNRdp5+eEDO7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=us/C0sRy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BC3C4AF0D;
	Thu, 15 Aug 2024 14:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723733032;
	bh=qNXtgRVvIfrKa1tEBu1adkGaXzTG53J14ad/70fCQNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=us/C0sRysdNk+b24vnxGtukGbKypNfY/npvz00anvIta46Ldceq00UUporLwhQZJ3
	 zQQbfPmh9fWGZbLsoxb6IY5gTFfoDbjmw22fbpI5aMypYU2BP+pxF6djh1KPQHrEC2
	 yjR2ECz+PGwhvr1EQfyf08KlOo7A88bk5J8YvOj5h+eG82BQb1li6LLJSJreoIkkoF
	 oRpDkGJmRICKv6DQT6q2c4RJTeujv8zlIWnjQqwHFJ2d+WNif11PYWnD1vDtkiNfO1
	 i7ZJoKD1z/cTiORUzuXNPyhm/ME1m0IxIWCqgFdH5ePyostpi+Egi1XeNIfnL0gCBh
	 m17wJLcVtE/dg==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
References: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
Subject: Re: [PATCH 0/7] regulator: Use scoped device node handling to
 simplify error paths
Message-Id: <172373302924.48987.479533999298131046.b4-ty@kernel.org>
Date: Thu, 15 Aug 2024 15:43:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 14 Aug 2024 17:04:04 +0200, Krzysztof Kozlowski wrote:
> Make code a bit smaller/simpler, with less of_node_put() thanks to
> cleanup.h.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/7] regulator: bd718x7: Use scoped device node handling to simplify error paths
      commit: 83c7cdeef5b22a73336eb18a59c7b4d63ec26659
[2/7] regulator: bd96801: Use scoped device node handling to simplify error paths
      commit: f372c262d4cfe31f0b67e8ae1a8ec9bf7c52d57b
[3/7] regulator: max8997: Use scoped device node handling to simplify error paths
      commit: ea13bd391d1b8f62ae2347bde7a174059d7f3f0d
[4/7] regulator: s5m8767: Use scoped device node handling to simplify error paths
      commit: 34a3f95941e0dfee750f2fd28faed4c8cd7ee42c
[5/7] regulator: qcom-rpmh: Simplify with scoped for each OF child loop
      commit: 17636d443fbe376d5192a7ce6a444aa45ce45541
[6/7] regulator: qcom-smd: Simplify with scoped for each OF child loop
      commit: d4cd75b8eff72d65dab63668d5d883d72dda0426
[7/7] regulator: scmi: Simplify with scoped for each OF child loop
      commit: 99cf5db9cdd39136fd5dbd10bda833aa0f870452

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



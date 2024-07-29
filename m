Return-Path: <linux-arm-msm+bounces-27286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E32993FC37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33A0283715
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 17:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFC3187555;
	Mon, 29 Jul 2024 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYS0dRUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B132F16F0C5;
	Mon, 29 Jul 2024 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273448; cv=none; b=ZNcIUc8CWVBgiB+/9nFYHVYX5JVpTqUPnme23uHsVxvM8Tr+cGcLh1kcjRx6ZPNcGSiirrfJLFVbICbjbz6DvBxne8jLG6+8oHUORoVIRTbOyKdkWuItu3/U1sXaibtdjv6K8i1roGMzmnCSLB+3VwgarhpOW7tOvK6Xk/tYTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273448; c=relaxed/simple;
	bh=WEp7MKcDizDCCmWrtrmzawwxKIgA8pq0VK4KYR7wRv8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aldHcXRyEZVrF5rH2O0YqfiL5j3tYu/oe7mmfiOc5erHSNtisvwWxzNd5HD6L6FbbfFMu5z4SmxtXEw1Yz8YBjgmbAEYAL2G9JyY+1wZutGe/dEJKJUimV6zsKPy7WQfLK/f8/pMMZN6Ut97UypZnn6t4f7uIqGHCgle/1fjSZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYS0dRUW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9012DC4AF09;
	Mon, 29 Jul 2024 17:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273448;
	bh=WEp7MKcDizDCCmWrtrmzawwxKIgA8pq0VK4KYR7wRv8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EYS0dRUWWI54YiZjUGYaFWirms4lFG4IfgpKnfBF2LMiggAKMgGD/zVDhcqSo8/+8
	 4Se4G83nFa+yz6UmhKS0kNzh1xhhtxVNNLdRkwy/O4YEHssomQqZ0FlxWyu/sWp/Lj
	 pxBa719WjOCD1iLZHb3nCOSb/tNPx210XsVCpehqoPBfgw60s1Oscfmi7of1u0LBfB
	 ircXZ2C7hryyk4IijVwlXXAVAsXNbZquATXjuJcA9MP7S8eK07lawacEbNZQ3Tmx3q
	 N/fsmqz7oq9o0G1YPfRTAoBgf9F7O2wPE0QaTAiqPXOVEO3ta5eHDAvNwJTEmFmLrk
	 zXQL7ual5KcvQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Adam Skladowski <a39.skl@gmail.com>
In-Reply-To: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
References: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to
 separate binding
Message-Id: <172227344531.109775.3516537789525186479.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Tue, 23 Jul 2024 10:33:00 +0200, Krzysztof Kozlowski wrote:
> The APQ8016 SBC and MSM8916 QDSP6 sound cards are a bit different from
> others: they have additional IO muxing address space and pin control.
> Move them to separate schema, so the original qcom,sm8250.yaml will be
> easier to manage.  New schema is going to grow for other platforms
> having more of IO muxing address spaces.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to separate binding
      commit: 8716bd241fa120aacce5e0136125b7ecc74fe3b2

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



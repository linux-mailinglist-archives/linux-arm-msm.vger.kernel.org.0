Return-Path: <linux-arm-msm+bounces-46983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D36A29B96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 22:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08D993A5337
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 21:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DEB214809;
	Wed,  5 Feb 2025 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLz0aK1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F11DAC81;
	Wed,  5 Feb 2025 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738789498; cv=none; b=OvyCdIY5H19OJ03enFEye41jfiyuvCdQSCVdxlglIpqOdonthCr+C6sgF+CNrYWQRSprXf2oZ/9s6NhPg8MKkddtB/n2xAeeyukYU302IKwInXpOYiicG+rTKJVDoaGVrcfK4yFBmM0z1e6mH9gGhf482XMYbsf9fg+f+AUmyVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738789498; c=relaxed/simple;
	bh=p0zJe7LMu/qtJOYGBzsao5uJz9ilaOR1ZrZhwJzhnwM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lAi5zPP+a4q1Mkxj3OVyWkH0IHM8PJK6AZbEgvBBOri+GJoCvAK7bM+GC66ezomLCIy4aGCgu3UU+Gn8WZlDznfLZ/kGCWZ1HML0PZbVRSD/fJDtZkiiaFUuEoU7Yr8wNLRnvfYoI7VCPwUh8jnbseSYLY5Vs4fUJB/CYiZFI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLz0aK1h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8362C4CED1;
	Wed,  5 Feb 2025 21:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738789498;
	bh=p0zJe7LMu/qtJOYGBzsao5uJz9ilaOR1ZrZhwJzhnwM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=qLz0aK1hXjVCIgNHKZ91otbbll8DqMH91DRBFKgywFJ7dIMz2C/xds2UQgg9l1tks
	 euuMAhDCoowmVMAG2p4/ovM5f4WMiIlmizqseMcvbklVrDg5ldPDfJeV0bvdQg9/J7
	 W/EZzfdwSVjKfjsKDKrLL0CtJtdkWJOC1poyORHFDurK8FEgf/HxPggKveXRK9FjZ/
	 oeng+d58Ziljqf1uxftG3O8OgXReZi6jv+4qk6FuTNqQDVx23AMe5WzKva+3OiGhIP
	 fNSkMIsu9lAngT9nJ44E09IK1zhwROvqkc2ACoB2K5Ge6B2pdBksJ0kp70bydRbD72
	 3ar4WsrVPRTFA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
 agross@kernel.org, dmitry.baryshkov@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Varadarajan Narayanan <quic_varada@quicinc.com>
In-Reply-To: <20250205074657.4142365-1-quic_varada@quicinc.com>
References: <20250205074657.4142365-1-quic_varada@quicinc.com>
Subject: Re: (subset) [PATCH v1 0/2] Fix USB vdd info for IPQ9574
Message-Id: <173878949554.299478.16607544866188543376.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 21:04:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Feb 2025 13:16:55 +0530, Varadarajan Narayanan wrote:
> Use correct regulator for USB phy.
> 
> For some reason, the dt-bindings [1] patch posted and Acked long
> time back seems to have slipped through the cracks and hasn't
> been merged. Including it along with this patch as both are
> related. dt_binding_check & dtbs_check passed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: qcom_smd: Add l2, l5 sub-node to mp5496 regulator
      commit: b0eddc21900fb44f8c5db95710479865e3700fbd

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



Return-Path: <linux-arm-msm+bounces-72115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFA1B443D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 19:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F2F416B858
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 17:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA023093C3;
	Thu,  4 Sep 2025 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPdqa4hp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB7B3090E2;
	Thu,  4 Sep 2025 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005419; cv=none; b=q8cBsRL+5JJszLP2A/43yT5adKOkziA4YIdoFb1AVD9w4eqiIO6RkgrQCYUaLct5uQuJOK05Vmx0xnfdeR+uw93OjECtelYZaxi+NwaYMVRV/UFXrZVoFOL35zijGs1oWyQ4uSh0aK1efS/gi5z9lUIs/qYPW/uUOWfnCH8cEh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005419; c=relaxed/simple;
	bh=h4enIaBWf2+tX5VpkMxuowPlacjc37bSzT6LA+Z6dc0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uCnydai1eLAf29rgnUketPjo1tOaQMdhGWbplePs1E0Cwh3csaSX6lJ8BAnOhsyKhwvBL9j+RK3AYnYcaCddtUf4s9Z0YUGlngBCQ01Y0lVOzQI/NoUs1+OMw8NK2YJ/J3XdQRpjCiAo3wVZMX5/rrGAea2xdHsGSKOBC3lPab0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPdqa4hp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C378DC4CEF6;
	Thu,  4 Sep 2025 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757005418;
	bh=h4enIaBWf2+tX5VpkMxuowPlacjc37bSzT6LA+Z6dc0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CPdqa4hpp/WZLMFww90ZkJ92qlHLhVUK8/Q0aweFu8olhJTz3dbOioiSdHGbk1o4d
	 sn2neJbvEbkXOJYmgy8Vp5W0CmOfDJ5+KHGMbDQoNHoCkAixjaLI3ObpyDBV1VPA2p
	 f8saKAytKc9CjOv52rZn/zn7Qr6QEBy9iA3UujZUZciwTLB3hXSdDyHoU7cYdv+4f+
	 YHGI8GiM5U3P4TA0FfnyBjmKwUuL/VVfuHUuefVHVF8v+X4gaE6VCjvtMHglrFmGIb
	 5FS7MdVCc3BGRM3vbfogEpVFkMRZRLEEzRSw90tGUSNktxXxuGphODgZwllnCk+Igq
	 4Jz/AAjTjp0xg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com, 
 prasad.kumpatla@oss.qualcomm.com
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 0/8] Enable audio on qcs6490-RB3Gen2 and
 qcm6490-idp boards
Message-Id: <175700541553.105370.12358134412351621959.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 18:03:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Wed, 03 Sep 2025 20:43:29 +0530, Mohammad Rafi Shaik wrote:
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
> The updates include adding the necessary audio device tree support and the
> required dependencies.
> 
> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the
> same SoC  platform. Therefore, the audio support changes are included
> in a single patch set for consistency and ease of maintenance.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: dt-bindings: qcom,lpass-va-macro: Update bindings for clocks to support ADSP
      commit: 7748328c2fd82efed24257b2bfd796eb1fa1d09b

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



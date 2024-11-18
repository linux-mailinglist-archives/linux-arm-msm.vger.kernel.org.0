Return-Path: <linux-arm-msm+bounces-38247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33AE9D15A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 17:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C592849F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 16:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA7B1C463F;
	Mon, 18 Nov 2024 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXiboZzB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A961C2DCF;
	Mon, 18 Nov 2024 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731948319; cv=none; b=VyJD7f3Lpnz7nTFinZBe4sPgCHnzTFGyzRnEJ0SpqpQZhS1k2SyJrL/uPjRGJiETxHF0vbk6n88iK/k/26L3sXb2uDYbM55Gcxs6tF8GabF5lHSr6o+C11t78Tf/3/Q94quKGYkp5SKGxpYwRVSmLOTAPZE9gP/buiUhy4L6mqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731948319; c=relaxed/simple;
	bh=4vykr79dw2FmxfHObswN27QCeA73mIXqFkR3mxU+AyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h10gR5LPdzhuw+ZhVZEh/x5QP42GkPiFdj/MsAMxyUOHOBs4dBxZiKt8RYVoyO0Gr6riT/1vYS3vMEtrrrxDqDKxVDPtOQ3asrGAr9rZPkE/7BRgyZqoLjm0lwyBWA87mbkssJKSSOwHzca+fG5NH5yViCfm6PpraVU3VMDXqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXiboZzB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A9FC4CED9;
	Mon, 18 Nov 2024 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731948318;
	bh=4vykr79dw2FmxfHObswN27QCeA73mIXqFkR3mxU+AyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fXiboZzBqxW+qipmAbotXYIxdHIspwjUn3AQtJf+vREs0d8kY3EB9e67XWUr3hj2e
	 w/0/Rvrj89MhkVvvWczlHquHTLKwBO5OIyK5cXFA0I4U9QRLRBejfdZgD+9TgF3Njw
	 /H4N//mMkZubYsBL64/LnxvTo2GiNBpCZjnAIqII/Z5FXYPnQ46rxgFDB+mUYAeZXg
	 WhxmdqZ6YDLDe4sY137EzNWR0x5cUoK46y3gTg2PbULLNT6N7bTuyQAu1NLvQc9EwO
	 xWkIXAHBagpf330ItgkbTGl8BOU4TqV6WjDuqiq3Rivw8SYYHeme7xVgoefHHTcm89
	 uWNql/b8FveGQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241112002645.2803506-1-quic_molvera@quicinc.com>
References: <20241112002645.2803506-1-quic_molvera@quicinc.com>
Subject: Re: [PATCH v2] regulator: qcom-rpmh: Update ranges for FTSMPS525
Message-Id: <173194831703.51309.5093146340854774646.b4-ty@kernel.org>
Date: Mon, 18 Nov 2024 16:45:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 11 Nov 2024 16:26:45 -0800, Melody Olvera wrote:
> All FTSMPS525 regulators support LV and MV ranges; however,
> the boot loader firmware will determine which range to use as
> the device boots.
> 
> Nonetheless, the driver cannot determine which range was selected,
> so hardcoding the ranges as either LV or MV will not cover all cases
> as it's possible for the firmware to select a range not supported by
> the driver's current hardcoded values.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom-rpmh: Update ranges for FTSMPS525
      commit: eeecf953d697cb7f0d916f9908a2b9f451bb2667

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



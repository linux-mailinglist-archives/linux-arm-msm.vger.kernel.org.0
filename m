Return-Path: <linux-arm-msm+bounces-37069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D60869BD293
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 17:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DD691F232C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 16:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3AE1E00BE;
	Tue,  5 Nov 2024 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0ug9P1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230291DF965;
	Tue,  5 Nov 2024 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730824703; cv=none; b=qO2gvuO5WfXI1ql3ja5HJ+LQ0Tg4yoKkRv9/5C202/oUpN+gLukPvKw1M8gbnLjqomohc/XKZAw25uzDIqAOxpCamXN2a019dYknQCl3srEJ/TdPwhV5HSoQoks9kdzivR5OfNGPNHQAOOqmaNQG0CwyE76IHyq3BDOF2xpqsEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730824703; c=relaxed/simple;
	bh=Fma6XFgCqfjYGnYfDtMUvnzfc/WI0JtMlx9ImAuLeyc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AjH2L1xiRfKXgfqvZ5vcZonZC2IqiwLqMel72Tvb4jHE1v3+fbfQad/boC7glXnAy5VPKXUUQN+b6bRy/Ofsu+3wpNmAmLEfhbBCWng2Qubd0GnuuDSLx43ZhUz7zKHvXUebZN4x8PD8LbEu8fa4f+vFuNxG+yhoz5i3iYNm2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0ug9P1x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DF8C4CED3;
	Tue,  5 Nov 2024 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730824702;
	bh=Fma6XFgCqfjYGnYfDtMUvnzfc/WI0JtMlx9ImAuLeyc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=t0ug9P1xSRFfLjOY8qw7KoTG8Fpae8qE/dbeKDyC1DjIKlLX3htFFn3SMh58rk7eG
	 PhGvNEVy0DMnZu6UB7LchNEfudNim7MlKhR4eiUn80BDyimNE1Qz061uHHaT32bU5t
	 caTdOvSuNmkrqtlMUJBenL06t6BrqWL5uH2XqzB+z6rZWmpBzKFJxesshaAqJar9f8
	 S4InGPH3r3c5DsMgchCD/go/h1cTnXMB8rQXKlSWS4Gl2lXaMciVicEuvVci+VknNU
	 YJrdrQpmUY44Susjv6Ovt0QK+U+qPYpZt1NavRmjUAsprQnDiPEwXgMv5H6R5XsrSk
	 2eVp9TMAororw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241023124152.130706-1-krzysztof.kozlowski@linaro.org>
References: <20241023124152.130706-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: x1e80100: Support boards with two speakers
Message-Id: <173082470066.77847.3145634719799599408.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 16:38:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 23 Oct 2024 14:41:52 +0200, Krzysztof Kozlowski wrote:
> Some Qualcomm X1E laptops have only two speakers.  Regardless whether
> this sound card driver is suitable for them (we could re-use one for
> some older SoC), we should set reasonable channel map depending on the
> number of channels, not always 4-speaker setup.
> 
> This change is necessary for bringing audio support on Lenovo Thinkpad
> T14s with Qualcomm X1E78100 and only two speakers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: x1e80100: Support boards with two speakers
      commit: 159098859bf6d46b34a1e1f7d44d28987b875878

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



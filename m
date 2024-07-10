Return-Path: <linux-arm-msm+bounces-25877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF94792D778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 697471F21623
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC8F19306B;
	Wed, 10 Jul 2024 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVQgOzk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9053512F37C;
	Wed, 10 Jul 2024 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720632632; cv=none; b=QNqHc4eLx/34hF0Wou7iuAei9lHIDevWo8b68dFz0hrcSaxf35OQEHWT4pctXeM9vtewajEfiph/XbGOIuyT6aCrMrHaGbfxXiIBbRQHDdiBE8IXdb1004blTRcSEKEmDFbjz7D6rZb/hL+OFnycN5sJM5C7y2mzaMvc+NIhADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720632632; c=relaxed/simple;
	bh=EiksLOAaR1h6v3xrh4/4fRtC36Iw+GB1jm/EDk0JfoA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t8JWicRiM9E0hALURHKGmnn0s/nqOJJRniCtS7Kp+FHpmwzR6DGi36o7koZbcBSO3vGDExcD1Qbr2bU15WbuHeXIAqhzFlizIaB/XBEYbE+qMnhZREyPjGg11aNkvZC+SvqQbqigIyLKxZoTBONo94JPNJ7uXL/jqG1v0T1tl9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVQgOzk9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA00C32781;
	Wed, 10 Jul 2024 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720632632;
	bh=EiksLOAaR1h6v3xrh4/4fRtC36Iw+GB1jm/EDk0JfoA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eVQgOzk9hfJedk1BA8ccP7L4Fram1XErnxU3vSVe+NDJyPRcG7+hXr0trNCw6ireR
	 Xa4eeIS64MlFSXeKANSJ0HORIp+XFgG1dRYW96cRzfkwhtRIXpIGeJJEx5ZmpAVx2W
	 ndSzyS2kF4CWVFfWv4XMU99pofXcehJrNb9q523FQArPhJnKwhkTF10FOHXlYKZnHD
	 PTdHo2xiGUBeCATAoT1FSNiDE9OqjwKep2+1xZDOuPfE3+zVfs8sOEhEO48Kk+KMdl
	 z2TaacVQanJXWaFQED2P31RqCXASZKxcjX10vuI6HoFcaOD+i8BFkXW0II5JdBMO6L
	 6SpmBKXoVceaQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
References: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: aw88395: Simplify with cleanup.h
Message-Id: <172063262990.22653.3673550348945714885.b4-ty@kernel.org>
Date: Wed, 10 Jul 2024 18:30:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 01 Jul 2024 19:19:16 +0200, Krzysztof Kozlowski wrote:
> Allocate memory, which is being freed at end of the scope, with
> scoped/cleanup.h to reduce number of error paths and make code a bit
> simpler.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: aw88395: Simplify with cleanup.h
      commit: d0f4ce8a28dd992579949b8ea2df810c4b5fe9b5
[2/2] ASoC: qcom: topology: Simplify with cleanup.h
      commit: a8915e2fe86c29304a3038f269f4667b371b87d2

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



Return-Path: <linux-arm-msm+bounces-85258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB326CBE2BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 15:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E61E0304307C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1894030F535;
	Mon, 15 Dec 2025 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/B6fuBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF93090C1;
	Mon, 15 Dec 2025 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807128; cv=none; b=cT+JSV6IFXWoDrCXuDxKnexODMPA0PR838zqS57p2rjXQTlU7mtEByHdz0CiAHPirJxj/Q1U/lbmEFbwoyjY4SohUkMTMyC5tr5pfz0XJJ/Sp05xVDn656r1LWii2HbkJLZBonU4K4y+pWESHhrz3TbYkvCu8B0fTE941XHyUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807128; c=relaxed/simple;
	bh=zV42fdFgQvaHn8g9/Yz2XawzLeS/o3lpBivWYvPsjn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k2YwnfHqlIqLPiMvCz895Kk69/91uzydgXK5eOXXR+qihYT2SRPt7rT9VRJcuoWFx0swKM2PIbFQlpzp02ICf5nJJs5YpqQyHq1Peu15OJyaVzE2T3SiHy3RCrQaGWRLqEO1Vdi1Ey5yRzFYkl2x0hRWooVvcXqsaLU0KhikcTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/B6fuBn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BBDC4CEF5;
	Mon, 15 Dec 2025 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807127;
	bh=zV42fdFgQvaHn8g9/Yz2XawzLeS/o3lpBivWYvPsjn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B/B6fuBnWP2Zbi/2Qy3EIh1tMxzLN9Tpzwvpd7yEiif8yUDb59a1K00PeKrmbLG2i
	 0yd2DLEoNiBKhz5nX2QRSpuWc2z2CcUX/WUO8gpcdUxfHiF9dmXwfjU/BG+pDKj0qX
	 2lCc8+o5efpuDA2JYMLxKe1WsBSgXmKaZUhhAYTGoyPAZaXhIsixLAYNUVJcJ2Tmit
	 QaHfRyvQYVJU4v6byPT9bYlytvIAKNnAUsxeKSJb7w+YcAaNLHRIsM9tuWM0rlkzwI
	 3aEhswgXpb6WBUJkCBVmPGyfE4X3ZjKrO98hhE6J3r/sKQzOuJ3meJ9N/PeHry06v4
	 nBOrBxwuTLmLg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, David Heidelberg <david@ixit.cz>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Robert Oscilowski <drgitx@gmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>
References: <20251115-sdm845-quaternary-v3-1-c16bf19128ac@ixit.cz>
Subject: Re: [PATCH v3] ASoC: qcom: sdm845: set quaternary MI2S codec DAI
 to I2S format
Message-Id: <176580712510.161056.2503669103240241615.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:45 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 15 Nov 2025 19:43:58 +0100, David Heidelberg wrote:
> We configure the codec DAI format for primary and secondary but not the
> quaternery MI2S path. Add the missing configuration to enable speaker
> codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to I2S format
      commit: 20c734cb678332883d317b17bf8fe7361648e170

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



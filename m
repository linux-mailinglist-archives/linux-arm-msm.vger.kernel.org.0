Return-Path: <linux-arm-msm+bounces-82646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E752C7344A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 71A614EC85B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F52731BC82;
	Thu, 20 Nov 2025 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPGwDeT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FBA2DAFBA;
	Thu, 20 Nov 2025 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631624; cv=none; b=lIPwKaNzuK+s4PHWsd9AdQhvDXPHPb4t8uaejpqvC8q2+NCSkhCa7Sxc7Q2O/4DQ9G9u2iX8QlUR5lV4cAaKXQTAflm0gaqXRFvuv5lhQmbguF1X4jNr72Drk5xn1I3yiASH0ta6wbHol9cqC6/YW0iBj7q6m3TeGNmwALtHb9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631624; c=relaxed/simple;
	bh=gsT4QJmgCtXw5JM4DbVGKZe1a1hTUftY56uWLobHQog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OkfgD2Pw551gLLQKxAqG6g2mRgOoK6oY/4rSuOu+MA6yWfQbmtFD281YlLaE1kK6EoxKAk3+bAHvq/hhpyK8ZV494q++oihUE5R+BNEUR7kvgbyjPL96d99eyY18B/LyCIVn0J1+Ss+n6Z/GwaD6+a6zuoyDBR7/zvRL7GnR3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPGwDeT3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E95EC19421;
	Thu, 20 Nov 2025 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763631624;
	bh=gsT4QJmgCtXw5JM4DbVGKZe1a1hTUftY56uWLobHQog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qPGwDeT3xk8HCPXODr2J0ZEJT+XiPM5q8OSkFRiCSyQVgIaWtVmIhsdLRTYxpU3vZ
	 RBtADIzaBXd5FeWS7gga0UEBS0SXob6SQK3v9YYdBs7omHC2LBVxouQStClfkurQBD
	 4p2yj00g3wQJ3E79mW0k/6pkPFXg6Jk8/M7/hCW/p602waf5eT7qaG+tWOm836+PfP
	 c6dP+tjseCDH/BTbc2Xe2AqS11tCs4PEagI4kVUE80j/CuFxlxnISBy8F3eB8qHfuz
	 t2wS3Gg7BUaZXQtoKXHU34JciG+IjLKjHwi069DCApY+cQ04q8aAY1Y/BecFdRgCa5
	 /TiHLNsIaqgYw==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-msm@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Subject: Re: (subset) [PATCH 1/9] ASoC: codecs: lpass-wsa-macro: remove
 unnecessary bounds check
Message-Id: <176363162125.559933.14265919473434937730.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 09:40:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Mon, 17 Nov 2025 00:15:13 -0500, Jonathan Marek wrote:
> WSA_MACRO_RX0 is 0 and WSA_MACRO_RX_MIX1 is (WSA_MACRO_RX_MAX-1), which
> means it is not possible for the bounds check to fail.
> 
> Removing the WSA_MACRO_RX_MIX1 limit is needed to add support for other
> ports (RX4, RX5, etc.), in which case the valid range depends on the HW
> version: rely on the driver only setting valid ports in active_ch_mask
> instead (already the case).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: codecs: lpass-wsa-macro: remove unnecessary bounds check
      commit: 38fc5addd2a0e51ba750c1a401efe7e3c84a2916
[2/9] ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence
      commit: 902f497a1ff5d275d2f48c2422d8a9eaa2174dee
[3/9] ASoC: codecs: lpass-wsa-macro: remove mix path event
      commit: c47f28ef62cb03de1e5a97844a90eda0415da233
[4/9] ASoC: codecs: lpass-wsa-macro: fix path clock dependencies
      commit: 3ea1b0dbc684191b2e0b5697356a74571ab28155
[5/9] ASoC: codecs: lpass-wsa-macro: add volume controls for mix path
      commit: da49a21b3fe9fbee7be0418916c43f27ed91ad0a
[6/9] ASoC: codecs: lpass-wsa-macro: remove main path event
      commit: 7ec95f46759ba0843a2695decba3cea028cb84ea
[8/9] ASoC: codecs: lpass-wsa-macro: remove unused WSA_MACRO_RX_MIX enum
      commit: 50c28498e9fd6784dea82378d509572d118111f9
[9/9] ASoC: codecs: lpass-rx-macro: fix mute_stream affecting all paths
      commit: bdf96e9135a0cf53a853a19c30fa11131a744062

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



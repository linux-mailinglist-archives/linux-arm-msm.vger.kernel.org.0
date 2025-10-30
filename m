Return-Path: <linux-arm-msm+bounces-79664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB7C1FB6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8739434E276
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60822354AD4;
	Thu, 30 Oct 2025 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBhzJd1z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CB73385A2;
	Thu, 30 Oct 2025 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822549; cv=none; b=sZb2vikoxOQSpjUjA+JlqMEz2a23BoY6Flnk/geSvz1YjrMMXda/I/Oot1ZgRkWfmBOskOM2dlYNiaPu3x6FonXay617ARMzUn5Zp0OIXDon9U+H+6qiyE4mDSfzrHpUVRuS1kwikFZnUKSCIkpI3srOgvccEg34njF/uqDe3ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822549; c=relaxed/simple;
	bh=5sssoAjoQoDvPEzBSze896Vb6vJStPAy9dsma0PQ1xQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U3cKMxHJ6VrlO5RU8BXboWp90xxciGCnhnG2CiPQcAWuhbG85Y0Rma/LANfEDk/4XZ2RjlRUBAH/WiVcDhlyjs6+QQEGJWT3k1CjsRO/63K7Lt4uolx3irqK0iMXxJji2pWS4y2lFoHMUqXoUjZFE3dUuQkb7nMkkFVmpjVai3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBhzJd1z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234CEC4CEF1;
	Thu, 30 Oct 2025 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761822549;
	bh=5sssoAjoQoDvPEzBSze896Vb6vJStPAy9dsma0PQ1xQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HBhzJd1zVXxiJ2Eg+bj3+rQDkcvLndDcnp94K8MUIA7QgIw0PBEQAbkmbr7RznMjs
	 sPDigNcn9KKP4cW9LEu0v0bdDCAM0rfPBnLImfZWm0+W9o+qO3UcRP5XVuLiLKXNC4
	 Vnoat9aKTsamm4Nhu4M/PyqPsOBJ64ZvO8pZNERJK5vpqg0tWe3NKV9RWa6y9ZGdTE
	 /ZhAyuLgK8Aa6x6YL5s0GfRztcPEDL9AUw3Wv7JQHUSjhGL4BsNAOEUcNBD1lfpla7
	 pKwLECzcx/Nxuq5dnI8vtcWurwdAEwjwOLHsp7TZo6TNRE+kztbRxig945OQRzNr9J
	 7AOVb0jxoG5Qg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, 
 prasad.kumpatla@oss.qualcomm.com
In-Reply-To: <20251029144336.356816-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029144336.356816-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: codecs: va-macro: fix revision checking
Message-Id: <176182254570.10093.9949103757388632951.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 11:09:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 29 Oct 2025 14:43:35 +0000, Srinivas Kandagatla wrote:
> The revision rework patch seems to have reversed the bit positions for
> macro presence in core_id_1 register.
> 
> This broken RB1 and Arduino UnoQ audio.
> Fix these bit positions to correctly reflect the register definition.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: va-macro: fix revision checking
      commit: 20bcda681f8597e86070a4b3b12d1e4f541865d3

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



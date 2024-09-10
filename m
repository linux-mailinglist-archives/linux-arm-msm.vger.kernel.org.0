Return-Path: <linux-arm-msm+bounces-31422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B88973C50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 17:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C8AB1F21E4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 15:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E25C19ABC6;
	Tue, 10 Sep 2024 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGJBkS2p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564106A022;
	Tue, 10 Sep 2024 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982691; cv=none; b=WqcsZJGDEsROZOLI8Fa7iDHzLm9RO1wM2kjOs1S2SdbvS46GB0VYI5AcRXyvzfLZGTlLQFheF09xEWVq86tldbOOhlvQqCABsiTPMuQzkNEveOoRtoQTrnb2I088N+MvGoLfeWufDeNkkc3t/qfKNt2QtwqvuX7GmK+nOMeBByU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982691; c=relaxed/simple;
	bh=4KYQfc/lUaYXWGTKHMBMFjP420wLye9XhA0h6HENhTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GDrVw/MvdzxYBQSfzDLUjiUYP+JLp1usNwUcHTzHC9Sjg10hNu+V2VYJrgK+Q0gZoOWXnyRypiw6nklVDx1YCbnNKIw6cs8OpKPB09G2RtGLjETWf5NphLrjcbBGoiX9ptiVCALTJX0S7B8jnfIBgOFvnDNxBp86N6Lg9+UlRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGJBkS2p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB7EC4CEC3;
	Tue, 10 Sep 2024 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725982691;
	bh=4KYQfc/lUaYXWGTKHMBMFjP420wLye9XhA0h6HENhTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gGJBkS2pS8EpPYfyXb6tUaGNXyRFGHCn/zFczKP7yGdUVvLCNCebDcYrM2uQd2dA3
	 b2FGjWNieFWgvurx0lyxJfKA6CC1aRdqhNrXzSK6X+o60eg/JaoXOBBxF1HmgbJF+j
	 IMWr9FVZ5COX/0116j8Q/uEHq9iROx5QGPw00XA9uV1YAyvWZXiPeN8IhyCqabQ+x1
	 O5+oiSWbX/CofTlkogSu86GYsB22NOPHBVrwj+/AfnnJwUF1vijPxWjjywxoJCxP7V
	 3EWS6o5qZK3D2iWBgsntFUOdTWBMzUdtygs6lMDvm9ZrVDpeLv1o3WT7A4/sMuQBRG
	 9lAXKhcxP7E2w==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: opensource.kernel@vivo.com
In-Reply-To: <20240910064631.3223441-1-yujiaoliang@vivo.com>
References: <20240910064631.3223441-1-yujiaoliang@vivo.com>
Subject: Re: [PATCH v1] regulator: Fix typos in the comment
Message-Id: <172598268926.399549.6801883913988962206.b4-ty@kernel.org>
Date: Tue, 10 Sep 2024 16:38:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 10 Sep 2024 14:46:30 +0800, Yu Jiaoliang wrote:
> Fixed some confusing typographical errors:
> comptabile->compatible,
> asignment->assignment,
> Verison->Version,
> meansurement->measurement,
> offets->offsets.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Fix typos in the comment
      commit: 886fee35251107e169128723215b1f779a668be5

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



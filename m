Return-Path: <linux-arm-msm+bounces-80678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DBCC3DE74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 00:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F49C4E88F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 23:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABC93563C2;
	Thu,  6 Nov 2025 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pI8O7C2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151A354AF5;
	Thu,  6 Nov 2025 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473257; cv=none; b=rh4B2RZq4jHfpRlmpIUVFIT19RK0xd0FxGAPgNDmtmLY6sC/Zin3jL1EplvvsWof3TzkP1bgo/vziGVFl3Txl9RMfwnYidMqOhYi7g6aY2anoupfesV9Ecni8s6ghgc2FFicWb70wGJVxcBl80U0+wxYePnHerRultD9DyzQnds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473257; c=relaxed/simple;
	bh=X1z6SdYKCZF/y28awfiNC4icclaq9yX9B6cDQhBzabU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rT1zSiuDO5VoGNpSZZmNW/IXA7oY0hjPaDYX0fY2tq62djcHMZpUkOrwyRBq4QSCmvMu34uOuA/uLm9D1KxaOSQjtGVWAsesZ2T3HPCFi92WfZrPMG71B7RcEBWkFYwl/MGptXvhGz+ruOYa0BYLuUfFsZK1D735NR027kRDuSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pI8O7C2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D34C4CEF7;
	Thu,  6 Nov 2025 23:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473257;
	bh=X1z6SdYKCZF/y28awfiNC4icclaq9yX9B6cDQhBzabU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pI8O7C2Am9QGJ/xpQj64k3n0W9sceBjRio+gEY0SwRbztPTM2rTn7LZ/2UyzJohEy
	 m4NxvIeGuE/bw32y2tnzVtP4BTEt8OziNlBByUzPNcnh6mf9uJn6JAsdrCVF8PMshM
	 96SJ4LDrICxf/BhypKvPfniSeGUFDS9Sc6SS5ZM96L4GVJU5qEcEfBYxmI8h8eIaR6
	 CkouP9p2cYTv4TwHy9B+7D/2ioA0wrgPURa1tKaznoZODK6n7tMw5fJZ8S9m8jhfIg
	 b5leVM8xN0qPre0p4/TvMGipee/JwcC3ptFiaPE6mlRan93sGJHuH6+2AkUGgKOX3t
	 zNupOz0+eRxow==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251106143114.729-1-vulab@iscas.ac.cn>
References: <20251106143114.729-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: codecs: va-macro: fix resource leak in probe
 error path
Message-Id: <176247325324.2482911.11003795834364507659.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:54:13 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Thu, 06 Nov 2025 22:31:14 +0800, Haotian Zhang wrote:
> In the commit referenced by the Fixes tag, clk_hw_get_clk()
> was added in va_macro_probe() to get the fsgen clock,
> but forgot to add the corresponding clk_put() in va_macro_remove().
> This leads to a clock reference leak when the driver is unloaded.
> 
> Switch to devm_clk_hw_get_clk() to automatically manage the
> clock resource.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: va-macro: fix resource leak in probe error path
      commit: 3dc8c73365d3ca25c99e7e1a0f493039d7291df5

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


